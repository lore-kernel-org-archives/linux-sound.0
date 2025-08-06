Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532EC28C5C0
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 13:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754488693; cv=none; b=UfQv0j2bLTNR4wULpgPP0cKHGm/FXfG76u3ULoOXOieAa95eGSrjqm4KIEGsn9/vXCVq6djxNoJj45Oy64WyO0ja+uNCbpfYYy3KKmkRcaug9kAi0sNy4ncXUYgdAa+YncMo3lzBMLwSEZJcoMsOQTZKsIKY2U+RvzcKy/dBg2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754488693; c=relaxed/simple;
	bh=gHyi9JU7NMpckVyG9nMop66V13JFnmzLzQUe8KGfmuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aUBwD09T5nlD//3RzqI76o893LwWkuipw1fexG5eC2bKU/ibMv5o98v+qOspUAiRmdiJ8ywSDaFPqrZ5+91+r3MWLGADRNPmnoaRZx68jzw6mPXDWuJwEPIXUnCcj4kg37g0t/ma0VQIcq7F7lcn5lGA9LyjbbXpsoXgFNLNLlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 722FE61EA1BEA;
	Wed, 06 Aug 2025 15:57:51 +0200 (CEST)
Message-ID: <b70db707-457d-4c0c-85be-19f4340dcc7b@molgen.mpg.de>
Date: Wed, 6 Aug 2025 15:57:51 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Quiet crackling noise at boot and after stopping music
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, regressions@lists.linux.dev
References: <10172c80-daec-4e20-ab57-a483cf1afc02@molgen.mpg.de>
 <871pposvy9.wl-tiwai@suse.de>
 <d542d223-fc6e-4be7-b581-8a390ce2f6be@molgen.mpg.de>
 <87sei4rg67.wl-tiwai@suse.de>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <87sei4rg67.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Takashi,


Thank you for your reply.

Am 06.08.25 um 10:46 schrieb Takashi Iwai:
> On Wed, 06 Aug 2025 10:34:57 +0200, Paul Menzel wrote:

>> Am 06.08.25 um 10:20 schrieb Takashi Iwai:
>>> On Wed, 06 Aug 2025 10:15:08 +0200, Paul Menzel wrote:
>>
>>>> I believe the Realtek refactoring caused a regression on my Intel Kaby
>>>> Lake laptop Dell XPS 13 9360. There is quiet crackling noise during
>>>> boot, when GDM is started, and also after playing music is
>>>> stopped. It’s reproducible with 6.16.0-04055-g14bed9bc81ba, that
>>>> contains the sound subsystem pull request.
>>>>
>>>> 177bf8620cf4 Merge tag 'sound-6.17-rc1' of
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
>>>>
>>>> I uploaded the run of alsa-info [1]. I try to verify with plain 6.16 later.
>>>
>>> It's likely because of the missing CONFIG_SND_HDA_CODEC_* selections.
>>> Please set CONFIG_SND_HDA_CODEC_ALC269=m and
>>
>> Indeed, I didn’t select this.
>>
>>> CONFIG_SND_HDA_CODEC_HDMI_INTEL=m if not done yet.
>>
>> I had selected this.
>>
>>> Those were already set to default=y in the later PR for avoiding such
>>> a pitfall.
>>
>> I remember I tried to check which to select, and I ran `alsa-info` to
>> find the codecs, but only found:
>>
>>      Codec: Realtek ALC3246
>>
>> As this didn’t match to any of the offerings, I didn’t select
>> it. May I suggest to extend the Kconfig help texts with notes how to
>> determine the correct module?
> 
> There are quite lots of different codec names, so we can't put all
> them, unfortunately...

Understood. Then maybe just the command how to find the id, that people 
can use to grep the correct module for? From the script `alsa-info.sh`, 
maybe, I found:

     $ grep -e Codec -e "Vendor Id" /proc/asound/card*/codec#*
     /proc/asound/card0/codec#0:Codec: Realtek ALC3246
     /proc/asound/card0/codec#0:Vendor Id: 0x10ec0256
     /proc/asound/card0/codec#2:Codec: Intel Kabylake HDMI
     /proc/asound/card0/codec#2:Vendor Id: 0x8086280b

So mention `/proc/asound/card*/codec#*`?

>> Also, would the driver be able to detect, if no codec modules are
>> selected and log a warning?
> 
> It still "works" with the generic HD-audio codec, as you already
> noticed.
Fair enough.


Kind regards,

Paul
