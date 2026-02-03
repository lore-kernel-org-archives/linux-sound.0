Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F2B38F94C
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 18:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770142026; cv=none; b=QA54JFcQAGTnxjRssGx81b1Sk2AVwabxbulxYn0kGo+/dOJn8+nIgDX1M7plz5Gqr33uOFp21Bk/90RabnSNlRs0SG5eP0FyG/osLQs1n2aQ4DlmMWOpRqMju4yGAYkKVMiDX4XFlQqzLMtUV2VNpKdhmOlfpzFo/VXDRvK0AEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770142026; c=relaxed/simple;
	bh=9o6RUY/rQVWOkFI0DrK/R2GW1/82MLpV7pRG9jWti3I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EiBzOgz8yM2ZDTG5wjnlnRCdft8mx/jnZttFWMVVl+zPkHkXPcminDOK/EdB0FdQjbGRbM6GeDePnn5ir8X6L4udw6Ccsq1PWmNQ+Xd3ESjbmCMiEPsydydvKPLN07UFWuXjYHYB8zZBME9WJixyst9WLlYG3t3MC31D46ZAFso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVXt6SHX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVXt6SHX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so48041495e9.3
        for <linux-sound@vger.kernel.org>; Tue, 03 Feb 2026 10:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770142023; x=1770746823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CDxqLPmqYLe0uNBiMr+/BJ7u7UlGF7uMvHQ2d80Zeug=;
        b=aVXt6SHX6k3VnGk5qvK/faesMvodErQPjWDHpCjB05wvmBmhULU1VLrriGIoHXY/69
         SaYrIWuZrYXMJ+ZYnirhxVs6lwl63YMwTrHs8yDID3hCHeLXyTPgf9X9MwWEpPhPh9fo
         KdovOju+osMmYNbkpIokE9wOddTBkuJmp3W4kYdWmYSVVO4Xcy60zBHlLTVfgxCdLE3o
         IYgTwmDMmSPIJ8BrOS2e+5sQ1B9CI6rO9JcsQDGguqWI3bTIRu/UvRoaSBVb0xhkwqqL
         RczXn+nku8ENpKfAvLA15J1xvSd75yXCtigR3pZuFhCBedtZPRscBnQjotdAO9bSr6Nr
         wNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770142023; x=1770746823;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CDxqLPmqYLe0uNBiMr+/BJ7u7UlGF7uMvHQ2d80Zeug=;
        b=Us9+lswGgKvfOWEikzn5T+XjUeH+V3dnTTNVoaK68hpWDyI/8OgqqUnMeROBCeMgC+
         0eiukQTDWyzZw6R2cbN8+BBYKEO82173644Z9lqPGrFSRpapVuPqIegzUgZv/u/3MJjl
         r9ZXiNw6E8txCfG0l03ukatc+VHlIMOS2C2a8/vrHB4kwdsKRZub5Q5aZz9JlX6KODE3
         p88LiAN99UkUqa1HWYZlPx48tkje1vEoSRHdqyTdBIfZZg15WUm4js6ieaoQM9zCvpBm
         V+S86pD7u9VyLMckEVRkJWeN2lvsXE6KpxowTaSs4udmnEKNucsKedIsVHM5y08iCkcB
         BxdA==
X-Gm-Message-State: AOJu0Yx+ZhGmLerQ/ipMAfwwGPtf0M8RIUDRTo0W9deefiZA/sQh7OG+
	FjVMZ61nAdOxkCAZEWLKZg1JDKN6Q5Hxbfq+vYEvZNGLeJSQMDj+fdti
X-Gm-Gg: AZuq6aKUzJRaAMEYzsVKIj5wXvprMhbDPGZ/3CbBxdYJAd7Y6HJ3kry5QSkP83vWXUN
	hLRAix6ru6Q6Xu5MhbbHGrsj+klsclhtB0zoCSN0aAOSV2RQd+OonkkDrrgtF9Olcx/BS0AXRvl
	2Pk4/3M9Wb5JbCEGfbT4mk76c/sNmJzaikTxS7X/q09FzRxpEFgjOlI0ovcJdSRBxD+GadZbAef
	mlCU6WYBLtUONuLu69vYyGVcJmaBgQLReYgOvcj9lPj/8FJ/D+iIhx60lnkJ7Qhit36EpWPqARa
	gG1F8KGg0g+nGoIr3chEf3H5H3Q1DNZJ+f5Q7zkDbJAwS4b4qjJck69QcSobhlMEJ3PDg8eWj7y
	Vku6AHYEbdrkU3Lc9DEX+sN567VRzs9lweEM6tv769DEuiGHtbXBJQP5IKeUiOUT/oPZS3BLKAi
	Ma5p+K14bag6gOUsCWqaI5Eh8RX2sEC5czNtxh0O0Yyz2hPUgcBg3VDFSiSHYWMgotOwT8H3Hf
