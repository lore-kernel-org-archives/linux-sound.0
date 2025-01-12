Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E53139B;
	Sun, 12 Jan 2025 12:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736683905; cv=none; b=l7yGmXlSTug7Sj8j+Uv0WuzQJBLUbGtC+9JlXZstmpSCvXwDyWMQkJK65IR/TUtcXUPJTupY31+7CMydFyu1pyuVx/KtnBORpQh6a35OyOExnviAW+nZjQ4g8WsUCx4UYQfgmyvCESuuGAOYPyTGsqZribYZ+mOmAhTYGLb2jkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736683905; c=relaxed/simple;
	bh=Jdn4Hd/AbMLm+X0tzFIt6kZL0FsaImKrUYY7OPIxlms=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YPDUuoEd82nNfk4lVS3O1pszTL7GSP/8vWx579rc3EGxBPzrCCvzRepE70fDS+vFA4lvAXcQlpZLz9udi+Dt/w+j+wiC2/S/tOU2LOPGwXzbFdmtBtWNDhzhX3tRSA6P70LCdGbL26xachTcOyUFitTFnjfnCjaCYeh5R/G8F2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XwefsI4L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gYTM648F; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W9WH9gxl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eJtha2aG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XwefsI4L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gYTM648F";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W9WH9gxl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eJtha2aG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E89BC2117B;
	Sun, 12 Jan 2025 12:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736683901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8rBSMxzwiMW5lA+R+yGwmFsihjgID2MRN00S6Xun7Vc=;
	b=XwefsI4Lzpn6r2JdC6cOmtk7GfQhxjGKC/ubfJUu5bZOoAp27/Z/yAHy99Eznx9b+jf36K
	QYNFZLN2YW5UBYTUQajAPrBvZBPzgorRpkf8s6iABy0VfuOYjljTfLmVgug5miOOwIwN9x
	zc561cOUE/dfpb4ewz2E6RB2nKsXTog=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736683901;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8rBSMxzwiMW5lA+R+yGwmFsihjgID2MRN00S6Xun7Vc=;
	b=gYTM648FrpGaj89Zm+7tA0oIOnMUsfRwXKHqlNjz60/Y5Kwa7tAWT773uVr9KVZw1qCgoD
	wSRjT412XFG6GMBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736683900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8rBSMxzwiMW5lA+R+yGwmFsihjgID2MRN00S6Xun7Vc=;
	b=W9WH9gxlty6uMykCNM6TrSHylGiQ3xS9IW6sEjnN1ltkGa5nyYAmDhulu38KEb57yQEDzl
	8I7cLBlhWr5KJvdQbqH5LKbdKDrId8Yr1T9dMCewF1rvkqj1LP61M6k0T1yRrsTajS9zuO
	08Nl7G1BKCNh4OZwJnTX1hHutXGO94s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736683900;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8rBSMxzwiMW5lA+R+yGwmFsihjgID2MRN00S6Xun7Vc=;
	b=eJtha2aG+WvDqFdIYZu8luQRCH5rnv0MreXwVlml61zHyYlJRd1cvsIcTzCDanbfYhTqLS
	llfhOrFRWP4p6wDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A593013A86;
	Sun, 12 Jan 2025 12:11:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JZu5Jnyxg2eiBAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 12 Jan 2025 12:11:40 +0000
Date: Sun, 12 Jan 2025 13:11:40 +0100
Message-ID: <87sepo2pvn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang Yang <kailang@realtek.com>
Cc: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
    Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Shuming Fan <shumingf@realtek.com>,
	Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable PC beep passthrough for HP EliteBook 855 G7
