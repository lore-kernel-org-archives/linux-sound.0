Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94AB17E441
	for <linux-sound@vger.kernel.org>; Sun, 16 Jun 2024 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718523700; cv=none; b=QvgG17PYJymNFWEUiFZcBvPHUlmHgaDROfY8iY4o2AJbJCxzzQsCe+mEXgti5m2CmUniGnSmYO/GSy5npVuVi0GTktNlgnq96JVuKqss7vs7UmzNb7CCoqonOc/nivH7Bb6uoCkh0CLvf6O7lzeSM3Edr7omqxtBI31hDWFZN4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718523700; c=relaxed/simple;
	bh=nIsxyWqykKDdVKxfT2wfayDuamuhB9EU0JTtmeQHhiM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LJV0h4NGewEifHUB+5+wLheoaHp1a3q42ChT+6qXSUa6ISAiU7NgTZPMOgOp7i2PXv4g0lP+B6jpUy3onWrtbpvBiWQWnDmr0U7s18dc7ZRhJXMkQb7lqt68hogds+O9BPppmHxsU+7IPF0VgBe5K5pvPX6hD4AXOuDm1HLUJrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jlgTM9s4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kHcinKRY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jlgTM9s4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kHcinKRY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jlgTM9s4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kHcinKRY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jlgTM9s4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kHcinKRY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 81E9135086;
	Sun, 16 Jun 2024 07:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718523696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ux+DRWR7/beK8aORXLYkdTntHEaTou8j8PHBPD7cog=;
	b=jlgTM9s4uh4IjknNjF8zKKfh6NbuCr+l+YemZ6Dqne9ilfrdzHXis3+q3pgeVouIeRnkF2
	iQPXsWTAJuPgq4ettZOViRSkeeFQ0qVVIk17YkoEwbNVSuwKRQTDBPp0JK5Ogyz+stiSvC
	ikpTN4gJ6/va7zF7G+ZNEjsrz4wbXUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718523696;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ux+DRWR7/beK8aORXLYkdTntHEaTou8j8PHBPD7cog=;
	b=kHcinKRYwHuoIVKKoYiQpWfU53kFKqz7QZkpEQTFsA64X1kgTE1KpFqL5jyYHfERaPujWY
	g7WHKQQe04msbABg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jlgTM9s4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kHcinKRY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718523696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ux+DRWR7/beK8aORXLYkdTntHEaTou8j8PHBPD7cog=;
	b=jlgTM9s4uh4IjknNjF8zKKfh6NbuCr+l+YemZ6Dqne9ilfrdzHXis3+q3pgeVouIeRnkF2
	iQPXsWTAJuPgq4ettZOViRSkeeFQ0qVVIk17YkoEwbNVSuwKRQTDBPp0JK5Ogyz+stiSvC
	ikpTN4gJ6/va7zF7G+ZNEjsrz4wbXUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718523696;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ux+DRWR7/beK8aORXLYkdTntHEaTou8j8PHBPD7cog=;
	b=kHcinKRYwHuoIVKKoYiQpWfU53kFKqz7QZkpEQTFsA64X1kgTE1KpFqL5jyYHfERaPujWY
	g7WHKQQe04msbABg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E2FB13AB9;
	Sun, 16 Jun 2024 07:41:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id o2S0FTCXbmaiDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 16 Jun 2024 07:41:36 +0000
Date: Sun, 16 Jun 2024 09:42:00 +0200
Message-ID: <878qz55o6v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergely =?ISO-8859-1?Q?M=E9sz=E1ros?= <meszaros.gergely97@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ARP8
In-Reply-To: <c4a9dc00-880f-4d46-88db-c49b85de177f@gmail.com>
References: <c4a9dc00-880f-4d46-88db-c49b85de177f@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 81E9135086
X-Spam-Score: -4.01
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Sat, 15 Jun 2024 21:47:28 +0200,
Gergely Mészáros wrote:
> 
> From fbcfdec1bc4789f5fb5436c80fb7c085bd060dc0 Mon Sep 17 00:00:00 2001
> From: Gergely Meszaros <meszaros.gergely97@gmail.com>
> Date: Sat, 15 Jun 2024 21:29:39 +0200
> Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ARP8

