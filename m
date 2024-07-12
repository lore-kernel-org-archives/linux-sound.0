Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D2F1741CC
	for <linux-sound@vger.kernel.org>; Fri, 12 Jul 2024 16:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720802768; cv=none; b=RfzG3qV2P8efIHIXTvBJDB6z+rApKWtXug0fWSMXpxB7O3xqdRuYgYVLzMr/aXC5G3Vp/qO7afGH3mTViHuOMjo+T1mgHI8kSHlsS3n7Kug8ZiJ/JIsHpza2TUQCaaqFc+oCge9++tW6DuptB22jbKvu7bN6JrF9oQq09V1nthY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720802768; c=relaxed/simple;
	bh=B7B2Odxjiwd5La+HdHOdsO4SYTr+Dc9qnO3RqB+c5/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAY/O4UKEHQLKtphvHfuzQQCkilr0Hb3ULX0uiRXUQrvwM54As835w7DFheE9/Nn0imEFFs4MHgnXDaigCSuvlOsNCWH6TgSG8cShA2kpXwqJIoqVjBAy0NZgpru33jzDWMyWOdChqT2PEEmuAmQ/YHEMd5MIgH1Dkdnu+f7An8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=1m7HANMX; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="1m7HANMX"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 1EAF23622B;
	Fri, 12 Jul 2024 18:45:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 1EAF23622B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1720802759; bh=mdukoFwOsMPDVs1uKKBEeq4t6mFaX8w2WOFuzrIrYXY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=1m7HANMXB0CY403F7Apo7OhEbD8sME6Lb0AJcTGnWP74HCbygX7otahEY2wScSxNk
	 zyGaIllreWYVA79BA5WSuCTPOdvi/TNhv9+U8HvaXeVf4k89PZqF+JtDfXig5LtI6O
	 3TgAFkzlNdpc3Gfa+5T4ye847fLaLoTfXSN4o/q8=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri, 12 Jul 2024 18:45:51 +0200 (CEST)
Message-ID: <a89f3755-9b21-41b5-9b15-73105d4e6b95@perex.cz>
Date: Fri, 12 Jul 2024 18:45:50 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] ALSA: compress_offload: introduce passthrough
 operation mode
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
 Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20240624135820.516893-1-perex@perex.cz> <ZnmG77hBzedDQcIl@matsya>
 <ae18019b-5e6f-4ca8-8fba-353ed19be46c@perex.cz> <ZoQF2qjLf7_00yA7@matsya>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <ZoQF2qjLf7_00yA7@matsya>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02. 07. 24 15:51, Vinod Koul wrote:
> 
> Hi Jaroslav,
> 
> On 24-06-24, 17:31, Jaroslav Kysela wrote:
>> On 24. 06. 24 16:47, Vinod Koul wrote:
>>> On 24-06-24, 15:58, Jaroslav Kysela wrote:
>>>> There is a requirement to expose the audio hardware that accelerates various
>>>> tasks for user space such as sample rate converters, compressed
>>>> stream decoders, etc.
>>>
>>> Can you please tell me more about this requirement. The initial view of
>>> compressed API was data only and use alsa kcontrols to handle the DSP
>>> functions? I would like to understand why we need a new API.
>>
>> There are very long threads for v4l audio support - last v15 thread:
>>
>> https://lore.kernel.org/linux-media/1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com/
> 
> Very long indeed but very interesting. I think going compressed audio
> way seems reasonable choice to me
> 
>>
>> So the goal is to create something more efficient for the offload work, when
>> the data (decoded/converted) should be returned back to the user space.
> 
> Not rendered? so we are using it as an accelerator...?

Yes, it's just to accelerate decoding/encoding in the user space chain.

>>> What about the user of this API, i would like to see that as well
>>
>> Any audio streaming framework like gstreamer or ffmpeg who can accelerate
>> stream conversions in hardware for capable devices.
> 
> I meant to see driver users along with this patch :-)
> 
> That also reminds me to ask about usermode support for this, are you
> planning to support it in tinycompress?

Yes, I do, but my time is limited in the next weeks, but it's on my to-do list.

>>>> +A new direction SND_COMPRESS_PASSTHROUGH is introduced to identify
>>>> +the passthrough API.
>>>
>>> Is passthrough really a new good new name, this suggests data being
>>> passed thru but that is not the case...
>>
>> It's something like "PASS data THROUGH kernel/driver". So it makes sense. My
>> alternate name may be ACCEL (like acceleration).
> 
> I like that..

To clarify, are you speaking about "passthrough" or "accel" here?

 > Also do we change the device name if the passthru is
> enabled? it should not be called a playback or capture compressed device

I tried to follow playback/capture scheme - O_ACCMODE for open determines the 
direction - in the passthrough mode the matched value is O_RDWR. Also, the 
range for static minor numbers is shared so different device name may be 
problematic.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

