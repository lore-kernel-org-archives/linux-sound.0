Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07073009C7
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 06:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775802689; cv=none; b=C0YUvpsqlrlb/OTYJjrfhjcVnGTuPiGn6Uqa67mejgzfYWj1kRs7eLKqsS9cy0b2+w3s58zmVx7PhC8Sf33k4a1O00Q7CzabiWwP8inggSrHzkAE0mW3JIvsPrnBPAUfBgvYoKvb4KdLzS+p86YhbPEW36s4gbS7j06uvJSMo70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775802689; c=relaxed/simple;
	bh=QLe0m0hoz3rd/qnbfOlhgcbrwRWCGtZDq/B4xaL38Zs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gX8GCblHb6p9LdibSDplAg9CV3FVAKw87gEasNnOugTRzMeisg/gVd/UjuW5Lmy1nooAtZuyBfEdltnLmLjICuDDiGqVHxlIu114ZPO85C3uepiiJ5kWrZCvrCtPN2ijkEC2y1OJ3tSejTi/zA5Z08Waab/xTTKDA4tjztmcVmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zWmhhb8U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w7ZzHNYb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hk+JKPfy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KIXoJDmV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zWmhhb8U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w7ZzHNYb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hk+JKPfy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KIXoJDmV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D04CF6A7DF;
	Fri, 10 Apr 2026 06:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775802685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=COOB62QyGZwwQRplwoeshvKVJc2tDlOH8vwe004NBGE=;
	b=zWmhhb8U/T2jfiWQnJEOCvLvoyLY1MIY7W0aMy4W1licVTzNP+98PycoTT9XDNnQs+LXK9
	WX9c2rbnDQ/d3nMj9zuOAydw0LLx/BOJDipIHhYt7KDWzBtWGLO+TrzLt2nqKgQDtH9w3P
	idzB1vvskRSJCyuFIcdtAQSIqmQihCw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775802685;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=COOB62QyGZwwQRplwoeshvKVJc2tDlOH8vwe004NBGE=;
	b=w7ZzHNYbv93rfcJ+d6fCJe7z/QCr14muDoJErUiqpkp9O3jZYXcaM1UTfCkFjeHVYNW6Gg
	FryZahuVl7X04WCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Hk+JKPfy;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KIXoJDmV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775802684; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=COOB62QyGZwwQRplwoeshvKVJc2tDlOH8vwe004NBGE=;
	b=Hk+JKPfyoelr2NFUleCIEEy9Zfyp+jl2PDOLpzodwrqaBZSfHRELBwvI2ug0kqcD5mnWr2
	FMIq4F/MYTDvL0ipZeKDTTJ/ekhwu0tQABAQyHjljVZKCQ0vuqbB9CgFm1veIpGslaideH
	8mnDtafoODM86X/2hedeUs8LRSBqMkA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775802684;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=COOB62QyGZwwQRplwoeshvKVJc2tDlOH8vwe004NBGE=;
	b=KIXoJDmV1hT7ysl5sf4UkAmPp0l0CZtaHb7jgHjUB9UYU99peRMdM4MyeSRLQthByc5XHq
	DAe31aZkmuEyibAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97AA24A0B2;
	Fri, 10 Apr 2026 06:31:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id A3a3IzyZ2Gk/EAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Apr 2026 06:31:24 +0000
Date: Fri, 10 Apr 2026 08:31:24 +0200
Message-ID: <87tstjgwcj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Berk Cem Goksel <berkcgoksel@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Konovalov <andreyknvl@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] ALSA: caiaq: take a reference on the USB device in create_card()
In-Reply-To: <20260410045904.1064020-3-berkcgoksel@gmail.com>
References: <20260410045904.1064020-1-berkcgoksel@gmail.com>
	<20260410045904.1064020-3-berkcgoksel@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: D04CF6A7DF
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Fri, 10 Apr 2026 06:59:04 +0200,
Berk Cem Goksel wrote:
> 
> The caiaq driver stores a pointer to the parent USB device in
> cdev->chip.dev but never takes a reference on it. The card's
> private_free callback, snd_usb_caiaq_card_free(), can run
> asynchronously via snd_card_free_when_closed() after the USB
> device has already been disconnected and freed, so any access to
> cdev->chip.dev in that path dereferences a freed usb_device.
> 
> On top of the refcounting issue, the current card_free implementation
> calls usb_reset_device(cdev->chip.dev). A reset in a free callback
> is inappropriate: the device is going away, the call takes the
> device lock in a teardown context, and the reset races with the
> disconnect path that the callback is already cleaning up after.
> 
> Take a reference on the USB device in create_card() with
> usb_get_dev(), drop it with usb_put_dev() in the free callback,
> and remove the usb_reset_device() call.
> 
> Fixes: 523f1dce7096 ("ALSA: snd-usb-caiaq: add support for NI Audio Kontrol 1")
> Cc: stable@vger.kernel.org
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Signed-off-by: Berk Cem Goksel <berkcgoksel@gmail.com>
> ---
>  sound/usb/caiaq/device.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
> --- a/sound/usb/caiaq/device.c
> +++ b/sound/usb/caiaq/device.c
> @@ -385,7 +385,8 @@
>  	snd_usb_caiaq_input_free(cdev);
>  #endif
>  	snd_usb_caiaq_audio_free(cdev);
> -	usb_reset_device(cdev->chip.dev);
> +	if (cdev->chip.dev)
> +		usb_put_dev(cdev->chip.dev);

usb_put_dev() itself has a NULL check, so you can pass as is, too.
And, the Fixes tag is incorrect in this patch, too.


thanks,

Takashi

>  }
> 
>  static int create_card(struct usb_device *usb_dev,
> @@ -411,7 +412,7 @@
>  		return err;
> 
>  	cdev = caiaqdev(card);
> -	cdev->chip.dev = usb_dev;
> +	cdev->chip.dev = usb_get_dev(usb_dev);
>  	cdev->chip.card = card;
>  	cdev->chip.usb_id = USB_ID(le16_to_cpu(usb_dev->descriptor.idVendor),
>  				  le16_to_cpu(usb_dev->descriptor.idProduct));
