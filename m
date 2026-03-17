Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D3A2222C5
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 09:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773738225; cv=none; b=F2O0UEYjLi+Dw9VGFlMphnQNWvaEnhoG80gwQBIdCh30g9Hgz8XwmEiHDDhaRStLDaHNaf+o0roJBcQgz+/zCergqLbIW1o+6SaePRDh/5dnsA7JdwYctxsrNrnDNoUQIiVOSEF5KMxZejNlGAkBXAHWDeX6JswiopZGyD93v1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773738225; c=relaxed/simple;
	bh=blxwfafjuAmPuCWLk7gBvuRROk6l9GYcmhpf71ptlCI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UFAIqF6+XkDpNo3gzSeRdabwcfyC7WPsESnq+OOSMux0DlgiEavB8a6nhORVnadzX9WTpP2R5GAuE14zbwr6HtdOuRpji35645VYxUZVf2uw0TEkCNdSd/8v00P1cbyuTYZDeev/15BPYKUA/3Jve/2GJcQK6k5bc2X2r0asiDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G95RVnH+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M7k2VRxG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZPkPi0Ea; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ql3fNOfd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G95RVnH+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M7k2VRxG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZPkPi0Ea";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ql3fNOfd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 912DC4D301;
	Tue, 17 Mar 2026 09:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773738220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S+eAbJjLvnAv7VgeF1eNN+ec2zn9vlQUIDUpuHXVq+0=;
	b=G95RVnH+hXqhOPLWqrwth3SRncU5QBIG8JSQQNg50w4j2VWi5fkGAColt7qnf+6SW6b4Ev
	3NOaWiUvmWJx9/Pjk86u4fbshxEpNky6/hlskyB+FKPF/pALDVJDHebFAb3IQ//RHljVx8
	TjRsIzhzlW2JiRLew2R5qDL6xsBYV9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773738220;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S+eAbJjLvnAv7VgeF1eNN+ec2zn9vlQUIDUpuHXVq+0=;
	b=M7k2VRxGJuy4bjC+TIJCgzrldMragPAiVOF3z0KH9re6hLID0qMONsipE0kwj3XTZS74Jb
	a7IOalM+veUw5/CA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZPkPi0Ea;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ql3fNOfd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773738219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S+eAbJjLvnAv7VgeF1eNN+ec2zn9vlQUIDUpuHXVq+0=;
	b=ZPkPi0Eaj+lrF8sRl5FPDwdrihbdU6egJBJXLGNQGI2CL9i8H1kFg2wq1nuznswzIDemB/
	e5LgCBZVej4SGf79aH3Oc8M5t7KsQ0rLIGuvOpnLNGBWoTun0cyhSuGP/MngnpqvoomlIV
	WRZ21pnnBpfqpv7a2//GxngeV938NyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773738219;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S+eAbJjLvnAv7VgeF1eNN+ec2zn9vlQUIDUpuHXVq+0=;
	b=Ql3fNOfdBtr26CBOeC3jLWj7a/BD1RMxdntcVfhlFzasZm6E53ESmR3URjrBSIOzI04Ayz
	fqQmTJ5XdQ7+xaBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 61FFD4273B;
	Tue, 17 Mar 2026 09:03:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vfmNFusYuWlUDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 17 Mar 2026 09:03:39 +0000
Date: Tue, 17 Mar 2026 10:03:39 +0100
Message-ID: <877brag74k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: James <james@jaytek.org>
Cc: "Takashi Iwai" <tiwai@suse.de>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable rear line-out pins on MSI EC79 (ALCS1200A)
In-Reply-To: <92a9a89d-e445-4816-bfa5-8127f2e535db@app.fastmail.com>
References: <20260315101950.130380-1-james@jaytek.org>
	<87ikav7lcy.wl-tiwai@suse.de>
	<92a9a89d-e445-4816-bfa5-8127f2e535db@app.fastmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:32098, ipnet:2800::/6, country:US];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,alsa-info.sh:url,jaytek.org:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 912DC4D301

On Tue, 17 Mar 2026 09:57:39 +0100,
James wrote:
> 
> 
> Hello,
> alsa-info output attached (--no-upload). Note: this was captured after
> applying a userspace workaround that
> forces pin-ctls=0x40 (PIN_OUT) on NID 0x14. Let me know if you'd prefer a
> capture from a clean boot state.

Yes, please give the clean state, too.


thanks,

Takashi

