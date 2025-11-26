Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8FB29C339
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 07:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764143829; cv=none; b=uYtAM5j9hlO3iC0zL+2ow8KRD/q4ncQq53MSFJ8VUCgOszBxHuGK3nhhFpZfFnRQgLnXmt/p5bvKRwXQKvg0afyVcixUPn/lqmZydUKFenIZnuye7aeLS4tZddxkMnYDKkARn8oSlW5k04dBCScjsvZks92szMC8Kt7XuydcNkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764143829; c=relaxed/simple;
	bh=XRD4oJnnSCzWWEtmvcSr7qGu7ZMWD6Vg5trz2k7tcj4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CawOaz1x81+EQZSgFFuz+Dy4aJrNHfYfxgTItmRaohpiVbTls2JM58tXLs4uBrvjDSvtU8Hlu3Jy09CunJGH9wGUFmah3YyOPDKZEN/Zz00Ido/reS1G19mn15jLTI6vy9H0IzqLCDXTpYeSDrXjdsDSwFOOi7aX9Je/NeM7zOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yZKg7oSc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=W8jCOtxE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sUPxHStU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cNrfUcGn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yZKg7oSc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W8jCOtxE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sUPxHStU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cNrfUcGn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E0F815BDB7;
	Wed, 26 Nov 2025 07:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764143826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WVCdcn1xH24x14FNH6eGUjwna+EhGD1m20rJpBZlmok=;
	b=yZKg7oScMPh+AIn4WXn0F7lbKGmwhi08bAGfqoMUlpq6p05YLXT8WZqFDhEL1ySW3lwWXi
	4MUOm+t8JQVVHiMoXk+9YAcYxU5xSu/4GwIoYMww8KtyHBfa2DrPu/3eCMuFOPq703hNoe
	87MOeSaksqyTqVUwmcH3H6NpO6u3N6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764143826;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WVCdcn1xH24x14FNH6eGUjwna+EhGD1m20rJpBZlmok=;
	b=W8jCOtxEzI7nqSUJuRpyrInNAFSBPQSQ2EAVWjD32P91ICjWG21uHosdOjwt8SOrWL45rR
	/QbivRkDcWdS4XCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sUPxHStU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cNrfUcGn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764143825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WVCdcn1xH24x14FNH6eGUjwna+EhGD1m20rJpBZlmok=;
	b=sUPxHStUyEV/s7oNzwm4+u9q2jUF8mGplExLDVh0aNWMjiV6BahL2Tw4U7Kjj2BERYmLPI
	cGG5iGNt0czsSQgYjWn8o04k4FyXpGlR8nXnW7XWlFZTaePTQ6Dw81W31whWsd2JddsjO7
	l/KNhz4dDfOj3mpPskGFDIU1EY/0Hno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764143825;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WVCdcn1xH24x14FNH6eGUjwna+EhGD1m20rJpBZlmok=;
	b=cNrfUcGnn64zsFfXil9FS2pA8R3iuEtNqomCjA431/JpTjExRI4QkuByMFoo7gGNAYSBPg
	8HKSI/4UiS2PaECQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8CC13EA63;
	Wed, 26 Nov 2025 07:57:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3U3dJ9GyJmmhOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 26 Nov 2025 07:57:05 +0000
Date: Wed, 26 Nov 2025 08:57:05 +0100
Message-ID: <87y0ntb50u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dirk Su <dirk.su@canonical.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kailang Yang <kailang@realtek.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: fix mute/micmute LEDs don't work for HP 200 G2i
In-Reply-To: <20251126025151.12332-1-dirk.su@canonical.com>
References: <20251126025151.12332-1-dirk.su@canonical.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: E0F815BDB7
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Wed, 26 Nov 2025 03:51:30 +0100,
Dirk Su wrote:
> 
> HP 200 G2i needs quirk to make mic-mute/audio-mute working.
> 
> Signed-off-by: Dirk Su <dirk.su@canonical.com>

This could be with a chained fixup instead, e.g.

	[ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO] = {
		.type = HDA_FIXUP_FUNC,
		.v.func = alc236_fixup_hp_mute_led_coefbit2,
		.chained = true,
		.chain_id = ALC236_FIXUP_HP_GPIO_LED,
	},

Care to resubmit in this style?


thanks,

Takashi

> ---
>  sound/hda/codecs/realtek/alc269.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 70299e359ba0..a8e1ec92349f 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -1656,6 +1656,13 @@ static void alc236_fixup_hp_mute_led_micmute_vref(struct hda_codec *codec,
>  	alc236_fixup_hp_micmute_led_vref(codec, fix, action);
>  }
>  
> +static void alc236_fixup_hp_mute_led_micmute_gpio(struct hda_codec *codec,
> +				const struct hda_fixup *fix, int action)
> +{
> +	alc236_fixup_hp_mute_led_coefbit2(codec, fix, action);
> +	alc236_fixup_hp_gpio_led(codec, fix, action);
> +}
> +
>  static inline void alc298_samsung_write_coef_pack(struct hda_codec *codec,
>  						  const unsigned short coefs[2])
>  {
> @@ -3790,6 +3797,7 @@ enum {
>  	ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED,
>  	ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED,
>  	ALC288_FIXUP_SURFACE_SWAP_DACS,
> +	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO,
>  };
>  
>  /* A special fixup for Lenovo C940 and Yoga Duet 7;
> @@ -5323,6 +5331,10 @@ static const struct hda_fixup alc269_fixups[] = {
>  		.type = HDA_FIXUP_FUNC,
>  		.v.func = alc236_fixup_hp_mute_led_micmute_vref,
>  	},
> +	[ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc236_fixup_hp_mute_led_micmute_gpio,
> +	},
>  	[ALC236_FIXUP_LENOVO_INV_DMIC] = {
>  		.type = HDA_FIXUP_FUNC,
>  		.v.func = alc_fixup_inv_dmic,
> @@ -6760,6 +6772,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x103c, 0x8e60, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x103c, 0x8e61, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x103c, 0x8e62, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
> +	SND_PCI_QUIRK(0x103c, 0x8ec1, "HP 200 G2i", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
>  	SND_PCI_QUIRK(0x103c, 0x8ed5, "HP EliteBook 8 Flip G2i 13", ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8ed6, "HP EliteBook 8 G2i 13", ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8ed7, "HP EliteBook 8 G2i 14", ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED),
> -- 
> 2.43.0
> 
