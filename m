Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FB423749
	for <linux-sound@vger.kernel.org>; Mon, 19 Feb 2024 09:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708333684; cv=none; b=Zc2g6FcLubVI98mjgx0USLEub+d4JiDQDnFGUt8vkUyiq8c7i9peI6acACQ0uSl83RdcuRCyFmnG+rVtbbkXpydno1KlCG+3sVrNOvkbbRjYvD1B7G64Sl+NJPIt3684arCvZXoiWsz1Z5Ny5JnsQkxdqQEoUrQbUjq4J1oRa+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708333684; c=relaxed/simple;
	bh=7hX2xQkXVF6n68yq6qdGeiwEItf0FXlVTbqO/YXnYTU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WZJQ/+dzQzvb0zRgWr8RBh5LO6zzTG3kLqnFMG9xfFexVJe2RL9lz3ZX3DsqVzCoQZfTPPZ63o8x0szl5kmV5L7u3X5x2k6Oiz2xWraYK795DPre2dr/7opv8W27fFIKOCiRFu9onOgYg3XKlX5RdNXSbf8H4nq/kPMT+U5STog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qgiZTkMd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/BtNXFTo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KcLYx3dI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5PXnisu6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qgiZTkMd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/BtNXFTo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KcLYx3dI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5PXnisu6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EC3D921CCB;
	Mon, 19 Feb 2024 09:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708333680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BD4imx/A0a8f4MSfjRK4trejIzTVmEr8X6Km+fhDKqg=;
	b=qgiZTkMdvLVufMux6XiYSazJweP6A6DMOeZZ+t8UqQFKRZAvryWRdf46Uk6RAoIbaA/rXp
	BzUjPwy16A3zQ/FlbOJDtc2PEOnnaomdVFK4sWqKyFbKvX87r4NlPs75tLswfSwRmorkzV
	hgkgYYcMkdIFYVPPHJQsjSIxltBHhfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708333680;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BD4imx/A0a8f4MSfjRK4trejIzTVmEr8X6Km+fhDKqg=;
	b=/BtNXFToYgoOLCMCVK1SNmhA8A15wT0wRJ+iKnY7DTsU01OKnh0WQduKSu8jPDwre1rMTW
	uFKHAjW0gk95yGDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708333679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BD4imx/A0a8f4MSfjRK4trejIzTVmEr8X6Km+fhDKqg=;
	b=KcLYx3dIwLoV5HUDeTPiPkcEmmvUIFoDPwO/W+AMFiSNA0MydKgKr5b7bV1w3X3QUPhVZa
	tEuABcGi94sB4sumIJKnogPDaE7K7WNFB8xFbvQRv+cYMKMif9OZCR7CbV3y2vg/ZtuX/n
	4KkhOW72VHCEuhsrelUMMC7DVCaadWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708333679;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BD4imx/A0a8f4MSfjRK4trejIzTVmEr8X6Km+fhDKqg=;
	b=5PXnisu6FlTgqc3IK9GT2TtMSP3A7wiVfF0zvBMVMoo4JF61wtYLRLpz0/ZZnQBr3qpZ/v
	736aiJoBfshkYACw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CA8DF139D0;
	Mon, 19 Feb 2024 09:07:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lIn3L28a02UFEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Feb 2024 09:07:59 +0000
Date: Mon, 19 Feb 2024 10:07:59 +0100
Message-ID: <87wmr0om8g.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jay Ajit Mate <jay.mate15@gmail.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] patch_realtek: Fix Dell Inspiron 16 Plus 7630
In-Reply-To: <20240217042639.12374-1-jay.mate15@gmail.com>
References: <20240217042639.12374-1-jay.mate15@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KcLYx3dI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5PXnisu6
X-Spamd-Result: default: False [-4.31 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 RCPT_COUNT_TWO(0.00)[2];
	 MID_CONTAINS_FROM(1.00)[];
	 MX_GOOD(-0.01)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: EC3D921CCB
X-Spam-Level: 
X-Spam-Score: -4.31
X-Spam-Flag: NO

On Sat, 17 Feb 2024 05:26:39 +0100,
Jay Ajit Mate wrote:
> 
> The Dell Inspiron 16 Plus 7630, like its predecessors
> (7620 models), has unconnected top speakers. As the
> controller remains unchanged, the speakers connected
> on NID 0X17 should be connected to the DAC on NIC 0x03.
> 
> Signed-off-by: Jay Ajit Mate <jay.mate15@gmail.com>

Thanks, it looks like a proper submission now.
But...

> ---
>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 0ec1312bffd5..f8dfbf17522b 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -9735,6 +9735,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1028, 0x0b28, "Dell", ALC245_FIXUP_CS35L41_SPI_2),
>  	SND_PCI_QUIRK(0x1028, 0x0b37, "Dell Inspiron 16 Plus 7620 2-in-1", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
>  	SND_PCI_QUIRK(0x1028, 0x0b71, "Dell Inspiron 16 Plus 7620", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
> +	SND_PCI_QUIRK(0x1028, 0x0c28, "Dell Inspiron 16 Plus 7630", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
>  	SND_PCI_QUIRK(0x1028, 0x0beb, "Dell XPS 15 9530 (2023)", ALC289_FIXUP_DELL_CS35L41_SPI_2),
>  	SND_PCI_QUIRK(0x1028, 0x0c03, "Dell Precision 5340", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
>  	SND_PCI_QUIRK(0x1028, 0x0c0b, "Dell Oasis 14 RPL-P", ALC289_FIXUP_RTK_AMP_DUAL_SPK),

The table is sorted in PCI SSID entry.  Could you try to put your new
entry at the right position and resubmit?

Also, please use the proper subject prefix.  In your case, it'll be
like "ALSA: hda/realtek: Fix Dell ..."

And, don't forget to put me to Cc at the next time.


thanks,

Takashi
