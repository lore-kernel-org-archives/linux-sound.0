Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD0D410D19
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 11:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843553; cv=none; b=e3bExtHURLOtJBd+l7m0pBNDpDe/g5JrlfsVUSpKyvjmskAesY2VgZbnjouegvZ+eg+lFRSa/optdRJA6l9ALw7emw4SiP2sMUk2RR5RzOWtOyJH7BXT0+NQA9RfJQFFFwHTuUhPfPQqSNQGNjkZ62L/FIUoQQvNAerpoiAjTeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843553; c=relaxed/simple;
	bh=WeWFA/ilZr30uERZlm9h28hKEH3yURstDDWwuoU4knE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UQsyrZ0YerLUvdJYR9tZD5o87PDDTdp1oicLNEON23l1bdHs7/FiVijDIHioQ0ko8hgNum4kCL+y/zmHNoi+YFTOr9ewdSWYChdhEcqOOIP6BfWzBe2qPaONYxvp1FM7mzDO1S/Lrbrd0me1d2Nkjtt+J21DlasbQxZVXtfk7cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mDCxW+9q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ya+QjTc4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NTpUiEGd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0DtQqU56; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mDCxW+9q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ya+QjTc4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NTpUiEGd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0DtQqU56"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E96B467487;
	Fri, 15 May 2026 11:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778843549; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C6OlyRB0ARVfZFrXpjyj0wW55rTlZeuB5f/1FmUKhQY=;
	b=mDCxW+9qaoh7iPvOYz5IVKBuXNwI+PYl0nQ6OvW+csGDGozqYxxYYu+SyLoT5uHYmZIoGX
	pkRcGVG1j5lBRW4yGkF38om4GkEkGcrThI5T0tlKERaxUmRN7KLSFIiUET/YbRYhKp3E/n
	RuwTZn8EEG+QIXdJwyWhPBAoKYJuIlM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778843549;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C6OlyRB0ARVfZFrXpjyj0wW55rTlZeuB5f/1FmUKhQY=;
	b=Ya+QjTc4D1J+/yvYVUIxIygVLAgo928uMQWDNSnWziw2+cj3awbI17lK1Zy4Lp+4ctdRPv
	kEM06NTpaavra5AA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778843548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C6OlyRB0ARVfZFrXpjyj0wW55rTlZeuB5f/1FmUKhQY=;
	b=NTpUiEGdQAZENEFyw8nktMOS2qMvMfIA2seoWMwA6wCVvrxgi1FdrwAq1/LvrgoidzsCcv
	WUjjkqYz4w3/d5ndxdaOqtpfMof/iJRnEdZIHa698xLOZdTED5X/fuG6fb8sOb+nIk5j8Y
	ctDRL9KqAMSS+JKDJIQG8x0dOyiKejM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778843548;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C6OlyRB0ARVfZFrXpjyj0wW55rTlZeuB5f/1FmUKhQY=;
	b=0DtQqU56+g1cVW4MeMyhSUYgKmEFj8s368HqfHVWLscfVP7Jf6yiDb0r7xQkhbP2uGN/AT
	lzXarJibBsLdM2Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AEC18593A9;
	Fri, 15 May 2026 11:12:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZXhzKZz/BmokWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 11:12:28 +0000
Date: Fri, 15 May 2026 13:12:28 +0200
Message-ID: <8733ztsz8j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Stefan Binding (Opensource)" <sbinding@opensource.cirrus.com>
Cc: "'Takashi Iwai'" <tiwai@suse.de>,
	"'Heiko Schmid'" <heiko@future-machines.org>,
	<linux-sound@vger.kernel.org>,
	<tiwai@suse.com>,
	<perex@perex.cz>
Subject: Re: [PATCH] ALSA: hda: Fix SSID detection for HP Dragonfly Folio G3
In-Reply-To: <000b01dce45b$2dcdef60$8969ce20$@opensource.cirrus.com>
References: <20260514133110.12302-1-heiko@future-machines.org>
	<87pl2xt57c.wl-tiwai@suse.de>
	<000b01dce45b$2dcdef60$8969ce20$@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,future-machines.org:email,imap1.dmz-prg2.suse.org:helo,suse.com:email,perex.cz:email]
X-Spam-Level: 

On Fri, 15 May 2026 13:08:37 +0200,
Stefan Binding (Opensource) wrote:
> 
> Hi,
> 
> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Friday, May 15, 2026 10:04 AM
> > To: Heiko Schmid <heiko@future-machines.org>
> > Cc: linux-sound@vger.kernel.org; tiwai@suse.com; perex@perex.cz
> > Subject: Re: [PATCH] ALSA: hda: Fix SSID detection for HP Dragonfly Folio
> G3
> > 
> > On Thu, 14 May 2026 15:31:10 +0200,
> > Heiko Schmid wrote:
> > >
> > > The HP Dragonfly Folio 13.5 inch G3 (PCI SSID 103c:8a05/8a06) BIOS
> > > does not program the PCI subsystem ID correctly when the SOF audio
> > > driver is used. This causes the codec fixup lookup to fail as the PCI
> > > SSID reads as 0x0000:0x0000 instead of the correct 103c:8a06.
> > >
> > > Fix this by falling back to the codec SSID when the PCI SSID is zero,
> > > and add the device-specific quirk entry for the HP Dragonfly Folio G3.
> > >
> > > Signed-off-by: Heiko Schmid <heiko@future-machines.org>
> > 
> > I think the idea is good, but we don't have to restrict to both PCI vendor
> and
> > device being 0; PCI device 0 is used for wildcard, and can't work in
> anyway.
> > 
> > About the patch:
> > 
> > > ---
> > >  sound/hda/codecs/realtek/alc269.c |  2 ++
> > >  sound/hda/common/auto_parser.c    | 10 ++++++++++
> > >  2 files changed, 12 insertions(+)
> > >
> > > diff --git a/sound/hda/codecs/realtek/alc269.c
> > > b/sound/hda/codecs/realtek/alc269.c
> > > index 22b2f67..494dd0a 100644
> > > --- a/sound/hda/codecs/realtek/alc269.c
> > > +++ b/sound/hda/codecs/realtek/alc269.c
> > > @@ -6990,6 +6990,8 @@ static const struct hda_quirk alc269_fixup_tbl[] =
> > {
> > >  	SND_PCI_QUIRK(0x103c, 0x89ae, "HP EliteBook 650 G9",
> > ALC236_FIXUP_HP_GPIO_LED),
> > >  	SND_PCI_QUIRK(0x103c, 0x89c0, "HP ZBook Power 15.6 G9",
> > ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
> > >  	SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio 13.5 G3",
> > > ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
> > > +	SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio 13.5 G3",
> > ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
> > > +	SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio 13.5 G3",
> > > +ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
> > 
> > Those additions are simply superfluous, no?  Also...
> 
> We've investigated laptop 103c:8a06 before. Unfortunately, it requires a
> BIOS update for Linux support, since it's a 4 amp laptop, but only has 2 SPI
> resources in ACPI.
> Even if you add the entries, it shouldn't work. I also don't see the
> "original" entry in the repository anywhere - there should be no entry for
> this laptop. 

Thanks for the information.

The quirk matching fix would be still useful, though, so I'm going to
pick it.


Takashi