Somehow this patch has been submitted in a wrong way, and it brought a
line break at the wrong place in the patch.  Usually those tags are in
the mail tags themselves.

Could you try rather with git-send-email?


thanks,

Takashi

> Similarly to other Lenovo laptops these also have a dual speaker
> setup with a shared amplifier.
> The model also seems to have a conflicting PCI SSID with the codec SSID for
> the Legion Y9000X 2022 IAH7. Only tested on the Yoga Pro 7, as I don't have
> access to the other laptop.
> 
> Signed-off-by: Gergely Meszaros <meszaros.gergely97@gmail.com>
> ---
> V1 -> V2: Use existing ALC285_FIXUP_SPEAKER2_TO_DAC1 instead of ALC287_FIXUP_YOGA_PRO_7_14ARP8_BOTH_SPK_TO_DAC2.
>           Include legion IAH7 in fixup and function name.
> 
>  sound/pci/hda/patch_realtek.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 79736c8782a3..78ab48c16b88 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -7520,6 +7520,7 @@ enum {
>  	ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1,
>  	ALC287_FIXUP_LENOVO_THKPAD_WH_ALC1318,
>  	ALC256_FIXUP_CHROME_BOOK,
> +	ALC287_FIXUP_LENOVO_14ARP8_LEGION_IAH7,
>  };
>   /* A special fixup for Lenovo C940 and Yoga Duet 7;
> @@ -7559,6 +7560,21 @@ static void alc287_fixup_lenovo_14irp8_duetitl(struct hda_codec *codec,
>  	__snd_hda_apply_fixup(codec, id, action, 0);
>  }
>  +/* Similar to above the Lenovo Yoga Pro 7 14ARP8 PCI SSID matches
> the codec SSID of the
> +   Legion Y9000X 2022 IAH7.*/
> +static void alc287_fixup_lenovo_14arp8_legion_iah7(struct hda_codec *codec,
> +					   const struct hda_fixup *fix,
> +					   int action)
> +{
> +	int id;
> +
> +	if (codec->core.subsystem_id == 0x17aa386e)
> +		id = ALC287_FIXUP_CS35L41_I2C_2; /* Legion Y9000X 2022 IAH7 */
> +	else
> +		id = ALC285_FIXUP_SPEAKER2_TO_DAC1; /* Yoga Pro 7 14ARP8 */
> +	__snd_hda_apply_fixup(codec, id, action, 0);
> +}
> +
>  /* Another hilarious PCI SSID conflict with Lenovo Legion Pro 7 16ARX8H (with
>   * TAS2781 codec) and Legion 7i 16IAX7 (with CS35L41 codec);
>   * we apply a corresponding fixup depending on the codec SSID instead
> @@ -9658,6 +9674,10 @@ static const struct hda_fixup alc269_fixups[] = {
>  		.chained = true,
>  		.chain_id = ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK,
>  	},
> +	[ALC287_FIXUP_LENOVO_14ARP8_LEGION_IAH7] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc287_fixup_lenovo_14arp8_legion_iah7,
> +	},
>  	[ALC287_FIXUP_YOGA9_14IMH9_BASS_SPK_PIN] = {
>  		.type = HDA_FIXUP_FUNC,
>  		.v.func = alc287_fixup_yoga9_14iap7_bass_spk_pin,
> @@ -10520,7 +10540,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x17aa, 0x3865, "Lenovo 13X", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x17aa, 0x3866, "Lenovo 13X", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x17aa, 0x3869, "Lenovo Yoga7 14IAL7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
> -	SND_PCI_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7", ALC287_FIXUP_CS35L41_I2C_2),
> +	SND_PCI_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7 / Yoga Pro 7 14ARP8",  ALC287_FIXUP_LENOVO_14ARP8_LEGION_IAH7),
>  	SND_PCI_QUIRK(0x17aa, 0x386f, "Legion Pro 7/7i", ALC287_FIXUP_LENOVO_LEGION_7),
>  	SND_PCI_QUIRK(0x17aa, 0x3870, "Lenovo Yoga 7 14ARB7", ALC287_FIXUP_YOGA7_14ARB7_I2C),
>  	SND_PCI_QUIRK(0x17aa, 0x3877, "Lenovo Legion 7 Slim 16ARHA7", ALC287_FIXUP_CS35L41_I2C_2),
> -- 
> 2.45.2
