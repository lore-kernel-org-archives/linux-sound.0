Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E744C338909
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 09:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763717797; cv=none; b=OCIoQ6wrsuvpmPVkKrzj1r5/JWAWbu1UXDX69V8e6scdP0zY/4af6p2pAS4/L1OcV7WvFTfx8Go0uFYtvJO0+Z6tADtovEH9ngoRU/kgjNQXU2OSZmiQ4eOhzEivcZ0VGkpYGOUJE1B6K/wCEU25cogtHd+0DL0n2IJ0A1Ql8ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763717797; c=relaxed/simple;
	bh=y9hdKvjpVgnhEZYAtxRRj+8yacwkCS7QQMJZtKcPuJM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z7MlVP/kGriTmoQutzg4cQHOhTW0Tvd9rcMNsdpE6VAWC7ygihySEsGsMHTkp6BtDCX2dR+WlKfGEcULvuDi1V8BCgDRERjw8Qw0SMDty3cufT7j4ppw7iL1WfIyipwE/8t+d5BBjT1Z92AWlLX764zfqOjYYerqI3tG1QB7kFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GrqBQadO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XLr262B8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XW/sN6AO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sgAVjYmG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GrqBQadO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XLr262B8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XW/sN6AO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sgAVjYmG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E65EA20F2E;
	Fri, 21 Nov 2025 09:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763717794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=do3usc9lsCv1NdtlDu1wz+b4fFGLHC2NBsryKfp6ltA=;
	b=GrqBQadObgZAt6vMCiT9i6z6EI9fGA/KofrgsPJW7TQzUOlO/4BbhTFiri4uPM7nEuAJO4
	Xf69TeXWYWHw8MT1yeUUd2sCvCnwA2oMya67xVwwJpXAPIWvkCmSD2nKm4YA9xCEYNCTcr
	9qjih9XxR36EaabVpjfUB4sthMbZ9O8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763717794;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=do3usc9lsCv1NdtlDu1wz+b4fFGLHC2NBsryKfp6ltA=;
	b=XLr262B8QRpMdlCJYHfOkfvfqc3YkZt4XfZniB9q1AKmn6A3oHLlue5pkYgIGf4AefFCq9
	psKK+28sd2eBzvCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="XW/sN6AO";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sgAVjYmG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763717793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=do3usc9lsCv1NdtlDu1wz+b4fFGLHC2NBsryKfp6ltA=;
	b=XW/sN6AO9MxeEczuF/PSyqeLRR/pzJGrBSA5eKJUOazvydumzegProirKWy5yqaUuk59MT
	04qAFLIJWQbJj/kKnr4WEsZ1AofOb1itvAWZBFqtv4OVEWYLhqscU7U2q13SFp6B1LXrLd
	phhM7O7B6hxdvkJx63UM1lYYejm43T8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763717793;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=do3usc9lsCv1NdtlDu1wz+b4fFGLHC2NBsryKfp6ltA=;
	b=sgAVjYmGg1qWmQKyfWXpehJbcnKkRPPnaiUJMJlMwYLtvu6Hb9E5eL3EI1SLXXMa93Gmbb
	NvA97Y+3NjvgNdDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC6BE3EA61;
	Fri, 21 Nov 2025 09:36:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1+awLKEyIGlueQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 21 Nov 2025 09:36:33 +0000
Date: Fri, 21 Nov 2025 10:36:33 +0100
Message-ID: <87a50f4ti6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ilyas Gasanov <torso.nafi@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP ProBook 450 G8
In-Reply-To: <CAEo2pzvpEXYZzpLXesDp=wvQJ7VN8yaVZZDkCMvFzKySaezf_A@mail.gmail.com>
References: <CAEo2pzvpEXYZzpLXesDp=wvQJ7VN8yaVZZDkCMvFzKySaezf_A@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E65EA20F2E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Spam-Score: -2.01

On Thu, 20 Nov 2025 20:15:47 +0100,
Ilyas Gasanov wrote:
> 
> My laptop, HP ProBook 450 G8 (32M40EA), has Realtek ALC236 codec on its
> integrated sound card, and uses GPIO pins 0x2 and 0x1 for speaker mute
> and mic mute LEDs correspondingly, as found out by me through hda-verb
> invocations. This matches the GPIO masks used by the
> alc236_fixup_hp_gpio_led() function.
> 
> PCI subsystem vendor and device IDs happen to be 0x103c and 0x8a75,
> which has not been covered in the ALC2xx driver code yet.
> 
> Signed-off-by: Ilyas Gasanov <torso.nafi@gmail.com>

The code change looks good, but the patch isn't cleanly applicable due
to the line breaks by your mailer.
Could you try to resubmit with the proper setup?


thanks,

Takashi

> ---
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c
> b/sound/hda/codecs/realtek/alc269.c
> index 6748057e6a14..10c83cd3460e 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -6590,6 +6590,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x103c, 0x8a4f, "HP Victus 15-fa0xxx (MB 8A4F)",
> ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
>  	SND_PCI_QUIRK(0x103c, 0x8a6e, "HP EDNA 360", ALC287_FIXUP_CS35L41_I2C_4),
>  	SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC",
> ALC236_FIXUP_HP_GPIO_LED),
> +	SND_PCI_QUIRK(0x103c, 0x8a75, "HP ProBook 450 G8 Notebook PC",
> ALC236_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8a78, "HP Dev One",
> ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
>  	SND_PCI_QUIRK(0x103c, 0x8aa0, "HP ProBook 440 G9 (MB 8A9E)",
> ALC236_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8aa3, "HP ProBook 450 G9 (MB 8AA1)",
> ALC236_FIXUP_HP_GPIO_LED),
> -- 
> 2.51.0
