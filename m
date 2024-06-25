Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E681DFC5
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719320433; cv=none; b=JObl2wjuNpWEx51rh2DjbEq2sZChPQ7jrj/RqYFRZARaR459dUo7xyrOn8nxXiMCNgR3S76EXg6iog6f87Z+5kKp/q1E3zu/SAPNqqfzpqoHxBIQef8ePFgeuCd08LEMeDk/BRJZ+W9mJkqt1pOIh6zPwmB+02S85g7UJrzST9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719320433; c=relaxed/simple;
	bh=On5+m6ZGZ7quqct8JibUuLEk2Pch9BbQSbqzoIcS52A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZTd5DZtKBaKyVAuG1n0f4i9hNtS/Cp6dPS+nOOp5IbBGdpjH7rcvKjiNRDM57quaMTk37EWb0KfmKfBteAfYKKFfuJ+NEMWITsb0yYCCymZqJatCkKIdjDl59J0eMPQ7CKqXhkqzcaYwPlpFMHtftDhm56g0vs47nU79WP4jzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=o1Nj9z6X; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="o1Nj9z6X"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3A195682F;
	Tue, 25 Jun 2024 15:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3A195682F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1719320425; bh=G5iyY6lfoCpB2RZK/HQG94wwwHqjEm93fi93OR7RYzE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o1Nj9z6XoYbwYwKMnZVOb7vHdXSAcdbDoB/Hhlpg9Ag7vYfRyos7NoxumaV9Sbuvo
	 FULHreQv9opRSYXJ9CYBtFJewSsAoyv8R9RU/lsoC0lkAHmMhCTM3eulIu3lcFY9f0
	 7u3M/giWjtPUofwejQHk1ZIgmamhZfkZGm8qObg8=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 25 Jun 2024 15:00:17 +0200 (CEST)
Message-ID: <c2bcc49e-722f-43da-a3a1-ddd92210904f@perex.cz>
Date: Tue, 25 Jun 2024 15:00:16 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ALSA: compress_offload: introduce passthrough
 operation mode
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
References: <20240621164915.410946-1-perex@perex.cz>
 <18c2a323-f0b5-4dea-b502-ce7e7021c555@linux.intel.com>
 <51462bc7-d9da-4e2d-9244-a59184c4d8ed@perex.cz>
 <7fb00353-08f2-4fad-b05e-cdf4b6451cbe@linux.intel.com>
 <626a22b6-7de9-45ba-a702-f4539f2a25a7@perex.cz>
 <69951352-c0c4-4984-bbab-acdfc4add146@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <69951352-c0c4-4984-bbab-acdfc4add146@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25. 06. 24 14:36, Pierre-Louis Bossart wrote:
> 
> 
> On 6/25/24 13:48, Jaroslav Kysela wrote:
>> On 25. 06. 24 8:06, Pierre-Louis Bossart wrote:
>>
>>>>> I honestly find the state machine confusing, it looks like in the SETUP
>>>>> stage tasks can be added/removed dynamically, but I am not sure if it's
>>>>> a real use case? Most pipeline management add a bunch of processing,
>>>>> then go in the 'run' mode. Adding/removing stuff on a running pipeline
>>>>> is really painful and not super useful, is it?
>>>>
>>>> This I/O mechanism tries to be "universal". As opposite to the standard
>>>> streaming APIs, those tasks may be individual (without any state
>>>> handling among multiple tasks). In this case, the "stop" in the middle
>>>> makes sense. Also, it may make sense for real-time operation (remove
>>>> altered/old data and feed new).
>>>
>>> I must be missing something on the data flow then. I was assuming that
>>> the data generated in the output buffer of one task was used as the
>>> input buffer of the next task. If that were true, stopping a task in the
>>> middle will essentially starve the tasks downstream, no?
>>>
>>> If the tasks are handled as completely independent entities, what usages
>>> would this design allow for?
>>
>> The usage is for the user space. It allows to accelerate the audio data
>> processing in hardware, but input is from user space and output is
>> exported to user space in this simple API. The purpose of this API is
>> just "chaining" to reduce the user space context switches (latency).
> 
> I am still very confused between the notion of  "chaining" and
> adding/removing tasks dynamically at run-time. The former is fine, the
> latter is very hard to enable in a glitch-free manner, usually all
> filters have an internal history buffer. Inserting, stopping or removing
> a filter is likely to add audible discontinuities.

The internal state requirement for multiple tasks is mostly given by the used 
stream structure, so user space will handle this correctly (restart stream on 
demand). You can imagine situation, where too many data are queued and user 
space will receive a signal to do something different, so it makes sense to 
support dequeuing of tasks. The stream state should be reset when the task is 
stopped (removed from the queue) even if there are other active tasks after 
this stopped one.

I may also propose kernel API extension to inform user space that all active 
tasks must be canceled in one shot (ioctl).

>>> Also I don't fully get the initial/final stages of processing. It seems
>>> that the host needs to feed data to the first task in the chain, then
>>> start it. That's fine for playback, but how would this be used if we
>>> wanted to e.g. enable an ASRC on captured data coming from an audio
>>> interface?
>>
>> There are no stream endpoints in kernel (no playback, no capture). It's
>> just about we have some audio data, do something with them and return
>> them back.
>>
>> For an universal media stream router, another API should be designed. I
>> believe that using dma-buf buffers for I/O is nice and ready to be
>> reused in another API.
> 
> Humm, how would this work with the initial ask to enable the ASRC from
> FSL/NXP? If we leave the ends of the processing chain completely
> undefined, who's going to use this processing chain? Shouldn't there be
> at least one example of how existing userspace (alsa-lib, pipewire,
> wireplumber, etc) might use the API? It's been a while now, but when we
> introduced the compress API there was a companion 'tinycompress' utility
> - largely inspired by 'tinyplay' - to showcase how the API was meant to
> be used.

I replied this in another answer. The expected users are media frameworks like 
gstreamer or ffmpeg (use this directly as a plugin in the processing chain). 
Maybe audio servers can use this hardware acceleration, too.

I would like to define the basic kernel API (ioctls) in the first stage and 
then continue with a test kernel module, user space library (maybe include 
support in tinycompress) and user space test utility.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

