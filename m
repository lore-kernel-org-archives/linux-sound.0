Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A373D47B2
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 14:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691870; cv=none; b=J8CuLI3/O/mG4lNwL+ihLa4TuUcJTvuowDxuKVTUNbAMWnorg+h0S1uN/ifDDC43krXA5diDx+vlKHcI1iMxzyrjJBLrg+reBfHIugWgL34Rk54q66mvxxRgT2SFdHt/7xe4E8i1IxO0gU0HKLmZe7mvmZ2hEaz2Wg1vr1bzxrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691870; c=relaxed/simple;
	bh=uHpZL76WzFAlN9omYfUfgHBK04zz9UiXwnngsyjxnx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLXkV/4/nAA6pgx3kZhayvEI+legQlK/EauyhNjqY864wO0rHz6JhVQLGfFe7dURibjJks2WWOuQO4t9/yX/tLpxC42iOJLUeyVB6aw7BCg+JO2KReyY+jwX0dJX4b8Eybhcs0KxAGSLTiRh2UQ+eILN+ATdkF03abX1lbcwnJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9mxQrwi; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9mxQrwi"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2c570f6f36so436427066b.3
        for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790691865; x=1791296665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fJazDxMkWono34PQyfbuzm+nlBT/z7JfOyFwMEhNk2s=;
        b=a9mxQrwiHo1aKTDzLDFfL7c61Fz0V+o1ijM7J2Wf2b0yAYzbFtGUts/igqJZMPj/Sp
         DpvPD+vHvYRBbwjF6GSYD2htqu4ztracEXYcv9zcIPZ+m0ocRvtbSJ40vhJ9s1wImhhL
         Xoj548dadnJitJy3bcAUMUw3mxZ6pub4Y4as/jAM+fxUn9zh9ntoxyn3prZKCM7WXRev
         1jhS26GJGBsq30Ncip+yu96u1blj9JtLlbCH0cQNSW2GoEY7Or7ktRDxvcMgVpB6n8Gw
         +k9dnSDRVaZ210IXhQW/KFnUydb2Qfzks6KbEcD+1SchukivAFlIQohRGkUWhtrVgDuc
         5v9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691865; x=1791296665;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJazDxMkWono34PQyfbuzm+nlBT/z7JfOyFwMEhNk2s=;
        b=xkG9/hhueU6HtTQk2/LCK1FQBLZLxWC9Yi86sD2j6liv3MRbw/F4l8WNiISniK2jCv
         f4qH1G2TdvXeuvYDA0m7wTGCQRDrry2/X3rJhNodZwx/wnRTm/xuk5fFMbfq7s4zWoTC
         HBmIOPqFcdspt+mYjqY4Pl1lyW8jrr/NI0hz/8YCES4sPGo1Dzhajat3Dy3CK1xB3Y0B
         WqUc/zJRXe13+mUy2hXzgPsFu+gvYlR3Qi7O0awHVO6GGccDYp850CemRwuQ67DwWKyv
         cjeiaVDMKAd8kuvKwi+Yl68NnUncPqvITb5/mhz+RUmQ+AjRzrjzVIrb4b00bFBu87QS
         2CeA==
X-Forwarded-Encrypted: i=1; AKwUvBzIAMmdxp4DZDcUC/NDDoUBj4d8JfBIOXiixYNv64rMMwV8ZaK1qTf1EWQYQVVqtRrYb1uOie5fGsB1FQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lBPPS+t6h/MSa8WIV0v8kTUnq3V276ebfCAsc4qt/o3HGKJ9cQ
	I5vkruzBXqUviMzHp9W1XHxaZ7IMSrIaX6izQEB5md8nytPC2xI/vsc1
X-Gm-Gg: AYBFou39DZDknDsd+ekJdbWoNr78XT3Iz1dTpar5dW+uPU63THPzA2uONHziroLVMdC
	esp43wKwjdI1Z8+49kpWvu71lfuMC5bv+3Giq6Xohba0P1assEJcTU+21zR7qpbZFTEU/h2moXq
	6U3py8kccubgrdsuxmGzDHehz3GsBV211cpEb/tLRPv2eyNOhbuuCWxIsyJlSDglxRmw61aWHKj
	gDNWQOw7skH2Rjah2yWo/0U6H7DVrCha6vUJlFGMl2nqw203oVc4xsZaPr+H7wvRIf6Jx+52ttQ
	6e4KINDaCgsMBX8exSRE9Zta4k06CrJVkbyR4wE9c/Vk9MVhCDI/Cgm+DwUtIqKjCPQAoCvuBiZ
	AZGMggL3MJoBPXjoFim7Xf2vcpiapIC0nQgdH9NJ/QJ7OZ21QQDphuRdSWLJNnj+SotBgZYNvJf
	bfFOiGRxCe05jIJuWVkscc3nnae08e+Dc3KvN7h54JtiX0fNKNNYt2URdUWP68M0xiOdOSk2Lor
	0rFfIZtSywioz5IVsGaAhWbqNouya/CoN6NJZgTIq66HO93gGaIjZU/q34OsRcxPq5GA24dITPz
	1NGgbaNiHMEgeMY2yvdyWOwmXQOSShebardUkvTEYkHvqORi3/1L
