Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A85D25FA22
	for <linux-sound@vger.kernel.org>; Tue,  8 Apr 2025 07:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095777; cv=none; b=S2hDxFHygYHkSwC1FIQP0nEnA4buwmhCqt5mp+FjgSg4/hLBQ/V0UDPJM+zOSaFvG1dDXe3cnyzPq/bQEnUD+SQ7J8yygVA5NBrDBGZz04qa8FP2fT8OKlXaRAAVaV+7tWW5nfqvzdm/9W/ZQ65Ceedfpr10B3jCf7nfpYjMsnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095777; c=relaxed/simple;
	bh=3eusq0ACfAEyeb3slbnkG3HRbNceC1SwOO4CSJhEhrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aofZMVGOe6mC4JRMtF1l/f8pU9eDxKNHCM7+pN0vZ4wjsZtoN+9tWIXzXO1LwXTTP0z2RwNbn6wfVszaJgTQn0DGgosCE1tfGdBeF13MRHMTLBXM4Ks6Sul48BEPnuQT2qmANXeWVp1UEbSzplC6O7+5DIgUqajZL+7ef1rvOao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIJ0pRJ+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIJ0pRJ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744095776; x=1775631776;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3eusq0ACfAEyeb3slbnkG3HRbNceC1SwOO4CSJhEhrA=;
  b=lIJ0pRJ+Bvs0r9Bf3v3VUPCZmPYkKv3jNXfcoooAV9lzUK3Ir1Zl6zRQ
   O2sO5Y/nCozykSuSEb9ZKTUQi0zLwEdssHerZJaUyPOfYJ4yIqrtn0MzR
   GckH9OiVkawVTPAYmGwAr//5IYf7C8Eo9sNHVLlM2aXccDGqgfoQuYBnj
   ohjkYUwMmwQA3SIeHDgGBU2So2NuAHfu004+oz1+9mXri3I8jZcC1uqMv
   ikekrwwFd8KPi+tkoTGkHt7KJm+b1ORnrHiQrxTEtFsK/cgcloLBkivDU
   +NABmTuZFSFZgrFTA8XQRC3dA8BnY7XrQPqDCUbcSqhgo931y4r42DnnL
   A==;
X-CSE-ConnectionGUID: DjfhVgoNRDaqf3Ph/qCzbQ==
X-CSE-MsgGUID: KSVELt4qQB2Oz5OKqXYfjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="67985030"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="67985030"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 00:02:55 -0700
X-CSE-ConnectionGUID: kY8dqal3SCWs733V1j7CWA==
X-CSE-MsgGUID: GsEBN+QdSkG57btd9OnWiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="128157524"
Received: from unknown (HELO [10.245.248.64]) ([10.245.248.64])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 00:02:50 -0700
Message-ID: <d084dff6-6a25-4f84-879c-15c108c9c141@linux.intel.com>
Date: Tue, 8 Apr 2025 10:03:46 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: pcm: Release paused streams before suspend if
 resume is not supported
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com
References: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
 <87r02cym1c.wl-tiwai@suse.de> <9e7d5b08-c983-49aa-8076-062d02848da2@perex.cz>
 <87jz83ztn7.wl-tiwai@suse.de> <206300d0-839a-40e9-975e-e58ac689315c@perex.cz>
 <87h637znpp.wl-tiwai@suse.de> <35d35586-4ffb-4d97-963e-a57323f634d3@perex.cz>
 <8734eryn21.wl-tiwai@suse.de> <ad064c22-320f-401a-b173-36a5df6df0ed@perex.cz>
 <87v7rmylc5.wl-tiwai@suse.de> <d4169edb-1dcc-4eef-9f3e-9b8c93cdc648@perex.cz>
 <87o6xeyfkk.wl-tiwai@suse.de>
 <69c52779-ef90-45c5-a024-77f0030bf5cd@linux.intel.com>
 <87jz82ye7b.wl-tiwai@suse.de>
 <8878feb6-362a-4541-91fb-318aea1c0870@linux.intel.com>
 <87o6xe7l4q.wl-tiwai@suse.de>
 <51bf9695-1f70-4749-b70a-2ed4af8c4be7@linux.intel.com>
 <871pu95oon.wl-tiwai@suse.de> <2bc811f1-7fbd-45f1-924e-e6241dcef537@perex.cz>
 <87plht447q.wl-tiwai@suse.de> <b9d457b9-4645-4876-b6a1-82bb658a3b8f@perex.cz>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <b9d457b9-4645-4876-b6a1-82bb658a3b8f@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 03/04/2025 22:05, Jaroslav Kysela wrote:
