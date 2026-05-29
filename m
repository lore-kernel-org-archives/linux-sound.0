Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A673BC685
	for <linux-sound@vger.kernel.org>; Fri, 29 May 2026 09:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780045298; cv=none; b=EfLz/gMcisk0BIXIl0y6ywc1VGGBmZ9BvRIiWPmSiTfHujiPGzw56fsBVE7cN5yOkPjfGmh5Wd++K7U2e2g/pj7/8SyJzfD1kH82y+iusq+Wb0k+piIw6oH3Dlmh7JsYgZ0go1qbrqfHPGxrFFtg/Y4LSnEq615Q1irb2u6wB7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780045298; c=relaxed/simple;
	bh=ihdcukkPRZ+Q3bMLKR0mcxgWglBkSG/giICS17S/T+s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A0dkzVIpqFIcq6lpKqY56+hgiDsJ5pRVF4yS+m2yJ+9bttFKnrfyCSeoxh6mb/ZDI8+V1gBqdR88/fZJEwu3gWzk6JHRrSe1RZrP9MRlQAWdDZxNFsflVMpLWVNFUTLEQKCaHGk3fcm8S+mpDKO/LwLHLWlluMWY20XnBwu8AMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gSTXjfTv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BFSH+pRF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tqQ9Tvv1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1eQgXN4d; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gSTXjfTv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BFSH+pRF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tqQ9Tvv1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1eQgXN4d"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 506D06A927;
	Fri, 29 May 2026 09:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780045292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YWXbALwRq2CXSyf5+Jss4dRwtlgrosd30LcTZTcL4Zk=;
	b=gSTXjfTv271fADy4aXMitZrpU0Qz1NkhiApLLKUrJMeL9Oka8bETtQ1PRUYOQ6I6wp0ohD
	br+OdF3baLxuZMEXpEmml4ZSuSypKKk+nswAdbxTxG5DVnLXLOb99Ogg2DxGMtEv+FAo/T
	9J/Bu7XB4Q0J/ZF6GJ3zx167IxBJ5GU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780045292;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YWXbALwRq2CXSyf5+Jss4dRwtlgrosd30LcTZTcL4Zk=;
	b=BFSH+pRF48u0qfGbElEY2eCLaZo2zQcqPkk2puy8+uaL1QCKZ/dn43o9O3AWnMYfv/ooan
	KJIcEbrmUBr2iyCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780045290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YWXbALwRq2CXSyf5+Jss4dRwtlgrosd30LcTZTcL4Zk=;
	b=tqQ9Tvv1GpzxNeDIXGpUkmjX5klm7h3DNMoDEAIwWNFDwGPer3qZeOIKHXCywiZ3jwWJKD
	Bftyalz+HGkEYIGD4VO6Uva66P5VB9O413BTuf+IzCQZejWIE4p1N6c0tOgkNcUoghzUEs
	7Pe7bh9evnHhPk/Y8qT3yW/WQq2mI6o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780045290;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YWXbALwRq2CXSyf5+Jss4dRwtlgrosd30LcTZTcL4Zk=;
	b=1eQgXN4dFwRTlcpc8PfW4utPWxu9zlBOTewbiHPslazig+cCv+HsTAMAoW+yoU6drk4eq/
	sT2+NjvDiTTUptDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B1CE779A7;
	Fri, 29 May 2026 09:01:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pNBDBepVGWqOOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 May 2026 09:01:30 +0000
Date: Fri, 29 May 2026 11:01:29 +0200
Message-ID: <87zf1ir3me.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Li Jun <lijun01@kylinos.cn>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: loongson: Fix invalid position error in ls_pcm_pointer
In-Reply-To: <20260529024830.3078886-1-lijun01@kylinos.cn>
References: <20260529024830.3078886-1-lijun01@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,kylinos.cn:email];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,kylinos.cn:email]

On Fri, 29 May 2026 04:48:30 +0200,
Li Jun wrote:
> 
> The "invalid position" error occurred when the DMA position descriptor
> returned an invalid address value (e.g., pos = -1048838144). This happened
> because the `bytes_to_frames()` function returns a signed value, but when
> `addr < runtime->dma_addr`, the subtraction produces a negative result that
> gets interpreted as a large unsigned integer in comparisons.
> 
> [   32.834431][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
> [   32.845019][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
> [   32.855588][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
> [   32.866145][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
> [   32.995394][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
> [   33.006025][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
> [   33.016748][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
> 
> Signed-off-by: Li Jun <lijun01@kylinos.cn>

Since it's a change for ASoC, use "ASoC" prefix for the subject line.

About the code change: how does this negative position come?  Is it an
utterly bogus value to be ignored, or is it a position overlap or
such?  Your change seems just ignoring and returning 0, and if it's a
spontaneous bogus value, it may lead to an unexpected jump of the PCM
position, too, for example.


thanks,

Takashi

> ---
>  sound/soc/loongson/loongson_dma.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loongson_dma.c
> index a149b643175c..f0a7065ddae7 100644
> --- a/sound/soc/loongson/loongson_dma.c
> +++ b/sound/soc/loongson/loongson_dma.c
> @@ -207,9 +207,15 @@ loongson_pcm_pointer(struct snd_soc_component *component,
>  	desc = dma_desc_save(prtd);
>  	addr = ((u64)desc->saddr_hi << 32) | desc->saddr;
>  
> -	x = bytes_to_frames(runtime, addr - runtime->dma_addr);
> -	if (x == runtime->buffer_size)
> +	if (addr < runtime->dma_addr ||
> +	    addr >= runtime->dma_addr + runtime->dma_bytes) {
>  		x = 0;
> +	} else {
> +		x = bytes_to_frames(runtime, addr - runtime->dma_addr);
> +		if (x >= runtime->buffer_size)
> +			x = 0;
> +	}
> +
>  	return x;
>  }
>  
> -- 
> 2.25.1
> 
