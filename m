Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34F916B390;
	Tue, 18 Jun 2024 14:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718720595; cv=none; b=t1TvqHIrrZqfNQfrZMiD7OEzoW0gjWzoLQIcmawpwphDYx4yCu9smSJU0rFRMipVamc7gT9/ByqV8J9cw7K0Jjs1ARMyujc5AmXjBIhwDyDr8XzzCOoe0lcb9ec9yWaaz/O3kkZLUoeqh4A2imch9yKB2zbmaUwU6Q8V33hlnPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718720595; c=relaxed/simple;
	bh=PZjsh8bF2QD7NEu1e44LpXuPYLh6snvHu9o3q9dMtyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=foxuRJ3RpC/zJamxidsVb08NcOPIGSP7hrpM7MNC0w0ybPF/8si+WT506MTIV/CHmu0/JiFT5J4HBLXxYCmdvXrJ90HFp/W1c2vBGOmcw6U+wEY38jTLiBqEx3ikIxKSe/9wcOSuME6xm3UAHLxk9oEhxq4r/NqIe/sj+XUllNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AJvezRdp; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AJvezRdp"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I62ObE026682;
	Tue, 18 Jun 2024 09:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=wKsPUSEDMz3xpWtklse9VKqx8SK3cksKkiySX4WQWis=; b=
	AJvezRdp24skFi9rIPitdWOXzZ3Bkevtu5Ju5BeqxUFq9RVJk7+HowRGRG4mxe5m
	G95v2DHAt8Wnbtup8O3JWIW8AkclcArcy1xD7r5U1wLSAJO2mRh/TMOReRPQevQc
	B6KqCjuGrN6qoEqNnNiIvnMJVyk1xKNEgQZjRO4v2QUDocRagw3b8YnG6K2SqwHB
	FfcHBhXSreXPrpGYylljfPQvgoo+kXTQizCBWyRybAd7v0APJ6FhOMxH3EakbKBt
	TwLeVwCEOawN+9PC25vv/uHUQ3M1iin23Y9UUmuUJpROaXu1q+34K614F2lbkH1B
	0FfnfdOhF832IEt0lDhOgA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ys7cju6vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 09:23:09 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 15:23:07 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 18 Jun 2024 15:23:07 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id AE089820248;
	Tue, 18 Jun 2024 14:23:07 +0000 (UTC)
Message-ID: <4e192a95-bb3d-41d4-b83f-176f0f8aba6b@opensource.cirrus.com>
Date: Tue, 18 Jun 2024 15:23:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] ASoC: cs530x: Support for cs530x ADCs
To: Mark Brown <broonie@kernel.org>,
        Paul Handrigan
	<paulha@opensource.cirrus.com>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
References: <20240617190102.1010597-1-paulha@opensource.cirrus.com>
 <20240617190102.1010597-2-paulha@opensource.cirrus.com>
 <96162ff4-8c54-4efa-b06a-dc20e358e712@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <96162ff4-8c54-4efa-b06a-dc20e358e712@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: h8jbjWW0aArPSB4ZbMfCY9zCMk7jWo_1
X-Proofpoint-ORIG-GUID: h8jbjWW0aArPSB4ZbMfCY9zCMk7jWo_1
X-Proofpoint-Spam-Reason: safe

On 18/06/2024 15:18, Mark Brown wrote:
> On Mon, Jun 17, 2024 at 02:01:02PM -0500, Paul Handrigan wrote:
> 
>> +static bool cs530x_volatile_register(struct device *dev, unsigned int reg)
>> +{
>> +	switch (reg) {
>> +	case CS530X_DEVID:
>> +	case CS530X_REVID:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
> 
> Are these really volatile?  I would expect them to have no defaults so
> they must be read from the device, but once read I'd expect we could
> cache the values.
> 
> Otherwise this looks good.

If you mark a register non-volatile but without default, a
regcache_sync() will write it back out to the device. While that
doesn't necessarily do any harm, that depends on what these
registers do on write. Generally it makes me nervous to have
cache syncs writing to registers we don't want to write to.