> On 03. 04. 25 18:09, Takashi Iwai wrote:
> 
>> Last but not least, the ASoC PCM core has its own DPCM state, and the
>> trigger-SUSPEND skips the operation unless the stream has been
>> running.  I believe that's the very starting point of the problem
>> Peter's patch tries to address.
> 
> Unfortunately, after all discussions, I'm not convinced about Peter's
> patch. It smells like an workaround rather than a fix for forever. The
> problem is there for years so we should not concentrate on a quick fix.
> 
>>> Also, I would consider to call suspend/resume triggers (depending on a
>>> flag like can_pause_release_stop) when the stream is paused, too. Some
>>> drivers may want this scheme.
>>
>> Do you mean drivers that do share the same operation for
>> suspend/resume and pause?
> 
> Many drivers supporting pause may use it when we allow PAUSE -> SUSPEND
> and SUSPEND -> PAUSE transitions.
> 
> Something like:
> 
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> index ac8f3aef9205..6d6882973883 100644
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -541,6 +541,8 @@ struct snd_pcm {
>         bool internal; /* pcm is for internal use only */
>         bool nonatomic; /* whole PCM operations are in non-atomic
> context */
>         bool no_device_suspend; /* don't invoke device PM suspend */
> +       bool do_suspend_and_resume_in_pause; /* allow direct PAUSED ->
> SUSPENDED and
> +                                               SUSPENDED -> PAUSED
> transitions */

I think the issue is bit different than this.
What needs to be flagged is that the driver is not treating the PAUSE
trigger in the same way as it treats the STOP or SUSPEND, in other
worlds, the PAUSED state is not equal to STOPPED/SUSPENDED.

If the PAUSED state is equal to SUSPENDED state, then the trigger could
be skipped (as it is ignored before my patch unconditionally), but if
the two states are not equal then the SUSPEND must be sent, but the
patches from me and Takashi-san stil can be used as fallback in case the
RESUME is not supported as in that case the driver will certainly not
going to be able to resume to PAUSE_RESUME, so stopping a stream in that
case is appropriate.

Side note: I think we might also have broken case when we stop a PAUSED
stream if the driver's PAUSED state is not equal to STOPPED/SUSPENDED.
It is just that applications never do this, at least I ave never seen a
missing STOP trigger. aplay is doing a pause release before stop at least.


>  #if IS_ENABLED(CONFIG_SND_PCM_OSS)
>         struct snd_pcm_oss oss;
>  #endif
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 4057f9f10aee..3ec4ef7809ea 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -1694,8 +1694,11 @@ static int snd_pcm_do_suspend(struct
> snd_pcm_substream *substream,
>         struct snd_pcm_runtime *runtime = substream->runtime;
>         if (runtime->trigger_master != substream)
>                 return 0;
> -       if (! snd_pcm_running(substream))
> -               return 0;
> +       if (! snd_pcm_running(substream)) {
> +               if (!runtime->do_suspend_and_resume_in_pause ||
> +                   runtime->state != SNDRV_PCM_STATE_PAUSED)
> +                       return 0;
> +       }
>         substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_SUSPEND);
>         runtime->stop_operating = true;
>         return 0; /* suspend unconditionally */
> @@ -1798,8 +1801,11 @@ static int snd_pcm_do_resume(struct
> snd_pcm_substream *substream,
>         /* DMA not running previously? */
>         if (runtime->suspended_state != SNDRV_PCM_STATE_RUNNING &&
>             (runtime->suspended_state != SNDRV_PCM_STATE_DRAINING ||
> -            substream->stream != SNDRV_PCM_STREAM_PLAYBACK))
> -               return 0;
> +            substream->stream != SNDRV_PCM_STREAM_PLAYBACK)) {
> +               if (!runtime->do_suspend_and_resume_in_pause ||
> +                   runtime->suspend_state != SNDRV_PCM_STATE_PAUSED)
> +                       return 0;
> +       }
>         return substream->ops->trigger(substream,
> SNDRV_PCM_TRIGGER_RESUME);
>  }
> 
> This will allow to address this problem correctly without any pause
> release just to put all parts to the running state and immediately stop
> the stream. Ideally, all drivers should be migrated to this state scheme
> and the condition may be removed at the end.
> 
>                     Jaroslav
> 

-- 
Péter

