Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2D91420A5
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 09:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714986165; cv=none; b=jUlr5pPJv+vCqX5u7wYgOeABwSbF23SC01qN/P2ZvmyoMW/K7+bJzKARV76vLcRV2Gzj17MscKnimRNP8dJvzZbgKM4+NFNjBTcyOmlZe6plt4J5qY22vsgIZgBrbh4fVtVxlmUQo+8maCdouzJR4QxCHiqn13YP/rYBuTBW4To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714986165; c=relaxed/simple;
	bh=zeFPIrWkYB4NgasrSmAtSV0zSgWlndh99pDwaWX2+C8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7W5p3GfD//3cMZl7xNyvO2CjlVanYktDAcRfstp00UTZXJv8+noSAmTj/pjKazfZY7YqH8uMbOWdQpHnpNGoShUzbcBP4tKXEygJJjNY8wVIAYFmpjcpPH0QR954V9YLK7pvjVHUb9AcFGJPuQFu6J961KNZZPhBRtVsI2Y/7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCZO37nI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCZO37nI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714986163; x=1746522163;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zeFPIrWkYB4NgasrSmAtSV0zSgWlndh99pDwaWX2+C8=;
  b=bCZO37nIMZGAqB0R7ixVsYg36X0H79xgH41EXixfoDO/Dflcsdya3IVx
   e+ojomIEWhmEkyrYPRqkd9FaLPAdWiay8XMwJVwVhuzs4+I6tjYp8MGyk
   NmffprjJ8jsr3K4tjV0edb/O8rWZEMKuuV0wpR8OmJhK6qvig17653SQw
   WNE60voiIx3lO75dCTTrYv5KN/Xds+WSLLSFOC8XmTLSoqiRZ9k6volDV
   wwApdBChOvEHd1JtnpU7t+gZH6a19Au996gvX9pT/ZwDBbdBLUHQt4aB+
   Ojrr41o6drnJitIVdQtbi24QWpsFZCVvV/UNFTglo3vMDUgko4QIeqE4z
   A==;
X-CSE-ConnectionGUID: +709u00nSDaxxg9NFveyWA==
X-CSE-MsgGUID: 1GaHGGd8TCCthI27akEVsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="21877671"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="21877671"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 02:02:43 -0700
X-CSE-ConnectionGUID: hr5zbP0XS7KGmjcVse003g==
X-CSE-MsgGUID: qujJ3fcZRCODvPyeEGh0HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="28618023"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 02:02:42 -0700
Message-ID: <0f410a6a-f74d-4e3e-ac6a-6564e67bc140@linux.intel.com>
Date: Mon, 6 May 2024 11:02:39 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: pcm: reinvent the stream synchronization ID API
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <takaswie@kernel.org>
References: <20240430161012.4011064-1-perex@perex.cz>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240430161012.4011064-1-perex@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/30/2024 6:10 PM, Jaroslav Kysela wrote:
> Until the commit e11f0f90a626 ("ALSA: pcm: remove SNDRV_PCM_IOCTL1_INFO
> internal command"), there was a possibility to pass information
> about the synchronized streams to the user space. The mentioned
> commit removed blindly the appropriate code with an irrelevant comment.
> 
> The revert may be appropriate, but since this API was lost for several
> years without any complains, it's time to improve it. The hardware
> parameters may change the used stream clock source (e.g. USB hardware)
> so move this synchronization ID to hw_params as read-only field.
> 
> It seems that pipewire can benefit from this API (disable adaptive
> resampling for perfectly synchronized PCM streams) now.
> 
> Cc: Takashi Sakamoto <takaswie@kernel.org>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> ---
>   include/sound/pcm.h         |  9 +++++++++
>   include/uapi/sound/asound.h |  8 +++++---
>   sound/core/pcm_lib.c        | 13 +++++++++++++
>   sound/core/pcm_native.c     |  6 ++++++
>   4 files changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> index 210096f124ee..f716e0d0d174 100644
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -93,6 +93,7 @@ struct snd_pcm_ops {
>   #define SNDRV_PCM_IOCTL1_CHANNEL_INFO	2
>   /* 3 is absent slot. */
>   #define SNDRV_PCM_IOCTL1_FIFO_SIZE	4
> +#define SNDRV_PCM_IOCTL1_SYNC_ID	5
>   
>   #define SNDRV_PCM_TRIGGER_STOP		0
>   #define SNDRV_PCM_TRIGGER_START		1
> @@ -1565,6 +1566,14 @@ static inline u64 pcm_format_to_bits(snd_pcm_format_t pcm_format)
>   	     (__force int)(f) <= (__force int)SNDRV_PCM_FORMAT_LAST;	\
>   	     (f) = (__force snd_pcm_format_t)((__force int)(f) + 1))
>   
> +/**
> + * is sync id (clock id) empty?
> + */
> +static inline bool pcm_sync_empty(union snd_pcm_sync_id *sync)
> +{
> +	return sync->id64[0] == 0 && sync->id64[1] == 0;

Can you use SNDRV_PCM_STREAM_PLAYBACK and SNDRV_PCM_STREAM_CAPTURE here, 
for someone not familiar with ALSA code above will be confusing.

> +}
> +
>   /* printk helpers */
>   #define pcm_err(pcm, fmt, args...) \
>   	dev_err((pcm)->card->dev, fmt, ##args)
> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
> index 628d46a0da92..13f8a08f3f33 100644
> --- a/include/uapi/sound/asound.h
> +++ b/include/uapi/sound/asound.h
> @@ -142,7 +142,7 @@ struct snd_hwdep_dsp_image {
>    *                                                                           *
>    *****************************************************************************/
>   
> -#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 17)
> +#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 18)
>   
>   typedef unsigned long snd_pcm_uframes_t;
>   typedef signed long snd_pcm_sframes_t;
> @@ -334,6 +334,7 @@ union snd_pcm_sync_id {
>   	unsigned char id[16];
>   	unsigned short id16[8];
>   	unsigned int id32[4];
> +	__u64 id64[2];

Similarly here, can SNDRV_PCM_STREAM_LAST be used?


