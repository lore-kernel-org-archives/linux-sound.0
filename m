Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E283594C
	for <linux-sound@vger.kernel.org>; Mon, 27 Jan 2025 15:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737990142; cv=none; b=mL1Z7h9ICW6w+bCKbefpbGNIkYplot57x2UQtNt3XR4IqhEst7gBFGpw9xTuqJ2K5YZKSkogx8dXJjj/yQqMOooltP5CwdiVdGesm9LvLV7qrtRTIzeGh00jfW0ek9vShjFZXAk24DOVXU3vynyMaJad7oBuGs326URRAnzR1PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737990142; c=relaxed/simple;
	bh=5b9lFf9wAx+JQRNDmJFRc7iwLIbyxLjLWULpP0rqP3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DivRIBwU55l1c1dWZeNBkH4o4qm2SjuYfp1HyDvtbxbR4kYMqoV/HFEVVyiOEUkFraUtXjZxR/YIcb0Mv2lFNLaERf3XJLoaEJOqP2a5+zDqrysYhj/UsH+wGMO2FSueq22wnD2fzF1D/TM2YVlSOiMxobwscbxU62iCBGtM2s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=VGfxuV/J; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="VGfxuV/J"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 062324C64;
	Mon, 27 Jan 2025 15:54:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 062324C64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1737989650; bh=H6g8rKxtw81wt1TMk3mecCUqJFi3oS0X8oCoQX9Vv8o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VGfxuV/JmNFhzF5rolXGLklZgQtQ/MJuplu965rYQELkGQRuob7osKQaw9L9Avr32
	 ro100tbfsyFv0TC8kwlmDBk9NEkPNKMcmSqMT8LSdwR1sG35twwmXTDvInaywNs1ry
	 HptQulRWS1Q8kpnmUIGdKbNe6oXxuG9mURwtiphU=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 27 Jan 2025 15:54:04 +0100 (CET)
Message-ID: <6fcbc9d3-93d4-4485-9f9f-5bef61476ef3@perex.cz>
Date: Mon, 27 Jan 2025 15:54:04 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Change device numbering
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
References: <20250127144445.2739017-1-amadeuszx.slawinski@linux.intel.com>
 <f8f2b8f9-527e-486d-ae83-34abd13ef968@linux.intel.com>
Content-Language: en-US
From: Jaroslav Kysela <perex@perex.cz>
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <f8f2b8f9-527e-486d-ae83-34abd13ef968@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27. 01. 25 15:45, Amadeusz Sławiński wrote:
> On 1/27/2025 3:44 PM, Amadeusz Sławiński wrote:
>> Currently ASoC cards when enumerating create CPUs rtds first and CODECs
>> rtds second. This causes device number on cards to not start from 0, but
>> from number of present CPUs. During that it does count number of rtds
>> and uses it as device number visible in userspace.
>>
>> This patch changes device visible to userspace, when listing cards:
>>
>> Before:
>> card 0: hdaudioB0D0 [hdaudioB0D0], device 1: HDAudio Analog (*) []
>> card 1: hdaudioB0D2 [hdaudioB0D2], device 1: HDMI1 (*) []
>> card 1: hdaudioB0D2 [hdaudioB0D2], device 2: HDMI2 (*) []
>> card 1: hdaudioB0D2 [hdaudioB0D2], device 3: HDMI3 (*) []
>>
>> After:
>> card 0: hdaudioB0D0 [hdaudioB0D0], device 0: HDAudio Analog (*) []
>> card 1: hdaudioB0D2 [hdaudioB0D2], device 0: HDMI1 (*) []
>> card 1: hdaudioB0D2 [hdaudioB0D2], device 1: HDMI2 (*) []
>> card 1: hdaudioB0D2 [hdaudioB0D2], device 2: HDMI3 (*) []
>>
>> It is done by skipping back end devices and only counting front end
>> ones.
>>
>> Now there are few concerns I have:
>> - while rtd->id is not used much, few drivers seem to be using it as
>>     index into a table, above may break this use (although
>>     "include/sound/simple_card_utils.h: * the ID stored in rtd->id may not be a valid array index."
>>     suggests that maybe it is a bad idea anyway, but I'm not sure how
>>     generic that comment is)
>> - this will break user scripts, with hardcoded device IDs
>> - this will also break some UCMs with hardcoded IDs
>>
>> Now my main question is, if such patch would even be considered?
>> Perhaps device IDs are not considered as "stable" interface and can be
>> changed and my above worries are unnecessary.
>>
>> Patch is a result of discussion from:
>> https://github.com/alsa-project/alsa-ucm-conf/pull/499
>> and as such I may consider others ways of fixing the problem.
> 
> And it should've been RFC in topic... :( Sorry about that.

Looking to UCM configs, most of ASoC cards have PCM devices starting from 
zero. So this id is not used for all ASoC cards.

Also, a bit off-topic, but the driver name (hdaudioB?D?) for this particular 
driver should be corrected, too. It should be like 'hda-avs-dsp' or so. If I 
am not wrong, the SST driver name was 'hda-dsp'.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
