Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CA120330
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 14:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719238217; cv=none; b=ANElhDUxWOhrZ+wCfICX5Q5VpFhQoG9b6+jWzvMOXTd4j7vGWe5djyBoinpU2tJGs4/dDLycCzEZWpIKWd6EkvLgA+Gt4SG4NBVu2VOXsBQW10nEVO6CmB8KwAJBDGON/ut+ikU2/WNXRrghNKwJrmsYpvoToKXye85FYK1oqOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719238217; c=relaxed/simple;
	bh=XLKBE5pfvApbayeAu5HY7qgB9P/x+NxCAIsjJgTKYOA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JQF8zMHYsYOgWKtlf3ysPCGvN8hkL6huNDKp+aaLKkOjyfhNLuceq/2Tzi5TiY1hSQQt19p5/VKiDELvk5o0MX8vx7DbnaTX+M5b9sn86KC7VCgKYAFVHU10E4D1YOQ/yiikKCQGYJeehEbv8TWTkTuewgiweAql134/0B+/GoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gn3YJjIG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DtKPD5kO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZV3lv8fE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Fsi6jBCo; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gn3YJjIG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DtKPD5kO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZV3lv8fE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fsi6jBCo"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DBAFB1F7D9;
	Mon, 24 Jun 2024 14:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719238213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81epao7mtcGUyhXAVSERqp/rbrCtDeV0Xf2ybRmKfZM=;
	b=gn3YJjIGrGUAwlpoFNFWv3TpRlZPg7+lYkzTEZ8QziC0xPdKoA0idXGuqZ0vCsJPeHHb9u
	cYyRRNg2U0WexQTZ6hmY0+jKHNh68Z8YsCG2Yitl8PsurLcvIX++awHBWnuo/+8XtJezBw
	nJR9Zbx1uAQKFrUw3yTdiLXNnXTKrAY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719238213;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81epao7mtcGUyhXAVSERqp/rbrCtDeV0Xf2ybRmKfZM=;
	b=DtKPD5kOm6BPWVP/uWCk6gAzi9yo/aZF2Ew/k/3nDhua609FgSEEBagpiPn026T0WVmq99
	azZxWh3rZwf6feBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719238212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81epao7mtcGUyhXAVSERqp/rbrCtDeV0Xf2ybRmKfZM=;
	b=ZV3lv8fEd7Jdktv9x+NGXWoU0POa0Z9p5YZ01DDltYW5DaUSU+0/l8ly+GgF3x2e1zIuOo
	5wa/34/YxWsOJhUOnaDZXr6NdTbyPsp+KfIzNbaSt7ed7zYQA568Mmxof3QzhsCgayXVab
	BHRHgqTIyAfNBuYLpiJ78hY/AQHFgu4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719238212;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81epao7mtcGUyhXAVSERqp/rbrCtDeV0Xf2ybRmKfZM=;
	b=Fsi6jBCosleXGFL3gwrduQ1H2v4wXjRxAj0+dzEK4wHLGzbpQ2K8+wygtCiK2rl0u7Lfdw
	Vzi0TE1PEhtW29BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE3931384C;
	Mon, 24 Jun 2024 14:10:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id g2ozKUR+eWZHBAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 24 Jun 2024 14:10:12 +0000
Date: Mon, 24 Jun 2024 16:10:40 +0200
Message-ID: <871q4mph27.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aivaz <reichaivaz@gmail.com>
Cc: tiwai@suse.com,
	Aivaz Latypov <pngdrift@mail.ru>,
	kailang@realtek.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/relatek: Enable Mute LED on HP Laptop 15-gw0xxx
In-Reply-To: <CAGRy+7AqPTOC5AqWsD4YsoeNTcWTR=OgpVXepBSqBxAq2pxhGg@mail.gmail.com>
References: <20240623112510.81915-1-pngdrift@mail.ru>
	<CAGRy+7AqPTOC5AqWsD4YsoeNTcWTR=OgpVXepBSqBxAq2pxhGg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,mail.ru];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,mail.ru,realtek.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 24 Jun 2024 10:55:04 +0200,
Aivaz wrote:
> 
> 
> I'm sorry, but I didn't look at my vendor and device id correctly. Here's the
> right one:

Please resubmit as v2 patch.


thanks,

Takashi

> ---
> šsound/pci/hda/patch_realtek.c | 1 +
> š1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index f4454abadc8d..51225c5770ea 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -10067,6 +10067,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] =
> {
> š š š š SND_PCI_QUIRK(0x103c, 0x8786, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
> š š š š SND_PCI_QUIRK(0x103c, 0x8787, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
> š š š š SND_PCI_QUIRK(0x103c, 0x8788, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
> +š š š šSND_PCI_QUIRK(0x103Ó, 0x87d3, "HP Laptop 15-gw0xxx",
> ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
> š š š š SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx",
> ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
> š š š š SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
> š š š š SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC",
> ALC236_FIXUP_HP_GPIO_LED),
> 
> On Sun, 23 Jun 2024 at 16:25, Aivaz Latypov <reichaivaz@gmail.com> wrote:
> 
>     This HP Laptop uses ALC236 codec with COEF 0x07 controlling
>     the mute LED. Enable existing quirk for this device.
>    
>     Signed-off-by: Aivaz Latypov <reichaivaz@gmail.com>
>     ---
>     šsound/pci/hda/patch_realtek.c | 1 +
>     š1 file changed, 1 insertion(+)
>    
>     diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
>     index f4454abadc8d..51225c5770ea 100644
>     --- a/sound/pci/hda/patch_realtek.c
>     +++ b/sound/pci/hda/patch_realtek.c
>     @@ -10067,6 +10067,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl
>     [] = {
>     š š š š SND_PCI_QUIRK(0x103c, 0x8786, "HP OMEN 15",
>     ALC285_FIXUP_HP_MUTE_LED),
>     š š š š SND_PCI_QUIRK(0x103c, 0x8787, "HP OMEN 15",
>     ALC285_FIXUP_HP_MUTE_LED),
>     š š š š SND_PCI_QUIRK(0x103c, 0x8788, "HP OMEN 15",
>     ALC285_FIXUP_HP_MUTE_LED),
>     +š š š šSND_PCI_QUIRK(0x10ec, 0x0236, "HP Laptop 15-gw0xxx",
>     ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>     š š š š SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx",
>     ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>     š š š š SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
>     š š š š SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC",
>     ALC236_FIXUP_HP_GPIO_LED),
>     --
>     2.45.2
> 
