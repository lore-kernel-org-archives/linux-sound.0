Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094481;
	b=KzdySohzyxBKD53ntcgtPcqrzoeeH8mEOPTcska8emzYVmuGxc71gBxZywnKeEz//Wm7
	 0QscPBBZsU+bHGS5S/hDIPTgbSHowh24+fVL/YMWu86Bz5MK9SHI/Qiq9E1xR+PD01X0G
	 tad+SJOBqkHXi3Od3sHWIueWZFGQX35mcQkDjL2ORhLkgNuEZWRi45unBNDYWKB3pwdpt
	 MbCmqSfcHIRCAJqAGBxkw/RvY+ydpkPK07tOc7RWUHaO5YeTEmvciFZ6KORqnWRPetf/i
	 5VVke1Mm5z7nV2xn6Hk7ThFfWAda0Nfc5jcaWNul8nWLlH3zptOMFt71IKQwQqdT1ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094481;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=X71F9aomz2oT0n/uWeHa0NTM47OLySlW4wr9THFT3MI=;
	b=qtHmOtfTggnplTO4ox/DJq2JIIHPjI3TDaavTAvs0Hz2MatRhREXImS/k+8LY25z2DQW
	 NheeRjAB58/2TEhTBGrtGXnYybVWcaRSVF36iYmvvohG/05wZ2aNW8t1OR+Ij7qbkTCtW
	 X+Ksjq/hoGX47JCVthBWEP3j7x9hyAidHbQgZkZSwSTq+n0QkunsAxhfIRHoGiJCZN5uQ
	 9BR0n/x6auJ3NFtaUxLQRMvjMPHGHb1Du+1AG9Gm+pmhioAeaCzJCohW/GvjI7l5ynpO6
	 uPFsEcD3j5xjBZhabZkmNE7qUWQu39HiTa4JnaRX50HsTWTxsFB/l5eJyMEaZm6VteA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=a92EM0VH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IJfrpMQR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=a92EM0VH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IJfrpMQR;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3E9606A324
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 13:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD3E9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=a92EM0VH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IJfrpMQR;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=a92EM0VH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IJfrpMQR
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D72391F88B
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 13:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795094478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X71F9aomz2oT0n/uWeHa0NTM47OLySlW4wr9THFT3MI=;
	b=a92EM0VHNp/EbLegaJx2wc4jlB3tvSVYsj3HC/Eji7ISb1pO973HLWRis6DQ7SwUrHDt90
	ayFCKjLqaupk6w3sVcN20Om2KnZFz6ZhX3sXVsBWJfItSpCdXT85ummajois9Xb19q3NnW
	dEVArtaKVOFLzstvLUMIxYFAsxWc6Zk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795094478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X71F9aomz2oT0n/uWeHa0NTM47OLySlW4wr9THFT3MI=;
	b=IJfrpMQRT92ZKk3tmlhrXd5LoRoOy78Gf/uhi+PSGyDHKB+6n+xancqU7gVumvxMdXeWNL
	8UpS9K6acXVyrQAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=a92EM0VH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IJfrpMQR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795094478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X71F9aomz2oT0n/uWeHa0NTM47OLySlW4wr9THFT3MI=;
	b=a92EM0VHNp/EbLegaJx2wc4jlB3tvSVYsj3HC/Eji7ISb1pO973HLWRis6DQ7SwUrHDt90
	ayFCKjLqaupk6w3sVcN20Om2KnZFz6ZhX3sXVsBWJfItSpCdXT85ummajois9Xb19q3NnW
	dEVArtaKVOFLzstvLUMIxYFAsxWc6Zk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795094478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X71F9aomz2oT0n/uWeHa0NTM47OLySlW4wr9THFT3MI=;
	b=IJfrpMQRT92ZKk3tmlhrXd5LoRoOy78Gf/uhi+PSGyDHKB+6n+xancqU7gVumvxMdXeWNL
	8UpS9K6acXVyrQAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A30111334C
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 13:21:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bWBYIM73/mr/QQAAD6G6ig
	(envelope-from <tiwai@suse.de>)
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 13:21:18 +0000
Date: Thu, 19 Nov 2026 14:21:18 +0100
Message-ID: <87mrr5ufch.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ALSA: pcm: Avoid hw_params/hw_refine changes during PCM buffer access
In-Reply-To: <sashiko-outbox-223115@kernel.org>
References: <20261119122356.2134523-1-tiwai@suse.de>
	<20261119122356.2134523-4-tiwai@suse.de>
	<sashiko-outbox-223115@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-sound@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: D72391F88B

On Thu, 19 Nov 2026 13:46:04 +0100,
sashiko-bot@kernel.org wrote:
> 
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] ALSA: pcm: missing buffer access gate in xferi frame ioctl
>   handlers
> --
> 
> commit 1d0a5a9306bc1367f12d8e1ee79c3cdcad53aa1b
> Author: Takashi Iwai <tiwai@suse.de>
> 
> ALSA: pcm: Avoid hw_params/hw_refine changes during PCM buffer access
> 
> This commit acquires the PCM buffer access gate at the entry of the
> non-interleaved frame transfer ioctls and PCM read/write file operations
> to prevent concurrent hw_params or hw_free updates while accessing
> runtime state.
> 
> > diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> > index 7d5e662b219bd..d028f03369e74 100644
> > --- a/sound/core/pcm_native.c
> > +++ b/sound/core/pcm_native.c
> > @@ -3434,6 +3434,9 @@ static int snd_pcm_xfern_frames_ioctl(struct snd_pcm_substream *substream,
> >  	void *bufs __free(kfree) = NULL;
> >  	snd_pcm_sframes_t result;
> >  
> > +	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
> > +	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
> > +		return -EBUSY;
> >  	if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_OPEN)
> >  		return -EBADFD;
> >  	if (runtime->channels > 128)
> 
> [Severity: Medium]
> Should snd_pcm_xferi_frames_ioctl() and snd_pcm_ioctl_xferi_compat() also
> acquire the buffer access gate with SND_PCM_BUFFER_ACQUIRE()?
> 
> __snd_pcm_lib_xfer() only calls snd_pcm_buffer_access_get() inside its
> inner transfer loop around writer().  Until then, a concurrent
> snd_pcm_hw_free() or snd_pcm_hw_params() can free runtime->dma_area
> before transitioning runtime->state to SNDRV_PCM_STATE_OPEN, causing
> pcm_sanity_check() to hit snd_BUG_ON(!substream->ops->copy &&
> !runtime->dma_area), or modify runtime->access, runtime->channels and
> other runtime parameters while __snd_pcm_lib_xfer() validates them or
> sleeps in wait_for_avail():
> 
> CPU0                                  CPU1
> snd_pcm_xferi_frames_ioctl()
>   snd_pcm_get_state() != OPEN
>                                       snd_pcm_hw_free()
>                                         snd_pcm_buffer_access_lock()
>                                         substream->ops->hw_free()
>                                           runtime->dma_area = NULL
>   snd_pcm_lib_write()
>     __snd_pcm_lib_xfer()
>       pcm_sanity_check()
>         snd_BUG_ON(!substream->ops->copy &&
>                    !runtime->dma_area)  <-- WARN / race
>                                         runtime->state = SNDRV_PCM_STATE_OPEN
> 

FWIW, the bug targeted by this patch is rather the runtime parameter
evaluation in snd_pcm__xfern_frames_ioctl and its compat version, and
others are just for a bit more safety.  The suggested issue is rather
a pre-existing thing and maybe handled better in another patch to
restructure the state change check in the read/write operations.


Takashi
