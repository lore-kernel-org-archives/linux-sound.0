Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2D7372B24
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 11:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029275; cv=none; b=rVFdtW0rQWRRfDv9qtA16HepNHIiyo+0od/ZHY5S6BqG4cvmdPMa65c8Qk3DTZ/8MBgZGbIN6qFnJOQn04XDG1jfthZ7wh9NwLJsrpHhBxkanlWNzhlJ3rej3A6eYscS6lVNRURXmW5Ca7TjDyalSvRcjmR+aXdQL9jGEFZn+kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029275; c=relaxed/simple;
	bh=ZKT1sepTKpW1nMj55n6arlBlwYJl1MbxTNrlOijCGKI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ym3XJoVcnoQbu6/teN5HbJ+I3GWaHmDTv/anpT0VkNHGm9Ik7zSyuwSGUOWV5xr88hmJLCuucOyb9CydJgLy4jPe7Q9AHKa23A+VYyx/UdH9hwYjMt3fMqqAR12eiZPO0VM6PsCCXN2FsU+nfXoS3HNuGT3cLZ6n4gknVxCIKSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D3jfUd/t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=84FQ/nvP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gDdi5fNF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L/+SVR0p; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D3jfUd/t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="84FQ/nvP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gDdi5fNF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L/+SVR0p"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 01C835BCC1;
	Fri, 24 Apr 2026 11:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777029272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M3WuoMBtZgKp11lsvEXRtxuakMMlf6c4sL4ohllFrsg=;
	b=D3jfUd/tg78rLjzZCObeKbSJYwIqSSGQgMIQVMPpV+fyIm0U3LSLsVGtuwOHHmhcH+q/pk
	SPo5y4rX6jklW29abfRqWglO7GU17ZztVq83tZkjfVJIeWZVqNu9m3uqELlWrPmtmreinW
	3IjPV5c78GThIqGmJndZtCpE1FpL5rU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777029272;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M3WuoMBtZgKp11lsvEXRtxuakMMlf6c4sL4ohllFrsg=;
	b=84FQ/nvPmiqyhaQYlmsDWXG7d16QwjS5HlaHKZqbDSiO0VCiODKUweJjGj1YGJaV/9U0fd
	2yO4OpMbjW0rJqBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777029268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M3WuoMBtZgKp11lsvEXRtxuakMMlf6c4sL4ohllFrsg=;
	b=gDdi5fNFFJZoHktnZD4bO5qbfx/rrpU1ECDu+JFCw6jCGuzwedaqeb8NHD7mTZu0x6T0uH
	UpnlJuUvc4u+pbyHjqd5EYZzQ0bJiUY10kmu3rRRgr6WX3vcG1GFnwwCUKRHEfbFmsKHrm
	ZNoOMXY9a85up/NjzrmoRMq2nLpWBfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777029268;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M3WuoMBtZgKp11lsvEXRtxuakMMlf6c4sL4ohllFrsg=;
	b=L/+SVR0pi2db4992cdcFdITOmEWIwF/2++G2wRF3gJSVjx0PSR+RKDN6nj8gEool5vuUe3
	BfRpwpDhDI8gErBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF1EA593A4;
	Fri, 24 Apr 2026 11:14:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6uZKLZNQ62kGLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 24 Apr 2026 11:14:27 +0000
Date: Fri, 24 Apr 2026 13:14:27 +0200
Message-ID: <87se8k1ugc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+8fa95c41eafbc9d2ff6f@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: aloop: Fix peer runtime UAF during format-change stop
In-Reply-To: <20260423-alsa-aloop-peer-stop-uaf-v1-1-25d8a9745f6c@gmail.com>
References: <20260423-alsa-aloop-peer-stop-uaf-v1-1-25d8a9745f6c@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[8fa95c41eafbc9d2ff6f];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

