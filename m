Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649B2145355
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773745388; cv=none; b=Q/GuO/qWiIOzPx8OqDJ8zg1iP+KKZEGkrOfKgbri7QYV2bV0Hgz4lJOWazWDdqTu9JyoBG0TersojwubT/yI5Ys1SlisYO04coHKqFUFbo1xUaIGwd4guk2k9clooYjWySUdCnSCM/o+x/uejnaK5d5nRABUCUByzYsrhzf23I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773745388; c=relaxed/simple;
	bh=3cyaE5W38hObHCHTA5c/051tqa/TWuSSezYQ4rO0qV0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KeEWrJkmCfBZC4CyVITu0LI1P7vtFaXB7pWUrT+3NEWqxdsGWFG7XMWI3bZ+P6BNUoOGBtFp4KBh02OMPo4T84P9/6CDk/jpLYyUmg4O8oC72VvONv8Lf7EuZzIEP5ORzJW+s/Jq/NdyNLVL7wnpqq2kglqcqU/CCviHfkrr+Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XgBqIHel; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/9N/RsPU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wzSuuGaF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mTHF2K4w; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XgBqIHel";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/9N/RsPU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wzSuuGaF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mTHF2K4w"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1F0185BDD0;
	Tue, 17 Mar 2026 11:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773745385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tur3/NEbCL3VOba3rLfDtUIY0lPnTuzEBAK1ns+rlnQ=;
	b=XgBqIHelCkIUBqjgn1GzOdpeGeDZqfUWqkvEAaVp7Lol3MHNSXEpbsjgmt9nT1v0C9Vc63
	nPdjlWcV+Q3bo2y/HwS5d5MUudS5OjA6QsHxPgTwBYX9za3vG/pq6k6xvQ1EPV2VkZGXTP
	UWXS1My1ilBWMqAT88qVoSKS+66Iqxk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773745385;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tur3/NEbCL3VOba3rLfDtUIY0lPnTuzEBAK1ns+rlnQ=;
	b=/9N/RsPUqPs6xlnVyE1VLimLjRASHlhdtPgx96XFh7YTWpZ/i8KJU3WrCTOvTBRu1h1Jj4
	4e9ud+DcpqmG2ZAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773745380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tur3/NEbCL3VOba3rLfDtUIY0lPnTuzEBAK1ns+rlnQ=;
	b=wzSuuGaFhrjMpBK3jlM0PxrV820qlVacYGLIV2zy0L2lVg20G/ff5NuoAtt+mgQfBKKEqW
	Bc46yRtHme6Nq13FNcSB1vxrG2KNqfOwzzBgENWYOlXWbfLltjgE1j7GV1wRB+r+6kCVsw
	DsG6UQOmLdoX8k1ovb7jUjTNhYlr+Pg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773745380;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tur3/NEbCL3VOba3rLfDtUIY0lPnTuzEBAK1ns+rlnQ=;
	b=mTHF2K4w1Yrpifi8C+NjIwg+cYbbmTOwTXj4UUrNGZzNzPHxv0LBH8/74cDNCqa+Zae5U8
	dOiaUCZBsXETYiBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ECAEF4273B;
	Tue, 17 Mar 2026 11:02:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ep0SOeM0uWnVDQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 17 Mar 2026 11:02:59 +0000
Date: Tue, 17 Mar 2026 12:02:59 +0100
Message-ID: <87se9yen18.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: James <james@jaytek.org>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable rear line-out pins on MSI EC79 (ALCS1200A)
In-Reply-To: <877brag74k.wl-tiwai@suse.de>
References: <20260315101950.130380-1-james@jaytek.org>
	<87ikav7lcy.wl-tiwai@suse.de>
	<92a9a89d-e445-4816-bfa5-8127f2e535db@app.fastmail.com>
	<877brag74k.wl-tiwai@suse.de>
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
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Tue, 17 Mar 2026 10:03:39 +0100,
Takashi Iwai wrote:
> 
> On Tue, 17 Mar 2026 09:57:39 +0100,
> James wrote:
> > 
> > 
> > Hello,
> > alsa-info output attached (--no-upload). Note: this was captured after
> > applying a userspace workaround that
> > forces pin-ctls=0x40 (PIN_OUT) on NID 0x14. Let me know if you'd prefer a
> > capture from a clean boot state.
> 
> Yes, please give the clean state, too.

... and I noticed that you didn't enable the proper codec drivers?
Are CONFIG_SND_HDA_CODEC_ALC* enabled?


thanks,

Takashi