In-Reply-To: <8be5018af1d2b26b495719b122eff0eaa1333561.1735737289.git.mail@maciej.szmigiero.name>
References: <8be5018af1d2b26b495719b122eff0eaa1333561.1735737289.git.mail@maciej.szmigiero.name>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 01 Jan 2025 14:16:05 +0100,
Maciej S. Szmigiero wrote:
> 
> PC speaker works well on this platform in BIOS and in Linux until sound
> card drivers are loaded. Then it stops working.
> 
> There seems to be a beep generator node at 0x1a in this CODEC
> (ALC269_TYPE_ALC215) but it seems to be only connected to capture mixers
> at nodes 0x22 and 0x23.
> If I unmute the mixer input for 0x1a at node 0x23 and start recording
> from its "ALC285 Analog" capture device I can clearly hear beeps in that
> recording.
> 
> So the beep generator is indeed working properly, however I wasn't able to
> figure out any way to connect it to speakers.
> 
> However, the bits in the "Passthrough Control" register (0x36) seems to
> work at least partially: by zeroing "B" and "h" and setting "S" I can at
> least make the PIT PC speaker output appear either in this laptop speakers
> or headphones (depending on whether they are connected or not).
> 
> 
> There are some caveats, however:
> * If the CODEC gets runtime-suspended the beeps stop so it needs HDA beep
> device for keeping it awake during beeping.
> 
> * If the beep generator node is generating any beep the PC beep passthrough
> seems to be temporarily inhibited, so the HDA beep device has to be
> prevented from using the actual beep generator node - but the beep device
> is still necessary due to the previous point.
> 
> * In contrast with other platforms here beep amplification has to be
> disabled otherwise the beeps output are WAY louder than they were on pure
> BIOS setup.
> 
> 
> Unless someone (from Realtek probably) knows how to make the beep generator
> node output appear in speakers / headphones using PC beep passthrough seems
> to be the only way to make PC speaker beeping actually work on this
> platform.
> 
> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>

It's a change that does handle things completely differently from the
current implementation, and it uses undocumented Realtek-specific
things, so I'd rather want comments from Realtek.

Kailang, is this feature correct and can be used safely?


thanks,

Takashi

