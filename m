Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C3235A3A4
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 11:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781609275; cv=none; b=BUlRoeK/wB3hz9d+YIa+ER3FXEvi6QwD0Svdn9i/LrdH4vo6gCzvwoavKlAXHvI3hWWa/aTG1Ib8cvD3WJgpEnsRZk6rr0H7Hm0L0ynEuAf852Ji/7qeSC8IVVyDM/5Qro/IuvoBvda26CNrvK4Y/eur4s4w/uQalatM2CeA330=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781609275; c=relaxed/simple;
	bh=LCQEXv7A9cWSgBOEaPelwGYgYQvcBHVh5+qZYFtz5gg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PJO8mGwvRIHyFq671Jzu7u2fvY/DW/woQJK9NMfBm4J/N6WCx2LhpCoKAWz1UIMrWuj7s+VOFRWI/5Wg/b44ntXfd/ry+6qAKfPbJ1j/OU7Y8TFLyxh/H+JQtoxYSisojzrBjReLba8qBqwYmKy7oFTVcuJKu/HRRKHq0svOajY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RZyyOEo+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QEji+esw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RZyyOEo+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QEji+esw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RZyyOEo+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QEji+esw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RZyyOEo+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QEji+esw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5954C759FB;
	Tue, 16 Jun 2026 11:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781609271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cXAv5Z3H5IvJs16491ztLulGK8hXw7vZEWfsrtHojVc=;
	b=RZyyOEo+JlxfMe+RksmnIJsssjIDX+17KOB1TPIRiSCbgQut/OSElxEbJ72/2yBj9u+t/F
	fC5LaWbaf6rOH8oSAcjiyhyg7jc2e/grlvONXEuhHw3Am34oQCCCv8hnzzJc5BOwqU20ML
	VrPOMfmHrpSzlQ+aMgw4y1kwia1V1P8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781609271;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cXAv5Z3H5IvJs16491ztLulGK8hXw7vZEWfsrtHojVc=;
	b=QEji+eswfnzN/O63tFbdmAOXURNwEx6t9FbClfceZKgJ8/Qw2Bc6dONWCELzFGRwJEu1FQ
	36JHqiaWTv2K/nBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781609271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cXAv5Z3H5IvJs16491ztLulGK8hXw7vZEWfsrtHojVc=;
	b=RZyyOEo+JlxfMe+RksmnIJsssjIDX+17KOB1TPIRiSCbgQut/OSElxEbJ72/2yBj9u+t/F
	fC5LaWbaf6rOH8oSAcjiyhyg7jc2e/grlvONXEuhHw3Am34oQCCCv8hnzzJc5BOwqU20ML
	VrPOMfmHrpSzlQ+aMgw4y1kwia1V1P8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781609271;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cXAv5Z3H5IvJs16491ztLulGK8hXw7vZEWfsrtHojVc=;
	b=QEji+eswfnzN/O63tFbdmAOXURNwEx6t9FbClfceZKgJ8/Qw2Bc6dONWCELzFGRwJEu1FQ
	36JHqiaWTv2K/nBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44265779A8;
	Tue, 16 Jun 2026 11:27:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P3z4DzczMWoaMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 16 Jun 2026 11:27:51 +0000
Date: Tue, 16 Jun 2026 13:27:51 +0200
Message-ID: <87se6mrah4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Galen <rwekyes@gmail.com>
Cc: tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/conexant: Add pin config quirk for Lenovo IdeaPad Slim 5 16AKP10
In-Reply-To: <20260615233353.19913-1-rwekyes@gmail.com>
References: <20260615233353.19913-1-rwekyes@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Tue, 16 Jun 2026 01:33:53 +0200,
Galen wrote:
> 
> The Lenovo IdeaPad Slim 5 16AKP10 (PCI SSID 17aa:38b6) uses the
> Conexant SN6140 codec. The internal microphone is on pin 0x1a but
> the BIOS configures it with pin default 0x95a60120, which includes
> a jack detection bit that causes the kernel to treat it as an
> unplugged external mic rather than a fixed internal mic.
> 
> Add a pin config quirk that overrides pin 0x1a to 0x95a60130,
> setting the connectivity bits to indicate a fixed/always-connected
> device. This allows the internal microphone to be correctly
> identified and used.
> 
> Signed-off-by: Galen Hassen <rwekyes@gmail.com>
> ---
>  sound/hda/codecs/conexant.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
> index e3b6aaabe..40d4591f9 100644
> --- a/sound/hda/codecs/conexant.c
> +++ b/sound/hda/codecs/conexant.c
> @@ -291,6 +291,7 @@ enum {
>  	CXT_FIXUP_HEADSET_MIC,
>  	CXT_FIXUP_HP_MIC_NO_PRESENCE,
>  	CXT_PINCFG_SWS_JS201D,
> +	CXT_PINCFG_LENOVO_IDEAPAD_SLIM5_16AKP10,
>  	CXT_PINCFG_TOP_SPEAKER,
>  	CXT_FIXUP_HP_A_U,
>  	CXT_FIXUP_ACER_SWIFT_HP,
> @@ -826,6 +827,12 @@ static const struct hda_pintbl cxt_pincfg_lemote[] = {
>  	{}
>  };
>  
> +/* Lenovo IdeaPad Slim 5 16AKP10 with SN6140 */
> +static const struct hda_pintbl cxt_pincfg_lenovo_ideapad_slim5_16akp10[] = {
> +	{ 0x1a, 0x95a60130 }, /* Internal mic, fixed/always-connected */
> +	{}
> +};
> +
>  /* SuoWoSi/South-holding JS201D with sn6140 */
>  static const struct hda_pintbl cxt_pincfg_sws_js201d[] = {
>  	{ 0x16, 0x03211040 }, /* hp out */
> @@ -1006,6 +1013,10 @@ static const struct hda_fixup cxt_fixups[] = {
>  		.type = HDA_FIXUP_PINS,
>  		.v.pins = cxt_pincfg_sws_js201d,
>  	},
> +	[CXT_PINCFG_LENOVO_IDEAPAD_SLIM5_16AKP10] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = cxt_pincfg_lenovo_ideapad_slim5_16akp10,
> +	},
>  	[CXT_PINCFG_TOP_SPEAKER] = {
>  		.type = HDA_FIXUP_PINS,
>  		.v.pins = (const struct hda_pintbl[]) {
> @@ -1116,6 +1127,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
>  	SND_PCI_QUIRK(0x17aa, 0x38af, "Lenovo IdeaPad Z560", CXT_FIXUP_MUTE_LED_EAPD),
>  	SND_PCI_QUIRK(0x17aa, 0x3905, "Lenovo G50-30", CXT_FIXUP_STEREO_DMIC),
>  	SND_PCI_QUIRK(0x17aa, 0x390b, "Lenovo G50-80", CXT_FIXUP_STEREO_DMIC),
> +	SND_PCI_QUIRK(0x17aa, 0x38b6, "Lenovo IdeaPad Slim 5 16AKP10", CXT_PINCFG_LENOVO_IDEAPAD_SLIM5_16AKP10),
>  	SND_PCI_QUIRK(0x17aa, 0x3975, "Lenovo U300s", CXT_FIXUP_STEREO_DMIC),
>  	/* NOTE: we'd need to extend the quirk for 17aa:3977 as the same
>  	 * PCI SSID is used on multiple Lenovo models

The table is sorted in PCI SSID order.  Please try to put the entry at
the right position.


thanks,

Takashi
