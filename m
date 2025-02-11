Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A38E24FC03
	for <linux-sound@vger.kernel.org>; Tue, 11 Feb 2025 14:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739285442; cv=none; b=u0ZBZvpx7rxFVuk0iZBt8ksbpDfWjmP0wkEjGcPYJ0BPXqtTxDm3C/YfLtQT8n930BJB83qktPIdXXW/tgJFGRp9UFBtXHHnMxHTHOUnJXWO8tBGpkhuwLLi4iz1oSc0jf2YRiBf+9e6pjRlIWi5o1PlFkt0g60770M1nOhMTzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739285442; c=relaxed/simple;
	bh=SYN8hyAw6jQb6OpR/C8T6eh7p7a1Vj4QlW1kSfLiD2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tE4py/s6jeuKqC5LllSKFzLbRyc2YzxXPbzRLBENPeuJirvZ+ZlrFLpeEPgzMf2MQK8+e9Cgwf+Juh0QLnEC4AZ7Drfecj5GuDp7K/lh6C4yvWa1JdOUFSibaYQuuzNxcgfvcds+6P1MnR7em8txBNDd+spGXEcbe5v6iLV3LRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=0CaPs5GD; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="0CaPs5GD"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7BE77683C;
	Tue, 11 Feb 2025 15:50:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7BE77683C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1739285435; bh=HZSGbV7nZoDyLi7sH9Uzgy9OhH9HWSFgP/f0fSomjUI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0CaPs5GDHDTpuOERJ4TqiluzuMi+eo8K1nwHihI6BH6ljCE/IPG31GSuqwp4AMdN6
	 nM4fcNX/D5lVybZ6V4vlP0ik8SevT/cGd3iAbAG/KiEA2y7uLJZYoJWTOAU3JY3cxU
	 eazfoev0I4JiFgkLHqU5lptBd9puUIdZ4ATF0qoU=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 11 Feb 2025 15:50:30 +0100 (CET)
Message-ID: <1fb3d3d9-00f7-4833-afff-7c5c66999752@perex.cz>
Date: Tue, 11 Feb 2025 15:50:29 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Change device numbering
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
References: <20250127144445.2739017-1-amadeuszx.slawinski@linux.intel.com>
 <f8f2b8f9-527e-486d-ae83-34abd13ef968@linux.intel.com>
 <6fcbc9d3-93d4-4485-9f9f-5bef61476ef3@perex.cz>
 <811c03ef-03a2-44a3-969b-5a2d55f2f876@intel.com>
 <2a772972-3011-4083-9d5d-e1bfe297998b@linux.intel.com>
 <50f5fa11-55f2-4928-97a6-b4758e8d9d52@perex.cz>
 <fabca478-69cc-436e-b0c4-2ffec183e66a@linux.intel.com>
 <675dba40-e559-45bf-b9ec-65f4d4c60923@perex.cz>
 <4c46ebfa-2892-462f-9f6f-98bec8620e5a@linux.intel.com>
 <d895d47a-7705-4cc5-aefc-5ea87fb79c84@perex.cz>
 <5ff3e844-884b-4fca-b0fd-17bbe6e43801@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <5ff3e844-884b-4fca-b0fd-17bbe6e43801@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11. 02. 25 14:56, Amadeusz Sławiński wrote:
> On 2/11/2025 2:30 PM, Jaroslav Kysela wrote:
>> On 11. 02. 25 11:53, Amadeusz Sławiński wrote:
>>> On 1/31/2025 5:18 PM, Jaroslav Kysela wrote:
>>>> On 31. 01. 25 13:41, Amadeusz Sławiński wrote:
>>>>
> 
>>>
>>> We had some more discussions, what about something like:
>>>
>>> card X: HDAudio [AVS HD-Audio], device X: HDAudio Analog () []
>>> card X: HDMI [AVS HDMI], device X: HDMI 1 () []
>>> card X: ALC274 [AVS I2S ALC274], device X: Audio () []
>>>
>>> - card: X
>>>      id: HDAudio
>>>      name: AVS HD-Audio
>>>      longname: LENOVO-20KH006LPB-ThinkPadX1Carbon6th
>>>      driver_name: avs_hdaudio
>>>      mixer_name: Realtek ALC285
>>>      components: HDA:10ec0285,17aa225c,00100002
>>>      controls_count: 14
>>>
>>> - card: X
>>>      id: HDMI
>>>      name: AVS HDMI
>>>      longname: LENOVO-20KH006LPB-ThinkPadX1Carbon6th
>>>      driver_name: avs_hdaudio
>>>      mixer_name: Intel Kabylake HDMI
>>>      components: HDA:8086280b,80860101,00100000
>>>      controls_count: 21
>>>
>>> - card: X
>>>      id: ALC274
>>>      name: AVS I2S ALC274
>>>      longname:
>>> IntelCorporation-CannonLakeClientPlatform-0.1-CannonLakeYLPDDR4RVP
>>>      driver_name: avs_rt274
>>>      mixer_name:
>>>      components:
>>>      controls_count: 17
>>>
>>> it feels like it is more descriptive.
>>
>> It looks much better for driver name and card (short) name. It also
>> shows, how the DMI auto-generated long names are really broken and
>> confusing for users.
>>
> 
> Well, those can be set to something better, it's just that ASoC defaults
> to DMI if there is no longname provided. So if you have any suggestions,
> we can do it while also changing card names.
> But do note that it allows for differentiating between different
> machines using same card in case we need to do something custom for UCM
> on one of them:
> 2680
> access("/usr/share/alsa/ucm2/conf.d/avs_hdaudio/LENOVO-20KH006LPB-ThinkPadX1Carbon6th.conf",
> R_OK) = -1 ENOENT (No such file or directory)
> 2680  access("/usr/share/alsa/ucm2/conf.d/avs_hdaudio/avs_hdaudio.conf",
> R_OK) = -1 ENOENT (No such file or directory)
> so while not pretty I'm not sure if we can do any better, without
> breaking above possibility. And in most cases UCM based on driver name
> should be enough, which looks pretty enough.

UCM can do DMI matching itself now like (copied from acp5x.conf):

....
If.jupiter {
	Condition {
		Type String
		String1 "Jupiter"
		String2 "${sys:devices/virtual/dmi/id/product_name}"
	}
	True {
                 ...
....

The long name path lookup is a relict from the past. ASoC core just duplicates 
information which can be already obtained in the user space. I'm going to 
rewrite the machine specific links and use the UCM like matching here. With 
this, we can turn long name lookups in /usr/share/alsa/ucm2/ucm.conf off.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
