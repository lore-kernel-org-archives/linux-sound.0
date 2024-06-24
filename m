Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB82256E
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 09:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719221444; cv=none; b=LNAPKD5M1LCJYWYcU21jkdsgbG2LajpN3Q4QkKl0EXfvgCUpUOJNIR614f/YdakK9ZCuXgeuiCB1Kw37Bs60mcP7N0Wt74E2t+Lh9GmgelK9UmIM/VC7D3uSxZjZGW9WjGWCXXXnWuxf8Zpe/lk936D0KDjvNdZJubhCo7CAW4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719221444; c=relaxed/simple;
	bh=356pN8UYgA+jviXBXSGAqLiROZYoM4w79PUqpIHg72s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n/bLmtAoJRdXZOadjUDdQHlZBrn7l5O8TH1CPW7ETaaKOp5Ne5DCD9ikhYe9d8ZuPN17kUORFkYp7ARH0zBCpgPVTqrkO4zDIeYVXeERgkHNBI4IWwTOuS+xWTLJbxt7Wd+8xpoas3rJjlmR1emlZaURAFqs6DeZC+5n/T8GRPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hyemOfCt; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hyemOfCt"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O7jeu8027262;
	Mon, 24 Jun 2024 04:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=tgQS5fXe3IkIzHcJwfQArOdu8RXRy2xCt7+xc7UomIM=; b=
	hyemOfCt8PdW8xU631ulQsKeQyxuOgyOTg0ZgHypw2LfAyLe11Ufl4EAmTw/kRv7
	9tPvTPpHKKjX3U1LE1yn7Dyqxkj/t/B+Z4+GkHx51QxiAT5bE2R+y8azIbOUfoND
	DypaQuY2uPJFvhpBM1oN9t/UC6nkAoCS4xgiS7nuqFZMZryrzOpU5oCQGoKNU92i
	z4xFkVYmWulxU0CjY58F/YAUtQ3TSFhu8jJmsCaACga/abJouUvgQDxhEOiyR2aG
	zx4zl51y4ydRGyTiFl96K4L9x/YeoVdCGzrCl4pPuD2jVZERA7gVlcjWvC8n+UjG
	gmCyZXO30mUULpcc+0t1GQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ywu1hsgeg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 04:30:32 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 10:30:31 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 24 Jun 2024 10:30:31 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 37078820244;
	Mon, 24 Jun 2024 09:30:31 +0000 (UTC)
Message-ID: <666f01f5-c7ef-4168-8f10-68ae5d77f1d9@opensource.cirrus.com>
Date: Mon, 24 Jun 2024 10:30:31 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: Use imply for suggesting
 CONFIG_SERIAL_MULTI_INSTANTIATE
To: Takashi Iwai <tiwai@suse.de>
CC: <linux-sound@vger.kernel.org>,
        Simon Trimmer
	<simont@opensource.cirrus.com>
References: <20240621073915.19576-1-tiwai@suse.de>
 <40b32545-ea8c-4120-a024-cb5da63a39ac@opensource.cirrus.com>
 <87a5jezk1w.wl-tiwai@suse.de>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <87a5jezk1w.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lat3VtnjS4dwTAzLtgJ9o5Qz2GTNMA5W
X-Proofpoint-GUID: lat3VtnjS4dwTAzLtgJ9o5Qz2GTNMA5W
X-Proofpoint-Spam-Reason: safe

On 21/06/2024 11:06, Takashi Iwai wrote:
> On Fri, 21 Jun 2024 11:13:46 +0200,
> Richard Fitzgerald wrote:
>>
>> On 21/06/2024 08:39, Takashi Iwai wrote:
>>> The recent fix introduced a reverse selection of
>>> CONFIG_SERIAL_MULTI_INSTANTIATE, but its condition isn't always met.
>>> Use a weak reverse selection to suggest the config for avoiding such
>>> inconsistencies, instead.
>>>
>>> Fixes: 9b1effff19cd ("ALSA: hda: cs35l56: Select SERIAL_MULTI_INSTANTIATE")
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202406210732.ozgk8IMK-lkp@intel.com/
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202406211244.oLhoF3My-lkp@intel.com/
>>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>>> ---
>>>    sound/pci/hda/Kconfig | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
>>> index e59df40a0007..a3cf0725fc43 100644
>>> --- a/sound/pci/hda/Kconfig
>>> +++ b/sound/pci/hda/Kconfig
>>> @@ -162,7 +162,7 @@ config SND_HDA_SCODEC_CS35L56_I2C
>>>    	depends on ACPI || COMPILE_TEST
>>>    	depends on SND_SOC
>>>    	select FW_CS_DSP
>>> -	select SERIAL_MULTI_INSTANTIATE
>>> +	imply SERIAL_MULTI_INSTANTIATE
>>>    	select SND_HDA_GENERIC
>>>    	select SND_SOC_CS35L56_SHARED
>>>    	select SND_HDA_SCODEC_CS35L56
>>> @@ -179,7 +179,7 @@ config SND_HDA_SCODEC_CS35L56_SPI
>>>    	depends on ACPI || COMPILE_TEST
>>>    	depends on SND_SOC
>>>    	select FW_CS_DSP
>>> -	select SERIAL_MULTI_INSTANTIATE
>>> +	imply SERIAL_MULTI_INSTANTIATE
>>>    	select SND_HDA_GENERIC
>>>    	select SND_SOC_CS35L56_SHARED
>>>    	select SND_HDA_SCODEC_CS35L56
>> Sorry about that. Thanks for fixing.
>> Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>>
>> (Though I think this points at a bug in serial-multi-instantiate
>> dependencies. When SPI support was added it was made mandatory
>> to have both I2C AND SPI. But you shouldn't need to build in a
>> subsystem if you don't have any devices of that type.)
> 
> Yeah, the condition there could be relaxed, I suppose.
> 
> But the use of imply isn't bad for a case like this, so let's go
> forward with this fix.
> 
Agreed.

> 
> thanks,
> 
> Takashi

