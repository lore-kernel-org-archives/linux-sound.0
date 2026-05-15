Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A21472782
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 10:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842116; cv=none; b=DK1dqBk9+BiVsOctDo5vQ8u2/mhBZgYRhuRxdVrf9cuaCFqscN8XAFr/hKlRPK75uu5KyMvT01ITlcHBg7By3tJdggqG8UMrZzIh+EQRHrn4GERnVYOaDrGJY33Mh7fAQzW18Xg0mcj9lp/UwhKAt6UQN1WFZLZFikLNiWEtugM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842116; c=relaxed/simple;
	bh=SKGGNxlyMoLJw0DaqysbWwIdyO0X5QHVu9AjF7mR74E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XSGjMziH8/ioGhIhPMRtmH0dgR8VlMM61RHLxWGPj19ui7zLn4ib6EqNHAvZXbMBjaOdAdWCQYlKfVoPSkYQKB6UvEXflfQcIpHgDrwAKL0qx3CmGwaBiA7U9q5MFfZ/kLVUnL2Ht3Ls7QuD6z4Kx8Y2oLXaHAHNQvki1yp8dE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LAvguZXW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Dj+Bcw2D; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Mf45raKK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dYrIfAe8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LAvguZXW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Dj+Bcw2D";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Mf45raKK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dYrIfAe8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AE55B67712;
	Fri, 15 May 2026 10:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778842112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7L+mhZzwXHJZRtReNZxoRvd/s2WDFWlpQ1M8SBXnRSI=;
	b=LAvguZXWLQ1ZoJu0PR9rUGYPyuPQjhEaF1Jpy+96O4Wy6mjJiuUUBXKP9sJ4WQ/MjYWx8i
	rZ/x12OYhJGa/Xe8Io57ZfzOYD3Bsz4ZKawTfs6zYltFE7s8iGPLWuMmjOKfdxf0iPFda9
	GcohoiflLqt4RY5WHR0bIILwfMl8rEo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778842112;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7L+mhZzwXHJZRtReNZxoRvd/s2WDFWlpQ1M8SBXnRSI=;
	b=Dj+Bcw2DgGPRETNQ0XgQkrFEdtCy2yDgX1T5t/nHoeGBrsxV4bdRZtHAHiST0LLUym8AdD
	MqcWR5uHmnQQeOAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Mf45raKK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dYrIfAe8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778842108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7L+mhZzwXHJZRtReNZxoRvd/s2WDFWlpQ1M8SBXnRSI=;
	b=Mf45raKKBLPVZXC7739crZus4PIVkUInoNm0vDduwx6Vvdf1ZAuIwwEofGQOQmjlKglPlA
	zMKfLHGPFr9Sa/wHkgxiccxRFPsVmgWpTFzDYcsgXvJ2QZGPmbxXh8sPte5QZm0CLySvx2
	FiTqH/pjxmRJsVu3uvxmu5nMF1Wa5OI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778842108;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7L+mhZzwXHJZRtReNZxoRvd/s2WDFWlpQ1M8SBXnRSI=;
	b=dYrIfAe8gi2/QV17oRKaqSNOIUfWstNCSanC5CJPEWHPMABPD9TF7s7Oh2y3k4p1BRN7be
	tGL7M3V8jm0un7Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 85426593A9;
	Fri, 15 May 2026 10:48:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0BM9H/z5BmqyQgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 10:48:28 +0000
Date: Fri, 15 May 2026 12:48:28 +0200
Message-ID: <874ik9t0cj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Heiko S <heiko@future-machines.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	"linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>,
	"tiwai@suse.com"
 <tiwai@suse.com>,
	"perex@perex.cz" <perex@perex.cz>
Subject: Re: [PATCH] ALSA: hda: Fix SSID detection for HP Dragonfly Folio G3
In-Reply-To: <04D6DA87-AFD0-44CA-800E-0BA15BEAEA61@getmailspring.com>
References: <87pl2xt57c.wl-tiwai@suse.de>
	<04D6DA87-AFD0-44CA-800E-0BA15BEAEA61@getmailspring.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,future-machines.org:url,future-machines.org:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email,suse.de:mid,future-machines.org:url,future-machines.org:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: AE55B67712
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Fri, 15 May 2026 12:46:11 +0200,
Heiko S wrote:
> 
> 
> Tested-by: Heiko Schmid heiko@future-machines.org
> 
> Confirmed working on HP Dragonfly Folio 13.5 inch G3 with Fedora 44, kernel
> 6.19.14.

Thanks for quick testing.  I'm going to submit a proper patch.


Takashi

