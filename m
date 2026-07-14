Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E20364049
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 06:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784009523; cv=none; b=UeJuqOjFElr+XDMQOkHVE9eQghY8VEmnWwz9rtyv7GMvgHZQQtxm3hIjuSahfee0b3AjVmTD1lpnDhwwAuLxVgRuoZuUx37Tf8v//8Pe97yD+oTNeQl9D3anFZCdk/OkNfc/1L+qtX6/i+UEaqdcLURrqB66jYWEm090zwkoEB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784009523; c=relaxed/simple;
	bh=uoGDJTSHWgWFzQbt+7IjVNFwqZgskwRSSXjP43QsV1Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ILftHg81iE0Tsl1oJb/OgUioPT92VOClsYYWz6RryAjxlnurnqNGWoP1AAtLvLLsgZcDVCtotX1KNk/lHV7+t8hhGms4MKDj/aEYX3E35r1rWWlBe1zIVwTVUdBIJv5nG1B+ken70NRnQwcdvZHpJd0USbtijvCNOGgWyDA0wU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xPIRJaEL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZdQCoyxm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=beu9Atod; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IiWtnOW8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xPIRJaEL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZdQCoyxm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="beu9Atod";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IiWtnOW8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E34EF3E23;
	Tue, 14 Jul 2026 06:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784009520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wmhzYwUyk9YS6rAbrx9rFfktDawPLZ0ingvEM7onW0A=;
	b=xPIRJaELt3viue8fkCKIibH9VzE+R98Bst/k43nIIkqe5i/kEp9E1c04xmPWyvPwOS+Rp/
	pxdOg0HnQj6LayynXfQ0OnSFWy/9K+RUAIZD5CkS8othjrTHm0LQLR+iaeBqUm0F6D+GYV
	SSjrZ8FvlkALBYq8+gPi/TSeo/Skktg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784009520;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wmhzYwUyk9YS6rAbrx9rFfktDawPLZ0ingvEM7onW0A=;
	b=ZdQCoyxm8a2Zu+0DO9wuQoAkWZ5otYDm5z1Je9SQscFaRN8qGPzBWHMNA/7yNVDOM3MugS
	KTNaFNTmVNYtJvAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784009518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wmhzYwUyk9YS6rAbrx9rFfktDawPLZ0ingvEM7onW0A=;
	b=beu9AtodHKJ74Lk5HMOniaC6/0psm16xVBSvCRF4CzQXgkLcJdOntb8/81MzV2WSC5LAEw
	sdWXnk/pdIf+AYquB7GG0VGuJplhkWObYu7GCQUNADOQpPixIU/xcQIOja6ZexZkSNcAYj
	Tqwvy+Zb8SlTKU2/Z+1p0clDUSpb0jg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784009518;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wmhzYwUyk9YS6rAbrx9rFfktDawPLZ0ingvEM7onW0A=;
	b=IiWtnOW8mABGfjydyKyF6oQUIn5VLksEafNwHjwSTNKzI4S/NzZJXaOxAZK+BZWNHC26qa
	Qd2PZAuromiw+lBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B3F49779AE;
	Tue, 14 Jul 2026 06:11:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eke/Ki7TVWrPJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jul 2026 06:11:58 +0000
Date: Tue, 14 Jul 2026 08:11:58 +0200
Message-ID: <87ldbeje1d.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: tiwai@suse.com,
	david.rhodes@cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH v2 3/3] ALSA: hda: Use scoped_guard() for open_mutex in azx_pcm_open()
In-Reply-To: <20260710084009.665814-4-wangdich9700@163.com>
References: <20260710084009.665814-1-wangdich9700@163.com>
	<20260710084009.665814-4-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,kylinos.cn:email]
X-Spam-Level: 