X-Received: by 2002:a17:907:e149:b0:c2a:fcb7:62f2 with SMTP id a640c23a62f3a-c2afcb76e12mr569341466b.19.1790691865370;
        Tue, 29 Sep 2026 07:24:25 -0700 (PDT)
Received: from [192.168.0.46] ([63.135.75.98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd3bcacfsm453243466b.74.2026.09.29.07.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 07:24:25 -0700 (PDT)
Message-ID: <0e1a1284-7069-4c46-9f35-57c10c129883@gmail.com>
Date: Tue, 29 Sep 2026 15:24:24 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Audient EVO4 hardware volume control now requires
 quirk
To: Takashi Iwai <tiwai@suse.de>, Faaris Ansari <faarisansari@googlemail.com>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
 regressions@lists.linux.dev, linux-sound@vger.kernel.org,
 =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
References: <CANBVYRCL=8QdLxGg4S6qrahrFtwJxhv-aSGpW7-1S=+iOe4ZGA@mail.gmail.com>
 <2026-09-27-daily-reply-0001-re-audient-evo4-mixer-put-errors@kernel.org>
 <CANBVYRAr_ShKGmrt2NoqsDsDEbTXa5DWJbq2oP6wKLWJQpLRWw@mail.gmail.com>
 <2026-09-28-daily-reply-0001-re-audient-evo4-upstream-decision@kernel.org>
 <ee6e9e8f-e174-4872-baee-114d848e8137@gmail.com>
 <2026-09-28-2-daily-reply-0001-re-audient-evo4-channel-3-set-cur@kernel.org>
 <87tsn838gk.wl-tiwai@suse.de> <87mrt01bdg.wl-tiwai@suse.de>
 <87ecec19pa.wl-tiwai@suse.de>
Content-Language: en-US
From: Faaris Ansari <faaris.ansari@gmail.com>
In-Reply-To: <87ecec19pa.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Takashi and Sasha,


> Faaris, please let us know if this (or previous) one actually works
> for you.  Once after confirmation, I'll submit the proper patch for
> upstream.

I tested your latest patch where you removed the quirk for the iD14 
alone, and instead set it for all Audient devices.

I can confirm that this has indeed fixed the problem, and I can now 
correctly control my hardware volume without problems, thank you!


> ... or if you have a chance to test Christian's patch set and verify
> whether the problem is fixed there, we can avoid other changes:
>    https://lore.kernel.org/20260919151840.24371-1-arc@gmx.li
I tested Christian's patch alone, without any other changes. The problem 
still occurred with those patches.

This was also noted by Christian:

> As a matter of fact, I made a similar
> observation to yours when testing the patch set on the 'sound' kernel tree
> and the (very sporadic) issue did not disappear after applying the
> patches.
And further discussion below:

https://lore.kernel.org/all/CANBVYRAr8iFGFDgdTcDXuQyXt5M4TddZetsG9o1wbFao03R0yw@mail.gmail.com/


However, using both patches together (as well as a small patch for 
alsa-ucm-conf) has made my interface work very well - I'm very happy 
with these changes :)


Thank you for your work, Sasha, Takashi, and Christian,

Faaris


On 29/09/2026 14:14, Takashi Iwai wrote:
> On Tue, 29 Sep 2026 14:38:03 +0200,
> Takashi Iwai wrote:
>> On Tue, 29 Sep 2026 07:58:03 +0200,
>> Takashi Iwai wrote:
>>> On Tue, 29 Sep 2026 00:39:05 +0200,
>>> Sasha Levin wrote:
>>>>> [   80.940668] usb 3-1: cannot set ctl value: req = 0x1, wValue = 0x203,
>>>>> wIndex = 0xa00, type = 4, data = 0x0/0x81
>>>> [...]
>>>>> numid=4,iface=MIXER,name='EVO4  Playback Volume'
>>>>>     ; type=INTEGER,access=rw---R--,values=4,min=0,max=254,step=0
>>>>>     : values=182,182,0,0
>>>> Thanks, that narrows it down.
>>>>
>>>> Every failure is SET_CUR of the Volume control on feature unit 10, channel 3
>>>> (wValue 0x0203, wIndex 0x0a00). That unit is 'EVO4  Playback Volume' and
>>>> advertises read/write volume on all four channels. mixer_ctl_feature_put()
>>>> writes channels 1 and 2, then returns the channel 3 error, so the hardware
>>>> volume changes while userspace is told the write failed and adds software
>>>> attenuation on top. Faaris sees the same on 7.3-rc5, so this is a mainline
>>>> regression from 87a6f2fa6e6c ("ALSA: usb-audio: Propagate write errors in
>>>> generic mixer put callbacks").
>>> Right.  So a simple fix would be to just to set the IGNORE_CTL_ERROR
>>> quirk flag like below.  One of iD14 models has already this flag, so
>>> it might be safer to set to all Audient devices.
>> ... and below is such a version to cover all Audient devices:
>>
>> Faaris, please let us know if this (or previous) one actually works
>> for you.  Once after confirmation, I'll submit the proper patch for
>> upstream.
> ... or if you have a chance to test Christian's patch set and verify
> whether the problem is fixed there, we can avoid other changes:
>    https://lore.kernel.org/20260919151840.24371-1-arc@gmx.li
>
>
> Takashi
