Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262583161B5
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 14:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764684685; cv=none; b=GzMlln+HZaWmgaSL36IDkHwrA8WC/zXj3PoH6mCHQZEng1MurGBvTLu1w1yUqq+KHOphpreyWyXRh2+eRY5yZ7mZDfCrrAriDywirR1KwofpnqI1i3YF+hKkPnq/CVIgS37/ZP+ROdS1Pg6nwAcso/BknOwWQIJ4MN6Ftt16UsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764684685; c=relaxed/simple;
	bh=i+NOMqe3W+mbiMSEB85YKovUVGexj2PGhDQt8vijn6w=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=KC9YcMJjs6OJltK5+/i+cSL7fHqqJGm+wZ/T9bDQ3lsLezzVb86uxQXsfCAt1HUDq5lCDFgLQNAxiCra7lLbAw794E9WEOeCW1OavTqYCMLfUy0DR9xwWcJFmqV98fC7NbrGh5PiBwFAUbbY0PX84k8mwAtrdANBpEa7CDVlR9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gsnoff.com; spf=pass smtp.mailfrom=gsnoff.com; dkim=pass (2048-bit key) header.d=gsnoff.com header.i=@gsnoff.com header.b=swcBH/Ii; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gsnoff.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gsnoff.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gsnoff.com header.i=@gsnoff.com header.b="swcBH/Ii"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4dLN3n0XCdzB0Wk;
	Tue,  2 Dec 2025 15:11:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gsnoff.com; s=MBO0001;
	t=1764684677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xoQchs2sd50ixyX8ksRbcRvr5kfuox3c35UY5nHjvk8=;
	b=swcBH/IiTvfmWaxtFXwVowgiN/W8iHGBO1AlLQ9G73L0MPyjwkB9JaAieoCNpjg9fH63Qr
	aDLL/HI7uEBFDI9g9GEq8X/ArKBYpmdhUYFN5QbMV8RUHbovN8DDR+Wo+82ENdLBucbZXK
	0mXfsC0HTrpLP7Ry/eppP+InZFygr/CDHjAIbwCeuQ9GSPu9cwZR+9f/arD+mr92kDM+m8
	bGzQe+i2qKCghuewbL2mPQNGK+8sljBB2gjjZnHQ7CvzV3nM65OHn0qZZhAdDOh0RL+rNo
	5IdC9PnOHO/CAybDK22cfKcBbKlFMaIrQl+srSI5uVeSuhsQc2t75h+HBqf9Uw==
Date: Tue, 2 Dec 2025 18:11:16 +0400 (GET)
From: Ilyas Gasanov <public@gsnoff.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Message-ID: <1338370824.94568.1764684676200@app.mailbox.org>
In-Reply-To: <877bv5uia5.wl-tiwai@suse.de>
References: <20251202131508.56184-1-public@gsnoff.com>
 <877bv5uia5.wl-tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/realtek: Add codec IDs to HP ProBook G8
 fixups
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal

On Tue, 02 Dec 2025 17:26 +0400,
Takashi Iwai wrote:
> 
> On Tue, 02 Dec 2025 14:15:08 +0100,
> Ilyas Gasanov wrote:
> > 
> > According to amixer output, as well as the result value of the
> > GET_SUBSYSTEM_ID HDA verb, the codec's own subsystem ID may differ from
> > that of the HDA controller.
> > 
> > The snd_hda_pick_fixup() function specifically inspects just the codec's
> > subsystem ID, ignoring that of the controller, which causes mismatch on
> > machines where the above is the case, unless the codec's subsystem ID is
> > also covered.
> > 
> > For reference:
> > 
> >  - https://linux-hardware.org/?probe=9829e4ea09&log=amixer
> >    (HP ProBook 440 G8, MB 8A74, codec 10ec0236,103c8a7a)
> >  - https://linux-hardware.org/?probe=5b2ca9b826&log=amixer
> >    (HP ProBook 450 G8, MB 8A75, codec 10ec0236,103c8a7b)
> >  - https://linux-hardware.org/?probe=228aee06a5&log=amixer
> >    (HP ProBook 440 G8, MB 8A76, codec 10ec0236,103c8a7c)
> >  - https://linux-hardware.org/?probe=1cd4bf968d&log=amixer
> >    (HP ProBook 450 G8, MB 8A77, codec 10ec0236,103c8a7d)
> > 
> > Signed-off-by: Ilyas Gasanov <public@gsnoff.com>
> 
> The primary matching is with PCI SSID, not the codec SSID.

