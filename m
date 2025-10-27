Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D58326FA50
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761555544; cv=none; b=Lg9k5xIYJeOelO7id/nvb2g5HkecWKHGLNLlD1qZqj8lf/0WqLPJKnOXCphrNGdbzkiev1C7bAHVm+FneRVgKU0slHS8cO/A7aSIW97kv7c/EETzUlpS090RfTI+uyH74zMb+AzLQeopJ0liSjpImQKBHpPVIRiwIorxz8BIKDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761555544; c=relaxed/simple;
	bh=2WHSEqeemhJpzbBVP8tm7y2H3yFrDhpgfZDGH6niYKM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LoNHoZwu0jD6daCbVdKahW8sNp1XF0qKLBDeflPPO05ZwcbKvzmex2WvR8A95rj3ZIEDC1m1wtrZneOA6+7Cj9MiXRMZzKRZdsS14aMFCUNBk+c4DOxemj8/u++dfitDqLKrt28GTHg8fl8LG1Y955VZIk7HQr9DR8NmLukq2sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C3dmeqoO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fd8LD0Bn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KJ2m6/Ce; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mL9+LAXV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C3dmeqoO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fd8LD0Bn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KJ2m6/Ce";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mL9+LAXV"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E07681F385;
	Mon, 27 Oct 2025 08:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761555535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=91+rEh/YvJhSQXQlsKTaM83oaTi9i53z8kceUaZVWr8=;
	b=C3dmeqoOqspjKBp+LgvZVwZNyJrpz7hfv6YN2vH0jAmFiG0YqP6FyYKbXd2E52lXbvw7bu
	8EfRMxLOmmHZxFPMoqY+BSZOQkVz1YF742NFha9cg6MrdG5U/qW4vuvdiCjizSdkTJo/d4
	oKSUlXpwzhnElrRjHbvN4l1zDcn6yak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761555535;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=91+rEh/YvJhSQXQlsKTaM83oaTi9i53z8kceUaZVWr8=;
	b=fd8LD0BnouejmKghBMyB0VK+Jg/1oF/O8tSGsxjf4DjPDxUY7ghv+ShgPEI1V3NEVJGTKY
	hv0WIL26FIiYVnDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761555534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=91+rEh/YvJhSQXQlsKTaM83oaTi9i53z8kceUaZVWr8=;
	b=KJ2m6/CevjG6VPsU1EXojP1zOrBFx/k8jI+I1S8W2JOct9PbjlqSBKB6pFEYb5UChCaLSa
	+4CHry17DrusDjMjOuH82pYjNZqO+OhEVHGT7cEz+yGwfouXokE753Vpoe5fXlr4jzgrup
	g3M9gKaE9x1clX5qp2UD2aBQrMMA44Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761555534;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=91+rEh/YvJhSQXQlsKTaM83oaTi9i53z8kceUaZVWr8=;
	b=mL9+LAXVMSHKy3Es2FIOoeyHLzIbNP7i1AUDWHuu6T+Epa5PjPrr+vyviUF2qMX5+kAsGG
	qMal3kHTSv128mCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BEEAB136CF;
	Mon, 27 Oct 2025 08:58:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OE04LU40/2iLPgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Oct 2025 08:58:54 +0000
Date: Mon, 27 Oct 2025 09:58:54 +0100
Message-ID: <87ms5c3elt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: ern775 <eren.demir2479090@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/realtek: Fix mute led for HP Victus 15-fa1xxx (MB 8C2D)
In-Reply-To: <20251019092134.3422-1-eren.demir2479090@gmail.com>
References: <20251019092134.3422-1-eren.demir2479090@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sun, 19 Oct 2025 11:21:10 +0200,
ern775 wrote:
> 
> The quirk for Victus 15-fa1xxx wasn't working on Victus 15-fa1031nt due to a different board id. This patch enables the existing quirk for the board id 8BC8.
> 
> Tested on HP Victus 15-fa1031nt (MB 8C2D). The LED behaviour works as intended.
> 
> Signed-off-by: ern775 <eren.demir2479090@gmail.com>

The Signed-off-by line is a legal requirement, so it (also the From
line) can't be with an anonymous name, but should be with a publicly
known identity like your real name.  See
Documentation/process/submitting-patches.rst for details.

Please resubmit with the correction.


thanks,

Takashi


> ---
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 6b9e5c091bf3..522d4792ec59 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -6577,6 +6577,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x103c, 0x8c16, "HP Spectre x360 2-in-1 Laptop 16-aa0xxx", ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX),
>  	SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre 16", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x103c, 0x8c21, "HP Pavilion Plus Laptop 14-ey0XXX", ALC245_FIXUP_HP_X360_MUTE_LEDS),
> +	SND_PCI_QUIRK(0x103c, 0x8c2d, "HP Victus 15-fa1xxx (MB 8C2D)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
>  	SND_PCI_QUIRK(0x103c, 0x8c30, "HP Victus 15-fb1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
>  	SND_PCI_QUIRK(0x103c, 0x8c46, "HP EliteBook 830 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8c47, "HP EliteBook 840 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
> -- 
> 2.51.0
> 
