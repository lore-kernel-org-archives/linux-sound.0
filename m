Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3138313B58C
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 13:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719235144; cv=none; b=rzUS7NIyOKcYoXn+me+xcpqoe1OStX/N/cHmww7zOFKjeeY9xyzy9EYnUSvb5fdMCpIUZQrXckbZaTJ51Ww55B46Rg9bi17i8lt9lRwx/MC1J0kWWEXTdhFRA7MuqUIMKwHQwb7QhGo2c/WRCqIn/KZ9xzw+T2G754mfCwiUAOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719235144; c=relaxed/simple;
	bh=/lg4w/u30/y0cW3cBU/n6NLe6D90qmz66nHz3Vk0kes=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VDwPiXte+M9olvoycaJ9Lj8figsUT9CakkXlCq8Wi820dIVOBB6s61m1oEsb3Z2S+wwCoM4kqT1Uz1eW8GXgSL8YBLhyQR3kQ56RvjTQcaKceINgCyMq03ivYJIZerq3ec5obQ5qEbqOc4C5K2MpNBdkwBszYYfszYne3lC1c/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uSQrL2Ll; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2mvXowms; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hPPBmTl5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UFCi9pBj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uSQrL2Ll";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2mvXowms";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hPPBmTl5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UFCi9pBj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7E1EA219C5;
	Mon, 24 Jun 2024 13:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719235137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8IfgDqNK+VPoILXST+Rj/eqSWuPZs3BzIJgRcMXSlIQ=;
	b=uSQrL2Ll1rFQ3rtCVLUCp+eSeXdg/JfMUGC6j5cQBRdH1za5MzrLObm0R4q/j2opaPn3xa
	RU8hDmZeN6XOoLaQ8s9AVkRqTR22LoI2BvgH8+SmXGT2dVKSz9YfJY1bnherqSou77uqyR
	RTj1aHLhUw4hmYim8c1fPeUAfYtSMfY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719235137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8IfgDqNK+VPoILXST+Rj/eqSWuPZs3BzIJgRcMXSlIQ=;
	b=2mvXowmsiZzHAURq8LxQNbHh5RQNaG5f2r9EznkaovqNoHf7HkJ9dpcu6iZ8MhSV2vGzR8
	1XfI3GREnSCPeLDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hPPBmTl5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UFCi9pBj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719235136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8IfgDqNK+VPoILXST+Rj/eqSWuPZs3BzIJgRcMXSlIQ=;
	b=hPPBmTl5SFI+2oViEW9e0y6/+bW9aCTqd6vm79rYqX6XpYnjEZsneaq8AXcAL/V+rcsfE+
	Z/IDS8ol65C2VEQqinF5s1I2UVkfi06tReCuHp2uya394KdC44pL5ECObbyi1HEXiY33Oh
	g6GGPLp8KaxSXNbD8Y6sndPzgUTx7xM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719235136;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8IfgDqNK+VPoILXST+Rj/eqSWuPZs3BzIJgRcMXSlIQ=;
	b=UFCi9pBj4YX2p2LwQsmzp2h/7h4DcltiOuABxXnK6BaJIbczvtptCQsILzH7I3NHPHWRVx
	ol3OhWc0hTGsx3Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F24113AA4;
	Mon, 24 Jun 2024 13:18:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /jA3DkByeWZFcgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 24 Jun 2024 13:18:56 +0000
Date: Mon, 24 Jun 2024 15:19:24 +0200
Message-ID: <878qyupjfn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc:<linux-sound@vger.kernel.org>,	Takashi Iwai <tiwai@suse.de>,	Mark Brown
 <broonie@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,	Nicolas
 Dufresne <nicolas@ndufresne.ca>,	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3] ALSA: compress_offload: introduce passthrough operation mode
In-Reply-To: <20240621164915.410946-1-perex@perex.cz>
References: <20240621164915.410946-1-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 7E1EA219C5
X-Spam-Score: -2.01
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.de,kernel.org,gmail.com,ndufresne.ca,linux.intel.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Fri, 21 Jun 2024 18:49:15 +0200,
Jaroslav Kysela wrote:
>  /**
>   * struct snd_compr_runtime: runtime stream description
>   * @state: stream state
> @@ -54,6 +70,11 @@ struct snd_compr_runtime {
>  	dma_addr_t dma_addr;
>  	size_t dma_bytes;
>  	struct snd_dma_buffer *dma_buffer_p;
> +
> +	u32 active_tasks;
> +	u32 total_tasks;
> +	u64 task_seqno;
> +	struct list_head tasks;

Those new fields deserve for some more comments (at least mentioning
that those are for passthrough operations).

> --- a/sound/core/Kconfig
> +++ b/sound/core/Kconfig
> @@ -59,6 +59,10 @@ config SND_CORE_TEST
>  config SND_COMPRESS_OFFLOAD
>  	tristate
>  
> +config SND_COMPRESS_PASSTHROUGH
> +	select DMA_BUF
> +	tristate

I suppose this is a boolean?

> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
(snip)
> @@ -85,6 +92,8 @@ static int snd_compr_open(struct inode *inode, struct file *f)
>  		dirn = SND_COMPRESS_PLAYBACK;
>  	else if ((f->f_flags & O_ACCMODE) == O_RDONLY)
>  		dirn = SND_COMPRESS_CAPTURE;
> +	else if ((f->f_flags & O_ACCMODE) == O_RDWR)
> +		dirn = SND_COMPRESS_PASSTHROUGH;
>  	else
>  		return -EINVAL;

Shouldn't it be safer to give an error for a RW access unless the
driver supports the passthrough mode?

> @@ -939,6 +988,262 @@ static int snd_compr_partial_drain(struct snd_compr_stream *stream)
>  	return snd_compress_wait_for_drain(stream);
>  }
>  
> +#if IS_ENABLED(CONFIG_SND_COMPRESS_PASSTHROUGH)
> +
> +static struct snd_compr_task_runtime *
> +		snd_compr_find_task(struct snd_compr_stream *stream, __u64 seqno)

Please fix indentation.

> +void snd_compr_task_finished(struct snd_compr_stream *stream,
> +			    struct snd_compr_task_runtime *task)
> +{
> +	guard(mutex)(&stream->device->lock);
> +	if (!snd_BUG_ON(stream->runtime->active_tasks == 0))
> +		stream->runtime->active_tasks--;
> +	task->state = SND_COMPRESS_TASK_STATE_FINISHED;
> +	wake_up(&stream->runtime->sleep);
> +}
> +EXPORT_SYMBOL(snd_compr_task_finished);

Let's use EXPORT_SYMBOL_GPL() for a new function.


thanks,

Takashi