X-Received: by 2002:a05:600c:3555:b0:477:9b35:3e49 with SMTP id 5b1f17b1804b1-4830e93e9eamr8428205e9.3.1770142022242;
        Tue, 03 Feb 2026 10:07:02 -0800 (PST)
Received: from [192.168.1.123] (cpc157811-grth13-2-0-cust73.16-4.cable.virginm.net. [86.26.118.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830eb3e2cbsm4867735e9.14.2026.02.03.10.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 10:07:01 -0800 (PST)
Message-ID: <b55cce82-1bdb-4e99-86ba-024f73a0aef6@gmail.com>
Date: Tue, 3 Feb 2026 18:07:00 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: ASoC: soc-pcm2.c ?
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <linux-sound@vger.kernel.org>, Lars-Peter <lars@metafoo.de>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
 <aX4D1VodQ8Ksrad6@sirena.co.uk>
 <87zf5q1gve.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
In-Reply-To: <87zf5q1gve.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/26 06:27, Kuninori Morimoto wrote:
> 
> Hi Mark
> 
>>> (A)	  soc-pcm.c
>>> (B)	+ soc-pcm2.c
>>> 	  ...
>>> 	  audio-graph-card2.c
>>> (C)	+ audio-graph-card3.c
>>
>>> All existing drivers uses existing soc-pcm.c (A). Nothing changed.
>>> And create new soc-pcm2.c (B) and new card driver, for example
>>> audio-graph-card3.c (C).
>>> audio-graph-card3 (C) user only can access to soc-pcm2 (B).
>>
>>> In this case, existing user will get zero damage from new soc-pcm2.c (B).
>>> We can just remove (B) and (C) file in worst case, it is easy to rollback.
>>> But what do you think ?
>>
>> So, as we disucssed in person on the one hand this is obviously not an
>> ideal way of doing things but I think in this case there's so much
>> fragility with the current code that it's difficult to do anything
>> safely which makes this much more viable.  It minimises disruption to
>> users of the existing code so we get much less stress all round,
>> hopefully in the long term people will convert to this code and we can
>> retire the old things.

Morimoto-san, first of all I think its really good you are taking time 
to improve things, however there are still some things we need to watch 
in order to make sure we maintain functionality and align with the audio 
integration ownership differences (i.e. who does what) between Linux and 
Windows on the client when Linux is installed afterwards.

Btw, I'm assuming pcm2 will reuse existing DAI and codec drivers but 
without the DAPM/DPCM flows ? i.e. same codec/dai binaries shipped by 
distros can be used by both pcm and pcm2 ?

> 
> Thanks.
> Yes, (B) should not have any effect to existing (A) envailonment, should
> keep independent from it. If this premise is maintained, we can do anything
> on new soc-pcm2 (B).
> 
>> Well, the big issue is that it's sort of partially using DAPM but DAPM
>> doesn't have full awareness of the system including none of things like
>> SRC.
> 
> So we want to expand it or create new one.
> DAPM is using "string match" method to check path/routing, but I want to
> use pointer style for it.

It should hopefully be easy to convert to an integer/pointer format here 
with some search/replace, however the mux enum controls reuse the 
strings in the kcontrol names IIRC so you may need to keep those.

> 
>> I'm not sure I'd go that far.  The trouble with setting a default path
>> and volume is working out what a suitable setting is for a given piece
>> of hardware - the really common case where this is a problem is that
>> many headphone drivers can also be line outputs but the volume levels
>> needed for the two are vastly different.  That's why we currently just
>> go with hardware defaults for everything, it avoids trying to code in
>> settings for a specific system.  It's clearly not ideally helpful for
>> users but it's a lot easier for them to fix problems with UCM than it is
>> for them to fix problems using the kernel.
>>
>> But that said once the code has a better understanding of how things are
>> wired up prehaps we can have some algorithm that can try to guess a good
>> default, possibly something people enable optionally.
> 
> OK. I think default routing / volume is set by Card instead of CPU/Codec,
> because it depends on Board, not chip.
> 
> I have mentioned that I want to reduce amixer settings, but it doesn't
> mean soc-pcm2 doesn't allow to use it.
> 
> Whether having default volume or not should not mandatory, should be just
> option. We want to have flexible framework, like some board want to use same
> style as before (= setup full routing etc via amixer), and/or some board want
> to have default routing/volumes, etc.

I think hiding any kcontrols or hard coding kcontrols that change audio 
processing or routing will break all client use cases, yes this may be 
nice on IoT where there is no sound server or userspace audio infra and 
very simple audio is needed, but on client we need the soundserver e.g. 
Pipewire, CRAS or audio HAL to configure and control the use case/policy.

Its also far simpler for regular users to work with changes in userspace 
whether that be Pipewire configuration, UCM, Audio HAL config compared 
to making similar audio configuration changes hard coded in the kernel.

The other thing to consider is that the integration model for audio is 
fully done by the OEM when you buy a device with an OS pre-installed 
i.e. if you buy a laptop with Linux or Windows then the OEM will fully 
integrate the audio driver including DSPs, DAIs, DMAs, codecs, amps, 
jacks alongside any userspace configuration like topology and UCM.

When a user buys a laptop with Windows then installs Linux there is no 
integration done by the OEM. The user has to rely on the existing kernel 
audio drivers for DSP, codec, DAIs, DMA, amps, etc to probe() and take a 
reasonable guess at the integration configuration. Sadly, the hardware 
schematics required to perform the full audio integration are not 
public, yes the codec/dsp/dma/dai is known but its not known how they 
are all connected to each other and to board specific amps/jacks, and 
hence the alsamixer and kernel quirks methods are often the simplest way 
to enable such devices instead of a new machine driver to manage the 
kcontrols and config (as I think you may have been proposing?). I 
appreciate this is not perfect, but without HW schematics we are in a 
difficult position to begin with.

> 
> 
>> The graph is generally fixed, where there's anything changing it's
>> usually just something being plugged into a port, but there's systems
>> where the routing can be more dynamic.  For a really simple example a
>> tablet might flip left and right speakers depending on which way up it's
>> being held.  You could do that in software with a DSP but you could also
>> do it through routing in the hardware (and depending on how the DSP
>> looks it might look more like hardware to the host computer...).  You
>> also get things like routing around some effects blocks depending on use
>> case, just turning the effect on or off might mean the effect is still
>> causing latency so instead it's disabled by not routing the audio to the
>> IP at all.
>>
>> My impression is that the systems that need to do dynamic routing beyond
>> just turning on and off some paths are getting less common but they do
>> still exist, and older hardware tends to stick around for a long time at
>> lower price points (eg, you'll see what was once a cutting edge CODEC on
>> a board with a low end SoC because these days the packaging it uses is
>> much more easy to assemble).
> 
> Ah, OK
> It should allow that graph itself can be updated runtime.
> And, I think amixer still can work for dynamic routing ?
> These can be good example for test case, I think.

Fwiw, we have a dynamic graph (at probe time) today and Peter is looking 
into support for dynamic graph at runtime e.g. where Pipewire could 
build a graph like PCM -> Volume -> DRC -> Speaker

> 
>> I think that's a good place to start TBH - it's pretty much what we have
>> for DAPM with the DAPM lock.  We can always go back and rework things to
>> make the locking finer grained but hopefully that's not needed, we just
>> don't need to do things that take the lock for long enough or often
>> enough that people get worried about contention.
> 
> Thanks.
> Let's start with big lock, first.
> 
>> Yes, being able to work on this without needing some specific hardware
>> would be great - it's one of the big drawbacks with DPCM and one of the
>> things that make it fragile.  If we can get a good development and
>> testing setup that allows people to do work without needing to worry so
>> much about what other hardware will be impacted that would be a massive
>> win.
> 
> Nice to know
> 
>>> I have indicated many random topics, but these are just my idea.
>>> My motivation is I want to cleanup ASoC framework, but can't on soc-pcm,
>>> especially around DPCM. There is no guarantee I can create soc-pcm2, but
>>> have interesting. But what do you think ?
>>
>> I'm super greatful that you want to spend time tackling these things,
>> I think this is heading in roughly the right direction.
> 
> I'm busy for a while, but want to do this this year.
> I can enjoy this :)
> 
> I think the initial design is very important for soc-pcm2.
> So I will not care about detail things first (= sampling rate, channels,
> etc,...), but focus about graph / routing thinks. I think this is the
> main part for it.
> 
> Thank you for your help !!

One other thing I would say is that the audio hardware landscape is 
changing for client devices in that they are transitioning to Soundwire 
SDCA compliance over the next few years. This will probably impact IoT 
too as codec prices become lower over time, so I would recommend more 
focus on soundwire integration than say legacy HDA in pcm2 as this would 
probably help more in the long term.

Thanks

Liam