> ---
>  include/sound/hda_codec.h     |  1 +
>  sound/pci/hda/hda_beep.c      | 15 +++++++++------
>  sound/pci/hda/patch_realtek.c | 33 ++++++++++++++++++++++++++++++++-
>  3 files changed, 42 insertions(+), 7 deletions(-)
> 
> diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
> index 575e55aa08ca..c1fe6290d04d 100644
> --- a/include/sound/hda_codec.h
> +++ b/include/sound/hda_codec.h
> @@ -195,6 +195,7 @@ struct hda_codec {
>  	/* beep device */
>  	struct hda_beep *beep;
>  	unsigned int beep_mode;
> +	bool beep_just_power_on;
>  
>  	/* widget capabilities cache */
>  	u32 *wcaps;
> diff --git a/sound/pci/hda/hda_beep.c b/sound/pci/hda/hda_beep.c
> index e51d47572557..13a7d92e8d8d 100644
> --- a/sound/pci/hda/hda_beep.c
> +++ b/sound/pci/hda/hda_beep.c
> @@ -31,8 +31,9 @@ static void generate_tone(struct hda_beep *beep, int tone)
>  			beep->power_hook(beep, true);
>  		beep->playing = 1;
>  	}
> -	snd_hda_codec_write(codec, beep->nid, 0,
> -			    AC_VERB_SET_BEEP_CONTROL, tone);
> +	if (!codec->beep_just_power_on)
> +		snd_hda_codec_write(codec, beep->nid, 0,
> +				    AC_VERB_SET_BEEP_CONTROL, tone);
>  	if (!tone && beep->playing) {
>  		beep->playing = 0;
>  		if (beep->power_hook)
> @@ -212,10 +213,12 @@ int snd_hda_attach_beep_device(struct hda_codec *codec, int nid)
>  	struct hda_beep *beep;
>  	int err;
>  
> -	if (!snd_hda_get_bool_hint(codec, "beep"))
> -		return 0; /* disabled explicitly by hints */
> -	if (codec->beep_mode == HDA_BEEP_MODE_OFF)
> -		return 0; /* disabled by module option */
> +	if (!codec->beep_just_power_on) {
> +		if (!snd_hda_get_bool_hint(codec, "beep"))
> +			return 0; /* disabled explicitly by hints */
> +		if (codec->beep_mode == HDA_BEEP_MODE_OFF)
> +			return 0; /* disabled by module option */
> +	}
>  
>  	beep = kzalloc(sizeof(*beep), GFP_KERNEL);
>  	if (beep == NULL)
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 61ba5dc35b8b..90b51aa2322d 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -28,6 +28,7 @@
>  #include <sound/hda_codec.h>
>  #include "hda_local.h"
>  #include "hda_auto_parser.h"
> +#include "hda_beep.h"
>  #include "hda_jack.h"
>  #include "hda_generic.h"
>  #include "hda_component.h"
> @@ -6924,6 +6925,29 @@ static void alc285_fixup_hp_envy_x360(struct hda_codec *codec,
>  	}
>  }
>  
> +static void alc285_fixup_hp_beep(struct hda_codec *codec,
> +				 const struct hda_fixup *fix, int action)
> +{
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		codec->beep_just_power_on = true;
> +	} else  if (action == HDA_FIXUP_ACT_INIT) {
> +#ifdef CONFIG_SND_HDA_INPUT_BEEP
> +		/*
> +		 * Just enable loopback to internal speaker and headphone jack.
> +		 * Disable amplification to get about the same beep volume as
> +		 * was on pure BIOS setup before loading the driver.
> +		 */
> +		alc_update_coef_idx(codec, 0x36, 0x7070, BIT(13));
> +
> +		snd_hda_enable_beep_device(codec, 1);
> +
> +#if !IS_ENABLED(CONFIG_INPUT_PCSPKR)
> +		codec_warn(codec, "enable CONFIG_INPUT_PCSPKR to get PC beeps\n")
> +#endif
> +#endif
> +	}
> +}
> +
>  /* for hda_fixup_thinkpad_acpi() */
>  #include "thinkpad_helper.c"
>  
> @@ -7683,6 +7707,7 @@ enum {
>  	ALC285_FIXUP_HP_GPIO_LED,
>  	ALC285_FIXUP_HP_MUTE_LED,
>  	ALC285_FIXUP_HP_SPECTRE_X360_MUTE_LED,
> +	ALC285_FIXUP_HP_BEEP_MICMUTE_LED,
>  	ALC236_FIXUP_HP_MUTE_LED_COEFBIT2,
>  	ALC236_FIXUP_HP_GPIO_LED,
>  	ALC236_FIXUP_HP_MUTE_LED,
> @@ -9271,6 +9296,12 @@ static const struct hda_fixup alc269_fixups[] = {
>  		.type = HDA_FIXUP_FUNC,
>  		.v.func = alc285_fixup_hp_spectre_x360_mute_led,
>  	},
> +	[ALC285_FIXUP_HP_BEEP_MICMUTE_LED] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc285_fixup_hp_beep,
> +		.chained = true,
> +		.chain_id = ALC285_FIXUP_HP_MUTE_LED,
> +	},
>  	[ALC236_FIXUP_HP_MUTE_LED_COEFBIT2] = {
>  	    .type = HDA_FIXUP_FUNC,
>  	    .v.func = alc236_fixup_hp_mute_led_coefbit2,
> @@ -10348,7 +10379,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x103c, 0x8730, "HP ProBook 445 G7", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
>  	SND_PCI_QUIRK(0x103c, 0x8735, "HP ProBook 435 G7", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
>  	SND_PCI_QUIRK(0x103c, 0x8736, "HP", ALC285_FIXUP_HP_GPIO_AMP_INIT),
> -	SND_PCI_QUIRK(0x103c, 0x8760, "HP", ALC285_FIXUP_HP_MUTE_LED),
> +	SND_PCI_QUIRK(0x103c, 0x8760, "HP EliteBook 8{4,5}5 G7", ALC285_FIXUP_HP_BEEP_MICMUTE_LED),
>  	SND_PCI_QUIRK(0x103c, 0x876e, "HP ENVY x360 Convertible 13-ay0xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
>  	SND_PCI_QUIRK(0x103c, 0x877a, "HP", ALC285_FIXUP_HP_MUTE_LED),
>  	SND_PCI_QUIRK(0x103c, 0x877d, "HP", ALC236_FIXUP_HP_MUTE_LED),
