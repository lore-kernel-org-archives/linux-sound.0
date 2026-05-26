Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33823B6376
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 05:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779775091; cv=none; b=kAdd53h30VdOGufVDOgItAu+S01o0lNdIF8bnhZs7DbIyVVLenhXq1nQBgwkqKvQ/pmMVX7XRPuZrBrVxULQsCP/dXK2d+e9HsAHo4wKfHDfE/yjLGTYx1Lwpzve47FE3YduhbGkEVB8xj7ICL82J7GnkwIt0QVo+iI8r69ZjzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779775091; c=relaxed/simple;
	bh=F3ApDkV14xgZPXYsYclSk1byLWVIbCx28MQoJWyH55Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f4yru0oJ3frFcgJWmZrK3IuNR4j/pguEeEPkFClJurYCv0Esueh9nbe2tV9+V7TPxMFGXQIUb//eoZ2nwpY8tD8y0mtVB8vEObaILJZ0DHBdJG8vXnfJVR7eH7EvJtl8jHMNRTz5SBGhTqwQxjTkkTa79ec6JsCnA+Ehp/glxdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oeQd/fsJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6DbuFc3I; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oeQd/fsJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6DbuFc3I; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oeQd/fsJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6DbuFc3I";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oeQd/fsJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6DbuFc3I"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2B56665393;
	Tue, 26 May 2026 05:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779775088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=38ZApKfvAN6HfIRcCWUy2kkwfHW4I25ZL82WVvHPCTY=;
	b=oeQd/fsJ8EH1MdYzwfIYHU8hkIu70KNGDt1wGXyKZDNYY3vDleOICvgwZVsnTl7ouuZByw
	qf9DBHYBJLAqTK9Ch/ESx5RwbgVxONScwfPSshg77awqYecdAkimwe83S5vGe8ud0o4u7j
	GJpVO5swkaxTaMF/UiDF10XD5fKVTmY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779775088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=38ZApKfvAN6HfIRcCWUy2kkwfHW4I25ZL82WVvHPCTY=;
	b=6DbuFc3I0Y6rSOSPkYHzSSlawv1a+16oNi31h527IMBO7Dbsp3lQhsn9zlH/doFnBL2WU/
	1V32nnpIfz82QZCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779775088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=38ZApKfvAN6HfIRcCWUy2kkwfHW4I25ZL82WVvHPCTY=;
	b=oeQd/fsJ8EH1MdYzwfIYHU8hkIu70KNGDt1wGXyKZDNYY3vDleOICvgwZVsnTl7ouuZByw
	qf9DBHYBJLAqTK9Ch/ESx5RwbgVxONScwfPSshg77awqYecdAkimwe83S5vGe8ud0o4u7j
	GJpVO5swkaxTaMF/UiDF10XD5fKVTmY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779775088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=38ZApKfvAN6HfIRcCWUy2kkwfHW4I25ZL82WVvHPCTY=;
	b=6DbuFc3I0Y6rSOSPkYHzSSlawv1a+16oNi31h527IMBO7Dbsp3lQhsn9zlH/doFnBL2WU/
	1V32nnpIfz82QZCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EADA55A058;
	Tue, 26 May 2026 05:58:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MCwqOG82FWqGKwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 May 2026 05:58:07 +0000
Date: Tue, 26 May 2026 07:58:07 +0200
Message-ID: <87ldd6zp8w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Fabian <fabianlippold1184@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALC269/Realtek: add quirk for HP Dragonfly Folio G3 2-in-1
In-Reply-To: <CAKrjPiXUi=_ugS+Qa3aW3kM=wqZKT+ssEVTGmtAPqeT6XNDJNw@mail.gmail.com>
References: <CAKrjPiXUi=_ugS+Qa3aW3kM=wqZKT+ssEVTGmtAPqeT6XNDJNw@mail.gmail.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	internal_greylist_whitelist(0.00)[10.150.64.97];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Fri, 22 May 2026 20:44:09 +0200,
Fabian wrote:
> 
> From 0039d23937f4c2783dcea11cc09b26a788d09872 Mon Sep 17 00:00:00 2001
> From: Fabian Lippold <fabianlippold1184@gmail.com>
> Date: Fri, 22 May 2026 20:36:10 +0200
> Subject: [PATCH] ALC269/Realtek: add quirk for HP Dragonfly Folio G3 2-in-1
> 
> Add PCI quirk for HP Dragonfly Folio G3 (PCI ID 103c:8a06) to select the
> CS35L41 SPI4 & GPIO LED fixup variant.
> 
> Signed-off-by: Fabian Lippold <fabianlippold1184@gmail.com>
> ---
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c
> b/sound/hda/codecs/realtek/alc269.c
> index 2f5d13032..2c478d80c 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7069,6 +7069,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>   SND_PCI_QUIRK(0x103c, 0x89d3, "HP EliteBook 645 G9 (MB 89D2)",
> ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
>   SND_PCI_QUIRK(0x103c, 0x89da, "HP Spectre x360 14t-ea100",
> ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
>   SND_PCI_QUIRK(0x103c, 0x89e7, "HP Elite x2 G9",
> ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
> + SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio G3 2-in-1",
> ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
>   SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx",
> ALC287_FIXUP_HP_GPIO_LED),
>   SND_PCI_QUIRK(0x103c, 0x8a1f, "HP Laptop 14s-dr5xxx",
> ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>   SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx",
> ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),

The patch can't be applied because your mailer broke tabs and spaces.
Please fix your mailer setup and resubmit.  At best, try to send a
patch to yourself and verify whether it can be applied via git-am
beforehand.


thanks,

Takashi