> Thanks,
> Signed-off-by: James Waschbisch <james@jaytek.org>
> 
> On Mon, Mar 16, 2026, at 12:08 PM, Takashi Iwai wrote:
> 
>     On Sun, 15 Mar 2026 11:19:50 +0100,
>     James Waschbisch wrote:
>     > 
>     > On MSI systems with subsystem ID 1462:ec79 using the Realtek ALCS1200A
>     > codec, the rear line-out pins (0x14, 0x15, 0x16) are parsed as line
>     > outputs but do not come up with active pin widget control after boot.
>     > This leaves analog output on the rear jacks unavailable until userspace
>     > manually reprograms the codec.
>     > 
>     > Add a board-specific fixup that disables line-out/speaker automute and
>     > forces pins 0x14, 0x15, and 0x16 to PIN_OUT during HDA_FIXUP_ACT_INIT,
>     > while also clearing the output amp mute on those nodes.
>     > 
>     > Tested-on: MSI X570 Gaming Pro WiFi (1462:ec79, ALCS1200A)
>     > 
>     > Signed-off-by: James Waschbisch <james@jaytek.org>
>    
>     When this kind of changes like the manual amp updates or pin control
>     fiddling are needed, usually something else is missing.
>     Could you give alsa-info.sh output for further investigation?
>     Run the script with --no-upload option and attach the output.
> 
>     thanks,
>    
>     Takashi
>    
>     > ---
>     >  sound/hda/codecs/realtek/alc882.c | 38 +++++++++++++++++++++++++++++++
>     >  1 file changed, 38 insertions(+)
>     > 
>     > diff --git a/sound/hda/codecs/realtek/alc882.c b/sound/hda/codecs/
>     realtek/alc882.c
>     > index 529fecd5b..2bf266a25 100644
>     > --- a/sound/hda/codecs/realtek/alc882.c
>     > +++ b/sound/hda/codecs/realtek/alc882.c
>     > @@ -60,6 +60,7 @@ enum {
>     >  ALC887_FIXUP_ASUS_AUDIO,
>     >  ALC887_FIXUP_ASUS_HMIC,
>     >  ALCS1200A_FIXUP_MIC_VREF,
>     > + ALCS1200A_FIXUP_MSI_EC79,
>     >  ALC888VD_FIXUP_MIC_100VREF,
>     >  };
>     >  
>     > @@ -261,6 +262,36 @@ static void alc887_fixup_asus_jack(struct hda_codec
>     *codec,
>     >  spec->gen.hp_automute_hook = alc887_asus_hp_automute_hook;
>     >  }
>     >  
>     > +static void alcs1200a_fixup_msi_ec79(struct hda_codec *codec,
>     > +      const struct hda_fixup *fix, int action)
>     > +{
>     > + struct alc_spec *spec = codec->spec;
>     > +
>     > + if (action == HDA_FIXUP_ACT_PRE_PROBE) {
>     > + spec->gen.automute_lo = 0;
>     > + spec->gen.automute_speaker = 0;
>     > + return;
>     > + }
>     > +
>     > + if (action != HDA_FIXUP_ACT_INIT)
>     > + return;
>     > +
>     > + /* Front / Surround / CLFE line-out pins */
>     > + snd_hda_set_pin_ctl(codec, 0x14, PIN_OUT);
>     > + snd_hda_set_pin_ctl(codec, 0x15, PIN_OUT);
>     > + snd_hda_set_pin_ctl(codec, 0x16, PIN_OUT);
>     > +
>     > + /* Unmute both output amp channels on all three pins */
>     > + snd_hda_codec_amp_update(codec, 0x14, 0, HDA_OUTPUT, 0, 0x80, 0);
>     > + snd_hda_codec_amp_update(codec, 0x14, 1, HDA_OUTPUT, 0, 0x80, 0);
>     > +
>     > + snd_hda_codec_amp_update(codec, 0x15, 0, HDA_OUTPUT, 0, 0x80, 0);
>     > + snd_hda_codec_amp_update(codec, 0x15, 1, HDA_OUTPUT, 0, 0x80, 0);
>     > +
>     > + snd_hda_codec_amp_update(codec, 0x16, 0, HDA_OUTPUT, 0, 0x80, 0);
>     > + snd_hda_codec_amp_update(codec, 0x16, 1, HDA_OUTPUT, 0, 0x80, 0);
>     > +}
>     > +
>     >  static const struct hda_fixup alc882_fixups[] = {
>     >  [ALC882_FIXUP_ABIT_AW9D_MAX] = {
>     >  .type = HDA_FIXUP_PINS,
>     > @@ -553,6 +584,12 @@ static const struct hda_fixup alc882_fixups[] = {
>     >  {}
>     >  }
>     >  },
>     > + [ALCS1200A_FIXUP_MSI_EC79] = {
>     > + .type = HDA_FIXUP_FUNC,
>     > + .v.func = alcs1200a_fixup_msi_ec79,
>     > + .chained = true,
>     > + .chain_id = ALCS1200A_FIXUP_MIC_VREF,
>     > + },
>     >  [ALC888VD_FIXUP_MIC_100VREF] = {
>     >  .type = HDA_FIXUP_PINCTLS,
>     >  .v.pins = (const struct hda_pintbl[]) {
>     > @@ -636,6 +673,7 @@ static const struct hda_quirk alc882_fixup_tbl[] = {
>     >  SND_PCI_QUIRK(0x1458, 0xa0cd, "Gigabyte X570 Aorus Master",
>     ALC1220_FIXUP_GB_X570),
>     >  SND_PCI_QUIRK(0x1458, 0xa0ce, "Gigabyte X570 Aorus Xtreme",
>     ALC1220_FIXUP_GB_X570),
>     >  SND_PCI_QUIRK(0x1458, 0xa0d5, "Gigabyte X570S Aorus Master",
>     ALC1220_FIXUP_GB_X570),
>     > + SND_PCI_QUIRK(0x1462, 0xec79, "MSI ALCS1200A",
>     ALCS1200A_FIXUP_MSI_EC79),
>     >  SND_PCI_QUIRK(0x1462, 0x11f7, "MSI-GE63", ALC1220_FIXUP_CLEVO_P950),
>     >  SND_PCI_QUIRK(0x1462, 0x1228, "MSI-GP63", ALC1220_FIXUP_CLEVO_P950),
>     >  SND_PCI_QUIRK(0x1462, 0x1229, "MSI-GP73", ALC1220_FIXUP_CLEVO_P950),
>     > -- 
>     > 2.53.0
>     >
> 
> 
