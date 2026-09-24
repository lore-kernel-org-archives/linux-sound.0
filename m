Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F38042CB1E
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 20:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282950; cv=none; b=FuQfEI99Ve7VeSRPykQUfksx2r0HnuEDnohGPiSSICasEpt68iVUMEiF47LRLXnkhzeapPebU9RAXhKqMqBTsGP1H1wtHCeBh2M3ExWGoFRnwymQrM6ecuvY4+xUsNAducnRXylslqtOBX2fqdxnmDeusrNVFXNQtcP1NFHTQkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282950; c=relaxed/simple;
	bh=6J4sjcwDnE7srXP9gcp/dsM5+BA1Z6oD5HGw7MMQOJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iZtljWOHwCKjRCqziXpvWKpt6DvJq4dSuynBEjdZGCniW+dk7OfBOIFYGzdmFFKgOYBwKboKLOxNYroG9jT8ETmU9uZst34ssWHNA5MHXD4fnWxqxzbtRLWRhtN44NMWDl7RaJuFVGQ1cGnDVkyhwYEMK8DMXIMBZ44tdxmb7xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcnH6hX1; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcnH6hX1"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so1523875e9.2
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 13:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790282946; x=1790887746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vd+LufZ6D35YzF/7JTG7cG6anNrrQziwRIRL9W+S1R0=;
        b=JcnH6hX1uRNAudYyuhQZf66YGI4MWgxq62wj/9c6gyj0M0gkkxNsKBwbZNp4fWlSmZ
         zeRBQIILOiJNGd5/Q89Cz+bOjD4+yoDOQ1wxJdmywNGsatHhq8cB+Z7iq4kikqF51+wD
         bhw8kotL1q5ayA+VLfFG3wRcMBeZ+LaTiXqELf3QWPHmB8fxAX2BPGZxtiYFuatueiIG
         mhDLGZYHDHbks+AnohcIosgfLi0Pz+zmdJVLM8TNi1Us1OaMi79AuH9XsxmPMkXC80y/
         /aT2dKEQdHx9EFt4my1SRdac9MA+RClXmBSDYQJ/HnzdQ76tKUJS6jvBUq2Sm1mZlpfz
         xeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790282946; x=1790887746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vd+LufZ6D35YzF/7JTG7cG6anNrrQziwRIRL9W+S1R0=;
        b=aBe7JWSPXWR4IrmEawJm2Ka2a5TACjkPN0wzAz4+W2QITnNOKLyt+qWFvljx83BH2/
         h3UWA3xH5kjduPHYJBq4HH//GvXEzVvaLk4+my3IFSMV6iqO+U1VIGPuQRekW5mR1WOS
         y87Q28b3aDSFXoIHDfYZIPXIWmPZUVW3cS9URo3H+zXDy5TxLtu0RT/wdoPB8fKdJDUg
         PNtmxGSocj8//sHalUiz0xCJ/ifO5awu9iQ8T782aN2+yvZZcQkKswkxt+ovV6itIPEt
         EgZ+8hc6pSHBwcsIqMRC588a+85CBBo5Wex52hSk7EaahBvnloK+8WiNqjarJT9LJYSf
         P2JQ==
X-Forwarded-Encrypted: i=1; AKwUvBzboJ7zLhq04V1NXRS6B47lA4njAOL19jzbr5b6ENrnsf1NU93p1lFtpSOd0fbCablXRXpQK7+l1n/43w==@vger.kernel.org
X-Gm-Message-State: AFuF++ln67gGUJeuIFn+7TKmrR9rRtlL56XtmFoitPCMLfDJ8bnxVnyH
	uSt+lPvGJwK/bks64kpXgrSc2GZabTCEItqOhXx7BRB4gseanW45XPBGDXqiSIjktK4=
X-Gm-Gg: AYBFou2QJYSMI1+yAtpDXn1LuTAsmZ9d6hsTVJsececOgotPuDmP5E1ZwbLYWDB22uS
	zCf5fLo1fxmyzeafi3hfDl4maX0ThZJT/5J1ZMxGClYYfo9raqLEUBuaqUks724re4tFQCLIEqs
	OKSXkdmk17x3JJMpE/wuvfvs12Z6R9LnMjIDaDOV0MmArbg2uA2/rPDt8q21/heryFX8PmigTQV
	h2xaP3pRDiaq8wrlTcIKc53pqRlGwjDyVtrMQXqQb2nj/Hv3UxtfH7Mb7KuQARz6ExDdfIrNTAw
	F54yYUalyunrSOTFKSOvR8LQ4/0ImVxYOfA3cBgfjsqYtzXAvGmcPeKAp22BkjleBy0RLrALbAr
	+O2xhLGD3QyH7D83+8vQhONkzEva4aRxIWQCZeHyl2zpZSu9wHr3K3Wt30xkrelI0gSYbbQ724n
	ZqpuQWFEYnYLgQ7DjTL5qi05lAuFkp9WwoIWWPDCmCCS9rFKaz2g5D47Vf7jOMFayDVE+1IWnWG
	tqd
