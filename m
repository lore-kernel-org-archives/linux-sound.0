Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A73E33342C
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 09:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974751; cv=none; b=J0Hrs9uc3s2Qpqi+2Il6aJyAw1CY8BUwI7y/BUa8CKX8UUuHgbyDWRIR4hw8DehuZbG0XOagKgslxIlECr+v4+AnclMBk6CwFhOeMhiN8tdywIWZBG0z6r4cFVJqYCkVjER1q7//iB5aC9NbVsTTQDyGcfQrkMfwBD9gIx2LezI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974751; c=relaxed/simple;
	bh=D4h/EDA6ms7AJ9Q4VdmjFlQcNxZQQ19Ir9ikHsLC0Q8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=arNuRHqVLPk5Y4L8f42sxFlheElsY+BhIlVS5brqoDrY/LOX6rjv4kAcbMVPwp5kN/cCbBKYIid+s+aqOGq7lGOaRMhf0kl43Gq712GUN7feg91TLGwUu3HDKDac8t4qfDpXALzLVmGB95E5EIANWGcIyr7ySN55nAfmvtQKZ5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Px9IalJA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M2T0apNW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Px9IalJA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M2T0apNW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Px9IalJA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M2T0apNW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Px9IalJA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M2T0apNW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8553D6A921;
	Tue,  5 May 2026 09:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777974747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZpmbFtG3fLzR1ot9v0B3eYwO0j9BzXXXsgF9aBg7SUo=;
	b=Px9IalJAtdxdZdjv6IFOYr9K1a8ULgYueaYQE0VngQOy3lnxQPWIqIH7znki4yv5rIzlbZ
	2wT9ckcTI+lHkXOn4UzZ6D+wYHAAQr5M/VEyfn4gR/Ly2r1/gKiWH8hXjrr1XDruY5nNx6
	9yI/I1zpd9fC6hwvhduRlbBzIfch85A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777974747;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZpmbFtG3fLzR1ot9v0B3eYwO0j9BzXXXsgF9aBg7SUo=;
	b=M2T0apNWLw3tWvahvLU9iAVbaoMo3QbO3DbWh/R1e84W3fhaPoTwR6mIjIgW1iID+QLTW6
	JosmTiGasQNzeCCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Px9IalJA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=M2T0apNW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777974747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZpmbFtG3fLzR1ot9v0B3eYwO0j9BzXXXsgF9aBg7SUo=;
	b=Px9IalJAtdxdZdjv6IFOYr9K1a8ULgYueaYQE0VngQOy3lnxQPWIqIH7znki4yv5rIzlbZ
	2wT9ckcTI+lHkXOn4UzZ6D+wYHAAQr5M/VEyfn4gR/Ly2r1/gKiWH8hXjrr1XDruY5nNx6
	9yI/I1zpd9fC6hwvhduRlbBzIfch85A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777974747;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZpmbFtG3fLzR1ot9v0B3eYwO0j9BzXXXsgF9aBg7SUo=;
	b=M2T0apNWLw3tWvahvLU9iAVbaoMo3QbO3DbWh/R1e84W3fhaPoTwR6mIjIgW1iID+QLTW6
	JosmTiGasQNzeCCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44176593A3;
	Tue,  5 May 2026 09:52:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p8D+D9u9+WnDbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 05 May 2026 09:52:27 +0000
Date: Tue, 05 May 2026 11:52:23 +0200
Message-ID: <878q9yw5d4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rodrigo Faria <rodrigofilipefaria@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED fixup for HP Pavilion 15-cs1xxx
In-Reply-To: <CAPmh8XQi+TbOAh7-cAa0i3nwcLq_c0mYHCf0qPT2YT8ak2YQTQ@mail.gmail.com>
References: <20260504145337.8740-1-rodrigofilipefaria@gmail.com>
	<87qznrw4om.wl-tiwai@suse.de>
	<CAPmh8XQi+TbOAh7-cAa0i3nwcLq_c0mYHCf0qPT2YT8ak2YQTQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email,suse.de:mid]
X-Rspamd-Queue-Id: 8553D6A921
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Mon, 04 May 2026 19:31:26 +0200,
Rodrigo Faria wrote:
> 
> The OEM Strings (Type 11) contain "String 6: HP_Mute_LED_0_A", which
> confirms the BIOS knows about the LED.

So BIOS declares the pin 0x18 being the one that controls the mute
LED, polarity = 0.  Basically it's a bug in BIOS.
Is BIOS update available?

> However, it seems the auto-parser is not correctly mapping this to the
> actual hardware on this model.
> Regarding the 103c:0000 SSID: I noticed it in dmesg during some early
> boot cycles, but the codec_dump consistently identifies the device as
> 103c:856a.

What about PCI SSID (not codec SSID)?
At best, give alsa-info.sh output; run the script with --no-upload
option and attach the output.

> I've physically verified that the mute LED is connected to NID 0x1b.
> Without this quirk, the LED remains non-functional even though the
> audio itself works fine with the generic driver.

OK, so it should be NID 0x1b.  I guess you can drop the line to set
polarity but keep only the line to override to the NID.
And, if BIOS update doesn't help, this kind of workaround is the only
way to go, and in that case, please give some more brief comments in
the function what does this and why this is needed.


thanks,

Takashi

> Best regards,
> Rodrigo Faria
> 
> On Mon, May 4, 2026 at 4:54 PM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Mon, 04 May 2026 16:53:37 +0200,
> > Rodrigo Faria wrote:
> > >
> > > Add a new fixup for the mute LED on the HP Pavilion 15-cs series
> > > using the VREF on NID 0x1b. These models will no longer fall back
> > > to the generic 103c:0000.
> >
> > So your model has a PCI SSID *:0000?  Or what does this mean exactly?
> >
> > > Signed-off-by: Rodrigo Faria <rodrigofilipefaria@gmail.com>
> > > ---
> > >  sound/hda/codecs/realtek/alc269.c | 20 ++++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > >
> > > diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> > > index a9cd03bb7..1db72bf28 100644
> > > --- a/sound/hda/codecs/realtek/alc269.c
> > > +++ b/sound/hda/codecs/realtek/alc269.c
> > > @@ -1669,6 +1669,20 @@ static void alc295_fixup_hp_mute_led_coefbit11(struct hda_codec *codec,
> > >       }
> > >  }
> > >
> > > +static void alc295_fixup_hp_pavilion_mute_led_1b(struct hda_codec *codec,
> > > +                                              const struct hda_fixup *fix,
> > > +                                              int action)
> > > +{
> > > +     struct alc_spec *spec = codec->spec;
> > > +
> > > +     alc269_fixup_hp_mute_led(codec, fix, action);
> > > +
> > > +     if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> > > +             spec->mute_led_nid = 0x1b;
> > > +             spec->mute_led_polarity = 0;
> > > +     }
> >
> > Hm, the BIOS gives a wrong pin number via DMI?
> > This bug pattern is new.
> >
> > I can take the patch, but I'd like to understand better what's going
> > on.
> >
> >
> > thanks,
> >
> > Takashi
