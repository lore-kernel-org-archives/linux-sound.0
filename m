Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A895C1922F5;
	Thu,  1 Jan 2026 11:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767268270; cv=none; b=DBrDTZk4T517C7CzkiYCcDDvaQH+QBePAFClcG/FHFPSRVxgsKNDC+Cn9C6bIQeqwRGA0H3oT33ky5XTTEoPPlRO7JOLNwDGnYnJ72cUGucXBZnxtV2Z/UGJk06w+0Z4ngO+L9j7nJrFwRX4Auw8fFbd9Dnic5ZfPmlIeysnohE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767268270; c=relaxed/simple;
	bh=x05sRmOnGJZ2EOPYdeeO5NdmtaEGw+aaT9NLYnoJsX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/nGAyYCLm8sZ0WrxBUOng9BDnsSwhQ9ZPEgIKAEEFmjsgg3vmpiOkJ3OkHncFiUGfqTsotYddlYQ7T6IlrWptG33vjJHYdxZqPpvAyxGKhkx5Xir7AihEoR6Q1g1oYpH3MMTuJF8aV9YlkD+A27a5q+PVWzMDMCvAbCANhbNl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=Znn7DmkT; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="Znn7DmkT"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E84C13D97C;
	Thu,  1 Jan 2026 12:40:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E84C13D97C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1767267659; bh=IjWRkcOqzMWraCtjD4ZY8jdQnZdTBnZxZvorT+n++Zw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Znn7DmkTumLfVRcOjhBTAi7pXg4TUFuhsl4USh3dvHcL97TLekzEvQz1n1e5pa1+h
	 nuCGAPq5PHDza/BontTvkpF0oKcE/c+naqpNlQnAMQsHV3s+zRYMcA1WbQ0Bn3e2dA
	 to1x4oS+g37kHqm4iLu3VUWcqw222moYyyohKSe4=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu,  1 Jan 2026 12:40:49 +0100 (CET)
Message-ID: <d16a9af6-2b35-4588-a08e-83846a5f6242@perex.cz>
Date: Thu, 1 Jan 2026 12:40:48 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: usb-audio: Add Line Out to iterm_names
To: zhangheng <zhangheng@kylinos.cn>, Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, cryolitia.pukngae@linux.dev,
 kuninori.morimoto.gx@renesas.com, lhi0729@kaist.ac.kr, pav@iki.fi,
 rene@exactco.de, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251229093130.3202058-1-zhangheng@kylinos.cn>
 <87ecoay7vt.wl-tiwai@suse.de>
 <5879f82a-d21e-4210-987f-449d2452b5bd@kylinos.cn>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <5879f82a-d21e-4210-987f-449d2452b5bd@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/1/26 02:18, zhangheng wrote:
> Sorry, this is not a new standard. It's just my personal idea. Can we
> promote
> 
> the addition of this, adding this Line Out, so that it can be similar to
> hda,
> 
> simplifying the adaptation task of the core outer layer? The jack events
> 
> are relatively unified. Otherwise, for the current sound card, the
> 
> rear jack event is Speaker, which requires separate adaptation.

Could you show us alsa-info.sh output? It looks that this hardware may require 
a custom UCM configuration.

				Jaroslav

> 在 2025/12/31 23:43, Takashi Iwai 写道:
>> On Mon, 29 Dec 2025 10:31:29 +0100,
>> Zhang Heng wrote:
>>> There are three jack events for a sound card on a desktop computer,
>>> namely Speaker, Headphone, and Desktop Speaker. When both audio
>>> devices are available, users cannot distinguish which audio device
>>> is being used. Can we consider adding Line Out? similar to the HDA
>>> sound card. This can change one of them and reduce the complexity
>>> of the upper layer adaptation of the sound card.
>>>
>>> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
>> Is 0x0308 something properly defined standard?
>> If so, we can add the entry, of course.
>>
>>
>> thanks,
>>
>> Takashi
>>
>>
>>> ---
>>>    sound/usb/mixer.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
>>> index 3af71d42b9b9..bdde4261d994 100644
>>> --- a/sound/usb/mixer.c
>>> +++ b/sound/usb/mixer.c
>>> @@ -615,6 +615,7 @@ static struct iterm_name_combo {
>>>    	{ 0x0305, "Room Speaker" },
>>>    	{ 0x0306, "Com Speaker" },
>>>    	{ 0x0307, "LFE" },
>>> +	{ 0x0308, "Line Out" },
>>>    	{ 0x0600, "External In" },
>>>    	{ 0x0601, "Analog In" },
>>>    	{ 0x0602, "Digital In" },
>>> -- 
>>> 2.47.1
>>>


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
