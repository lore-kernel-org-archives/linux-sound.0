Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC2122A4EA
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 12:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226398; cv=none; b=P9TxtFyepLykCEFnBun8ZOT1M4pIpoFNI0C4jGRs9VuVSwvb+ssyBrhxZZMHriJUOPxmhIVX2Lb9mQf39v9Xn38Kad/hkztNS5V5K9zITSqLZ1b1LbdrgF/DMj1GoDVkWUt1vn+lpO5Lwi4Qf0kicYlhvEoJ24v7N9Um5qlwY94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226398; c=relaxed/simple;
	bh=Ews7yCDPeYVIJO8lW4DEMzjKytg2tHul/slxeBy6P6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BrxKvh0SIKPqUzYxyZSLNPxKjX1M+Dhie0Xlnp3NoY2B4ll5/wwOhcwO/z3ILu+6rqhIuKDpk8xqb8ZYO8P5rI7CNT2Q1kEmG9tFJJn/q8gxM7/5b251VgVVhBSNAFS8gXY+GeO/Cwhc1w5O0ml6Ym0Y2S5yDcuSSHIA2q63XvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qzDnN0NJ; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qzDnN0NJ"
Message-ID: <ac889b5b-da61-4b2c-bc4d-2165e65dd170@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747226393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fgr49nAoijEtgAopTrZKonyqXyWrFrJQkVXzYegX1ZE=;
	b=qzDnN0NJ2mpihgMYzwkWfmoDOEdPTWzgPk3qLpCCMAAeKvfln8erphN8W3sEK/qx9qx2WB
	Pmzdxpy5tDW1Ctab1vgKh6fMylRCp89Kwtn1IRLMjfbyzQ/uT+tDG98kDphK49HUyOaR/5
	2yGKYbBjfAMp0Ox2ezpomMEghkxVEnY=
Date: Wed, 14 May 2025 14:19:06 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 5/6] ASoC: SDCA: Create ALSA controls from DisCo
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
 <20250512124240.799509-6-ckeepax@opensource.cirrus.com>
 <cd574985-e434-46d9-91ff-a2782c6e8eef@linux.dev>
 <aCIsWP1Ac8WvX11n@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aCIsWP1Ac8WvX11n@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/12/25 19:14, Charles Keepax wrote:
> On Mon, May 12, 2025 at 03:53:36PM +0200, Pierre-Louis Bossart wrote:
>>
>>> +static bool exported_control(struct sdca_control *control)
>>> +{
>>> +	/* No need to export control for something that only has one value */
>>> +	if (control->has_fixed)
>>> +		return false;
>>
>> why is that? It'd simplify userspace if there was always a way to
>> get a value, even if it's fixed?
> 
> Well mostly it is because various things in the stack get
> sad with a single value control you can't set. If we wanted
> to change that I would suggest we add a FIXME. It isn't really
> critical and I would really like to get more of this class
> driver stuff moving, it has been out for review for a really long
> time now.

Not following what parts of the stack you are referring to. We will have controls which are sometimes non-existent (DC), fixed (ROM) and some RW. Userspace has to be tolerant of those variations, no?

I am fine with the FIXME and I understand the frustration with limited reviews over a long time.


>>> @@ -99,6 +113,7 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
>>>  		case SDCA_ENTITY_TYPE_OT:
>>>  			*num_routes += !!entity->iot.clock;
>>>  			*num_routes += !!entity->iot.is_dataport;
>>> +			*num_controls += !entity->iot.is_dataport;
>>
>> shouldn't the same line be added for TYPE_IT?
> 
> This is just the cutting on the patch generation, case
> SDCA_ENTITY_TYPE_IT: is the line right above so this runs for
> both.

ok.
