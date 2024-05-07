Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156BE441D
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 03:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715051062; cv=none; b=ZZtRmKEk/0S8/45q0Iegt9Azj9kMDZuxFoLA9GF8jU8tLvWo7etKfcW2ZAI87xNL4EdTcw1y8yzzfm5DiXwtcpuaAmaCFzJv4L8S92OGuFyMvqnnAfsSJ5RfWlGAS2qY+Bd9Z3SJiBfSTM5/gj3agA/F01E3yP9CE1JU3gdwyvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715051062; c=relaxed/simple;
	bh=oqWEXhVfXt5buYMYQziDaF80vsRKtriRD6OuDRozaRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q046HgHE1fqo199r8pZUxl81BQkJA8nXhJHyMcBkhzDwKqK14zOPaJRUj/DoAPHgqF2Ietf/CVWSPn8jT2PZDLiBq2zmvtxlsH7gIKd5AO9gE54RRo3SfNIul0qsZgdkRC8RTV5uI0wVnZ4GCdFVjDOeBr3Wfj6/xGh+yaYsxUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=WZs1ci3G; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PEIjhlU9; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="WZs1ci3G";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PEIjhlU9"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id 0BA3B1C001A0;
	Mon,  6 May 2024 23:04:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 06 May 2024 23:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1715051058; x=
	1715137458; bh=M/5zwNK4WEhAJnewb3QZAK3Gc2ETs/z/htiVKvOIMKo=; b=W
	Zs1ci3Giyqj+/3B/pDXa3ATooJMrgdLz89eXnWjcUpOgKGk0n8K2hvIVUpJmFTOk
	WApjFDlnLOh2k1u7ldowEC+9IkN1CF8saWURdzSzXw0bf+9hn2b3shiLSF5J0wkj
	//utE2gWGIWC78PTrPsMF0mOZIN7o7Kd7ejzKgzbk+B1rL+RWsW/4dTwNX89XmRF
	7He7wX22nSbOOxAqVEqZhurKCdYX8FFib145ndwVLjaydjVINBTEJo1yNbb7WmjV
	upI5xNTZw3Ai2jS29waV/8mkUiJHTXFDUz6Jq40f5tzD95Z9BLHtGaBrH2DONz96
	wXZ5CYBKt0GFv2rDI96fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715051058; x=1715137458; bh=M/5zwNK4WEhAJnewb3QZAK3Gc2ET
	s/z/htiVKvOIMKo=; b=PEIjhlU9XNlk48nE3qp1IdZ0bb7n/80CoDdR1T1hiEql
	m/NyAPZ/1rqqWuL7P72OJeBsGbS3X+WEpicBD0wZWkjbgcD02gFvwPgybZwTGZ8A
	De9RQc0bRfa1STMdLPSjhs7usM7lU/ZHWowmfyufzm6D7r8N4thNHL2atR9EuYhJ
	9aKhPOfQTnV9XTmcmap8jKy8YBw4bb5K2auoxnLAqkIDjhihQ95vXjtzLyirr/9l
	IRLAPb4oXn1IQ8RPhIWdwME6cxZ16e5IWjaaW6SMduQ411UVCZRh/ZsF6c0BUeue
	gUUGITrWRE2GDbUZjLT/LK4CYcyUNOYQK7W49y/uJQ==
X-ME-Sender: <xms:Mpo5Zk0yN4gnrSFZf3Z743MpV4EnRspqiry1Dm36MoxeaROo08fAjg>
    <xme:Mpo5ZvG0owOsd-ypVSd7fKFLU9wnwLut25CjvKKIgxe5oHmDxUn_y-fVHpWz8FnQm
    qeGStJkWZGCZYR7Pn4>
X-ME-Received: <xmr:Mpo5Zs7o0GQLFHwaFpKEoueavRts1N6M1XNLqma1LIgaYSJtfphUKrSBuGoxVpSFdt9t53x8dzp35gqtnlGb52aBYetIVRZO5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvjedgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
    ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Mpo5Zt2f5yS04II7S0K-NaC1iUXY2-a_MJmyKF4isESjLNzlusY37A>
    <xmx:Mpo5ZnFjPxIxP6jDZOUaDqqn3gaZGT2Eeg16wGZ0foh7BwEcmFrFTA>
    <xmx:Mpo5Zm95Z-MZjmR3cl8iCUDwcoqiHOtk7K-YqzkILay2SfcKtWHPEQ>
    <xmx:Mpo5Zsn_GXHo_EyqaKIE9l1BoDDAHqsm0nDrGsHTamyGf44FV68uSg>
    <xmx:Mpo5ZvD9dfipN7ac-cS3CunH7JiMFt7rUa2kDaWGxts73qvcJvV-W_4r>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 May 2024 23:04:16 -0400 (EDT)
