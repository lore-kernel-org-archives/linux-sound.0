Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE7838F64A
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445302; cv=none; b=PVu6Y4d+y6/j8AmvlfA9HreW1rFVdWbEeKWgpOzwsOAQQNA2muOFO/fXPQuxkCS6/3RRa/LuLnxRbyYfgdnHQKiAQJG5NjFkqFJwgC4SW/x51xxZoo6zZ0GVXFd7D09+I3cF8Pjr1TJ1mHgQBJ1g6/IJU96t3zmud45D+Y6crMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445302; c=relaxed/simple;
	bh=in+cVyH68+i8C5JXpgBAsgJeCwZSzeTcViJ/Gms9VsU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LQRNtMoK/rUS1dWZM8eiIatu8K1JCRc4vCHGose51NgYf6KpzgdHznD7BKNTuyBDdi1tPXCZDRSjyVlqZxouL7IBhQ9hbpiiI1M2aE/3oLx++oXwlCUxtP6au0zu7rjh01RWuSlxWWY0tpPCBZZHfqHnQvBnNSk18OX8Ghd9J9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OTNn5IZz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vfcvPxRH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IkrOd6Xa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EHo9G4KX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OTNn5IZz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vfcvPxRH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IkrOd6Xa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EHo9G4KX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EA3483F722;
	Mon,  2 Mar 2026 09:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772445298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qjdftTPhczKxNRlTBCZWRyTeKQciJuyo83fZNyI67ns=;
	b=OTNn5IZzWCxDs8/5TBLKFuouV/WgKCu4woIPhDNtsSxBCbm1aeo3P1sY3tsKPYmuJQRPZv
	gt2sZzcHDCXxm/A34ktlmsmH0w6laj/2yWl4rooZDtbHpe0O/8sscNzKeq1a9JaY4KdOG3
	cy7XInt9sa0xLni/VyMKyVyUxWIb/hI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772445298;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qjdftTPhczKxNRlTBCZWRyTeKQciJuyo83fZNyI67ns=;
	b=vfcvPxRHaTAL9Y/Sm+MSW9G49U1AMhQrOpiOrLjAMIKuStWRxZF4qyRatBy0ECNwdrxyPW
	q/wwJe/s4E3J9XAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IkrOd6Xa;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EHo9G4KX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772445297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qjdftTPhczKxNRlTBCZWRyTeKQciJuyo83fZNyI67ns=;
	b=IkrOd6Xa0h1aculHrzGeUO4GpO9bPBPjUSbNiEqj0nIZ53Q0LbifR+G/T2Jx7V2MsiE1wt
	9tveqa1JJzVtSZos26GCHEz5x7slL2CsV0cMePaeegrh/y2dsBy+IqebEADw0z1/LoCjxR
	s1ciKGm6ueGlClegB4R/ZK1d1Snfm10=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772445297;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qjdftTPhczKxNRlTBCZWRyTeKQciJuyo83fZNyI67ns=;
	b=EHo9G4KXB0K5kFGuWxb0P9/7C9tohmPUBmPtEg+Cg9walOi9ETCgeCextAvMwOB6ShWSuE
	OcuvWe7n+5DpxgBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E3CB3EA69;
	Mon,  2 Mar 2026 09:54:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /4tzJXFepWk8DQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Mar 2026 09:54:57 +0000
Date: Mon, 02 Mar 2026 10:54:57 +0100
Message-ID: <87ms0qmu8e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	Arun Raghavan <arunr@valvesoftware.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH 4/9] ALSA: usb-audio: Support string-descriptor-based quirk table entry
In-Reply-To: <20260301213726.428505-5-i@rong.moe>
References: <20260301213726.428505-1-i@rong.moe>
	<20260301213726.428505-5-i@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: EA3483F722

On Sun, 01 Mar 2026 22:37:20 +0100,
Rong Zhang wrote:
> @@ -2558,14 +2585,69 @@ void snd_usb_apply_flag_dbg(const char *reason,
>  	}
>  }
>  
> +#define USB_STRING_SIZE 128
> +
> +static inline int snd_usb_get_strings(struct snd_usb_audio *chip,
> +				      char *manufacturer, char *product)
> +{
> +	int ret;
> +
> +	if (manufacturer) {
> +		ret = usb_string(chip->dev, chip->dev->descriptor.iManufacturer,
> +				 manufacturer, USB_STRING_SIZE);
> +		if (ret < 0) {
> +			usb_audio_warn(chip, "failed to get manufacturer string: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	if (product) {
> +		ret = usb_string(chip->dev, chip->dev->descriptor.iProduct,
> +				 product, USB_STRING_SIZE);
> +		if (ret < 0) {
> +			usb_audio_warn(chip, "failed to get product string: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 1; /* ok */
> +}
> +
>  void snd_usb_init_quirk_flags_table(struct snd_usb_audio *chip)
>  {
>  	const struct usb_audio_quirk_flags_table *p;
> +	char manufacturer[USB_STRING_SIZE];
> +	char product[USB_STRING_SIZE];

Keeping those a bit largish strings on the stack doesn't look good.
Maybe better to do kalloc with __free(kfree).

> +	int got_usb_strings = 0; /* <0: error, 0: pending, >0: ok */

I think this global flag could go wrong since...

>  	for (p = quirk_flags_table; p->id; p++) {
>  		if (chip->usb_id == p->id ||
>  		    (!USB_ID_PRODUCT(p->id) &&
>  		     USB_ID_VENDOR(chip->usb_id) == USB_ID_VENDOR(p->id))) {
> +			if (!p->usb_string_match)
> +				goto apply; /* DEVICE_FLG or VENDOR_FLG */
> +
> +			/* DEVICE_STRING_FLG or VENDOR_STRING_FLG */
> +			if (!got_usb_strings) {
> +				got_usb_strings = snd_usb_get_strings(chip,
> +					p->usb_string_match->manufacturer ? manufacturer : NULL,
> +					p->usb_string_match->product ? product : NULL);

... here you try to extract strings only once, but this retrieval
depends on the current entry.  If the current entry has only
manufacturer and the next entry has only product, it won't work.

IMO, a simpler way would be something like:

#define USB_STRING_SIZE 128

static char *snd_usb_get_string(struct snd_usb_audio *chip, int id)
{
	char *buf = kmalloc(USB_STRING_SIZE, GFP_KERNEL);
	int ret;

	if (!buf)
		return ERR_PTR(-ENOMEM);
	ret = usb_string(chip->dev, id, buf, USB_STRING_SIZE);
	if (ret < 0) {
		usb_audio_warn(chip, "failed to get string for id%d: %d\n", ret);
		kfree(buf);
		return ERR_PTR(ret);
	}
	return buf;
}

void snd_usb_init_quirk_flags_table(struct snd_usb_audio *chip)
{
	....
	char *manufacturer __free(kfree) = NULL;
	char *product __free(kfree) = NULL;

  	for (p = quirk_flags_table; p->id; p++) {
		....
		if (p->usb_string_match->manufacturer) {
			if (!manufacturer)
				manufaturer =
					snd_usb_get_string(chip,
						chip->dev->descriptor.iManufacturer);
			if (!IS_ERR_OR_NULL(manufacturer) &&
			    strcmp(p->usb_string_match->manufacturer, manufacturer))
				continue;			
		}
		if (p->usb_string_match->product) {
			if (!product)
				product =
					snd_usb_get_string(chip,
						chip->dev->descriptor.iProduct);
			if (!IS_ERR_OR_NULL(product) &&
			    strcmp(p->usb_string_match->product, product))
				continue;			
		}


thanks,

Takashi
