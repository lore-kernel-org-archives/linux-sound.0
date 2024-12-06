Received: from omr008.pc5.atmailcloud.com (omr008.pc5.atmailcloud.com [103.150.252.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6761D20765C
	for <linux-sound@vger.kernel.org>; Fri,  6 Dec 2024 13:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733491007; cv=none; b=fwqJOIJ7tUNqzU8ncMJ39xM4ka+ZbNnowCr3kqOTsyM8tObQpXR1ehrtfCtz4WcQ8xSv0u5WzoVHSEnDEYLuGW/zeOU8iMwdTtQ/KrR40KrOYG88iiek9Flj+ADG3mp2mP09yy+tZN5c6W/GCjtcloMxALwoHzpwj6HZqthO0nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733491007; c=relaxed/simple;
	bh=Mtd/MNGnf5OiPp2L1Icdqrct+/D+/0W5XuHnvOmsBpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WOWZe6A0KoAYnNhG58Od5hLLt56nOljZofmuL9UymC92Be1J6dtbtSXcAJmI/H3NgCj/szXhpvUvuC+L4wqF3sJkF/cCA4GG3t4wJ41//h+Ef9PrEZgkrINSedKlKweU3HmUty9VsTpfPElBsw1lC1SFybvyiymDSPBjmkn+raY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=P0S/EXGI; arc=none smtp.client-ip=103.150.252.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="P0S/EXGI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=Content-Type:From:To:Subject:MIME-Version:Date:
	Message-ID; bh=lNGurj19k5n/YpS2tRk9EcaT5/wSTrzxFPHa6tbogRM=; b=P0S/EXGIgRWDV7
	SB9rfld5lSne6hYM41dJGzt/6qNSk+NTBkwmwlfqcowBnB1Xcx/xws0Vs/SpbeEfILE6qEx4ClTuo
	E4b1J9juHVYcYzBMLHXRkrUX+Ah6kSQidRT9V6Aixpe0wLX5MJQdKOk7eE93aaZRPZDSasDfWInwW
	nAmI/KAMGDI4x5MNBOSDWUYIOd5e3AOi17SUZMJzvMohbpTXVQuTCItu07xWMNyF6qPVhG90ZQZ1+
	vKNU8JxZHvU4/kuVan4Q6QaEy13BXkc9OMsyh+eZiu4x+7kuY7XBvKyS8UVRx3GwsTxK54fKSCeF6
	J8es1CbWzYv8opMblTyg==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-08bfa4c5bdedaf3a1) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tJYCB-000000001S4-3YH1 ;
	Fri, 06 Dec 2024 13:16:35 +0000
Received: from [220.233.184.101] (helo=[192.168.20.106])
	 by CMR-KAKADU03.i-08bfa4c5bdedaf3a1 with esmtpa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tJYCB-000000004Zj-1fX6;
	Fri, 06 Dec 2024 13:16:35 +0000
Message-ID: <c2b9ae73-6a94-4184-9aab-8c95bd242b60@iinet.net.au>
Date: Sat, 7 Dec 2024 00:16:28 +1100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: pcm3168a: Add option to force clock consumer
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-sound@vger.kernel.org
References: <ea504848-eeb1-4e8e-bbf2-394114802c20@iinet.net.au>
 <5011ceef-5100-441d-b169-dabba135d27f@iinet.net.au>
 <cec27c80-ca7d-43a1-90e2-ce014e56e295@sirena.org.uk>
Content-Language: en-US
From: Stephen Gordon <gordoste@iinet.net.au>
In-Reply-To: <cec27c80-ca7d-43a1-90e2-ce014e56e295@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Atmail-Id: gordoste@iinet.net.au
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=AvHo3v9P c=1 sm=1 tr=0 ts=6752f933 a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=x7bEGLp0ZPQA:10 a=VwQbUJbxAAAA:8 a=4jraHwQkAAAA:8 a=NEAV23lmAAAA:8 a=YP79KAbe-ZoriZxZNwIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Cm-Envelope: MS4xfDr1W7v5wjUMNbiQQuSckdwnxPRIiJ+7sggJ9w8dGBYX2Y9B+hr9lP8Pd8E/hwmO5PkWHugTSVqkkA9buvKzuYPS4LqTgp9W/9fmJ0cjzjw5QPqclXTE h2EdRdzk9j/V0Y0R6XmkR3khC6Iqa3gyVP25MFKfGhNUzZsRuj1sjG/heVk8sPW68PHlfLWOVgB7Aw==
X-atmailcloud-route: unknown



On 6/12/2024 11:22 pm, Mark Brown wrote:
> On Fri, Dec 06, 2024 at 10:54:43PM +1100, Stephen Gordon wrote:
>
>> Scenario is that DAC's clock pins are tied to ADC's clock pins, with
>> codec acting as clock producer for the I2S bus, and the CPU has a single
>> pair of I2S clock pins used for both playback and capture.
>>                                   ,-------------------
>> ---------            ------------| LRCK     DAC
>>       LRCK|-------+--/     -------| BCK   (producer)  C
>> CPU      |       |       /       |                   O
>>        BCK|-------|---+--/        | ----------------  D
>> consumer |       \   |           |                   E
>> ---------         ---------------| LRCK     ADC      C
>>                       `-----------| BCK    (consumer)
>>                                   `--------------------
>> Both DAI links will have codec acting as a clock producer, but we need
>>
>> to configure the codec so that only one of ADC/DAC drives the lines.
> This looks like something that should be done in the board
> configuration, not hard coded in the CODEC driver.
>
>> Add DT options to support this configuration. adc-force-cons/dac-force-cons
>>
>> cause the corresponding component to be configured in consumer mode.
> Any DT bindings should documented which should be done in a separate
> patch.

I will most certainly do this in v3 if I convince you that the DT 
bindings should be

added in the first place :)

>
>
>> +       // Force clock consumer mode if needed
>> +       if (pcm3168a->adc_fc && dai->id == PCM3168A_DAI_ADC)
>> +               ms = 0;
>> +       if (pcm3168a->dac_fc && dai->id == PCM3168A_DAI_DAC)
>> +               ms = 0;
> The clock consumer mode should just be configured via the standard
> set_dai_fmt() operation.

I did try to do this using simple_card and I documented my attempt and 
why it seems to

fail in this message:

https://lore.kernel.org/linux-sound/b64a630f-d71f-49ee-a5e7-ea1e3a7f8de5@iinet.net.au/

Basically, simple_card appears to set the CPU as producer if you don't 
specify a

producer. I am not sure whether this is a bug.

Also, there aren't any examples I could find in the documentation of DAI 
links with

clock consumer on both ends, so I was wondering if it is even valid.

There is some SoC code that seems like it might not work properly in 
this scenario:

https://github.com/torvalds/linux/blob/b8f52214c61a5b99a54168145378e91b40d10c90/sound/soc/soc-core.c#L1465


>> +       if (dev->of_node) {
>> +               pcm3168a->adc_fc = of_property_read_bool(dev->of_node,
>> +                               "adc-force-cons");
>> +               pcm3168a->dac_fc = of_property_read_bool(dev->of_node,
>> +                               "dac-force-cons");
>> +       }
> These properties are not documented, and you don't need to query to see
> if there's an OF node to query if a property is present.

