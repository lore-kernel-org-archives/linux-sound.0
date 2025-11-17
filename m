Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67B22580FB
	for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 16:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763396408; cv=none; b=BfJOf6qO2RFxiD390o2354R/HXk1N0R4saRXBDK0NHbZDMXa5db5AoR7O0jmVqfgE0/Ku/DSWugJ1FECBsdicpwIL9NIoZc/q4c/dnsY1OH+/2Dc2WT78VbZePL1jX4m41wnx6xbt+c2uCutrV2RmJPan1sl8jxmFq3zb+jISr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763396408; c=relaxed/simple;
	bh=Bqv1uWn8ei5vhhX9kaeqP/GqRMrjO63Sh/648vBNmq8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m7KDxbiKWuFn8HKqmYC3ldst8811WKPCcv2nLQI/uWXG55cu8tYmkyJWey5sZREuQwiCfKDOWr3WDi2DQftRVcvUtCDM52jF4dwdniGZKmLImi+F5YseDpuWBKEVRqkg0y0dP3mjK0vIVMvIMhj1V1pBw7smzHDEbuOSu27/1+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qfli39DL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=laoac2C1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v53dmUTd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zA57kq+6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qfli39DL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="laoac2C1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v53dmUTd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zA57kq+6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BABBB211EF;
	Mon, 17 Nov 2025 16:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763396404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgoOGXXWwlh0NmjdQ+n/7PGptKdIexuZo3jsyTwYQhU=;
	b=qfli39DLN/xm8cM9rlMocB3UR8AIN5Htepji5WfbSSpLG/ugdHgvpoS1C+pYEwSDjt6AXS
	HnXFWrpaLHsu+4GvmMkb8nk2a07fQwpe7Zajh6OGYUtVQMkf6L/F6OjffUf3fcGn8s67WC
	gf4NK8y1Wh/qJdzoUq5r4+irzXiXPnQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763396404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgoOGXXWwlh0NmjdQ+n/7PGptKdIexuZo3jsyTwYQhU=;
	b=laoac2C10Cio+OT3N2w0jcWj8LmTAVz6BQqN2uu/19Rhixg5ukqiR5g/7MRNluNp6rfUzW
	8Uyf1yaoRt1QOmCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=v53dmUTd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zA57kq+6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763396403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgoOGXXWwlh0NmjdQ+n/7PGptKdIexuZo3jsyTwYQhU=;
	b=v53dmUTdCd+TI93zCJEMEiKA2oRV5LYne+HuW4Gyu3fe0JTQQvzIuk30LMtGYT1JClvMh7
	jpjL+KfzVvzOULQM9pNwDGNwOg3s0TysobQhUFKln/wBysl2iBmugEN2HcKVCDminYGJgQ
	QKAbZ3Dt+mFddfNKBirKb7bKgiEsTy8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763396403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgoOGXXWwlh0NmjdQ+n/7PGptKdIexuZo3jsyTwYQhU=;
	b=zA57kq+6cbRSku3buP3L2pNrlXyh/9Vjua+3blfM0n//SkCQ5shKFAK5/ThLNc+W+NgrMU
	A5hfm7GyqUJmUpBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 973483EA61;
	Mon, 17 Nov 2025 16:20:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TgK9IzNLG2mgHAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Nov 2025 16:20:03 +0000
Date: Mon, 17 Nov 2025 17:20:03 +0100
Message-ID: <87ikf8fx70.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Kailang Yang <kailang@realtek.com>
Subject: Re: [PATCH] fixup realtek/alc288 headphone for MS Surface 2, 3 and 
In-Reply-To: <20251116.162633.1272923634893984527.rene@exactco.de>
References: <20251116.162633.1272923634893984527.rene@exactco.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: BABBB211EF
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

On Sun, 16 Nov 2025 16:26:33 +0100,
René Rebe wrote:
> 
> The Surface Pro 2 and 3 have a strage frequency response and miss most
> of the bass. I discovered connecting the HP out to the main DAC fixes
> this.  Maybe the other is mono or whatever strangely mixed signal for
> the built-in speakers?
> 
> I later noticed the Lenovo Ideapad 720S (AMD) exhibited the same
> problem, so this may be a more wide-spread general bug w/ Realtek
> codecs and the hda_auto_parser, ...

