Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EB82C324E
	for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 16:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763396077; cv=none; b=CeEeVg+XQiao5fNlHQ5fZ0z461smPR36tASEwil++NcNp4DY+Ins1xEmIkrTyrb4VSDg9HZPAO8UPMjuZdRZ0DBQGAWHBRRvKMo9Z174OdQVv2OtpQGcQsao+4hZnvm74Voug5O+GVzz+QBBiPeB5gOKkoP9yPbLI+S8nOxY1XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763396077; c=relaxed/simple;
	bh=BgtHXhlzZbGRcT9OcW3SyPSF9RkWfaecioSl2mq1oM0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r/2GdfMwprfMLMvzdpGtsFmM3oSsGAqlgUDY57hn6sxbKTB+zhJuTE3oUUKXZY2h7oY0nomxbxa4iKAXElCOAuHzELlp+43pakoy8Z0R0NORjYXgJq2oIH4f7K584kdZC/kxmrSDdg7jg7E81eIAbVkB0VRElHVpyuxs0t5eUu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W/ACsatm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t+lBngTu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iOGRl1CO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Qqbj47HJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W/ACsatm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t+lBngTu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iOGRl1CO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qqbj47HJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B9DD221194;
	Mon, 17 Nov 2025 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763396074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0o5poQn2BNX2zOroFPf/tZBBFQCq3XN+OQCf5babXzk=;
	b=W/ACsatmG/6u+6aPu68W8ccHBxJV2tNMvBE4osmloVH9qam+W9ZVhVOAS8TM6o/tursYU/
	rENxkk61JMlLcfs8DZ7x/8cV/NYaMf0oacez0aiLDUJo2mlLpNK9/eoX5YwRr0E2iM7nsM
	lK4irdJDX+CrixIjifLIlluFo8uH6mM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763396074;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0o5poQn2BNX2zOroFPf/tZBBFQCq3XN+OQCf5babXzk=;
	b=t+lBngTu4xJPyw/3lQrlch071L/eNRjnxN4NYFDqTO64JM2f77VUQoyfQoTadOheI6eE7H
	mn0zKterSWR0inDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iOGRl1CO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Qqbj47HJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763396072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0o5poQn2BNX2zOroFPf/tZBBFQCq3XN+OQCf5babXzk=;
	b=iOGRl1COzZIdotO3xkbnPvQdRKmRUJHi91NrqPP1M+xYT7dEThgSO6694Q4uN6kKG30hLd
	2chJYyouZ4geubzRfCUIwU1417uaK5ieTSD5h7he8pT4w5FpJUspisCdtXHMhFAkf9W07z
	URNeBruoZ2udW7bqDgHQpw+gXugmmVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763396072;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0o5poQn2BNX2zOroFPf/tZBBFQCq3XN+OQCf5babXzk=;
	b=Qqbj47HJs2bsvDIacVPH03NHXnKbQ/OuiPi4vZKez+QglqdKwXpGKYwtmHUwlwUcFJlVuI
	nFL182ago1B4yDDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C4BE3EA61;
	Mon, 17 Nov 2025 16:14:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zB/IHOhJG2n2FgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Nov 2025 16:14:32 +0000
Date: Mon, 17 Nov 2025 17:14:31 +0100
Message-ID: <87ldk4fxg8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>,
    Baojun Xu <baojun.xu@ti.com>
Cc: Antheas Kapenekakis <lkml@antheas.dev>,
    Matthew Schwartz <matthew.schwartz@linux.dev>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ALSA: hda/realtek: Add match for ASUS Xbox Ally projects
In-Reply-To: <CAGwozwH_eUqErMsmyBsC6eMFTaHTbukkX68ZJO4MUqa_StiNUg@mail.gmail.com>
References: <20251026191635.2447593-1-lkml@antheas.dev>
	<20251026191635.2447593-2-lkml@antheas.dev>
	<CAGwozwEwPj9VRRo2U50ccg=_qSM7p-1c_hw2y=OYA-pFc=p13w@mail.gmail.com>
	<35A5783A-CA60-4B10-8C7B-5820B65307FE@linux.dev>
	<CAGwozwFtah66p=5oy9rf5phVGdDTiWg0WuJBT3qGpWdP3A62Pg@mail.gmail.com>
	<eb749233-0342-49a9-a41b-6d18239eb1d9@linux.dev>
	<CAGwozwEKzurj7qeAnzvWjJbf03da70ij5DtOJ7svZaoJ7vK=aA@mail.gmail.com>
	<CAGwozwEErv_cLxsP93n0oj20E03oPOk9-5v31mVnf_Adwjkwgg@mail.gmail.com>
	<CAGwozwH_eUqErMsmyBsC6eMFTaHTbukkX68ZJO4MUqa_StiNUg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B9DD221194
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

