Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5A21A3041
	for <linux-sound@vger.kernel.org>; Tue,  3 Sep 2024 06:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725343880; cv=none; b=iQhMBFLF72I6T0ZbWW+/RqlFCNBWTw6TajtlSaNVVlUcKjgAtINVMre7w98oIDThe38b5oVAZh6WyBltrxJ3bjHuqDeB354fnnQNR+GMga9W6IDIKeflVLOBWk1z8LPXWUeJ927T1uOo/C9gWwibvBp6LhtnKZRH5Gr1i+qcQCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725343880; c=relaxed/simple;
	bh=UUET3/Al+whMEC0SjVNhuxcCWafjnoFcaWt68uugu54=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CXiox2VTa/VjuJ0XmaoBQ8Vh55v4fXb/yNUn5oTAMfdeeg2MmvyGAHjpqsmn5gJmwypKHzfZoOWFiObCwt2UWI9RUVyIiUGAOeakxBirAS1HlbBmNHdrn8BprPSxAKYHB/ujhn53v1Lei1PbGyM/XbTf76INdQtjwQJP7dunqIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JKn/dqVK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mCw643x4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JKn/dqVK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mCw643x4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JKn/dqVK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mCw643x4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JKn/dqVK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mCw643x4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 08D7321B55;
	Tue,  3 Sep 2024 06:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725343877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U+j/d0Z0BbJMW8mJgr929oK9QpNzc+lkQxBVxmcZznM=;
	b=JKn/dqVKDbKz3tv3ItP/VbQjkZ10VPDXGw6RNyUtLgHsjEqHGzSwDitjw4Cv0zNnYO/7Zz
	e+ME+URYiLOH2zlmgqNU91dIeszReJ5cZ0Bcc9sjYxme/9s8UTxbaPBdAAqZqw835PKhdk
	E6BjocaBOPyD5btUfpb6tLOLTOFuNmY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725343877;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U+j/d0Z0BbJMW8mJgr929oK9QpNzc+lkQxBVxmcZznM=;
	b=mCw643x4w3MY8gnQlhrvyPuApdchoqMBtweKImgklsOCqKjnRHTuYVpNY/upIXBOlaPuJr
	AFkKt3P5yZcB+xBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="JKn/dqVK";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mCw643x4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725343877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U+j/d0Z0BbJMW8mJgr929oK9QpNzc+lkQxBVxmcZznM=;
	b=JKn/dqVKDbKz3tv3ItP/VbQjkZ10VPDXGw6RNyUtLgHsjEqHGzSwDitjw4Cv0zNnYO/7Zz
	e+ME+URYiLOH2zlmgqNU91dIeszReJ5cZ0Bcc9sjYxme/9s8UTxbaPBdAAqZqw835PKhdk
	E6BjocaBOPyD5btUfpb6tLOLTOFuNmY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725343877;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U+j/d0Z0BbJMW8mJgr929oK9QpNzc+lkQxBVxmcZznM=;
	b=mCw643x4w3MY8gnQlhrvyPuApdchoqMBtweKImgklsOCqKjnRHTuYVpNY/upIXBOlaPuJr
	AFkKt3P5yZcB+xBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D1AC013A52;
	Tue,  3 Sep 2024 06:11:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wOz2MYSo1mY3OAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Sep 2024 06:11:16 +0000
Date: Tue, 03 Sep 2024 08:12:02 +0200
Message-ID: <87ed61mfkd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Adam Queler <queler@gmail.com>
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	Adam Queler <queler+k@gmail.com>
Subject: Re: [PATCH] Enable Mute Led for HP Victus 15-fb1xxx
In-Reply-To: <20240902205755.22233-1-queler+k@gmail.com>
References: <20240902205755.22233-1-queler+k@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 08D7321B55
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,perex.cz,suse.com,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[k];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

On Mon, 02 Sep 2024 22:57:55 +0200,
Adam Queler wrote:
> 
> The mute led is controlled by ALC245. This patch enables the already existing quirk for this device.

The code change itself looks OK, but your Signed-off-by tag is
missing.  Also, please try to adjust the subject with a proper prefix
(e.g. "ALSA: hda/realtek: Enable Mute ...").

Could you resubmit with those corrections?


thanks,

Takashi

> ---
>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index af3111d618fa..0288b3669564 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -10300,6 +10300,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x103c, 0x8c16, "HP Spectre 16", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre 16", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x103c, 0x8c21, "HP Pavilion Plus Laptop 14-ey0XXX", ALC245_FIXUP_HP_X360_MUTE_LEDS),
> +	SND_PCI_QUIRK(0x103c, 0x8c30, "HP Victus 15-fb1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
>  	SND_PCI_QUIRK(0x103c, 0x8c46, "HP EliteBook 830 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8c47, "HP EliteBook 840 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8c48, "HP EliteBook 860 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
> -- 
> 2.43.0
> 
