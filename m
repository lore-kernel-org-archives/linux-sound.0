Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCDF84FB3
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 09:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714986742; cv=none; b=SlyMIvpDMW1pgasyjup8KtTBkqcmUUD9THMy+Zriwx1eT1O/SPOV2lRNNdJ5om5xT3gcnqZQq3VWe7hZQarsM9NjrcoXT80iq0PIG7VoCuZd9E5BqFcDvLrr70cLqgAIc9qLSHRWnRdj8JUw59Dnh1rVS0UfP5p4/EzYCBozeqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714986742; c=relaxed/simple;
	bh=RATY2+nnNNcHDIGrrbyTHgc9cjzivlJTq6cMxZ/XNPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rBaYxr+NryiDStU15vSjRS59ZIk+xKE6Terd3PG1v+x2fCTCsJePzqjZdLzyQJFtuUmiOT+BA9m0a9eKB6d7ivrifxG/IOHU2Emx642THu2ipAKFReQKMaYOnIi84ZUrznLdKaRwvG4L+0oRnNpZzcJXAL3NCdvufN3n0kpJMYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=1FfvYALL; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="1FfvYALL"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id EEA2C43FA;
	Mon,  6 May 2024 11:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz EEA2C43FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1714986734; bh=hFvrhS64H8engx+QsLiH7ADQRr4HJEqAjHeMp0DI9DA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=1FfvYALL0nMQysR0f3cwzTjXyvgngnjQ8XiNuk8UxhPH0i+gB6cKIn0EgnrDatdz1
	 vGME3vtaSBQKpLQW4GSq4aSJX+SGZc9soKXr4w5T2tGcsupBXr6e762ZsVxNceu4jN
	 nINuVFYKCVs3/MfNP6FY2QNhcvcvEYZo0yt8+VG8=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon,  6 May 2024 11:12:09 +0200 (CEST)
Message-ID: <0e3cf536-3c18-4327-961a-f1ce8e3af658@perex.cz>
Date: Mon, 6 May 2024 11:12:09 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: pcm: reinvent the stream synchronization ID API
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <takaswie@kernel.org>
References: <20240430161012.4011064-1-perex@perex.cz>
 <0f410a6a-f74d-4e3e-ac6a-6564e67bc140@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <0f410a6a-f74d-4e3e-ac6a-6564e67bc140@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06. 05. 24 11:02, Amadeusz Sławiński wrote:
> On 4/30/2024 6:10 PM, Jaroslav Kysela wrote:
>> Until the commit e11f0f90a626 ("ALSA: pcm: remove SNDRV_PCM_IOCTL1_INFO
>> internal command"), there was a possibility to pass information
>> about the synchronized streams to the user space. The mentioned
>> commit removed blindly the appropriate code with an irrelevant comment.
>>
>> The revert may be appropriate, but since this API was lost for several
>> years without any complains, it's time to improve it. The hardware
>> parameters may change the used stream clock source (e.g. USB hardware)
>> so move this synchronization ID to hw_params as read-only field.
>>
>> It seems that pipewire can benefit from this API (disable adaptive
>> resampling for perfectly synchronized PCM streams) now.
>>
>> Cc: Takashi Sakamoto <takaswie@kernel.org>
>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>> ---
>>    include/sound/pcm.h         |  9 +++++++++
>>    include/uapi/sound/asound.h |  8 +++++---
>>    sound/core/pcm_lib.c        | 13 +++++++++++++
>>    sound/core/pcm_native.c     |  6 ++++++
>>    4 files changed, 33 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
>> index 210096f124ee..f716e0d0d174 100644
>> --- a/include/sound/pcm.h
>> +++ b/include/sound/pcm.h
>> @@ -93,6 +93,7 @@ struct snd_pcm_ops {
>>    #define SNDRV_PCM_IOCTL1_CHANNEL_INFO	2
>>    /* 3 is absent slot. */
>>    #define SNDRV_PCM_IOCTL1_FIFO_SIZE	4
>> +#define SNDRV_PCM_IOCTL1_SYNC_ID	5
>>    
>>    #define SNDRV_PCM_TRIGGER_STOP		0
>>    #define SNDRV_PCM_TRIGGER_START		1
>> @@ -1565,6 +1566,14 @@ static inline u64 pcm_format_to_bits(snd_pcm_format_t pcm_format)
>>    	     (__force int)(f) <= (__force int)SNDRV_PCM_FORMAT_LAST;	\
>>    	     (f) = (__force snd_pcm_format_t)((__force int)(f) + 1))
>>    
>> +/**
>> + * is sync id (clock id) empty?
>> + */
>> +static inline bool pcm_sync_empty(union snd_pcm_sync_id *sync)
>> +{
>> +	return sync->id64[0] == 0 && sync->id64[1] == 0;
> 
> Can you use SNDRV_PCM_STREAM_PLAYBACK and SNDRV_PCM_STREAM_CAPTURE here,
> for someone not familiar with ALSA code above will be confusing.

It's not related to stream direction. Anyway, I'll send an updated patch based 
on Takashi's comment soon with some other changes.

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

