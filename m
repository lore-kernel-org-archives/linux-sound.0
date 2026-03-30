Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C287828507E
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 21:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774904866; cv=none; b=PUgy8EduJbqgdeDGWH0Hjl6I332dNsqr7P263lO3a832VcsZfW6ftpBqV6BTk/8AhGw5IvgatpANLef9kv6uHlfJ0Pj1ZNB5p/qUvmpekzYLIj15S3G+Pv5Zh09Z/QONWnSxQIn0gB9fWcDZz9yh7gq8Aix7SBi5SnPtxiLWV/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774904866; c=relaxed/simple;
	bh=PqYXDAXz5s6eZadqvaGRV6GjrKo0tBKjf1tJeApLlAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oy6Tfl00Tf0TDAVlIZgl9kTt7Sh5l3fnfnTTfGieOWP0eXRQfNTksGZoIl/Tf9wzzq0CTpSr5YUXJmU9s8QWn9FmF8XyXlUPAPjfgwOkuqYONeqGTLtk3fx0uIqu9fACigCKhC1o5RzLRGP5RrgmngUYBJTjNCsWC9ro7io2HDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=cTjpLXIN; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="cTjpLXIN"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 638911127BB;
	Mon, 30 Mar 2026 23:07:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1774904854;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=l0x3Vp5Udzy0OaNa9XbhWD/P1p/8h4OhzsTy6rE1Yzo=;
	b=cTjpLXINJLp6p8kiX8Tzd1Ux49eOAI4lPdHRpD3XQ6kvGCazhLXd3wJjusCJ/WityuJFnj
	nc2wcsN+7DdHYQiFWtuG+48uH1Kjo4u2xcxtAA1BbQlWGqvFM0l/iFvMLtDkmoOv+0kt8H
	2agOdMfWuAKmJYXUjxyjZmWx4iUObvyQGB9xg9YqIY5q7WjYIV1csNkInyV5K4vW1FS1ck
	E8ZkaAihMLj6Y4JEAFVyezu9IP+vQv/88Q2trkE8iYfzR4hfKXTlM3Pud1npEnQGnrljwU
	01lH2rAkYNwSd2DQC8Io+i3Z636bDLVPcgsrlYQjscQNfl5+knXXLOJWQ0jHlA==
Message-ID: <327db909-e3b6-4f28-9846-b06ae0db793f@nabladev.com>
Date: Mon, 30 Mar 2026 18:47:57 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] ALSA: pcm_dmaengine: Use more shorter periods for
 SEGMENT granularity PCM DMA
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Lars-Peter Clausen <lars@metafoo.de>, Mark Brown <broonie@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Takashi Iwai <tiwai@suse.com>
References: <20260327143014.54867-1-marex@nabladev.com>
 <87mrzpu5lo.wl-tiwai@suse.de>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <87mrzpu5lo.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 3/30/26 9:41 AM, Takashi Iwai wrote:
> On Fri, 27 Mar 2026 15:29:43 +0100,
> Marek Vasut wrote:
>>
>> The segment granularity PCM DMA updates PCM pointer at the end of every
>> segment. In case the segments are too long, which happens with pipewire,
>> it may happen that pcm_lib wait_for_avail() will time out while waiting
>> for PCM pointer update and playback will fail with IO error.
>>
>> In case of SEGMENT granularity, use 8 shorter segments over the default
>> 2 long segments set in dmaengine_pcm_set_runtime_hwparams(). That gives
>> the DMA engine some chance to update the PCM pointer every once in a
>> while and prevent the timeout.
>>
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>> ---
>> Cc: Jaroslav Kysela <perex@perex.cz>
>> Cc: Lars-Peter Clausen <lars@metafoo.de>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: Michal Simek <monstr@monstr.eu>
>> Cc: Takashi Iwai <tiwai@suse.com>
>> Cc: linux-sound@vger.kernel.org
>> ---
>>   sound/core/pcm_dmaengine.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
>> index 1306b04be171a..092ce958e1aee 100644
>> --- a/sound/core/pcm_dmaengine.c
>> +++ b/sound/core/pcm_dmaengine.c
>> @@ -424,6 +424,10 @@ int snd_dmaengine_pcm_refine_runtime_hwparams(
>>   			hw->info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
>>   		if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
>>   			hw->info |= SNDRV_PCM_INFO_BATCH;
>> +		if (dma_caps.residue_granularity == DMA_RESIDUE_GRANULARITY_SEGMENT) {
>> +			hw->periods_min = 8;
>> +			hw->period_bytes_max /= 8;
>> +		}
> 
> Overriding with the hard-coded values at hw_params refine doesn't look
> like a right way.  Those values are set and dealt by the drivers in
> general, as they are pretty hardware-specific.  You can't guarantee
> this magic number 8 working on all available hardware.
This is very much why I sent this patch as an RFC .

If these limits should be set per DMA driver, do you happen to have a 
suggestion where to plumb it in ?
