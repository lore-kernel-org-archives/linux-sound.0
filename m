Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A954F2E413
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 11:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871231; cv=none; b=bsAX9jMcSTrLCl8RZCgL1L8E1yfVcggtWOWl35PeaeTnMdoelhitronDVJ93hhBpYze4k5hgHZT0iXuodK92Ky1t9xzqe52IvqrkIkHhHy51SLjcrS7g11ND1GXZi8AXmovVpXDMNhTo9Y+B/dpNrFUcocrMXRC94LBZyk3KPBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871231; c=relaxed/simple;
	bh=K5wm02jT3CHI8OP/kppGrvGP0E8GzBotEGzMvQgey3A=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kKT9XrgzSZiLrXSCKZgGJdr/tfrEPTkJcedlRecbhCFs4w0bnUUldKOiZ6ZDzSaTOfbVg9p8KxVPA/k7jvfAn1SCfKFTctGJMCsPsotcv4VXK0wcmP2Y88oMdfpjBqRaeMkHY4FypkVJd25fT4+Wuv2E6SF5fRdoTzpBkZ/ZXiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KxPkNLLa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QN/WgFKT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R54NxIVV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Za4XAbiS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KxPkNLLa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QN/WgFKT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R54NxIVV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Za4XAbiS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DA55D4D2BD;
	Mon, 30 Mar 2026 11:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774871227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2igrHwsyjjNO9VBaJ8vV+AwRGpvEcUaAjo1uivO9sgg=;
	b=KxPkNLLaucWHaniRuVoSOw0g8H/OiT1OssW1JNlxiqvk1TriUOWiRkeIi62DC5o8WCJntl
	tuBpJRmpfgyclohGw9GqYHfgXm5sWT8bA45Imq71b9qHUmnA2YBCXg9FQtNBDkvZ2wWHea
	JM79MhVUBqnszUc+41yG6nk0p8rucho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774871227;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2igrHwsyjjNO9VBaJ8vV+AwRGpvEcUaAjo1uivO9sgg=;
	b=QN/WgFKTgpNXDpmTI1ZTxrDxWeCcGJnL5MPvz10VQMBMctxsFoSFortK0ZkFhA/MoSdggJ
	ubmmmrp8pylO9YAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774871226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2igrHwsyjjNO9VBaJ8vV+AwRGpvEcUaAjo1uivO9sgg=;
	b=R54NxIVVFTjGErULQjiUmSOyLAKdvt/it2zaGJ4KlGa1wBrYqaUPYG5Gz2DxjMK/j7oyiu
	MyMlXFgUU0rTIm63AtwIkPeQSPK4RRslLCjgBQc7TDmegQJyWvxxLnDdqThag6ewjOoBAw
	Va0WXCV6xonjfzDawznjbW1e0eXkcTM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774871226;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2igrHwsyjjNO9VBaJ8vV+AwRGpvEcUaAjo1uivO9sgg=;
	b=Za4XAbiS7UDcMncBfewUBFL6S5JtFFNregFdg4hGDTjt2/gbIixU/S8xd5IdsAcaiE1eiv
	73rlJK3xaKsD3UAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9A394A0A2;
	Mon, 30 Mar 2026 11:47:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EU4kKLpiymmBMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Mar 2026 11:47:06 +0000
Date: Mon, 30 Mar 2026 13:47:06 +0200
Message-ID: <875x6dv8sl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: add quirk for HP Laptop 15-fc0xxx
In-Reply-To: <20260330075334.50962-1-zhangheng@kylinos.cn>
References: <20260330075334.50962-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Mon, 30 Mar 2026 09:53:33 +0200,
Zhang Heng wrote:
> 
> For the HP Laptop 15-fc0xxx with ALC236, the built-in mic 0x12 was
> not set up, making it unusable; after adding it, it now works properly.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221233
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> ---
>  sound/hda/codecs/realtek/alc269.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 6787e54fcfe6..0fd980596408 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -4123,6 +4123,7 @@ enum {
>  	ALC245_FIXUP_BASS_HP_DAC,
>  	ALC245_FIXUP_ACER_MICMUTE_LED,
>  	ALC245_FIXUP_CS35L41_I2C_2_MUTE_LED,
> +	ALC236_FIXUP_HP_INV_DMIC,

Any reason for "_INV_"?  Your implementation doesn't look related with
the existing inverted dmic workaround.


thanks,

Takashi

>  };
>  
>  /* A special fixup for Lenovo C940 and Yoga Duet 7;
> @@ -6658,6 +6659,13 @@ static const struct hda_fixup alc269_fixups[] = {
>  		.v.func = alc245_fixup_hp_mute_led_coefbit,
>  		.chained = true,
>  		.chain_id = ALC287_FIXUP_CS35L41_I2C_2,
> +	},
> +	[ALC236_FIXUP_HP_INV_DMIC] = {
> +		.type = HDA_FIXUP_PINS,
> +		.v.pins = (const struct hda_pintbl[]) {
> +			{ 0x12, 0x90a60160 }, /* use as internal mic */
> +			{ }
> +		},
>  	}
>  };
>  
> @@ -7152,6 +7160,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x103c, 0x8da1, "HP 16 Clipper OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x103c, 0x8da7, "HP 14 Enstrom OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x103c, 0x8da8, "HP 16 Piston OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
> +	SND_PCI_QUIRK(0x103c, 0x8dc9, "HP Laptop 15-fc0xxx", ALC236_FIXUP_HP_INV_DMIC),
>  	SND_PCI_QUIRK(0x103c, 0x8dd4, "HP EliteStudio 8 AIO", ALC274_FIXUP_HP_AIO_BIND_DACS),
>  	SND_PCI_QUIRK(0x103c, 0x8dd7, "HP Laptop 15-fd0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>  	SND_PCI_QUIRK(0x103c, 0x8de8, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
> -- 
> 2.25.1
> 
