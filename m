Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E360D3D4130
	for <linux-sound@vger.kernel.org>; Sun, 16 Aug 2026 10:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786877016; cv=none; b=W/PCIH2AlVqcnRIYgaxTUH3CCyh8InuNXi4LcHpzRMhLXkOCUGFLn1ID22t+TQBiiF4Fwi94jdLsAeGp7aHn2rM1uErmnSM3anZq4Bz4TgAuu5M9w/4BwlG0s5pgNc+kGPEbqGLamK9at23IbN8gxd6seX87OroKxvDyF+Ui7yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786877016; c=relaxed/simple;
	bh=7iJ4hdgYBps8Mf7PZlIct7K4z59aj7TlTEFWnPs9VS4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pr2HWH/3kfGFlFaKrnXO7VTEiAJZerhtMgm6QLpe0QbqKYDOUmxtkCwiFbZPrINuWOW6eQAFts0Y/BxlgPqBww1a2Y6ikCYFlruc45EWbHq1Wmf60Z/CZU1VNiuI032nVRQcvQI0rCPCJZF1eWKHopNrFuNiLH1hvOyYmQPdaaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qhrjueju; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tQ3cwNRu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZOP2tsdf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=07UF7BWi; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qhrjueju";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tQ3cwNRu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZOP2tsdf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="07UF7BWi"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CAA373E1D;
	Sun, 16 Aug 2026 10:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786876943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HIvakPGufgscO3rGu7vRRi/Exn26f7EesmMBbSeT5NQ=;
	b=QhrjuejuLpWr5uD26FD0dWk0WdBW3k00TyJP9Ap/++moganBj1ZTGfkvoJV4t8a4DwWJov
	UhyUW3pyq3LXy9eKP5pUFAbk4em/93i51KdRvpMpfBsWq5aYUDWvbcOm0JUANHOV1av6OM
	7ILLmIbXnm0QlQOoV3qLavBBEMS4dXk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786876943;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HIvakPGufgscO3rGu7vRRi/Exn26f7EesmMBbSeT5NQ=;
	b=tQ3cwNRurp5e4Oj/BbLG14IDaGZ3iho6wX0uUIFdlDY5UFifyl0Wm/rxZI5BL7tyNH9ilc
	hM2wj0FcH456TIDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZOP2tsdf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=07UF7BWi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786876938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HIvakPGufgscO3rGu7vRRi/Exn26f7EesmMBbSeT5NQ=;
	b=ZOP2tsdfCkQfOJZtwEugcWfWyUptjascsj5T4mQa0Iu0NZvV+NSgzlUzuP0uxenCYp7yA8
	jRxL+HeuHLTXw8AMOuxaXVf2+ye3pxo+BDp24CYQwN0HykbPbBHFAFs8xVr+C45Ai2FWmc
	8YN72wu3z/AD7eD35qOwytK5pPmhUj0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786876938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HIvakPGufgscO3rGu7vRRi/Exn26f7EesmMBbSeT5NQ=;
	b=07UF7BWio9TUBKJomsLqXVwjUAxP0L+9DrBhvgCX38OALkkvAA3GxqKZJf4ayFnSxOvRxz
	Q27j7UTJbAyevgBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A12EA78E6A;
	Sun, 16 Aug 2026 10:42:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5DUzJQqUgWpragAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 16 Aug 2026 10:42:18 +0000
Date: Sun, 16 Aug 2026 12:42:18 +0200
Message-ID: <87y0e6cpo5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yashraj221B <yashrajghule.221@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.de,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix mute LED for HP Victus 15-fa1xxx (MB 8C3F)
In-Reply-To: <20260815163312.29030-1-yashrajghule.221@gmail.com>
References: <20260815163312.29030-1-yashrajghule.221@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Queue-Id: CAA373E1D
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Sat, 15 Aug 2026 18:33:12 +0200,
Yashraj221B wrote:
> 
> The HP Victus 15-fa1xxx with motherboard 8C3F is missing the
> existing mute LED quirk for ALC245 codecs.
> 
> Add the 103c:8c3f subsystem ID to the existing
> ALC245_FIXUP_HP_MUTE_LED_COEFBIT quirk.
> 
> Tested on HP Victus 15-fa1xxx (MB 8C3F). The mute LED works
> as intended.
> 
> Signed-off-by: Yashraj221B <yashrajghule.221@gmail.com>

The Signed-off-by tag is a legal requirement, and it must be with a
real name (or a known identity).  At best, change From: address to
align with it altogether.

Also, about the code change:

> ---
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 3f0e276fc606..df0732c5e14d 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7470,6 +7470,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre x360 2-in-1 Laptop 16-aa0xxx", ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX),
>  	SND_PCI_QUIRK(0x103c, 0x8c21, "HP Pavilion Plus Laptop 14-ey0XXX", ALC245_FIXUP_HP_X360_MUTE_LEDS),
>  	SND_PCI_QUIRK(0x103c, 0x8c2d, "HP Victus 15-fa1xxx (MB 8C2D)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
> +	SND_PCI_QUIRK(0x103c, 0x8c3f, "HP Victus 15-fa1xxx (MB 8C3F)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
>  	SND_PCI_QUIRK(0x103c, 0x8c30, "HP Victus 15-fb1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
>  	SND_PCI_QUIRK(0x103c, 0x8c46, "HP EliteBook 830 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8c47, "HP EliteBook 840 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),

The table is sorted in PCI SSID order.  Please put the new entry at
the right position.

Could you resubmit with the corrections above?  Thanks.


Takashi
