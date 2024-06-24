Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C16313A894
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 13:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719237401; cv=none; b=BPWkS+NX9uFXhamjFTkp1a09WOIK+1xg73yrtzSzMxJ7gu9+WBL9oyTJ/L5jO9lNkAY43yzOO8Bo/wZ7G153qR8PG9Q/UDguJfX4BNQDqNkUcgLr1pVNdNadQV8ScZ7+DnPadf9aI/Yiw/BKEhlv4tjuFeNrhhFHGDro/KdgEL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719237401; c=relaxed/simple;
	bh=UvvEBoVr2O2KJE0lvxC/uvAjdlc1h0k9q8d2fbAuGTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJ7dd0K9DcmP/rG9hIwkVhvc2ban/HCv+3ZbUg3lWMsf8oyOrtumn/01yGOers03RkKRVBDgu1YVo7MNFGcBC7mjIygM8v1qfkbax/HzXPGo2ddbdj41pQTzD3ZFpanqTJ1ke7xpQIoRzUtKmnFOZPOgS3j6V6bVSRY5/dCIg74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=p9bzcrBn; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="p9bzcrBn"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E44D26E9B;
	Mon, 24 Jun 2024 15:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E44D26E9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1719237393; bh=Q2Pw9GxqsEe5QWhI+N9hr+lHDXazmDdne/s1L9fAygY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p9bzcrBn23NJVmG3tyXBwK0Ho/znCzkMI3OFltjyA0BK0PWgszdXzRe/skC6A5iWo
	 2CG+1VQchwAqdkSd5Sx/QoYkZsDJpBcJLnmLgyOJBsrlSFfuujNXoVkFLkYFSFgkFk
	 +uayoIE1Qg3EMA/wVA+7uwyrFW7z8vs7IRv8n7kU=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 24 Jun 2024 15:56:29 +0200 (CEST)
Message-ID: <7c29f412-96ab-43cb-8249-e371cab6fb69@perex.cz>
Date: Mon, 24 Jun 2024 15:56:29 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] ALSA: pcm: reinvent the stream synchronization ID
 API
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <takaswie@kernel.org>
References: <20240624131127.498605-1-perex@perex.cz>
 <20240624131127.498605-2-perex@perex.cz>
 <28a5fde3-a02a-45c1-b3d7-25ae3fcfcfcc@linux.intel.com>
Content-Language: en-US
From: Jaroslav Kysela <perex@perex.cz>
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <28a5fde3-a02a-45c1-b3d7-25ae3fcfcfcc@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24. 06. 24 15:38, Amadeusz Sławiński wrote:
> On 6/24/2024 3:07 PM, Jaroslav Kysela wrote:
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
>> Note that the contents of ID is not supposed to be used for direct
>> comparison with a specific byte sequence. The "empty" case is when
>> all bytes are zero (driver does not offer this information)
>> and all other cases must be only used for equal comparison among
>> PCM streams (including different sound cards) if they are using
>> identical hardware clock.
>>
>> Cc: Takashi Sakamoto <takaswie@kernel.org>
>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>> ---
> 
> (...)
> 
>>    
>> @@ -420,7 +420,8 @@ struct snd_pcm_hw_params {
>>    	unsigned int rate_num;		/* R: rate numerator */
>>    	unsigned int rate_den;		/* R: rate denominator */
>>    	snd_pcm_uframes_t fifo_size;	/* R: chip FIFO size in frames */
>> -	unsigned char reserved[64];	/* reserved for future */
>> +	unsigned char sync[16];		/* R: synchronization ID (perfect sync - one clock source) */
> 
> If it is introduced as new API, can't this be done better? Maybe like:
> struct sync {
> 	char cardnum[4];
> 	char id[12];
> };
> or maybe just:
> struct sync {
> 	u32 cardnum;
> 	char id[12];
> };
> or something like that? It is bit hard to follow in next patch all this
> params->sync + 4 and memset/strncpy. And having named fields would help.0

The ID may be not related to one sound card. Multiple cards can share one 
clock source. It's internal kernel ID generation scheme which may be changed 
later when there's another demand in future. The applications should handle 
this as 16-byte blob which is used only for equal comparison among multiple 
PCM streams.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

