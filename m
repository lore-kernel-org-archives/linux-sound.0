Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2085388E6D
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 08:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773650405; cv=none; b=CIvn9oTDDCz56fucQTaQ3+9eJaMnqzvMxbCz3t2KUJbDOmStWhUPfcYN7ZEsQOrOsmuPPT4wHV+7crnpO41wvSY9E23C/Q0SVkIxQDd688KfHsgdAl5Xy2ZGBzolCMiJH1awylp3EquuANniL//irEUwGsZ0eRX/MqPc5OFDGcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773650405; c=relaxed/simple;
	bh=S8IV4zCvf1T4GLVtp/f/OBsKz6iVQF0vjQRR7TRQ0QY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ISLh1jjUMNNiYzT1if3ciqHfzheWHd4e+4pGIZJ0YiZ1wsX/WYYbaXR2SswvbWcCJT56tro6GeB1TVhpLAI0iwgX7l3A0dqOfJjxXtFfa0lHps2zV4j5RbGDeGneH6fNQAwCmb9f447yzbkZl5p6s4UrjJLLBs3SwvDfo8UE2bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iT0TAhtw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qd4l2t2p; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HElDn/At; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C3DBFsUj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iT0TAhtw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qd4l2t2p";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HElDn/At";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C3DBFsUj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F072C5BD1A;
	Mon, 16 Mar 2026 08:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773650402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SBgX+CuCTZlfjwe468uNQO0TLp1dKIhVtww3UHVw7bk=;
	b=iT0TAhtwLODB/pitu0Fr4FuqzV+ridWrPdf8npZbftXKtnMhwEvq5oIFxdrPKrCrAaHw9a
	KLnSpFpLq0pL3D5V7ZeL/EjgsnG2qzG34KdBIE3MVKRgGijmKxDIPVsOy+kDddLaNWufcf
	7ulbi5bkqlFvgrUwZL8YLodqdUTRI9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773650402;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SBgX+CuCTZlfjwe468uNQO0TLp1dKIhVtww3UHVw7bk=;
	b=qd4l2t2p4oHzPcAGXQ43IegCI7TfcGpD4T7tT5c6eGnYDXmEoVtJGwqLcvHrO9a1JF6NK0
	jy6z/9kLRhPJJiCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773650401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SBgX+CuCTZlfjwe468uNQO0TLp1dKIhVtww3UHVw7bk=;
	b=HElDn/Ats7Z51gkhyqbjDJvuObBANmKU8wOS8WimXc86yzp9WpA1cXxuHPvrQ4IHOzAdBQ
	nBT2mmdsVfRklBN9yjY6gtEQpqmzypLAhzU5kZpNzQkS93KqOB2AxOXszpjC4sz/n667Sf
	XlRpYGlLkgEblSfC3rDxKjapHLvfVZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773650401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SBgX+CuCTZlfjwe468uNQO0TLp1dKIhVtww3UHVw7bk=;
	b=C3DBFsUjPSOa5MMoWiJicqzsvq3kUl/L9GeuOATU7lHZC84FC2OotzLw+DC3njb6CmfeTz
	KelaBVuBg5kI/pCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9DB0D4273B;
	Mon, 16 Mar 2026 08:40:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yd5PJeHBt2lsZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Mar 2026 08:40:01 +0000
Date: Mon, 16 Mar 2026 09:40:01 +0100
Message-ID: <87fr609nha.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	chleroy@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	r33s3n6@gmail.com,
	gality369@gmail.com,
	zhenghaoran154@gmail.com,
	hanguidong02@gmail.com,
	ziyuzhang201@gmail.com
Subject: Re: [PATCH] ALSA: pcm: oss: annotate data-races around runtime->state
In-Reply-To: <20260316030550.2848349-1-zzzccc427@gmail.com>
References: <20260316030550.2848349-1-zzzccc427@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,kernel.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO

On Mon, 16 Mar 2026 04:05:50 +0100,
Cen Zhang wrote:
> 
> __snd_pcm_set_state() writes runtime->state under the PCM stream lock:
> 
>     runtime->state = state;
> 
> However, the OSS I/O functions snd_pcm_oss_write3(), snd_pcm_oss_read3(),
> snd_pcm_oss_writev3() and snd_pcm_oss_readv3() read runtime->state
> without holding the stream lock, only holding oss.params_lock (a
> different mutex that does not synchronize with the stream lock):
> 
>     if (runtime->state == SNDRV_PCM_STATE_XRUN || ...)
> 
> Since __snd_pcm_set_state() is called from IRQ context (e.g.,
> snd_pcm_period_elapsed -> snd_pcm_update_state -> __snd_pcm_xrun ->
> snd_pcm_stop -> snd_pcm_post_stop) while the OSS read/write paths
> run in process context, these are concurrent accesses that constitute
> a data race.
> 
> The code handles stale reads gracefully through its retry loop
> (re-checking after __snd_pcm_lib_xfer returns -EPIPE), so the race
> is not harmful under simple interleaving. However, plain C accesses
> are formally undefined under LKMM, and without READ_ONCE the compiler
> is free to fuse or cache the loads across loop iterations.
> 
> Add WRITE_ONCE() in __snd_pcm_set_state() for the write side and
> READ_ONCE() on all lockless reads of runtime->state in the four OSS
> I/O functions.
> 
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Thanks for the patch.

I believe it's better not to go with barriers but rather taking the
proper spinlock, as it's only for this OSS layer, and other places are
already doing so.

That said,

- Export snd_pcm_set_state() in pcm_native.c
- Introduce snd_pcm_get_state() helper just to call like

snd_pcm_state_t snd_pcm_get_state(struct snd_pcm_substream *substream)
{
	guard(pcm_stream_lock_irqsave)(substream);
	return substream->runtime->state;
}

- Use those for setting the state in pcm_oss.c appropriately;
  some places are already in the lock, and they don't use the above.
  Also avoid calling snd_pcm_get_state() repeatedly if not needed.

Care to revise the patch and resubmit?


thanks,

Takashi
