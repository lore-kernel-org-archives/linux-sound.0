Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30BC17FD
	for <linux-sound@vger.kernel.org>; Thu, 13 Jun 2024 12:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718283416; cv=none; b=ngOa7UJ8aaPfR9++MC9wRTRFmfsGHwdaNjdp6pbGV4vyGyVOiE+pN12TM2Zy0wusLHtyXCmWFICpCsKnoWCYxpzdZvv+/4zpyZojl1b5xqwqf3rX7rZoYIxRUYJ6tb2F9DVq6QVzsamyaqDjIx/idqhYzkE1sLyA4m36mPiYcoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718283416; c=relaxed/simple;
	bh=X7eweAgUaax9yKFmkJGOjjGoDPrL0AESZavmXf8aeGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JoeQG6vEfG1FxMMa4/6mC1TopfJnwoieuQJmdmEO/ZFzwrqnV/ci6NJqDtNZBv6zfJ3orfHe0wJiVjfC7l7VuNqyLhC0m7t+cvD2Xv5uv/7Jg2D3oKgLhDZ42+7KANQPEezO8r5+9EiIGaYuYnJCz3ipH7guK0/CxE61+srxiFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=djntqgpP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JryE67/N; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="djntqgpP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JryE67/N"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id A986711401B6;
	Thu, 13 Jun 2024 08:56:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 13 Jun 2024 08:56:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1718283413; x=
	1718369813; bh=/D0RyttmaJD4GGIuLh2UUaQhR0/a/V4lC8CF4U3LxJY=; b=d
	jntqgpPsxJMJJrciJDQomC75vMhfaSpvBkcDcSySlFI+CRupc3aIvRXXR/07Ay24
	9EMi8/GHIjIR889tOUoB7egOutvp70lAlZGrkdVxfBdMUdxG0hmUgCf6JwrtDkab
	8jRGb+94KBX1IHHLoOiCdGKUG/XTH56L1o3oyZeap1M46uVJG+Kw2iH0m9aML6Ky
	UVf4tCjOERhpbQjSRXah/6QPnYBZWDWVh3N+esZwq8BnM8fXGprjqayYOlmconmK
	tEu+axEVbPYDqKfh1d1kdRWhFOgvf4rH+LQl6u0wiqiP9Fc/tDtRAuE2VWR7hfTK
	BcQ6Jqb5tsaIrbH5hciaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718283413; x=1718369813; bh=/D0RyttmaJD4GGIuLh2UUaQhR0/a
	/V4lC8CF4U3LxJY=; b=JryE67/N1keQwC5ygASSg4eQ4IYrrUepIvdZD0qmQpJ3
	pksNI96zUqFoqg3+oIcIPLylD8faSHQOR30Kux8xW8B2lcsLOMb5FTAbfAX6X1Jj
	FNNpOpIYX/LScEy5g5etnXXHBIgBzdyPM8zGtdOQHaEoRSzOJMBssHDwiahrdZFl
	1p8aCIO3muh+LNQ94E8evjxPiIKp/FT/xON59mzdTrT9v1z5mJPt4XqpOK0PG/cZ
	tS4dZ/uxU0pHG9u6jrvHV9kMaZWm+6NrIltO4jEiXDUpBQIylKbucpQVI/Ou3lgY
	YgNpAf2m3pDeD6C1Y5bFxxwRgAOh/ZXM1Jrt1XlyEg==
X-ME-Sender: <xms:lexqZhq4Kk0Ztu9WmK3kPc-cDOQ7BgGJL7nuvhO3Hte01yUVxcMZFg>
    <xme:lexqZjrbhcjK_Wc2DsiW-hURJtqj6isZTydBYr3QPOX8oKMfTEX-D1NKqFK8hqeaq
    ebyNrRXGNMzs1CIgfI>
X-ME-Received: <xmr:lexqZuPLzABVgQocvo4ffkDisvfSmIxSdEoxf0AkjbEIn1rv70gLwLQhKsZhikahtYYfMS5MFpc8biXReK5ziBq4Zm32IhBlk8I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedujedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
    ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:lexqZs4tiGrOaphyerLVZ-hIcoy-Oi58MggMl6Tv81_CCtDQsPgziw>
    <xmx:lexqZg5ZTs-Fd9lI_R05nnEeNfGEMiP8bXmA0YdT-33v3PultY4jAw>
    <xmx:lexqZkgbLWaYtqvI_3i3mLlYY7hI5Dz8xALvVaOIbaaUq0xINl51DA>
    <xmx:lexqZi7ftBC7S5DKoznSWIn7-Hry7N8OZXuKMNc7HL96MRh5mVkhHg>
    <xmx:lexqZr3lhabKKG3AK7zBV-eet6gWbvWkmvWvnn76omQsEHGnOwSbxeoj>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jun 2024 08:56:51 -0400 (EDT)
Date: Thu, 13 Jun 2024 21:56:49 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
	Takashi Sakamoto <takaswie@kernel.org>
Subject: Re: [PATCH v4 1/2] ALSA: pcm: reinvent the stream synchronization ID
 API
Message-ID: <20240613125649.GA421852@workstation.local>
References: <20240507133551.607171-1-perex@perex.cz>
 <20240507133551.607171-2-perex@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507133551.607171-2-perex@perex.cz>

Hi,

On Tue, May 07, 2024 at 03:30:50PM +0200, Jaroslav Kysela wrote:
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

It can bring FTBFS for any userspace application which uses the
structure. If getting rid of such public structure, we should have the
term to deprecate it for a while.

> diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
> index 6f73b3c2c205..57ed4ffc891a 100644
> --- a/sound/core/pcm_lib.c
> +++ b/sound/core/pcm_lib.c
> @@ -5,6 +5,7 @@
>   *                   Abramo Bagnara <abramo@alsa-project.org>
>   */
>  
> +#include <asm/unaligned.h>
>  #include <linux/slab.h>
>  #include <linux/sched/signal.h>
>  #include <linux/time.h>
> @@ -525,10 +526,8 @@ void snd_pcm_set_sync(struct snd_pcm_substream *substream)
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
>  
> @@ -1810,6 +1809,24 @@ static int snd_pcm_lib_ioctl_fifo_size(struct snd_pcm_substream *substream,
>  	return 0;
>  }
>  
> +/**
> + * is sync id (clock id) empty?
> + */
> +static inline bool pcm_sync_empty(const unsigned char *sync)
> +{
> +	return get_unaligned((__u64 *)(sync + 0)) == 0 && get_unaligned((__u64 *)(sync + 8)) == 0;
> +}

This kind of usage of C inline qualifier is not useless, since the modern
compilers can optimize it into the local code.

> +static int snd_pcm_lib_ioctl_sync_id(struct snd_pcm_substream *substream,
> +				     void *arg)
> +{
> +	struct snd_pcm_hw_params *params = arg;
> +
> +	if (pcm_sync_empty(params->sync))
> +		memcpy(params->sync, substream->runtime->sync, sizeof(params->sync));
> +	return 0;
> +}

Furthermore, it does not work as expected in the case that any of driver sets
zeros to char[16] intentionally for its own purpose at PCM .open callback.

I think it is a kind of 'Separation of mechanism and policy' argument,
and a kind of designs which should be avoided.

>  /**
>   * snd_pcm_lib_ioctl - a generic PCM ioctl callback
>   * @substream: the pcm substream instance
> @@ -1831,6 +1848,8 @@ int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
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

I'm sorry if I overlooked your reply to my point, however the above is
not equivalent.


Regards

Takashi Sakamoto