Date: Tue, 7 May 2024 12:04:14 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/2] ALSA: pcm: reinvent the stream synchronization ID API
Message-ID: <20240507030414.GA413281@workstation.local>
References: <20240506151218.377580-1-perex@perex.cz>
 <20240506151218.377580-2-perex@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506151218.377580-2-perex@perex.cz>

On Mon, May 06, 2024 at 05:11:49PM +0200, Jaroslav Kysela wrote:
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
>  include/sound/pcm.h         | 11 ++++++++++-
>  include/uapi/sound/asound.h | 13 ++++---------
>  sound/core/pcm_lib.c        | 18 ++++++++++++++----
>  sound/core/pcm_native.c     |  6 ++++++
>  sound/pci/emu10k1/p16v.c    |  7 +++----
>  5 files changed, 37 insertions(+), 18 deletions(-)
> 
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> index 210096f124ee..dae41b100517 100644
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -93,6 +93,7 @@ struct snd_pcm_ops {
>  #define SNDRV_PCM_IOCTL1_CHANNEL_INFO	2
>  /* 3 is absent slot. */
>  #define SNDRV_PCM_IOCTL1_FIFO_SIZE	4
> +#define SNDRV_PCM_IOCTL1_SYNC_ID	5
>  
>  #define SNDRV_PCM_TRIGGER_STOP		0
>  #define SNDRV_PCM_TRIGGER_START		1
> @@ -396,7 +397,7 @@ struct snd_pcm_runtime {
>  	snd_pcm_uframes_t silence_start; /* starting pointer to silence area */
>  	snd_pcm_uframes_t silence_filled; /* already filled part of silence area */
>  
> -	union snd_pcm_sync_id sync;	/* hardware synchronization ID */
> +	unsigned char sync[16];		/* hardware synchronization ID */
>  
>  	/* -- mmap -- */
>  	struct snd_pcm_mmap_status *status;
> @@ -1565,6 +1566,14 @@ static inline u64 pcm_format_to_bits(snd_pcm_format_t pcm_format)
>  	     (__force int)(f) <= (__force int)SNDRV_PCM_FORMAT_LAST;	\
>  	     (f) = (__force snd_pcm_format_t)((__force int)(f) + 1))
>  
> +/**
> + * is sync id (clock id) empty?
> + */
> +static inline bool pcm_sync_empty(const unsigned char *sync)
> +{
> +	return strnlen((const char *)sync, 16) == 0;
> +}
> +

For the sound card indexed by 0, it is problematic, since in the later
change, the first element of array has 0.

>  /* printk helpers */
>  #define pcm_err(pcm, fmt, args...) \
>  	dev_err((pcm)->card->dev, fmt, ##args)
> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
> index 628d46a0da92..c458172b32d5 100644
> --- a/include/uapi/sound/asound.h
> +++ b/include/uapi/sound/asound.h
> @@ -142,7 +142,7 @@ struct snd_hwdep_dsp_image {
>   *                                                                           *
>   *****************************************************************************/
>  
> -#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 17)
> +#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 18)
>  
>  typedef unsigned long snd_pcm_uframes_t;
>  typedef signed long snd_pcm_sframes_t;
> @@ -330,12 +330,6 @@ enum {
>  #endif
>  };
>  
> -union snd_pcm_sync_id {
> -	unsigned char id[16];
> -	unsigned short id16[8];
> -	unsigned int id32[4];
> -};
> -
>  struct snd_pcm_info {
>  	unsigned int device;		/* RO/WR (control): device number */
>  	unsigned int subdevice;		/* RO/WR (control): subdevice number */
> @@ -348,7 +342,7 @@ struct snd_pcm_info {
>  	int dev_subclass;		/* SNDRV_PCM_SUBCLASS_* */
>  	unsigned int subdevices_count;
>  	unsigned int subdevices_avail;
> -	union snd_pcm_sync_id sync;	/* hardware synchronization ID */
> +	unsigned char pad1[16];		/* was: hardware synchronization ID */
>  	unsigned char reserved[64];	/* reserved for future... */
>  };
>  
> @@ -420,7 +414,8 @@ struct snd_pcm_hw_params {
>  	unsigned int rate_num;		/* R: rate numerator */
>  	unsigned int rate_den;		/* R: rate denominator */
>  	snd_pcm_uframes_t fifo_size;	/* R: chip FIFO size in frames */
> -	unsigned char reserved[64];	/* reserved for future */
> +	unsigned char sync[16];		/* R: synchronization ID (perfect sync - one clock source) */
> +	unsigned char reserved[48];	/* reserved for future */
>  };
>  
>  enum {

As long as I checked, the above change are safe for
backward-compatibility and compat ioctl. They keep the same size of
structure and the same offset of member in each of i386/ILP32/LP64 data
models,

> diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
> index 6f73b3c2c205..84b948db3393 100644
> --- a/sound/core/pcm_lib.c
> +++ b/sound/core/pcm_lib.c
> @@ -525,10 +525,8 @@ void snd_pcm_set_sync(struct snd_pcm_substream *substream)
>  {
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>  	
> -	runtime->sync.id32[0] = substream->pcm->card->number;
> -	runtime->sync.id32[1] = -1;
> -	runtime->sync.id32[2] = -1;
> -	runtime->sync.id32[3] = -1;
> +	*(__u32 *)runtime->sync = cpu_to_le32(substream->pcm->card->number);
> +	memset(runtime->sync + 4, 0xff, sizeof(runtime->sync) - 4);
>  }
>  EXPORT_SYMBOL(snd_pcm_set_sync);

I mentioned about the issue in the above.

> @@ -1810,6 +1808,16 @@ static int snd_pcm_lib_ioctl_fifo_size(struct snd_pcm_substream *substream,
>  	return 0;
>  }
>  
> +static int snd_pcm_lib_ioctl_sync_id(struct snd_pcm_substream *substream,
> +				     void *arg)
> +{
> +	struct snd_pcm_hw_params *params = arg;
> +
> +	if (pcm_sync_empty(params->sync))
> +		memcpy(params->sync, &substream->runtime->sync, sizeof(params->sync));
> +	return 0;
> +}
> +

I mentioned about the issue in the above.

>  /**
>   * snd_pcm_lib_ioctl - a generic PCM ioctl callback
>   * @substream: the pcm substream instance
> @@ -1831,6 +1839,8 @@ int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
>  		return snd_pcm_lib_ioctl_channel_info(substream, arg);
>  	case SNDRV_PCM_IOCTL1_FIFO_SIZE:
>  		return snd_pcm_lib_ioctl_fifo_size(substream, arg);
> +	case SNDRV_PCM_IOCTL1_SYNC_ID:
> +		return snd_pcm_lib_ioctl_sync_id(substream, arg);
>  	}
>  	return -ENXIO;
>  }
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 0b76e76823d2..63fcb08ee93d 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -533,6 +533,12 @@ static int fixup_unreferenced_params(struct snd_pcm_substream *substream,
>  					  SNDRV_PCM_INFO_MMAP_VALID);
>  	}
>  
> +	err = snd_pcm_ops_ioctl(substream,
> +				SNDRV_PCM_IOCTL1_SYNC_ID,
> +				params);
> +	if (err < 0)
> +		return err;
> +
>  	return 0;
>  }
>  
> diff --git a/sound/pci/emu10k1/p16v.c b/sound/pci/emu10k1/p16v.c
> index e7f097cae574..773725dbdfbd 100644
> --- a/sound/pci/emu10k1/p16v.c
> +++ b/sound/pci/emu10k1/p16v.c
> @@ -174,10 +174,9 @@ static int snd_p16v_pcm_open_playback_channel(struct snd_pcm_substream *substrea
>  	if (err < 0)
>                  return err;
>  
> -	runtime->sync.id32[0] = substream->pcm->card->number;
> -	runtime->sync.id32[1] = 'P';
> -	runtime->sync.id32[2] = 16;
> -	runtime->sync.id32[3] = 'V';
> +	*(__u32 *)runtime->sync = cpu_to_le32(substream->pcm->card->number);
> +	memset(runtime->sync + 4, 0, sizeof(runtime->sync) - 4);
> +	strncpy(runtime->sync + 4, "P16V", 4);
  
The serialization would not keep the same data before the change, since
the third, fourth, and fifth elements are 0x31, 0x36, and 0x56, instead
of 0x10, 0x56, and 0x00.

>  	return 0;
>  }
> -- 
> 2.43.0
> 
