Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B488728CF4A
	for <linux-sound@vger.kernel.org>; Wed,  5 Nov 2025 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762331568; cv=none; b=DwsYCdXIGAOOZIUWW129OlbOtGE7UbAN9kvOCNOrOz0roNZFdSWo6wXxem2sFovDLW3+661WmHqqLrzxYVThgzd9hnlJCwOHr8vUU8eq41RmfRz8LBM+EiRfN1FggN8wrXV0iFMZSSKBDHiNlCLn0Ue1v7i9AcPi5D8388ct1yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762331568; c=relaxed/simple;
	bh=QAjYnBXnSrrJMe6M2zO0ie4MCxxNgk5JhFeh2vtrI6E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ygn2sccd+xNRZ0eHseC88vt30kblZVbgEmV3ybOk9dAPyLPeiaQ7NlO5z0ebJbwR+UODvSK74ijyRkHeFcyGvQYqS1+5rwR5UVcc81oMg3uYdJeAO9DANAHkAO9mQWnicm4qDD6UTJC1lTviTi+OFkjifm69Yx6cTtWx09S5WPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tQkDRCCU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NX84hUAg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m9cOuT9L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TW+ZwJVF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tQkDRCCU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NX84hUAg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m9cOuT9L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TW+ZwJVF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D7AA221192;
	Wed,  5 Nov 2025 08:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762331564; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LSrkMh3eT4wH1RNWOuHoo9hXcCZnhq1FqATMRMZ3KEA=;
	b=tQkDRCCUBPOW14YlY0a/EBRdjUH8ikXS8apZszexeiBNNci/PgrpCEgHEytV/Qb0Co7JZv
	PFXq6OiqwADTbYM/0JwaJZM7lj1CEEjHlnjHninlb+Q/BxR50i5CB8As4JN1QUgvN0kIiq
	/+dmTLhbWJKzFXFt245VO/byUU3K7Qo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762331564;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LSrkMh3eT4wH1RNWOuHoo9hXcCZnhq1FqATMRMZ3KEA=;
	b=NX84hUAgxOkNmJgyKWPRKusUv+3hJJVRa2vvDAQtrudB4BRNupGmulYUeyPvaZ8GvgXft7
	z6LO5T/4bIOB8lAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=m9cOuT9L;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TW+ZwJVF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762331563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LSrkMh3eT4wH1RNWOuHoo9hXcCZnhq1FqATMRMZ3KEA=;
	b=m9cOuT9LeXkg/PO/1cWZ1wsMOS148x7kqoC75PBUugw97onsxoBTyh06VY8JvkG6gSFg9O
	ysjLBozIsFav36EcorOYEb9nT1Rn2LjKTOgzWF+dGHd9ZmRxH+zxlSZb4FRR3faxIAdVxH
	j/VITQBlz0iuX44dDmSJon7R68di3qc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762331563;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LSrkMh3eT4wH1RNWOuHoo9hXcCZnhq1FqATMRMZ3KEA=;
	b=TW+ZwJVFDfRkYbZWkqzJF+Ghi7wciCton/jX2U5PSTu1j18DyWcfChK400/inJua6BFStQ
	Yog6ZKxesosiCdAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E25F13699;
	Wed,  5 Nov 2025 08:32:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JZcuJasLC2mTYgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Nov 2025 08:32:43 +0000
Date: Wed, 05 Nov 2025 09:32:43 +0100
Message-ID: <87seeshob8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: moonafterrain@outlook.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuhao Jiang <danisjiang@gmail.com>
Subject: Re: [PATCH] ALSA: wavefront: Fix integer overflow in sample size validation
In-Reply-To: <SYBPR01MB7881FA5CEECF0CCEABDD6CC4AFC4A@SYBPR01MB7881.ausprd01.prod.outlook.com>
References: <SYBPR01MB7881FA5CEECF0CCEABDD6CC4AFC4A@SYBPR01MB7881.ausprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: D7AA221192
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,outlook.com:email,suse.de:mid,suse.de:dkim]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Tue, 04 Nov 2025 15:10:18 +0100,
moonafterrain@outlook.com wrote:
> 
> From: Junrui Luo <moonafterrain@outlook.com>
> 
> The wavefront_send_sample() function has an integer overflow issue
> when validating sample size. The header->size field is u32 but gets
> cast to int for comparison with dev->freemem
> 
> Fix by using unsigned comparison to avoid integer overflow.

This is not really a right fix, unfortunately.
wavefront_freemem() itself can return a negative value, and the cast
would ignore it.

A better alternative could be something like:
	if (dev->freemem < 0 || dev->freemem < header->size) {
so that the cast can be dropped to be compared as unsigned
implicitly.

Not sure whether this still triggers some warnings in the recent
compilers, though.  Need testing.


thanks,

Takashi

> 
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Reported-by: Junrui Luo <moonafterrain@outlook.com>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> ---
>  sound/isa/wavefront/wavefront_synth.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/isa/wavefront/wavefront_synth.c b/sound/isa/wavefront/wavefront_synth.c
> index cd5c177943aa..4a8c507eae71 100644
> --- a/sound/isa/wavefront/wavefront_synth.c
> +++ b/sound/isa/wavefront/wavefront_synth.c
> @@ -950,9 +950,9 @@ wavefront_send_sample (snd_wavefront_t *dev,
>  	if (header->size) {
>  		dev->freemem = wavefront_freemem (dev);
>  
> -		if (dev->freemem < (int)header->size) {
> +		if ((unsigned int)dev->freemem < header->size) {
>  			dev_err(dev->card->dev,
> -				"insufficient memory to load %d byte sample.\n",
> +				"insufficient memory to load %u byte sample.\n",
>  				header->size);
>  			return -ENOMEM;
>  		}
> -- 
> 2.51.1.dirty
> 