Good point. There is indeed a semantic difference between the SND_PCI_QUIRK() and HDA_CODEC_QUIRK() macros, specifically where the value of the .match_codec_ssid field is concerned.

> Do they have the same numbers on those machines?

From what it looks like:

 - https://linux-hardware.org/?probe=9829e4ea09&log=lspci
   Device:	00:1f.3
   Class:	Multimedia audio controller [0401]
   SVendor:	Hewlett-Packard Company [103c]
   SDevice:	... [8a74]
   (already covered)

 - https://linux-hardware.org/?probe=5b2ca9b826&log=lspci
   Device:	00:1f.3
   Class:	Multimedia audio controller [0401]
   SVendor:	Hewlett-Packard Company [103c]
   SDevice:	... [8a75]
   (already covered)

 - https://linux-hardware.org/?probe=228aee06a5&log=lspci
   Device:	00:1f.3
   Class:	Multimedia audio controller [0401]
   SVendor:	Hewlett-Packard Company [103c]
   SDevice:	... [8a76]
   (not covered yet)

 - https://linux-hardware.org/?probe=1cd4bf968d&log=lspci
   Device:	00:1f.3
   Class:	Multimedia audio controller [0401]
   SVendor:	Hewlett-Packard Company [103c]
   SDevice:	... [8a77]
   (not covered yet)

In short, PCI SSIDs 0x8a74 and 0x8a75 are already covered within alc269_fixup_tbl, but not 0x8a76 nor 0x8a77.

> 
> 
> thanks,
> 
> Takashi
> 
> > ---
> >  sound/hda/codecs/realtek/alc269.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> > index 4efc16ae6b5d..d34a196158aa 100644
> > --- a/sound/hda/codecs/realtek/alc269.c
> > +++ b/sound/hda/codecs/realtek/alc269.c
> > @@ -6599,6 +6599,10 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
> >  	SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
> >  	SND_PCI_QUIRK(0x103c, 0x8a75, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
> >  	SND_PCI_QUIRK(0x103c, 0x8a78, "HP Dev One", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
> > +	SND_PCI_QUIRK(0x103c, 0x8a7a, "HP ProBook 440 G8 (MB 8A74)", ALC236_FIXUP_HP_GPIO_LED),
> > +	SND_PCI_QUIRK(0x103c, 0x8a7b, "HP ProBook 450 G8 (MB 8A75)", ALC236_FIXUP_HP_GPIO_LED),
> > +	SND_PCI_QUIRK(0x103c, 0x8a7c, "HP ProBook 440 G8 (MB 8A76)", ALC236_FIXUP_HP_GPIO_LED),
> > +	SND_PCI_QUIRK(0x103c, 0x8a7d, "HP ProBook 450 G8 (MB 8A77)", ALC236_FIXUP_HP_GPIO_LED),
> >  	SND_PCI_QUIRK(0x103c, 0x8aa0, "HP ProBook 440 G9 (MB 8A9E)", ALC236_FIXUP_HP_GPIO_LED),
> >  	SND_PCI_QUIRK(0x103c, 0x8aa3, "HP ProBook 450 G9 (MB 8AA1)", ALC236_FIXUP_HP_GPIO_LED),
> >  	SND_PCI_QUIRK(0x103c, 0x8aa8, "HP EliteBook 640 G9 (MB 8AA6)", ALC236_FIXUP_HP_GPIO_LED),
> > -- 
> > 2.51.0
> >
