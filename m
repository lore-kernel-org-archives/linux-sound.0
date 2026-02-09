Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94C0246762
	for <linux-sound@vger.kernel.org>; Mon,  9 Feb 2026 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770629446; cv=none; b=b4a1fLk45V5o8E483ciADd0LJ4B4/dwVJHkzCl4Nu+3au7pLvYdRkFFZ7qzPJYEATqfvnX2ROCl44gp5MpNtrGcw/c0G6gKO4cZwqp95J37ylrism1LEWNch4l0Efod/ubJTW6aMEP8ZsoJW9ClloJthhn4frP78RaGLnt12aUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770629446; c=relaxed/simple;
	bh=tT1aVE8WhlWwPUqWkHIBMiYB7d9l7UeM+FbpFttWQS4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S5xQfoYBlqeyYwMnEiajdkybMHemscnqadxkpyUR3ywzspCgIt7fHtk3pgPC+REgJ3RuuIL75rFqbfDouX8hCR1ffN2LR9kHde07cr+8MFwiiiW25te7aqwiVKs9DtYM+0FA7p7OoJlchTeKgA78aBNpJD75XgPBSxxTVZTqS8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0ia8Ys9z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GukVn6/w; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0ia8Ys9z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GukVn6/w; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0ia8Ys9z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GukVn6/w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0ia8Ys9z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GukVn6/w"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 150133E6C6;
	Mon,  9 Feb 2026 09:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770629444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5eNYdioL+jOjzt3aJzFqC7sxS+lmqW7nUT5zq4/OojQ=;
	b=0ia8Ys9zfjAsDgshzrBBLafofM5uyem8tWW4vsAKFG+jH/3BYe2kE5DuZlUl3IB+yI9FIw
	9AGaLMryqRJhUT/sld+/GbBSASEWDurY2sKYCba9cJGEoVLj2gFExJExtIQ7IwnUHHw1r7
	1/NvqL21kPNahkw++GId0Cet/aHRt50=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770629444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5eNYdioL+jOjzt3aJzFqC7sxS+lmqW7nUT5zq4/OojQ=;
	b=GukVn6/wTpmE2DJVxuJ6VQFBx7Z2IaM+Hz69mTDI23k8fM0fObPlvAFNdX8Cq3aZiHKxr6
	QaP4VL3jabx9lFBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770629444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5eNYdioL+jOjzt3aJzFqC7sxS+lmqW7nUT5zq4/OojQ=;
	b=0ia8Ys9zfjAsDgshzrBBLafofM5uyem8tWW4vsAKFG+jH/3BYe2kE5DuZlUl3IB+yI9FIw
	9AGaLMryqRJhUT/sld+/GbBSASEWDurY2sKYCba9cJGEoVLj2gFExJExtIQ7IwnUHHw1r7
	1/NvqL21kPNahkw++GId0Cet/aHRt50=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770629444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5eNYdioL+jOjzt3aJzFqC7sxS+lmqW7nUT5zq4/OojQ=;
	b=GukVn6/wTpmE2DJVxuJ6VQFBx7Z2IaM+Hz69mTDI23k8fM0fObPlvAFNdX8Cq3aZiHKxr6
	QaP4VL3jabx9lFBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D24943EA63;
	Mon,  9 Feb 2026 09:30:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l80gMkOpiWmJDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Feb 2026 09:30:43 +0000
Date: Mon, 09 Feb 2026 10:30:43 +0100
Message-ID: <87fr7a2ri4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Daniel Kamil Kozar <dkk089@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC] Fix speaker/mic mute LEDs on HP OmniBook 7 AI 14-fr0220nw
In-Reply-To: <20260208174647.377444-1-dkk089@gmail.com>
References: <87wm0n7i0b.wl-tiwai@suse.de>
	<20260208174647.377444-1-dkk089@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sun, 08 Feb 2026 18:46:27 +0100,