[ dropped stable ML as it's not really relevant ]

On Sun, 09 Nov 2025 10:19:27 +0100,
Antheas Kapenekakis wrote:
> 
> On Sun, 2 Nov 2025 at 18:33, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> >
> > On Tue, 28 Oct 2025 at 18:27, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> > >
> > > On Mon, 27 Oct 2025 at 20:58, Matthew Schwartz
> > > <matthew.schwartz@linux.dev> wrote:
> > > >
> > > > On 10/27/25 1:23 AM, Antheas Kapenekakis wrote:
> > > > > On Mon, 27 Oct 2025 at 07:02, Matthew Schwartz
> > > > > <matthew.schwartz@linux.dev> wrote:
> > > > >>
> > > > >>
> > > > >>
> > > > >>> On Oct 26, 2025, at 12:19 PM, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> > > > >>>
> > > > >>> On Sun, 26 Oct 2025 at 20:16, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> > > > >>>>
> > > > >>>> Bind the realtek codec to TAS2781 I2C audio amps on ASUS Xbox Ally
> > > > >>>> projects. While these projects work without a quirk, adding it increases
> > > > >>>> the output volume significantly.
> > > > >>>
> > > > >>> Also, if you can upstream the firmware files:
> > > > >>> TAS2XXX13840.bin
> > > > >>> TAS2XXX13841.bin
> > > > >>> TAS2XXX13940.bin
> > > > >>> TAS2XXX13941.bin
> > > > >>
> > > > >> This is the firmware at [1], correct? I’m testing the series with that firmware on my ROG Xbox Ally X, and I found something interesting.
> > > > >>
> > > > >> By default, with just your kernel patches and the firmware files hosted at [1], my unit is loading:
> > > > >>
> > > > >> tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: Loaded FW: TAS2XXX13840.bin, sha256: 58cffa36ae23a2d9b2349ecb6c1d4e89627934cd79218f6ada06eaffe6688246
> > > > >>
> > > > >> However, with this firmware file,  TAS2XXX13840.bin, there is significant audio clipping above 75% speaker level on my individual unit.
> > > > >>
> > > > >> Then, I tried renaming the other firmware file, TAS2XXX13841.bin, into TAS2XXX13840.bin. Now my unit is loading:
> > > > >>
> > > > >> tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: Loaded FW: TAS2XXX13840.bin, sha256: 0fda76e7142cb455df1860cfdb19bb3cb6871128b385595fe06b296a070f4b8c
> > > > >>
> > > > >> With this firmware file, audio is perfect all the way to 100% speaker level.
> > > > >>
> > > > >> If I recall, there have been other ASUS products that required matching amplifier hardware with firmware correctly, right? It looks like this might be another case of since it seems my unit is loading the wrong firmware for its amplifiers.
> > > > >
> > > > > The original Ally X had a similar setup, yes.
> > > > >
> > > > > First patch might not be perfect and your speaker pin might be 1. My
> > > > > Xbox Ally's pin is 1. It loads:
> > > > > Loaded FW: TAS2XXX13941.bin, sha256:
> > > > > 0fda76e7142cb455df1860cfdb19bb3cb6871128b385595fe06b296a070f4b8c
> > > > >
> > > > > And it sounds loud and crisp. So the pin is read.
> > > > >
> > > > > I had multiple users verify the X works, but perhaps it is not perfect
> > > > > yet. Make sure you are not using a dsp that might be interfering
> > > >
> > > > Seems like there have been other reports similar to mine on Xbox Ally X, where flipping the firmware files by renaming them fixes sound issues for them.
> > > >
> > > > @TI, Maybe something is different with the conditional logic for the ROG Xbox Ally X? The current GPIO-detected speaker_id doesn't always correspond to the correct firmware choice on this model it seems.
> > >
> > > Yeah, it seems that specifically on the Xbox Ally X, the firmwares are
> > > swapped around? What could be the case for that?
> > >
> > > I had three users with popping and dropped audio swap the firmware on
> > > their X and they said the other one fixed it. And another two without
> > > issues swapping the firmware and saying it does not make a
> > > quantifiable change.
> >
> > Update on this. Users with a pin value of 1 are happy with the 1
> > firmware. Users with a value of 0 are not happy with TAS2XXX13840 and
> > TAS2XXX13841 works better for them. Moreover, users of the 1 firmware
> > are not happy with the 0 firmware.
> >
> > This is just on the Ally X, on the normal Ally there are no issues.
> >
> > So there is an issue with TAS2XXX13840 on the linux side, TAS2XXX13841
> > is correctly selected.
> 
> Hi, can I get a small bump on this?
> 
> Baojun can you comment on the first patch? The fix works properly
> during our testing.
> 
> Both patches do.
> 
> It seems there is a problem with firmware file TAS2XXX13840 and
> devices that select it. Those devices work fine with TAS2XXX13841 and
> we replaced 0 with it for now, all of them do. The problem with it is
> that the speakers clip on and off above 80% volume when TAS2XXX13840
> is loaded.
> 
> Unfortunately I do not have an affected X unit, only a non-X one that
> works fine with the 13941 project. Mat does and he could do some
> testing.

Shenghao, Baojun, could you guys check the suggested fix patch please?



thanks,

Takashi

> 
> 
> > Antheas
> >
> > > Antheas
> > >
> > >
> > > Antheas
> > >
> > > > >
> > > > > Antheas
> > > > >
> > > > >> Matt
> > > > >>
> > > > >> [1]: https://github.com/hhd-dev/hwfirm
> > > > >>
> > > > >>>
> > > > >>> That would be great :)
> > > > >>>
> > > > >>> Antheas
> > > > >>>
> > > > >>>> Cc: stable@vger.kernel.org # 6.17
> > > > >>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > > >>>> ---
> > > > >>>> sound/hda/codecs/realtek/alc269.c | 2 ++
> > > > >>>> 1 file changed, 2 insertions(+)
> > > > >>>>
> > > > >>>> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> > > > >>>> index 8ad5febd822a..d1ad84eee6d1 100644
> > > > >>>> --- a/sound/hda/codecs/realtek/alc269.c
> > > > >>>> +++ b/sound/hda/codecs/realtek/alc269.c
> > > > >>>> @@ -6713,6 +6713,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
> > > > >>>>        SND_PCI_QUIRK(0x1043, 0x12f0, "ASUS X541UV", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
> > > > >>>>        SND_PCI_QUIRK(0x1043, 0x1313, "Asus K42JZ", ALC269VB_FIXUP_ASUS_MIC_NO_PRESENCE),
> > > > >>>>        SND_PCI_QUIRK(0x1043, 0x1314, "ASUS GA605K", ALC285_FIXUP_ASUS_GA605K_HEADSET_MIC),
> > > > >>>> +       SND_PCI_QUIRK(0x1043, 0x1384, "ASUS RC73XA", ALC287_FIXUP_TXNW2781_I2C),
> > > > >>>> +       SND_PCI_QUIRK(0x1043, 0x1394, "ASUS RC73YA", ALC287_FIXUP_TXNW2781_I2C),
> > > > >>>>        SND_PCI_QUIRK(0x1043, 0x13b0, "ASUS Z550SA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
> > > > >>>>        SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
> > > > >>>>        SND_PCI_QUIRK(0x1043, 0x1433, "ASUS GX650PY/PZ/PV/PU/PYV/PZV/PIV/PVV", ALC285_FIXUP_ASUS_I2C_HEADSET_MIC),
> > > > >>>> --
> > > > >>>> 2.51.1
> > > > >>>>
> > > > >>>>
> > > > >>>
> > > > >>>
> > > > >>
> > > > >>
> > > > >
> > > >
> > > >
> 