On Fri, 10 Jul 2026 10:40:09 +0200,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> The companion function azx_pcm_close() already uses
> scoped_guard(mutex, &chip->open_mutex). Replace the manual
> mutex_lock/mutex_unlock pair in azx_pcm_open() with the same
> pattern for consistency.
> 
> All goto targets are within the scoped_guard() block, avoiding
> the goto-jumping-out-of-scope pattern that is not recommended
> when using cleanup guards.
> 
> No functional changes.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

This one has also a combination of guard() and goto, which isn't a
good mix.


thanks,

Takashi

> ---
>  sound/hda/common/controller.c | 158 +++++++++++++++++-----------------
>  1 file changed, 81 insertions(+), 77 deletions(-)
> 
> diff --git a/sound/hda/common/controller.c b/sound/hda/common/controller.c
> index afec5c5546ec..04ae21cc5e5e 100644
> --- a/sound/hda/common/controller.c
> +++ b/sound/hda/common/controller.c
> @@ -584,86 +584,90 @@ static int azx_pcm_open(struct snd_pcm_substream *substream)
>  	int buff_step;
>  
>  	snd_hda_codec_pcm_get(apcm->info);
> -	mutex_lock(&chip->open_mutex);
> -	azx_dev = azx_assign_device(chip, substream);
> -	trace_azx_pcm_open(chip, azx_dev);
> -	if (azx_dev == NULL) {
> -		err = -EBUSY;
> -		goto unlock;
> -	}
> -	runtime->private_data = azx_dev;
> -
> -	runtime->hw = azx_pcm_hw;
> -	if (chip->gts_present)
> -		runtime->hw.info |= SNDRV_PCM_INFO_HAS_LINK_SYNCHRONIZED_ATIME;
> -	runtime->hw.channels_min = hinfo->channels_min;
> -	runtime->hw.channels_max = hinfo->channels_max;
> -	runtime->hw.formats = hinfo->formats;
> -	runtime->hw.rates = hinfo->rates;
> -	snd_pcm_limit_hw_rates(runtime);
> -	snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
> -
> -	/* avoid wrap-around with wall-clock */
> -	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_TIME,
> -				     20,
> -				     178000000);
> -
> -	if (chip->align_buffer_size)
> -		/* constrain buffer sizes to be multiple of 128
> -		   bytes. This is more efficient in terms of memory
> -		   access but isn't required by the HDA spec and
> -		   prevents users from specifying exact period/buffer
> -		   sizes. For example for 44.1kHz, a period size set
> -		   to 20ms will be rounded to 19.59ms. */
> -		buff_step = 128;
> -	else
> -		/* Don't enforce steps on buffer sizes, still need to
> -		   be multiple of 4 bytes (HDA spec). Tested on Intel
> -		   HDA controllers, may not work on all devices where
> -		   option needs to be disabled */
> -		buff_step = 4;
> -
> -	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
> -				   buff_step);
> -	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
> -				   buff_step);
> -	snd_hda_power_up(apcm->codec);
> -	if (hinfo->ops.open)
> -		err = hinfo->ops.open(hinfo, apcm->codec, substream);
> -	else
> -		err = -ENODEV;
> -	if (err < 0) {
> -		azx_release_device(azx_dev);
> -		goto powerdown;
> -	}
> -	snd_pcm_limit_hw_rates(runtime);
> -	/* sanity check */
> -	if (snd_BUG_ON(!runtime->hw.channels_min) ||
> -	    snd_BUG_ON(!runtime->hw.channels_max) ||
> -	    snd_BUG_ON(!runtime->hw.formats) ||
> -	    snd_BUG_ON(!runtime->hw.rates)) {
> -		azx_release_device(azx_dev);
> -		if (hinfo->ops.close)
> -			hinfo->ops.close(hinfo, apcm->codec, substream);
> -		err = -EINVAL;
> -		goto powerdown;
> -	}
> +	scoped_guard(mutex, &chip->open_mutex) {
> +		azx_dev = azx_assign_device(chip, substream);
> +		trace_azx_pcm_open(chip, azx_dev);
> +		if (azx_dev == NULL) {
> +			err = -EBUSY;
> +			break;
> +		}
> +		runtime->private_data = azx_dev;
> +
> +		runtime->hw = azx_pcm_hw;
> +		if (chip->gts_present)
> +			runtime->hw.info |= SNDRV_PCM_INFO_HAS_LINK_SYNCHRONIZED_ATIME;
> +		runtime->hw.channels_min = hinfo->channels_min;
> +		runtime->hw.channels_max = hinfo->channels_max;
> +		runtime->hw.formats = hinfo->formats;
> +		runtime->hw.rates = hinfo->rates;
> +		snd_pcm_limit_hw_rates(runtime);
> +		snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
> +
> +		/* avoid wrap-around with wall-clock */
> +		snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_TIME,
> +					     20,
> +					     178000000);
> +
> +		if (chip->align_buffer_size)
> +			/*
> +			 * Constrain buffer sizes to be multiple of 128
> +			 * bytes. This is more efficient in terms of memory
> +			 * access but isn't required by the HDA spec and
> +			 * prevents users from specifying exact period/buffer
> +			 * sizes. For example for 44.1kHz, a period size set
> +			 * to 20ms will be rounded to 19.59ms.
> +			 */
> +			buff_step = 128;
> +		else
> +			/*
> +			 * Don't enforce steps on buffer sizes, still need to
> +			 * be multiple of 4 bytes (HDA spec). Tested on Intel
> +			 * HDA controllers, may not work on all devices where
> +			 * option needs to be disabled
> +			 */
> +			buff_step = 4;
> +
> +		snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
> +					   buff_step);
> +		snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
> +					   buff_step);
> +		snd_hda_power_up(apcm->codec);
> +		if (hinfo->ops.open)
> +			err = hinfo->ops.open(hinfo, apcm->codec, substream);
> +		else
> +			err = -ENODEV;
> +		if (err < 0) {
> +			azx_release_device(azx_dev);
> +			goto powerdown;
> +		}
> +		snd_pcm_limit_hw_rates(runtime);
> +		/* sanity check */
> +		if (snd_BUG_ON(!runtime->hw.channels_min) ||
> +		    snd_BUG_ON(!runtime->hw.channels_max) ||
> +		    snd_BUG_ON(!runtime->hw.formats) ||
> +		    snd_BUG_ON(!runtime->hw.rates)) {
> +			azx_release_device(azx_dev);
> +			if (hinfo->ops.close)
> +				hinfo->ops.close(hinfo, apcm->codec, substream);
> +			err = -EINVAL;
> +			goto powerdown;
> +		}
>  
> -	/* disable LINK_ATIME timestamps for capture streams
> -	   until we figure out how to handle digital inputs */
> -	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> -		runtime->hw.info &= ~SNDRV_PCM_INFO_HAS_WALL_CLOCK; /* legacy */
> -		runtime->hw.info &= ~SNDRV_PCM_INFO_HAS_LINK_ATIME;
> -	}
> +		/*
> +		 * Disable LINK_ATIME timestamps for capture streams
> +		 * until we figure out how to handle digital inputs
> +		 */
> +		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> +			runtime->hw.info &= ~SNDRV_PCM_INFO_HAS_WALL_CLOCK; /* legacy */
> +			runtime->hw.info &= ~SNDRV_PCM_INFO_HAS_LINK_ATIME;
> +		}
>  
> -	snd_pcm_set_sync(substream);
> -	mutex_unlock(&chip->open_mutex);
> -	return 0;
> +		snd_pcm_set_sync(substream);
> +		return 0;
>  
> - powerdown:
> -	snd_hda_power_down(apcm->codec);
> - unlock:
> -	mutex_unlock(&chip->open_mutex);
> +powerdown:
> +		snd_hda_power_down(apcm->codec);
> +	}
>  	snd_hda_codec_pcm_put(apcm->info);
>  	return err;
>  }
> -- 
> 2.25.1
> 
