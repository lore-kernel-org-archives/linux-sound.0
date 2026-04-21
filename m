Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8303734E746
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 16:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788564; cv=none; b=KGNjAkMRYgsAwi6zfAnBzf6trfpVdPWTIapL3qIvEtqlVpPf4neIHa/xxqKcKQ0mjkE9Q787sZcLQC/+JqCO2BVvXwphXzhGYE5v4LIfLS7EhpXNg1hVnmNkmMLFsnBWjDGP8QhE+FQz3o8j76dq+ByAeFf3OR4Cwb98c8aBDCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788564; c=relaxed/simple;
	bh=tI1DYfDx7liMrBxSaYRmCisAF6I1WSLlz58HYxxAmE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dV1jzGXJ6tbsRrnAw1ru1GJqRzItyax8WNYrfXXxWu025Y6GhhGF0zNunh6u4WuZx+eY2tufdt45S+b0wJGltj8pZwYVjiEQSPxlHWVuuILhM2B71pgmPymHAyzaisjSQ4ZSwFegUN+/5Njr8R4o90sBw4RszWaDQch0j05R61E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kT6nn1xV; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kT6nn1xV"
Message-ID: <e13e6934-fb5b-4ea3-8517-85d482ad25da@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776788560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D3FS8I0xx6uE8+8ysOL23AdEZGuoF3aNfWIMx6zrDHo=;
	b=kT6nn1xVRw854pdQrAAa01OQwvGuM0x9MRqkZDvkoJfrXlg+tVwGAVa9fnFKwTdBoSc16o
	HVjPFyvBmRkWTtZd1x1EuO2iDKPJotqrLe70yEq7Xdod8utiUiwD65+RR3iv830cCnBoYf
	7MVQEmE1P9q2FY9CLOPjwe53e7bfsdk=
Date: Tue, 21 Apr 2026 18:21:09 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v10 1/4] ASoC: SDCA: Add PDE state transition helper
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, baojun.xu@ti.com, shenghao-ding@ti.com,
 sandeepk@ti.com, v-hampiholi@ti.com
References: <20260421154804.2670-1-niranjan.hy@ti.com>
 <aeeehYTuNON2cGKJ@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aeeehYTuNON2cGKJ@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/21/26 17:57, Charles Keepax wrote:
> On Tue, Apr 21, 2026 at 09:18:01PM +0530, Niranjan H Y wrote:
>> Per SDCA specification, after writing REQUESTED_PS, drivers must
>> poll ACTUAL_PS until the target power state is reached.
>> Implement sdca_asoc_set_pde_state_sync() helper function for
>> changing the power state of the PDE widget and wait for the power
>> transition to happen or timeout.
>>
>> Changes include:
>> - Add sdca_asoc_set_pde_poll_sync() to handle write
>>   REQUESTED_PS register and poll ACTUAL_PS register until
>>   the target state is reached or timed out.
>> - Export function via sdca_asoc.h for use by SDCA-compliant drivers
>> - Refactor entity_pde_event() in sdca_asoc.c to use the helper
>>
>> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
>> ---
>>  static int entity_parse_pde(struct device *dev,
>> @@ -449,8 +492,8 @@ static int entity_parse_pde(struct device *dev,
>>  	}
>>  
>>  	(*widget)->id = snd_soc_dapm_supply;
>> -	(*widget)->reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, 0);
>> -	(*widget)->mask = GENMASK(control->nbits - 1, 0);
>> +	(*widget)->reg = SND_SOC_NOPM;
>> +	(*widget)->mask = 0;
> 
> Hmm... yeah I am really sorry I totally overlooked this. Yeah we
> should leave the write outside the helper it is much nicer to
> have DAPM do it.

Not following that comment, there are quite a few codecs that trap a DAPM event, do a regmap_write then wait with a loop, see e.g. rt722_sdca_pde47_event

I haven't seen DAPM deal directly with the write?
what am I missing?

