Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD963165F1E
	for <linux-sound@vger.kernel.org>; Mon, 30 Sep 2024 07:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727682672; cv=none; b=gVCqepeY5+TT5r7sr+cbCjCWZB0Mx4py1PoY8jNubvu8ulMiiC4dMXVBaDngyoqW5XAuc1xXerjrhkiFCy/Jzqy714/mGSGakLP6zmwjMT4vHwEpwkk7PfkDI6hCjwJWc5gqc7ZcgWRn09Jw2aZr6YFBa/EC6Ke35bttqHvedfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727682672; c=relaxed/simple;
	bh=3SDZgHReRIHcOCBFma8u458veSk/jP5Y3mg9r7KAeuE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NABdHA+YrqQkWMXzRHwltbr5Vq4/5yFx1AJRdq5bxL6Q3CpjjCpbRVBt5L+AHOI7fdZsZ84gCFe/Wn/QWRGyzIOLmlVLzbr9+1ZBR46fIsxjNrTUaCy9WpnMIXte4BHyokLxs53cmp6sWF48a00/R16b2Uc3frk1sIDP3NZpiJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uQ8T5meS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y/ymR4oq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lmDKYnQB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b3BrKuRQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uQ8T5meS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y/ymR4oq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lmDKYnQB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b3BrKuRQ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D652221A3A;
	Mon, 30 Sep 2024 07:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727682668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WdNPcCLguJ9r7XcK9pZtmF9DxqSIL5lVM66XuHj0i4U=;
	b=uQ8T5meSXhATgJTsnTgFlhksbPQfdmdDEWDXLBVDo/YZChIO2CZHKrZhQa9BLoiEABoHh9
	ZeI6S5eu0o88QCcsmpIvVMyAnJVij3MqqGHihNTlKrtZYGJyDoP9m0exJU78q7MVSMBlRZ
	4vIWYLxVANb7MHwFb195ha/5epiLNDs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727682668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WdNPcCLguJ9r7XcK9pZtmF9DxqSIL5lVM66XuHj0i4U=;
	b=y/ymR4oqqDnlpau94Jv+Nu+Efb88KTO3x8TrdlggVVgKH5HRAdWL0u0xsNkSnTpsrfl/PU
	J7IIQMcmOvJBrgDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lmDKYnQB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=b3BrKuRQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727682667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WdNPcCLguJ9r7XcK9pZtmF9DxqSIL5lVM66XuHj0i4U=;
	b=lmDKYnQB9HkYfrCSrzBitzfwsAyIf2RsGKeqWMmf7HNROdnSVvZ48vgnVgoLjWhzoWCiBe
	jmtCUFL+ul9LzXnCSbUMfDtLIyIi0JpQoh+Egr4ldnmuseMPKjYV8hrUuvqPgtmLVPFZKe
	20usApVUze/djkzyNoia0Ncl+gMRmTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727682667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WdNPcCLguJ9r7XcK9pZtmF9DxqSIL5lVM66XuHj0i4U=;
	b=b3BrKuRQpPrXYo8+vpmllHEdR2U+yYskl6S0x9h/ZGtviYo2y5OXb4q7i6jeeO03RruNyo
	Z3UnBFXpmFelRgDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9F4D13A8B;
	Mon, 30 Sep 2024 07:51:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GNItKGtY+mZjDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Sep 2024 07:51:07 +0000
Date: Mon, 30 Sep 2024 09:52:00 +0200
Message-ID: <87h69xk28v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?=22Jos=E9_Relvas=22?= <josemonsantorelvas@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] Add subwoofer quirk for Acer Predator G9-593
In-Reply-To: <20240923170105.405647-1-josemonsantorelvas@gmail.com>
References: <20240923170105.405647-1-josemonsantorelvas@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D652221A3A
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 23 Sep 2024 19:01:05 +0200,
José Relvas wrote:
> 
> From: José Relvas <josemonsantorelvas@gmail.com>
> 
> The Acer Predator G9-593 has a 2+1 speaker system which isn't probed correctly.
> This patch adds a quirk with the proper pin connections.
> 
> Note that I do not own this laptop, so I cannot guarantee that this fixes the issue.
> Testing was done by other users here:
> https://discussion.fedoraproject.org/t/-/118482
> 
> This model appears to have two different dev IDs...
> 
> - 0x1177 (as seen on the forum link above)
> - 0x1178 (as seen on https://linux-hardware.org/?probe=127df9999f)
> 
> I don't think the audio system was changed between model revisions, so the patch
> applies for both IDs.
> 
> Signed-off-by: José Relvas <josemonsantorelvas@gmail.com>
> ---
>  sound/pci/hda/patch_realtek.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index f787ff4182d4..df556c4f0f99 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -7608,6 +7608,7 @@ enum {
>  	ALC256_FIXUP_ASUS_HEADSET_MIC,
>  	ALC256_FIXUP_ASUS_MIC_NO_PRESENCE,
>  	ALC299_FIXUP_PREDATOR_SPK,
> +	ALC255_FIXUP_PREDATOR_SUBWOOFER,
>  	ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE,
>  	ALC289_FIXUP_DELL_SPK1,
>  	ALC289_FIXUP_DELL_SPK2,
> @@ -9027,6 +9028,13 @@ static const struct hda_fixup alc269_fixups[] = {
>  			{ }
>  		}
>  	},
> +	[ALC255_FIXUP_PREDATOR_SUBWOOFER] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x17, 0x90170151 }, /* use as internal speaker (LFE) */
> +			{ 0x1b, 0x90170152 } /* use as internal speaker (back) */
> +		}
> +	},
>  	[ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE] = {
>  		.type = HDA_FIXUP_PINS,
>  		.v.pins = (const struct hda_pintbl[]) {
> @@ -10104,6 +10112,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1025, 0x1166, "Acer Veriton N4640G", ALC269_FIXUP_LIFEBOOK),
>  	SND_PCI_QUIRK(0x1025, 0x1167, "Acer Veriton N6640G", ALC269_FIXUP_LIFEBOOK),
>  	SND_PCI_QUIRK(0x1025, 0x1246, "Acer Predator Helios 500", ALC299_FIXUP_PREDATOR_SPK),
> +	SND_PCI_QUIRK(0x1025, 0x1177, "Acer Predator G9-593", ALC255_FIXUP_PREDATOR_SUBWOOFER),
> +	SND_PCI_QUIRK(0x1025, 0x1178, "Acer Predator G9-593", ALC255_FIXUP_PREDATOR_SUBWOOFER),
>  	SND_PCI_QUIRK(0x1025, 0x1247, "Acer vCopperbox", ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS),
>  	SND_PCI_QUIRK(0x1025, 0x1248, "Acer Veriton N4660G", ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE),
>  	SND_PCI_QUIRK(0x1025, 0x1269, "Acer SWIFT SF314-54", ALC256_FIXUP_ACER_HEADSET_MIC),

The quirk table is sorted in PCI SSID order.  Could you try to put the
new entries at the right position and resubmit?

Also, please add a proper prefix to the subject line, e.g.
"ALSA: hda/realtek: Add subwoofer quirk ..."


thanks,

Takashi