On Thu, 23 Apr 2026 05:22:22 +0200,
Cássio Gabriel wrote:
> 
> loopback_check_format() may stop the capture side when playback starts
> with parameters that no longer match a running capture stream. Commit
> 826af7fa62e3 ("ALSA: aloop: Fix racy access at PCM trigger") moved
> the peer lookup under cable->lock, but the actual snd_pcm_stop() still
> runs after dropping that lock.
> 
> A concurrent close can clear the capture entry from cable->streams[] and
> detach or free its runtime while the playback trigger path still holds a
> stale peer substream pointer.
> 
> Keep a per-cable count of in-flight peer stops before dropping
> cable->lock, make free_cable() wait for those stops before detaching the
> runtime, and take the peer stream lock around snd_pcm_stop(). This
> preserves the existing behavior while making the peer runtime lifetime
> explicit.
> 
> Reported-by: syzbot+8fa95c41eafbc9d2ff6f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=8fa95c41eafbc9d2ff6f
> Fixes: 597603d615d2 ("ALSA: introduce the snd-aloop module for the PCM loopback")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
>  sound/drivers/aloop.c | 56 ++++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 40 insertions(+), 16 deletions(-)
> 
> diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
> index aa0d2fcb1a18..a997ee262740 100644
> --- a/sound/drivers/aloop.c
> +++ b/sound/drivers/aloop.c
> @@ -99,6 +99,9 @@ struct loopback_ops {
>  struct loopback_cable {
>  	spinlock_t lock;
>  	struct loopback_pcm *streams[2];
> +	/* in-flight peer stops running outside cable->lock */
> +	atomic_t stop_count;
> +	wait_queue_head_t stop_wait;
>  	struct snd_pcm_hardware hw;
>  	/* flags */
>  	unsigned int valid;
> @@ -337,10 +340,10 @@ static bool is_access_interleaved(snd_pcm_access_t access)
>  static int loopback_check_format(struct loopback_cable *cable, int stream)
>  {
>  	struct loopback_pcm *dpcm_play, *dpcm_capt;
> +	struct loopback_pcm *stop_dpcm = NULL;
>  	struct snd_pcm_runtime *runtime, *cruntime;
>  	struct loopback_setup *setup;
>  	struct snd_card *card;
> -	bool stop_capture = false;
>  	int check;
>  
>  	scoped_guard(spinlock_irqsave, &cable->lock) {
> @@ -366,8 +369,11 @@ static int loopback_check_format(struct loopback_cable *cable, int stream)
>  				return 0;
>  			if (stream == SNDRV_PCM_STREAM_CAPTURE)
>  				return -EIO;
> -			else if (cruntime->state == SNDRV_PCM_STATE_RUNNING)
> -				stop_capture = true;
> +			else if (cruntime->state == SNDRV_PCM_STATE_RUNNING) {
> +				/* close must not free the peer runtime below */
> +				atomic_inc(&cable->stop_count);
> +				stop_dpcm = dpcm_capt;
> +			}
>  		}
>  
>  		setup = get_setup(dpcm_play);
> @@ -396,8 +402,18 @@ static int loopback_check_format(struct loopback_cable *cable, int stream)
>  		}
>  	}
>  
> -	if (stop_capture)
> -		snd_pcm_stop(dpcm_capt->substream, SNDRV_PCM_STATE_DRAINING);
> +	if (stop_dpcm) {
> +		struct snd_pcm_substream *stop_substream = stop_dpcm->substream;
> +		unsigned long flags;
> +
> +		snd_pcm_stream_lock_irqsave_nested(stop_substream, flags);
> +		if (stop_substream->runtime && snd_pcm_running(stop_substream))
> +			snd_pcm_stop(stop_substream, SNDRV_PCM_STATE_DRAINING);
> +		snd_pcm_stream_unlock_irqrestore(stop_substream, flags);
> +
> +		if (atomic_dec_and_test(&cable->stop_count))
> +			wake_up(&cable->stop_wait);
> +	}

Do we need to complicate this handling?  IOW, can it be simply be like
below?

	if (stop_capture) {
		snd_pcm_stop(dpcm_capt->substream, SNDRV_PCM_STATE_DRAINING);
		if (atomic_dec_and_test(&cable->stop_count))
			wake_up(&cable->stop_wait);
	}


thanks,

Takashi