> 
>  Dr. Heiko Schmid              
>  http://www.future-machines.org
> On Mai 15 2026, at 11:03 am, Takashi Iwai <tiwai@suse.de> wrote:
> 
>     On Thu, 14 May 2026 15:31:10 +0200,
>     Heiko Schmid wrote:
>     >
>     > The HP Dragonfly Folio 13.5 inch G3 (PCI SSID 103c:8a05/8a06) BIOS does
>     > not program the PCI subsystem ID correctly when the SOF audio driver is
>     > used. This causes the codec fixup lookup to fail as the PCI SSID reads
>     > as 0x0000:0x0000 instead of the correct 103c:8a06.
>     >
>     > Fix this by falling back to the codec SSID when the PCI SSID is zero,
>     > and add the device-specific quirk entry for the HP Dragonfly Folio G3.
>     >
>     > Signed-off-by: Heiko Schmid <heiko@future-machines.org>
>    
>     I think the idea is good, but we don't have to restrict to both PCI
>     vendor and device being 0; PCI device 0 is used for wildcard, and
>     can't work in anyway.
>    
>     About the patch:
>    
>     > ---
>     > sound/hda/codecs/realtek/alc269.c | 2 ++
>     > sound/hda/common/auto_parser.c | 10 ++++++++++
>     > 2 files changed, 12 insertions(+)
>     >
>     > diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/
>     realtek/alc269.c
>     > index 22b2f67..494dd0a 100644
>     > --- a/sound/hda/codecs/realtek/alc269.c
>     > +++ b/sound/hda/codecs/realtek/alc269.c
>     > @@ -6990,6 +6990,8 @@ static const struct hda_quirk alc269_fixup_tbl[] =
>     {
>     > SND_PCI_QUIRK(0x103c, 0x89ae, "HP EliteBook 650 G9",
>     ALC236_FIXUP_HP_GPIO_LED),
>     > SND_PCI_QUIRK(0x103c, 0x89c0, "HP ZBook Power 15.6 G9",
>     ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
>     > SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio 13.5 G3",
>     ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
>     > + SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio 13.5 G3",
>     ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
>     > + SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio 13.5 G3",
>     ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
>    
>     Those additions are simply superfluous, no? Also...
>    
>     > diff --git a/sound/hda/common/auto_parser.c b/sound/hda/common/
>     auto_parser.c
>     > index 8923813..e876378 100644
>     > --- a/sound/hda/common/auto_parser.c
>     > +++ b/sound/hda/common/auto_parser.c
>     > @@ -1048,6 +1048,16 @@ void snd_hda_pick_fixup(struct hda_codec *codec,
>     > if (codec->bus->pci) {
>     > pci_vendor = codec->bus->pci->subsystem_vendor;
>     > pci_device = codec->bus->pci->subsystem_device;
>     > + /* Fallback: use codec SSID if PCI SSID is zero (e.g. HP Dragonfly
>     Folio G3 with SOF) */
>     > + if (!pci_vendor && !pci_device) {
>     > + pci_vendor = codec->core.subsystem_id >> 16;
>     > + pci_device = codec->core.subsystem_id & 0xffff;
>     > + }
>     > + /* Fallback: use codec SSID if PCI SSID is zero (e.g. HP Dragonfly
>     Folio G3 with SOF) */
>     > + if (!pci_vendor && !pci_device) {
>     > + pci_vendor = codec->core.subsystem_id >> 16;
>     > + pci_device = codec->core.subsystem_id & 0xffff;
>     > + }
>    
>     ... here checking twice? The patch looks somehow odd-merged.
>    
>     And, I think we can just skip the PCI matching when either vendor or
>     device is 0. So, something like below instead.
>    
>     Could you verify whether it works?
> 
>     Takashi
>    
>     diff --git a/sound/hda/common/auto_parser.c b/sound/hda/common/
>     auto_parser.c
>     index 8923813ce424..5bc95d3116ff 100644
>     --- a/sound/hda/common/auto_parser.c
>     +++ b/sound/hda/common/auto_parser.c
>     @@ -1013,7 +1013,7 @@ void snd_hda_pick_fixup(struct hda_codec *codec,
>     const char *name = NULL;
>     const char *type = NULL;
>     unsigned int vendor, device;
>     - u16 pci_vendor, pci_device;
>     + u16 pci_vendor = 0, pci_device = 0;
>     u16 codec_vendor, codec_device;
>    
>     if (codec->fixup_id != HDA_FIXUP_ID_NOT_SET)
>     @@ -1066,7 +1066,7 @@ void snd_hda_pick_fixup(struct hda_codec *codec,
>     /* match primarily with the PCI SSID */
>     for (q = quirk; q->subvendor || q->subdevice; q++) {
>     /* if the entry is specific to codec SSID, check with it */
>     - if (!codec->bus->pci || q->match_codec_ssid) {
>     + if (!pci_vendor || !pci_device || q->match_codec_ssid) {
>     if (hda_quirk_match(codec_vendor, codec_device, q)) {
>     type = "codec SSID";
>     goto found_device;
> 
