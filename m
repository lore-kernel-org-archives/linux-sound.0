Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464813B5305
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 11:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077127; cv=none; b=gKkJxb9XvdrwmSM9jCWMtey8IG5YUm1m5yC23rFodGZBEAHuM4VW9He2gGk/mKm2hvlEMM3FOWUw+KjWOBStNXdNL6ZXGMRS3syAUQBaobMm5VoaPKorOLwHq/FfLJV9WKEWOK46nIbyb9ZJFaaqhVu1eTD1iv+2GVEzb58yrow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077127; c=relaxed/simple;
	bh=M4HohlBChXLPUIgZ3Gk1ENbd6MZ8J5jbVCUHITRnHoA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fbOKM+lJw7KU3giDgoKzhuHY0mcohkz9NANAn26ibX796bc0dHkPot2ZF6r74gUud62vePoV61awHIEscLf4maLCK5u146rshMnRZXufBd6ij8eqh7kPzQ0eS+nhqIYrdiIF4+B74dL8IFYXXsgm0sTJhlqlXZBaGD6WvoFXq5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vRHWeGQd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FmvBNSVQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vRHWeGQd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FmvBNSVQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vRHWeGQd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FmvBNSVQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vRHWeGQd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FmvBNSVQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9615772B55;
	Fri,  3 Jul 2026 11:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783077123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BOnqvf8jzWlF8nV6fCT9zh2pV3Bxt9snEPPLFIkEvxo=;
	b=vRHWeGQdKwSmw0TwpsoPCLc4xMouM1JmOvh3tRscQZ8ZOKE0rRUAovboWBxu5HBd0NhI1q
	drPbVby55jYJ139Y+/2jBvEONCwArzafopTUbzy5aX6GN7N/Ff6F1yevzfAzN1fbYJ+1IW
	vJM7ANJOV5ljv1Ektu6uPr9bClKFYs8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783077123;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BOnqvf8jzWlF8nV6fCT9zh2pV3Bxt9snEPPLFIkEvxo=;
	b=FmvBNSVQqCK6PeWKUiM2KRO8nmCVeISQm8H3P8H9zHFOzgKbpTt/ZglJrJCg76kUC6XusP
	A8K+6ryML8IPgsCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783077123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BOnqvf8jzWlF8nV6fCT9zh2pV3Bxt9snEPPLFIkEvxo=;
	b=vRHWeGQdKwSmw0TwpsoPCLc4xMouM1JmOvh3tRscQZ8ZOKE0rRUAovboWBxu5HBd0NhI1q
	drPbVby55jYJ139Y+/2jBvEONCwArzafopTUbzy5aX6GN7N/Ff6F1yevzfAzN1fbYJ+1IW
	vJM7ANJOV5ljv1Ektu6uPr9bClKFYs8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783077123;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BOnqvf8jzWlF8nV6fCT9zh2pV3Bxt9snEPPLFIkEvxo=;
	b=FmvBNSVQqCK6PeWKUiM2KRO8nmCVeISQm8H3P8H9zHFOzgKbpTt/ZglJrJCg76kUC6XusP
	A8K+6ryML8IPgsCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 63204779AA;
	Fri,  3 Jul 2026 11:12:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4jSfFgOZR2pVWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 03 Jul 2026 11:12:03 +0000
Date: Fri, 03 Jul 2026 13:12:03 +0200
Message-ID: <87se6072f0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Cc: linux-kernel@vger.kernel.org,	Jaroslav Kysela <perex@perex.cz>,	Takashi
 Iwai <tiwai@suse.com>,	=?ISO-8859-1?Q?C=E1ssio?= Gabriel
 <cassiogabrielcontato@gmail.com>,	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: aloop: Add 'hrtimer' option to timer_source
In-Reply-To: <20260702170356.3418432-1-yuhsuan@chromium.org>
References: <20260702170356.3418432-1-yuhsuan@chromium.org>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,perex.cz,suse.com,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Thu, 02 Jul 2026 19:03:48 +0200,
Yu-Hsuan Hsu wrote:
> 
> The snd-aloop driver currently defaults to using the system jiffies
> timer (struct timer_list). On systems configured with a low timer
> interrupt frequency (e.g., CONFIG_HZ=250), the jiffies resolution
> (4ms per tick) is insufficient for precise audio timing. For
> example, a 10ms audio period requires 2.5 jiffies ticks, causing
> timing jitter that leads to capture underruns.
> 
> Introduce "hrtimer" as a supported timer_source option. When
> timer_source="hrtimer" is set, aloop uses high-resolution timers
> (hrtimer) to drive period updates. This provides nanosecond-level
> accuracy regardless of CONFIG_HZ and operates independently of other
> hardware audio cards.
> 
> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>