X-Received: by 2002:a05:600c:4688:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49fe66c61fcmr67953755e9.13.1790282946373;
        Thu, 24 Sep 2026 13:49:06 -0700 (PDT)
Received: from [192.168.0.46] ([63.135.75.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee6cc7afsm6246445e9.2.2026.09.24.13.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 13:49:06 -0700 (PDT)
Message-ID: <2ccbf3cd-e6cd-4f46-97cb-a288a2d16905@gmail.com>
Date: Thu, 24 Sep 2026 21:49:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ALSA: usb-audio: Logitech PRO X Wireless 046d:0aba
 playback volume rejected as sticky
To: Rong Zhang <i@rong.moe>, "Alexander N." <adventureFAN@gmx.de>,
 linux-sound@vger.kernel.org
Cc: regressions@lists.linux.dev, tiwai@suse.de, perex@perex.cz
References: <6262cbbd-d1f2-4c9d-a1c7-9c5d12636f4b@gmx.de>
 <c61e9568284fd0cd1580eb2b568700074c73e123.camel@rong.moe>
Content-Language: en-US
From: Faaris Ansari <faaris.ansari@gmail.com>
In-Reply-To: <c61e9568284fd0cd1580eb2b568700074c73e123.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi there,

It seems I'm experiencing this same bug with my Audient EVO4 interface.

The volume when controlling it via the hardware knob is as normal, but 
trying to modify the hardware volume through software like pwvucontrol 
or wpctl causes the volume to decrease drastically.

I originally reported that here as I thought it was a wireplumber issue, 
it appears instead to be a kernel regression between 7.1.13 and 7.2.4 
somewhere.

https://gitlab.freedesktop.org/pipewire/wireplumber/-/work_items/1022

On 14/08/2026 14:17, Rong Zhang wrote:
> Hi Alexander,
>
> Thanks for the report.
>
> On Fri, 2026-08-14 at 12:41 +0200, Alexander N. wrote:
>> Hello,
>>
>> I found a regression in snd-usb-audio affecting the Logitech PRO X
>> Wireless Gaming Headset (USB ID 046d:0aba).
>>
>> The device has a valid UAC1 playback volume control, but the sticky mixer
>> detection introduced by commit 86aa1ea1f15c ("ALSA: usb-audio: Do not
>> expose sticky mixers") rejects it.
>>
>> Hardware
>> ========
>>
>>     Logitech PRO X Wireless Gaming Headset
>>     USB ID: 046d:0aba
>>
>> Observed kernel
>> ===============
>>
>>     7.1.5-ogc5.1.fc44.x86_64
>>     Bazzite/Fedora 44 OGC kernel
>>
>> The OGC patch for this kernel does not modify sound/usb, and the relevant
>> mixer.c code matches upstream Linux 7.1.5.
>>
>> I have not hardware-tested current mainline 7.2-rc7, but current upstream
>> mixer.c still contains the same immediate SET_CUR -> GET_CUR sticky mixer
>> test and I could not find a device quirk for 046d:0aba.
>>
>> Symptom
>> =======
>>
>> Without a workaround, ALSA only exposes:
>>
>>     Simple mixer control 'PCM',0
>>       Capabilities: pswitch pswitch-joined
>>
>> There is no PCM Playback Volume control.
>>
>> The kernel logs:
>>
>>     usb 1-10: 2:0: sticky mixer values (-16384/0/256 => -3840), disabling
>>
>> I have also observed the same message ending in "=> 0", depending on the
>> hardware volume at probe time.
>>
>> Because the playback volume control is removed, the physical volume wheel
>> changes the headset's hardware volume independently of the PipeWire/KDE
>> system volume.
>>
>> USB Audio control behavior
>> ==========================
>>
>> The device is UAC1.
>>
>> Feature Unit 2 exposes a master playback volume control.
>>
>> Direct control requests, after temporarily unbinding AudioControl
>> interface 0 from snd-usb-audio, report:
>>
>>     GET_MIN = -16384  (-64.00 dB)
>>     GET_MAX =      0  (  0.00 dB)
>>     GET_RES =    256  (  1.00 dB)
>>
>> GET_CUR and SET_CUR both work, but the device has two quirks relevant to
>> the new sticky detection.
>>
>> 1. GET_CUR reflects normal SET_CUR changes with a delay of roughly 50 ms.
> Interesting.
>
>> Measured from 0 dB:
>>
>>     target     result   first visible GET_CUR change
>>
>>      -1 dB     OK       81.3 ms
>>      -2 dB     OK       51.9 ms
>>      -4 dB     OK       47.3 ms
>>      -8 dB     OK       47.1 ms
>>     -16 dB     OK       51.7 ms
>>     -32 dB     OK       47.2 ms
>>
>> 2. The advertised minimum value -64 dB is not functional.
>>
>> A direct SET_CUR to -64 dB returns success, but GET_CUR remains at 0 dB
>> even after 1000 ms.
>>
>> This appears to cause a false positive in check_sticky_volume_control():
>>
>> - cval->min is -16384 (-64 dB)
>> - cval->max is 0
>> - if the saved value is 0, max is skipped
>> - SET_CUR(min) returns success
>> - an immediate GET_CUR still returns the saved value
>> - the mixer is classified as sticky and is not registered
> Super interesting.
>
> Maybe some previously reported devices were broken because of the same
> reason.
>
> I think, the sticky check could be more precise in this manner:
>
>     res = (cval->max - cval->min) / 16; /* Check approximately 16 values. */
>     if (res < cval->res)
>     	res = cval->res;
>     else
>     	res = roundup(res, cval->res);
>     
>     for (i = cval->min; i+= res; i < cval->max) {
>     	if (i == saved)
>     		continue;
>     	SET_CUR(i);
>     	check = GET_CUR(i);
>     	if (check != saved)
>     		break;	/* Fast path. */
>     	/*
>     	 * Wait for asynchronous mixers. This sleeps for no more than 160ms
>     	 * in total, which should provide some time for the mixer to change
>     	 * its value.
>     	 * Note that there is no need to wait between SET_CUR and GET_CUR,
>     	 * as we don't care whether the GET_CUR value matches the SET_CUR one.
>     	 * What we expect is just a GET_CUR value differing from the saved one.
>     	 * It this manner, most devices should go through the fast path without
>     	 * extra sleep.
>     	 */
>     	msleep(10);
>     }
>     [...]
>
> This should classify your device as non-sticky.
>
> I will find some time to write a patch for that. I would be grateful if
> you can test it then.
>
> Thanks,
> Rong
>
>> mixer_get_cur_broken is not appropriate
>> =======================================
>>
>> I tested the mixer_get_cur_broken quirk.
>>
>> GET_CUR on this device is not broken or constant. It correctly reports
>> host SET_CUR changes after the device delay, and it also reports volume
>> changes caused by the physical headset wheel.
>>
>> Using an internal-only cached value would therefore lose useful hardware
>> state.
>>
>> Local proof-of-concept fix
>> ==========================
>>
>> I built a local snd-usb-audio.ko against the running 7.1.5 kernel.
>>
>> For this specific device, Feature Unit 2, UAC_FU_VOLUME, I:
>>
>> - clamp the unusable minimum from -64 dB to -63 dB
>> - skip the probe-time sticky/resolution checks for this control
>>
>> With that module, ALSA exposes:
>>
>>     Simple mixer control 'PCM',0
>>       Capabilities: pvolume pvolume-joined pswitch pswitch-joined
>>       Playback channels: Mono
>>       Limits: Playback 0 - 63
>>
>> /proc/asound/card*/usbmixer shows:
>>
>>     Unit: 2
>>       Control: name="PCM Playback Volume", index=0
>>       Info: id=2, control=2, cmask=0x0, channels=1, type="S16"
>>       Volume: min=-16128, max=0, dBmin=-6300, dBmax=0
>>
>> Most importantly, no userspace workaround is required once the mixer
>> control is restored.
>>
>> Example before rotating the physical headset wheel:
>>
>>     ALSA:     -27 dB / 57%
>>     PipeWire: 0.35
>>
>> After rotating the headset wheel:
>>
>>     ALSA:     -11 dB / 83%
>>     PipeWire: 0.65
>>
>> KDE system volume follows the physical wheel as expected.
>>
>> I attached the proof-of-concept diff and the measured results. I am happy
>> to test a maintainer-preferred implementation or additional diagnostics.
>>
>> My suspicion is that this device exposes two assumptions in the sticky
>> mixer probe that are not universally safe:
>>
>> 1. GET_CUR is assumed to reflect SET_CUR immediately.
>> 2. advertised min/max values are assumed to be usable test values.
>>
>> Thanks.
>>
>> #regzbot introduced: 86aa1ea1f15ce6b56ac1b4c0d9b88a07a5b9bf03