Daniel Kamil Kozar wrote:
> 
> Thanks Takashi. Unfortunately, the codec does have the exact same SSID as
> the one already defined. Here's what I was able to come up with, it's
> basically a new SND_PCI_ macro that allows passing in the codec's vendor_id
> when matching. This also means that the FIXME: block in alc269_probe is
> no longer needed as it seems to be fixing the same problem I'm having
> (i.e. machines with duplicate PCI SSIDs).
> 
> Let me know what you think.

I don't think we need an extra macro for those rare cases.

The problem of ASUS ROG Strix G17 was that we don't know details about
TX300.  Otherwise we could use HDA_CODEC_QUIRK().

Also, in your case, we should check rather the configuration
of the existing HP Agusta, too; I guess you blindly assumed that it's
with a different codec?  If it were the very same codec chip, your
change would break another.

Stefan, do you have a reference to HP Agusta (103c:8e3b)?


thanks,

Takashi

> ---
>  sound/hda/codecs/realtek/alc269.c | 12 ++----------
>  sound/hda/common/auto_parser.c    | 14 +++++++++++---
>  sound/hda/common/hda_local.h      | 15 ++++++++++++++-
>  3 files changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index b66965a52107..b53d8ff42988 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -6821,6 +6821,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x103c, 0x8e36, "HP 14 Enstrom OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x103c, 0x8e37, "HP 16 Piston OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x103c, 0x8e3a, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
> +	SND_PCI_HDA_VENDOR_ID_QUIRK(0x103c, 0x8e3b, 0x10ec0245, "HP OmniBook 7 AI 14-fr0220nw", ALC245_FIXUP_HP_X360_MUTE_LEDS),
>  	SND_PCI_QUIRK(0x103c, 0x8e3b, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x103c, 0x8e60, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x103c, 0x8e61, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
> @@ -6857,6 +6858,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1043, 0x1032, "ASUS VivoBook X513EA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
>  	SND_PCI_QUIRK(0x1043, 0x1034, "ASUS GU605C", ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1),
>  	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
> +	SND_PCI_HDA_VENDOR_ID_QUIRK(0x1043, 0x103f, 0x10ec0294, "ASUS ROG Strix G17", HDA_FIXUP_ID_NOT_SET),
>  	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
>  	SND_PCI_QUIRK(0x1043, 0x1054, "ASUS G614FH/FM/FP", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x1043, 0x106d, "Asus K53BE", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
> @@ -8253,16 +8255,6 @@ static int alc269_probe(struct hda_codec *codec, const struct hda_device_id *id)
>  
>  	snd_hda_pick_fixup(codec, alc269_fixup_models,
>  		       alc269_fixup_tbl, alc269_fixups);
> -	/* FIXME: both TX300 and ROG Strix G17 have the same SSID, and
> -	 * the quirk breaks the latter (bko#214101).
> -	 * Clear the wrong entry.
> -	 */
> -	if (codec->fixup_id == ALC282_FIXUP_ASUS_TX300 &&
> -	    codec->core.vendor_id == 0x10ec0294) {
> -		codec_dbg(codec, "Clear wrong fixup for ASUS ROG Strix G17\n");
> -		codec->fixup_id = HDA_FIXUP_ID_NOT_SET;
> -	}
> -
>  	snd_hda_pick_pin_fixup(codec, alc269_pin_fixup_tbl, alc269_fixups, true);
>  	snd_hda_pick_pin_fixup(codec, alc269_fallback_pin_fixup_tbl, alc269_fixups, false);
>  	snd_hda_pick_fixup(codec, NULL,	alc269_fixup_vendor_tbl,
> diff --git a/sound/hda/common/auto_parser.c b/sound/hda/common/auto_parser.c
> index 8923813ce424..8369eec455bb 100644
> --- a/sound/hda/common/auto_parser.c
> +++ b/sound/hda/common/auto_parser.c
> @@ -1000,7 +1000,8 @@ hda_quirk_lookup_id(u16 vendor, u16 device, const struct hda_quirk *list)
>   * The function tries to find the matching model name at first, if given.
>   * If the model string contains the SSID alias, try to look up with the given
>   * alias ID.
> - * If nothing matched, try to look up the PCI SSID.
> + * If nothing matched, try to look up the PCI SSID, optionally matching
> + * against the codec's vendor_id too.
>   * If still nothing matched, try to look up the codec SSID.
>   */
>  void snd_hda_pick_fixup(struct hda_codec *codec,
> @@ -1065,8 +1066,15 @@ void snd_hda_pick_fixup(struct hda_codec *codec,
>  
>  	/* match primarily with the PCI SSID */
>  	for (q = quirk; q->subvendor || q->subdevice; q++) {
> -		/* if the entry is specific to codec SSID, check with it */
> -		if (!codec->bus->pci || q->match_codec_ssid) {
> +		/* if the entry is specific to vendor_id, check it first */
> +		if (q->codec_vendor_id && q->codec_vendor_id == codec->core.vendor_id) {
> +			if (codec->bus->pci && hda_quirk_match(pci_vendor, pci_device, q)) {
> +				type = "PCI SSID + codec vendor_id";
> +				goto found_device;
> +			}
> +		}
> +		/* otherwise try codec and PCI SSIDs */
> +		else if (!codec->bus->pci || q->match_codec_ssid) {
>  			if (hda_quirk_match(codec_vendor, codec_device, q)) {
>  				type = "codec SSID";
>  				goto found_device;
> diff --git a/sound/hda/common/hda_local.h b/sound/hda/common/hda_local.h
> index a7e53277a0fe..9ff7e9a89799 100644
> --- a/sound/hda/common/hda_local.h
> +++ b/sound/hda/common/hda_local.h
> @@ -297,12 +297,15 @@ struct hda_fixup {
>  /*
>   * extended form of snd_pci_quirk:
>   * for PCI SSID matching, use SND_PCI_QUIRK() like before;
> - * for codec SSID matching, use the new HDA_CODEC_QUIRK() instead
> + * for codec SSID matching, use the new HDA_CODEC_QUIRK() instead;
> + * use SND_PCI_HDA_VENDOR_ID_QUIRK() for cases with duplicated PCI SSIDs which
> + * can be distinguished based on the codec's vendor_id.
>   */
>  struct hda_quirk {
>  	unsigned short subvendor;	/* PCI subvendor ID */
>  	unsigned short subdevice;	/* PCI subdevice ID */
>  	unsigned short subdevice_mask;	/* bitmask to match */
> +	unsigned int codec_vendor_id;	/* codec's vendor_id if nonzero */
>  	bool match_codec_ssid;		/* match only with codec SSID */
>  	int value;			/* value */
>  #ifdef CONFIG_SND_DEBUG_VERBOSE
> @@ -320,6 +323,16 @@ struct hda_quirk {
>  			.match_codec_ssid = true }
>  #endif
>  
> +#ifdef CONFIG_SND_DEBUG_VERBOSE
> +#define SND_PCI_HDA_VENDOR_ID_QUIRK(vend, dev, codec_vend_id, xname, val) \
> +	{ _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
> +			.codec_vendor_id = (codec_vend_id) }
> +#else
> +#define SND_PCI_HDA_VENDOR_ID_QUIRK(vend, dev, codec_vend_id, xname, val) \
> +	{ _SND_PCI_QUIRK_ID(vend, dev), .value = (val), \
> +			.codec_vendor_id = (codec_vend_id) }
> +#endif
> +
>  struct snd_hda_pin_quirk {
>  	unsigned int codec;             /* Codec vendor/device ID */
>  	unsigned short subvendor;	/* PCI subvendor ID */
> -- 
> 2.53.0
> 