I guess the code depends on CONFIG_HIGH_RES_TIMERS, so we'd need
either an additional Kconfig dependency or some ifdefs to build
properly.

Other than that, I find the idea fine.


thanks,

Takashi

> ---
>  sound/drivers/aloop.c | 101 ++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 98 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
> index 06bfe09eae1a..35018c33a92b 100644
> --- a/sound/drivers/aloop.c
> +++ b/sound/drivers/aloop.c
> @@ -23,6 +23,7 @@
>  #include <linux/wait.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/hrtimer.h>
>  #include <sound/core.h>
>  #include <sound/control.h>
>  #include <sound/pcm.h>
> @@ -55,7 +56,7 @@ MODULE_PARM_DESC(pcm_substreams, "PCM substreams # (1-8) for loopback driver.");
>  module_param_array(pcm_notify, int, NULL, 0444);
>  MODULE_PARM_DESC(pcm_notify, "Break capture when PCM format/rate/channels changes.");
>  module_param_array(timer_source, charp, NULL, 0444);
> -MODULE_PARM_DESC(timer_source, "Sound card name or number and device/subdevice number of timer to be used. Empty string for jiffies timer [default].");
> +MODULE_PARM_DESC(timer_source, "Sound card name or number and device/subdevice number of timer to be used. Empty string for jiffies timer [default], 'hrtimer' for high-resolution timer.");
>  
>  #define NO_PITCH 100000
>  
> @@ -161,8 +162,9 @@ struct loopback_pcm {
>  	unsigned int period_size_frac;	/* period size in jiffies ticks */
>  	unsigned int last_drift;
>  	unsigned long last_jiffies;
> -	/* If jiffies timer is used */
> +	/* If jiffies / hrtimer is used */
>  	struct timer_list timer;
> +	struct hrtimer hrtimer;
>  
>  	/* size of per channel buffer in case of non-interleaved access */
>  	unsigned int channel_buf_n;
> @@ -232,6 +234,29 @@ static int loopback_jiffies_timer_start(struct loopback_pcm *dpcm)
>  	return 0;
>  }
>  
> +/* call in cable->lock */
> +static int loopback_hrtimer_start(struct loopback_pcm *dpcm)
> +{
> +	unsigned long tick;
> +	unsigned int rate_shift = get_rate_shift(dpcm);
> +
> +	if (rate_shift != dpcm->pcm_rate_shift) {
> +		dpcm->pcm_rate_shift = rate_shift;
> +		dpcm->period_size_frac = frac_pos(dpcm, dpcm->pcm_period_size);
> +	}
> +	if (dpcm->period_size_frac <= dpcm->irq_pos) {
> +		dpcm->irq_pos %= dpcm->period_size_frac;
> +		dpcm->period_update_pending = 1;
> +	}
> +	tick = dpcm->period_size_frac - dpcm->irq_pos;
> +	tick = DIV_ROUND_UP(tick, dpcm->pcm_bps);
> +	hrtimer_start(&dpcm->hrtimer,
> +		      ns_to_ktime(div_u64((u64)tick * NSEC_PER_SEC, HZ)),
> +		      HRTIMER_MODE_REL_SOFT);
> +
> +	return 0;
> +}
> +
>  /* call in cable->lock */
>  static int loopback_snd_timer_start(struct loopback_pcm *dpcm)
>  {
> @@ -270,6 +295,14 @@ static inline int loopback_jiffies_timer_stop(struct loopback_pcm *dpcm)
>  	return 0;
>  }
>  
> +/* call in cable->lock */
> +static inline int loopback_hrtimer_stop(struct loopback_pcm *dpcm)
> +{
> +	hrtimer_cancel(&dpcm->hrtimer);
> +
> +	return 0;
> +}
> +
>  /* call in cable->lock */
>  static int loopback_snd_timer_stop(struct loopback_pcm *dpcm)
>  {
> @@ -300,6 +333,13 @@ static inline int loopback_jiffies_timer_stop_sync(struct loopback_pcm *dpcm)
>  	return 0;
>  }
>  
> +static inline int loopback_hrtimer_stop_sync(struct loopback_pcm *dpcm)
> +{
> +	hrtimer_cancel(&dpcm->hrtimer);
> +
> +	return 0;
> +}
> +
>  /* call in loopback->cable_lock */
>  static int loopback_snd_timer_close_cable(struct loopback_pcm *dpcm)
>  {
> @@ -734,6 +774,28 @@ static void loopback_jiffies_timer_function(struct timer_list *t)
>  		snd_pcm_period_elapsed(dpcm->substream);
>  }
>  
> +static enum hrtimer_restart loopback_hrtimer_function(struct hrtimer *t)
> +{
> +	struct loopback_pcm *dpcm = container_of(t, struct loopback_pcm, hrtimer);
> +	bool period_elapsed = false;
> +
> +	scoped_guard(spinlock_irqsave, &dpcm->cable->lock) {
> +		if (loopback_jiffies_timer_pos_update(dpcm->cable) &
> +		    (1 << dpcm->substream->stream)) {
> +			loopback_hrtimer_start(dpcm);
> +			if (dpcm->period_update_pending) {
> +				dpcm->period_update_pending = 0;
> +				period_elapsed = true;
> +			}
> +		}
> +	}
> +
> +	if (period_elapsed)
> +		snd_pcm_period_elapsed(dpcm->substream);
> +
> +	return HRTIMER_NORESTART;
> +}
> +
>  /* call in cable->lock */
>  static int loopback_snd_timer_check_resolution(struct snd_pcm_runtime *runtime,
>  					       unsigned long resolution)
> @@ -907,6 +969,19 @@ static void loopback_jiffies_timer_dpcm_info(struct loopback_pcm *dpcm,
>  	snd_iprintf(buffer, "    timer_expires:\t%lu\n", dpcm->timer.expires);
>  }
>  
> +static void loopback_hrtimer_dpcm_info(struct loopback_pcm *dpcm,
> +				       struct snd_info_buffer *buffer)
> +{
> +	snd_iprintf(buffer, "    update_pending:\t%u\n",
> +		    dpcm->period_update_pending);
> +	snd_iprintf(buffer, "    irq_pos:\t\t%u\n", dpcm->irq_pos);
> +	snd_iprintf(buffer, "    period_frac:\t%u\n", dpcm->period_size_frac);
> +	snd_iprintf(buffer, "    last_jiffies:\t%lu (%lu)\n",
> +		    dpcm->last_jiffies, jiffies);
> +	snd_iprintf(buffer, "    timer_expires:\t%llu\n",
> +		    ktime_to_ns(hrtimer_get_expires(&dpcm->hrtimer)));
> +}
> +
>  static void loopback_snd_timer_dpcm_info(struct loopback_pcm *dpcm,
>  					 struct snd_info_buffer *buffer)
>  {
> @@ -1097,6 +1172,24 @@ static const struct loopback_ops loopback_jiffies_timer_ops = {
>  	.dpcm_info = loopback_jiffies_timer_dpcm_info,
>  };
>  
> +static int loopback_hrtimer_open(struct loopback_pcm *dpcm)
> +{
> +	hrtimer_setup(&dpcm->hrtimer, loopback_hrtimer_function,
> +		      CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
> +
> +	return 0;
> +}
> +
> +static const struct loopback_ops loopback_hrtimer_ops = {
> +	.open = loopback_hrtimer_open,
> +	.start = loopback_hrtimer_start,
> +	.stop = loopback_hrtimer_stop,
> +	.stop_sync = loopback_hrtimer_stop_sync,
> +	.close_substream = loopback_hrtimer_stop_sync,
> +	.pos_update = loopback_jiffies_timer_pos_update,
> +	.dpcm_info = loopback_hrtimer_dpcm_info,
> +};
> +
>  static int loopback_parse_timer_id(const char *str,
>  				   struct snd_timer_id *tid)
>  {
> @@ -1274,7 +1367,9 @@ static int loopback_open(struct snd_pcm_substream *substream)
>  		spin_lock_init(&cable->lock);
>  		snd_refcount_init(&cable->stop_count);
>  		cable->hw = loopback_pcm_hardware;
> -		if (loopback->timer_source)
> +		if (loopback->timer_source && !strcmp(loopback->timer_source, "hrtimer"))
> +			cable->ops = &loopback_hrtimer_ops;
> +		else if (loopback->timer_source && loopback->timer_source[0])
>  			cable->ops = &loopback_snd_timer_ops;
>  		else
>  			cable->ops = &loopback_jiffies_timer_ops;
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog
> 