Usually in a case like this, we provide a fixed wiring by a static DAC
table, or do some other tricks instead of directly writing a verb.

Could you give the alsa-info.sh outputs from those?


thanks,

Takashi


> 
> Signed-off-by: René Rebe <rene@exactco.de>
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 4aec5067c59d..81ac86b65796 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -2259,6 +2259,17 @@ static void alc282_fixup_asus_tx300(struct hda_codec *codec,
>  	}
>  }
>  
> +static void alc288_fixup_headset(struct hda_codec *codec,
> +				 const struct hda_fixup *fix, int action)
> +{
> +	if (action == HDA_FIXUP_ACT_INIT) {
> +		/* Surface Pro? */
> +		int nid = codec->core.vendor_id == 0x10ec0280 ? 0x15 : 0x21;
> +		/* DAC node 0x0c is giving low bass output, reverse default order. */
> +		snd_hda_codec_write(codec, nid, 0, AC_VERB_SET_CONNECT_SEL, 1);
> +	}
> +}
> +
>  static void alc290_fixup_mono_speakers(struct hda_codec *codec,
>  				       const struct hda_fixup *fix, int action)
>  {
> @@ -3483,6 +3495,7 @@ enum {
>  	ALC283_FIXUP_SENSE_COMBO_JACK,
>  	ALC282_FIXUP_ASUS_TX300,
>  	ALC283_FIXUP_INT_MIC,
> +	ALC288_FIXUP_HEADSET,
>  	ALC290_FIXUP_MONO_SPEAKERS,
>  	ALC290_FIXUP_MONO_SPEAKERS_HSJACK,
>  	ALC290_FIXUP_SUBWOOFER,
> @@ -4245,6 +4258,10 @@ static const struct hda_fixup alc269_fixups[] = {
>  		.chained = true,
>  		.chain_id = ALC269_FIXUP_LIMIT_INT_MIC_BOOST
>  	},
> +	[ALC288_FIXUP_HEADSET] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc288_fixup_headset,
> +	},
>  	[ALC290_FIXUP_SUBWOOFER_HSJACK] = {
>  		.type = HDA_FIXUP_PINS,
>  		.v.pins = (const struct hda_pintbl[]) {
> @@ -6872,6 +6889,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x10ec, 0x12cc, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
>  	SND_PCI_QUIRK(0x10ec, 0x12f6, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
>  	SND_PCI_QUIRK(0x10f7, 0x8338, "Panasonic CF-SZ6", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
> +	SND_PCI_QUIRK(0x1414, 0x9c20, "Microsoft Surface Pro 2/3", ALC288_FIXUP_HEADSET),
>  	SND_PCI_QUIRK(0x144d, 0xc109, "Samsung Ativ book 9 (NP900X3G)", ALC269_FIXUP_INV_DMIC),
>  	SND_PCI_QUIRK(0x144d, 0xc169, "Samsung Notebook 9 Pen (NP930SBE-K01US)", ALC298_FIXUP_SAMSUNG_AMP),
>  	SND_PCI_QUIRK(0x144d, 0xc176, "Samsung Notebook 9 Pro (NP930MBE-K04US)", ALC298_FIXUP_SAMSUNG_AMP),
> @@ -7053,6 +7071,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x17aa, 0x3801, "Lenovo Yoga9 14IAP7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
>  	HDA_CODEC_QUIRK(0x17aa, 0x3802, "DuetITL 2021", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
>  	SND_PCI_QUIRK(0x17aa, 0x3802, "Lenovo Yoga Pro 9 14IRP8", ALC287_FIXUP_TAS2781_I2C),
> +	SND_PCI_QUIRK(0x17aa, 0x3812, "Lenovo Ideapad 720S", ALC288_FIXUP_HEADSET),
>  	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
>  	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940 / Yoga Duet 7", ALC298_FIXUP_LENOVO_C940_DUET7),
>  	SND_PCI_QUIRK(0x17aa, 0x3819, "Lenovo 13s Gen2 ITL", ALC287_FIXUP_13S_GEN2_SPEAKERS),
> 
> -- 
>   René Rebe, ExactCODE GmbH, Berlin, Germany
>   https://exactco.de | https://t2linux.com | https://rene.rebe.de
