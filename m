Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6551376BC1;
	Wed, 18 Mar 2026 22:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773872096; cv=none; b=d6g9uURT3ofTCzf/bzfU6U/YiqaZEK7F22yX80MKelv1LLTq+useOX0m3wdWXLUnSxJA341b/fFbrFLbpiCH8Xrr6siDL7RsYTFNLeU6XmJWSxcrbtaWYjjf9jzRM7oNIq94ZbptR/LrI4gx9zcl7ROBEO/TO/8ST6fD9c9e1q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773872096; c=relaxed/simple;
	bh=f7KYUFViJSsGJmqwp0G3czYyWvGDd0DNOwERSdE7DY4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=TvXdQZSbERym8vpBSYi/vt4X4QZP4Gd63HnzySwoxQUM9mRsz2EoMnFDBdcpeQHAStSR6hc+FtcCI8EWM5i2LODlMrXTgcCZJbWx3ra8jiCu8KnZqlyfdkCXHbvv5I0Z6eiyMW8WMWgwRpS6yzMERhUqGMinQkCJU7PJqe6zlzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jaytek.org; spf=pass smtp.mailfrom=jaytek.org; dkim=pass (2048-bit key) header.d=jaytek.org header.i=@jaytek.org header.b=nw2MAFA/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=voKbyGKh; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jaytek.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaytek.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaytek.org header.i=@jaytek.org header.b="nw2MAFA/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="voKbyGKh"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 4F6E1EC0105;
	Wed, 18 Mar 2026 18:14:48 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 18:14:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaytek.org; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1773872088; x=1773958488; bh=p/2iXYqn5G
	9KY7SXkDCOBal8QbkoWuXRfWuLaoA7gs0=; b=nw2MAFA/JXBUWFWwm373N/l122
	S0A4vv34qum0GrISmC0rR2LABftsdSEsjAXq4ne7GMsmE+0k/zlMTTwHBHJTYAup
	z+FOrAZ4RPoSXTPlWqbLTG38Iepg5nTPZlMkSBps9SFUkoeXn+kuMK1wOb537QCu
	RgnUB2RE+jeGisOp8HIQN5wtHo1N6IpQjsP61UfSScEA6fo2h0IG0WhKIxEUAaCE
	9YbxrHvOCic0K6Ii/cZu6hGjU5fH5PJr7KuaMhgnjX05/GIYF1dyk8VxEl3QdwIf
	YpMDNM3Oa4i0/LdcGyboUN6E+PTgF1fdfab9NXaB8BGnct+UU0h7I+atTOQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773872088; x=1773958488; bh=p/2iXYqn5G9KY7SXkDCOBal8QbkoWuXRfWu
	LaoA7gs0=; b=voKbyGKhqcrk168LbI/x1gAg6bqbef44BVyY5irWgySLIJVR0Il
	oBL/26lN1eIL594YNeF6qs/sbhUnMau1SEG61bFWGgxKMP/o27gl1L0+OM43j56r
	erqKqN1ZiyD52cJBTUUtY5ZiiAeY96pkZt56I6erhLPsQKXdCtX04inNadbOJs30
	Avyb7Rd2OnM3+0NuepJid6Uvjr/E6JqyMFBG3z/nS5TLuMMsYOAtxmNiC5GwdXB2
	eW59dRwduo16R2IWcLq+ffPRppkSNwRlQrzuEd9ket7BKh6oDyy0Gk7dGAjgpNua
	bf/dWSEe4Iyiy0VeZnMih4lacV/EtxTjClQ==
X-ME-Sender: <xms:1yO7aR4i7COy97g0TzlOdsC0qLwY-V8R-L3Gy8dCXNNhEtzcsFGfEQ>
    <xme:1yO7aZtOaMVlWRsRDw5unmvuYDDwSw5CwUm2B0xPBLRqVzfHb2rgFz62vSK9IXUJ9
    62P974Pb6MvkneK2fXZlluV_yk_GUzsg7hV28PK7gH-0vHDP2UNfbY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdehfedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgesmhdtreerredttdenucfhrhhomheplfgrmhgvshcu
    oehjrghmvghssehjrgihthgvkhdrohhrgheqnecuggftrfgrthhtvghrnhepvdeigfeigf
    dtleekveefffehvdeugeehtefffeetiedtfedufedutefgheeuueffnecuffhomhgrihhn
    pegrlhhsrgdqihhnfhhordhshhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehjrghmvghssehjrgihthgvkhdrohhrghdpnhgspghrtghpthht
    ohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgi
    drtgiipdhrtghpthhtohepthhifigrihesshhushgvrdgtohhmpdhrtghpthhtohepthhi
    figrihesshhushgvrdguvgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsohhunhgusehvghgv
    rhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:1yO7aXGeyBSSML11Wbe6irmRstzyCOBbn0xvTa8ibGM4K82IwDDy-g>
    <xmx:1yO7adRV7Sl2lgRjDETGH-ov0zQ6g_LFsgMrA--VNTjcs0cc6WXWBQ>
    <xmx:1yO7aUtL02JcyTbKq8ZhMtSa-llt2Hl1dcopICI-fas2mzSHV7FrkA>
    <xmx:1yO7aVKyMVSDq7KZI8a2kB19NfZXrUtxBFgsEG_dQaPdKX-SSEjzzg>
    <xmx:2CO7ad2kuj8WubAKBcJaA6BjAc5R5nChC1g5y3fgVXaDctgkSCLyGYvV>
Feedback-ID: i7b2e480f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BA337C40071; Wed, 18 Mar 2026 18:14:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AhnqQAqBDVes
Date: Wed, 18 Mar 2026 17:12:28 -0500
From: James <james@jaytek.org>
To: "Takashi Iwai" <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <d7c39804-c019-4622-b387-c1b771c38204@app.fastmail.com>
In-Reply-To: <87se9yen18.wl-tiwai@suse.de>
References: <20260315101950.130380-1-james@jaytek.org>
 <87ikav7lcy.wl-tiwai@suse.de>
 <92a9a89d-e445-4816-bfa5-8127f2e535db@app.fastmail.com>
 <877brag74k.wl-tiwai@suse.de> <87se9yen18.wl-tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/realtek: Enable rear line-out pins on MSI EC79
 (ALCS1200A)
Content-Type: multipart/mixed;
 boundary=ee43de043b784df695dcc9df47ae1e13

--ee43de043b784df695dcc9df47ae1e13
Content-Type: multipart/alternative;
 boundary=0d2370aa8ac646ca9f4dd6b9d468c5a2

--0d2370aa8ac646ca9f4dd6b9d468c5a2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,
Attached is a clean state dump with my modifications removed. I think the previous alsa-info dump was misleading as some kernel modifications were still left over from my testing and causing the wrong module to load, but I now have a clean install of the kernel and have disabled my userspace patch.
Signed-off-by: James Waschbisch <james@jaytek.org>

