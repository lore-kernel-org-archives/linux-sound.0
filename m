Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A6B3BFAEE
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 16:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786465439; cv=none; b=HdVCX8uAyHDjVJq3bHOL2WdMAODQ9CpeioWOYFjiS2mfLhaSYrLYHnyGxmJVJqHxj6N6LrXGnUACZWR9C9NYnm5M8ucec7ktKDGTxxpfTH69yZfx6WbQh6ObQHGbx58NksmodiHvZAWy2SaDsZC26Lf3fxqrNuEfwTeCEeT9DBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786465439; c=relaxed/simple;
	bh=TixUau5frqx6ET9fYcq24rrj/D71njL725gM3Q73hQo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pWpQPZJJeQDZiadlbbexf6G+K51PktsHWpRBuKw+R2UXEXdoDtW33Tkm3huXMy5lp9GFtU7JjkSD6SOF6g1W5qJYPaZIPpN8cGa/1+uDFvAvg6PzU7s/Vwgtk4la9CZ5SouUMglfv+wI3iDp9vJqTglhenEQcXDFeWu0r3Nd4x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WduvYTsZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+5ctUJep; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EAZBsi3N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DawFpsrJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WduvYTsZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+5ctUJep";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EAZBsi3N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DawFpsrJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CFEB481CB0;
	Tue, 11 Aug 2026 16:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786465432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2CaWSYbwtmGmANXFsCrsKtvmy9Hox2cFHppt4ZeSjG4=;
	b=WduvYTsZheMfWoTzoqqRcXoXEGnnCXseSlAWj6NUbEYtVP7a6tCT2GqQsbIu/qWLgagPD/
	1TxWQUnPoBsX8xikYkFDVCUBvih/SMXmAJLYJZCrqTJgCWf6kiTfHBTV45vQj156crihMF
	eLDEq9KYCiRycrX1mDJrC6DA0kzO2bc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786465432;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2CaWSYbwtmGmANXFsCrsKtvmy9Hox2cFHppt4ZeSjG4=;
	b=+5ctUJepeTt6VVDA/j4x9l1yBl4S/M0BDfcBRL24MtkBy2rBi+0mxRSPvBxgXZV1/1JIwa
	fh0k4nWCxPfHCDBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EAZBsi3N;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DawFpsrJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786465427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2CaWSYbwtmGmANXFsCrsKtvmy9Hox2cFHppt4ZeSjG4=;
	b=EAZBsi3NZ8HUQSTsVuWAGpFDwDDUlMPQaQs2iozeYvIXyAPJvJmkpiTxZxnDW8wGy0ymiI
	e6NHXmiY89KadIUVKT7H8byJvZVPPzBvnUns69fb1qncnN1TC/gnYUoSUpVnwm9U5wXBOC
	C0SH6wtUVCd77+YTJX84FKzsp8Fy/Go=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786465427;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2CaWSYbwtmGmANXFsCrsKtvmy9Hox2cFHppt4ZeSjG4=;
	b=DawFpsrJddmMy9WKdxhJdDIHZnhtGUJRNr9oABlTp2FVLz4tvRU34Jau6L8y4jdJNFAwGO
	eKetQ8Tl5GMdmzDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC499779B2;
	Tue, 11 Aug 2026 16:23:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b9S4KJNMe2r9FAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 11 Aug 2026 16:23:47 +0000
Date: Tue, 11 Aug 2026 18:23:47 +0200
Message-ID: <87ldacaang.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bramwel Barack <bramwelbarack89@gmail.com>
Cc: tiwai@suse.de,
	perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add mute LED quirk for HP 250 G8 (0x85f3)
In-Reply-To: <20260811134634.35795-1-bramwelbarack89@gmail.com>
References: <20260811134634.35795-1-bramwelbarack89@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.988];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 
X-Rspamd-Queue-Id: CFEB481CB0
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Tue, 11 Aug 2026 15:46:34 +0200,
Bramwel Barack wrote:
> 
> The HP 250 G8 Laptop PC (subsystem 103c:85f3) using the Realtek ALC236
> codec requires a specific quirk to enable the mute button LED.
> Currently, the audio mutes in software, but the physical indicator
> light remains unlit.
> 
> Adding a quirk entry to the alc236_fixup_tbl with the
> ALC236_FIXUP_HP_MUTE_LED_COEFBIT2 fixup correctly maps the
> LED to the mute state via COEF index 0x07.
> 
> Signed-off-by: Bramwel Barack <bramwelbarack89@gmail.com>
> ---
> v2:
>  - Added technical description of the COEF bit mapping.
>  - Fixed spacing error in the quirk entry.
>  - Updated mailing list to linux-sound@vger.kernel.org.

It's almost done...

> 
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 379e1458f4ac..74af2f9e26af 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7153,6 +7153,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x103c, 0x880d, "HP EliteBook 830 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8811, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
>  	SND_PCI_QUIRK(0x103c, 0x8812, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
> +	SND_PCI_QUIRK(0x103c, 0x85f3, "HP 250 G8 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>  	SND_PCI_QUIRK(0x103c, 0x881d, "HP 250 G8 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>  	SND_PCI_QUIRK(0x103c, 0x881e, "HP Laptop 15s-du3xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>  	SND_PCI_QUIRK(0x103c, 0x8846, "HP EliteBook 850 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),

The table is sorted in PCI SSID order.  Please put the new entry at
the right position.


thanks,

Takashi
