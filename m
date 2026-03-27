Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F0E3D813E
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 09:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774605164; cv=none; b=TfQOBQcOZMrshBiLzR5p89Jx3ajpg8fWHjQ6Ob89IqYapp/jyfaJojD1GAyk8WjXTUH3ZsJOOB05+92UY5I2sG8Sl5z+JRNrMNSCCwAV563GyG4g0hb3TMhERF1zFQxy8SkD4p5FIW59C923+oCcGnilsWl6ArYaoh5RzoMGXlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774605164; c=relaxed/simple;
	bh=SMr6u8uFq71snlbn8ZV6qWIuiyRiKSwhGR0fZtmmtBQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GUVHDrwYHOcYz0JU6TBEoAAmZf/EciEIzsf//NJbkck0WaZ0E4U4JE230UbrvrnEVmZNJJXmH0PRzo5YLysg1f+U28oMDe4XQpmelWiRTo2Xb7zl1Nta9tf8ItZzXacI8SW4qYZUFHhg5xSNKQJLl2W9ar2T8OUZCktdTiliTFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GmBv1Bbj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ubTnVFoE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GmBv1Bbj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ubTnVFoE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GmBv1Bbj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ubTnVFoE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GmBv1Bbj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ubTnVFoE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 907D55BCF9;
	Fri, 27 Mar 2026 09:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774605161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zs7UhIkhdLQakbVrNX2HSsCN8BCm0GXrMbthi0vSTdQ=;
	b=GmBv1BbjWx20O7InL/xAu2u4yp7Ldg02ADRgjaE2+Z+JtPMRW6s+It/YOZCdA/rQBe905Z
	6AjbHnhB0rDDmDAt7UyNHaOPxwFn8ePn6qJNfJWZs8gFkbBAV4R8LiWIYNY3lB4Fj1K1x6
	GIWr1tY3hE1A5jV5qJDFDHT5qN4FAnc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774605161;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zs7UhIkhdLQakbVrNX2HSsCN8BCm0GXrMbthi0vSTdQ=;
	b=ubTnVFoEx3X2hZnRwMUntudrp5W92nb8KtGXOeoHPQMf+bkaG6dC8jDJ4uuIYjo+ACYOO6
	RTB5UX/T9I37mxCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774605161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zs7UhIkhdLQakbVrNX2HSsCN8BCm0GXrMbthi0vSTdQ=;
	b=GmBv1BbjWx20O7InL/xAu2u4yp7Ldg02ADRgjaE2+Z+JtPMRW6s+It/YOZCdA/rQBe905Z
	6AjbHnhB0rDDmDAt7UyNHaOPxwFn8ePn6qJNfJWZs8gFkbBAV4R8LiWIYNY3lB4Fj1K1x6
	GIWr1tY3hE1A5jV5qJDFDHT5qN4FAnc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774605161;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zs7UhIkhdLQakbVrNX2HSsCN8BCm0GXrMbthi0vSTdQ=;
	b=ubTnVFoEx3X2hZnRwMUntudrp5W92nb8KtGXOeoHPQMf+bkaG6dC8jDJ4uuIYjo+ACYOO6
	RTB5UX/T9I37mxCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68E624A0A2;
	Fri, 27 Mar 2026 09:52:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FlAvGGlTxmkONwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 09:52:41 +0000
Date: Fri, 27 Mar 2026 10:52:41 +0100
Message-ID: <878qbdsiom.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rocket Raccoon <rakketje1@gmail.com>
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga 7 2-in-1 14AKP10
In-Reply-To: <CAL76xbU81CKcbAD436djDbJ8P+xsj0r24i7phFG1YcSVr2n2JQ@mail.gmail.com>
References: <CAL76xbU81CKcbAD436djDbJ8P+xsj0r24i7phFG1YcSVr2n2JQ@mail.gmail.com>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Wed, 25 Mar 2026 13:26:54 +0100,
Rocket Raccoon wrote:
> 
> The Lenovo Yoga 7 2-in-1 14AKP10 (PCI subsystem ID 0x17aa:0x391c) uses
> an ALC287 HDA codec paired with a TAS2781 amplifier connected via I2C.
> Without this quirk the amplifier is not initialised and internal speaker
> output lacks amplification.
> 
> Signed-off-by: Lucas <rakketje1@gmail.com>

The Signed-off-by line must be a real name or a known identity as it's
a legal requirement.  (Also it's better aligned with From line.)

> ---
>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index XXXXXXX..XXXXXXX 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -XXXXX,6 +XXXXX,7 @@ static const struct snd_pci_quirk alc287_fixup_tbl[] = {
>   SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo Yoga Pro 9 14IRP8",
> ALC287_FIXUP_TAS2781_I2C),
> + SND_PCI_QUIRK(0x17aa, 0x391c, "Lenovo Yoga 7 2-in-1 14AKP10",
> ALC287_FIXUP_TAS2781_I2C),
>   SND_PCI_QUIRK(0x17aa, 0x3819, "Lenovo 13s Gen2 ITL",
> ALC287_FIXUP_13S_GEN2_SPEAKERS),

... and the patch seems not applicable cleanly.  Please fix your
mailer setup, too.


thanks,

Takashi