On Tue, Mar 17, 2026, at 6:02 AM, Takashi Iwai wrote:
> On Tue, 17 Mar 2026 10:03:39 +0100,
> Takashi Iwai wrote:
> > 
> > On Tue, 17 Mar 2026 09:57:39 +0100,
> > James wrote:
> > > 
> > > 
> > > Hello,
> > > alsa-info output attached (--no-upload). Note: this was captured after
> > > applying a userspace workaround that
> > > forces pin-ctls=0x40 (PIN_OUT) on NID 0x14. Let me know if you'd prefer a
> > > capture from a clean boot state.
> > 
> > Yes, please give the clean state, too.
> 
> ... and I noticed that you didn't enable the proper codec drivers?
> Are CONFIG_SND_HDA_CODEC_ALC* enabled?
> 
> 
> thanks,
> 
> Takashi
> 
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> > > Thanks,
> > > Signed-off-by: James Waschbisch <james@jaytek.org>
> > > 
> > > On Mon, Mar 16, 2026, at 12:08 PM, Takashi Iwai wrote:
> > > 
> > >     On Sun, 15 Mar 2026 11:19:50 +0100,
> > >     James Waschbisch wrote:
> > >     > 
> > >     > On MSI systems with subsystem ID 1462:ec79 using the Realtek ALCS1200A
> > >     > codec, the rear line-out pins (0x14, 0x15, 0x16) are parsed as line
> > >     > outputs but do not come up with active pin widget control after boot.
> > >     > This leaves analog output on the rear jacks unavailable until userspace
> > >     > manually reprograms the codec.
> > >     > 
> > >     > Add a board-specific fixup that disables line-out/speaker automute and
> > >     > forces pins 0x14, 0x15, and 0x16 to PIN_OUT during HDA_FIXUP_ACT_INIT,
> > >     > while also clearing the output amp mute on those nodes.
> > >     > 
> > >     > Tested-on: MSI X570 Gaming Pro WiFi (1462:ec79, ALCS1200A)
> > >     > 
> > >     > Signed-off-by: James Waschbisch <james@jaytek.org>
> > >    
> > >     When this kind of changes like the manual amp updates or pin control
> > >     fiddling are needed, usually something else is missing.
> > >     Could you give alsa-info.sh output for further investigation?
> > >     Run the script with --no-upload option and attach the output.
> > > 
> > >     thanks,
> > >    
> > >     Takashi
> > >    
> > >     > ---
> > >     >  sound/hda/codecs/realtek/alc882.c | 38 +++++++++++++++++++++++++++++++
> > >     >  1 file changed, 38 insertions(+)
> > >     > 
> > >     > diff --git a/sound/hda/codecs/realtek/alc882.c b/sound/hda/codecs/
> > >     realtek/alc882.c
> > >     > index 529fecd5b..2bf266a25 100644
> > >     > --- a/sound/hda/codecs/realtek/alc882.c
> > >     > +++ b/sound/hda/codecs/realtek/alc882.c
> > >     > @@ -60,6 +60,7 @@ enum {
> > >     >  ALC887_FIXUP_ASUS_AUDIO,
> > >     >  ALC887_FIXUP_ASUS_HMIC,
> > >     >  ALCS1200A_FIXUP_MIC_VREF,
> > >     > + ALCS1200A_FIXUP_MSI_EC79,
> > >     >  ALC888VD_FIXUP_MIC_100VREF,
> > >     >  };
> > >     >  
> > >     > @@ -261,6 +262,36 @@ static void alc887_fixup_asus_jack(struct hda_codec
> > >     *codec,
> > >     >  spec->gen.hp_automute_hook = alc887_asus_hp_automute_hook;
> > >     >  }
> > >     >  
> > >     > +static void alcs1200a_fixup_msi_ec79(struct hda_codec *codec,
> > >     > +      const struct hda_fixup *fix, int action)
> > >     > +{
> > >     > + struct alc_spec *spec = codec->spec;
> > >     > +
> > >     > + if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> > >     > + spec->gen.automute_lo = 0;
> > >     > + spec->gen.automute_speaker = 0;
> > >     > + return;
> > >     > + }
> > >     > +
> > >     > + if (action != HDA_FIXUP_ACT_INIT)
> > >     > + return;
> > >     > +
> > >     > + /* Front / Surround / CLFE line-out pins */
> > >     > + snd_hda_set_pin_ctl(codec, 0x14, PIN_OUT);
> > >     > + snd_hda_set_pin_ctl(codec, 0x15, PIN_OUT);
> > >     > + snd_hda_set_pin_ctl(codec, 0x16, PIN_OUT);
> > >     > +
> > >     > + /* Unmute both output amp channels on all three pins */
> > >     > + snd_hda_codec_amp_update(codec, 0x14, 0, HDA_OUTPUT, 0, 0x80, 0);
> > >     > + snd_hda_codec_amp_update(codec, 0x14, 1, HDA_OUTPUT, 0, 0x80, 0);
> > >     > +
> > >     > + snd_hda_codec_amp_update(codec, 0x15, 0, HDA_OUTPUT, 0, 0x80, 0);
> > >     > + snd_hda_codec_amp_update(codec, 0x15, 1, HDA_OUTPUT, 0, 0x80, 0);
> > >     > +
> > >     > + snd_hda_codec_amp_update(codec, 0x16, 0, HDA_OUTPUT, 0, 0x80, 0);
> > >     > + snd_hda_codec_amp_update(codec, 0x16, 1, HDA_OUTPUT, 0, 0x80, 0);
> > >     > +}
> > >     > +
> > >     >  static const struct hda_fixup alc882_fixups[] = {
> > >     >  [ALC882_FIXUP_ABIT_AW9D_MAX] = {
> > >     >  .type = HDA_FIXUP_PINS,
> > >     > @@ -553,6 +584,12 @@ static const struct hda_fixup alc882_fixups[] = {
> > >     >  {}
> > >     >  }
> > >     >  },
> > >     > + [ALCS1200A_FIXUP_MSI_EC79] = {
> > >     > + .type = HDA_FIXUP_FUNC,
> > >     > + .v.func = alcs1200a_fixup_msi_ec79,
> > >     > + .chained = true,
> > >     > + .chain_id = ALCS1200A_FIXUP_MIC_VREF,
> > >     > + },
> > >     >  [ALC888VD_FIXUP_MIC_100VREF] = {
> > >     >  .type = HDA_FIXUP_PINCTLS,
> > >     >  .v.pins = (const struct hda_pintbl[]) {
> > >     > @@ -636,6 +673,7 @@ static const struct hda_quirk alc882_fixup_tbl[] = {
> > >     >  SND_PCI_QUIRK(0x1458, 0xa0cd, "Gigabyte X570 Aorus Master",
> > >     ALC1220_FIXUP_GB_X570),
> > >     >  SND_PCI_QUIRK(0x1458, 0xa0ce, "Gigabyte X570 Aorus Xtreme",
> > >     ALC1220_FIXUP_GB_X570),
> > >     >  SND_PCI_QUIRK(0x1458, 0xa0d5, "Gigabyte X570S Aorus Master",
> > >     ALC1220_FIXUP_GB_X570),
> > >     > + SND_PCI_QUIRK(0x1462, 0xec79, "MSI ALCS1200A",
> > >     ALCS1200A_FIXUP_MSI_EC79),
> > >     >  SND_PCI_QUIRK(0x1462, 0x11f7, "MSI-GE63", ALC1220_FIXUP_CLEVO_P950),
> > >     >  SND_PCI_QUIRK(0x1462, 0x1228, "MSI-GP63", ALC1220_FIXUP_CLEVO_P950),
> > >     >  SND_PCI_QUIRK(0x1462, 0x1229, "MSI-GP73", ALC1220_FIXUP_CLEVO_P950),
> > >     > -- 
> > >     > 2.53.0
> > >     >
> > > 
> > > 
> 

--0d2370aa8ac646ca9f4dd6b9d468c5a2
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title></head><body><div>Hello,</div>=
<div>Attached is a clean state dump with my modifications removed. I thi=
nk the previous alsa-info dump was misleading as some kernel modificatio=
ns were still left over from my testing and causing the wrong module to =
load, but I now have a clean install of the kernel and have disabled my =
userspace patch.</div><div>Signed-off-by: James Waschbisch &lt;<a href=3D=
"mailto:james@jaytek.org">james@jaytek.org</a>&gt;<br></div><div><br></d=
iv><div>On Tue, Mar 17, 2026, at 6:02 AM, Takashi Iwai wrote:</div><bloc=
kquote type=3D"cite" id=3D"qt" style=3D""><div>On Tue, 17 Mar 2026 10:03=
:39 +0100,</div><div>Takashi Iwai wrote:</div><div>&gt;&nbsp;</div><div>=
&gt; On Tue, 17 Mar 2026 09:57:39 +0100,</div><div>&gt; James wrote:</di=
v><div>&gt; &gt;&nbsp;</div><div>&gt; &gt;&nbsp;</div><div>&gt; &gt; Hel=
lo,</div><div>&gt; &gt; alsa-info output attached (--no-upload). Note: t=
his was captured after</div><div>&gt; &gt; applying a userspace workarou=
nd that</div><div>&gt; &gt; forces pin-ctls=3D0x40 (PIN_OUT) on NID 0x14=
. Let me know if you'd prefer a</div><div>&gt; &gt; capture from a clean=
 boot state.</div><div>&gt;&nbsp;</div><div>&gt; Yes, please give the cl=
ean state, too.</div><div><br></div><div>... and I noticed that you didn=
't enable the proper codec drivers?</div><div>Are CONFIG_SND_HDA_CODEC_A=
LC* enabled?</div><div><br></div><div><br></div><div>thanks,</div><div><=
br></div><div>Takashi</div><div><br></div><div>&gt;&nbsp;</div><div>&gt;=
&nbsp;</div><div>&gt; thanks,</div><div>&gt;&nbsp;</div><div>&gt; Takash=
i</div><div>&gt;&nbsp;</div><div>&gt; &gt; Thanks,</div><div>&gt; &gt; S=
igned-off-by: James Waschbisch &lt;<a href=3D"mailto:james@jaytek.org">j=
ames@jaytek.org</a>&gt;</div><div>&gt; &gt;&nbsp;</div><div>&gt; &gt; On=
 Mon, Mar 16, 2026, at 12:08 PM, Takashi Iwai wrote:</div><div>&gt; &gt;=
&nbsp;</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; On Sun, 15 Mar 2026 1=
1:19:50 +0100,</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; James Waschbi=
sch wrote:</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;</div><=
div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; On MSI systems with subsystem=
 ID 1462:ec79 using the Realtek ALCS1200A</div><div>&gt; &gt;&nbsp;&nbsp=
;&nbsp;&nbsp; &gt; codec, the rear line-out pins (0x14, 0x15, 0x16) are =
parsed as line</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; outputs =
but do not come up with active pin widget control after boot.</div><div>=
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; This leaves analog output on the =
rear jacks unavailable until userspace</div><div>&gt; &gt;&nbsp;&nbsp;&n=
bsp;&nbsp; &gt; manually reprograms the codec.</div><div>&gt; &gt;&nbsp;=
&nbsp;&nbsp;&nbsp; &gt;&nbsp;</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp=
; &gt; Add a board-specific fixup that disables line-out/speaker automut=
e and</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; forces pins 0x14,=
 0x15, and 0x16 to PIN_OUT during HDA_FIXUP_ACT_INIT,</div><div>&gt; &gt=
;&nbsp;&nbsp;&nbsp;&nbsp; &gt; while also clearing the output amp mute o=
n those nodes.</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;</d=
iv><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; Tested-on: MSI X570 Gamin=
g Pro WiFi (1462:ec79, ALCS1200A)</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&=
nbsp; &gt;&nbsp;</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; Signed=
-off-by: James Waschbisch &lt;<a href=3D"mailto:james@jaytek.org">james@=
jaytek.org</a>&gt;</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;</div><div=
>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; When this kind of changes like the ma=
nual amp updates or pin control</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nb=
sp; fiddling are needed, usually something else is missing.</div><div>&g=
t; &gt;&nbsp;&nbsp;&nbsp;&nbsp; Could you give&nbsp;<a href=3D"http://al=
sa-info.sh">alsa-info.sh</a> output for further investigation?</div><div=
>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; Run the script with --no-upload optio=
n and attach the output.</div><div>&gt; &gt;&nbsp;</div><div>&gt; &gt;&n=
bsp;&nbsp;&nbsp;&nbsp; thanks,</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbs=
p;</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; Takashi</div><div>&gt; &g=
t;&nbsp;&nbsp;&nbsp;&nbsp;</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &=
gt; ---</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp; sound/hda=
/codecs/realtek/alc882.c | 38 +++++++++++++++++++++++++++++++</div><div>=
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp; 1 file changed, 38 insertio=
ns(+)</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;</div><div>&=
gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; diff --git a/sound/hda/codecs/real=
tek/alc882.c b/sound/hda/codecs/</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&n=
bsp; realtek/alc882.c</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; i=
ndex 529fecd5b..2bf266a25 100644</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&n=
bsp; &gt; --- a/sound/hda/codecs/realtek/alc882.c</div><div>&gt; &gt;&nb=
sp;&nbsp;&nbsp;&nbsp; &gt; +++ b/sound/hda/codecs/realtek/alc882.c</div>=
<div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; @@ -60,6 +60,7 @@ enum {</di=
v><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp; ALC887_FIXUP_ASUS_AU=
DIO,</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp; ALC887_FIXUP=
_ASUS_HMIC,</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp; ALCS1=
200A_FIXUP_MIC_VREF,</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; + =
ALCS1200A_FIXUP_MSI_EC79,</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &g=
t;&nbsp; ALC888VD_FIXUP_MIC_100VREF,</div><div>&gt; &gt;&nbsp;&nbsp;&nbs=
p;&nbsp; &gt;&nbsp; };</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&=
nbsp;&nbsp;</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; @@ -261,6 +=
262,36 @@ static void alc887_fixup_asus_jack(struct hda_codec</div><div>=
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; *codec,</div><div>&gt; &gt;&nbsp;&nbsp=
;&nbsp;&nbsp; &gt;&nbsp; spec-&gt;gen.hp_automute_hook =3D alc887_asus_h=
p_automute_hook;</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp; =
}</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&nbsp;</div><div=
>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; +static void alcs1200a_fixup_msi=
_ec79(struct hda_codec *codec,</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbs=
p; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct hda_fixup *fix, int=
 action)</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; +{</div><div>&=
gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; + struct alc_spec *spec =3D codec-=
&gt;spec;</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; +</div><div>&=
gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; + if (action =3D=3D HDA_FIXUP_ACT_=
PRE_PROBE) {</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; + spec-&gt=
;gen.automute_lo =3D 0;</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;=
 + spec-&gt;gen.automute_speaker =3D 0;</div><div>&gt; &gt;&nbsp;&nbsp;&=
nbsp;&nbsp; &gt; + return;</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &=
gt; + }</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; +</div><div>&gt=
; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; + if (action !=3D HDA_FIXUP_ACT_INIT=
)</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; + return;</div><div>&=
gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; +</div><div>&gt; &gt;&nbsp;&nbsp;&=
nbsp;&nbsp; &gt; + /* Front / Surround / CLFE line-out pins */</div><div=
>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; + snd_hda_set_pin_ctl(codec, 0x1=
4, PIN_OUT);</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; + snd_hda_=
set_pin_ctl(codec, 0x15, PIN_OUT);</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;=
&nbsp; &gt; + snd_hda_set_pin_ctl(codec, 0x16, PIN_OUT);</div><div>&gt; =
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; +</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp=
;&nbsp; &gt; + /* Unmute both output amp channels on all three pins */</=
div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; + snd_hda_codec_amp_upda=
te(codec, 0x14, 0, HDA_OUTPUT, 0, 0x80, 0);</div><div>&gt; &gt;&nbsp;&nb=
sp;&nbsp;&nbsp; &gt; + snd_hda_codec_amp_update(codec, 0x14, 1, HDA_OUTP=
UT, 0, 0x80, 0);</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; +</div=
><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; + snd_hda_codec_amp_update(=
codec, 0x15, 0, HDA_OUTPUT, 0, 0x80, 0);</div><div>&gt; &gt;&nbsp;&nbsp;=
&nbsp;&nbsp; &gt; + snd_hda_codec_amp_update(codec, 0x15, 1, HDA_OUTPUT,=
 0, 0x80, 0);</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; +</div><d=
iv>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; + snd_hda_codec_amp_update(cod=
ec, 0x16, 0, HDA_OUTPUT, 0, 0x80, 0);</div><div>&gt; &gt;&nbsp;&nbsp;&nb=
sp;&nbsp; &gt; + snd_hda_codec_amp_update(codec, 0x16, 1, HDA_OUTPUT, 0,=
 0x80, 0);</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; +}</div><div=
>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; +</div><div>&gt; &gt;&nbsp;&nbsp=
;&nbsp;&nbsp; &gt;&nbsp; static const struct hda_fixup alc882_fixups[] =3D=
 {</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp; [ALC882_FIXUP_=
ABIT_AW9D_MAX] =3D {</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nb=
sp; .type =3D HDA_FIXUP_PINS,</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp=
; &gt; @@ -553,6 +584,12 @@ static const struct hda_fixup alc882_fixups[=
] =3D {</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp; {}</div><=
div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp; }</div><div>&gt; &gt;&n=
bsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp; },</div><div>&gt; &gt;&nbsp;&nbsp;&nbs=
p;&nbsp; &gt; + [ALCS1200A_FIXUP_MSI_EC79] =3D {</div><div>&gt; &gt;&nbs=
p;&nbsp;&nbsp;&nbsp; &gt; + .type =3D HDA_FIXUP_FUNC,</div><div>&gt; &gt=
;&nbsp;&nbsp;&nbsp;&nbsp; &gt; + .v.func =3D alcs1200a_fixup_msi_ec79,</=
div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; + .chained =3D true,</di=
v><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; + .chain_id =3D ALCS1200A_=
FIXUP_MIC_VREF,</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; + },</d=
iv><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp; [ALC888VD_FIXUP_MIC=
_100VREF] =3D {</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp; .=
type =3D HDA_FIXUP_PINCTLS,</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; =
&gt;&nbsp; .v.pins =3D (const struct hda_pintbl[]) {</div><div>&gt; &gt;=
&nbsp;&nbsp;&nbsp;&nbsp; &gt; @@ -636,6 +673,7 @@ static const struct hd=
a_quirk alc882_fixup_tbl[] =3D {</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&n=
bsp; &gt;&nbsp; SND_PCI_QUIRK(0x1458, 0xa0cd, "Gigabyte X570 Aorus Maste=
r",</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; ALC1220_FIXUP_GB_X570),<=
/div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp; SND_PCI_QUIRK(0x1=
458, 0xa0ce, "Gigabyte X570 Aorus Xtreme",</div><div>&gt; &gt;&nbsp;&nbs=
p;&nbsp;&nbsp; ALC1220_FIXUP_GB_X570),</div><div>&gt; &gt;&nbsp;&nbsp;&n=
bsp;&nbsp; &gt;&nbsp; SND_PCI_QUIRK(0x1458, 0xa0d5, "Gigabyte X570S Aoru=
s Master",</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; ALC1220_FIXUP_GB_=
X570),</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; + SND_PCI_QUIRK(=
0x1462, 0xec79, "MSI ALCS1200A",</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&n=
bsp; ALCS1200A_FIXUP_MSI_EC79),</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nb=
sp; &gt;&nbsp; SND_PCI_QUIRK(0x1462, 0x11f7, "MSI-GE63", ALC1220_FIXUP_C=
LEVO_P950),</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp; SND_P=
CI_QUIRK(0x1462, 0x1228, "MSI-GP63", ALC1220_FIXUP_CLEVO_P950),</div><di=
v>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp; SND_PCI_QUIRK(0x1462, 0x1=
229, "MSI-GP73", ALC1220_FIXUP_CLEVO_P950),</div><div>&gt; &gt;&nbsp;&nb=
sp;&nbsp;&nbsp; &gt; --&nbsp;</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp=
; &gt; 2.53.0</div><div>&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;</div><div=
>&gt; &gt;&nbsp;</div><div>&gt; &gt;&nbsp;</div><div><br></div></blockqu=
ote><div><br></div></body></html>
--0d2370aa8ac646ca9f4dd6b9d468c5a2--

--ee43de043b784df695dcc9df47ae1e13
Content-Disposition: attachment; filename="alsa-info.txt.uNrk0S9u78"
Content-Type: application/octet-stream; name="alsa-info.txt.uNrk0S9u78"
Content-Transfer-Encoding: base64

dXBsb2FkPXRydWUmc2NyaXB0PXRydWUmY2FyZGluZm89CiEhIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKISFBTFNBIEluZm9ybWF0aW9uIFNjcmlwdCB2IDAuNS4zCiEhIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKCiEhU2NyaXB0IHJhbiBvbjogV2VkIE1h
ciAxOCAyMjowMDoyNyBVVEMgMjAyNgoKCiEhTGludXggRGlzdHJpYnV0aW9uCiEhLS0tLS0t
LS0tLS0tLS0tLS0tCgpJRF9MSUtFPWFyY2ggUFJJVkFDWV9QT0xJQ1lfVVJMPSJodHRwczov
L3Rlcm1zLmFyY2hsaW51eC5vcmcvZG9jcy9wcml2YWN5LXBvbGljeS8iCgoKISFETUkgSW5m
b3JtYXRpb24KISEtLS0tLS0tLS0tLS0tLS0KCk1hbnVmYWN0dXJlcjogICAgICBNaWNyby1T
dGFyIEludGVybmF0aW9uYWwgQ28uLCBMdGQuClByb2R1Y3QgTmFtZTogICAgICBNUy03Qzc5
ClByb2R1Y3QgVmVyc2lvbjogICAxLjAKRmlybXdhcmUgVmVyc2lvbjogIDEuNjAKU3lzdGVt
IFNLVTogICAgICAgIERlZmF1bHQgc3RyaW5nCkJvYXJkIFZlbmRvcjogICAgICBNaWNyby1T
dGFyIEludGVybmF0aW9uYWwgQ28uLCBMdGQuCkJvYXJkIE5hbWU6ICAgICAgICBNUEcgWjQ5
MCBHQU1JTkcgRURHRSBXSUZJIChNUy03Qzc5KQoKCiEhQUNQSSBEZXZpY2UgU3RhdHVzIElu
Zm9ybWF0aW9uCiEhLS0tLS0tLS0tLS0tLS0tCgovc3lzL2J1cy9hY3BpL2RldmljZXMvQUNQ
STAwMEM6MDAvc3RhdHVzIAkgMTUKL3N5cy9idXMvYWNwaS9kZXZpY2VzL0FDUEkwMDBFOjAw
L3N0YXR1cyAJIDE1Ci9zeXMvYnVzL2FjcGkvZGV2aWNlcy9JTlQzM0ExOjAwL3N0YXR1cyAJ
IDE1Ci9zeXMvYnVzL2FjcGkvZGV2aWNlcy9JTlQzNDBFOjAwL3N0YXR1cyAJIDE1Ci9zeXMv
YnVzL2FjcGkvZGV2aWNlcy9JTlQzRjBEOjAwL3N0YXR1cyAJIDE1Ci9zeXMvYnVzL2FjcGkv
ZGV2aWNlcy9MTlhQT1dFUjowMC9zdGF0dXMgCSAxCi9zeXMvYnVzL2FjcGkvZGV2aWNlcy9M
TlhQT1dFUjowMS9zdGF0dXMgCSAxCi9zeXMvYnVzL2FjcGkvZGV2aWNlcy9MTlhQT1dFUjow
My9zdGF0dXMgCSAxCi9zeXMvYnVzL2FjcGkvZGV2aWNlcy9MTlhQT1dFUjowNC9zdGF0dXMg
CSAxCi9zeXMvYnVzL2FjcGkvZGV2aWNlcy9MTlhQT1dFUjowNS9zdGF0dXMgCSAxCi9zeXMv
YnVzL2FjcGkvZGV2aWNlcy9MTlhQT1dFUjowNi9zdGF0dXMgCSAxCi9zeXMvYnVzL2FjcGkv
ZGV2aWNlcy9NU0ZUMDEwMTowMC9zdGF0dXMgCSAxNQovc3lzL2J1cy9hY3BpL2RldmljZXMv
UE5QMDEwMzowMC9zdGF0dXMgCSAxNQovc3lzL2J1cy9hY3BpL2RldmljZXMvUE5QMEMwMjow
MC9zdGF0dXMgCSAzCi9zeXMvYnVzL2FjcGkvZGV2aWNlcy9QTlAwQzAyOjAzL3N0YXR1cyAJ
IDMKL3N5cy9idXMvYWNwaS9kZXZpY2VzL1BOUDBDMDI6MDUvc3RhdHVzIAkgMwovc3lzL2J1
cy9hY3BpL2RldmljZXMvUE5QMEMwMjowNy9zdGF0dXMgCSAzCi9zeXMvYnVzL2FjcGkvZGV2
aWNlcy9QTlAwQzA0OjAwL3N0YXR1cyAJIDMxCi9zeXMvYnVzL2FjcGkvZGV2aWNlcy9QTlAw
QzBFOjAwL3N0YXR1cyAJIDExCi9zeXMvYnVzL2FjcGkvZGV2aWNlcy9QTlAwQzBGOjAwL3N0
YXR1cyAJIDkKL3N5cy9idXMvYWNwaS9kZXZpY2VzL1BOUDBDMEY6MDEvc3RhdHVzIAkgOQov
c3lzL2J1cy9hY3BpL2RldmljZXMvUE5QMEMwRjowMi9zdGF0dXMgCSA5Ci9zeXMvYnVzL2Fj
cGkvZGV2aWNlcy9QTlAwQzBGOjAzL3N0YXR1cyAJIDkKL3N5cy9idXMvYWNwaS9kZXZpY2Vz
L1BOUDBDMEY6MDQvc3RhdHVzIAkgOQovc3lzL2J1cy9hY3BpL2RldmljZXMvUE5QMEMwRjow
NS9zdGF0dXMgCSA5Ci9zeXMvYnVzL2FjcGkvZGV2aWNlcy9QTlAwQzBGOjA2L3N0YXR1cyAJ
IDkKL3N5cy9idXMvYWNwaS9kZXZpY2VzL1BOUDBDMEY6MDcvc3RhdHVzIAkgOQovc3lzL2J1
cy9hY3BpL2RldmljZXMvUFJQMDAwMDE6MDAvc3RhdHVzIAkgMTEKL3N5cy9idXMvYWNwaS9k
ZXZpY2VzL2RldmljZTo5ZC9zdGF0dXMgCSAxNQovc3lzL2J1cy9hY3BpL2RldmljZXMvZGV2
aWNlOjllL3N0YXR1cyAJIDE1CgoKISFBQ1BJIFNvdW5kV2lyZSBEZXZpY2UgU3RhdHVzIElu
Zm9ybWF0aW9uCiEhLS0tLS0tLS0tLS0tLS0tCgpSZWFsdGVrIDB4MDAwMDEwMDI1ZDA3MDEw
MApSZWFsdGVrIDB4MDAwMTEwMDI1ZDA3MDEwMApSZWFsdGVrIDB4MDAwMjEwMDI1ZDA3MDEw
MApSZWFsdGVrIDB4MDAwMzEwMDI1ZDA3MDEwMApSZWFsdGVrIDB4MDAwMDEwMDI1ZDA3MDAw
MApSZWFsdGVrIDB4MDAwMTEwMDI1ZDA3MDAwMApSZWFsdGVrIDB4MDAwMjEwMDI1ZDA3MDAw
MApSZWFsdGVrIDB4MDAwMzEwMDI1ZDA3MDAwMAoKCiEhS2VybmVsIEluZm9ybWF0aW9uCiEh
LS0tLS0tLS0tLS0tLS0tLS0tCgpLZXJuZWwgcmVsZWFzZTogICAgIzEgWkVOIFNNUCBQUkVF
TVBUX0RZTkFNSUMgV2VkLCAwNCBNYXIgMjAyNiAxODoyNDo1NiArMDAwMApPcGVyYXRpbmcg
U3lzdGVtOiAgR05VL0xpbnV4CkFyY2hpdGVjdHVyZTogICAgICB4ODZfNjQKUHJvY2Vzc29y
OiAgICAgICAgIHVua25vd24KU01QIEVuYWJsZWQ6ICAgICAgIFllcwoKCiEhQUxTQSBWZXJz
aW9uCiEhLS0tLS0tLS0tLS0tCgpEcml2ZXIgdmVyc2lvbjogICAgIGs2LjE5LjYtemVuMS0x
LXplbgpMaWJyYXJ5IHZlcnNpb246ICAgIDEuMi4xNS4zClV0aWxpdGllcyB2ZXJzaW9uOiAg
MS4yLjE1LjIKCgohIUxvYWRlZCBBTFNBIG1vZHVsZXMKISEtLS0tLS0tLS0tLS0tLS0tLS0t
CgpzbmRfdXNiX2F1ZGlvIChjYXJkIDApCnNuZF9oZGFfaW50ZWwgKGNhcmQgMSkKc25kX2hk
YV9pbnRlbCAoY2FyZCAyKQoKCiEhU291bmQgU2VydmVycyBvbiB0aGlzIHN5c3RlbQohIS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KClBpcGVXaXJlOgogICAgICBJbnN0YWxsZWQg
LSBZZXMgKC91c3IvYmluL3BpcGV3aXJlKQogICAgICBSdW5uaW5nIC0gWWVzCgpObyBzb3Vu
ZCBzZXJ2ZXJzIGZvdW5kLgoKCiEhU291bmRjYXJkcyByZWNvZ25pc2VkIGJ5IEFMU0EKISEt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKIDAgW01pY3JvcGhvbmUgICAgIF06IFVT
Qi1BdWRpbyAtIFlldGkgU3RlcmVvIE1pY3JvcGhvbmUKICAgICAgICAgICAgICAgICAgICAg
IEJsdWUgTWljcm9waG9uZXMgWWV0aSBTdGVyZW8gTWljcm9waG9uZSBhdCB1c2ItMDAwMDow
MDoxNC4wLTcsIGZ1bGwgc3BlZWQKIDEgW1BDSCAgICAgICAgICAgIF06IEhEQS1JbnRlbCAt
IEhEQSBJbnRlbCBQQ0gKICAgICAgICAgICAgICAgICAgICAgIEhEQSBJbnRlbCBQQ0ggYXQg
MHg0ODEwMTEwMDAwIGlycSAxODgKIDIgW0hETUkgICAgICAgICAgIF06IEhEQS1JbnRlbCAt
IEhEQSBBVEkgSERNSQogICAgICAgICAgICAgICAgICAgICAgSERBIEFUSSBIRE1JIGF0IDB4
YTAxMjAwMDAgaXJxIDE4NwoKCiEhUENJIFNvdW5kY2FyZHMgaW5zdGFsbGVkIGluIHRoZSBz
eXN0ZW0KISEtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKMDA6MWYu
MyBBdWRpbyBkZXZpY2UgWzA0MDNdOiBJbnRlbCBDb3Jwb3JhdGlvbiBDb21ldCBMYWtlIFBD
SCBjQVZTIFs4MDg2OjA2YzhdIChwcm9nLWlmIDAwIFtIREEgY29tcGF0aWJsZV0pCglEZXZp
Y2VOYW1lOiBPbmJvYXJkIC0gU291bmQKMDM6MDAuMSBBdWRpbyBkZXZpY2UgWzA0MDNdOiBB
ZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuIFtBTUQvQVRJXSBOYXZpIDMxIEhETUkvRFAg
QXVkaW8gWzEwMDI6YWIzMF0gKHByb2ctaWYgMDAgW0hEQSBjb21wYXRpYmxlXSkKCVN1YnN5
c3RlbTogQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLiBbQU1EL0FUSV0gTmF2aSAzMSBI
RE1JL0RQIEF1ZGlvIFsxMDAyOmFiMzBdCgoKISFNb2Rwcm9iZSBvcHRpb25zIChTb3VuZCBy
ZWxhdGVkKQohIS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpzbmRfaGRhX2lu
dGVsOiBwb3dlcl9zYXZlPTAKCgohIUxvYWRlZCBzb3VuZCBtb2R1bGUgb3B0aW9ucwohIS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKISFNb2R1bGU6IHNuZF91c2JfYXVkaW8KCWF1
dG9jbG9jayA6IFkKCWRlbGF5ZWRfcmVnaXN0ZXIgOiAobnVsbCksKG51bGwpLChudWxsKSwo
bnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwp
LChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVs
bCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChu
dWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpCglkZXZpY2Vfc2V0dXAg
OiAwLDAsMCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAs
MCwwLDAsMCwwLDAKCWVuYWJsZSA6IFksWSxZLFksWSxZLFksWSxZLFksWSxZLFksWSxZLFks
WSxZLFksWSxZLFksWSxZLFksWSxZLFksWSxZLFksWQoJaWQgOiAobnVsbCksKG51bGwpLChu
dWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCks
KG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxs
KSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51
bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpCglpZ25vcmVf
Y3RsX2Vycm9yIDogTgoJaW1wbGljaXRfZmIgOiBOLE4sTixOLE4sTixOLE4sTixOLE4sTixO
LE4sTixOLE4sTixOLE4sTixOLE4sTixOLE4sTixOLE4sTixOLE4KCWluZGV4IDogLTEsLTEs
LTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEs
LTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEKCWxvd2xhdGVuY3kgOiBZCglt
aWRpMl9lbmFibGUgOiBZCgltaWRpMl91bXBfcHJvYmUgOiBZCglwaWQgOiAtMSwtMSwtMSwt
MSwtMSwtMSwtMSwtMSwtMSwtMSwtMSwtMSwtMSwtMSwtMSwtMSwtMSwtMSwtMSwtMSwtMSwt
MSwtMSwtMSwtMSwtMSwtMSwtMSwtMSwtMSwtMSwtMQoJcXVpcmtfYWxpYXMgOiAobnVsbCks
KG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxs
KSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51
bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwo
bnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwp
CglxdWlya19mbGFncyA6IChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51
bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwo
bnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwp
LChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVs
bCksKG51bGwpLChudWxsKSwobnVsbCkKCXNraXBfdmFsaWRhdGlvbiA6IE4KCXVzZV92bWFs
bG9jIDogWQoJdmlkIDogLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEs
LTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEs
LTEKCiEhTW9kdWxlOiBzbmRfaGRhX2ludGVsCglhbGlnbl9idWZmZXJfc2l6ZSA6IC0xCgli
ZGxfcG9zX2FkaiA6IC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0x
LC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0x
CgliZWVwX21vZGUgOiBOLE4sTixOLE4sTixOLE4sTixOLE4sTixOLE4sTixOLE4sTixOLE4s
TixOLE4sTixOLE4sTixOLE4sTixOLE4KCWN0bF9kZXZfaWQgOiBOCglkbWljX2RldGVjdCA6
IFkKCWVuYWJsZSA6IFksWSxZLFksWSxZLFksWSxZLFksWSxZLFksWSxZLFksWSxZLFksWSxZ
LFksWSxZLFksWSxZLFksWSxZLFksWQoJZW5hYmxlX21zaSA6IC0xCglpZCA6IChudWxsKSwo
bnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwp
LChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVs
bCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChu
dWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCkK
CWluZGV4IDogLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEs
LTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEKCWph
Y2twb2xsX21zIDogMCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAs
MCwwLDAsMCwwLDAsMCwwLDAsMCwwCgltb2RlbCA6IChudWxsKSwobnVsbCksKG51bGwpLChu
dWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCks
KG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxs
KSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51
bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCkKCXBhdGNoIDogKG51bGwp
LChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVs
bCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChu
dWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCks
KG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxs
KQoJcG1fYmxhY2tsaXN0IDogLTEKCXBvc2l0aW9uX2ZpeCA6IC0xLC0xLC0xLC0xLC0xLC0x
LC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0x
LC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xCglwb3dlcl9zYXZlIDogMAoJcG93ZXJfc2F2ZV9j
b250cm9sbGVyIDogWQoJcHJvYmVfbWFzayA6IC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0x
LC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0x
LC0xLC0xLC0xLC0xLC0xCglwcm9iZV9vbmx5IDogMCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAs
MCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAsMCwwCglzaW5nbGVfY21kIDog
LTEKCXNub29wIDogLTEKCiEhTW9kdWxlOiBzbmRfaGRhX2ludGVsCglhbGlnbl9idWZmZXJf
c2l6ZSA6IC0xCgliZGxfcG9zX2FkaiA6IC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0x
LC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0x
LC0xLC0xLC0xLC0xCgliZWVwX21vZGUgOiBOLE4sTixOLE4sTixOLE4sTixOLE4sTixOLE4s
TixOLE4sTixOLE4sTixOLE4sTixOLE4sTixOLE4sTixOLE4KCWN0bF9kZXZfaWQgOiBOCglk
bWljX2RldGVjdCA6IFkKCWVuYWJsZSA6IFksWSxZLFksWSxZLFksWSxZLFksWSxZLFksWSxZ
LFksWSxZLFksWSxZLFksWSxZLFksWSxZLFksWSxZLFksWQoJZW5hYmxlX21zaSA6IC0xCglp
ZCA6IChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwo
bnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwp
LChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVs
bCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChu
dWxsKSwobnVsbCkKCWluZGV4IDogLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEs
LTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEsLTEs
LTEsLTEsLTEKCWphY2twb2xsX21zIDogMCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAs
MCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAsMCwwCgltb2RlbCA6IChudWxsKSwobnVs
bCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChu
dWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCks
KG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxs
KSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCkKCXBh
dGNoIDogKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwp
LChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVs
bCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChu
dWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCksKG51bGwpLChudWxsKSwobnVsbCks
KG51bGwpLChudWxsKQoJcG1fYmxhY2tsaXN0IDogLTEKCXBvc2l0aW9uX2ZpeCA6IC0xLC0x
LC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0x
LC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xCglwb3dlcl9zYXZlIDogMAoJ
cG93ZXJfc2F2ZV9jb250cm9sbGVyIDogWQoJcHJvYmVfbWFzayA6IC0xLC0xLC0xLC0xLC0x
LC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0x
LC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xLC0xCglwcm9iZV9vbmx5IDogMCwwLDAsMCwwLDAs
MCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAsMCwwLDAsMCwwCglz
aW5nbGVfY21kIDogLTEKCXNub29wIDogLTEKCgohIVN5c2ZzIGNhcmQgaW5mbwohIS0tLS0t
LS0tLS0tLS0tLQoKISFDYXJkOiAvc3lzL2NsYXNzL3NvdW5kL2NhcmQwCkRyaXZlcjogL3N5
cy9idXMvdXNiL2RyaXZlcnMvc25kLXVzYi1hdWRpbwpUcmVlOgoKISFDYXJkOiAvc3lzL2Ns
YXNzL3NvdW5kL2NhcmQxCkRyaXZlcjogL3N5cy9idXMvcGNpL2RyaXZlcnMvc25kX2hkYV9p
bnRlbApUcmVlOgoKISFDYXJkOiAvc3lzL2NsYXNzL3NvdW5kL2NhcmQyCkRyaXZlcjogL3N5
cy9idXMvcGNpL2RyaXZlcnMvc25kX2hkYV9pbnRlbApUcmVlOgoKCiEhSERBLUludGVsIENv
ZGVjIGluZm9ybWF0aW9uCiEhLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0tc3RhcnRj
b2xsYXBzZS0tCgpDb2RlYzogUmVhbHRlayBBTENTMTIwMEEKQWRkcmVzczogMApBRkcgRnVu
Y3Rpb24gSWQ6IDB4MSAodW5zb2wgMSkKVmVuZG9yIElkOiAweDEwZWMwYjAwClN1YnN5c3Rl
bSBJZDogMHgxNDYyZWM3OQpSZXZpc2lvbiBJZDogMHgxMDAwMDEKTm8gTW9kZW0gRnVuY3Rp
b24gR3JvdXAgZm91bmQKRGVmYXVsdCBQQ006CiAgICByYXRlcyBbMHg1ZjBdOiAzMjAwMCA0
NDEwMCA0ODAwMCA4ODIwMCA5NjAwMCAxOTIwMDAKICAgIGJpdHMgWzB4ZV06IDE2IDIwIDI0
CiAgICBmb3JtYXRzIFsweDFdOiBQQ00KRGVmYXVsdCBBbXAtSW4gY2FwczogTi9BCkRlZmF1
bHQgQW1wLU91dCBjYXBzOiBOL0EKU3RhdGUgb2YgQUZHIG5vZGUgMHgwMToKICBQb3dlciBz
dGF0ZXM6ICBEMCBEMSBEMiBEMyBDTEtTVE9QIEVQU1MKICBQb3dlcjogc2V0dGluZz1EMCwg
YWN0dWFsPUQwCkdQSU86IGlvPTIsIG89MCwgaT0wLCB1bnNvbGljaXRlZD0xLCB3YWtlPTAK
ICBJT1swXTogZW5hYmxlPTEsIGRpcj0xLCB3YWtlPTAsIHN0aWNreT0wLCBkYXRhPTEsIHVu
c29sPTAKICBJT1sxXTogZW5hYmxlPTEsIGRpcj0xLCB3YWtlPTAsIHN0aWNreT0wLCBkYXRh
PTEsIHVuc29sPTAKTm9kZSAweDAyIFtBdWRpbyBPdXRwdXRdIHdjYXBzIDB4NDFkOiBTdGVy
ZW8gQW1wLU91dAogIENvbnRyb2w6IG5hbWU9IkZyb250IFBsYXliYWNrIFZvbHVtZSIsIGlu
ZGV4PTAsIGRldmljZT0wCiAgICBDb250cm9sQW1wOiBjaHM9MywgZGlyPU91dCwgaWR4PTAs
IG9mcz0wCiAgRGV2aWNlOiBuYW1lPSJBTENTMTIwMEEgQW5hbG9nIiwgdHlwZT0iQXVkaW8i
LCBkZXZpY2U9MAogIEFtcC1PdXQgY2Fwczogb2ZzPTB4NTcsIG5zdGVwcz0weDU3LCBzdGVw
c2l6ZT0weDAyLCBtdXRlPTAKICBBbXAtT3V0IHZhbHM6ICBbMHg0MCAweDQwXQogIENvbnZl
cnRlcjogc3RyZWFtPTEsIGNoYW5uZWw9MAogIFBDTToKICAgIHJhdGVzIFsweDU2MF06IDQ0
MTAwIDQ4MDAwIDk2MDAwIDE5MjAwMAogICAgYml0cyBbMHhlXTogMTYgMjAgMjQKICAgIGZv
cm1hdHMgWzB4MV06IFBDTQogIFBvd2VyIHN0YXRlczogIEQwIEQxIEQyIEQzIEVQU1MKICBQ
b3dlcjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCk5vZGUgMHgwMyBbQXVkaW8gT3V0cHV0XSB3
Y2FwcyAweDQxZDogU3RlcmVvIEFtcC1PdXQKICBDb250cm9sOiBuYW1lPSJTdXJyb3VuZCBQ
bGF5YmFjayBWb2x1bWUiLCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDogY2hz
PTMsIGRpcj1PdXQsIGlkeD0wLCBvZnM9MAogIEFtcC1PdXQgY2Fwczogb2ZzPTB4NTcsIG5z
dGVwcz0weDU3LCBzdGVwc2l6ZT0weDAyLCBtdXRlPTAKICBBbXAtT3V0IHZhbHM6ICBbMHgw
MCAweDAwXQogIENvbnZlcnRlcjogc3RyZWFtPTEsIGNoYW5uZWw9MAogIFBDTToKICAgIHJh
dGVzIFsweDU2MF06IDQ0MTAwIDQ4MDAwIDk2MDAwIDE5MjAwMAogICAgYml0cyBbMHhlXTog
MTYgMjAgMjQKICAgIGZvcm1hdHMgWzB4MV06IFBDTQogIFBvd2VyIHN0YXRlczogIEQwIEQx
IEQyIEQzIEVQU1MKICBQb3dlcjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCk5vZGUgMHgwNCBb
QXVkaW8gT3V0cHV0XSB3Y2FwcyAweDQxZDogU3RlcmVvIEFtcC1PdXQKICBDb250cm9sOiBu
YW1lPSJDZW50ZXIgUGxheWJhY2sgVm9sdW1lIiwgaW5kZXg9MCwgZGV2aWNlPTAKICAgIENv
bnRyb2xBbXA6IGNocz0xLCBkaXI9T3V0LCBpZHg9MCwgb2ZzPTAKICBDb250cm9sOiBuYW1l
PSJMRkUgUGxheWJhY2sgVm9sdW1lIiwgaW5kZXg9MCwgZGV2aWNlPTAKICAgIENvbnRyb2xB
bXA6IGNocz0yLCBkaXI9T3V0LCBpZHg9MCwgb2ZzPTAKICBBbXAtT3V0IGNhcHM6IG9mcz0w
eDU3LCBuc3RlcHM9MHg1Nywgc3RlcHNpemU9MHgwMiwgbXV0ZT0wCiAgQW1wLU91dCB2YWxz
OiAgWzB4MDAgMHgwMF0KICBDb252ZXJ0ZXI6IHN0cmVhbT0xLCBjaGFubmVsPTAKICBQQ006
CiAgICByYXRlcyBbMHg1NjBdOiA0NDEwMCA0ODAwMCA5NjAwMCAxOTIwMDAKICAgIGJpdHMg
WzB4ZV06IDE2IDIwIDI0CiAgICBmb3JtYXRzIFsweDFdOiBQQ00KICBQb3dlciBzdGF0ZXM6
ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMApOb2Rl
IDB4MDUgW0F1ZGlvIE91dHB1dF0gd2NhcHMgMHg0MWQ6IFN0ZXJlbyBBbXAtT3V0CiAgQ29u
dHJvbDogbmFtZT0iSGVhZHBob25lIFBsYXliYWNrIFZvbHVtZSIsIGluZGV4PTAsIGRldmlj
ZT0wCiAgICBDb250cm9sQW1wOiBjaHM9MywgZGlyPU91dCwgaWR4PTAsIG9mcz0wCiAgQW1w
LU91dCBjYXBzOiBvZnM9MHg1NywgbnN0ZXBzPTB4NTcsIHN0ZXBzaXplPTB4MDIsIG11dGU9
MAogIEFtcC1PdXQgdmFsczogIFsweDQwIDB4NDBdCiAgQ29udmVydGVyOiBzdHJlYW09MSwg
Y2hhbm5lbD0wCiAgUENNOgogICAgcmF0ZXMgWzB4NTYwXTogNDQxMDAgNDgwMDAgOTYwMDAg
MTkyMDAwCiAgICBiaXRzIFsweGVdOiAxNiAyMCAyNAogICAgZm9ybWF0cyBbMHgxXTogUENN
CiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQw
LCBhY3R1YWw9RDAKTm9kZSAweDA2IFtBdWRpbyBPdXRwdXRdIHdjYXBzIDB4NjExOiBTdGVy
ZW8gRGlnaXRhbAogIENvbnRyb2w6IG5hbWU9IklFQzk1OCBQbGF5YmFjayBDb24gTWFzayIs
IGluZGV4PTAsIGRldmljZT0wCiAgQ29udHJvbDogbmFtZT0iSUVDOTU4IFBsYXliYWNrIFBy
byBNYXNrIiwgaW5kZXg9MCwgZGV2aWNlPTAKICBDb250cm9sOiBuYW1lPSJJRUM5NTggUGxh
eWJhY2sgRGVmYXVsdCIsIGluZGV4PTAsIGRldmljZT0wCiAgQ29udHJvbDogbmFtZT0iSUVD
OTU4IFBsYXliYWNrIFN3aXRjaCIsIGluZGV4PTAsIGRldmljZT0wCiAgQ29udHJvbDogbmFt
ZT0iSUVDOTU4IERlZmF1bHQgUENNIFBsYXliYWNrIFN3aXRjaCIsIGluZGV4PTAsIGRldmlj
ZT0wCiAgRGV2aWNlOiBuYW1lPSJBTENTMTIwMEEgRGlnaXRhbCIsIHR5cGU9IlNQRElGIiwg
ZGV2aWNlPTEKICBDb252ZXJ0ZXI6IHN0cmVhbT0xLCBjaGFubmVsPTAKICBEaWdpdGFsOiBF
bmFibGVkCiAgRGlnaXRhbCBjYXRlZ29yeTogMHgwCiAgSUVDIENvZGluZyBUeXBlOiAweDAK
ICBQQ006CiAgICByYXRlcyBbMHg1ZjBdOiAzMjAwMCA0NDEwMCA0ODAwMCA4ODIwMCA5NjAw
MCAxOTIwMDAKICAgIGJpdHMgWzB4ZV06IDE2IDIwIDI0CiAgICBmb3JtYXRzIFsweDFdOiBQ
Q00KICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9
RDAsIGFjdHVhbD1EMApOb2RlIDB4MDcgW1ZlbmRvciBEZWZpbmVkIFdpZGdldF0gd2NhcHMg
MHhmMDAwMDA6IE1vbm8KTm9kZSAweDA4IFtBdWRpbyBJbnB1dF0gd2NhcHMgMHgxMDA1MWI6
IFN0ZXJlbyBBbXAtSW4KICBDb250cm9sOiBuYW1lPSJDYXB0dXJlIFZvbHVtZSIsIGluZGV4
PTAsIGRldmljZT0wCiAgICBDb250cm9sQW1wOiBjaHM9MywgZGlyPUluLCBpZHg9MCwgb2Zz
PTAKICBDb250cm9sOiBuYW1lPSJDYXB0dXJlIFN3aXRjaCIsIGluZGV4PTAsIGRldmljZT0w
CiAgICBDb250cm9sQW1wOiBjaHM9MywgZGlyPUluLCBpZHg9MCwgb2ZzPTAKICBEZXZpY2U6
IG5hbWU9IkFMQ1MxMjAwQSBBbmFsb2ciLCB0eXBlPSJBdWRpbyIsIGRldmljZT0wCiAgQW1w
LUluIGNhcHM6IG9mcz0weDE3LCBuc3RlcHM9MHgzZiwgc3RlcHNpemU9MHgwMiwgbXV0ZT0x
CiAgQW1wLUluIHZhbHM6ICBbMHgyNyAweDI3XQogIENvbnZlcnRlcjogc3RyZWFtPTAsIGNo
YW5uZWw9MAogIFNESS1TZWxlY3Q6IDAKICBQQ006CiAgICByYXRlcyBbMHg1NjBdOiA0NDEw
MCA0ODAwMCA5NjAwMCAxOTIwMDAKICAgIGJpdHMgWzB4ZV06IDE2IDIwIDI0CiAgICBmb3Jt
YXRzIFsweDFdOiBQQ00KICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93
ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMAogIENvbm5lY3Rpb246IDEKICAgICAweDIzCk5v
ZGUgMHgwOSBbQXVkaW8gSW5wdXRdIHdjYXBzIDB4MTAwNTFiOiBTdGVyZW8gQW1wLUluCiAg
Q29udHJvbDogbmFtZT0iQ2FwdHVyZSBWb2x1bWUiLCBpbmRleD0xLCBkZXZpY2U9MAogICAg
Q29udHJvbEFtcDogY2hzPTMsIGRpcj1JbiwgaWR4PTAsIG9mcz0wCiAgQ29udHJvbDogbmFt
ZT0iQ2FwdHVyZSBTd2l0Y2giLCBpbmRleD0xLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDog
Y2hzPTMsIGRpcj1JbiwgaWR4PTAsIG9mcz0wCiAgRGV2aWNlOiBuYW1lPSJBTENTMTIwMEEg
QWx0IEFuYWxvZyIsIHR5cGU9IkF1ZGlvIiwgZGV2aWNlPTIKICBBbXAtSW4gY2Fwczogb2Zz
PTB4MTcsIG5zdGVwcz0weDNmLCBzdGVwc2l6ZT0weDAyLCBtdXRlPTEKICBBbXAtSW4gdmFs
czogIFsweDgwIDB4ODBdCiAgQ29udmVydGVyOiBzdHJlYW09MSwgY2hhbm5lbD0wCiAgU0RJ
LVNlbGVjdDogMAogIFBDTToKICAgIHJhdGVzIFsweDU2MF06IDQ0MTAwIDQ4MDAwIDk2MDAw
IDE5MjAwMAogICAgYml0cyBbMHhlXTogMTYgMjAgMjQKICAgIGZvcm1hdHMgWzB4MV06IFBD
TQogIFBvd2VyIHN0YXRlczogIEQwIEQxIEQyIEQzIEVQU1MKICBQb3dlcjogc2V0dGluZz1E
MCwgYWN0dWFsPUQwCiAgQ29ubmVjdGlvbjogMQogICAgIDB4MjIKTm9kZSAweDBhIFtWZW5k
b3IgRGVmaW5lZCBXaWRnZXRdIHdjYXBzIDB4ZjAwMDAwOiBNb25vCk5vZGUgMHgwYiBbQXVk
aW8gTWl4ZXJdIHdjYXBzIDB4MjAwMTBiOiBTdGVyZW8gQW1wLUluCiAgQ29udHJvbDogbmFt
ZT0iUmVhciBNaWMgUGxheWJhY2sgVm9sdW1lIiwgaW5kZXg9MCwgZGV2aWNlPTAKICAgIENv
bnRyb2xBbXA6IGNocz0zLCBkaXI9SW4sIGlkeD0wLCBvZnM9MAogIENvbnRyb2w6IG5hbWU9
IlJlYXIgTWljIFBsYXliYWNrIFN3aXRjaCIsIGluZGV4PTAsIGRldmljZT0wCiAgICBDb250
cm9sQW1wOiBjaHM9MywgZGlyPUluLCBpZHg9MCwgb2ZzPTAKICBDb250cm9sOiBuYW1lPSJG
cm9udCBNaWMgUGxheWJhY2sgVm9sdW1lIiwgaW5kZXg9MCwgZGV2aWNlPTAKICAgIENvbnRy
b2xBbXA6IGNocz0zLCBkaXI9SW4sIGlkeD0xLCBvZnM9MAogIENvbnRyb2w6IG5hbWU9IkZy
b250IE1pYyBQbGF5YmFjayBTd2l0Y2giLCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJv
bEFtcDogY2hzPTMsIGRpcj1JbiwgaWR4PTEsIG9mcz0wCiAgQ29udHJvbDogbmFtZT0iTGlu
ZSBQbGF5YmFjayBWb2x1bWUiLCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDog
Y2hzPTMsIGRpcj1JbiwgaWR4PTIsIG9mcz0wCiAgQ29udHJvbDogbmFtZT0iTGluZSBQbGF5
YmFjayBTd2l0Y2giLCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDogY2hzPTMs
IGRpcj1JbiwgaWR4PTIsIG9mcz0wCiAgQ29udHJvbDogbmFtZT0iQmVlcCBQbGF5YmFjayBW
b2x1bWUiLCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDogY2hzPTMsIGRpcj1J
biwgaWR4PTUsIG9mcz0wCiAgQ29udHJvbDogbmFtZT0iQmVlcCBQbGF5YmFjayBTd2l0Y2gi
LCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDogY2hzPTMsIGRpcj1JbiwgaWR4
PTUsIG9mcz0wCiAgQW1wLUluIGNhcHM6IG9mcz0weDE3LCBuc3RlcHM9MHgxZiwgc3RlcHNp
emU9MHgwNSwgbXV0ZT0xCiAgQW1wLUluIHZhbHM6ICBbMHg4MCAweDgwXSBbMHg4MCAweDgw
XSBbMHg4MCAweDgwXSBbMHg4MCAweDgwXSBbMHg4MCAweDgwXSBbMHg4MCAweDgwXSBbMHg4
MCAweDgwXSBbMHg4MCAweDgwXQogIENvbm5lY3Rpb246IDgKICAgICAweDE4IDB4MTkgMHgx
YSAweDFiIDB4MTQgMHgxNSAweDE2IDB4MTcKTm9kZSAweDBjIFtBdWRpbyBNaXhlcl0gd2Nh
cHMgMHgyMDAxMGI6IFN0ZXJlbyBBbXAtSW4KICBBbXAtSW4gY2Fwczogb2ZzPTB4MDAsIG5z
dGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRlPTEKICBBbXAtSW4gdmFsczogIFsweDAw
IDB4MDBdIFsweDgwIDB4ODBdCiAgQ29ubmVjdGlvbjogMgogICAgIDB4MDIgMHgwYgpOb2Rl
IDB4MGQgW0F1ZGlvIE1peGVyXSB3Y2FwcyAweDIwMDEwYjogU3RlcmVvIEFtcC1JbgogIEFt
cC1JbiBjYXBzOiBvZnM9MHgwMCwgbnN0ZXBzPTB4MDAsIHN0ZXBzaXplPTB4MDAsIG11dGU9
MQogIEFtcC1JbiB2YWxzOiAgWzB4MDAgMHgwMF0gWzB4ODAgMHg4MF0KICBDb25uZWN0aW9u
OiAyCiAgICAgMHgwMyAweDBiCk5vZGUgMHgwZSBbQXVkaW8gTWl4ZXJdIHdjYXBzIDB4MjAw
MTBiOiBTdGVyZW8gQW1wLUluCiAgQW1wLUluIGNhcHM6IG9mcz0weDAwLCBuc3RlcHM9MHgw
MCwgc3RlcHNpemU9MHgwMCwgbXV0ZT0xCiAgQW1wLUluIHZhbHM6ICBbMHgwMCAweDAwXSBb
MHg4MCAweDgwXQogIENvbm5lY3Rpb246IDIKICAgICAweDA0IDB4MGIKTm9kZSAweDBmIFtB
dWRpbyBNaXhlcl0gd2NhcHMgMHgyMDAxMGI6IFN0ZXJlbyBBbXAtSW4KICBBbXAtSW4gY2Fw
czogb2ZzPTB4MDAsIG5zdGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRlPTEKICBBbXAt
SW4gdmFsczogIFsweDAwIDB4MDBdIFsweDgwIDB4ODBdCiAgQ29ubmVjdGlvbjogMgogICAg
IDB4MDUgMHgwYgpOb2RlIDB4MTAgW0F1ZGlvIE91dHB1dF0gd2NhcHMgMHg2MTE6IFN0ZXJl
byBEaWdpdGFsCiAgQ29udmVydGVyOiBzdHJlYW09MCwgY2hhbm5lbD0wCiAgRGlnaXRhbDoK
ICBEaWdpdGFsIGNhdGVnb3J5OiAweDAKICBJRUMgQ29kaW5nIFR5cGU6IDB4MAogIFBDTToK
ICAgIHJhdGVzIFsweDVmMF06IDMyMDAwIDQ0MTAwIDQ4MDAwIDg4MjAwIDk2MDAwIDE5MjAw
MAogICAgYml0cyBbMHhlXTogMTYgMjAgMjQKICAgIGZvcm1hdHMgWzB4MV06IFBDTQogIFBv
d2VyIHN0YXRlczogIEQwIEQxIEQyIEQzIEVQU1MKICBQb3dlcjogc2V0dGluZz1EMCwgYWN0
dWFsPUQwCk5vZGUgMHgxMSBbUGluIENvbXBsZXhdIHdjYXBzIDB4NDAwNzgxOiBTdGVyZW8g
RGlnaXRhbAogIFBpbmNhcCAweDAwMDAwMDE0OiBPVVQgRGV0ZWN0CiAgUGluIERlZmF1bHQg
MHg0MDM3YzU0MDogW04vQV0gQ0QgYXQgRXh0IE4vQQogICAgQ29ubiA9IEFuYWxvZywgQ29s
b3IgPSBVTktOT1dOCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4NCwgU2VxdWVuY2UgPSAweDAK
ICAgIE1pc2MgPSBOT19QUkVTRU5DRQogIFBpbi1jdGxzOiAweDQwOiBPVVQKICBVbnNvbGlj
aXRlZDogdGFnPTAwLCBlbmFibGVkPTAKICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBF
UFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMAogIENvbm5lY3Rpb246IDEKICAg
ICAweDEwCk5vZGUgMHgxMiBbVmVuZG9yIERlZmluZWQgV2lkZ2V0XSB3Y2FwcyAweGYwMDAw
MDogTW9ubwpOb2RlIDB4MTMgW1ZlbmRvciBEZWZpbmVkIFdpZGdldF0gd2NhcHMgMHhmMDAw
MDA6IE1vbm8KTm9kZSAweDE0IFtQaW4gQ29tcGxleF0gd2NhcHMgMHg0MDA1OGQ6IFN0ZXJl
byBBbXAtT3V0CiAgQ29udHJvbDogbmFtZT0iRnJvbnQgUGxheWJhY2sgU3dpdGNoIiwgaW5k
ZXg9MCwgZGV2aWNlPTAKICAgIENvbnRyb2xBbXA6IGNocz0zLCBkaXI9T3V0LCBpZHg9MCwg
b2ZzPTAKICBBbXAtT3V0IGNhcHM6IG9mcz0weDAwLCBuc3RlcHM9MHgwMCwgc3RlcHNpemU9
MHgwMCwgbXV0ZT0xCiAgQW1wLU91dCB2YWxzOiAgWzB4ODAgMHg4MF0KICBQaW5jYXAgMHgw
MDAxMDAzZTogSU4gT1VUIEhQIEVBUEQgRGV0ZWN0IFRyaWdnZXIKICBFQVBEIDB4MjogRUFQ
RAogIFBpbiBEZWZhdWx0IDB4MDEwMTUwMTA6IFtKYWNrXSBMaW5lIE91dCBhdCBFeHQgUmVh
cgogICAgQ29ubiA9IDEvOCwgQ29sb3IgPSBSZWQKICAgIERlZkFzc29jaWF0aW9uID0gMHgx
LCBTZXF1ZW5jZSA9IDB4MAogIFBpbi1jdGxzOiAweDAwOgogIFVuc29saWNpdGVkOiB0YWc9
MDUsIGVuYWJsZWQ9MQogIFBvd2VyIHN0YXRlczogIEQwIEQxIEQyIEQzIEVQU1MKICBQb3dl
cjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCiAgQ29ubmVjdGlvbjogMQogICAgIDB4MGMKTm9k
ZSAweDE1IFtQaW4gQ29tcGxleF0gd2NhcHMgMHg0MDA1OGQ6IFN0ZXJlbyBBbXAtT3V0CiAg
Q29udHJvbDogbmFtZT0iU3Vycm91bmQgUGxheWJhY2sgU3dpdGNoIiwgaW5kZXg9MCwgZGV2
aWNlPTAKICAgIENvbnRyb2xBbXA6IGNocz0zLCBkaXI9T3V0LCBpZHg9MCwgb2ZzPTAKICBB
bXAtT3V0IGNhcHM6IG9mcz0weDAwLCBuc3RlcHM9MHgwMCwgc3RlcHNpemU9MHgwMCwgbXV0
ZT0xCiAgQW1wLU91dCB2YWxzOiAgWzB4ODAgMHg4MF0KICBQaW5jYXAgMHgwMDAwMDAzNjog
SU4gT1VUIERldGVjdCBUcmlnZ2VyCiAgUGluIERlZmF1bHQgMHgwMTAxMTAxMjogW0phY2td
IExpbmUgT3V0IGF0IEV4dCBSZWFyCiAgICBDb25uID0gMS84LCBDb2xvciA9IEJsYWNrCiAg
ICBEZWZBc3NvY2lhdGlvbiA9IDB4MSwgU2VxdWVuY2UgPSAweDIKICBQaW4tY3RsczogMHgw
MDoKICBVbnNvbGljaXRlZDogdGFnPTA2LCBlbmFibGVkPTEKICBQb3dlciBzdGF0ZXM6ICBE
MCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMAogIENvbm5l
Y3Rpb246IDEKICAgICAweDBkCk5vZGUgMHgxNiBbUGluIENvbXBsZXhdIHdjYXBzIDB4NDAw
NThkOiBTdGVyZW8gQW1wLU91dAogIENvbnRyb2w6IG5hbWU9IkNlbnRlciBQbGF5YmFjayBT
d2l0Y2giLCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDogY2hzPTEsIGRpcj1P
dXQsIGlkeD0wLCBvZnM9MAogIENvbnRyb2w6IG5hbWU9IkxGRSBQbGF5YmFjayBTd2l0Y2gi
LCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDogY2hzPTIsIGRpcj1PdXQsIGlk
eD0wLCBvZnM9MAogIEFtcC1PdXQgY2Fwczogb2ZzPTB4MDAsIG5zdGVwcz0weDAwLCBzdGVw
c2l6ZT0weDAwLCBtdXRlPTEKICBBbXAtT3V0IHZhbHM6ICBbMHg4MCAweDgwXQogIFBpbmNh
cCAweDAwMDAwMDM2OiBJTiBPVVQgRGV0ZWN0IFRyaWdnZXIKICBQaW4gRGVmYXVsdCAweDAx
MDExMDExOiBbSmFja10gTGluZSBPdXQgYXQgRXh0IFJlYXIKICAgIENvbm4gPSAxLzgsIENv
bG9yID0gQmxhY2sKICAgIERlZkFzc29jaWF0aW9uID0gMHgxLCBTZXF1ZW5jZSA9IDB4MQog
IFBpbi1jdGxzOiAweDAwOgogIFVuc29saWNpdGVkOiB0YWc9MDcsIGVuYWJsZWQ9MQogIFBv
d2VyIHN0YXRlczogIEQwIEQxIEQyIEQzIEVQU1MKICBQb3dlcjogc2V0dGluZz1EMCwgYWN0
dWFsPUQwCiAgQ29ubmVjdGlvbjogMQogICAgIDB4MGUKTm9kZSAweDE3IFtQaW4gQ29tcGxl
eF0gd2NhcHMgMHg0MDA1OGQ6IFN0ZXJlbyBBbXAtT3V0CiAgQW1wLU91dCBjYXBzOiBvZnM9
MHgwMCwgbnN0ZXBzPTB4MDAsIHN0ZXBzaXplPTB4MDAsIG11dGU9MQogIEFtcC1PdXQgdmFs
czogIFsweDgwIDB4ODBdCiAgUGluY2FwIDB4MDAwMDAwMzY6IElOIE9VVCBEZXRlY3QgVHJp
Z2dlcgogIFBpbiBEZWZhdWx0IDB4NDExMTExZjA6IFtOL0FdIFNwZWFrZXIgYXQgRXh0IFJl
YXIKICAgIENvbm4gPSAxLzgsIENvbG9yID0gQmxhY2sKICAgIERlZkFzc29jaWF0aW9uID0g
MHhmLCBTZXF1ZW5jZSA9IDB4MAogICAgTWlzYyA9IE5PX1BSRVNFTkNFCiAgUGluLWN0bHM6
IDB4MjA6IElOCiAgVW5zb2xpY2l0ZWQ6IHRhZz0wMCwgZW5hYmxlZD0wCiAgUG93ZXIgc3Rh
dGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAK
ICBDb25uZWN0aW9uOiAxCiAgICAgMHgwZgpOb2RlIDB4MTggW1BpbiBDb21wbGV4XSB3Y2Fw
cyAweDQwMDU4ZjogU3RlcmVvIEFtcC1JbiBBbXAtT3V0CiAgQ29udHJvbDogbmFtZT0iUmVh
ciBNaWMgQm9vc3QgVm9sdW1lIiwgaW5kZXg9MCwgZGV2aWNlPTAKICAgIENvbnRyb2xBbXA6
IGNocz0zLCBkaXI9SW4sIGlkeD0wLCBvZnM9MAogIEFtcC1JbiBjYXBzOiBvZnM9MHgwMCwg
bnN0ZXBzPTB4MDMsIHN0ZXBzaXplPTB4MjcsIG11dGU9MAogIEFtcC1JbiB2YWxzOiAgWzB4
MDAgMHgwMF0KICBBbXAtT3V0IGNhcHM6IG9mcz0weDAwLCBuc3RlcHM9MHgwMCwgc3RlcHNp
emU9MHgwMCwgbXV0ZT0xCiAgQW1wLU91dCB2YWxzOiAgWzB4ODAgMHg4MF0KICBQaW5jYXAg
MHgwMDAwMzczNjogSU4gT1VUIERldGVjdCBUcmlnZ2VyCiAgICBWcmVmIGNhcHM6IEhJWiA1
MCBHUkQgODAgMTAwCiAgUGluIERlZmF1bHQgMHgwMWExMTA0MDogW0phY2tdIE1pYyBhdCBF
eHQgUmVhcgogICAgQ29ubiA9IDEvOCwgQ29sb3IgPSBCbGFjawogICAgRGVmQXNzb2NpYXRp
b24gPSAweDQsIFNlcXVlbmNlID0gMHgwCiAgUGluLWN0bHM6IDB4MjQ6IElOIFZSRUZfODAK
ICBVbnNvbGljaXRlZDogdGFnPTAyLCBlbmFibGVkPTEKICBQb3dlciBzdGF0ZXM6ICBEMCBE
MSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMAogIENvbm5lY3Rp
b246IDUKICAgICAweDBjKiAweDBkIDB4MGUgMHgwZiAweDI2Ck5vZGUgMHgxOSBbUGluIENv
bXBsZXhdIHdjYXBzIDB4NDAwNThmOiBTdGVyZW8gQW1wLUluIEFtcC1PdXQKICBDb250cm9s
OiBuYW1lPSJGcm9udCBNaWMgQm9vc3QgVm9sdW1lIiwgaW5kZXg9MCwgZGV2aWNlPTAKICAg
IENvbnRyb2xBbXA6IGNocz0zLCBkaXI9SW4sIGlkeD0wLCBvZnM9MAogIEFtcC1JbiBjYXBz
OiBvZnM9MHgwMCwgbnN0ZXBzPTB4MDMsIHN0ZXBzaXplPTB4MjcsIG11dGU9MAogIEFtcC1J
biB2YWxzOiAgWzB4MDAgMHgwMF0KICBBbXAtT3V0IGNhcHM6IG9mcz0weDAwLCBuc3RlcHM9
MHgwMCwgc3RlcHNpemU9MHgwMCwgbXV0ZT0xCiAgQW1wLU91dCB2YWxzOiAgWzB4ODAgMHg4
MF0KICBQaW5jYXAgMHgwMDAwMzczZTogSU4gT1VUIEhQIERldGVjdCBUcmlnZ2VyCiAgICBW
cmVmIGNhcHM6IEhJWiA1MCBHUkQgODAgMTAwCiAgUGluIERlZmF1bHQgMHgwMmExOTA1MDog
W0phY2tdIE1pYyBhdCBFeHQgRnJvbnQKICAgIENvbm4gPSAxLzgsIENvbG9yID0gUGluawog
ICAgRGVmQXNzb2NpYXRpb24gPSAweDUsIFNlcXVlbmNlID0gMHgwCiAgUGluLWN0bHM6IDB4
MjQ6IElOIFZSRUZfODAKICBVbnNvbGljaXRlZDogdGFnPTAzLCBlbmFibGVkPTEKICBQb3dl
ciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVh
bD1EMAogIENvbm5lY3Rpb246IDUKICAgICAweDBjKiAweDBkIDB4MGUgMHgwZiAweDI2Ck5v
ZGUgMHgxYSBbUGluIENvbXBsZXhdIHdjYXBzIDB4NDAwNThmOiBTdGVyZW8gQW1wLUluIEFt
cC1PdXQKICBDb250cm9sOiBuYW1lPSJMaW5lIEJvb3N0IFZvbHVtZSIsIGluZGV4PTAsIGRl
dmljZT0wCiAgICBDb250cm9sQW1wOiBjaHM9MywgZGlyPUluLCBpZHg9MCwgb2ZzPTAKICBB
bXAtSW4gY2Fwczogb2ZzPTB4MDAsIG5zdGVwcz0weDAzLCBzdGVwc2l6ZT0weDI3LCBtdXRl
PTAKICBBbXAtSW4gdmFsczogIFsweDAwIDB4MDBdCiAgQW1wLU91dCBjYXBzOiBvZnM9MHgw
MCwgbnN0ZXBzPTB4MDAsIHN0ZXBzaXplPTB4MDAsIG11dGU9MQogIEFtcC1PdXQgdmFsczog
IFsweDgwIDB4ODBdCiAgUGluY2FwIDB4MDAwMDM3MzY6IElOIE9VVCBEZXRlY3QgVHJpZ2dl
cgogICAgVnJlZiBjYXBzOiBISVogNTAgR1JEIDgwIDEwMAogIFBpbiBEZWZhdWx0IDB4MDE4
MTEwNGY6IFtKYWNrXSBMaW5lIEluIGF0IEV4dCBSZWFyCiAgICBDb25uID0gMS84LCBDb2xv
ciA9IEJsYWNrCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4NCwgU2VxdWVuY2UgPSAweGYKICBQ
aW4tY3RsczogMHgyMDogSU4gVlJFRl9ISVoKICBVbnNvbGljaXRlZDogdGFnPTA0LCBlbmFi
bGVkPTEKICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRp
bmc9RDAsIGFjdHVhbD1EMAogIENvbm5lY3Rpb246IDUKICAgICAweDBjKiAweDBkIDB4MGUg
MHgwZiAweDI2Ck5vZGUgMHgxYiBbUGluIENvbXBsZXhdIHdjYXBzIDB4NDAwNThmOiBTdGVy
ZW8gQW1wLUluIEFtcC1PdXQKICBDb250cm9sOiBuYW1lPSJIZWFkcGhvbmUgUGxheWJhY2sg
U3dpdGNoIiwgaW5kZXg9MCwgZGV2aWNlPTAKICAgIENvbnRyb2xBbXA6IGNocz0zLCBkaXI9
T3V0LCBpZHg9MCwgb2ZzPTAKICBBbXAtSW4gY2Fwczogb2ZzPTB4MDAsIG5zdGVwcz0weDAz
LCBzdGVwc2l6ZT0weDI3LCBtdXRlPTAKICBBbXAtSW4gdmFsczogIFsweDAwIDB4MDBdCiAg
QW1wLU91dCBjYXBzOiBvZnM9MHgwMCwgbnN0ZXBzPTB4MDAsIHN0ZXBzaXplPTB4MDAsIG11
dGU9MQogIEFtcC1PdXQgdmFsczogIFsweDAwIDB4MDBdCiAgUGluY2FwIDB4MDAwMTM3M2U6
IElOIE9VVCBIUCBFQVBEIERldGVjdCBUcmlnZ2VyCiAgICBWcmVmIGNhcHM6IEhJWiA1MCBH
UkQgODAgMTAwCiAgRUFQRCAweDI6IEVBUEQKICBQaW4gRGVmYXVsdCAweDAyMjE0MDIwOiBb
SmFja10gSFAgT3V0IGF0IEV4dCBGcm9udAogICAgQ29ubiA9IDEvOCwgQ29sb3IgPSBHcmVl
bgogICAgRGVmQXNzb2NpYXRpb24gPSAweDIsIFNlcXVlbmNlID0gMHgwCiAgUGluLWN0bHM6
IDB4YzA6IE9VVCBIUCBWUkVGX0hJWgogIFVuc29saWNpdGVkOiB0YWc9MDEsIGVuYWJsZWQ9
MQogIFBvd2VyIHN0YXRlczogIEQwIEQxIEQyIEQzIEVQU1MKICBQb3dlcjogc2V0dGluZz1E
MCwgYWN0dWFsPUQwCiAgQ29ubmVjdGlvbjogNQogICAgIDB4MGMgMHgwZCAweDBlIDB4MGYq
IDB4MjYKTm9kZSAweDFjIFtWZW5kb3IgRGVmaW5lZCBXaWRnZXRdIHdjYXBzIDB4ZjAwMDAw
OiBNb25vCk5vZGUgMHgxZCBbVmVuZG9yIERlZmluZWQgV2lkZ2V0XSB3Y2FwcyAweGYwMDAw
MDogTW9ubwpOb2RlIDB4MWUgW1BpbiBDb21wbGV4XSB3Y2FwcyAweDQwMDc4MTogU3RlcmVv
IERpZ2l0YWwKICBQaW5jYXAgMHgwMDAwMDAxNDogT1VUIERldGVjdAogIFBpbiBEZWZhdWx0
IDB4MDE0NTExMzA6IFtKYWNrXSBTUERJRiBPdXQgYXQgRXh0IFJlYXIKICAgIENvbm4gPSBP
cHRpY2FsLCBDb2xvciA9IEJsYWNrCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4MywgU2VxdWVu
Y2UgPSAweDAKICAgIE1pc2MgPSBOT19QUkVTRU5DRQogIFBpbi1jdGxzOiAweDQwOiBPVVQK
ICBVbnNvbGljaXRlZDogdGFnPTAwLCBlbmFibGVkPTAKICBQb3dlciBzdGF0ZXM6ICBEMCBE
MSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMAogIENvbm5lY3Rp
b246IDEKICAgICAweDA2Ck5vZGUgMHgxZiBbVmVuZG9yIERlZmluZWQgV2lkZ2V0XSB3Y2Fw
cyAweGYwMDAwMDogTW9ubwpOb2RlIDB4MjAgW1ZlbmRvciBEZWZpbmVkIFdpZGdldF0gd2Nh
cHMgMHhmMDAwNDA6IE1vbm8KICBQcm9jZXNzaW5nIGNhcHM6IGJlbmlnbj0wLCBuY29lZmY9
MzIKTm9kZSAweDIxIFtWZW5kb3IgRGVmaW5lZCBXaWRnZXRdIHdjYXBzIDB4ZjAwMDAwOiBN
b25vCk5vZGUgMHgyMiBbQXVkaW8gTWl4ZXJdIHdjYXBzIDB4MjAwMTBiOiBTdGVyZW8gQW1w
LUluCiAgQW1wLUluIGNhcHM6IG9mcz0weDAwLCBuc3RlcHM9MHgwMCwgc3RlcHNpemU9MHgw
MCwgbXV0ZT0xCiAgQW1wLUluIHZhbHM6ICBbMHgwMCAweDAwXSBbMHg4MCAweDgwXSBbMHg4
MCAweDgwXSBbMHg4MCAweDgwXSBbMHg4MCAweDgwXSBbMHg4MCAweDgwXSBbMHg4MCAweDgw
XSBbMHg4MCAweDgwXSBbMHg4MCAweDgwXQogIENvbm5lY3Rpb246IDkKICAgICAweDE4IDB4
MTkgMHgxYSAweDFiIDB4MTQgMHgxNSAweDE2IDB4MTcgMHgwYgpOb2RlIDB4MjMgW0F1ZGlv
IE1peGVyXSB3Y2FwcyAweDIwMDEwYjogU3RlcmVvIEFtcC1JbgogIEFtcC1JbiBjYXBzOiBv
ZnM9MHgwMCwgbnN0ZXBzPTB4MDAsIHN0ZXBzaXplPTB4MDAsIG11dGU9MQogIEFtcC1JbiB2
YWxzOiAgWzB4ODAgMHg4MF0gWzB4MDAgMHgwMF0gWzB4ODAgMHg4MF0gWzB4ODAgMHg4MF0g
WzB4ODAgMHg4MF0gWzB4ODAgMHg4MF0gWzB4ODAgMHg4MF0gWzB4ODAgMHg4MF0gWzB4ODAg
MHg4MF0KICBDb25uZWN0aW9uOiA5CiAgICAgMHgxOCAweDE5IDB4MWEgMHgxYiAweDE0IDB4
MTUgMHgxNiAweDE3IDB4MGIKTm9kZSAweDI0IFtWZW5kb3IgRGVmaW5lZCBXaWRnZXRdIHdj
YXBzIDB4ZjAwMDAwOiBNb25vCk5vZGUgMHgyNSBbQXVkaW8gT3V0cHV0XSB3Y2FwcyAweDQx
ZDogU3RlcmVvIEFtcC1PdXQKICBBbXAtT3V0IGNhcHM6IG9mcz0weDU3LCBuc3RlcHM9MHg1
Nywgc3RlcHNpemU9MHgwMiwgbXV0ZT0wCiAgQW1wLU91dCB2YWxzOiAgWzB4NTcgMHg1N10K
ICBDb252ZXJ0ZXI6IHN0cmVhbT0wLCBjaGFubmVsPTAKICBQQ006CiAgICByYXRlcyBbMHg1
NjBdOiA0NDEwMCA0ODAwMCA5NjAwMCAxOTIwMDAKICAgIGJpdHMgWzB4ZV06IDE2IDIwIDI0
CiAgICBmb3JtYXRzIFsweDFdOiBQQ00KICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBF
UFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMApOb2RlIDB4MjYgW0F1ZGlvIE1p
eGVyXSB3Y2FwcyAweDIwMDEwYjogU3RlcmVvIEFtcC1JbgogIEFtcC1JbiBjYXBzOiBvZnM9
MHgwMCwgbnN0ZXBzPTB4MDAsIHN0ZXBzaXplPTB4MDAsIG11dGU9MQogIEFtcC1JbiB2YWxz
OiAgWzB4MDAgMHgwMF0gWzB4ODAgMHg4MF0KICBDb25uZWN0aW9uOiAyCiAgICAgMHgyNSAw
eDBiCkNvZGVjOiBBVEkgUjZ4eCBIRE1JCkFkZHJlc3M6IDAKQUZHIEZ1bmN0aW9uIElkOiAw
eDEgKHVuc29sIDApClZlbmRvciBJZDogMHgxMDAyYWEwMQpTdWJzeXN0ZW0gSWQ6IDB4MDBh
YTAxMDAKUmV2aXNpb24gSWQ6IDB4MTAwODAwCk5vIE1vZGVtIEZ1bmN0aW9uIEdyb3VwIGZv
dW5kCkRlZmF1bHQgUENNOgogICAgcmF0ZXMgWzB4NzBdOiAzMjAwMCA0NDEwMCA0ODAwMAog
ICAgYml0cyBbMHgyXTogMTYKICAgIGZvcm1hdHMgWzB4MV06IFBDTQpEZWZhdWx0IEFtcC1J
biBjYXBzOiBOL0EKRGVmYXVsdCBBbXAtT3V0IGNhcHM6IE4vQQpTdGF0ZSBvZiBBRkcgbm9k
ZSAweDAxOgogIFBvd2VyIHN0YXRlczogIEQwIEQzIENMS1NUT1AgRVBTUwogIFBvd2VyOiBz
ZXR0aW5nPUQwLCBhY3R1YWw9RDAsIENsb2NrLXN0b3AtT0sKR1BJTzogaW89MCwgbz0wLCBp
PTAsIHVuc29saWNpdGVkPTAsIHdha2U9MApOb2RlIDB4MDIgW0F1ZGlvIE91dHB1dF0gd2Nh
cHMgMHgyMjE6IFN0ZXJlbyBEaWdpdGFsIFN0cmlwZQogIENvbnZlcnRlcjogc3RyZWFtPTAs
IGNoYW5uZWw9MAogIERpZ2l0YWw6IEVuYWJsZWQKICBEaWdpdGFsIGNhdGVnb3J5OiAweDAK
ICBJRUMgQ29kaW5nIFR5cGU6IDB4MApOb2RlIDB4MDMgW1BpbiBDb21wbGV4XSB3Y2FwcyAw
eDQwMDM4MTogU3RlcmVvIERpZ2l0YWwKICBQaW5jYXAgMHgwMDAwMDA5NDogT1VUIERldGVj
dCBIRE1JCiAgUGluIERlZmF1bHQgMHgxODU2MDBmMDogW0phY2tdIERpZ2l0YWwgT3V0IGF0
IEludCBIRE1JCiAgICBDb25uID0gRGlnaXRhbCwgQ29sb3IgPSBVbmtub3duCiAgICBEZWZB
c3NvY2lhdGlvbiA9IDB4ZiwgU2VxdWVuY2UgPSAweDAKICBQaW4tY3RsczogMHg0MDogT1VU
CiAgVW5zb2xpY2l0ZWQ6IHRhZz0wMCwgZW5hYmxlZD0wCiAgQ29ubmVjdGlvbjogMQogICAg
IDB4MDIKTm9kZSAweDA0IFtBdWRpbyBPdXRwdXRdIHdjYXBzIDB4MjIxOiBTdGVyZW8gRGln
aXRhbCBTdHJpcGUKICBDb252ZXJ0ZXI6IHN0cmVhbT0wLCBjaGFubmVsPTAKICBEaWdpdGFs
OiBFbmFibGVkCiAgRGlnaXRhbCBjYXRlZ29yeTogMHgwCiAgSUVDIENvZGluZyBUeXBlOiAw
eDAKTm9kZSAweDA1IFtQaW4gQ29tcGxleF0gd2NhcHMgMHg0MDAzODE6IFN0ZXJlbyBEaWdp
dGFsCiAgUGluY2FwIDB4MDAwMDAwOTQ6IE9VVCBEZXRlY3QgSERNSQogIFBpbiBEZWZhdWx0
IDB4MTg1NjAwZjA6IFtKYWNrXSBEaWdpdGFsIE91dCBhdCBJbnQgSERNSQogICAgQ29ubiA9
IERpZ2l0YWwsIENvbG9yID0gVW5rbm93bgogICAgRGVmQXNzb2NpYXRpb24gPSAweGYsIFNl
cXVlbmNlID0gMHgwCiAgUGluLWN0bHM6IDB4NDA6IE9VVAogIFVuc29saWNpdGVkOiB0YWc9
MDAsIGVuYWJsZWQ9MAogIENvbm5lY3Rpb246IDEKICAgICAweDA0Ck5vZGUgMHgwNiBbQXVk
aW8gT3V0cHV0XSB3Y2FwcyAweDIyMTogU3RlcmVvIERpZ2l0YWwgU3RyaXBlCiAgQ29udmVy
dGVyOiBzdHJlYW09MCwgY2hhbm5lbD0wCiAgRGlnaXRhbDogRW5hYmxlZAogIERpZ2l0YWwg
Y2F0ZWdvcnk6IDB4MAogIElFQyBDb2RpbmcgVHlwZTogMHgwCk5vZGUgMHgwNyBbUGluIENv
bXBsZXhdIHdjYXBzIDB4NDAwMzgxOiBTdGVyZW8gRGlnaXRhbAogIFBpbmNhcCAweDAwMDAw
MDk0OiBPVVQgRGV0ZWN0IEhETUkKICBQaW4gRGVmYXVsdCAweDE4NTYwMGYwOiBbSmFja10g
RGlnaXRhbCBPdXQgYXQgSW50IEhETUkKICAgIENvbm4gPSBEaWdpdGFsLCBDb2xvciA9IFVu
a25vd24KICAgIERlZkFzc29jaWF0aW9uID0gMHhmLCBTZXF1ZW5jZSA9IDB4MAogIFBpbi1j
dGxzOiAweDQwOiBPVVQKICBVbnNvbGljaXRlZDogdGFnPTAwLCBlbmFibGVkPTAKICBDb25u
ZWN0aW9uOiAxCiAgICAgMHgwNgpOb2RlIDB4MDggW0F1ZGlvIE91dHB1dF0gd2NhcHMgMHgy
MjE6IFN0ZXJlbyBEaWdpdGFsIFN0cmlwZQogIENvbnZlcnRlcjogc3RyZWFtPTAsIGNoYW5u
ZWw9MAogIERpZ2l0YWw6IEVuYWJsZWQKICBEaWdpdGFsIGNhdGVnb3J5OiAweDAKICBJRUMg
Q29kaW5nIFR5cGU6IDB4MApOb2RlIDB4MDkgW1BpbiBDb21wbGV4XSB3Y2FwcyAweDQwMDM4
MTogU3RlcmVvIERpZ2l0YWwKICBQaW5jYXAgMHgwMDAwMDA5NDogT1VUIERldGVjdCBIRE1J
CiAgUGluIERlZmF1bHQgMHgxODU2MDBmMDogW0phY2tdIERpZ2l0YWwgT3V0IGF0IEludCBI
RE1JCiAgICBDb25uID0gRGlnaXRhbCwgQ29sb3IgPSBVbmtub3duCiAgICBEZWZBc3NvY2lh
dGlvbiA9IDB4ZiwgU2VxdWVuY2UgPSAweDAKICBQaW4tY3RsczogMHg0MDogT1VUCiAgVW5z
b2xpY2l0ZWQ6IHRhZz0wMCwgZW5hYmxlZD0wCiAgQ29ubmVjdGlvbjogMQogICAgIDB4MDgK
Tm9kZSAweDBhIFtBdWRpbyBPdXRwdXRdIHdjYXBzIDB4MjIxOiBTdGVyZW8gRGlnaXRhbCBT
dHJpcGUKICBDb252ZXJ0ZXI6IHN0cmVhbT0wLCBjaGFubmVsPTAKICBEaWdpdGFsOgogIERp
Z2l0YWwgY2F0ZWdvcnk6IDB4MAogIElFQyBDb2RpbmcgVHlwZTogMHgwCk5vZGUgMHgwYiBb
UGluIENvbXBsZXhdIHdjYXBzIDB4NDAwMzgxOiBTdGVyZW8gRGlnaXRhbAogIFBpbmNhcCAw
eDAwMDAwMDk0OiBPVVQgRGV0ZWN0IEhETUkKICBQaW4gRGVmYXVsdCAweDU4NTYwMGYwOiBb
Ti9BXSBEaWdpdGFsIE91dCBhdCBJbnQgSERNSQogICAgQ29ubiA9IERpZ2l0YWwsIENvbG9y
ID0gVW5rbm93bgogICAgRGVmQXNzb2NpYXRpb24gPSAweGYsIFNlcXVlbmNlID0gMHgwCiAg
UGluLWN0bHM6IDB4NDA6IE9VVAogIFVuc29saWNpdGVkOiB0YWc9MDAsIGVuYWJsZWQ9MAog
IENvbm5lY3Rpb246IDEKICAgICAweDBhCi0tZW5kY29sbGFwc2UtLQoKCiEhVVNCIERlc2Ny
aXB0b3JzCiEhLS0tLS0tLS0tLS0tLS0tCi0tc3RhcnRjb2xsYXBzZS0tCgpCdXMgMDAxIERl
dmljZSAwMDI6IElEIGI1OGM6OWU4NCBCbHVlIE1pY3JvcGhvbmVzIFlldGkgU3RlcmVvIE1p
Y3JvcGhvbmUKTmVnb3RpYXRlZCBzcGVlZDogRnVsbCBTcGVlZCAoMTJNYnBzKQpEZXZpY2Ug
RGVzY3JpcHRvcjoKICBiTGVuZ3RoICAgICAgICAgICAgICAgIDE4CiAgYkRlc2NyaXB0b3JU
eXBlICAgICAgICAgMQogIGJjZFVTQiAgICAgICAgICAgICAgIDEuMTAKICBiRGV2aWNlQ2xh
c3MgICAgICAgICAgICAwIFt1bmtub3duXQogIGJEZXZpY2VTdWJDbGFzcyAgICAgICAgIDAg
W3Vua25vd25dCiAgYkRldmljZVByb3RvY29sICAgICAgICAgMCAKICBiTWF4UGFja2V0U2l6
ZTAgICAgICAgIDE2CiAgaWRWZW5kb3IgICAgICAgICAgIDB4YjU4YyBCbHVlIE1pY3JvcGhv
bmVzCiAgaWRQcm9kdWN0ICAgICAgICAgIDB4OWU4NCBZZXRpIFN0ZXJlbyBNaWNyb3Bob25l
CiAgYmNkRGV2aWNlICAgICAgICAgICAgMS4wMAogIGlNYW51ZmFjdHVyZXIgICAgICAgICAg
IDEgQmx1ZSBNaWNyb3Bob25lcwogIGlQcm9kdWN0ICAgICAgICAgICAgICAgIDIgWWV0aSBT
dGVyZW8gTWljcm9waG9uZQogIGlTZXJpYWwgICAgICAgICAgICAgICAgIDMgUkVWOAogIGJO
dW1Db25maWd1cmF0aW9ucyAgICAgIDEKICBDb25maWd1cmF0aW9uIERlc2NyaXB0b3I6CiAg
ICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAgICBiRGVzY3JpcHRvclR5cGUgICAgICAg
ICAyCiAgICB3VG90YWxMZW5ndGggICAgICAgMHgwMTAzCiAgICBiTnVtSW50ZXJmYWNlcyAg
ICAgICAgICA0CiAgICBiQ29uZmlndXJhdGlvblZhbHVlICAgICAxCiAgICBpQ29uZmlndXJh
dGlvbiAgICAgICAgICAwIAogICAgYm1BdHRyaWJ1dGVzICAgICAgICAgMHg4MAogICAgICAo
QnVzIFBvd2VyZWQpCiAgICBNYXhQb3dlciAgICAgICAgICAgICAgMTAwbUEKICAgIEludGVy
ZmFjZSBEZXNjcmlwdG9yOgogICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAgICAg
IGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDQKICAgICAgYkludGVyZmFjZU51bWJlciAgICAg
ICAgMAogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAgICAgICAwCiAgICAgIGJOdW1FbmRwb2lu
dHMgICAgICAgICAgIDAKICAgICAgYkludGVyZmFjZUNsYXNzICAgICAgICAgMSBBdWRpbwog
ICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAxIENvbnRyb2wgRGV2aWNlCiAgICAgIGJJ
bnRlcmZhY2VQcm90b2NvbCAgICAgIDAgCiAgICAgIGlJbnRlcmZhY2UgICAgICAgICAgICAg
IDAgCiAgICAgIEF1ZGlvQ29udHJvbCBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgICBi
TGVuZ3RoICAgICAgICAgICAgICAgIDEwCiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAg
ICAzNgogICAgICAgIGJEZXNjcmlwdG9yU3VidHlwZSAgICAgIDEgKEhFQURFUikKICAgICAg
ICBiY2RBREMgICAgICAgICAgICAgICAxLjAwCiAgICAgICAgd1RvdGFsTGVuZ3RoICAgICAg
IDB4MDA2YQogICAgICAgIGJJbkNvbGxlY3Rpb24gICAgICAgICAgIDIKICAgICAgICBiYUlu
dGVyZmFjZU5yKDApICAgICAgICAxCiAgICAgICAgYmFJbnRlcmZhY2VOcigxKSAgICAgICAg
MgogICAgICBBdWRpb0NvbnRyb2wgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgICAgYkxl
bmd0aCAgICAgICAgICAgICAgICAxMgogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAg
MzYKICAgICAgICBiRGVzY3JpcHRvclN1YnR5cGUgICAgICAyIChJTlBVVF9URVJNSU5BTCkK
ICAgICAgICBiVGVybWluYWxJRCAgICAgICAgICAgICAxCiAgICAgICAgd1Rlcm1pbmFsVHlw
ZSAgICAgIDB4MDEwMSBVU0IgU3RyZWFtaW5nCiAgICAgICAgYkFzc29jVGVybWluYWwgICAg
ICAgICAgMAogICAgICAgIGJOckNoYW5uZWxzICAgICAgICAgICAgIDIKICAgICAgICB3Q2hh
bm5lbENvbmZpZyAgICAgMHgwMDAzCiAgICAgICAgICBMZWZ0IEZyb250IChMKQogICAgICAg
ICAgUmlnaHQgRnJvbnQgKFIpCiAgICAgICAgaUNoYW5uZWxOYW1lcyAgICAgICAgICAgMCAK
ICAgICAgICBpVGVybWluYWwgICAgICAgICAgICAgICAwIAogICAgICBBdWRpb0NvbnRyb2wg
SW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAx
MgogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgMzYKICAgICAgICBiRGVzY3JpcHRv
clN1YnR5cGUgICAgICAyIChJTlBVVF9URVJNSU5BTCkKICAgICAgICBiVGVybWluYWxJRCAg
ICAgICAgICAgICAyCiAgICAgICAgd1Rlcm1pbmFsVHlwZSAgICAgIDB4MDIwMSBNaWNyb3Bo
b25lCiAgICAgICAgYkFzc29jVGVybWluYWwgICAgICAgICAgMAogICAgICAgIGJOckNoYW5u
ZWxzICAgICAgICAgICAgIDIKICAgICAgICB3Q2hhbm5lbENvbmZpZyAgICAgMHgwMDAzCiAg
ICAgICAgICBMZWZ0IEZyb250IChMKQogICAgICAgICAgUmlnaHQgRnJvbnQgKFIpCiAgICAg
ICAgaUNoYW5uZWxOYW1lcyAgICAgICAgICAgMCAKICAgICAgICBpVGVybWluYWwgICAgICAg
ICAgICAgICAwIAogICAgICBBdWRpb0NvbnRyb2wgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAg
ICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQogICAgICAgIGJEZXNjcmlwdG9yVHlw
ZSAgICAgICAgMzYKICAgICAgICBiRGVzY3JpcHRvclN1YnR5cGUgICAgICAzIChPVVRQVVRf
VEVSTUlOQUwpCiAgICAgICAgYlRlcm1pbmFsSUQgICAgICAgICAgICAgNgogICAgICAgIHdU
ZXJtaW5hbFR5cGUgICAgICAweDAzMDEgU3BlYWtlcgogICAgICAgIGJBc3NvY1Rlcm1pbmFs
ICAgICAgICAgIDAKICAgICAgICBiU291cmNlSUQgICAgICAgICAgICAgICA5CiAgICAgICAg
aVRlcm1pbmFsICAgICAgICAgICAgICAgMCAKICAgICAgQXVkaW9Db250cm9sIEludGVyZmFj
ZSBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAgICAg
ICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDM2CiAgICAgICAgYkRlc2NyaXB0b3JTdWJ0eXBl
ICAgICAgMyAoT1VUUFVUX1RFUk1JTkFMKQogICAgICAgIGJUZXJtaW5hbElEICAgICAgICAg
ICAgIDcKICAgICAgICB3VGVybWluYWxUeXBlICAgICAgMHgwMTAxIFVTQiBTdHJlYW1pbmcK
ICAgICAgICBiQXNzb2NUZXJtaW5hbCAgICAgICAgICAwCiAgICAgICAgYlNvdXJjZUlEICAg
ICAgICAgICAgICAgOAogICAgICAgIGlUZXJtaW5hbCAgICAgICAgICAgICAgIDAgCiAgICAg
IEF1ZGlvQ29udHJvbCBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAg
ICAgICAgICAgICAgICA3CiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAzNgogICAg
ICAgIGJEZXNjcmlwdG9yU3VidHlwZSAgICAgIDUgKFNFTEVDVE9SX1VOSVQpCiAgICAgICAg
YlVuaXRJRCAgICAgICAgICAgICAgICAgOAogICAgICAgIGJOckluUGlucyAgICAgICAgICAg
ICAgIDEKICAgICAgICBiYVNvdXJjZUlEKDApICAgICAgICAgIDEwCiAgICAgICAgaVNlbGVj
dG9yICAgICAgICAgICAgICAgMCAKICAgICAgQXVkaW9Db250cm9sIEludGVyZmFjZSBEZXNj
cmlwdG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgMTMKICAgICAgICBiRGVz
Y3JpcHRvclR5cGUgICAgICAgIDM2CiAgICAgICAgYkRlc2NyaXB0b3JTdWJ0eXBlICAgICAg
NiAoRkVBVFVSRV9VTklUKQogICAgICAgIGJVbml0SUQgICAgICAgICAgICAgICAgIDkKICAg
ICAgICBiU291cmNlSUQgICAgICAgICAgICAgIDE1CiAgICAgICAgYkNvbnRyb2xTaXplICAg
ICAgICAgICAgMgogICAgICAgIGJtYUNvbnRyb2xzKDApICAgICAweDAwMDEKICAgICAgICAg
IE11dGUgQ29udHJvbAogICAgICAgIGJtYUNvbnRyb2xzKDEpICAgICAweDAwMDIKICAgICAg
ICAgIFZvbHVtZSBDb250cm9sCiAgICAgICAgYm1hQ29udHJvbHMoMikgICAgIDB4MDAwMgog
ICAgICAgICAgVm9sdW1lIENvbnRyb2wKICAgICAgICBpRmVhdHVyZSAgICAgICAgICAgICAg
ICAwIAogICAgICBBdWRpb0NvbnRyb2wgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgICAg
Ykxlbmd0aCAgICAgICAgICAgICAgICAxMAogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAg
ICAgMzYKICAgICAgICBiRGVzY3JpcHRvclN1YnR5cGUgICAgICA2IChGRUFUVVJFX1VOSVQp
CiAgICAgICAgYlVuaXRJRCAgICAgICAgICAgICAgICAxMAogICAgICAgIGJTb3VyY2VJRCAg
ICAgICAgICAgICAgIDIKICAgICAgICBiQ29udHJvbFNpemUgICAgICAgICAgICAxCiAgICAg
ICAgYm1hQ29udHJvbHMoMCkgICAgICAgMHgwMQogICAgICAgICAgTXV0ZSBDb250cm9sCiAg
ICAgICAgYm1hQ29udHJvbHMoMSkgICAgICAgMHgwMgogICAgICAgICAgVm9sdW1lIENvbnRy
b2wKICAgICAgICBibWFDb250cm9scygyKSAgICAgICAweDAyCiAgICAgICAgICBWb2x1bWUg
Q29udHJvbAogICAgICAgIGlGZWF0dXJlICAgICAgICAgICAgICAgIDAgCiAgICAgIEF1ZGlv
Q29udHJvbCBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAg
ICAgICAgIDEwCiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAzNgogICAgICAgIGJE
ZXNjcmlwdG9yU3VidHlwZSAgICAgIDYgKEZFQVRVUkVfVU5JVCkKICAgICAgICBiVW5pdElE
ICAgICAgICAgICAgICAgIDEzCiAgICAgICAgYlNvdXJjZUlEICAgICAgICAgICAgICAgMgog
ICAgICAgIGJDb250cm9sU2l6ZSAgICAgICAgICAgIDEKICAgICAgICBibWFDb250cm9scygw
KSAgICAgICAweDAxCiAgICAgICAgICBNdXRlIENvbnRyb2wKICAgICAgICBibWFDb250cm9s
cygxKSAgICAgICAweDAyCiAgICAgICAgICBWb2x1bWUgQ29udHJvbAogICAgICAgIGJtYUNv
bnRyb2xzKDIpICAgICAgIDB4MDIKICAgICAgICAgIFZvbHVtZSBDb250cm9sCiAgICAgICAg
aUZlYXR1cmUgICAgICAgICAgICAgICAgMCAKICAgICAgQXVkaW9Db250cm9sIEludGVyZmFj
ZSBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgMTQKICAgICAg
ICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDM2CiAgICAgICAgYkRlc2NyaXB0b3JTdWJ0eXBl
ICAgICAgNCAoTUlYRVJfVU5JVCkKICAgICAgICBiVW5pdElEICAgICAgICAgICAgICAgIDE1
CiAgICAgICAgYk5ySW5QaW5zICAgICAgICAgICAgICAgMgogICAgICAgIGJhU291cmNlSUQo
MCkgICAgICAgICAgIDEKICAgICAgICBiYVNvdXJjZUlEKDEpICAgICAgICAgIDEzCiAgICAg
ICAgYk5yQ2hhbm5lbHMgICAgICAgICAgICAgMgogICAgICAgIHdDaGFubmVsQ29uZmlnICAg
ICAweDAwMDMKICAgICAgICAgIExlZnQgRnJvbnQgKEwpCiAgICAgICAgICBSaWdodCBGcm9u
dCAoUikKICAgICAgICBpQ2hhbm5lbE5hbWVzICAgICAgICAgICAwIAogICAgICAgIGJtQ29u
dHJvbHMoMCkgICAgICAgIDB4MDAKICAgICAgICBpTWl4ZXIgICAgICAgICAgICAgICAgICAw
IAogICAgICBXYXJuaW5nOiBKdW5rIGF0IGVuZCBvZiBkZXNjcmlwdG9yICgxIGJ5dGVzKToK
ICAgICAgICAwMCAKICAgIEludGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICBiTGVuZ3RoICAg
ICAgICAgICAgICAgICA5CiAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDQKICAgICAg
YkludGVyZmFjZU51bWJlciAgICAgICAgMQogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAgICAg
ICAwCiAgICAgIGJOdW1FbmRwb2ludHMgICAgICAgICAgIDAKICAgICAgYkludGVyZmFjZUNs
YXNzICAgICAgICAgMSBBdWRpbwogICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAyIFN0
cmVhbWluZwogICAgICBiSW50ZXJmYWNlUHJvdG9jb2wgICAgICAwIAogICAgICBpSW50ZXJm
YWNlICAgICAgICAgICAgICAwIAogICAgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgIGJM
ZW5ndGggICAgICAgICAgICAgICAgIDkKICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAg
NAogICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAgICAxCiAgICAgIGJBbHRlcm5hdGVTZXR0
aW5nICAgICAgIDEKICAgICAgYk51bUVuZHBvaW50cyAgICAgICAgICAgMQogICAgICBiSW50
ZXJmYWNlQ2xhc3MgICAgICAgICAxIEF1ZGlvCiAgICAgIGJJbnRlcmZhY2VTdWJDbGFzcyAg
ICAgIDIgU3RyZWFtaW5nCiAgICAgIGJJbnRlcmZhY2VQcm90b2NvbCAgICAgIDAgCiAgICAg
IGlJbnRlcmZhY2UgICAgICAgICAgICAgIDAgCiAgICAgIEF1ZGlvU3RyZWFtaW5nIEludGVy
ZmFjZSBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDcKICAg
ICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDM2CiAgICAgICAgYkRlc2NyaXB0b3JTdWJ0
eXBlICAgICAgMSAoQVNfR0VORVJBTCkKICAgICAgICBiVGVybWluYWxMaW5rICAgICAgICAg
ICAxCiAgICAgICAgYkRlbGF5ICAgICAgICAgICAgICAgICAgMSBmcmFtZXMKICAgICAgICB3
Rm9ybWF0VGFnICAgICAgICAgMHgwMDAxIFBDTQogICAgICBBdWRpb1N0cmVhbWluZyBJbnRl
cmZhY2UgRGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgIDE0CiAg
ICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAzNgogICAgICAgIGJEZXNjcmlwdG9yU3Vi
dHlwZSAgICAgIDIgKEZPUk1BVF9UWVBFKQogICAgICAgIGJGb3JtYXRUeXBlICAgICAgICAg
ICAgIDEgKEZPUk1BVF9UWVBFX0kpCiAgICAgICAgYk5yQ2hhbm5lbHMgICAgICAgICAgICAg
MgogICAgICAgIGJTdWJmcmFtZVNpemUgICAgICAgICAgIDIKICAgICAgICBiQml0UmVzb2x1
dGlvbiAgICAgICAgIDE2CiAgICAgICAgYlNhbUZyZXFUeXBlICAgICAgICAgICAgMiBEaXNj
cmV0ZQogICAgICAgIHRTYW1GcmVxWyAwXSAgICAgICAgNDQxMDAKICAgICAgICB0U2FtRnJl
cVsgMV0gICAgICAgIDQ4MDAwCiAgICAgIEVuZHBvaW50IERlc2NyaXB0b3I6CiAgICAgICAg
Ykxlbmd0aCAgICAgICAgICAgICAgICAgOQogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAg
ICAgIDUKICAgICAgICBiRW5kcG9pbnRBZGRyZXNzICAgICAweDAxICBFUCAxIE9VVAogICAg
ICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgMTMKICAgICAgICAgIFRyYW5zZmVyIFR5cGUg
ICAgICAgICAgICBJc29jaHJvbm91cwogICAgICAgICAgU3luY2ggVHlwZSAgICAgICAgICAg
ICAgIFN5bmNocm9ub3VzCiAgICAgICAgICBVc2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0
YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAweDAwYzggIDF4IDIwMCBieXRlcwogICAg
ICAgIGJJbnRlcnZhbCAgICAgICAgICAgICAgIDEKICAgICAgICBiUmVmcmVzaCAgICAgICAg
ICAgICAgICAwCiAgICAgICAgYlN5bmNoQWRkcmVzcyAgICAgICAgICAgMAogICAgICAgIEF1
ZGlvU3RyZWFtaW5nIEVuZHBvaW50IERlc2NyaXB0b3I6CiAgICAgICAgICBiTGVuZ3RoICAg
ICAgICAgICAgICAgICA3CiAgICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDM3CiAg
ICAgICAgICBiRGVzY3JpcHRvclN1YnR5cGUgICAgICAxIChFUF9HRU5FUkFMKQogICAgICAg
ICAgYm1BdHRyaWJ1dGVzICAgICAgICAgMHgwMQogICAgICAgICAgICBTYW1wbGluZyBGcmVx
dWVuY3kKICAgICAgICAgIGJMb2NrRGVsYXlVbml0cyAgICAgICAgIDAgVW5kZWZpbmVkCiAg
ICAgICAgICB3TG9ja0RlbGF5ICAgICAgICAgMHgwMDAwCiAgICBJbnRlcmZhY2UgRGVzY3Jp
cHRvcjoKICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQogICAgICBiRGVzY3JpcHRv
clR5cGUgICAgICAgICA0CiAgICAgIGJJbnRlcmZhY2VOdW1iZXIgICAgICAgIDIKICAgICAg
YkFsdGVybmF0ZVNldHRpbmcgICAgICAgMAogICAgICBiTnVtRW5kcG9pbnRzICAgICAgICAg
ICAwCiAgICAgIGJJbnRlcmZhY2VDbGFzcyAgICAgICAgIDEgQXVkaW8KICAgICAgYkludGVy
ZmFjZVN1YkNsYXNzICAgICAgMiBTdHJlYW1pbmcKICAgICAgYkludGVyZmFjZVByb3RvY29s
ICAgICAgMCAKICAgICAgaUludGVyZmFjZSAgICAgICAgICAgICAgMCAKICAgIEludGVyZmFj
ZSBEZXNjcmlwdG9yOgogICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAgICAgIGJE
ZXNjcmlwdG9yVHlwZSAgICAgICAgIDQKICAgICAgYkludGVyZmFjZU51bWJlciAgICAgICAg
MgogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAgICAgICAxCiAgICAgIGJOdW1FbmRwb2ludHMg
ICAgICAgICAgIDEKICAgICAgYkludGVyZmFjZUNsYXNzICAgICAgICAgMSBBdWRpbwogICAg
ICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAyIFN0cmVhbWluZwogICAgICBiSW50ZXJmYWNl
UHJvdG9jb2wgICAgICAwIAogICAgICBpSW50ZXJmYWNlICAgICAgICAgICAgICAwIAogICAg
ICBBdWRpb1N0cmVhbWluZyBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3Ro
ICAgICAgICAgICAgICAgICA3CiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAzNgog
ICAgICAgIGJEZXNjcmlwdG9yU3VidHlwZSAgICAgIDEgKEFTX0dFTkVSQUwpCiAgICAgICAg
YlRlcm1pbmFsTGluayAgICAgICAgICAgNwogICAgICAgIGJEZWxheSAgICAgICAgICAgICAg
ICAgIDEgZnJhbWVzCiAgICAgICAgd0Zvcm1hdFRhZyAgICAgICAgIDB4MDAwMSBQQ00KICAg
ICAgQXVkaW9TdHJlYW1pbmcgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgICAgYkxlbmd0
aCAgICAgICAgICAgICAgICAxNAogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgMzYK
ICAgICAgICBiRGVzY3JpcHRvclN1YnR5cGUgICAgICAyIChGT1JNQVRfVFlQRSkKICAgICAg
ICBiRm9ybWF0VHlwZSAgICAgICAgICAgICAxIChGT1JNQVRfVFlQRV9JKQogICAgICAgIGJO
ckNoYW5uZWxzICAgICAgICAgICAgIDIKICAgICAgICBiU3ViZnJhbWVTaXplICAgICAgICAg
ICAyCiAgICAgICAgYkJpdFJlc29sdXRpb24gICAgICAgICAxNgogICAgICAgIGJTYW1GcmVx
VHlwZSAgICAgICAgICAgIDIgRGlzY3JldGUKICAgICAgICB0U2FtRnJlcVsgMF0gICAgICAg
IDQ0MTAwCiAgICAgICAgdFNhbUZyZXFbIDFdICAgICAgICA0ODAwMAogICAgICBFbmRwb2lu
dCBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAgICAg
ICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1CiAgICAgICAgYkVuZHBvaW50QWRkcmVzcyAg
ICAgMHg4MiAgRVAgMiBJTgogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgIDUKICAg
ICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAgICAgICBJc29jaHJvbm91cwogICAgICAgICAg
U3luY2ggVHlwZSAgICAgICAgICAgICAgIEFzeW5jaHJvbm91cwogICAgICAgICAgVXNhZ2Ug
VHlwZSAgICAgICAgICAgICAgIERhdGEKICAgICAgICB3TWF4UGFja2V0U2l6ZSAgICAgMHgw
MGM4ICAxeCAyMDAgYnl0ZXMKICAgICAgICBiSW50ZXJ2YWwgICAgICAgICAgICAgICAxCiAg
ICAgICAgYlJlZnJlc2ggICAgICAgICAgICAgICAgMAogICAgICAgIGJTeW5jaEFkZHJlc3Mg
ICAgICAgICAgIDAKICAgICAgICBBdWRpb1N0cmVhbWluZyBFbmRwb2ludCBEZXNjcmlwdG9y
OgogICAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgNwogICAgICAgICAgYkRlc2Ny
aXB0b3JUeXBlICAgICAgICAzNwogICAgICAgICAgYkRlc2NyaXB0b3JTdWJ0eXBlICAgICAg
MSAoRVBfR0VORVJBTCkKICAgICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgIDB4MDEKICAg
ICAgICAgICAgU2FtcGxpbmcgRnJlcXVlbmN5CiAgICAgICAgICBiTG9ja0RlbGF5VW5pdHMg
ICAgICAgICAwIFVuZGVmaW5lZAogICAgICAgICAgd0xvY2tEZWxheSAgICAgICAgIDB4MDAw
MAogICAgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgIGJMZW5ndGggICAgICAgICAgICAg
ICAgIDkKICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNAogICAgICBiSW50ZXJmYWNl
TnVtYmVyICAgICAgICAzCiAgICAgIGJBbHRlcm5hdGVTZXR0aW5nICAgICAgIDAKICAgICAg
Yk51bUVuZHBvaW50cyAgICAgICAgICAgMQogICAgICBiSW50ZXJmYWNlQ2xhc3MgICAgICAg
ICAzIEh1bWFuIEludGVyZmFjZSBEZXZpY2UKICAgICAgYkludGVyZmFjZVN1YkNsYXNzICAg
ICAgMCBbdW5rbm93bl0KICAgICAgYkludGVyZmFjZVByb3RvY29sICAgICAgMCAKICAgICAg
aUludGVyZmFjZSAgICAgICAgICAgICAgMCAKICAgICAgICBISUQgRGV2aWNlIERlc2NyaXB0
b3I6CiAgICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAgICAgICAgICBiRGVz
Y3JpcHRvclR5cGUgICAgICAgIDMzCiAgICAgICAgICBiY2RISUQgICAgICAgICAgICAgICAx
LjAwCiAgICAgICAgICBiQ291bnRyeUNvZGUgICAgICAgICAgICAwIE5vdCBzdXBwb3J0ZWQK
ICAgICAgICAgIGJOdW1EZXNjcmlwdG9ycyAgICAgICAgIDEKICAgICAgICAgIGJEZXNjcmlw
dG9yVHlwZSAgICAgICAgMzQgUmVwb3J0CiAgICAgICAgICB3RGVzY3JpcHRvckxlbmd0aCAg
ICAgMTA0CiAgICAgICAgICBSZXBvcnQgRGVzY3JpcHRvcnM6IAogICAgICAgICAgICAqKiBV
TkFWQUlMQUJMRSAqKgogICAgICBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5n
dGggICAgICAgICAgICAgICAgIDcKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1
CiAgICAgICAgYkVuZHBvaW50QWRkcmVzcyAgICAgMHg4NyAgRVAgNyBJTgogICAgICAgIGJt
QXR0cmlidXRlcyAgICAgICAgICAgIDMKICAgICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAg
ICAgICBJbnRlcnJ1cHQKICAgICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAgICAgICBOb25l
CiAgICAgICAgICBVc2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQ
YWNrZXRTaXplICAgICAweDAwMTAgIDF4IDE2IGJ5dGVzCiAgICAgICAgYkludGVydmFsICAg
ICAgICAgICAgICAgMgotLWVuZGNvbGxhcHNlLS0KCgohIVVTQiBTdHJlYW0gaW5mb3JtYXRp
b24KISEtLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0tc3RhcnRjb2xsYXBzZS0tCgpCbHVlIE1p
Y3JvcGhvbmVzIFlldGkgU3RlcmVvIE1pY3JvcGhvbmUgYXQgdXNiLTAwMDA6MDA6MTQuMC03
LCBmdWxsIHNwZWVkIDogVVNCIEF1ZGlvCgpQbGF5YmFjazoKICBTdGF0dXM6IFN0b3AKICBJ
bnRlcmZhY2UgMQogICAgQWx0c2V0IDEKICAgIEZvcm1hdDogUzE2X0xFCiAgICBDaGFubmVs
czogMgogICAgRW5kcG9pbnQ6IDB4MDEgKDEgT1VUKSAoU1lOQykKICAgIFJhdGVzOiA0NDEw
MCwgNDgwMDAKICAgIEJpdHM6IDE2CiAgICBDaGFubmVsIG1hcDogRkwgRlIKCkNhcHR1cmU6
CiAgU3RhdHVzOiBTdG9wCiAgSW50ZXJmYWNlIDIKICAgIEFsdHNldCAxCiAgICBGb3JtYXQ6
IFMxNl9MRQogICAgQ2hhbm5lbHM6IDIKICAgIEVuZHBvaW50OiAweDgyICgyIElOKSAoQVNZ
TkMpCiAgICBSYXRlczogNDQxMDAsIDQ4MDAwCiAgICBCaXRzOiAxNgogICAgQ2hhbm5lbCBt
YXA6IEZMIEZSCi0tZW5kY29sbGFwc2UtLQoKCiEhVVNCIE1peGVyIGluZm9ybWF0aW9uCiEh
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0tc3RhcnRjb2xsYXBzZS0tCgpVU0IgTWl4ZXI6IHVz
Yl9pZD0weGI1OGM5ZTg0LCBjdHJsaWY9MCwgY3RsZXJyPTAKQ2FyZDogQmx1ZSBNaWNyb3Bo
b25lcyBZZXRpIFN0ZXJlbyBNaWNyb3Bob25lIGF0IHVzYi0wMDAwOjAwOjE0LjAtNywgZnVs
bCBzcGVlZAogIFVuaXQ6IDkKICAgIENvbnRyb2w6IG5hbWU9IlNwZWFrZXIgUGxheWJhY2sg
Vm9sdW1lIiwgaW5kZXg9MAogICAgSW5mbzogaWQ9OSwgY29udHJvbD0yLCBjbWFzaz0weDMs
IGNoYW5uZWxzPTIsIHR5cGU9IlMxNiIKICAgIFZvbHVtZTogbWluPS0xMDI0MCwgbWF4PTAs
IGRCbWluPS00MDAwLCBkQm1heD0wCiAgVW5pdDogOQogICAgQ29udHJvbDogbmFtZT0iU3Bl
YWtlciBQbGF5YmFjayBTd2l0Y2giLCBpbmRleD0wCiAgICBJbmZvOiBpZD05LCBjb250cm9s
PTEsIGNtYXNrPTB4MCwgY2hhbm5lbHM9MSwgdHlwZT0iSU5WX0JPT0xFQU4iCiAgICBWb2x1
bWU6IG1pbj0wLCBtYXg9MSwgZEJtaW49MCwgZEJtYXg9MAogIFVuaXQ6IDEwCiAgICBDb250
cm9sOiBuYW1lPSJNaWMgQ2FwdHVyZSBWb2x1bWUiLCBpbmRleD0wCiAgICBJbmZvOiBpZD0x
MCwgY29udHJvbD0yLCBjbWFzaz0weDMsIGNoYW5uZWxzPTIsIHR5cGU9IlMxNiIKICAgIFZv
bHVtZTogbWluPS0yMDQ4LCBtYXg9MzU4NCwgZEJtaW49LTgwMCwgZEJtYXg9MTQwMAogIFVu
aXQ6IDEwCiAgICBDb250cm9sOiBuYW1lPSJNaWMgQ2FwdHVyZSBTd2l0Y2giLCBpbmRleD0w
CiAgICBJbmZvOiBpZD0xMCwgY29udHJvbD0xLCBjbWFzaz0weDAsIGNoYW5uZWxzPTEsIHR5
cGU9IklOVl9CT09MRUFOIgogICAgVm9sdW1lOiBtaW49MCwgbWF4PTEsIGRCbWluPTAsIGRC
bWF4PTAKICBVbml0OiAxMwogICAgQ29udHJvbDogbmFtZT0iTWljIFBsYXliYWNrIFZvbHVt
ZSIsIGluZGV4PTAKICAgIEluZm86IGlkPTEzLCBjb250cm9sPTIsIGNtYXNrPTB4MywgY2hh
bm5lbHM9MiwgdHlwZT0iUzE2IgogICAgVm9sdW1lOiBtaW49LTc2ODAsIG1heD0xNzkyLCBk
Qm1pbj0tMzAwMCwgZEJtYXg9NzAwCiAgVW5pdDogMTMKICAgIENvbnRyb2w6IG5hbWU9Ik1p
YyBQbGF5YmFjayBTd2l0Y2giLCBpbmRleD0wCiAgICBJbmZvOiBpZD0xMywgY29udHJvbD0x
LCBjbWFzaz0weDAsIGNoYW5uZWxzPTEsIHR5cGU9IklOVl9CT09MRUFOIgogICAgVm9sdW1l
OiBtaW49MCwgbWF4PTEsIGRCbWluPTAsIGRCbWF4PTAKLS1lbmRjb2xsYXBzZS0tCgoKISFB
TFNBIERldmljZSBub2RlcwohIS0tLS0tLS0tLS0tLS0tLS0tCgpjcnctcnctLS0tKyAxIHJv
b3QgYXVkaW8gMTE2LCAgNCBNYXIgMTggMTY6NTkgL2Rldi9zbmQvY29udHJvbEMwCmNydy1y
dy0tLS0rIDEgcm9vdCBhdWRpbyAxMTYsIDE2IE1hciAxOCAxNjo1OSAvZGV2L3NuZC9jb250
cm9sQzEKY3J3LXJ3LS0tLSsgMSByb290IGF1ZGlvIDExNiwgMTAgTWFyIDE4IDE2OjU5IC9k
ZXYvc25kL2NvbnRyb2xDMgpjcnctcnctLS0tKyAxIHJvb3QgYXVkaW8gMTE2LCAxNSBNYXIg
MTggMTY6NTkgL2Rldi9zbmQvaHdDMUQwCmNydy1ydy0tLS0rIDEgcm9vdCBhdWRpbyAxMTYs
ICA5IE1hciAxOCAxNjo1OSAvZGV2L3NuZC9od0MyRDAKY3J3LXJ3LS0tLSsgMSByb290IGF1
ZGlvIDExNiwgIDMgTWFyIDE4IDE2OjU5IC9kZXYvc25kL3BjbUMwRDBjCmNydy1ydy0tLS0r
IDEgcm9vdCBhdWRpbyAxMTYsICAyIE1hciAxOCAxNjo1OSAvZGV2L3NuZC9wY21DMEQwcApj
cnctcnctLS0tKyAxIHJvb3QgYXVkaW8gMTE2LCAxMiBNYXIgMTggMTY6NTkgL2Rldi9zbmQv
cGNtQzFEMGMKY3J3LXJ3LS0tLSsgMSByb290IGF1ZGlvIDExNiwgMTEgTWFyIDE4IDE2OjU5
IC9kZXYvc25kL3BjbUMxRDBwCmNydy1ydy0tLS0rIDEgcm9vdCBhdWRpbyAxMTYsIDEzIE1h
ciAxOCAxNjo1OSAvZGV2L3NuZC9wY21DMUQxcApjcnctcnctLS0tKyAxIHJvb3QgYXVkaW8g
MTE2LCAxNCBNYXIgMTggMTY6NTkgL2Rldi9zbmQvcGNtQzFEMmMKY3J3LXJ3LS0tLSsgMSBy
b290IGF1ZGlvIDExNiwgIDUgTWFyIDE4IDE2OjU5IC9kZXYvc25kL3BjbUMyRDNwCmNydy1y
dy0tLS0rIDEgcm9vdCBhdWRpbyAxMTYsICA2IE1hciAxOCAxNjo1OSAvZGV2L3NuZC9wY21D
MkQ3cApjcnctcnctLS0tKyAxIHJvb3QgYXVkaW8gMTE2LCAgNyBNYXIgMTggMTY6NTkgL2Rl
di9zbmQvcGNtQzJEOHAKY3J3LXJ3LS0tLSsgMSByb290IGF1ZGlvIDExNiwgIDggTWFyIDE4
IDE2OjU5IC9kZXYvc25kL3BjbUMyRDlwCmNydy1ydy0tLS0rIDEgcm9vdCBhdWRpbyAxMTYs
ICAxIE1hciAxOCAxNjo1OSAvZGV2L3NuZC9zZXEKY3J3LXJ3LS0tLSsgMSByb290IGF1ZGlv
IDExNiwgMzMgTWFyIDE4IDE2OjU5IC9kZXYvc25kL3RpbWVyCgovZGV2L3NuZC9ieS1pZDoK
dG90YWwgMApkcnd4ci14ci14IDIgcm9vdCByb290ICA2MCBNYXIgMTggMTY6NTggLgpkcnd4
ci14ci14IDQgcm9vdCByb290IDQyMCBNYXIgMTggMTY6NTggLi4KbHJ3eHJ3eHJ3eCAxIHJv
b3Qgcm9vdCAgMTIgTWFyIDE4IDE2OjU4IHVzYi1CbHVlX01pY3JvcGhvbmVzX1lldGlfU3Rl
cmVvX01pY3JvcGhvbmVfUkVWOC0wMCAtPiAuLi9jb250cm9sQzAKCi9kZXYvc25kL2J5LXBh
dGg6CnRvdGFsIDAKZHJ3eHIteHIteCAyIHJvb3Qgcm9vdCAxMjAgTWFyIDE4IDE2OjU4IC4K
ZHJ3eHIteHIteCA0IHJvb3Qgcm9vdCA0MjAgTWFyIDE4IDE2OjU4IC4uCmxyd3hyd3hyd3gg
MSByb290IHJvb3QgIDEyIE1hciAxOCAxNjo1OCBwY2ktMDAwMDowMDoxNC4wLXVzYi0wOjc6
MS4wIC0+IC4uL2NvbnRyb2xDMApscnd4cnd4cnd4IDEgcm9vdCByb290ICAxMiBNYXIgMTgg
MTY6NTggcGNpLTAwMDA6MDA6MTQuMC11c2J2Mi0wOjc6MS4wIC0+IC4uL2NvbnRyb2xDMAps
cnd4cnd4cnd4IDEgcm9vdCByb290ICAxMiBNYXIgMTggMTY6NTggcGNpLTAwMDA6MDA6MWYu
MyAtPiAuLi9jb250cm9sQzEKbHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAgMTIgTWFyIDE4IDE2
OjU4IHBjaS0wMDAwOjAzOjAwLjEgLT4gLi4vY29udHJvbEMyCgoKISFBcGxheS9BcmVjb3Jk
IG91dHB1dAohIS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpBUExBWQoKKioqKiBMaXN0IG9mIFBM
QVlCQUNLIEhhcmR3YXJlIERldmljZXMgKioqKgpjYXJkIDA6IE1pY3JvcGhvbmUgW1lldGkg
U3RlcmVvIE1pY3JvcGhvbmVdLCBkZXZpY2UgMDogVVNCIEF1ZGlvIFtVU0IgQXVkaW9dCiAg
U3ViZGV2aWNlczogMS8xCiAgU3ViZGV2aWNlICMwOiBzdWJkZXZpY2UgIzAKY2FyZCAxOiBQ
Q0ggW0hEQSBJbnRlbCBQQ0hdLCBkZXZpY2UgMDogQUxDUzEyMDBBIEFuYWxvZyBbQUxDUzEy
MDBBIEFuYWxvZ10KICBTdWJkZXZpY2VzOiAxLzEKICBTdWJkZXZpY2UgIzA6IHN1YmRldmlj
ZSAjMApjYXJkIDE6IFBDSCBbSERBIEludGVsIFBDSF0sIGRldmljZSAxOiBBTENTMTIwMEEg
RGlnaXRhbCBbQUxDUzEyMDBBIERpZ2l0YWxdCiAgU3ViZGV2aWNlczogMS8xCiAgU3ViZGV2
aWNlICMwOiBzdWJkZXZpY2UgIzAKY2FyZCAyOiBIRE1JIFtIREEgQVRJIEhETUldLCBkZXZp
Y2UgMzogSERNSSAwIFtNQUcgMjcxUVBYIEUyXQogIFN1YmRldmljZXM6IDEvMQogIFN1YmRl
dmljZSAjMDogc3ViZGV2aWNlICMwCmNhcmQgMjogSERNSSBbSERBIEFUSSBIRE1JXSwgZGV2
aWNlIDc6IEhETUkgMSBbREVMTCBTMjcyMkRHTV0KICBTdWJkZXZpY2VzOiAxLzEKICBTdWJk
ZXZpY2UgIzA6IHN1YmRldmljZSAjMApjYXJkIDI6IEhETUkgW0hEQSBBVEkgSERNSV0sIGRl
dmljZSA4OiBIRE1JIDIgW1ZHMjQ4XQogIFN1YmRldmljZXM6IDEvMQogIFN1YmRldmljZSAj
MDogc3ViZGV2aWNlICMwCmNhcmQgMjogSERNSSBbSERBIEFUSSBIRE1JXSwgZGV2aWNlIDk6
IEhETUkgMyBbSERNSSAzXQogIFN1YmRldmljZXM6IDEvMQogIFN1YmRldmljZSAjMDogc3Vi
ZGV2aWNlICMwCgpBUkVDT1JECgoqKioqIExpc3Qgb2YgQ0FQVFVSRSBIYXJkd2FyZSBEZXZp
Y2VzICoqKioKY2FyZCAwOiBNaWNyb3Bob25lIFtZZXRpIFN0ZXJlbyBNaWNyb3Bob25lXSwg
ZGV2aWNlIDA6IFVTQiBBdWRpbyBbVVNCIEF1ZGlvXQogIFN1YmRldmljZXM6IDEvMQogIFN1
YmRldmljZSAjMDogc3ViZGV2aWNlICMwCmNhcmQgMTogUENIIFtIREEgSW50ZWwgUENIXSwg
ZGV2aWNlIDA6IEFMQ1MxMjAwQSBBbmFsb2cgW0FMQ1MxMjAwQSBBbmFsb2ddCiAgU3ViZGV2
aWNlczogMS8xCiAgU3ViZGV2aWNlICMwOiBzdWJkZXZpY2UgIzAKY2FyZCAxOiBQQ0ggW0hE
QSBJbnRlbCBQQ0hdLCBkZXZpY2UgMjogQUxDUzEyMDBBIEFsdCBBbmFsb2cgW0FMQ1MxMjAw
QSBBbHQgQW5hbG9nXQogIFN1YmRldmljZXM6IDEvMQogIFN1YmRldmljZSAjMDogc3ViZGV2
aWNlICMwCgohIUFtaXhlciBvdXRwdXQKISEtLS0tLS0tLS0tLS0tCgohIS0tLS0tLS1NaXhl
ciBjb250cm9scyBmb3IgY2FyZCBNaWNyb3Bob25lCgpDYXJkIHN5c2RlZmF1bHQ6MCAnTWlj
cm9waG9uZScvJ0JsdWUgTWljcm9waG9uZXMgWWV0aSBTdGVyZW8gTWljcm9waG9uZSBhdCB1
c2ItMDAwMDowMDoxNC4wLTcsIGZ1bGwgc3BlZWQnCiAgTWl4ZXIgbmFtZQk6ICdVU0IgTWl4
ZXInCiAgQ29tcG9uZW50cwk6ICdVU0JiNThjOjllODQnCiAgQ29udHJvbHMgICAgICA6IDgK
ICBTaW1wbGUgY3RybHMgIDogMgpTaW1wbGUgbWl4ZXIgY29udHJvbCAnU3BlYWtlcicsMAog
IENhcGFiaWxpdGllczogcHZvbHVtZSBwc3dpdGNoIHBzd2l0Y2gtam9pbmVkCiAgUGxheWJh
Y2sgY2hhbm5lbHM6IEZyb250IExlZnQgLSBGcm9udCBSaWdodAogIExpbWl0czogUGxheWJh
Y2sgMCAtIDQwCiAgTW9ubzoKICBGcm9udCBMZWZ0OiBQbGF5YmFjayAxNyBbNDIlXSBbLTIz
LjAwZEJdIFtvbl0KICBGcm9udCBSaWdodDogUGxheWJhY2sgMTcgWzQyJV0gWy0yMy4wMGRC
XSBbb25dClNpbXBsZSBtaXhlciBjb250cm9sICdNaWMnLDAKICBDYXBhYmlsaXRpZXM6IHB2
b2x1bWUgY3ZvbHVtZSBwc3dpdGNoIHBzd2l0Y2gtam9pbmVkIGNzd2l0Y2ggY3N3aXRjaC1q
b2luZWQKICBQbGF5YmFjayBjaGFubmVsczogRnJvbnQgTGVmdCAtIEZyb250IFJpZ2h0CiAg
Q2FwdHVyZSBjaGFubmVsczogRnJvbnQgTGVmdCAtIEZyb250IFJpZ2h0CiAgTGltaXRzOiBQ
bGF5YmFjayAwIC0gMzcgQ2FwdHVyZSAwIC0gMjIKICBGcm9udCBMZWZ0OiBQbGF5YmFjayAz
NCBbOTIlXSBbNC4wMGRCXSBbb25dIENhcHR1cmUgOCBbMzYlXSBbMC4wMGRCXSBbb25dCiAg
RnJvbnQgUmlnaHQ6IFBsYXliYWNrIDM0IFs5MiVdIFs0LjAwZEJdIFtvbl0gQ2FwdHVyZSA4
IFszNiVdIFswLjAwZEJdIFtvbl0KCiEhLS0tLS0tLU1peGVyIGNvbnRyb2xzIGZvciBjYXJk
IFBDSAoKQ2FyZCBzeXNkZWZhdWx0OjEgJ1BDSCcvJ0hEQSBJbnRlbCBQQ0ggYXQgMHg0ODEw
MTEwMDAwIGlycSAxODgnCiAgTWl4ZXIgbmFtZQk6ICdSZWFsdGVrIEFMQ1MxMjAwQScKICBD
b21wb25lbnRzCTogJ0hEQToxMGVjMGIwMCwxNDYyZWM3OSwwMDEwMDAwMScKICBDb250cm9s
cyAgICAgIDogNDkKICBTaW1wbGUgY3RybHMgIDogMjIKU2ltcGxlIG1peGVyIGNvbnRyb2wg
J01hc3RlcicsMAogIENhcGFiaWxpdGllczogcHZvbHVtZSBwdm9sdW1lLWpvaW5lZCBwc3dp
dGNoIHBzd2l0Y2gtam9pbmVkCiAgUGxheWJhY2sgY2hhbm5lbHM6IE1vbm8KICBMaW1pdHM6
IFBsYXliYWNrIDAgLSA4NwogIE1vbm86IFBsYXliYWNrIDY0IFs3NCVdIFstMTcuMjVkQl0g
W29uXQpTaW1wbGUgbWl4ZXIgY29udHJvbCAnSGVhZHBob25lJywwCiAgQ2FwYWJpbGl0aWVz
OiBwdm9sdW1lIHBzd2l0Y2gKICBQbGF5YmFjayBjaGFubmVsczogRnJvbnQgTGVmdCAtIEZy
b250IFJpZ2h0CiAgTGltaXRzOiBQbGF5YmFjayAwIC0gODcKICBNb25vOgogIEZyb250IExl
ZnQ6IFBsYXliYWNrIDg3IFsxMDAlXSBbMC4wMGRCXSBbb25dCiAgRnJvbnQgUmlnaHQ6IFBs
YXliYWNrIDg3IFsxMDAlXSBbMC4wMGRCXSBbb25dClNpbXBsZSBtaXhlciBjb250cm9sICdQ
Q00nLDAKICBDYXBhYmlsaXRpZXM6IHB2b2x1bWUKICBQbGF5YmFjayBjaGFubmVsczogRnJv
bnQgTGVmdCAtIEZyb250IFJpZ2h0CiAgTGltaXRzOiBQbGF5YmFjayAwIC0gMjU1CiAgTW9u
bzoKICBGcm9udCBMZWZ0OiBQbGF5YmFjayAyNTUgWzEwMCVdIFswLjAwZEJdCiAgRnJvbnQg
UmlnaHQ6IFBsYXliYWNrIDI1NSBbMTAwJV0gWzAuMDBkQl0KU2ltcGxlIG1peGVyIGNvbnRy
b2wgJ0Zyb250JywwCiAgQ2FwYWJpbGl0aWVzOiBwdm9sdW1lIHBzd2l0Y2gKICBQbGF5YmFj
ayBjaGFubmVsczogRnJvbnQgTGVmdCAtIEZyb250IFJpZ2h0CiAgTGltaXRzOiBQbGF5YmFj
ayAwIC0gODcKICBNb25vOgogIEZyb250IExlZnQ6IFBsYXliYWNrIDg3IFsxMDAlXSBbMC4w
MGRCXSBbb2ZmXQogIEZyb250IFJpZ2h0OiBQbGF5YmFjayA4NyBbMTAwJV0gWzAuMDBkQl0g
W29mZl0KU2ltcGxlIG1peGVyIGNvbnRyb2wgJ0Zyb250IE1pYycsMAogIENhcGFiaWxpdGll
czogcHZvbHVtZSBwc3dpdGNoCiAgUGxheWJhY2sgY2hhbm5lbHM6IEZyb250IExlZnQgLSBG
cm9udCBSaWdodAogIExpbWl0czogUGxheWJhY2sgMCAtIDMxCiAgTW9ubzoKICBGcm9udCBM
ZWZ0OiBQbGF5YmFjayAwIFswJV0gWy0zNC41MGRCXSBbb2ZmXQogIEZyb250IFJpZ2h0OiBQ
bGF5YmFjayAwIFswJV0gWy0zNC41MGRCXSBbb2ZmXQpTaW1wbGUgbWl4ZXIgY29udHJvbCAn
RnJvbnQgTWljIEJvb3N0JywwCiAgQ2FwYWJpbGl0aWVzOiB2b2x1bWUKICBQbGF5YmFjayBj
aGFubmVsczogRnJvbnQgTGVmdCAtIEZyb250IFJpZ2h0CiAgQ2FwdHVyZSBjaGFubmVsczog
RnJvbnQgTGVmdCAtIEZyb250IFJpZ2h0CiAgTGltaXRzOiAwIC0gMwogIEZyb250IExlZnQ6
IDAgWzAlXSBbMC4wMGRCXQogIEZyb250IFJpZ2h0OiAwIFswJV0gWzAuMDBkQl0KU2ltcGxl
IG1peGVyIGNvbnRyb2wgJ1N1cnJvdW5kJywwCiAgQ2FwYWJpbGl0aWVzOiBwdm9sdW1lIHBz
d2l0Y2gKICBQbGF5YmFjayBjaGFubmVsczogRnJvbnQgTGVmdCAtIEZyb250IFJpZ2h0CiAg
TGltaXRzOiBQbGF5YmFjayAwIC0gODcKICBNb25vOgogIEZyb250IExlZnQ6IFBsYXliYWNr
IDAgWzAlXSBbLTY1LjI1ZEJdIFtvZmZdCiAgRnJvbnQgUmlnaHQ6IFBsYXliYWNrIDAgWzAl
XSBbLTY1LjI1ZEJdIFtvZmZdClNpbXBsZSBtaXhlciBjb250cm9sICdDZW50ZXInLDAKICBD
YXBhYmlsaXRpZXM6IHB2b2x1bWUgcHZvbHVtZS1qb2luZWQgcHN3aXRjaCBwc3dpdGNoLWpv
aW5lZAogIFBsYXliYWNrIGNoYW5uZWxzOiBNb25vCiAgTGltaXRzOiBQbGF5YmFjayAwIC0g
ODcKICBNb25vOiBQbGF5YmFjayAwIFswJV0gWy02NS4yNWRCXSBbb2ZmXQpTaW1wbGUgbWl4
ZXIgY29udHJvbCAnTEZFJywwCiAgQ2FwYWJpbGl0aWVzOiBwdm9sdW1lIHB2b2x1bWUtam9p
bmVkIHBzd2l0Y2ggcHN3aXRjaC1qb2luZWQKICBQbGF5YmFjayBjaGFubmVsczogTW9ubwog
IExpbWl0czogUGxheWJhY2sgMCAtIDg3CiAgTW9ubzogUGxheWJhY2sgMCBbMCVdIFstNjUu
MjVkQl0gW29mZl0KU2ltcGxlIG1peGVyIGNvbnRyb2wgJ0xpbmUnLDAKICBDYXBhYmlsaXRp
ZXM6IHB2b2x1bWUgcHN3aXRjaAogIFBsYXliYWNrIGNoYW5uZWxzOiBGcm9udCBMZWZ0IC0g
RnJvbnQgUmlnaHQKICBMaW1pdHM6IFBsYXliYWNrIDAgLSAzMQogIE1vbm86CiAgRnJvbnQg
TGVmdDogUGxheWJhY2sgMCBbMCVdIFstMzQuNTBkQl0gW29mZl0KICBGcm9udCBSaWdodDog
UGxheWJhY2sgMCBbMCVdIFstMzQuNTBkQl0gW29mZl0KU2ltcGxlIG1peGVyIGNvbnRyb2wg
J0xpbmUgQm9vc3QnLDAKICBDYXBhYmlsaXRpZXM6IHZvbHVtZQogIFBsYXliYWNrIGNoYW5u
ZWxzOiBGcm9udCBMZWZ0IC0gRnJvbnQgUmlnaHQKICBDYXB0dXJlIGNoYW5uZWxzOiBGcm9u
dCBMZWZ0IC0gRnJvbnQgUmlnaHQKICBMaW1pdHM6IDAgLSAzCiAgRnJvbnQgTGVmdDogMCBb
MCVdIFswLjAwZEJdCiAgRnJvbnQgUmlnaHQ6IDAgWzAlXSBbMC4wMGRCXQpTaW1wbGUgbWl4
ZXIgY29udHJvbCAnSUVDOTU4JywwCiAgQ2FwYWJpbGl0aWVzOiBwc3dpdGNoIHBzd2l0Y2gt
am9pbmVkCiAgUGxheWJhY2sgY2hhbm5lbHM6IE1vbm8KICBNb25vOiBQbGF5YmFjayBbb25d
ClNpbXBsZSBtaXhlciBjb250cm9sICdJRUM5NTggRGVmYXVsdCBQQ00nLDAKICBDYXBhYmls
aXRpZXM6IHBzd2l0Y2ggcHN3aXRjaC1qb2luZWQKICBQbGF5YmFjayBjaGFubmVsczogTW9u
bwogIE1vbm86IFBsYXliYWNrIFtvbl0KU2ltcGxlIG1peGVyIGNvbnRyb2wgJ0JlZXAnLDAK
ICBDYXBhYmlsaXRpZXM6IHB2b2x1bWUgcHN3aXRjaAogIFBsYXliYWNrIGNoYW5uZWxzOiBG
cm9udCBMZWZ0IC0gRnJvbnQgUmlnaHQKICBMaW1pdHM6IFBsYXliYWNrIDAgLSAzMQogIE1v
bm86CiAgRnJvbnQgTGVmdDogUGxheWJhY2sgMCBbMCVdIFstMzQuNTBkQl0gW29mZl0KICBG
cm9udCBSaWdodDogUGxheWJhY2sgMCBbMCVdIFstMzQuNTBkQl0gW29mZl0KU2ltcGxlIG1p
eGVyIGNvbnRyb2wgJ0NhcHR1cmUnLDAKICBDYXBhYmlsaXRpZXM6IGN2b2x1bWUgY3N3aXRj
aAogIENhcHR1cmUgY2hhbm5lbHM6IEZyb250IExlZnQgLSBGcm9udCBSaWdodAogIExpbWl0
czogQ2FwdHVyZSAwIC0gNjMKICBGcm9udCBMZWZ0OiBDYXB0dXJlIDM5IFs2MiVdIFsxMi4w
MGRCXSBbb25dCiAgRnJvbnQgUmlnaHQ6IENhcHR1cmUgMzkgWzYyJV0gWzEyLjAwZEJdIFtv
bl0KU2ltcGxlIG1peGVyIGNvbnRyb2wgJ0NhcHR1cmUnLDEKICBDYXBhYmlsaXRpZXM6IGN2
b2x1bWUgY3N3aXRjaAogIENhcHR1cmUgY2hhbm5lbHM6IEZyb250IExlZnQgLSBGcm9udCBS
aWdodAogIExpbWl0czogQ2FwdHVyZSAwIC0gNjMKICBGcm9udCBMZWZ0OiBDYXB0dXJlIDAg
WzAlXSBbLTE3LjI1ZEJdIFtvZmZdCiAgRnJvbnQgUmlnaHQ6IENhcHR1cmUgMCBbMCVdIFst
MTcuMjVkQl0gW29mZl0KU2ltcGxlIG1peGVyIGNvbnRyb2wgJ0F1dG8tTXV0ZSBNb2RlJyww
CiAgQ2FwYWJpbGl0aWVzOiBlbnVtCiAgSXRlbXM6ICdEaXNhYmxlZCcgJ0VuYWJsZWQnCiAg
SXRlbTA6ICdFbmFibGVkJwpTaW1wbGUgbWl4ZXIgY29udHJvbCAnSW5wdXQgU291cmNlJyww
CiAgQ2FwYWJpbGl0aWVzOiBjZW51bQogIEl0ZW1zOiAnUmVhciBNaWMnICdGcm9udCBNaWMn
ICdMaW5lJwogIEl0ZW0wOiAnRnJvbnQgTWljJwpTaW1wbGUgbWl4ZXIgY29udHJvbCAnSW5w
dXQgU291cmNlJywxCiAgQ2FwYWJpbGl0aWVzOiBjZW51bQogIEl0ZW1zOiAnUmVhciBNaWMn
ICdGcm9udCBNaWMnICdMaW5lJwogIEl0ZW0wOiAnUmVhciBNaWMnClNpbXBsZSBtaXhlciBj
b250cm9sICdMb29wYmFjayBNaXhpbmcnLDAKICBDYXBhYmlsaXRpZXM6IGVudW0KICBJdGVt
czogJ0Rpc2FibGVkJyAnRW5hYmxlZCcKICBJdGVtMDogJ0Rpc2FibGVkJwpTaW1wbGUgbWl4
ZXIgY29udHJvbCAnUmVhciBNaWMnLDAKICBDYXBhYmlsaXRpZXM6IHB2b2x1bWUgcHN3aXRj
aAogIFBsYXliYWNrIGNoYW5uZWxzOiBGcm9udCBMZWZ0IC0gRnJvbnQgUmlnaHQKICBMaW1p
dHM6IFBsYXliYWNrIDAgLSAzMQogIE1vbm86CiAgRnJvbnQgTGVmdDogUGxheWJhY2sgMCBb
MCVdIFstMzQuNTBkQl0gW29mZl0KICBGcm9udCBSaWdodDogUGxheWJhY2sgMCBbMCVdIFst
MzQuNTBkQl0gW29mZl0KU2ltcGxlIG1peGVyIGNvbnRyb2wgJ1JlYXIgTWljIEJvb3N0Jyww
CiAgQ2FwYWJpbGl0aWVzOiB2b2x1bWUKICBQbGF5YmFjayBjaGFubmVsczogRnJvbnQgTGVm
dCAtIEZyb250IFJpZ2h0CiAgQ2FwdHVyZSBjaGFubmVsczogRnJvbnQgTGVmdCAtIEZyb250
IFJpZ2h0CiAgTGltaXRzOiAwIC0gMwogIEZyb250IExlZnQ6IDAgWzAlXSBbMC4wMGRCXQog
IEZyb250IFJpZ2h0OiAwIFswJV0gWzAuMDBkQl0KCiEhLS0tLS0tLU1peGVyIGNvbnRyb2xz
IGZvciBjYXJkIEhETUkKCkNhcmQgc3lzZGVmYXVsdDoyICdIRE1JJy8nSERBIEFUSSBIRE1J
IGF0IDB4YTAxMjAwMDAgaXJxIDE4NycKICBNaXhlciBuYW1lCTogJ0FUSSBSNnh4IEhETUkn
CiAgQ29tcG9uZW50cwk6ICdIREE6MTAwMmFhMDEsMDBhYTAxMDAsMDAxMDA4MDAnCiAgQ29u
dHJvbHMgICAgICA6IDI4CiAgU2ltcGxlIGN0cmxzICA6IDQKU2ltcGxlIG1peGVyIGNvbnRy
b2wgJ0lFQzk1OCcsMAogIENhcGFiaWxpdGllczogcHN3aXRjaCBwc3dpdGNoLWpvaW5lZAog
IFBsYXliYWNrIGNoYW5uZWxzOiBNb25vCiAgTW9ubzogUGxheWJhY2sgW29uXQpTaW1wbGUg
bWl4ZXIgY29udHJvbCAnSUVDOTU4JywxCiAgQ2FwYWJpbGl0aWVzOiBwc3dpdGNoIHBzd2l0
Y2gtam9pbmVkCiAgUGxheWJhY2sgY2hhbm5lbHM6IE1vbm8KICBNb25vOiBQbGF5YmFjayBb
b25dClNpbXBsZSBtaXhlciBjb250cm9sICdJRUM5NTgnLDIKICBDYXBhYmlsaXRpZXM6IHBz
d2l0Y2ggcHN3aXRjaC1qb2luZWQKICBQbGF5YmFjayBjaGFubmVsczogTW9ubwogIE1vbm86
IFBsYXliYWNrIFtvbl0KU2ltcGxlIG1peGVyIGNvbnRyb2wgJ0lFQzk1OCcsMwogIENhcGFi
aWxpdGllczogcHN3aXRjaCBwc3dpdGNoLWpvaW5lZAogIFBsYXliYWNrIGNoYW5uZWxzOiBN
b25vCiAgTW9ubzogUGxheWJhY2sgW29uXQoKCiEhQWxzYWN0bCBvdXRwdXQKISEtLS0tLS0t
LS0tLS0tLQoKLS1zdGFydGNvbGxhcHNlLS0Kc3RhdGUuTWljcm9waG9uZSB7Cgljb250cm9s
LjEgewoJCWlmYWNlIFBDTQoJCW5hbWUgJ1BsYXliYWNrIENoYW5uZWwgTWFwJwoJCXZhbHVl
LjAgMAoJCXZhbHVlLjEgMAoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgdm9sYXRpbGUn
CgkJCXR5cGUgSU5URUdFUgoJCQljb3VudCAyCgkJCXJhbmdlICcwIC0gMzYnCgkJfQoJfQoJ
Y29udHJvbC4yIHsKCQlpZmFjZSBQQ00KCQluYW1lICdDYXB0dXJlIENoYW5uZWwgTWFwJwoJ
CXZhbHVlLjAgMAoJCXZhbHVlLjEgMAoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgdm9s
YXRpbGUnCgkJCXR5cGUgSU5URUdFUgoJCQljb3VudCAyCgkJCXJhbmdlICcwIC0gMzYnCgkJ
fQoJfQoJY29udHJvbC4zIHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUgJ01pYyBQbGF5YmFjayBT
d2l0Y2gnCgkJdmFsdWUgdHJ1ZQoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUn
CgkJCXR5cGUgQk9PTEVBTgoJCQljb3VudCAxCgkJfQoJfQoJY29udHJvbC40IHsKCQlpZmFj
ZSBNSVhFUgoJCW5hbWUgJ01pYyBQbGF5YmFjayBWb2x1bWUnCgkJdmFsdWUuMCAzNAoJCXZh
bHVlLjEgMzQKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIElO
VEVHRVIKCQkJY291bnQgMgoJCQlyYW5nZSAnMCAtIDM3JwoJCQlkYm1pbiAtMzAwMAoJCQlk
Ym1heCA3MDAKCQkJZGJ2YWx1ZS4wIDQwMAoJCQlkYnZhbHVlLjEgNDAwCgkJfQoJfQoJY29u
dHJvbC41IHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUgJ1NwZWFrZXIgUGxheWJhY2sgU3dpdGNo
JwoJCXZhbHVlIHRydWUKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0
eXBlIEJPT0xFQU4KCQkJY291bnQgMQoJCX0KCX0KCWNvbnRyb2wuNiB7CgkJaWZhY2UgTUlY
RVIKCQluYW1lICdTcGVha2VyIFBsYXliYWNrIFZvbHVtZScKCQl2YWx1ZS4wIDE3CgkJdmFs
dWUuMSAxNwoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUnCgkJCXR5cGUgSU5U
RUdFUgoJCQljb3VudCAyCgkJCXJhbmdlICcwIC0gNDAnCgkJCWRibWluIC00MDAwCgkJCWRi
bWF4IDAKCQkJZGJ2YWx1ZS4wIC0yMzAwCgkJCWRidmFsdWUuMSAtMjMwMAoJCX0KCX0KCWNv
bnRyb2wuNyB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdNaWMgQ2FwdHVyZSBTd2l0Y2gnCgkJ
dmFsdWUgdHJ1ZQoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUnCgkJCXR5cGUg
Qk9PTEVBTgoJCQljb3VudCAxCgkJfQoJfQoJY29udHJvbC44IHsKCQlpZmFjZSBNSVhFUgoJ
CW5hbWUgJ01pYyBDYXB0dXJlIFZvbHVtZScKCQl2YWx1ZS4wIDgKCQl2YWx1ZS4xIDgKCQlj
b21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIElOVEVHRVIKCQkJY291
bnQgMgoJCQlyYW5nZSAnMCAtIDIyJwoJCQlkYm1pbiAtODAwCgkJCWRibWF4IDE0MDAKCQkJ
ZGJ2YWx1ZS4wIDAKCQkJZGJ2YWx1ZS4xIDAKCQl9Cgl9Cn0Kc3RhdGUuUENIIHsKCWNvbnRy
b2wuMSB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdGcm9udCBQbGF5YmFjayBWb2x1bWUnCgkJ
dmFsdWUuMCA4NwoJCXZhbHVlLjEgODcKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdy
aXRlJwoJCQl0eXBlIElOVEVHRVIKCQkJY291bnQgMgoJCQlyYW5nZSAnMCAtIDg3JwoJCQlk
Ym1pbiAtNjUyNQoJCQlkYm1heCAwCgkJCWRidmFsdWUuMCAwCgkJCWRidmFsdWUuMSAwCgkJ
fQoJfQoJY29udHJvbC4yIHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUgJ0Zyb250IFBsYXliYWNr
IFN3aXRjaCcKCQl2YWx1ZS4wIGZhbHNlCgkJdmFsdWUuMSBmYWxzZQoJCWNvbW1lbnQgewoJ
CQlhY2Nlc3MgJ3JlYWQgd3JpdGUnCgkJCXR5cGUgQk9PTEVBTgoJCQljb3VudCAyCgkJfQoJ
fQoJY29udHJvbC4zIHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUgJ1N1cnJvdW5kIFBsYXliYWNr
IFZvbHVtZScKCQl2YWx1ZS4wIDAKCQl2YWx1ZS4xIDAKCQljb21tZW50IHsKCQkJYWNjZXNz
ICdyZWFkIHdyaXRlJwoJCQl0eXBlIElOVEVHRVIKCQkJY291bnQgMgoJCQlyYW5nZSAnMCAt
IDg3JwoJCQlkYm1pbiAtNjUyNQoJCQlkYm1heCAwCgkJCWRidmFsdWUuMCAtNjUyNQoJCQlk
YnZhbHVlLjEgLTY1MjUKCQl9Cgl9Cgljb250cm9sLjQgewoJCWlmYWNlIE1JWEVSCgkJbmFt
ZSAnU3Vycm91bmQgUGxheWJhY2sgU3dpdGNoJwoJCXZhbHVlLjAgZmFsc2UKCQl2YWx1ZS4x
IGZhbHNlCgkJY29tbWVudCB7CgkJCWFjY2VzcyAncmVhZCB3cml0ZScKCQkJdHlwZSBCT09M
RUFOCgkJCWNvdW50IDIKCQl9Cgl9Cgljb250cm9sLjUgewoJCWlmYWNlIE1JWEVSCgkJbmFt
ZSAnQ2VudGVyIFBsYXliYWNrIFZvbHVtZScKCQl2YWx1ZSAwCgkJY29tbWVudCB7CgkJCWFj
Y2VzcyAncmVhZCB3cml0ZScKCQkJdHlwZSBJTlRFR0VSCgkJCWNvdW50IDEKCQkJcmFuZ2Ug
JzAgLSA4NycKCQkJZGJtaW4gLTY1MjUKCQkJZGJtYXggMAoJCQlkYnZhbHVlLjAgLTY1MjUK
CQl9Cgl9Cgljb250cm9sLjYgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnTEZFIFBsYXliYWNr
IFZvbHVtZScKCQl2YWx1ZSAwCgkJY29tbWVudCB7CgkJCWFjY2VzcyAncmVhZCB3cml0ZScK
CQkJdHlwZSBJTlRFR0VSCgkJCWNvdW50IDEKCQkJcmFuZ2UgJzAgLSA4NycKCQkJZGJtaW4g
LTY1MjUKCQkJZGJtYXggMAoJCQlkYnZhbHVlLjAgLTY1MjUKCQl9Cgl9Cgljb250cm9sLjcg
ewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnQ2VudGVyIFBsYXliYWNrIFN3aXRjaCcKCQl2YWx1
ZSBmYWxzZQoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUnCgkJCXR5cGUgQk9P
TEVBTgoJCQljb3VudCAxCgkJfQoJfQoJY29udHJvbC44IHsKCQlpZmFjZSBNSVhFUgoJCW5h
bWUgJ0xGRSBQbGF5YmFjayBTd2l0Y2gnCgkJdmFsdWUgZmFsc2UKCQljb21tZW50IHsKCQkJ
YWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIEJPT0xFQU4KCQkJY291bnQgMQoJCX0KCX0K
CWNvbnRyb2wuOSB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdIZWFkcGhvbmUgUGxheWJhY2sg
Vm9sdW1lJwoJCXZhbHVlLjAgODcKCQl2YWx1ZS4xIDg3CgkJY29tbWVudCB7CgkJCWFjY2Vz
cyAncmVhZCB3cml0ZScKCQkJdHlwZSBJTlRFR0VSCgkJCWNvdW50IDIKCQkJcmFuZ2UgJzAg
LSA4NycKCQkJZGJtaW4gLTY1MjUKCQkJZGJtYXggMAoJCQlkYnZhbHVlLjAgMAoJCQlkYnZh
bHVlLjEgMAoJCX0KCX0KCWNvbnRyb2wuMTAgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnSGVh
ZHBob25lIFBsYXliYWNrIFN3aXRjaCcKCQl2YWx1ZS4wIHRydWUKCQl2YWx1ZS4xIHRydWUK
CQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIEJPT0xFQU4KCQkJ
Y291bnQgMgoJCX0KCX0KCWNvbnRyb2wuMTEgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnTG9v
cGJhY2sgTWl4aW5nJwoJCXZhbHVlIERpc2FibGVkCgkJY29tbWVudCB7CgkJCWFjY2VzcyAn
cmVhZCB3cml0ZScKCQkJdHlwZSBFTlVNRVJBVEVECgkJCWNvdW50IDEKCQkJaXRlbS4wIERp
c2FibGVkCgkJCWl0ZW0uMSBFbmFibGVkCgkJfQoJfQoJY29udHJvbC4xMiB7CgkJaWZhY2Ug
TUlYRVIKCQluYW1lICdSZWFyIE1pYyBQbGF5YmFjayBWb2x1bWUnCgkJdmFsdWUuMCAwCgkJ
dmFsdWUuMSAwCgkJY29tbWVudCB7CgkJCWFjY2VzcyAncmVhZCB3cml0ZScKCQkJdHlwZSBJ
TlRFR0VSCgkJCWNvdW50IDIKCQkJcmFuZ2UgJzAgLSAzMScKCQkJZGJtaW4gLTM0NTAKCQkJ
ZGJtYXggMTIwMAoJCQlkYnZhbHVlLjAgLTM0NTAKCQkJZGJ2YWx1ZS4xIC0zNDUwCgkJfQoJ
fQoJY29udHJvbC4xMyB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdSZWFyIE1pYyBQbGF5YmFj
ayBTd2l0Y2gnCgkJdmFsdWUuMCBmYWxzZQoJCXZhbHVlLjEgZmFsc2UKCQljb21tZW50IHsK
CQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIEJPT0xFQU4KCQkJY291bnQgMgoJCX0K
CX0KCWNvbnRyb2wuMTQgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnRnJvbnQgTWljIFBsYXli
YWNrIFZvbHVtZScKCQl2YWx1ZS4wIDAKCQl2YWx1ZS4xIDAKCQljb21tZW50IHsKCQkJYWNj
ZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIElOVEVHRVIKCQkJY291bnQgMgoJCQlyYW5nZSAn
MCAtIDMxJwoJCQlkYm1pbiAtMzQ1MAoJCQlkYm1heCAxMjAwCgkJCWRidmFsdWUuMCAtMzQ1
MAoJCQlkYnZhbHVlLjEgLTM0NTAKCQl9Cgl9Cgljb250cm9sLjE1IHsKCQlpZmFjZSBNSVhF
UgoJCW5hbWUgJ0Zyb250IE1pYyBQbGF5YmFjayBTd2l0Y2gnCgkJdmFsdWUuMCBmYWxzZQoJ
CXZhbHVlLjEgZmFsc2UKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0
eXBlIEJPT0xFQU4KCQkJY291bnQgMgoJCX0KCX0KCWNvbnRyb2wuMTYgewoJCWlmYWNlIE1J
WEVSCgkJbmFtZSAnTGluZSBQbGF5YmFjayBWb2x1bWUnCgkJdmFsdWUuMCAwCgkJdmFsdWUu
MSAwCgkJY29tbWVudCB7CgkJCWFjY2VzcyAncmVhZCB3cml0ZScKCQkJdHlwZSBJTlRFR0VS
CgkJCWNvdW50IDIKCQkJcmFuZ2UgJzAgLSAzMScKCQkJZGJtaW4gLTM0NTAKCQkJZGJtYXgg
MTIwMAoJCQlkYnZhbHVlLjAgLTM0NTAKCQkJZGJ2YWx1ZS4xIC0zNDUwCgkJfQoJfQoJY29u
dHJvbC4xNyB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdMaW5lIFBsYXliYWNrIFN3aXRjaCcK
CQl2YWx1ZS4wIGZhbHNlCgkJdmFsdWUuMSBmYWxzZQoJCWNvbW1lbnQgewoJCQlhY2Nlc3Mg
J3JlYWQgd3JpdGUnCgkJCXR5cGUgQk9PTEVBTgoJCQljb3VudCAyCgkJfQoJfQoJY29udHJv
bC4xOCB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdBdXRvLU11dGUgTW9kZScKCQl2YWx1ZSBF
bmFibGVkCgkJY29tbWVudCB7CgkJCWFjY2VzcyAncmVhZCB3cml0ZScKCQkJdHlwZSBFTlVN
RVJBVEVECgkJCWNvdW50IDEKCQkJaXRlbS4wIERpc2FibGVkCgkJCWl0ZW0uMSBFbmFibGVk
CgkJfQoJfQoJY29udHJvbC4xOSB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdJbnB1dCBTb3Vy
Y2UnCgkJdmFsdWUgJ0Zyb250IE1pYycKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdy
aXRlJwoJCQl0eXBlIEVOVU1FUkFURUQKCQkJY291bnQgMQoJCQlpdGVtLjAgJ1JlYXIgTWlj
JwoJCQlpdGVtLjEgJ0Zyb250IE1pYycKCQkJaXRlbS4yIExpbmUKCQl9Cgl9Cgljb250cm9s
LjIwIHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUgJ0lucHV0IFNvdXJjZScKCQlpbmRleCAxCgkJ
dmFsdWUgJ1JlYXIgTWljJwoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUnCgkJ
CXR5cGUgRU5VTUVSQVRFRAoJCQljb3VudCAxCgkJCWl0ZW0uMCAnUmVhciBNaWMnCgkJCWl0
ZW0uMSAnRnJvbnQgTWljJwoJCQlpdGVtLjIgTGluZQoJCX0KCX0KCWNvbnRyb2wuMjEgewoJ
CWlmYWNlIE1JWEVSCgkJbmFtZSAnQ2FwdHVyZSBWb2x1bWUnCgkJdmFsdWUuMCAzOQoJCXZh
bHVlLjEgMzkKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIElO
VEVHRVIKCQkJY291bnQgMgoJCQlyYW5nZSAnMCAtIDYzJwoJCQlkYm1pbiAtMTcyNQoJCQlk
Ym1heCAzMDAwCgkJCWRidmFsdWUuMCAxMjAwCgkJCWRidmFsdWUuMSAxMjAwCgkJfQoJfQoJ
Y29udHJvbC4yMiB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdDYXB0dXJlIFN3aXRjaCcKCQl2
YWx1ZS4wIHRydWUKCQl2YWx1ZS4xIHRydWUKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFk
IHdyaXRlJwoJCQl0eXBlIEJPT0xFQU4KCQkJY291bnQgMgoJCX0KCX0KCWNvbnRyb2wuMjMg
ewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnQ2FwdHVyZSBWb2x1bWUnCgkJaW5kZXggMQoJCXZh
bHVlLjAgMAoJCXZhbHVlLjEgMAoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUn
CgkJCXR5cGUgSU5URUdFUgoJCQljb3VudCAyCgkJCXJhbmdlICcwIC0gNjMnCgkJCWRibWlu
IC0xNzI1CgkJCWRibWF4IDMwMDAKCQkJZGJ2YWx1ZS4wIC0xNzI1CgkJCWRidmFsdWUuMSAt
MTcyNQoJCX0KCX0KCWNvbnRyb2wuMjQgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnQ2FwdHVy
ZSBTd2l0Y2gnCgkJaW5kZXggMQoJCXZhbHVlLjAgZmFsc2UKCQl2YWx1ZS4xIGZhbHNlCgkJ
Y29tbWVudCB7CgkJCWFjY2VzcyAncmVhZCB3cml0ZScKCQkJdHlwZSBCT09MRUFOCgkJCWNv
dW50IDIKCQl9Cgl9Cgljb250cm9sLjI1IHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUgJ1JlYXIg
TWljIEJvb3N0IFZvbHVtZScKCQl2YWx1ZS4wIDAKCQl2YWx1ZS4xIDAKCQljb21tZW50IHsK
CQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIElOVEVHRVIKCQkJY291bnQgMgoJCQly
YW5nZSAnMCAtIDMnCgkJCWRibWluIDAKCQkJZGJtYXggMzAwMAoJCQlkYnZhbHVlLjAgMAoJ
CQlkYnZhbHVlLjEgMAoJCX0KCX0KCWNvbnRyb2wuMjYgewoJCWlmYWNlIE1JWEVSCgkJbmFt
ZSAnRnJvbnQgTWljIEJvb3N0IFZvbHVtZScKCQl2YWx1ZS4wIDAKCQl2YWx1ZS4xIDAKCQlj
b21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIElOVEVHRVIKCQkJY291
bnQgMgoJCQlyYW5nZSAnMCAtIDMnCgkJCWRibWluIDAKCQkJZGJtYXggMzAwMAoJCQlkYnZh
bHVlLjAgMAoJCQlkYnZhbHVlLjEgMAoJCX0KCX0KCWNvbnRyb2wuMjcgewoJCWlmYWNlIE1J
WEVSCgkJbmFtZSAnTGluZSBCb29zdCBWb2x1bWUnCgkJdmFsdWUuMCAwCgkJdmFsdWUuMSAw
CgkJY29tbWVudCB7CgkJCWFjY2VzcyAncmVhZCB3cml0ZScKCQkJdHlwZSBJTlRFR0VSCgkJ
CWNvdW50IDIKCQkJcmFuZ2UgJzAgLSAzJwoJCQlkYm1pbiAwCgkJCWRibWF4IDMwMDAKCQkJ
ZGJ2YWx1ZS4wIDAKCQkJZGJ2YWx1ZS4xIDAKCQl9Cgl9Cgljb250cm9sLjI4IHsKCQlpZmFj
ZSBNSVhFUgoJCW5hbWUgJ0JlZXAgUGxheWJhY2sgVm9sdW1lJwoJCXZhbHVlLjAgMAoJCXZh
bHVlLjEgMAoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUnCgkJCXR5cGUgSU5U
RUdFUgoJCQljb3VudCAyCgkJCXJhbmdlICcwIC0gMzEnCgkJCWRibWluIC0zNDUwCgkJCWRi
bWF4IDEyMDAKCQkJZGJ2YWx1ZS4wIC0zNDUwCgkJCWRidmFsdWUuMSAtMzQ1MAoJCX0KCX0K
CWNvbnRyb2wuMjkgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnQmVlcCBQbGF5YmFjayBTd2l0
Y2gnCgkJdmFsdWUuMCBmYWxzZQoJCXZhbHVlLjEgZmFsc2UKCQljb21tZW50IHsKCQkJYWNj
ZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIEJPT0xFQU4KCQkJY291bnQgMgoJCX0KCX0KCWNv
bnRyb2wuMzAgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnSUVDOTU4IFBsYXliYWNrIENvbiBN
YXNrJwoJCXZhbHVlICcwZmZmMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwJwoJCWNvbW1lbnQg
ewoJCQlhY2Nlc3MgcmVhZAoJCQl0eXBlIElFQzk1OAoJCQljb3VudCAxCgkJfQoJfQoJY29u
dHJvbC4zMSB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdJRUM5NTggUGxheWJhY2sgUHJvIE1h
c2snCgkJdmFsdWUgJzBmMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAnCgkJY29tbWVudCB7
CgkJCWFjY2VzcyByZWFkCgkJCXR5cGUgSUVDOTU4CgkJCWNvdW50IDEKCQl9Cgl9Cgljb250
cm9sLjMyIHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUgJ0lFQzk1OCBQbGF5YmFjayBEZWZhdWx0
JwoJCXZhbHVlICcwNDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwJwoJCWNvbW1lbnQgewoJ
CQlhY2Nlc3MgJ3JlYWQgd3JpdGUnCgkJCXR5cGUgSUVDOTU4CgkJCWNvdW50IDEKCQl9Cgl9
Cgljb250cm9sLjMzIHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUgJ0lFQzk1OCBQbGF5YmFjayBT
d2l0Y2gnCgkJdmFsdWUgdHJ1ZQoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUn
CgkJCXR5cGUgQk9PTEVBTgoJCQljb3VudCAxCgkJfQoJfQoJY29udHJvbC4zNCB7CgkJaWZh
Y2UgTUlYRVIKCQluYW1lICdJRUM5NTggRGVmYXVsdCBQQ00gUGxheWJhY2sgU3dpdGNoJwoJ
CXZhbHVlIHRydWUKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBl
IEJPT0xFQU4KCQkJY291bnQgMQoJCX0KCX0KCWNvbnRyb2wuMzUgewoJCWlmYWNlIE1JWEVS
CgkJbmFtZSAnTWFzdGVyIFBsYXliYWNrIFZvbHVtZScKCQl2YWx1ZSA2NAoJCWNvbW1lbnQg
ewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUnCgkJCXR5cGUgSU5URUdFUgoJCQljb3VudCAxCgkJ
CXJhbmdlICcwIC0gODcnCgkJCWRibWluIC02NTI1CgkJCWRibWF4IDAKCQkJZGJ2YWx1ZS4w
IC0xNzI1CgkJfQoJfQoJY29udHJvbC4zNiB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdNYXN0
ZXIgUGxheWJhY2sgU3dpdGNoJwoJCXZhbHVlIHRydWUKCQljb21tZW50IHsKCQkJYWNjZXNz
ICdyZWFkIHdyaXRlJwoJCQl0eXBlIEJPT0xFQU4KCQkJY291bnQgMQoJCX0KCX0KCWNvbnRy
b2wuMzcgewoJCWlmYWNlIENBUkQKCQluYW1lICdSZWFyIE1pYyBKYWNrJwoJCXZhbHVlIGZh
bHNlCgkJY29tbWVudCB7CgkJCWFjY2VzcyByZWFkCgkJCXR5cGUgQk9PTEVBTgoJCQljb3Vu
dCAxCgkJfQoJfQoJY29udHJvbC4zOCB7CgkJaWZhY2UgQ0FSRAoJCW5hbWUgJ0Zyb250IE1p
YyBKYWNrJwoJCXZhbHVlIGZhbHNlCgkJY29tbWVudCB7CgkJCWFjY2VzcyByZWFkCgkJCXR5
cGUgQk9PTEVBTgoJCQljb3VudCAxCgkJfQoJfQoJY29udHJvbC4zOSB7CgkJaWZhY2UgQ0FS
RAoJCW5hbWUgJ0xpbmUgSmFjaycKCQl2YWx1ZSBmYWxzZQoJCWNvbW1lbnQgewoJCQlhY2Nl
c3MgcmVhZAoJCQl0eXBlIEJPT0xFQU4KCQkJY291bnQgMQoJCX0KCX0KCWNvbnRyb2wuNDAg
ewoJCWlmYWNlIENBUkQKCQluYW1lICdMaW5lIE91dCBGcm9udCBKYWNrJwoJCXZhbHVlIHRy
dWUKCQljb21tZW50IHsKCQkJYWNjZXNzIHJlYWQKCQkJdHlwZSBCT09MRUFOCgkJCWNvdW50
IDEKCQl9Cgl9Cgljb250cm9sLjQxIHsKCQlpZmFjZSBDQVJECgkJbmFtZSAnTGluZSBPdXQg
U3Vycm91bmQgSmFjaycKCQl2YWx1ZSBmYWxzZQoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgcmVh
ZAoJCQl0eXBlIEJPT0xFQU4KCQkJY291bnQgMQoJCX0KCX0KCWNvbnRyb2wuNDIgewoJCWlm
YWNlIENBUkQKCQluYW1lICdMaW5lIE91dCBDTEZFIEphY2snCgkJdmFsdWUgZmFsc2UKCQlj
b21tZW50IHsKCQkJYWNjZXNzIHJlYWQKCQkJdHlwZSBCT09MRUFOCgkJCWNvdW50IDEKCQl9
Cgl9Cgljb250cm9sLjQzIHsKCQlpZmFjZSBDQVJECgkJbmFtZSAnRnJvbnQgSGVhZHBob25l
IEphY2snCgkJdmFsdWUgdHJ1ZQoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgcmVhZAoJCQl0eXBl
IEJPT0xFQU4KCQkJY291bnQgMQoJCX0KCX0KCWNvbnRyb2wuNDQgewoJCWlmYWNlIENBUkQK
CQluYW1lICdTUERJRiBQaGFudG9tIEphY2snCgkJdmFsdWUgdHJ1ZQoJCWNvbW1lbnQgewoJ
CQlhY2Nlc3MgcmVhZAoJCQl0eXBlIEJPT0xFQU4KCQkJY291bnQgMQoJCX0KCX0KCWNvbnRy
b2wuNDUgewoJCWlmYWNlIFBDTQoJCW5hbWUgJ1BsYXliYWNrIENoYW5uZWwgTWFwJwoJCXZh
bHVlLjAgMAoJCXZhbHVlLjEgMAoJCXZhbHVlLjIgMAoJCXZhbHVlLjMgMAoJCXZhbHVlLjQg
MAoJCXZhbHVlLjUgMAoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgdm9sYXRpbGUnCgkJ
CXR5cGUgSU5URUdFUgoJCQljb3VudCA2CgkJCXJhbmdlICcwIC0gMzYnCgkJfQoJfQoJY29u
dHJvbC40NiB7CgkJaWZhY2UgUENNCgkJbmFtZSAnQ2FwdHVyZSBDaGFubmVsIE1hcCcKCQl2
YWx1ZS4wIDAKCQl2YWx1ZS4xIDAKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHZvbGF0
aWxlJwoJCQl0eXBlIElOVEVHRVIKCQkJY291bnQgMgoJCQlyYW5nZSAnMCAtIDM2JwoJCX0K
CX0KCWNvbnRyb2wuNDcgewoJCWlmYWNlIFBDTQoJCWRldmljZSAxCgkJbmFtZSAnUGxheWJh
Y2sgQ2hhbm5lbCBNYXAnCgkJdmFsdWUuMCAwCgkJdmFsdWUuMSAwCgkJY29tbWVudCB7CgkJ
CWFjY2VzcyAncmVhZCB2b2xhdGlsZScKCQkJdHlwZSBJTlRFR0VSCgkJCWNvdW50IDIKCQkJ
cmFuZ2UgJzAgLSAzNicKCQl9Cgl9Cgljb250cm9sLjQ4IHsKCQlpZmFjZSBQQ00KCQlkZXZp
Y2UgMgoJCW5hbWUgJ0NhcHR1cmUgQ2hhbm5lbCBNYXAnCgkJdmFsdWUuMCAwCgkJdmFsdWUu
MSAwCgkJY29tbWVudCB7CgkJCWFjY2VzcyAncmVhZCB2b2xhdGlsZScKCQkJdHlwZSBJTlRF
R0VSCgkJCWNvdW50IDIKCQkJcmFuZ2UgJzAgLSAzNicKCQl9Cgl9Cgljb250cm9sLjQ5IHsK
CQlpZmFjZSBNSVhFUgoJCW5hbWUgJ1BDTSBQbGF5YmFjayBWb2x1bWUnCgkJdmFsdWUuMCAy
NTUKCQl2YWx1ZS4xIDI1NQoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUgdXNl
cicKCQkJdHlwZSBJTlRFR0VSCgkJCWNvdW50IDIKCQkJcmFuZ2UgJzAgLSAyNTUnCgkJCXRs
diAnMDAwMDAwMDEwMDAwMDAwOGZmZmZlYzE0MDAwMDAwMTQnCgkJCWRibWluIC01MTAwCgkJ
CWRibWF4IDAKCQkJZGJ2YWx1ZS4wIDAKCQkJZGJ2YWx1ZS4xIDAKCQl9Cgl9Cn0Kc3RhdGUu
SERNSSB7Cgljb250cm9sLjEgewoJCWlmYWNlIENBUkQKCQluYW1lICdIRE1JL0RQLHBjbT0z
IEphY2snCgkJdmFsdWUgdHJ1ZQoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgcmVhZAoJCQl0eXBl
IEJPT0xFQU4KCQkJY291bnQgMQoJCX0KCX0KCWNvbnRyb2wuMiB7CgkJaWZhY2UgTUlYRVIK
CQluYW1lICdJRUM5NTggUGxheWJhY2sgQ29uIE1hc2snCgkJdmFsdWUgJzBmZmYwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAnCgkJY29tbWVudCB7CgkJCWFjY2VzcyByZWFkCgkJCXR5cGUg
SUVDOTU4CgkJCWNvdW50IDEKCQl9Cgl9Cgljb250cm9sLjMgewoJCWlmYWNlIE1JWEVSCgkJ
bmFtZSAnSUVDOTU4IFBsYXliYWNrIFBybyBNYXNrJwoJCXZhbHVlICcwZjAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwJwoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgcmVhZAoJCQl0eXBlIElF
Qzk1OAoJCQljb3VudCAxCgkJfQoJfQoJY29udHJvbC40IHsKCQlpZmFjZSBNSVhFUgoJCW5h
bWUgJ0lFQzk1OCBQbGF5YmFjayBEZWZhdWx0JwoJCXZhbHVlICcwNDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwJwoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUnCgkJCXR5
cGUgSUVDOTU4CgkJCWNvdW50IDEKCQl9Cgl9Cgljb250cm9sLjUgewoJCWlmYWNlIE1JWEVS
CgkJbmFtZSAnSUVDOTU4IFBsYXliYWNrIFN3aXRjaCcKCQl2YWx1ZSB0cnVlCgkJY29tbWVu
dCB7CgkJCWFjY2VzcyAncmVhZCB3cml0ZScKCQkJdHlwZSBCT09MRUFOCgkJCWNvdW50IDEK
CQl9Cgl9Cgljb250cm9sLjYgewoJCWlmYWNlIFBDTQoJCWRldmljZSAzCgkJbmFtZSBFTEQK
CQl2YWx1ZSAnMTAwMDA4MDA2ZDE0MDAwMTAwMDAwMDAwMDAwMDAwMDAzNjY5ZDg0YzRkNDE0
NzIwMzIzNzMxNTE1MDU4MjA0NTMyMDkwNzA3JwoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3Jl
YWQgdm9sYXRpbGUnCgkJCXR5cGUgQllURVMKCQkJY291bnQgMzYKCQl9Cgl9Cgljb250cm9s
LjcgewoJCWlmYWNlIENBUkQKCQluYW1lICdIRE1JL0RQLHBjbT03IEphY2snCgkJdmFsdWUg
dHJ1ZQoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgcmVhZAoJCQl0eXBlIEJPT0xFQU4KCQkJY291
bnQgMQoJCX0KCX0KCWNvbnRyb2wuOCB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdJRUM5NTgg
UGxheWJhY2sgQ29uIE1hc2snCgkJaW5kZXggMQoJCXZhbHVlICcwZmZmMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwJwoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgcmVhZAoJCQl0eXBlIElFQzk1
OAoJCQljb3VudCAxCgkJfQoJfQoJY29udHJvbC45IHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUg
J0lFQzk1OCBQbGF5YmFjayBQcm8gTWFzaycKCQlpbmRleCAxCgkJdmFsdWUgJzBmMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAnCgkJY29tbWVudCB7CgkJCWFjY2VzcyByZWFkCgkJCXR5
cGUgSUVDOTU4CgkJCWNvdW50IDEKCQl9Cgl9Cgljb250cm9sLjEwIHsKCQlpZmFjZSBNSVhF
UgoJCW5hbWUgJ0lFQzk1OCBQbGF5YmFjayBEZWZhdWx0JwoJCWluZGV4IDEKCQl2YWx1ZSAn
MDQwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCcKCQljb21tZW50IHsKCQkJYWNjZXNzICdy
ZWFkIHdyaXRlJwoJCQl0eXBlIElFQzk1OAoJCQljb3VudCAxCgkJfQoJfQoJY29udHJvbC4x
MSB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdJRUM5NTggUGxheWJhY2sgU3dpdGNoJwoJCWlu
ZGV4IDEKCQl2YWx1ZSB0cnVlCgkJY29tbWVudCB7CgkJCWFjY2VzcyAncmVhZCB3cml0ZScK
CQkJdHlwZSBCT09MRUFOCgkJCWNvdW50IDEKCQl9Cgl9Cgljb250cm9sLjEyIHsKCQlpZmFj
ZSBQQ00KCQlkZXZpY2UgNwoJCW5hbWUgRUxECgkJdmFsdWUgJzEwMDAwODAwNmQxNDAwMDEw
MDAwMDAwMDAwMDAwMDAwMTBhYzM5NDI0NDQ1NGM0YzIwNTMzMjM3MzIzMjQ0NDc0ZDA5MDcw
NycKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHZvbGF0aWxlJwoJCQl0eXBlIEJZVEVT
CgkJCWNvdW50IDM2CgkJfQoJfQoJY29udHJvbC4xMyB7CgkJaWZhY2UgQ0FSRAoJCW5hbWUg
J0hETUkvRFAscGNtPTggSmFjaycKCQl2YWx1ZSB0cnVlCgkJY29tbWVudCB7CgkJCWFjY2Vz
cyByZWFkCgkJCXR5cGUgQk9PTEVBTgoJCQljb3VudCAxCgkJfQoJfQoJY29udHJvbC4xNCB7
CgkJaWZhY2UgTUlYRVIKCQluYW1lICdJRUM5NTggUGxheWJhY2sgQ29uIE1hc2snCgkJaW5k
ZXggMgoJCXZhbHVlICcwZmZmMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwJwoJCWNvbW1lbnQg
ewoJCQlhY2Nlc3MgcmVhZAoJCQl0eXBlIElFQzk1OAoJCQljb3VudCAxCgkJfQoJfQoJY29u
dHJvbC4xNSB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdJRUM5NTggUGxheWJhY2sgUHJvIE1h
c2snCgkJaW5kZXggMgoJCXZhbHVlICcwZjAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwJwoJ
CWNvbW1lbnQgewoJCQlhY2Nlc3MgcmVhZAoJCQl0eXBlIElFQzk1OAoJCQljb3VudCAxCgkJ
fQoJfQoJY29udHJvbC4xNiB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdJRUM5NTggUGxheWJh
Y2sgRGVmYXVsdCcKCQlpbmRleCAyCgkJdmFsdWUgJzA0MDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAnCgkJY29tbWVudCB7CgkJCWFjY2VzcyAncmVhZCB3cml0ZScKCQkJdHlwZSBJRUM5
NTgKCQkJY291bnQgMQoJCX0KCX0KCWNvbnRyb2wuMTcgewoJCWlmYWNlIE1JWEVSCgkJbmFt
ZSAnSUVDOTU4IFBsYXliYWNrIFN3aXRjaCcKCQlpbmRleCAyCgkJdmFsdWUgdHJ1ZQoJCWNv
bW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUnCgkJCXR5cGUgQk9PTEVBTgoJCQljb3Vu
dCAxCgkJfQoJfQoJY29udHJvbC4xOCB7CgkJaWZhY2UgUENNCgkJZGV2aWNlIDgKCQluYW1l
IEVMRAoJCXZhbHVlICcxMDAwMDYwMDY1MTQwMDAxMDAwMDAwMDAwMDAwMDAwMDA0NjlhNDI0
NTY0NzMyMzQzODA5MDcwNycKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHZvbGF0aWxl
JwoJCQl0eXBlIEJZVEVTCgkJCWNvdW50IDI4CgkJfQoJfQoJY29udHJvbC4xOSB7CgkJaWZh
Y2UgQ0FSRAoJCW5hbWUgJ0hETUkvRFAscGNtPTkgSmFjaycKCQl2YWx1ZSBmYWxzZQoJCWNv
bW1lbnQgewoJCQlhY2Nlc3MgcmVhZAoJCQl0eXBlIEJPT0xFQU4KCQkJY291bnQgMQoJCX0K
CX0KCWNvbnRyb2wuMjAgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnSUVDOTU4IFBsYXliYWNr
IENvbiBNYXNrJwoJCWluZGV4IDMKCQl2YWx1ZSAnMGZmZjAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMCcKCQljb21tZW50IHsKCQkJYWNjZXNzIHJlYWQKCQkJdHlwZSBJRUM5NTgKCQkJY291
bnQgMQoJCX0KCX0KCWNvbnRyb2wuMjEgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnSUVDOTU4
IFBsYXliYWNrIFBybyBNYXNrJwoJCWluZGV4IDMKCQl2YWx1ZSAnMGYwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMCcKCQljb21tZW50IHsKCQkJYWNjZXNzIHJlYWQKCQkJdHlwZSBJRUM5
NTgKCQkJY291bnQgMQoJCX0KCX0KCWNvbnRyb2wuMjIgewoJCWlmYWNlIE1JWEVSCgkJbmFt
ZSAnSUVDOTU4IFBsYXliYWNrIERlZmF1bHQnCgkJaW5kZXggMwoJCXZhbHVlICcwNDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwJwoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3Jp
dGUnCgkJCXR5cGUgSUVDOTU4CgkJCWNvdW50IDEKCQl9Cgl9Cgljb250cm9sLjIzIHsKCQlp
ZmFjZSBNSVhFUgoJCW5hbWUgJ0lFQzk1OCBQbGF5YmFjayBTd2l0Y2gnCgkJaW5kZXggMwoJ
CXZhbHVlIHRydWUKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBl
IEJPT0xFQU4KCQkJY291bnQgMQoJCX0KCX0KCWNvbnRyb2wuMjQgewoJCWlmYWNlIFBDTQoJ
CWRldmljZSA5CgkJbmFtZSBFTEQKCQl2YWx1ZSAnJwoJCWNvbW1lbnQgewoJCQlhY2Nlc3Mg
J3JlYWQgdm9sYXRpbGUnCgkJCXR5cGUgQllURVMKCQkJY291bnQgMAoJCX0KCX0KCWNvbnRy
b2wuMjUgewoJCWlmYWNlIFBDTQoJCWRldmljZSAzCgkJbmFtZSAnUGxheWJhY2sgQ2hhbm5l
bCBNYXAnCgkJdmFsdWUuMCAwCgkJdmFsdWUuMSAwCgkJdmFsdWUuMiAwCgkJdmFsdWUuMyAw
CgkJdmFsdWUuNCAwCgkJdmFsdWUuNSAwCgkJdmFsdWUuNiAwCgkJdmFsdWUuNyAwCgkJY29t
bWVudCB7CgkJCWFjY2VzcyAncmVhZCB3cml0ZSB2b2xhdGlsZScKCQkJdHlwZSBJTlRFR0VS
CgkJCWNvdW50IDgKCQkJcmFuZ2UgJzAgLSAzNicKCQl9Cgl9Cgljb250cm9sLjI2IHsKCQlp
ZmFjZSBQQ00KCQlkZXZpY2UgNwoJCW5hbWUgJ1BsYXliYWNrIENoYW5uZWwgTWFwJwoJCXZh
bHVlLjAgMAoJCXZhbHVlLjEgMAoJCXZhbHVlLjIgMAoJCXZhbHVlLjMgMAoJCXZhbHVlLjQg
MAoJCXZhbHVlLjUgMAoJCXZhbHVlLjYgMAoJCXZhbHVlLjcgMAoJCWNvbW1lbnQgewoJCQlh
Y2Nlc3MgJ3JlYWQgd3JpdGUgdm9sYXRpbGUnCgkJCXR5cGUgSU5URUdFUgoJCQljb3VudCA4
CgkJCXJhbmdlICcwIC0gMzYnCgkJfQoJfQoJY29udHJvbC4yNyB7CgkJaWZhY2UgUENNCgkJ
ZGV2aWNlIDgKCQluYW1lICdQbGF5YmFjayBDaGFubmVsIE1hcCcKCQl2YWx1ZS4wIDAKCQl2
YWx1ZS4xIDAKCQl2YWx1ZS4yIDAKCQl2YWx1ZS4zIDAKCQl2YWx1ZS40IDAKCQl2YWx1ZS41
IDAKCQl2YWx1ZS42IDAKCQl2YWx1ZS43IDAKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFk
IHdyaXRlIHZvbGF0aWxlJwoJCQl0eXBlIElOVEVHRVIKCQkJY291bnQgOAoJCQlyYW5nZSAn
MCAtIDM2JwoJCX0KCX0KCWNvbnRyb2wuMjggewoJCWlmYWNlIFBDTQoJCWRldmljZSA5CgkJ
bmFtZSAnUGxheWJhY2sgQ2hhbm5lbCBNYXAnCgkJdmFsdWUuMCAwCgkJdmFsdWUuMSAwCgkJ
dmFsdWUuMiAwCgkJdmFsdWUuMyAwCgkJdmFsdWUuNCAwCgkJdmFsdWUuNSAwCgkJdmFsdWUu
NiAwCgkJdmFsdWUuNyAwCgkJY29tbWVudCB7CgkJCWFjY2VzcyAncmVhZCB3cml0ZSB2b2xh
dGlsZScKCQkJdHlwZSBJTlRFR0VSCgkJCWNvdW50IDgKCQkJcmFuZ2UgJzAgLSAzNicKCQl9
Cgl9Cn0KLS1lbmRjb2xsYXBzZS0tCgoKISFBbGwgTG9hZGVkIE1vZHVsZXMKISEtLS0tLS0t
LS0tLS0tLS0tLS0KCjg0Ml9jb21wcmVzcwo4NDJfZGVjb21wcmVzcwphYzk3X2J1cwphY3Bp
X3BhZAphY3BpX3RhZAphZXNuaV9pbnRlbAphZl9hbGcKYWxnaWZfaGFzaAphbGdpZl9za2Np
cGhlcgphbWRncHUKYW1keGNwCmF1dGhfcnBjZ3NzCmJsdWV0b290aApibmVwCmJ0YmNtCmJ0
aW50ZWwKYnRtdGsKYnRydGwKYnR1c2IKY2VjCmNmZzgwMjExCmNtYWMKY29yZXRlbXAKY3Jj
OApjcnlwdG9fdXNlcgpkbV9tb2QKZG5zX3Jlc29sdmVyCmRybV9idWRkeQpkcm1fZGlzcGxh
eV9oZWxwZXIKZHJtX2V4ZWMKZHJtX3BhbmVsX2JhY2tsaWdodF9xdWlya3MKZHJtX3N1YmFs
bG9jX2hlbHBlcgpkcm1fdHRtX2hlbHBlcgplZTEwMDQKZmF0CmdoYXNoX2NsbXVsbmlfaW50
ZWwKZ3B1X3NjaGVkCmdyYWNlCmhpZF9sb2dpdGVjaF9kagpoaWRfbG9naXRlY2hfaGlkcHAK
aGtkZgppMmNfYWxnb19iaXQKaTJjX2RldgppMmNfaTgwMQppMmNfbXV4CmkyY19zbWJ1cwpp
VENPX3ZlbmRvcl9zdXBwb3J0CmlUQ09fd2R0CmludGVsX2NzdGF0ZQppbnRlbF9vY193ZHQK
aW50ZWxfcGNoX3RoZXJtYWwKaW50ZWxfcG1jX2J4dAppbnRlbF9wbWNfY29yZQppbnRlbF9w
bWNfc3NyYW1fdGVsZW1ldHJ5CmludGVsX3Bvd2VyY2xhbXAKaW50ZWxfcmFwbF9jb21tb24K
aW50ZWxfcmFwbF9tc3IKaW50ZWxfdGNjX2Nvb2xpbmcKaW50ZWxfdW5jb3JlCmludGVsX3Vu
Y29yZV9mcmVxdWVuY3kKaW50ZWxfdW5jb3JlX2ZyZXF1ZW5jeV9jb21tb24KaW50ZWxfdnNl
YwppbnRlbF93bWlfdGh1bmRlcmJvbHQKaXJxYnlwYXNzCml3bG12bQppd2x3aWZpCmpveWRl
dgprdm0Ka3ZtX2ludGVsCmxpYmFyYzQKbGlicGh5CmxvY2tkCmxvb3AKbHo0X2NvbXByZXNz
Cmx6NGhjX2NvbXByZXNzCm1hYzgwMjExCm1hY19oaWQKbWMKbWRpb19idXMKbWRpb19kZXZy
ZXMKbW91c2VkZXYKbXRkCm14bV93bWkKbmV0ZnMKbmZuZXRsaW5rCm5mcwpuZnNfYWNsCm5m
c19sb2NhbGlvCm5mc3YzCm5mc3Y0Cm52bWUKbnZtZV9hdXRoCm52bWVfY29yZQpudm1lX2tl
eXJpbmcKcG10X2NsYXNzCnBtdF9kaXNjb3ZlcnkKcG10X3RlbGVtZXRyeQpwcHNfY29yZQpw
dHAKcXJ0cgpyODE2OQpyYXBsCnJlYWx0ZWsKcmZjb21tCnJma2lsbApycGNzZWNfZ3NzX2ty
YjUKc25kCnNuZF9jb21wcmVzcwpzbmRfaGRhX2NvZGVjCnNuZF9oZGFfY29kZWNfYWxjODgy
CnNuZF9oZGFfY29kZWNfYXRpaGRtaQpzbmRfaGRhX2NvZGVjX2dlbmVyaWMKc25kX2hkYV9j
b2RlY19oZG1pCnNuZF9oZGFfY29kZWNfcmVhbHRla19saWIKc25kX2hkYV9jb3JlCnNuZF9o
ZGFfZXh0X2NvcmUKc25kX2hkYV9pbnRlbApzbmRfaHJ0aW1lcgpzbmRfaHdkZXAKc25kX2lu
dGVsX2RzcGNmZwpzbmRfaW50ZWxfc2R3X2FjcGkKc25kX3BjbQpzbmRfcGNtX2RtYWVuZ2lu
ZQpzbmRfcmF3bWlkaQpzbmRfc2VxCnNuZF9zZXFfZGV2aWNlCnNuZF9zZXFfZHVtbXkKc25k
X3NvY19hY3BpCnNuZF9zb2NfYWNwaV9pbnRlbF9tYXRjaApzbmRfc29jX2FjcGlfaW50ZWxf
c2RjYV9xdWlya3MKc25kX3NvY19hdnMKc25kX3NvY19jb3JlCnNuZF9zb2NfaGRhX2NvZGVj
CnNuZF9zb2NfaGRhY19oZGEKc25kX3NvY19zZGNhCnNuZF9zb2Nfc2R3X3V0aWxzCnNuZF9z
b2YKc25kX3NvZl9pbnRlbF9oZGEKc25kX3NvZl9pbnRlbF9oZGFfY29tbW9uCnNuZF9zb2Zf
aW50ZWxfaGRhX2dlbmVyaWMKc25kX3NvZl9pbnRlbF9oZGFfbWxpbmsKc25kX3NvZl9pbnRl
bF9oZGFfc2R3X2JwdApzbmRfc29mX3BjaQpzbmRfc29mX3BjaV9pbnRlbF9jbmwKc25kX3Nv
Zl91dGlscwpzbmRfc29mX3h0ZW5zYV9kc3AKc25kX3RpbWVyCnNuZF91bXAKc25kX3VzYl9h
dWRpbwpzbmRfdXNibWlkaV9saWIKc291bmRjb3JlCnNvdW5kd2lyZV9idXMKc291bmR3aXJl
X2NhZGVuY2UKc291bmR3aXJlX2dlbmVyaWNfYWxsb2NhdGlvbgpzb3VuZHdpcmVfaW50ZWwK
c3BpX2ludGVsCnNwaV9pbnRlbF9wY2kKc3BpX25vcgpzcXVhc2hmcwpzdW5ycGMKdHRtCnVp
bnB1dAp2ZmF0CnZpZGVvCndtaQp3bWlfYm1vZgp4ODZfcGtnX3RlbXBfdGhlcm1hbAp6cmFt
CgoKISFTeXNmcyBGaWxlcwohIS0tLS0tLS0tLS0tCgovc3lzL2NsYXNzL3NvdW5kL2h3QzFE
MC9pbml0X3Bpbl9jb25maWdzOgoweDExIDB4NDAzN2M1NDAKMHgxNCAweDAxMDE1MDEwCjB4
MTUgMHgwMTAxMTAxMgoweDE2IDB4MDEwMTEwMTEKMHgxNyAweDQxMTExMWYwCjB4MTggMHgw
MWExMTA0MAoweDE5IDB4MDJhMTkwNTAKMHgxYSAweDAxODExMDRmCjB4MWIgMHgwMjIxNDAy
MAoweDFlIDB4MDE0NTExMzAKCi9zeXMvY2xhc3Mvc291bmQvaHdDMUQwL2RyaXZlcl9waW5f
Y29uZmlnczoKCi9zeXMvY2xhc3Mvc291bmQvaHdDMUQwL3VzZXJfcGluX2NvbmZpZ3M6Cgov
c3lzL2NsYXNzL3NvdW5kL2h3QzFEMC9pbml0X3ZlcmJzOgoKL3N5cy9jbGFzcy9zb3VuZC9o
d0MxRDAvaGludHM6Cgovc3lzL2NsYXNzL3NvdW5kL2h3QzJEMC9pbml0X3Bpbl9jb25maWdz
OgoweDAzIDB4MTg1NjAwZjAKMHgwNSAweDE4NTYwMGYwCjB4MDcgMHgxODU2MDBmMAoweDA5
IDB4MTg1NjAwZjAKMHgwYiAweDU4NTYwMGYwCgovc3lzL2NsYXNzL3NvdW5kL2h3QzJEMC9k
cml2ZXJfcGluX2NvbmZpZ3M6Cgovc3lzL2NsYXNzL3NvdW5kL2h3QzJEMC91c2VyX3Bpbl9j
b25maWdzOgoKL3N5cy9jbGFzcy9zb3VuZC9od0MyRDAvaW5pdF92ZXJiczoKCi9zeXMvY2xh
c3Mvc291bmQvaHdDMkQwL2hpbnRzOgoKCiEhQUxTQS9IREEgZG1lc2cKISEtLS0tLS0tLS0t
LS0tLQoKCgo=

--ee43de043b784df695dcc9df47ae1e13--
