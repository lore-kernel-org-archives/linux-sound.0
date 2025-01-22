Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6341B6D09
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 08:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737535994; cv=none; b=chwLKKTZJcakoL0fYCGQ86UdrZiOOABdPrX1BbArNAIAfSl/t2ec0nN0EEn6Vebyx5F/xie4cybfBSG9tty88Cx5FKQjpDi7uPcrZ3ziXERXzgZwXQ+geOKO7oB9jM4HFnV6UriyVNEGou3SRdBFgCoN/GscEilJXZIGHjCUYPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737535994; c=relaxed/simple;
	bh=6+IE2nJu/YccH7E75d2Rh81/VCQj91wosw3kbYFsS98=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pK4BycyjFBQ/g4AMyUQyX6AMIWKk2EwrHTqXKxR1fZ4ao0xRtRxe3C5dacSddlTQCcG8cb8oiZ7HY/rrh7noVALoUN8+8K5Ssd31ryA/+OoZOi9/WfPaVG+RlwNxyZ46j/4qeeO0BPx1DI7ugzHPvlovqfMwPdGhm5zTb7cellY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tu2bVm2X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/n9opB8L; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tu2bVm2X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/n9opB8L; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tu2bVm2X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/n9opB8L";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tu2bVm2X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/n9opB8L"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9949321239;
	Wed, 22 Jan 2025 08:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737535990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5h+tCAL+biOM8/Gb3O5WKppp7X42X9xZjUcPcc4vd54=;
	b=tu2bVm2XSR+LfqsAFe3vsbZttPIMwGDI1SkvW4KjiKEZwQ1rPvBlio3PiQhkraTfxYdqGu
	Fgb1qv8I9NsmvJJc0sOnGhtjUy7XMGfjDqAvu0GkK0GBn1CJAfknAVktQBnqzwRPtFMivC
	r3mEi4rXvgJMWVZkUBFo8b21FRyZC0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737535990;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5h+tCAL+biOM8/Gb3O5WKppp7X42X9xZjUcPcc4vd54=;
	b=/n9opB8LjQiK/zVLS+R6Uoll0BPSzAafNyUvpCSCqZDS5UKy7xTzsMpsTH0fa/wpOYv05k
	15OFdrx8l5xOkTCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tu2bVm2X;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/n9opB8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737535990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5h+tCAL+biOM8/Gb3O5WKppp7X42X9xZjUcPcc4vd54=;
	b=tu2bVm2XSR+LfqsAFe3vsbZttPIMwGDI1SkvW4KjiKEZwQ1rPvBlio3PiQhkraTfxYdqGu
	Fgb1qv8I9NsmvJJc0sOnGhtjUy7XMGfjDqAvu0GkK0GBn1CJAfknAVktQBnqzwRPtFMivC
	r3mEi4rXvgJMWVZkUBFo8b21FRyZC0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737535990;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5h+tCAL+biOM8/Gb3O5WKppp7X42X9xZjUcPcc4vd54=;
	b=/n9opB8LjQiK/zVLS+R6Uoll0BPSzAafNyUvpCSCqZDS5UKy7xTzsMpsTH0fa/wpOYv05k
	15OFdrx8l5xOkTCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7EB33136A1;
	Wed, 22 Jan 2025 08:53:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id caSQHfaxkGdUNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 22 Jan 2025 08:53:10 +0000
Date: Wed, 22 Jan 2025 09:53:10 +0100
Message-ID: <87v7u76xhl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Samantha Glocker <iam@anislandsomewhere.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: possible issue with ALSA: hda/realtek: Use codec SSID matching for Lenovo devices
In-Reply-To: <878qr38g6r.wl-tiwai@suse.de>
References: <CAGPQRHYd48U__UKYj2jJnT4+dnNNoWRBi+wj6zPRn=JpNMBUrg@mail.gmail.com>
	<87a5bj8gax.wl-tiwai@suse.de>
	<878qr38g6r.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 9949321239
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Wed, 22 Jan 2025 08:23:56 +0100,
Takashi Iwai wrote:
> 
> On Wed, 22 Jan 2025 08:21:26 +0100,
> Takashi Iwai wrote:
> > 
> > On Wed, 22 Jan 2025 01:58:16 +0100,
> > Samantha Glocker wrote:
> > > 
> > > Hi, I'm a kernel maintainer from nobara and ASUS-Linux.
> > > 
> > > I've bifurcated an issue with sound on Lenovo Legion laptop(s)
> > > starting from mainline 6.12.5, verified on Fedora proper, Nobara, and
> > > CachyOS.
> > > 
> > > From the changelog,
> > > https://patch.msgid.link/20241008120233.7154-4-tiwai@suse.de looks
> > > like a likely candidate due to touching TAS2781 / TIA2781.
> > > 
> > > The issue will possibly affect sound on any or all Lenovo Legion Gen 8 and 9.
> > > 
> > > The obvious difference in dmesg on my Legion Pro 7 Gen 8 (16ARX8H) on
> > > 6.12.5, is the following line is completely missing:
> > > [    4.761665] snd_hda_codec_realtek hdaudioC1D0: bound
> > > i2c-TIAS2781:00 (ops tas2781_hda_comp_ops
> > > [snd_hda_scodec_tas2781_i2c])
> > > 
> > > This suggests the TI amplifier is never identified.
> > 
> > What's the exact problem?  Is it a regression?  Any original report on
> > the bug tracker or such?
> 
> ... and if it's a regression, please give alsa-info.sh outputs from
> both working and non-working cases.  Run the script with --no-upload
> option and attach the outputs.

If it's a device with PCI SSID 17aa:386f, the patch below might fix.
Let me know if it is.


thanks,

Takashi

-- 8< --
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10918,7 +10918,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3869, "Lenovo Yoga7 14IAL7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	HDA_CODEC_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x386e, "Yoga Pro 7 14ARP8", ALC285_FIXUP_SPEAKER2_TO_DAC1),
-	HDA_CODEC_QUIRK(0x17aa, 0x386f, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C),
+	HDA_CODEC_QUIRK(0x17aa, 0x38a8, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C), /* this must match before PCI SSID 17aa:386f below */
 	SND_PCI_QUIRK(0x17aa, 0x386f, "Legion Pro 7i 16IAX7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3870, "Lenovo Yoga 7 14ARB7", ALC287_FIXUP_YOGA7_14ARB7_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3877, "Lenovo Legion 7 Slim 16ARHA7", ALC287_FIXUP_CS35L41_I2C_2),