> 
> 
> thanks,
> 
> Takashi
> 
> > Thanks,
> > Signed-off-by: James Waschbisch <james@jaytek.org>
> > 
> > On Mon, Mar 16, 2026, at 12:08 PM, Takashi Iwai wrote:
> > 
> >     On Sun, 15 Mar 2026 11:19:50 +0100,
> >     James Waschbisch wrote:
> >     > 
> >     > On MSI systems with subsystem ID 1462:ec79 using the Realtek ALCS1200A
> >     > codec, the rear line-out pins (0x14, 0x15, 0x16) are parsed as line
> >     > outputs but do not come up with active pin widget control after boot.
> >     > This leaves analog output on the rear jacks unavailable until userspace
> >     > manually reprograms the codec.
> >     > 
> >     > Add a board-specific fixup that disables line-out/speaker automute and
> >     > forces pins 0x14, 0x15, and 0x16 to PIN_OUT during HDA_FIXUP_ACT_INIT,
> >     > while also clearing the output amp mute on those nodes.
> >     > 
> >     > Tested-on: MSI X570 Gaming Pro WiFi (1462:ec79, ALCS1200A)
> >     > 
> >     > Signed-off-by: James Waschbisch <james@jaytek.org>
> >    
> >     When this kind of changes like the manual amp updates or pin control
> >     fiddling are needed, usually something else is missing.
> >     Could you give alsa-info.sh output for further investigation?
> >     Run the script with --no-upload option and attach the output.
> > 
> >     thanks,
> >    
> >     Takashi
> >    
> >     > ---
> >     >  sound/hda/codecs/realtek/alc882.c | 38 +++++++++++++++++++++++++++++++
> >     >  1 file changed, 38 insertions(+)
> >     > 
> >     > diff --git a/sound/hda/codecs/realtek/alc882.c b/sound/hda/codecs/
> >     realtek/alc882.c
> >     > index 529fecd5b..2bf266a25 100644
> >     > --- a/sound/hda/codecs/realtek/alc882.c
> >     > +++ b/sound/hda/codecs/realtek/alc882.c
> >     > @@ -60,6 +60,7 @@ enum {
> >     >  ALC887_FIXUP_ASUS_AUDIO,
> >     >  ALC887_FIXUP_ASUS_HMIC,
> >     >  ALCS1200A_FIXUP_MIC_VREF,
> >     > + ALCS1200A_FIXUP_MSI_EC79,
> >     >  ALC888VD_FIXUP_MIC_100VREF,
> >     >  };
> >     >  
> >     > @@ -261,6 +262,36 @@ static void alc887_fixup_asus_jack(struct hda_codec
> >     *codec,
> >     >  spec->gen.hp_automute_hook = alc887_asus_hp_automute_hook;
> >     >  }
> >     >  
> >     > +static void alcs1200a_fixup_msi_ec79(struct hda_codec *codec,
> >     > +      const struct hda_fixup *fix, int action)
> >     > +{
> >     > + struct alc_spec *spec = codec->spec;
> >     > +
> >     > + if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> >     > + spec->gen.automute_lo = 0;
> >     > + spec->gen.automute_speaker = 0;
> >     > + return;
> >     > + }
> >     > +
> >     > + if (action != HDA_FIXUP_ACT_INIT)
> >     > + return;
> >     > +
> >     > + /* Front / Surround / CLFE line-out pins */
> >     > + snd_hda_set_pin_ctl(codec, 0x14, PIN_OUT);
> >     > + snd_hda_set_pin_ctl(codec, 0x15, PIN_OUT);
> >     > + snd_hda_set_pin_ctl(codec, 0x16, PIN_OUT);
> >     > +
> >     > + /* Unmute both output amp channels on all three pins */
> >     > + snd_hda_codec_amp_update(codec, 0x14, 0, HDA_OUTPUT, 0, 0x80, 0);
> >     > + snd_hda_codec_amp_update(codec, 0x14, 1, HDA_OUTPUT, 0, 0x80, 0);
> >     > +
> >     > + snd_hda_codec_amp_update(codec, 0x15, 0, HDA_OUTPUT, 0, 0x80, 0);
> >     > + snd_hda_codec_amp_update(codec, 0x15, 1, HDA_OUTPUT, 0, 0x80, 0);
> >     > +
> >     > + snd_hda_codec_amp_update(codec, 0x16, 0, HDA_OUTPUT, 0, 0x80, 0);
> >     > + snd_hda_codec_amp_update(codec, 0x16, 1, HDA_OUTPUT, 0, 0x80, 0);
> >     > +}
> >     > +
> >     >  static const struct hda_fixup alc882_fixups[] = {
> >     >  [ALC882_FIXUP_ABIT_AW9D_MAX] = {
> >     >  .type = HDA_FIXUP_PINS,
> >     > @@ -553,6 +584,12 @@ static const struct hda_fixup alc882_fixups[] = {
> >     >  {}
> >     >  }
> >     >  },
> >     > + [ALCS1200A_FIXUP_MSI_EC79] = {
> >     > + .type = HDA_FIXUP_FUNC,
> >     > + .v.func = alcs1200a_fixup_msi_ec79,
> >     > + .chained = true,
> >     > + .chain_id = ALCS1200A_FIXUP_MIC_VREF,
> >     > + },
> >     >  [ALC888VD_FIXUP_MIC_100VREF] = {
> >     >  .type = HDA_FIXUP_PINCTLS,
> >     >  .v.pins = (const struct hda_pintbl[]) {
> >     > @@ -636,6 +673,7 @@ static const struct hda_quirk alc882_fixup_tbl[] = {
> >     >  SND_PCI_QUIRK(0x1458, 0xa0cd, "Gigabyte X570 Aorus Master",
> >     ALC1220_FIXUP_GB_X570),
> >     >  SND_PCI_QUIRK(0x1458, 0xa0ce, "Gigabyte X570 Aorus Xtreme",
> >     ALC1220_FIXUP_GB_X570),
> >     >  SND_PCI_QUIRK(0x1458, 0xa0d5, "Gigabyte X570S Aorus Master",
> >     ALC1220_FIXUP_GB_X570),
> >     > + SND_PCI_QUIRK(0x1462, 0xec79, "MSI ALCS1200A",
> >     ALCS1200A_FIXUP_MSI_EC79),
> >     >  SND_PCI_QUIRK(0x1462, 0x11f7, "MSI-GE63", ALC1220_FIXUP_CLEVO_P950),
> >     >  SND_PCI_QUIRK(0x1462, 0x1228, "MSI-GP63", ALC1220_FIXUP_CLEVO_P950),
> >     >  SND_PCI_QUIRK(0x1462, 0x1229, "MSI-GP73", ALC1220_FIXUP_CLEVO_P950),
> >     > -- 
> >     > 2.53.0
> >     >
> > 
> > 
