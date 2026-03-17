Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67613947A3;
	Tue, 17 Mar 2026 08:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737884; cv=none; b=nCEkG0VNNgFBxAOpGncvfyLZx6Xjy6LdqOyYuP0SWf17Zxff85Ah9WosFWMV5b8Q729Q7104lRSQE3j/xW4eOm0wyxQKPn/YB8nKlAKtDmuoOOZ2Hke+VsAAHKI+3PFnB5bZHbdFOGT7GdL3C5zFEo7y+P9uxlZBVomm7kb1YGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737884; c=relaxed/simple;
	bh=k63wk8AqYTOxc3nJUesLVf4Smashd53ggTc0rj7nuzY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hFvOZcXGWv9f8OLRvoOD7CRxIdLAOiZ1bhBfnLXPAU+TXwsUHfAanHcaYn9vswM2t2x30d0nAZVVHH5ED5S2z7qvn7AbyGbI3Kq83I9K98hECpG1R+wew3BNs1Xc6zG69LeXQjRKAS9pVlL6yNsjHcQTLbV6FPTJp49qWm1NDHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jaytek.org; spf=pass smtp.mailfrom=jaytek.org; dkim=pass (2048-bit key) header.d=jaytek.org header.i=@jaytek.org header.b=KHt9yR5T; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=swbs2iKA; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jaytek.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaytek.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaytek.org header.i=@jaytek.org header.b="KHt9yR5T";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="swbs2iKA"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F180B7A0130;
	Tue, 17 Mar 2026 04:58:00 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Tue, 17 Mar 2026 04:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaytek.org; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1773737880; x=1773824280; bh=ydahxEJGYg
	9OI2JAlJtzLju7Ws2IIGS7gSMRuxym0L8=; b=KHt9yR5TYnY1ZiFYbCzRejasPe
	JBq9kBqhLnKgQw/i5aANBYe2TRMj5WlhJRd28fJoTSvhk8MXqNQtidAmf4f8CDVc
	nARSlrUKpC9xKtcjBPmIVd/s5IbKCWuGcss1HLcCaxH6q94GSfSjanriM8Lls07D
	/3/RcxZBpRg6N1iElvz74zYT8O22BravCHCP2Iu2rkO+XJjA3KxZQP+P6Z83ODmn
	RKB5OZ5+YEzdNUlTGkgVld8ku+f9RUaYNTApNGdh+kmPpAj2xpS1uN+tdcMkJWE6
	VPI1Du+a+BCwbaM7wh+FOLbfOtZNn3AmNIZiXcxL2k1P5Smf+/RXDU9VhaKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773737880; x=1773824280; bh=ydahxEJGYg9OI2JAlJtzLju7Ws2IIGS7gSM
	Ruxym0L8=; b=swbs2iKA5i4RyBikdDbAQCQM7zTYdC+Jb/x3TRNSfa0ouWqdvz7
	v14Fwvr5tjbKBvp4AV0kwJNTbKbqQb0ftHC/0aH28w6rizyZ214g5epjbXCynxir
	bIWObUZL6N716/T9qzcPQ3g3jMEzgNWfSprxWGh75jmop49Wx9DCVBzvTJyHn9C2
	yKyL3YFxSu3DUEZbs3ttfXO3NlnwDDK09mLIcpQorTZZbUkwteduseBq4tYuTl1B
	w+1jaeJiGs7ngZf0vSiNvX+Lya5830cwKVpiIvEVgM9K5rQ6/MWYYoT8V/dPb9g7
	oZAZM0LI//fGxP6YgIdCR8y9Dochy8+pW5g==
X-ME-Sender: <xms:mBe5aWryi56EU3_b-VBWqe4WoSpX-BEbjT3kQOjI5wH8YRQi08-xRA>
    <xme:mBe5afdGqH5Pcema52P6kuOSsihHqheEN_QirJU50__zlqxhSsd_NFT3pvJOuEhYb
    SuonQUsauGE3ZcRGnib2hH6OJTPBeX2VddtBHGR4uTk71FYZDdueUCk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftddtkeefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:mBe5aX0dF_IC00-0NgLBd2onblKm41PPD5hc3115SVDVPebevh3MvA>
    <xmx:mBe5afA1jnGwzvFEP_IYQYHI0PcVWdjRH1yVnilZIpWnsjHVBkhaVg>
    <xmx:mBe5aTffe02vuW8p5qyYZz350bXSKk-yEaPlAqWjNk4CG7_WJ2fErA>
    <xmx:mBe5ac61brh_fxPHVkTfzhdiDygjPcCShNohxopiDzcSfJuEMdl5bg>
    <xmx:mBe5aSlMWTojPWVrnY--sDGMtlSTJ2OlUIHwqgS6beHteKYWS8oI2JgD>
Feedback-ID: i7b2e480f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EF7D0C4007B; Tue, 17 Mar 2026 04:57:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AhnqQAqBDVes
Date: Tue, 17 Mar 2026 03:57:39 -0500
From: James <james@jaytek.org>
To: "Takashi Iwai" <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <92a9a89d-e445-4816-bfa5-8127f2e535db@app.fastmail.com>
In-Reply-To: <87ikav7lcy.wl-tiwai@suse.de>
References: <20260315101950.130380-1-james@jaytek.org>
 <87ikav7lcy.wl-tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/realtek: Enable rear line-out pins on MSI EC79
 (ALCS1200A)
Content-Type: multipart/mixed;
 boundary=a11ee50f0a544f27954a34f235835d2e

--a11ee50f0a544f27954a34f235835d2e
Content-Type: multipart/alternative;
 boundary=b1e02267a1624f2c90337cecb438ecdb

--b1e02267a1624f2c90337cecb438ecdb
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,
alsa-info output attached (--no-upload). Note: this was captured after applying a userspace workaround that
forces pin-ctls=0x40 (PIN_OUT) on NID 0x14. Let me know if you'd prefer a capture from a clean boot state.
Thanks,
Signed-off-by: James Waschbisch <james@jaytek.org>

On Mon, Mar 16, 2026, at 12:08 PM, Takashi Iwai wrote:
> On Sun, 15 Mar 2026 11:19:50 +0100,
> James Waschbisch wrote:
> > 
> > On MSI systems with subsystem ID 1462:ec79 using the Realtek ALCS1200A
> > codec, the rear line-out pins (0x14, 0x15, 0x16) are parsed as line
> > outputs but do not come up with active pin widget control after boot.
> > This leaves analog output on the rear jacks unavailable until userspace
> > manually reprograms the codec.
> > 
> > Add a board-specific fixup that disables line-out/speaker automute and
> > forces pins 0x14, 0x15, and 0x16 to PIN_OUT during HDA_FIXUP_ACT_INIT,
> > while also clearing the output amp mute on those nodes.
> > 
> > Tested-on: MSI X570 Gaming Pro WiFi (1462:ec79, ALCS1200A)
> > 
> > Signed-off-by: James Waschbisch <james@jaytek.org>
> 
> When this kind of changes like the manual amp updates or pin control
> fiddling are needed, usually something else is missing.
> Could you give alsa-info.sh output for further investigation?
> Run the script with --no-upload option and attach the output.
> 
> 
> thanks,
> 
> Takashi
> 
> > ---
> >  sound/hda/codecs/realtek/alc882.c | 38 +++++++++++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> > 
> > diff --git a/sound/hda/codecs/realtek/alc882.c b/sound/hda/codecs/realtek/alc882.c
> > index 529fecd5b..2bf266a25 100644
> > --- a/sound/hda/codecs/realtek/alc882.c
> > +++ b/sound/hda/codecs/realtek/alc882.c
> > @@ -60,6 +60,7 @@ enum {
> >  ALC887_FIXUP_ASUS_AUDIO,
> >  ALC887_FIXUP_ASUS_HMIC,
> >  ALCS1200A_FIXUP_MIC_VREF,
> > + ALCS1200A_FIXUP_MSI_EC79,
> >  ALC888VD_FIXUP_MIC_100VREF,
> >  };
> >  
> > @@ -261,6 +262,36 @@ static void alc887_fixup_asus_jack(struct hda_codec *codec,
> >  spec->gen.hp_automute_hook = alc887_asus_hp_automute_hook;
> >  }
> >  
> > +static void alcs1200a_fixup_msi_ec79(struct hda_codec *codec,
> > +      const struct hda_fixup *fix, int action)
> > +{
> > + struct alc_spec *spec = codec->spec;
> > +
> > + if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> > + spec->gen.automute_lo = 0;
> > + spec->gen.automute_speaker = 0;
> > + return;
> > + }
> > +
> > + if (action != HDA_FIXUP_ACT_INIT)
> > + return;
> > +
> > + /* Front / Surround / CLFE line-out pins */
> > + snd_hda_set_pin_ctl(codec, 0x14, PIN_OUT);
> > + snd_hda_set_pin_ctl(codec, 0x15, PIN_OUT);
> > + snd_hda_set_pin_ctl(codec, 0x16, PIN_OUT);
> > +
> > + /* Unmute both output amp channels on all three pins */
> > + snd_hda_codec_amp_update(codec, 0x14, 0, HDA_OUTPUT, 0, 0x80, 0);
> > + snd_hda_codec_amp_update(codec, 0x14, 1, HDA_OUTPUT, 0, 0x80, 0);
> > +
> > + snd_hda_codec_amp_update(codec, 0x15, 0, HDA_OUTPUT, 0, 0x80, 0);
> > + snd_hda_codec_amp_update(codec, 0x15, 1, HDA_OUTPUT, 0, 0x80, 0);
> > +
> > + snd_hda_codec_amp_update(codec, 0x16, 0, HDA_OUTPUT, 0, 0x80, 0);
> > + snd_hda_codec_amp_update(codec, 0x16, 1, HDA_OUTPUT, 0, 0x80, 0);
> > +}
> > +
> >  static const struct hda_fixup alc882_fixups[] = {
> >  [ALC882_FIXUP_ABIT_AW9D_MAX] = {
> >  .type = HDA_FIXUP_PINS,
> > @@ -553,6 +584,12 @@ static const struct hda_fixup alc882_fixups[] = {
> >  {}
> >  }
> >  },
> > + [ALCS1200A_FIXUP_MSI_EC79] = {
> > + .type = HDA_FIXUP_FUNC,
> > + .v.func = alcs1200a_fixup_msi_ec79,
> > + .chained = true,
> > + .chain_id = ALCS1200A_FIXUP_MIC_VREF,
> > + },
> >  [ALC888VD_FIXUP_MIC_100VREF] = {
> >  .type = HDA_FIXUP_PINCTLS,
> >  .v.pins = (const struct hda_pintbl[]) {
> > @@ -636,6 +673,7 @@ static const struct hda_quirk alc882_fixup_tbl[] = {
> >  SND_PCI_QUIRK(0x1458, 0xa0cd, "Gigabyte X570 Aorus Master", ALC1220_FIXUP_GB_X570),
> >  SND_PCI_QUIRK(0x1458, 0xa0ce, "Gigabyte X570 Aorus Xtreme", ALC1220_FIXUP_GB_X570),
> >  SND_PCI_QUIRK(0x1458, 0xa0d5, "Gigabyte X570S Aorus Master", ALC1220_FIXUP_GB_X570),
> > + SND_PCI_QUIRK(0x1462, 0xec79, "MSI ALCS1200A", ALCS1200A_FIXUP_MSI_EC79),
> >  SND_PCI_QUIRK(0x1462, 0x11f7, "MSI-GE63", ALC1220_FIXUP_CLEVO_P950),
> >  SND_PCI_QUIRK(0x1462, 0x1228, "MSI-GP63", ALC1220_FIXUP_CLEVO_P950),
> >  SND_PCI_QUIRK(0x1462, 0x1229, "MSI-GP73", ALC1220_FIXUP_CLEVO_P950),
> > -- 
> > 2.53.0
> > 
> 

--b1e02267a1624f2c90337cecb438ecdb
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title></head><body><div>Hello,<br></=
div><div>alsa-info output attached (--no-upload). Note: this was capture=
d after applying a userspace workaround that</div><div>forces pin-ctls=3D=
0x40 (PIN_OUT) on NID 0x14. Let me know if you'd prefer a capture from a=
 clean boot state.<br></div><div>Thanks,</div><div>Signed-off-by: James =
Waschbisch &lt;<a href=3D"mailto:james@jaytek.org">james@jaytek.org</a>&=
gt;</div><div><br></div><div>On Mon, Mar 16, 2026, at 12:08 PM, Takashi =
Iwai wrote:</div><blockquote type=3D"cite" id=3D"qt" style=3D""><div>On =
Sun, 15 Mar 2026 11:19:50 +0100,</div><div>James Waschbisch wrote:</div>=
<div>&gt;&nbsp;</div><div>&gt; On MSI systems with subsystem ID 1462:ec7=
9 using the Realtek ALCS1200A</div><div>&gt; codec, the rear line-out pi=
ns (0x14, 0x15, 0x16) are parsed as line</div><div>&gt; outputs but do n=
ot come up with active pin widget control after boot.</div><div>&gt; Thi=
s leaves analog output on the rear jacks unavailable until userspace</di=
v><div>&gt; manually reprograms the codec.</div><div>&gt;&nbsp;</div><di=
v>&gt; Add a board-specific fixup that disables line-out/speaker automut=
e and</div><div>&gt; forces pins 0x14, 0x15, and 0x16 to PIN_OUT during =
HDA_FIXUP_ACT_INIT,</div><div>&gt; while also clearing the output amp mu=
te on those nodes.</div><div>&gt;&nbsp;</div><div>&gt; Tested-on: MSI X5=
70 Gaming Pro WiFi (1462:ec79, ALCS1200A)</div><div>&gt;&nbsp;</div><div=
>&gt; Signed-off-by: James Waschbisch &lt;<a href=3D"mailto:james@jaytek=
.org">james@jaytek.org</a>&gt;</div><div><br></div><div>When this kind o=
f changes like the manual amp updates or pin control</div><div>fiddling =
are needed, usually something else is missing.</div><div>Could you give&=
nbsp;<a href=3D"http://alsa-info.sh">alsa-info.sh</a> output for further=
 investigation?</div><div>Run the script with --no-upload option and att=
ach the output.</div><div><br></div><div><br></div><div>thanks,</div><di=
v><br></div><div>Takashi</div><div><br></div><div>&gt; ---</div><div>&gt=
;&nbsp; sound/hda/codecs/realtek/alc882.c | 38 +++++++++++++++++++++++++=
++++++</div><div>&gt;&nbsp; 1 file changed, 38 insertions(+)</div><div>&=
gt;&nbsp;</div><div>&gt; diff --git a/sound/hda/codecs/realtek/alc882.c =
b/sound/hda/codecs/realtek/alc882.c</div><div>&gt; index 529fecd5b..2bf2=
66a25 100644</div><div>&gt; --- a/sound/hda/codecs/realtek/alc882.c</div=
><div>&gt; +++ b/sound/hda/codecs/realtek/alc882.c</div><div>&gt; @@ -60=
,6 +60,7 @@ enum {</div><div>&gt;&nbsp; 	ALC887_FIXUP_ASUS_AUDIO,</div><=
div>&gt;&nbsp; 	ALC887_FIXUP_ASUS_HMIC,</div><div>&gt;&nbsp; 	ALCS1200A_=
FIXUP_MIC_VREF,</div><div>&gt; +	ALCS1200A_FIXUP_MSI_EC79,</div><div>&gt=
;&nbsp; 	ALC888VD_FIXUP_MIC_100VREF,</div><div>&gt;&nbsp; };</div><div>&=
gt;&nbsp;&nbsp;</div><div>&gt; @@ -261,6 +262,36 @@ static void alc887_f=
ixup_asus_jack(struct hda_codec *codec,</div><div>&gt;&nbsp; 	spec-&gt;g=
en.hp_automute_hook =3D alc887_asus_hp_automute_hook;</div><div>&gt;&nbs=
p; }</div><div>&gt;&nbsp;&nbsp;</div><div>&gt; +static void alcs1200a_fi=
xup_msi_ec79(struct hda_codec *codec,</div><div>&gt; +				&nbsp;&nbsp;&n=
bsp;&nbsp; const struct hda_fixup *fix, int action)</div><div>&gt; +{</d=
iv><div>&gt; +	struct alc_spec *spec =3D codec-&gt;spec;</div><div>&gt; =
+</div><div>&gt; +	if (action =3D=3D HDA_FIXUP_ACT_PRE_PROBE) {</div><di=
v>&gt; +		spec-&gt;gen.automute_lo =3D 0;</div><div>&gt; +		spec-&gt;gen=
.automute_speaker =3D 0;</div><div>&gt; +		return;</div><div>&gt; +	}</d=
iv><div>&gt; +</div><div>&gt; +	if (action !=3D HDA_FIXUP_ACT_INIT)</div=
><div>&gt; +		return;</div><div>&gt; +</div><div>&gt; +	/* Front / Surro=
und / CLFE line-out pins */</div><div>&gt; +	snd_hda_set_pin_ctl(codec, =
0x14, PIN_OUT);</div><div>&gt; +	snd_hda_set_pin_ctl(codec, 0x15, PIN_OU=
T);</div><div>&gt; +	snd_hda_set_pin_ctl(codec, 0x16, PIN_OUT);</div><di=
v>&gt; +</div><div>&gt; +	/* Unmute both output amp channels on all thre=
e pins */</div><div>&gt; +	snd_hda_codec_amp_update(codec, 0x14, 0, HDA_=
OUTPUT, 0, 0x80, 0);</div><div>&gt; +	snd_hda_codec_amp_update(codec, 0x=
14, 1, HDA_OUTPUT, 0, 0x80, 0);</div><div>&gt; +</div><div>&gt; +	snd_hd=
a_codec_amp_update(codec, 0x15, 0, HDA_OUTPUT, 0, 0x80, 0);</div><div>&g=
t; +	snd_hda_codec_amp_update(codec, 0x15, 1, HDA_OUTPUT, 0, 0x80, 0);</=
div><div>&gt; +</div><div>&gt; +	snd_hda_codec_amp_update(codec, 0x16, 0=
, HDA_OUTPUT, 0, 0x80, 0);</div><div>&gt; +	snd_hda_codec_amp_update(cod=
ec, 0x16, 1, HDA_OUTPUT, 0, 0x80, 0);</div><div>&gt; +}</div><div>&gt; +=
</div><div>&gt;&nbsp; static const struct hda_fixup alc882_fixups[] =3D =
{</div><div>&gt;&nbsp; 	[ALC882_FIXUP_ABIT_AW9D_MAX] =3D {</div><div>&gt=
;&nbsp; 		.type =3D HDA_FIXUP_PINS,</div><div>&gt; @@ -553,6 +584,12 @@ =
static const struct hda_fixup alc882_fixups[] =3D {</div><div>&gt;&nbsp;=
 			{}</div><div>&gt;&nbsp; 		}</div><div>&gt;&nbsp; 	},</div><div>&gt; =
+	[ALCS1200A_FIXUP_MSI_EC79] =3D {</div><div>&gt; +		.type =3D HDA_FIXUP=
_FUNC,</div><div>&gt; +		.v.func =3D alcs1200a_fixup_msi_ec79,</div><div=
>&gt; +		.chained =3D true,</div><div>&gt; +		.chain_id =3D ALCS1200A_FI=
XUP_MIC_VREF,</div><div>&gt; +	},</div><div>&gt;&nbsp; 	[ALC888VD_FIXUP_=
MIC_100VREF] =3D {</div><div>&gt;&nbsp; 		.type =3D HDA_FIXUP_PINCTLS,</=
div><div>&gt;&nbsp; 		.v.pins =3D (const struct hda_pintbl[]) {</div><di=
v>&gt; @@ -636,6 +673,7 @@ static const struct hda_quirk alc882_fixup_tb=
l[] =3D {</div><div>&gt;&nbsp; 	SND_PCI_QUIRK(0x1458, 0xa0cd, "Gigabyte =
X570 Aorus Master", ALC1220_FIXUP_GB_X570),</div><div>&gt;&nbsp; 	SND_PC=
I_QUIRK(0x1458, 0xa0ce, "Gigabyte X570 Aorus Xtreme", ALC1220_FIXUP_GB_X=
570),</div><div>&gt;&nbsp; 	SND_PCI_QUIRK(0x1458, 0xa0d5, "Gigabyte X570=
S Aorus Master", ALC1220_FIXUP_GB_X570),</div><div>&gt; +	SND_PCI_QUIRK(=
0x1462, 0xec79, "MSI ALCS1200A", ALCS1200A_FIXUP_MSI_EC79),</div><div>&g=
t;&nbsp; 	SND_PCI_QUIRK(0x1462, 0x11f7, "MSI-GE63", ALC1220_FIXUP_CLEVO_=
P950),</div><div>&gt;&nbsp; 	SND_PCI_QUIRK(0x1462, 0x1228, "MSI-GP63", A=
LC1220_FIXUP_CLEVO_P950),</div><div>&gt;&nbsp; 	SND_PCI_QUIRK(0x1462, 0x=
1229, "MSI-GP73", ALC1220_FIXUP_CLEVO_P950),</div><div>&gt; --&nbsp;</di=
v><div>&gt; 2.53.0</div><div>&gt;&nbsp;</div><div><br></div></blockquote=
><div><br></div></body></html>
--b1e02267a1624f2c90337cecb438ecdb--

--a11ee50f0a544f27954a34f235835d2e
Content-Disposition: attachment; filename="alsa-info.txt.5kXu6nmjKf"
Content-Type: application/octet-stream; name="alsa-info.txt.5kXu6nmjKf"
Content-Transfer-Encoding: base64

dXBsb2FkPXRydWUmc2NyaXB0PXRydWUmY2FyZGluZm89CiEhIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKISFBTFNBIEluZm9ybWF0aW9uIFNjcmlwdCB2IDAuNS4zCiEhIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKCiEhU2NyaXB0IHJhbiBvbjogVHVlIE1h
ciAxNyAwODo1MDoyOCBVVEMgMjAyNgoKCiEhTGludXggRGlzdHJpYnV0aW9uCiEhLS0tLS0t
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
b2xsYXBzZS0tCgpDb2RlYzogUmVhbHRlayBHZW5lcmljCkFkZHJlc3M6IDAKQUZHIEZ1bmN0
aW9uIElkOiAweDEgKHVuc29sIDEpClZlbmRvciBJZDogMHgxMGVjMGIwMApTdWJzeXN0ZW0g
SWQ6IDB4MTQ2MmVjNzkKUmV2aXNpb24gSWQ6IDB4MTAwMDAxCk5vIE1vZGVtIEZ1bmN0aW9u
IEdyb3VwIGZvdW5kCkRlZmF1bHQgUENNOgogICAgcmF0ZXMgWzB4NWYwXTogMzIwMDAgNDQx
MDAgNDgwMDAgODgyMDAgOTYwMDAgMTkyMDAwCiAgICBiaXRzIFsweGVdOiAxNiAyMCAyNAog
ICAgZm9ybWF0cyBbMHgxXTogUENNCkRlZmF1bHQgQW1wLUluIGNhcHM6IE4vQQpEZWZhdWx0
IEFtcC1PdXQgY2FwczogTi9BClN0YXRlIG9mIEFGRyBub2RlIDB4MDE6CiAgUG93ZXIgc3Rh
dGVzOiAgRDAgRDEgRDIgRDMgQ0xLU1RPUCBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFj
dHVhbD1EMApHUElPOiBpbz0yLCBvPTAsIGk9MCwgdW5zb2xpY2l0ZWQ9MSwgd2FrZT0wCiAg
SU9bMF06IGVuYWJsZT0wLCBkaXI9MCwgd2FrZT0wLCBzdGlja3k9MCwgZGF0YT0wLCB1bnNv
bD0wCiAgSU9bMV06IGVuYWJsZT0wLCBkaXI9MCwgd2FrZT0wLCBzdGlja3k9MCwgZGF0YT0w
LCB1bnNvbD0wCk5vZGUgMHgwMiBbQXVkaW8gT3V0cHV0XSB3Y2FwcyAweDQxZDogU3RlcmVv
IEFtcC1PdXQKICBDb250cm9sOiBuYW1lPSJGcm9udCBQbGF5YmFjayBWb2x1bWUiLCBpbmRl
eD0wLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDogY2hzPTMsIGRpcj1PdXQsIGlkeD0wLCBv
ZnM9MAogIERldmljZTogbmFtZT0iR2VuZXJpYyBBbmFsb2ciLCB0eXBlPSJBdWRpbyIsIGRl
dmljZT0wCiAgQW1wLU91dCBjYXBzOiBvZnM9MHg1NywgbnN0ZXBzPTB4NTcsIHN0ZXBzaXpl
PTB4MDIsIG11dGU9MAogIEFtcC1PdXQgdmFsczogIFsweDQwIDB4NDBdCiAgQ29udmVydGVy
OiBzdHJlYW09MCwgY2hhbm5lbD0wCiAgUENNOgogICAgcmF0ZXMgWzB4NTYwXTogNDQxMDAg
NDgwMDAgOTYwMDAgMTkyMDAwCiAgICBiaXRzIFsweGVdOiAxNiAyMCAyNAogICAgZm9ybWF0
cyBbMHgxXTogUENNCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2Vy
OiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAKTm9kZSAweDAzIFtBdWRpbyBPdXRwdXRdIHdjYXBz
IDB4NDFkOiBTdGVyZW8gQW1wLU91dAogIENvbnRyb2w6IG5hbWU9IlN1cnJvdW5kIFBsYXli
YWNrIFZvbHVtZSIsIGluZGV4PTAsIGRldmljZT0wCiAgICBDb250cm9sQW1wOiBjaHM9Mywg
ZGlyPU91dCwgaWR4PTAsIG9mcz0wCiAgQW1wLU91dCBjYXBzOiBvZnM9MHg1NywgbnN0ZXBz
PTB4NTcsIHN0ZXBzaXplPTB4MDIsIG11dGU9MAogIEFtcC1PdXQgdmFsczogIFsweDAwIDB4
MDBdCiAgQ29udmVydGVyOiBzdHJlYW09MCwgY2hhbm5lbD0wCiAgUENNOgogICAgcmF0ZXMg
WzB4NTYwXTogNDQxMDAgNDgwMDAgOTYwMDAgMTkyMDAwCiAgICBiaXRzIFsweGVdOiAxNiAy
MCAyNAogICAgZm9ybWF0cyBbMHgxXTogUENNCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIg
RDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAKTm9kZSAweDA0IFtBdWRp
byBPdXRwdXRdIHdjYXBzIDB4NDFkOiBTdGVyZW8gQW1wLU91dAogIENvbnRyb2w6IG5hbWU9
IkNlbnRlciBQbGF5YmFjayBWb2x1bWUiLCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJv
bEFtcDogY2hzPTEsIGRpcj1PdXQsIGlkeD0wLCBvZnM9MAogIENvbnRyb2w6IG5hbWU9IkxG
RSBQbGF5YmFjayBWb2x1bWUiLCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDog
Y2hzPTIsIGRpcj1PdXQsIGlkeD0wLCBvZnM9MAogIEFtcC1PdXQgY2Fwczogb2ZzPTB4NTcs
IG5zdGVwcz0weDU3LCBzdGVwc2l6ZT0weDAyLCBtdXRlPTAKICBBbXAtT3V0IHZhbHM6ICBb
MHgwMCAweDAwXQogIENvbnZlcnRlcjogc3RyZWFtPTAsIGNoYW5uZWw9MAogIFBDTToKICAg
IHJhdGVzIFsweDU2MF06IDQ0MTAwIDQ4MDAwIDk2MDAwIDE5MjAwMAogICAgYml0cyBbMHhl
XTogMTYgMjAgMjQKICAgIGZvcm1hdHMgWzB4MV06IFBDTQogIFBvd2VyIHN0YXRlczogIEQw
IEQxIEQyIEQzIEVQU1MKICBQb3dlcjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCk5vZGUgMHgw
NSBbQXVkaW8gT3V0cHV0XSB3Y2FwcyAweDQxZDogU3RlcmVvIEFtcC1PdXQKICBDb250cm9s
OiBuYW1lPSJIZWFkcGhvbmUgUGxheWJhY2sgVm9sdW1lIiwgaW5kZXg9MCwgZGV2aWNlPTAK
ICAgIENvbnRyb2xBbXA6IGNocz0zLCBkaXI9T3V0LCBpZHg9MCwgb2ZzPTAKICBBbXAtT3V0
IGNhcHM6IG9mcz0weDU3LCBuc3RlcHM9MHg1Nywgc3RlcHNpemU9MHgwMiwgbXV0ZT0wCiAg
QW1wLU91dCB2YWxzOiAgWzB4NDAgMHg0MF0KICBDb252ZXJ0ZXI6IHN0cmVhbT0wLCBjaGFu
bmVsPTAKICBQQ006CiAgICByYXRlcyBbMHg1NjBdOiA0NDEwMCA0ODAwMCA5NjAwMCAxOTIw
MDAKICAgIGJpdHMgWzB4ZV06IDE2IDIwIDI0CiAgICBmb3JtYXRzIFsweDFdOiBQQ00KICBQ
b3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFj
dHVhbD1EMApOb2RlIDB4MDYgW0F1ZGlvIE91dHB1dF0gd2NhcHMgMHg2MTE6IFN0ZXJlbyBE
aWdpdGFsCiAgQ29udHJvbDogbmFtZT0iSUVDOTU4IFBsYXliYWNrIENvbiBNYXNrIiwgaW5k
ZXg9MCwgZGV2aWNlPTAKICBDb250cm9sOiBuYW1lPSJJRUM5NTggUGxheWJhY2sgUHJvIE1h
c2siLCBpbmRleD0wLCBkZXZpY2U9MAogIENvbnRyb2w6IG5hbWU9IklFQzk1OCBQbGF5YmFj
ayBEZWZhdWx0IiwgaW5kZXg9MCwgZGV2aWNlPTAKICBDb250cm9sOiBuYW1lPSJJRUM5NTgg
UGxheWJhY2sgU3dpdGNoIiwgaW5kZXg9MCwgZGV2aWNlPTAKICBDb250cm9sOiBuYW1lPSJJ
RUM5NTggRGVmYXVsdCBQQ00gUGxheWJhY2sgU3dpdGNoIiwgaW5kZXg9MCwgZGV2aWNlPTAK
ICBEZXZpY2U6IG5hbWU9IkdlbmVyaWMgRGlnaXRhbCIsIHR5cGU9IlNQRElGIiwgZGV2aWNl
PTEKICBDb252ZXJ0ZXI6IHN0cmVhbT0wLCBjaGFubmVsPTAKICBEaWdpdGFsOiBFbmFibGVk
CiAgRGlnaXRhbCBjYXRlZ29yeTogMHgwCiAgSUVDIENvZGluZyBUeXBlOiAweDAKICBQQ006
CiAgICByYXRlcyBbMHg1ZjBdOiAzMjAwMCA0NDEwMCA0ODAwMCA4ODIwMCA5NjAwMCAxOTIw
MDAKICAgIGJpdHMgWzB4ZV06IDE2IDIwIDI0CiAgICBmb3JtYXRzIFsweDFdOiBQQ00KICBQ
b3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFj
dHVhbD1EMApOb2RlIDB4MDcgW1ZlbmRvciBEZWZpbmVkIFdpZGdldF0gd2NhcHMgMHhmMDAw
MDA6IE1vbm8KTm9kZSAweDA4IFtBdWRpbyBJbnB1dF0gd2NhcHMgMHgxMDA1MWI6IFN0ZXJl
byBBbXAtSW4KICBDb250cm9sOiBuYW1lPSJDYXB0dXJlIFZvbHVtZSIsIGluZGV4PTAsIGRl
dmljZT0wCiAgICBDb250cm9sQW1wOiBjaHM9MywgZGlyPUluLCBpZHg9MCwgb2ZzPTAKICBD
b250cm9sOiBuYW1lPSJDYXB0dXJlIFN3aXRjaCIsIGluZGV4PTAsIGRldmljZT0wCiAgICBD
b250cm9sQW1wOiBjaHM9MywgZGlyPUluLCBpZHg9MCwgb2ZzPTAKICBEZXZpY2U6IG5hbWU9
IkdlbmVyaWMgQW5hbG9nIiwgdHlwZT0iQXVkaW8iLCBkZXZpY2U9MAogIEFtcC1JbiBjYXBz
OiBvZnM9MHgxNywgbnN0ZXBzPTB4M2YsIHN0ZXBzaXplPTB4MDIsIG11dGU9MQogIEFtcC1J
biB2YWxzOiAgWzB4MjcgMHgyN10KICBDb252ZXJ0ZXI6IHN0cmVhbT0wLCBjaGFubmVsPTAK
ICBTREktU2VsZWN0OiAwCiAgUENNOgogICAgcmF0ZXMgWzB4NTYwXTogNDQxMDAgNDgwMDAg
OTYwMDAgMTkyMDAwCiAgICBiaXRzIFsweGVdOiAxNiAyMCAyNAogICAgZm9ybWF0cyBbMHgx
XTogUENNCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0
aW5nPUQwLCBhY3R1YWw9RDAKICBDb25uZWN0aW9uOiAxCiAgICAgMHgyMwpOb2RlIDB4MDkg
W0F1ZGlvIElucHV0XSB3Y2FwcyAweDEwMDUxYjogU3RlcmVvIEFtcC1JbgogIENvbnRyb2w6
IG5hbWU9IkNhcHR1cmUgVm9sdW1lIiwgaW5kZXg9MSwgZGV2aWNlPTAKICAgIENvbnRyb2xB
bXA6IGNocz0zLCBkaXI9SW4sIGlkeD0wLCBvZnM9MAogIENvbnRyb2w6IG5hbWU9IkNhcHR1
cmUgU3dpdGNoIiwgaW5kZXg9MSwgZGV2aWNlPTAKICAgIENvbnRyb2xBbXA6IGNocz0zLCBk
aXI9SW4sIGlkeD0wLCBvZnM9MAogIERldmljZTogbmFtZT0iR2VuZXJpYyBBbHQgQW5hbG9n
IiwgdHlwZT0iQXVkaW8iLCBkZXZpY2U9MgogIEFtcC1JbiBjYXBzOiBvZnM9MHgxNywgbnN0
ZXBzPTB4M2YsIHN0ZXBzaXplPTB4MDIsIG11dGU9MQogIEFtcC1JbiB2YWxzOiAgWzB4ODAg
MHg4MF0KICBDb252ZXJ0ZXI6IHN0cmVhbT0wLCBjaGFubmVsPTAKICBTREktU2VsZWN0OiAw
CiAgUENNOgogICAgcmF0ZXMgWzB4NTYwXTogNDQxMDAgNDgwMDAgOTYwMDAgMTkyMDAwCiAg
ICBiaXRzIFsweGVdOiAxNiAyMCAyNAogICAgZm9ybWF0cyBbMHgxXTogUENNCiAgUG93ZXIg
c3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQwLCBhY3R1YWw9
RDAKICBDb25uZWN0aW9uOiAxCiAgICAgMHgyMgpOb2RlIDB4MGEgW1ZlbmRvciBEZWZpbmVk
IFdpZGdldF0gd2NhcHMgMHhmMDAwMDA6IE1vbm8KTm9kZSAweDBiIFtBdWRpbyBNaXhlcl0g
d2NhcHMgMHgyMDAxMGI6IFN0ZXJlbyBBbXAtSW4KICBBbXAtSW4gY2Fwczogb2ZzPTB4MTcs
IG5zdGVwcz0weDFmLCBzdGVwc2l6ZT0weDA1LCBtdXRlPTEKICBBbXAtSW4gdmFsczogIFsw
eDgwIDB4ODBdIFsweDgwIDB4ODBdIFsweDgwIDB4ODBdIFsweDgwIDB4ODBdIFsweDgwIDB4
ODBdIFsweDgwIDB4ODBdIFsweDgwIDB4ODBdIFsweDgwIDB4ODBdCiAgQ29ubmVjdGlvbjog
OAogICAgIDB4MTggMHgxOSAweDFhIDB4MWIgMHgxNCAweDE1IDB4MTYgMHgxNwpOb2RlIDB4
MGMgW0F1ZGlvIE1peGVyXSB3Y2FwcyAweDIwMDEwYjogU3RlcmVvIEFtcC1JbgogIEFtcC1J
biBjYXBzOiBvZnM9MHgwMCwgbnN0ZXBzPTB4MDAsIHN0ZXBzaXplPTB4MDAsIG11dGU9MQog
IEFtcC1JbiB2YWxzOiAgWzB4MDAgMHgwMF0gWzB4ODAgMHg4MF0KICBDb25uZWN0aW9uOiAy
CiAgICAgMHgwMiAweDBiCk5vZGUgMHgwZCBbQXVkaW8gTWl4ZXJdIHdjYXBzIDB4MjAwMTBi
OiBTdGVyZW8gQW1wLUluCiAgQW1wLUluIGNhcHM6IG9mcz0weDAwLCBuc3RlcHM9MHgwMCwg
c3RlcHNpemU9MHgwMCwgbXV0ZT0xCiAgQW1wLUluIHZhbHM6ICBbMHgwMCAweDAwXSBbMHg4
MCAweDgwXQogIENvbm5lY3Rpb246IDIKICAgICAweDAzIDB4MGIKTm9kZSAweDBlIFtBdWRp
byBNaXhlcl0gd2NhcHMgMHgyMDAxMGI6IFN0ZXJlbyBBbXAtSW4KICBBbXAtSW4gY2Fwczog
b2ZzPTB4MDAsIG5zdGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRlPTEKICBBbXAtSW4g
dmFsczogIFsweDAwIDB4MDBdIFsweDgwIDB4ODBdCiAgQ29ubmVjdGlvbjogMgogICAgIDB4
MDQgMHgwYgpOb2RlIDB4MGYgW0F1ZGlvIE1peGVyXSB3Y2FwcyAweDIwMDEwYjogU3RlcmVv
IEFtcC1JbgogIEFtcC1JbiBjYXBzOiBvZnM9MHgwMCwgbnN0ZXBzPTB4MDAsIHN0ZXBzaXpl
PTB4MDAsIG11dGU9MQogIEFtcC1JbiB2YWxzOiAgWzB4MDAgMHgwMF0gWzB4ODAgMHg4MF0K
ICBDb25uZWN0aW9uOiAyCiAgICAgMHgwNSAweDBiCk5vZGUgMHgxMCBbQXVkaW8gT3V0cHV0
XSB3Y2FwcyAweDYxMTogU3RlcmVvIERpZ2l0YWwKICBDb252ZXJ0ZXI6IHN0cmVhbT0wLCBj
aGFubmVsPTAKICBEaWdpdGFsOgogIERpZ2l0YWwgY2F0ZWdvcnk6IDB4MAogIElFQyBDb2Rp
bmcgVHlwZTogMHgwCiAgUENNOgogICAgcmF0ZXMgWzB4NWYwXTogMzIwMDAgNDQxMDAgNDgw
MDAgODgyMDAgOTYwMDAgMTkyMDAwCiAgICBiaXRzIFsweGVdOiAxNiAyMCAyNAogICAgZm9y
bWF0cyBbMHgxXTogUENNCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBv
d2VyOiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAKTm9kZSAweDExIFtQaW4gQ29tcGxleF0gd2Nh
cHMgMHg0MDA3ODE6IFN0ZXJlbyBEaWdpdGFsCiAgUGluY2FwIDB4MDAwMDAwMTQ6IE9VVCBE
ZXRlY3QKICBQaW4gRGVmYXVsdCAweDQwMzdjNTQwOiBbTi9BXSBDRCBhdCBFeHQgTi9BCiAg
ICBDb25uID0gQW5hbG9nLCBDb2xvciA9IFVOS05PV04KICAgIERlZkFzc29jaWF0aW9uID0g
MHg0LCBTZXF1ZW5jZSA9IDB4MAogICAgTWlzYyA9IE5PX1BSRVNFTkNFCiAgUGluLWN0bHM6
IDB4NDA6IE9VVAogIFVuc29saWNpdGVkOiB0YWc9MDAsIGVuYWJsZWQ9MAogIFBvd2VyIHN0
YXRlczogIEQwIEQxIEQyIEQzIEVQU1MKICBQb3dlcjogc2V0dGluZz1EMCwgYWN0dWFsPUQw
CiAgQ29ubmVjdGlvbjogMQogICAgIDB4MTAKTm9kZSAweDEyIFtWZW5kb3IgRGVmaW5lZCBX
aWRnZXRdIHdjYXBzIDB4ZjAwMDAwOiBNb25vCk5vZGUgMHgxMyBbVmVuZG9yIERlZmluZWQg
V2lkZ2V0XSB3Y2FwcyAweGYwMDAwMDogTW9ubwpOb2RlIDB4MTQgW1BpbiBDb21wbGV4XSB3
Y2FwcyAweDQwMDU4ZDogU3RlcmVvIEFtcC1PdXQKICBDb250cm9sOiBuYW1lPSJGcm9udCBQ
bGF5YmFjayBTd2l0Y2giLCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDogY2hz
PTMsIGRpcj1PdXQsIGlkeD0wLCBvZnM9MAogIEFtcC1PdXQgY2Fwczogb2ZzPTB4MDAsIG5z
dGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRlPTEKICBBbXAtT3V0IHZhbHM6ICBbMHgw
MCAweDAwXQogIFBpbmNhcCAweDAwMDEwMDNlOiBJTiBPVVQgSFAgRUFQRCBEZXRlY3QgVHJp
Z2dlcgogIEVBUEQgMHgyOiBFQVBECiAgUGluIERlZmF1bHQgMHgwMTAxNTAxMDogW0phY2td
IExpbmUgT3V0IGF0IEV4dCBSZWFyCiAgICBDb25uID0gMS84LCBDb2xvciA9IFJlZAogICAg
RGVmQXNzb2NpYXRpb24gPSAweDEsIFNlcXVlbmNlID0gMHgwCiAgUGluLWN0bHM6IDB4NDA6
IE9VVAogIFVuc29saWNpdGVkOiB0YWc9MDUsIGVuYWJsZWQ9MQogIFBvd2VyIHN0YXRlczog
IEQwIEQxIEQyIEQzIEVQU1MKICBQb3dlcjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCiAgQ29u
bmVjdGlvbjogMQogICAgIDB4MGMKTm9kZSAweDE1IFtQaW4gQ29tcGxleF0gd2NhcHMgMHg0
MDA1OGQ6IFN0ZXJlbyBBbXAtT3V0CiAgQ29udHJvbDogbmFtZT0iU3Vycm91bmQgUGxheWJh
Y2sgU3dpdGNoIiwgaW5kZXg9MCwgZGV2aWNlPTAKICAgIENvbnRyb2xBbXA6IGNocz0zLCBk
aXI9T3V0LCBpZHg9MCwgb2ZzPTAKICBBbXAtT3V0IGNhcHM6IG9mcz0weDAwLCBuc3RlcHM9
MHgwMCwgc3RlcHNpemU9MHgwMCwgbXV0ZT0xCiAgQW1wLU91dCB2YWxzOiAgWzB4ODAgMHg4
MF0KICBQaW5jYXAgMHgwMDAwMDAzNjogSU4gT1VUIERldGVjdCBUcmlnZ2VyCiAgUGluIERl
ZmF1bHQgMHgwMTAxMTAxMjogW0phY2tdIExpbmUgT3V0IGF0IEV4dCBSZWFyCiAgICBDb25u
ID0gMS84LCBDb2xvciA9IEJsYWNrCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4MSwgU2VxdWVu
Y2UgPSAweDIKICBQaW4tY3RsczogMHgwMDoKICBVbnNvbGljaXRlZDogdGFnPTA2LCBlbmFi
bGVkPTEKICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRp
bmc9RDAsIGFjdHVhbD1EMAogIENvbm5lY3Rpb246IDEKICAgICAweDBkCk5vZGUgMHgxNiBb
UGluIENvbXBsZXhdIHdjYXBzIDB4NDAwNThkOiBTdGVyZW8gQW1wLU91dAogIENvbnRyb2w6
IG5hbWU9IkNlbnRlciBQbGF5YmFjayBTd2l0Y2giLCBpbmRleD0wLCBkZXZpY2U9MAogICAg
Q29udHJvbEFtcDogY2hzPTEsIGRpcj1PdXQsIGlkeD0wLCBvZnM9MAogIENvbnRyb2w6IG5h
bWU9IkxGRSBQbGF5YmFjayBTd2l0Y2giLCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJv
bEFtcDogY2hzPTIsIGRpcj1PdXQsIGlkeD0wLCBvZnM9MAogIEFtcC1PdXQgY2Fwczogb2Zz
PTB4MDAsIG5zdGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRlPTEKICBBbXAtT3V0IHZh
bHM6ICBbMHg4MCAweDgwXQogIFBpbmNhcCAweDAwMDAwMDM2OiBJTiBPVVQgRGV0ZWN0IFRy
aWdnZXIKICBQaW4gRGVmYXVsdCAweDAxMDExMDExOiBbSmFja10gTGluZSBPdXQgYXQgRXh0
IFJlYXIKICAgIENvbm4gPSAxLzgsIENvbG9yID0gQmxhY2sKICAgIERlZkFzc29jaWF0aW9u
ID0gMHgxLCBTZXF1ZW5jZSA9IDB4MQogIFBpbi1jdGxzOiAweDAwOgogIFVuc29saWNpdGVk
OiB0YWc9MDcsIGVuYWJsZWQ9MQogIFBvd2VyIHN0YXRlczogIEQwIEQxIEQyIEQzIEVQU1MK
ICBQb3dlcjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCiAgQ29ubmVjdGlvbjogMQogICAgIDB4
MGUKTm9kZSAweDE3IFtQaW4gQ29tcGxleF0gd2NhcHMgMHg0MDA1OGQ6IFN0ZXJlbyBBbXAt
T3V0CiAgQW1wLU91dCBjYXBzOiBvZnM9MHgwMCwgbnN0ZXBzPTB4MDAsIHN0ZXBzaXplPTB4
MDAsIG11dGU9MQogIEFtcC1PdXQgdmFsczogIFsweDgwIDB4ODBdCiAgUGluY2FwIDB4MDAw
MDAwMzY6IElOIE9VVCBEZXRlY3QgVHJpZ2dlcgogIFBpbiBEZWZhdWx0IDB4NDExMTExZjA6
IFtOL0FdIFNwZWFrZXIgYXQgRXh0IFJlYXIKICAgIENvbm4gPSAxLzgsIENvbG9yID0gQmxh
Y2sKICAgIERlZkFzc29jaWF0aW9uID0gMHhmLCBTZXF1ZW5jZSA9IDB4MAogICAgTWlzYyA9
IE5PX1BSRVNFTkNFCiAgUGluLWN0bHM6IDB4MjA6IElOCiAgVW5zb2xpY2l0ZWQ6IHRhZz0w
MCwgZW5hYmxlZD0wCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2Vy
OiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAKICBDb25uZWN0aW9uOiAxCiAgICAgMHgwZgpOb2Rl
IDB4MTggW1BpbiBDb21wbGV4XSB3Y2FwcyAweDQwMDU4ZjogU3RlcmVvIEFtcC1JbiBBbXAt
T3V0CiAgQ29udHJvbDogbmFtZT0iUmVhciBNaWMgQm9vc3QgVm9sdW1lIiwgaW5kZXg9MCwg
ZGV2aWNlPTAKICAgIENvbnRyb2xBbXA6IGNocz0zLCBkaXI9SW4sIGlkeD0wLCBvZnM9MAog
IEFtcC1JbiBjYXBzOiBvZnM9MHgwMCwgbnN0ZXBzPTB4MDMsIHN0ZXBzaXplPTB4MjcsIG11
dGU9MAogIEFtcC1JbiB2YWxzOiAgWzB4MDAgMHgwMF0KICBBbXAtT3V0IGNhcHM6IG9mcz0w
eDAwLCBuc3RlcHM9MHgwMCwgc3RlcHNpemU9MHgwMCwgbXV0ZT0xCiAgQW1wLU91dCB2YWxz
OiAgWzB4ODAgMHg4MF0KICBQaW5jYXAgMHgwMDAwMzczNjogSU4gT1VUIERldGVjdCBUcmln
Z2VyCiAgICBWcmVmIGNhcHM6IEhJWiA1MCBHUkQgODAgMTAwCiAgUGluIERlZmF1bHQgMHgw
MWExMTA0MDogW0phY2tdIE1pYyBhdCBFeHQgUmVhcgogICAgQ29ubiA9IDEvOCwgQ29sb3Ig
PSBCbGFjawogICAgRGVmQXNzb2NpYXRpb24gPSAweDQsIFNlcXVlbmNlID0gMHgwCiAgUGlu
LWN0bHM6IDB4MjQ6IElOIFZSRUZfODAKICBVbnNvbGljaXRlZDogdGFnPTAyLCBlbmFibGVk
PTEKICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9
RDAsIGFjdHVhbD1EMAogIENvbm5lY3Rpb246IDUKICAgICAweDBjKiAweDBkIDB4MGUgMHgw
ZiAweDI2Ck5vZGUgMHgxOSBbUGluIENvbXBsZXhdIHdjYXBzIDB4NDAwNThmOiBTdGVyZW8g
QW1wLUluIEFtcC1PdXQKICBDb250cm9sOiBuYW1lPSJGcm9udCBNaWMgQm9vc3QgVm9sdW1l
IiwgaW5kZXg9MCwgZGV2aWNlPTAKICAgIENvbnRyb2xBbXA6IGNocz0zLCBkaXI9SW4sIGlk
eD0wLCBvZnM9MAogIEFtcC1JbiBjYXBzOiBvZnM9MHgwMCwgbnN0ZXBzPTB4MDMsIHN0ZXBz
aXplPTB4MjcsIG11dGU9MAogIEFtcC1JbiB2YWxzOiAgWzB4MDAgMHgwMF0KICBBbXAtT3V0
IGNhcHM6IG9mcz0weDAwLCBuc3RlcHM9MHgwMCwgc3RlcHNpemU9MHgwMCwgbXV0ZT0xCiAg
QW1wLU91dCB2YWxzOiAgWzB4ODAgMHg4MF0KICBQaW5jYXAgMHgwMDAwMzczZTogSU4gT1VU
IEhQIERldGVjdCBUcmlnZ2VyCiAgICBWcmVmIGNhcHM6IEhJWiA1MCBHUkQgODAgMTAwCiAg
UGluIERlZmF1bHQgMHgwMmExOTA1MDogW0phY2tdIE1pYyBhdCBFeHQgRnJvbnQKICAgIENv
bm4gPSAxLzgsIENvbG9yID0gUGluawogICAgRGVmQXNzb2NpYXRpb24gPSAweDUsIFNlcXVl
bmNlID0gMHgwCiAgUGluLWN0bHM6IDB4MjQ6IElOIFZSRUZfODAKICBVbnNvbGljaXRlZDog
dGFnPTAzLCBlbmFibGVkPTEKICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAg
UG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMAogIENvbm5lY3Rpb246IDUKICAgICAweDBj
KiAweDBkIDB4MGUgMHgwZiAweDI2Ck5vZGUgMHgxYSBbUGluIENvbXBsZXhdIHdjYXBzIDB4
NDAwNThmOiBTdGVyZW8gQW1wLUluIEFtcC1PdXQKICBDb250cm9sOiBuYW1lPSJMaW5lIEJv
b3N0IFZvbHVtZSIsIGluZGV4PTAsIGRldmljZT0wCiAgICBDb250cm9sQW1wOiBjaHM9Mywg
ZGlyPUluLCBpZHg9MCwgb2ZzPTAKICBBbXAtSW4gY2Fwczogb2ZzPTB4MDAsIG5zdGVwcz0w
eDAzLCBzdGVwc2l6ZT0weDI3LCBtdXRlPTAKICBBbXAtSW4gdmFsczogIFsweDAwIDB4MDBd
CiAgQW1wLU91dCBjYXBzOiBvZnM9MHgwMCwgbnN0ZXBzPTB4MDAsIHN0ZXBzaXplPTB4MDAs
IG11dGU9MQogIEFtcC1PdXQgdmFsczogIFsweDgwIDB4ODBdCiAgUGluY2FwIDB4MDAwMDM3
MzY6IElOIE9VVCBEZXRlY3QgVHJpZ2dlcgogICAgVnJlZiBjYXBzOiBISVogNTAgR1JEIDgw
IDEwMAogIFBpbiBEZWZhdWx0IDB4MDE4MTEwNGY6IFtKYWNrXSBMaW5lIEluIGF0IEV4dCBS
ZWFyCiAgICBDb25uID0gMS84LCBDb2xvciA9IEJsYWNrCiAgICBEZWZBc3NvY2lhdGlvbiA9
IDB4NCwgU2VxdWVuY2UgPSAweGYKICBQaW4tY3RsczogMHgyMDogSU4gVlJFRl9ISVoKICBV
bnNvbGljaXRlZDogdGFnPTA0LCBlbmFibGVkPTEKICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBE
MiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMAogIENvbm5lY3Rpb246
IDUKICAgICAweDBjKiAweDBkIDB4MGUgMHgwZiAweDI2Ck5vZGUgMHgxYiBbUGluIENvbXBs
ZXhdIHdjYXBzIDB4NDAwNThmOiBTdGVyZW8gQW1wLUluIEFtcC1PdXQKICBDb250cm9sOiBu
YW1lPSJIZWFkcGhvbmUgUGxheWJhY2sgU3dpdGNoIiwgaW5kZXg9MCwgZGV2aWNlPTAKICAg
IENvbnRyb2xBbXA6IGNocz0zLCBkaXI9T3V0LCBpZHg9MCwgb2ZzPTAKICBBbXAtSW4gY2Fw
czogb2ZzPTB4MDAsIG5zdGVwcz0weDAzLCBzdGVwc2l6ZT0weDI3LCBtdXRlPTAKICBBbXAt
SW4gdmFsczogIFsweDAwIDB4MDBdCiAgQW1wLU91dCBjYXBzOiBvZnM9MHgwMCwgbnN0ZXBz
PTB4MDAsIHN0ZXBzaXplPTB4MDAsIG11dGU9MQogIEFtcC1PdXQgdmFsczogIFsweDAwIDB4
MDBdCiAgUGluY2FwIDB4MDAwMTM3M2U6IElOIE9VVCBIUCBFQVBEIERldGVjdCBUcmlnZ2Vy
CiAgICBWcmVmIGNhcHM6IEhJWiA1MCBHUkQgODAgMTAwCiAgRUFQRCAweDI6IEVBUEQKICBQ
aW4gRGVmYXVsdCAweDAyMjE0MDIwOiBbSmFja10gSFAgT3V0IGF0IEV4dCBGcm9udAogICAg
Q29ubiA9IDEvOCwgQ29sb3IgPSBHcmVlbgogICAgRGVmQXNzb2NpYXRpb24gPSAweDIsIFNl
cXVlbmNlID0gMHgwCiAgUGluLWN0bHM6IDB4YzA6IE9VVCBIUCBWUkVGX0hJWgogIFVuc29s
aWNpdGVkOiB0YWc9MDEsIGVuYWJsZWQ9MQogIFBvd2VyIHN0YXRlczogIEQwIEQxIEQyIEQz
IEVQU1MKICBQb3dlcjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCiAgQ29ubmVjdGlvbjogNQog
ICAgIDB4MGMgMHgwZCAweDBlIDB4MGYqIDB4MjYKTm9kZSAweDFjIFtWZW5kb3IgRGVmaW5l
ZCBXaWRnZXRdIHdjYXBzIDB4ZjAwMDAwOiBNb25vCk5vZGUgMHgxZCBbVmVuZG9yIERlZmlu
ZWQgV2lkZ2V0XSB3Y2FwcyAweGYwMDAwMDogTW9ubwpOb2RlIDB4MWUgW1BpbiBDb21wbGV4
XSB3Y2FwcyAweDQwMDc4MTogU3RlcmVvIERpZ2l0YWwKICBQaW5jYXAgMHgwMDAwMDAxNDog
T1VUIERldGVjdAogIFBpbiBEZWZhdWx0IDB4MDE0NTExMzA6IFtKYWNrXSBTUERJRiBPdXQg
YXQgRXh0IFJlYXIKICAgIENvbm4gPSBPcHRpY2FsLCBDb2xvciA9IEJsYWNrCiAgICBEZWZB
c3NvY2lhdGlvbiA9IDB4MywgU2VxdWVuY2UgPSAweDAKICAgIE1pc2MgPSBOT19QUkVTRU5D
RQogIFBpbi1jdGxzOiAweDQwOiBPVVQKICBVbnNvbGljaXRlZDogdGFnPTAwLCBlbmFibGVk
PTAKICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9
RDAsIGFjdHVhbD1EMAogIENvbm5lY3Rpb246IDEKICAgICAweDA2Ck5vZGUgMHgxZiBbVmVu
ZG9yIERlZmluZWQgV2lkZ2V0XSB3Y2FwcyAweGYwMDAwMDogTW9ubwpOb2RlIDB4MjAgW1Zl
bmRvciBEZWZpbmVkIFdpZGdldF0gd2NhcHMgMHhmMDAwNDA6IE1vbm8KICBQcm9jZXNzaW5n
IGNhcHM6IGJlbmlnbj0wLCBuY29lZmY9MzIKTm9kZSAweDIxIFtWZW5kb3IgRGVmaW5lZCBX
aWRnZXRdIHdjYXBzIDB4ZjAwMDAwOiBNb25vCk5vZGUgMHgyMiBbQXVkaW8gTWl4ZXJdIHdj
YXBzIDB4MjAwMTBiOiBTdGVyZW8gQW1wLUluCiAgQW1wLUluIGNhcHM6IG9mcz0weDAwLCBu
c3RlcHM9MHgwMCwgc3RlcHNpemU9MHgwMCwgbXV0ZT0xCiAgQW1wLUluIHZhbHM6ICBbMHgw
MCAweDAwXSBbMHg4MCAweDgwXSBbMHg4MCAweDgwXSBbMHg4MCAweDgwXSBbMHg4MCAweDgw
XSBbMHg4MCAweDgwXSBbMHg4MCAweDgwXSBbMHg4MCAweDgwXSBbMHg4MCAweDgwXQogIENv
bm5lY3Rpb246IDkKICAgICAweDE4IDB4MTkgMHgxYSAweDFiIDB4MTQgMHgxNSAweDE2IDB4
MTcgMHgwYgpOb2RlIDB4MjMgW0F1ZGlvIE1peGVyXSB3Y2FwcyAweDIwMDEwYjogU3RlcmVv
IEFtcC1JbgogIEFtcC1JbiBjYXBzOiBvZnM9MHgwMCwgbnN0ZXBzPTB4MDAsIHN0ZXBzaXpl
PTB4MDAsIG11dGU9MQogIEFtcC1JbiB2YWxzOiAgWzB4ODAgMHg4MF0gWzB4MDAgMHgwMF0g
WzB4ODAgMHg4MF0gWzB4ODAgMHg4MF0gWzB4ODAgMHg4MF0gWzB4ODAgMHg4MF0gWzB4ODAg
MHg4MF0gWzB4ODAgMHg4MF0gWzB4ODAgMHg4MF0KICBDb25uZWN0aW9uOiA5CiAgICAgMHgx
OCAweDE5IDB4MWEgMHgxYiAweDE0IDB4MTUgMHgxNiAweDE3IDB4MGIKTm9kZSAweDI0IFtW
ZW5kb3IgRGVmaW5lZCBXaWRnZXRdIHdjYXBzIDB4ZjAwMDAwOiBNb25vCk5vZGUgMHgyNSBb
QXVkaW8gT3V0cHV0XSB3Y2FwcyAweDQxZDogU3RlcmVvIEFtcC1PdXQKICBBbXAtT3V0IGNh
cHM6IG9mcz0weDU3LCBuc3RlcHM9MHg1Nywgc3RlcHNpemU9MHgwMiwgbXV0ZT0wCiAgQW1w
LU91dCB2YWxzOiAgWzB4NTcgMHg1N10KICBDb252ZXJ0ZXI6IHN0cmVhbT0wLCBjaGFubmVs
PTAKICBQQ006CiAgICByYXRlcyBbMHg1NjBdOiA0NDEwMCA0ODAwMCA5NjAwMCAxOTIwMDAK
ICAgIGJpdHMgWzB4ZV06IDE2IDIwIDI0CiAgICBmb3JtYXRzIFsweDFdOiBQQ00KICBQb3dl
ciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVh
bD1EMApOb2RlIDB4MjYgW0F1ZGlvIE1peGVyXSB3Y2FwcyAweDIwMDEwYjogU3RlcmVvIEFt
cC1JbgogIEFtcC1JbiBjYXBzOiBvZnM9MHgwMCwgbnN0ZXBzPTB4MDAsIHN0ZXBzaXplPTB4
MDAsIG11dGU9MQogIEFtcC1JbiB2YWxzOiAgWzB4MDAgMHgwMF0gWzB4ODAgMHg4MF0KICBD
b25uZWN0aW9uOiAyCiAgICAgMHgyNSAweDBiCkNvZGVjOiBBVEkgUjZ4eCBIRE1JCkFkZHJl
c3M6IDAKQUZHIEZ1bmN0aW9uIElkOiAweDEgKHVuc29sIDApClZlbmRvciBJZDogMHgxMDAy
YWEwMQpTdWJzeXN0ZW0gSWQ6IDB4MDBhYTAxMDAKUmV2aXNpb24gSWQ6IDB4MTAwODAwCk5v
IE1vZGVtIEZ1bmN0aW9uIEdyb3VwIGZvdW5kCkRlZmF1bHQgUENNOgogICAgcmF0ZXMgWzB4
NzBdOiAzMjAwMCA0NDEwMCA0ODAwMAogICAgYml0cyBbMHgyXTogMTYKICAgIGZvcm1hdHMg
WzB4MV06IFBDTQpEZWZhdWx0IEFtcC1JbiBjYXBzOiBOL0EKRGVmYXVsdCBBbXAtT3V0IGNh
cHM6IE4vQQpTdGF0ZSBvZiBBRkcgbm9kZSAweDAxOgogIFBvd2VyIHN0YXRlczogIEQwIEQz
IENMS1NUT1AgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAsIENsb2NrLXN0
b3AtT0sKR1BJTzogaW89MCwgbz0wLCBpPTAsIHVuc29saWNpdGVkPTAsIHdha2U9MApOb2Rl
IDB4MDIgW0F1ZGlvIE91dHB1dF0gd2NhcHMgMHgyMjE6IFN0ZXJlbyBEaWdpdGFsIFN0cmlw
ZQogIENvbnZlcnRlcjogc3RyZWFtPTAsIGNoYW5uZWw9MAogIERpZ2l0YWw6IEVuYWJsZWQK
ICBEaWdpdGFsIGNhdGVnb3J5OiAweDAKICBJRUMgQ29kaW5nIFR5cGU6IDB4MApOb2RlIDB4
MDMgW1BpbiBDb21wbGV4XSB3Y2FwcyAweDQwMDM4MTogU3RlcmVvIERpZ2l0YWwKICBQaW5j
YXAgMHgwMDAwMDA5NDogT1VUIERldGVjdCBIRE1JCiAgUGluIERlZmF1bHQgMHgxODU2MDBm
MDogW0phY2tdIERpZ2l0YWwgT3V0IGF0IEludCBIRE1JCiAgICBDb25uID0gRGlnaXRhbCwg
Q29sb3IgPSBVbmtub3duCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4ZiwgU2VxdWVuY2UgPSAw
eDAKICBQaW4tY3RsczogMHg0MDogT1VUCiAgVW5zb2xpY2l0ZWQ6IHRhZz0wMCwgZW5hYmxl
ZD0wCiAgQ29ubmVjdGlvbjogMQogICAgIDB4MDIKTm9kZSAweDA0IFtBdWRpbyBPdXRwdXRd
IHdjYXBzIDB4MjIxOiBTdGVyZW8gRGlnaXRhbCBTdHJpcGUKICBDb252ZXJ0ZXI6IHN0cmVh
bT0wLCBjaGFubmVsPTAKICBEaWdpdGFsOiBFbmFibGVkCiAgRGlnaXRhbCBjYXRlZ29yeTog
MHgwCiAgSUVDIENvZGluZyBUeXBlOiAweDAKTm9kZSAweDA1IFtQaW4gQ29tcGxleF0gd2Nh
cHMgMHg0MDAzODE6IFN0ZXJlbyBEaWdpdGFsCiAgUGluY2FwIDB4MDAwMDAwOTQ6IE9VVCBE
ZXRlY3QgSERNSQogIFBpbiBEZWZhdWx0IDB4MTg1NjAwZjA6IFtKYWNrXSBEaWdpdGFsIE91
dCBhdCBJbnQgSERNSQogICAgQ29ubiA9IERpZ2l0YWwsIENvbG9yID0gVW5rbm93bgogICAg
RGVmQXNzb2NpYXRpb24gPSAweGYsIFNlcXVlbmNlID0gMHgwCiAgUGluLWN0bHM6IDB4NDA6
IE9VVAogIFVuc29saWNpdGVkOiB0YWc9MDAsIGVuYWJsZWQ9MAogIENvbm5lY3Rpb246IDEK
ICAgICAweDA0Ck5vZGUgMHgwNiBbQXVkaW8gT3V0cHV0XSB3Y2FwcyAweDIyMTogU3RlcmVv
IERpZ2l0YWwgU3RyaXBlCiAgQ29udmVydGVyOiBzdHJlYW09MCwgY2hhbm5lbD0wCiAgRGln
aXRhbDogRW5hYmxlZAogIERpZ2l0YWwgY2F0ZWdvcnk6IDB4MAogIElFQyBDb2RpbmcgVHlw
ZTogMHgwCk5vZGUgMHgwNyBbUGluIENvbXBsZXhdIHdjYXBzIDB4NDAwMzgxOiBTdGVyZW8g
RGlnaXRhbAogIFBpbmNhcCAweDAwMDAwMDk0OiBPVVQgRGV0ZWN0IEhETUkKICBQaW4gRGVm
YXVsdCAweDE4NTYwMGYwOiBbSmFja10gRGlnaXRhbCBPdXQgYXQgSW50IEhETUkKICAgIENv
bm4gPSBEaWdpdGFsLCBDb2xvciA9IFVua25vd24KICAgIERlZkFzc29jaWF0aW9uID0gMHhm
LCBTZXF1ZW5jZSA9IDB4MAogIFBpbi1jdGxzOiAweDQwOiBPVVQKICBVbnNvbGljaXRlZDog
dGFnPTAwLCBlbmFibGVkPTAKICBDb25uZWN0aW9uOiAxCiAgICAgMHgwNgpOb2RlIDB4MDgg
W0F1ZGlvIE91dHB1dF0gd2NhcHMgMHgyMjE6IFN0ZXJlbyBEaWdpdGFsIFN0cmlwZQogIENv
bnZlcnRlcjogc3RyZWFtPTAsIGNoYW5uZWw9MAogIERpZ2l0YWw6IEVuYWJsZWQKICBEaWdp
dGFsIGNhdGVnb3J5OiAweDAKICBJRUMgQ29kaW5nIFR5cGU6IDB4MApOb2RlIDB4MDkgW1Bp
biBDb21wbGV4XSB3Y2FwcyAweDQwMDM4MTogU3RlcmVvIERpZ2l0YWwKICBQaW5jYXAgMHgw
MDAwMDA5NDogT1VUIERldGVjdCBIRE1JCiAgUGluIERlZmF1bHQgMHgxODU2MDBmMDogW0ph
Y2tdIERpZ2l0YWwgT3V0IGF0IEludCBIRE1JCiAgICBDb25uID0gRGlnaXRhbCwgQ29sb3Ig
PSBVbmtub3duCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4ZiwgU2VxdWVuY2UgPSAweDAKICBQ
aW4tY3RsczogMHg0MDogT1VUCiAgVW5zb2xpY2l0ZWQ6IHRhZz0wMCwgZW5hYmxlZD0wCiAg
Q29ubmVjdGlvbjogMQogICAgIDB4MDgKTm9kZSAweDBhIFtBdWRpbyBPdXRwdXRdIHdjYXBz
IDB4MjIxOiBTdGVyZW8gRGlnaXRhbCBTdHJpcGUKICBDb252ZXJ0ZXI6IHN0cmVhbT0wLCBj
aGFubmVsPTAKICBEaWdpdGFsOgogIERpZ2l0YWwgY2F0ZWdvcnk6IDB4MAogIElFQyBDb2Rp
bmcgVHlwZTogMHgwCk5vZGUgMHgwYiBbUGluIENvbXBsZXhdIHdjYXBzIDB4NDAwMzgxOiBT
dGVyZW8gRGlnaXRhbAogIFBpbmNhcCAweDAwMDAwMDk0OiBPVVQgRGV0ZWN0IEhETUkKICBQ
aW4gRGVmYXVsdCAweDU4NTYwMGYwOiBbTi9BXSBEaWdpdGFsIE91dCBhdCBJbnQgSERNSQog
ICAgQ29ubiA9IERpZ2l0YWwsIENvbG9yID0gVW5rbm93bgogICAgRGVmQXNzb2NpYXRpb24g
PSAweGYsIFNlcXVlbmNlID0gMHgwCiAgUGluLWN0bHM6IDB4NDA6IE9VVAogIFVuc29saWNp
dGVkOiB0YWc9MDAsIGVuYWJsZWQ9MAogIENvbm5lY3Rpb246IDEKICAgICAweDBhCi0tZW5k
Y29sbGFwc2UtLQoKCiEhVVNCIERlc2NyaXB0b3JzCiEhLS0tLS0tLS0tLS0tLS0tCi0tc3Rh
cnRjb2xsYXBzZS0tCgpCdXMgMDAxIERldmljZSAwMDM6IElEIGI1OGM6OWU4NCBCbHVlIE1p
Y3JvcGhvbmVzIFlldGkgU3RlcmVvIE1pY3JvcGhvbmUKTmVnb3RpYXRlZCBzcGVlZDogRnVs
bCBTcGVlZCAoMTJNYnBzKQpEZXZpY2UgRGVzY3JpcHRvcjoKICBiTGVuZ3RoICAgICAgICAg
ICAgICAgIDE4CiAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgMQogIGJjZFVTQiAgICAgICAg
ICAgICAgIDEuMTAKICBiRGV2aWNlQ2xhc3MgICAgICAgICAgICAwIFt1bmtub3duXQogIGJE
ZXZpY2VTdWJDbGFzcyAgICAgICAgIDAgW3Vua25vd25dCiAgYkRldmljZVByb3RvY29sICAg
ICAgICAgMCAKICBiTWF4UGFja2V0U2l6ZTAgICAgICAgIDE2CiAgaWRWZW5kb3IgICAgICAg
ICAgIDB4YjU4YyBCbHVlIE1pY3JvcGhvbmVzCiAgaWRQcm9kdWN0ICAgICAgICAgIDB4OWU4
NCBZZXRpIFN0ZXJlbyBNaWNyb3Bob25lCiAgYmNkRGV2aWNlICAgICAgICAgICAgMS4wMAog
IGlNYW51ZmFjdHVyZXIgICAgICAgICAgIDEgQmx1ZSBNaWNyb3Bob25lcwogIGlQcm9kdWN0
ICAgICAgICAgICAgICAgIDIgWWV0aSBTdGVyZW8gTWljcm9waG9uZQogIGlTZXJpYWwgICAg
ICAgICAgICAgICAgIDMgUkVWOAogIGJOdW1Db25maWd1cmF0aW9ucyAgICAgIDEKICBDb25m
aWd1cmF0aW9uIERlc2NyaXB0b3I6CiAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAg
ICBiRGVzY3JpcHRvclR5cGUgICAgICAgICAyCiAgICB3VG90YWxMZW5ndGggICAgICAgMHgw
MTAzCiAgICBiTnVtSW50ZXJmYWNlcyAgICAgICAgICA0CiAgICBiQ29uZmlndXJhdGlvblZh
bHVlICAgICAxCiAgICBpQ29uZmlndXJhdGlvbiAgICAgICAgICAwIAogICAgYm1BdHRyaWJ1
dGVzICAgICAgICAgMHg4MAogICAgICAoQnVzIFBvd2VyZWQpCiAgICBNYXhQb3dlciAgICAg
ICAgICAgICAgMTAwbUEKICAgIEludGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICBiTGVuZ3Ro
ICAgICAgICAgICAgICAgICA5CiAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDQKICAg
ICAgYkludGVyZmFjZU51bWJlciAgICAgICAgMAogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAg
ICAgICAwCiAgICAgIGJOdW1FbmRwb2ludHMgICAgICAgICAgIDAKICAgICAgYkludGVyZmFj
ZUNsYXNzICAgICAgICAgMSBBdWRpbwogICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAx
IENvbnRyb2wgRGV2aWNlCiAgICAgIGJJbnRlcmZhY2VQcm90b2NvbCAgICAgIDAgCiAgICAg
IGlJbnRlcmZhY2UgICAgICAgICAgICAgIDAgCiAgICAgIEF1ZGlvQ29udHJvbCBJbnRlcmZh
Y2UgRGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgIDEwCiAgICAg
ICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAzNgogICAgICAgIGJEZXNjcmlwdG9yU3VidHlw
ZSAgICAgIDEgKEhFQURFUikKICAgICAgICBiY2RBREMgICAgICAgICAgICAgICAxLjAwCiAg
ICAgICAgd1RvdGFsTGVuZ3RoICAgICAgIDB4MDA2YQogICAgICAgIGJJbkNvbGxlY3Rpb24g
ICAgICAgICAgIDIKICAgICAgICBiYUludGVyZmFjZU5yKDApICAgICAgICAxCiAgICAgICAg
YmFJbnRlcmZhY2VOcigxKSAgICAgICAgMgogICAgICBBdWRpb0NvbnRyb2wgSW50ZXJmYWNl
IERlc2NyaXB0b3I6CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAxMgogICAgICAg
IGJEZXNjcmlwdG9yVHlwZSAgICAgICAgMzYKICAgICAgICBiRGVzY3JpcHRvclN1YnR5cGUg
ICAgICAyIChJTlBVVF9URVJNSU5BTCkKICAgICAgICBiVGVybWluYWxJRCAgICAgICAgICAg
ICAxCiAgICAgICAgd1Rlcm1pbmFsVHlwZSAgICAgIDB4MDEwMSBVU0IgU3RyZWFtaW5nCiAg
ICAgICAgYkFzc29jVGVybWluYWwgICAgICAgICAgMAogICAgICAgIGJOckNoYW5uZWxzICAg
ICAgICAgICAgIDIKICAgICAgICB3Q2hhbm5lbENvbmZpZyAgICAgMHgwMDAzCiAgICAgICAg
ICBMZWZ0IEZyb250IChMKQogICAgICAgICAgUmlnaHQgRnJvbnQgKFIpCiAgICAgICAgaUNo
YW5uZWxOYW1lcyAgICAgICAgICAgMCAKICAgICAgICBpVGVybWluYWwgICAgICAgICAgICAg
ICAwIAogICAgICBBdWRpb0NvbnRyb2wgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgICAg
Ykxlbmd0aCAgICAgICAgICAgICAgICAxMgogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAg
ICAgMzYKICAgICAgICBiRGVzY3JpcHRvclN1YnR5cGUgICAgICAyIChJTlBVVF9URVJNSU5B
TCkKICAgICAgICBiVGVybWluYWxJRCAgICAgICAgICAgICAyCiAgICAgICAgd1Rlcm1pbmFs
VHlwZSAgICAgIDB4MDIwMSBNaWNyb3Bob25lCiAgICAgICAgYkFzc29jVGVybWluYWwgICAg
ICAgICAgMAogICAgICAgIGJOckNoYW5uZWxzICAgICAgICAgICAgIDIKICAgICAgICB3Q2hh
bm5lbENvbmZpZyAgICAgMHgwMDAzCiAgICAgICAgICBMZWZ0IEZyb250IChMKQogICAgICAg
ICAgUmlnaHQgRnJvbnQgKFIpCiAgICAgICAgaUNoYW5uZWxOYW1lcyAgICAgICAgICAgMCAK
ICAgICAgICBpVGVybWluYWwgICAgICAgICAgICAgICAwIAogICAgICBBdWRpb0NvbnRyb2wg
SW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAg
OQogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgMzYKICAgICAgICBiRGVzY3JpcHRv
clN1YnR5cGUgICAgICAzIChPVVRQVVRfVEVSTUlOQUwpCiAgICAgICAgYlRlcm1pbmFsSUQg
ICAgICAgICAgICAgNgogICAgICAgIHdUZXJtaW5hbFR5cGUgICAgICAweDAzMDEgU3BlYWtl
cgogICAgICAgIGJBc3NvY1Rlcm1pbmFsICAgICAgICAgIDAKICAgICAgICBiU291cmNlSUQg
ICAgICAgICAgICAgICA5CiAgICAgICAgaVRlcm1pbmFsICAgICAgICAgICAgICAgMCAKICAg
ICAgQXVkaW9Db250cm9sIEludGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGgg
ICAgICAgICAgICAgICAgIDkKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDM2CiAg
ICAgICAgYkRlc2NyaXB0b3JTdWJ0eXBlICAgICAgMyAoT1VUUFVUX1RFUk1JTkFMKQogICAg
ICAgIGJUZXJtaW5hbElEICAgICAgICAgICAgIDcKICAgICAgICB3VGVybWluYWxUeXBlICAg
ICAgMHgwMTAxIFVTQiBTdHJlYW1pbmcKICAgICAgICBiQXNzb2NUZXJtaW5hbCAgICAgICAg
ICAwCiAgICAgICAgYlNvdXJjZUlEICAgICAgICAgICAgICAgOAogICAgICAgIGlUZXJtaW5h
bCAgICAgICAgICAgICAgIDAgCiAgICAgIEF1ZGlvQ29udHJvbCBJbnRlcmZhY2UgRGVzY3Jp
cHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICAgICAgYkRlc2Ny
aXB0b3JUeXBlICAgICAgICAzNgogICAgICAgIGJEZXNjcmlwdG9yU3VidHlwZSAgICAgIDUg
KFNFTEVDVE9SX1VOSVQpCiAgICAgICAgYlVuaXRJRCAgICAgICAgICAgICAgICAgOAogICAg
ICAgIGJOckluUGlucyAgICAgICAgICAgICAgIDEKICAgICAgICBiYVNvdXJjZUlEKDApICAg
ICAgICAgIDEwCiAgICAgICAgaVNlbGVjdG9yICAgICAgICAgICAgICAgMCAKICAgICAgQXVk
aW9Db250cm9sIEludGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGggICAgICAg
ICAgICAgICAgMTMKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDM2CiAgICAgICAg
YkRlc2NyaXB0b3JTdWJ0eXBlICAgICAgNiAoRkVBVFVSRV9VTklUKQogICAgICAgIGJVbml0
SUQgICAgICAgICAgICAgICAgIDkKICAgICAgICBiU291cmNlSUQgICAgICAgICAgICAgIDE1
CiAgICAgICAgYkNvbnRyb2xTaXplICAgICAgICAgICAgMgogICAgICAgIGJtYUNvbnRyb2xz
KDApICAgICAweDAwMDEKICAgICAgICAgIE11dGUgQ29udHJvbAogICAgICAgIGJtYUNvbnRy
b2xzKDEpICAgICAweDAwMDIKICAgICAgICAgIFZvbHVtZSBDb250cm9sCiAgICAgICAgYm1h
Q29udHJvbHMoMikgICAgIDB4MDAwMgogICAgICAgICAgVm9sdW1lIENvbnRyb2wKICAgICAg
ICBpRmVhdHVyZSAgICAgICAgICAgICAgICAwIAogICAgICBBdWRpb0NvbnRyb2wgSW50ZXJm
YWNlIERlc2NyaXB0b3I6CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAxMAogICAg
ICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgMzYKICAgICAgICBiRGVzY3JpcHRvclN1YnR5
cGUgICAgICA2IChGRUFUVVJFX1VOSVQpCiAgICAgICAgYlVuaXRJRCAgICAgICAgICAgICAg
ICAxMAogICAgICAgIGJTb3VyY2VJRCAgICAgICAgICAgICAgIDIKICAgICAgICBiQ29udHJv
bFNpemUgICAgICAgICAgICAxCiAgICAgICAgYm1hQ29udHJvbHMoMCkgICAgICAgMHgwMQog
ICAgICAgICAgTXV0ZSBDb250cm9sCiAgICAgICAgYm1hQ29udHJvbHMoMSkgICAgICAgMHgw
MgogICAgICAgICAgVm9sdW1lIENvbnRyb2wKICAgICAgICBibWFDb250cm9scygyKSAgICAg
ICAweDAyCiAgICAgICAgICBWb2x1bWUgQ29udHJvbAogICAgICAgIGlGZWF0dXJlICAgICAg
ICAgICAgICAgIDAgCiAgICAgIEF1ZGlvQ29udHJvbCBJbnRlcmZhY2UgRGVzY3JpcHRvcjoK
ICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgIDEwCiAgICAgICAgYkRlc2NyaXB0b3JU
eXBlICAgICAgICAzNgogICAgICAgIGJEZXNjcmlwdG9yU3VidHlwZSAgICAgIDYgKEZFQVRV
UkVfVU5JVCkKICAgICAgICBiVW5pdElEICAgICAgICAgICAgICAgIDEzCiAgICAgICAgYlNv
dXJjZUlEICAgICAgICAgICAgICAgMgogICAgICAgIGJDb250cm9sU2l6ZSAgICAgICAgICAg
IDEKICAgICAgICBibWFDb250cm9scygwKSAgICAgICAweDAxCiAgICAgICAgICBNdXRlIENv
bnRyb2wKICAgICAgICBibWFDb250cm9scygxKSAgICAgICAweDAyCiAgICAgICAgICBWb2x1
bWUgQ29udHJvbAogICAgICAgIGJtYUNvbnRyb2xzKDIpICAgICAgIDB4MDIKICAgICAgICAg
IFZvbHVtZSBDb250cm9sCiAgICAgICAgaUZlYXR1cmUgICAgICAgICAgICAgICAgMCAKICAg
ICAgQXVkaW9Db250cm9sIEludGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGgg
ICAgICAgICAgICAgICAgMTQKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDM2CiAg
ICAgICAgYkRlc2NyaXB0b3JTdWJ0eXBlICAgICAgNCAoTUlYRVJfVU5JVCkKICAgICAgICBi
VW5pdElEICAgICAgICAgICAgICAgIDE1CiAgICAgICAgYk5ySW5QaW5zICAgICAgICAgICAg
ICAgMgogICAgICAgIGJhU291cmNlSUQoMCkgICAgICAgICAgIDEKICAgICAgICBiYVNvdXJj
ZUlEKDEpICAgICAgICAgIDEzCiAgICAgICAgYk5yQ2hhbm5lbHMgICAgICAgICAgICAgMgog
ICAgICAgIHdDaGFubmVsQ29uZmlnICAgICAweDAwMDMKICAgICAgICAgIExlZnQgRnJvbnQg
KEwpCiAgICAgICAgICBSaWdodCBGcm9udCAoUikKICAgICAgICBpQ2hhbm5lbE5hbWVzICAg
ICAgICAgICAwIAogICAgICAgIGJtQ29udHJvbHMoMCkgICAgICAgIDB4MDAKICAgICAgICBp
TWl4ZXIgICAgICAgICAgICAgICAgICAwIAogICAgICBXYXJuaW5nOiBKdW5rIGF0IGVuZCBv
ZiBkZXNjcmlwdG9yICgxIGJ5dGVzKToKICAgICAgICAwMCAKICAgIEludGVyZmFjZSBEZXNj
cmlwdG9yOgogICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAgICAgIGJEZXNjcmlw
dG9yVHlwZSAgICAgICAgIDQKICAgICAgYkludGVyZmFjZU51bWJlciAgICAgICAgMQogICAg
ICBiQWx0ZXJuYXRlU2V0dGluZyAgICAgICAwCiAgICAgIGJOdW1FbmRwb2ludHMgICAgICAg
ICAgIDAKICAgICAgYkludGVyZmFjZUNsYXNzICAgICAgICAgMSBBdWRpbwogICAgICBiSW50
ZXJmYWNlU3ViQ2xhc3MgICAgICAyIFN0cmVhbWluZwogICAgICBiSW50ZXJmYWNlUHJvdG9j
b2wgICAgICAwIAogICAgICBpSW50ZXJmYWNlICAgICAgICAgICAgICAwIAogICAgSW50ZXJm
YWNlIERlc2NyaXB0b3I6CiAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAgICAg
YkRlc2NyaXB0b3JUeXBlICAgICAgICAgNAogICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAg
ICAxCiAgICAgIGJBbHRlcm5hdGVTZXR0aW5nICAgICAgIDEKICAgICAgYk51bUVuZHBvaW50
cyAgICAgICAgICAgMQogICAgICBiSW50ZXJmYWNlQ2xhc3MgICAgICAgICAxIEF1ZGlvCiAg
ICAgIGJJbnRlcmZhY2VTdWJDbGFzcyAgICAgIDIgU3RyZWFtaW5nCiAgICAgIGJJbnRlcmZh
Y2VQcm90b2NvbCAgICAgIDAgCiAgICAgIGlJbnRlcmZhY2UgICAgICAgICAgICAgIDAgCiAg
ICAgIEF1ZGlvU3RyZWFtaW5nIEludGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5n
dGggICAgICAgICAgICAgICAgIDcKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDM2
CiAgICAgICAgYkRlc2NyaXB0b3JTdWJ0eXBlICAgICAgMSAoQVNfR0VORVJBTCkKICAgICAg
ICBiVGVybWluYWxMaW5rICAgICAgICAgICAxCiAgICAgICAgYkRlbGF5ICAgICAgICAgICAg
ICAgICAgMSBmcmFtZXMKICAgICAgICB3Rm9ybWF0VGFnICAgICAgICAgMHgwMDAxIFBDTQog
ICAgICBBdWRpb1N0cmVhbWluZyBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgICBiTGVu
Z3RoICAgICAgICAgICAgICAgIDE0CiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAz
NgogICAgICAgIGJEZXNjcmlwdG9yU3VidHlwZSAgICAgIDIgKEZPUk1BVF9UWVBFKQogICAg
ICAgIGJGb3JtYXRUeXBlICAgICAgICAgICAgIDEgKEZPUk1BVF9UWVBFX0kpCiAgICAgICAg
Yk5yQ2hhbm5lbHMgICAgICAgICAgICAgMgogICAgICAgIGJTdWJmcmFtZVNpemUgICAgICAg
ICAgIDIKICAgICAgICBiQml0UmVzb2x1dGlvbiAgICAgICAgIDE2CiAgICAgICAgYlNhbUZy
ZXFUeXBlICAgICAgICAgICAgMiBEaXNjcmV0ZQogICAgICAgIHRTYW1GcmVxWyAwXSAgICAg
ICAgNDQxMDAKICAgICAgICB0U2FtRnJlcVsgMV0gICAgICAgIDQ4MDAwCiAgICAgIEVuZHBv
aW50IERlc2NyaXB0b3I6CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQogICAg
ICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDUKICAgICAgICBiRW5kcG9pbnRBZGRyZXNz
ICAgICAweDAxICBFUCAxIE9VVAogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgMTMK
ICAgICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAgICAgICBJc29jaHJvbm91cwogICAgICAg
ICAgU3luY2ggVHlwZSAgICAgICAgICAgICAgIFN5bmNocm9ub3VzCiAgICAgICAgICBVc2Fn
ZSBUeXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAw
eDAwYzggIDF4IDIwMCBieXRlcwogICAgICAgIGJJbnRlcnZhbCAgICAgICAgICAgICAgIDEK
ICAgICAgICBiUmVmcmVzaCAgICAgICAgICAgICAgICAwCiAgICAgICAgYlN5bmNoQWRkcmVz
cyAgICAgICAgICAgMAogICAgICAgIEF1ZGlvU3RyZWFtaW5nIEVuZHBvaW50IERlc2NyaXB0
b3I6CiAgICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICAgICAgICBiRGVz
Y3JpcHRvclR5cGUgICAgICAgIDM3CiAgICAgICAgICBiRGVzY3JpcHRvclN1YnR5cGUgICAg
ICAxIChFUF9HRU5FUkFMKQogICAgICAgICAgYm1BdHRyaWJ1dGVzICAgICAgICAgMHgwMQog
ICAgICAgICAgICBTYW1wbGluZyBGcmVxdWVuY3kKICAgICAgICAgIGJMb2NrRGVsYXlVbml0
cyAgICAgICAgIDAgVW5kZWZpbmVkCiAgICAgICAgICB3TG9ja0RlbGF5ICAgICAgICAgMHgw
MDAwCiAgICBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgYkxlbmd0aCAgICAgICAgICAg
ICAgICAgOQogICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA0CiAgICAgIGJJbnRlcmZh
Y2VOdW1iZXIgICAgICAgIDIKICAgICAgYkFsdGVybmF0ZVNldHRpbmcgICAgICAgMAogICAg
ICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAwCiAgICAgIGJJbnRlcmZhY2VDbGFzcyAgICAg
ICAgIDEgQXVkaW8KICAgICAgYkludGVyZmFjZVN1YkNsYXNzICAgICAgMiBTdHJlYW1pbmcK
ICAgICAgYkludGVyZmFjZVByb3RvY29sICAgICAgMCAKICAgICAgaUludGVyZmFjZSAgICAg
ICAgICAgICAgMCAKICAgIEludGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICBiTGVuZ3RoICAg
ICAgICAgICAgICAgICA5CiAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDQKICAgICAg
YkludGVyZmFjZU51bWJlciAgICAgICAgMgogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAgICAg
ICAxCiAgICAgIGJOdW1FbmRwb2ludHMgICAgICAgICAgIDEKICAgICAgYkludGVyZmFjZUNs
YXNzICAgICAgICAgMSBBdWRpbwogICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAyIFN0
cmVhbWluZwogICAgICBiSW50ZXJmYWNlUHJvdG9jb2wgICAgICAwIAogICAgICBpSW50ZXJm
YWNlICAgICAgICAgICAgICAwIAogICAgICBBdWRpb1N0cmVhbWluZyBJbnRlcmZhY2UgRGVz
Y3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICAgICAgYkRl
c2NyaXB0b3JUeXBlICAgICAgICAzNgogICAgICAgIGJEZXNjcmlwdG9yU3VidHlwZSAgICAg
IDEgKEFTX0dFTkVSQUwpCiAgICAgICAgYlRlcm1pbmFsTGluayAgICAgICAgICAgNwogICAg
ICAgIGJEZWxheSAgICAgICAgICAgICAgICAgIDEgZnJhbWVzCiAgICAgICAgd0Zvcm1hdFRh
ZyAgICAgICAgIDB4MDAwMSBQQ00KICAgICAgQXVkaW9TdHJlYW1pbmcgSW50ZXJmYWNlIERl
c2NyaXB0b3I6CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAxNAogICAgICAgIGJE
ZXNjcmlwdG9yVHlwZSAgICAgICAgMzYKICAgICAgICBiRGVzY3JpcHRvclN1YnR5cGUgICAg
ICAyIChGT1JNQVRfVFlQRSkKICAgICAgICBiRm9ybWF0VHlwZSAgICAgICAgICAgICAxIChG
T1JNQVRfVFlQRV9JKQogICAgICAgIGJOckNoYW5uZWxzICAgICAgICAgICAgIDIKICAgICAg
ICBiU3ViZnJhbWVTaXplICAgICAgICAgICAyCiAgICAgICAgYkJpdFJlc29sdXRpb24gICAg
ICAgICAxNgogICAgICAgIGJTYW1GcmVxVHlwZSAgICAgICAgICAgIDIgRGlzY3JldGUKICAg
ICAgICB0U2FtRnJlcVsgMF0gICAgICAgIDQ0MTAwCiAgICAgICAgdFNhbUZyZXFbIDFdICAg
ICAgICA0ODAwMAogICAgICBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGgg
ICAgICAgICAgICAgICAgIDkKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1CiAg
ICAgICAgYkVuZHBvaW50QWRkcmVzcyAgICAgMHg4MiAgRVAgMiBJTgogICAgICAgIGJtQXR0
cmlidXRlcyAgICAgICAgICAgIDUKICAgICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAgICAg
ICBJc29jaHJvbm91cwogICAgICAgICAgU3luY2ggVHlwZSAgICAgICAgICAgICAgIEFzeW5j
aHJvbm91cwogICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAgICAgIERhdGEKICAgICAg
ICB3TWF4UGFja2V0U2l6ZSAgICAgMHgwMGM4ICAxeCAyMDAgYnl0ZXMKICAgICAgICBiSW50
ZXJ2YWwgICAgICAgICAgICAgICAxCiAgICAgICAgYlJlZnJlc2ggICAgICAgICAgICAgICAg
MAogICAgICAgIGJTeW5jaEFkZHJlc3MgICAgICAgICAgIDAKICAgICAgICBBdWRpb1N0cmVh
bWluZyBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAgICAgICAgYkxlbmd0aCAgICAgICAgICAg
ICAgICAgNwogICAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAzNwogICAgICAgICAg
YkRlc2NyaXB0b3JTdWJ0eXBlICAgICAgMSAoRVBfR0VORVJBTCkKICAgICAgICAgIGJtQXR0
cmlidXRlcyAgICAgICAgIDB4MDEKICAgICAgICAgICAgU2FtcGxpbmcgRnJlcXVlbmN5CiAg
ICAgICAgICBiTG9ja0RlbGF5VW5pdHMgICAgICAgICAwIFVuZGVmaW5lZAogICAgICAgICAg
d0xvY2tEZWxheSAgICAgICAgIDB4MDAwMAogICAgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAg
ICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAgICAgYkRlc2NyaXB0b3JUeXBlICAg
ICAgICAgNAogICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAgICAzCiAgICAgIGJBbHRlcm5h
dGVTZXR0aW5nICAgICAgIDAKICAgICAgYk51bUVuZHBvaW50cyAgICAgICAgICAgMQogICAg
ICBiSW50ZXJmYWNlQ2xhc3MgICAgICAgICAzIEh1bWFuIEludGVyZmFjZSBEZXZpY2UKICAg
ICAgYkludGVyZmFjZVN1YkNsYXNzICAgICAgMCBbdW5rbm93bl0KICAgICAgYkludGVyZmFj
ZVByb3RvY29sICAgICAgMCAKICAgICAgaUludGVyZmFjZSAgICAgICAgICAgICAgMCAKICAg
ICAgICBISUQgRGV2aWNlIERlc2NyaXB0b3I6CiAgICAgICAgICBiTGVuZ3RoICAgICAgICAg
ICAgICAgICA5CiAgICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDMzCiAgICAgICAg
ICBiY2RISUQgICAgICAgICAgICAgICAxLjAwCiAgICAgICAgICBiQ291bnRyeUNvZGUgICAg
ICAgICAgICAwIE5vdCBzdXBwb3J0ZWQKICAgICAgICAgIGJOdW1EZXNjcmlwdG9ycyAgICAg
ICAgIDEKICAgICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgMzQgUmVwb3J0CiAgICAg
ICAgICB3RGVzY3JpcHRvckxlbmd0aCAgICAgMTA0CiAgICAgICAgICBSZXBvcnQgRGVzY3Jp
cHRvcnM6IAogICAgICAgICAgICAqKiBVTkFWQUlMQUJMRSAqKgogICAgICBFbmRwb2ludCBE
ZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDcKICAgICAgICBi
RGVzY3JpcHRvclR5cGUgICAgICAgICA1CiAgICAgICAgYkVuZHBvaW50QWRkcmVzcyAgICAg
MHg4NyAgRVAgNyBJTgogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgIDMKICAgICAg
ICAgIFRyYW5zZmVyIFR5cGUgICAgICAgICAgICBJbnRlcnJ1cHQKICAgICAgICAgIFN5bmNo
IFR5cGUgICAgICAgICAgICAgICBOb25lCiAgICAgICAgICBVc2FnZSBUeXBlICAgICAgICAg
ICAgICAgRGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAweDAwMTAgIDF4IDE2IGJ5
dGVzCiAgICAgICAgYkludGVydmFsICAgICAgICAgICAgICAgMgotLWVuZGNvbGxhcHNlLS0K
CgohIVVTQiBTdHJlYW0gaW5mb3JtYXRpb24KISEtLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0t
c3RhcnRjb2xsYXBzZS0tCgpCbHVlIE1pY3JvcGhvbmVzIFlldGkgU3RlcmVvIE1pY3JvcGhv
bmUgYXQgdXNiLTAwMDA6MDA6MTQuMC03LCBmdWxsIHNwZWVkIDogVVNCIEF1ZGlvCgpQbGF5
YmFjazoKICBTdGF0dXM6IFN0b3AKICBJbnRlcmZhY2UgMQogICAgQWx0c2V0IDEKICAgIEZv
cm1hdDogUzE2X0xFCiAgICBDaGFubmVsczogMgogICAgRW5kcG9pbnQ6IDB4MDEgKDEgT1VU
KSAoU1lOQykKICAgIFJhdGVzOiA0NDEwMCwgNDgwMDAKICAgIEJpdHM6IDE2CiAgICBDaGFu
bmVsIG1hcDogRkwgRlIKCkNhcHR1cmU6CiAgU3RhdHVzOiBTdG9wCiAgSW50ZXJmYWNlIDIK
ICAgIEFsdHNldCAxCiAgICBGb3JtYXQ6IFMxNl9MRQogICAgQ2hhbm5lbHM6IDIKICAgIEVu
ZHBvaW50OiAweDgyICgyIElOKSAoQVNZTkMpCiAgICBSYXRlczogNDQxMDAsIDQ4MDAwCiAg
ICBCaXRzOiAxNgogICAgQ2hhbm5lbCBtYXA6IEZMIEZSCi0tZW5kY29sbGFwc2UtLQoKCiEh
VVNCIE1peGVyIGluZm9ybWF0aW9uCiEhLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0tc3RhcnRj
b2xsYXBzZS0tCgpVU0IgTWl4ZXI6IHVzYl9pZD0weGI1OGM5ZTg0LCBjdHJsaWY9MCwgY3Rs
ZXJyPTAKQ2FyZDogQmx1ZSBNaWNyb3Bob25lcyBZZXRpIFN0ZXJlbyBNaWNyb3Bob25lIGF0
IHVzYi0wMDAwOjAwOjE0LjAtNywgZnVsbCBzcGVlZAogIFVuaXQ6IDkKICAgIENvbnRyb2w6
IG5hbWU9IlNwZWFrZXIgUGxheWJhY2sgVm9sdW1lIiwgaW5kZXg9MAogICAgSW5mbzogaWQ9
OSwgY29udHJvbD0yLCBjbWFzaz0weDMsIGNoYW5uZWxzPTIsIHR5cGU9IlMxNiIKICAgIFZv
bHVtZTogbWluPS0xMDI0MCwgbWF4PTAsIGRCbWluPS00MDAwLCBkQm1heD0wCiAgVW5pdDog
OQogICAgQ29udHJvbDogbmFtZT0iU3BlYWtlciBQbGF5YmFjayBTd2l0Y2giLCBpbmRleD0w
CiAgICBJbmZvOiBpZD05LCBjb250cm9sPTEsIGNtYXNrPTB4MCwgY2hhbm5lbHM9MSwgdHlw
ZT0iSU5WX0JPT0xFQU4iCiAgICBWb2x1bWU6IG1pbj0wLCBtYXg9MSwgZEJtaW49MCwgZEJt
YXg9MAogIFVuaXQ6IDEwCiAgICBDb250cm9sOiBuYW1lPSJNaWMgQ2FwdHVyZSBWb2x1bWUi
LCBpbmRleD0wCiAgICBJbmZvOiBpZD0xMCwgY29udHJvbD0yLCBjbWFzaz0weDMsIGNoYW5u
ZWxzPTIsIHR5cGU9IlMxNiIKICAgIFZvbHVtZTogbWluPS0yMDQ4LCBtYXg9MzU4NCwgZEJt
aW49LTgwMCwgZEJtYXg9MTQwMAogIFVuaXQ6IDEwCiAgICBDb250cm9sOiBuYW1lPSJNaWMg
Q2FwdHVyZSBTd2l0Y2giLCBpbmRleD0wCiAgICBJbmZvOiBpZD0xMCwgY29udHJvbD0xLCBj
bWFzaz0weDAsIGNoYW5uZWxzPTEsIHR5cGU9IklOVl9CT09MRUFOIgogICAgVm9sdW1lOiBt
aW49MCwgbWF4PTEsIGRCbWluPTAsIGRCbWF4PTAKICBVbml0OiAxMwogICAgQ29udHJvbDog
bmFtZT0iTWljIFBsYXliYWNrIFZvbHVtZSIsIGluZGV4PTAKICAgIEluZm86IGlkPTEzLCBj
b250cm9sPTIsIGNtYXNrPTB4MywgY2hhbm5lbHM9MiwgdHlwZT0iUzE2IgogICAgVm9sdW1l
OiBtaW49LTc2ODAsIG1heD0xNzkyLCBkQm1pbj0tMzAwMCwgZEJtYXg9NzAwCiAgVW5pdDog
MTMKICAgIENvbnRyb2w6IG5hbWU9Ik1pYyBQbGF5YmFjayBTd2l0Y2giLCBpbmRleD0wCiAg
ICBJbmZvOiBpZD0xMywgY29udHJvbD0xLCBjbWFzaz0weDAsIGNoYW5uZWxzPTEsIHR5cGU9
IklOVl9CT09MRUFOIgogICAgVm9sdW1lOiBtaW49MCwgbWF4PTEsIGRCbWluPTAsIGRCbWF4
PTAKLS1lbmRjb2xsYXBzZS0tCgoKISFBTFNBIERldmljZSBub2RlcwohIS0tLS0tLS0tLS0t
LS0tLS0tCgpjcnctcnctLS0tKyAxIHJvb3QgYXVkaW8gMTE2LCAgNCBNYXIgMTUgMDY6MzQg
L2Rldi9zbmQvY29udHJvbEMwCmNydy1ydy0tLS0rIDEgcm9vdCBhdWRpbyAxMTYsIDE2IE1h
ciAxNSAwNjozNCAvZGV2L3NuZC9jb250cm9sQzEKY3J3LXJ3LS0tLSsgMSByb290IGF1ZGlv
IDExNiwgMTAgTWFyIDE1IDA2OjM0IC9kZXYvc25kL2NvbnRyb2xDMgpjcnctcnctLS0tKyAx
IHJvb3QgYXVkaW8gMTE2LCAxNSBNYXIgMTUgMDY6MzQgL2Rldi9zbmQvaHdDMUQwCmNydy1y
dy0tLS0rIDEgcm9vdCBhdWRpbyAxMTYsICA5IE1hciAxNSAwNjozNCAvZGV2L3NuZC9od0My
RDAKY3J3LXJ3LS0tLSsgMSByb290IGF1ZGlvIDExNiwgIDMgTWFyIDE1IDE3OjAzIC9kZXYv
c25kL3BjbUMwRDBjCmNydy1ydy0tLS0rIDEgcm9vdCBhdWRpbyAxMTYsICAyIE1hciAxNSAx
NzowMyAvZGV2L3NuZC9wY21DMEQwcApjcnctcnctLS0tKyAxIHJvb3QgYXVkaW8gMTE2LCAx
MiBNYXIgMTUgMTc6MDMgL2Rldi9zbmQvcGNtQzFEMGMKY3J3LXJ3LS0tLSsgMSByb290IGF1
ZGlvIDExNiwgMTEgTWFyIDE1IDE3OjEyIC9kZXYvc25kL3BjbUMxRDBwCmNydy1ydy0tLS0r
IDEgcm9vdCBhdWRpbyAxMTYsIDEzIE1hciAxNSAwNjozNCAvZGV2L3NuZC9wY21DMUQxcApj
cnctcnctLS0tKyAxIHJvb3QgYXVkaW8gMTE2LCAxNCBNYXIgMTUgMDY6MzQgL2Rldi9zbmQv
cGNtQzFEMmMKY3J3LXJ3LS0tLSsgMSByb290IGF1ZGlvIDExNiwgIDUgTWFyIDE3IDAzOjQ5
IC9kZXYvc25kL3BjbUMyRDNwCmNydy1ydy0tLS0rIDEgcm9vdCBhdWRpbyAxMTYsICA2IE1h
ciAxNSAwNjozNCAvZGV2L3NuZC9wY21DMkQ3cApjcnctcnctLS0tKyAxIHJvb3QgYXVkaW8g
MTE2LCAgNyBNYXIgMTUgMDY6MzQgL2Rldi9zbmQvcGNtQzJEOHAKY3J3LXJ3LS0tLSsgMSBy
b290IGF1ZGlvIDExNiwgIDggTWFyIDE1IDA2OjM0IC9kZXYvc25kL3BjbUMyRDlwCmNydy1y
dy0tLS0rIDEgcm9vdCBhdWRpbyAxMTYsICAxIE1hciAxNSAwNjozNCAvZGV2L3NuZC9zZXEK
Y3J3LXJ3LS0tLSsgMSByb290IGF1ZGlvIDExNiwgMzMgTWFyIDE1IDA2OjM0IC9kZXYvc25k
L3RpbWVyCgovZGV2L3NuZC9ieS1pZDoKdG90YWwgMApkcnd4ci14ci14IDIgcm9vdCByb290
ICA2MCBNYXIgMTUgMDY6MzQgLgpkcnd4ci14ci14IDQgcm9vdCByb290IDQyMCBNYXIgMTUg
MDY6MzQgLi4KbHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAgMTIgTWFyIDE1IDA2OjM0IHVzYi1C
bHVlX01pY3JvcGhvbmVzX1lldGlfU3RlcmVvX01pY3JvcGhvbmVfUkVWOC0wMCAtPiAuLi9j
b250cm9sQzAKCi9kZXYvc25kL2J5LXBhdGg6CnRvdGFsIDAKZHJ3eHIteHIteCAyIHJvb3Qg
cm9vdCAxMjAgTWFyIDE1IDA2OjM0IC4KZHJ3eHIteHIteCA0IHJvb3Qgcm9vdCA0MjAgTWFy
IDE1IDA2OjM0IC4uCmxyd3hyd3hyd3ggMSByb290IHJvb3QgIDEyIE1hciAxNSAwNjozNCBw
Y2ktMDAwMDowMDoxNC4wLXVzYi0wOjc6MS4wIC0+IC4uL2NvbnRyb2xDMApscnd4cnd4cnd4
IDEgcm9vdCByb290ICAxMiBNYXIgMTUgMDY6MzQgcGNpLTAwMDA6MDA6MTQuMC11c2J2Mi0w
Ojc6MS4wIC0+IC4uL2NvbnRyb2xDMApscnd4cnd4cnd4IDEgcm9vdCByb290ICAxMiBNYXIg
MTUgMDY6MzQgcGNpLTAwMDA6MDA6MWYuMyAtPiAuLi9jb250cm9sQzEKbHJ3eHJ3eHJ3eCAx
IHJvb3Qgcm9vdCAgMTIgTWFyIDE1IDA2OjM0IHBjaS0wMDAwOjAzOjAwLjEgLT4gLi4vY29u
dHJvbEMyCgoKISFBcGxheS9BcmVjb3JkIG91dHB1dAohIS0tLS0tLS0tLS0tLS0tLS0tLS0t
CgpBUExBWQoKKioqKiBMaXN0IG9mIFBMQVlCQUNLIEhhcmR3YXJlIERldmljZXMgKioqKgpj
YXJkIDA6IE1pY3JvcGhvbmUgW1lldGkgU3RlcmVvIE1pY3JvcGhvbmVdLCBkZXZpY2UgMDog
VVNCIEF1ZGlvIFtVU0IgQXVkaW9dCiAgU3ViZGV2aWNlczogMS8xCiAgU3ViZGV2aWNlICMw
OiBzdWJkZXZpY2UgIzAKY2FyZCAxOiBQQ0ggW0hEQSBJbnRlbCBQQ0hdLCBkZXZpY2UgMDog
R2VuZXJpYyBBbmFsb2cgW0dlbmVyaWMgQW5hbG9nXQogIFN1YmRldmljZXM6IDEvMQogIFN1
YmRldmljZSAjMDogc3ViZGV2aWNlICMwCmNhcmQgMTogUENIIFtIREEgSW50ZWwgUENIXSwg
ZGV2aWNlIDE6IEdlbmVyaWMgRGlnaXRhbCBbR2VuZXJpYyBEaWdpdGFsXQogIFN1YmRldmlj
ZXM6IDEvMQogIFN1YmRldmljZSAjMDogc3ViZGV2aWNlICMwCmNhcmQgMjogSERNSSBbSERB
IEFUSSBIRE1JXSwgZGV2aWNlIDM6IEhETUkgMCBbTUFHIDI3MVFQWCBFMl0KICBTdWJkZXZp
Y2VzOiAxLzEKICBTdWJkZXZpY2UgIzA6IHN1YmRldmljZSAjMApjYXJkIDI6IEhETUkgW0hE
QSBBVEkgSERNSV0sIGRldmljZSA3OiBIRE1JIDEgW0RFTEwgUzI3MjJER01dCiAgU3ViZGV2
aWNlczogMS8xCiAgU3ViZGV2aWNlICMwOiBzdWJkZXZpY2UgIzAKY2FyZCAyOiBIRE1JIFtI
REEgQVRJIEhETUldLCBkZXZpY2UgODogSERNSSAyIFtWRzI0OF0KICBTdWJkZXZpY2VzOiAx
LzEKICBTdWJkZXZpY2UgIzA6IHN1YmRldmljZSAjMApjYXJkIDI6IEhETUkgW0hEQSBBVEkg
SERNSV0sIGRldmljZSA5OiBIRE1JIDMgW0hETUkgM10KICBTdWJkZXZpY2VzOiAxLzEKICBT
dWJkZXZpY2UgIzA6IHN1YmRldmljZSAjMAoKQVJFQ09SRAoKKioqKiBMaXN0IG9mIENBUFRV
UkUgSGFyZHdhcmUgRGV2aWNlcyAqKioqCmNhcmQgMDogTWljcm9waG9uZSBbWWV0aSBTdGVy
ZW8gTWljcm9waG9uZV0sIGRldmljZSAwOiBVU0IgQXVkaW8gW1VTQiBBdWRpb10KICBTdWJk
ZXZpY2VzOiAxLzEKICBTdWJkZXZpY2UgIzA6IHN1YmRldmljZSAjMApjYXJkIDE6IFBDSCBb
SERBIEludGVsIFBDSF0sIGRldmljZSAwOiBHZW5lcmljIEFuYWxvZyBbR2VuZXJpYyBBbmFs
b2ddCiAgU3ViZGV2aWNlczogMS8xCiAgU3ViZGV2aWNlICMwOiBzdWJkZXZpY2UgIzAKY2Fy
ZCAxOiBQQ0ggW0hEQSBJbnRlbCBQQ0hdLCBkZXZpY2UgMjogR2VuZXJpYyBBbHQgQW5hbG9n
IFtHZW5lcmljIEFsdCBBbmFsb2ddCiAgU3ViZGV2aWNlczogMS8xCiAgU3ViZGV2aWNlICMw
OiBzdWJkZXZpY2UgIzAKCiEhQW1peGVyIG91dHB1dAohIS0tLS0tLS0tLS0tLS0KCiEhLS0t
LS0tLU1peGVyIGNvbnRyb2xzIGZvciBjYXJkIE1pY3JvcGhvbmUKCkNhcmQgc3lzZGVmYXVs
dDowICdNaWNyb3Bob25lJy8nQmx1ZSBNaWNyb3Bob25lcyBZZXRpIFN0ZXJlbyBNaWNyb3Bo
b25lIGF0IHVzYi0wMDAwOjAwOjE0LjAtNywgZnVsbCBzcGVlZCcKICBNaXhlciBuYW1lCTog
J1VTQiBNaXhlcicKICBDb21wb25lbnRzCTogJ1VTQmI1OGM6OWU4NCcKICBDb250cm9scyAg
ICAgIDogOAogIFNpbXBsZSBjdHJscyAgOiAyClNpbXBsZSBtaXhlciBjb250cm9sICdTcGVh
a2VyJywwCiAgQ2FwYWJpbGl0aWVzOiBwdm9sdW1lIHBzd2l0Y2ggcHN3aXRjaC1qb2luZWQK
ICBQbGF5YmFjayBjaGFubmVsczogRnJvbnQgTGVmdCAtIEZyb250IFJpZ2h0CiAgTGltaXRz
OiBQbGF5YmFjayAwIC0gNDAKICBNb25vOgogIEZyb250IExlZnQ6IFBsYXliYWNrIDE3IFs0
MiVdIFstMjMuMDBkQl0gW29uXQogIEZyb250IFJpZ2h0OiBQbGF5YmFjayAxNyBbNDIlXSBb
LTIzLjAwZEJdIFtvbl0KU2ltcGxlIG1peGVyIGNvbnRyb2wgJ01pYycsMAogIENhcGFiaWxp
dGllczogcHZvbHVtZSBjdm9sdW1lIHBzd2l0Y2ggcHN3aXRjaC1qb2luZWQgY3N3aXRjaCBj
c3dpdGNoLWpvaW5lZAogIFBsYXliYWNrIGNoYW5uZWxzOiBGcm9udCBMZWZ0IC0gRnJvbnQg
UmlnaHQKICBDYXB0dXJlIGNoYW5uZWxzOiBGcm9udCBMZWZ0IC0gRnJvbnQgUmlnaHQKICBM
aW1pdHM6IFBsYXliYWNrIDAgLSAzNyBDYXB0dXJlIDAgLSAyMgogIEZyb250IExlZnQ6IFBs
YXliYWNrIDM0IFs5MiVdIFs0LjAwZEJdIFtvbl0gQ2FwdHVyZSA4IFszNiVdIFswLjAwZEJd
IFtvbl0KICBGcm9udCBSaWdodDogUGxheWJhY2sgMzQgWzkyJV0gWzQuMDBkQl0gW29uXSBD
YXB0dXJlIDggWzM2JV0gWzAuMDBkQl0gW29uXQoKISEtLS0tLS0tTWl4ZXIgY29udHJvbHMg
Zm9yIGNhcmQgUENICgpDYXJkIHN5c2RlZmF1bHQ6MSAnUENIJy8nSERBIEludGVsIFBDSCBh
dCAweDQ4MTAxMTAwMDAgaXJxIDE4OCcKICBNaXhlciBuYW1lCTogJ1JlYWx0ZWsgR2VuZXJp
YycKICBDb21wb25lbnRzCTogJ0hEQToxMGVjMGIwMCwxNDYyZWM3OSwwMDEwMDAwMScKICBD
b250cm9scyAgICAgIDogNDAKICBTaW1wbGUgY3RybHMgIDogMTcKU2ltcGxlIG1peGVyIGNv
bnRyb2wgJ01hc3RlcicsMAogIENhcGFiaWxpdGllczogcHZvbHVtZSBwdm9sdW1lLWpvaW5l
ZCBwc3dpdGNoIHBzd2l0Y2gtam9pbmVkCiAgUGxheWJhY2sgY2hhbm5lbHM6IE1vbm8KICBM
aW1pdHM6IFBsYXliYWNrIDAgLSA4NwogIE1vbm86IFBsYXliYWNrIDY0IFs3NCVdIFstMTcu
MjVkQl0gW29uXQpTaW1wbGUgbWl4ZXIgY29udHJvbCAnSGVhZHBob25lJywwCiAgQ2FwYWJp
bGl0aWVzOiBwdm9sdW1lIHBzd2l0Y2gKICBQbGF5YmFjayBjaGFubmVsczogRnJvbnQgTGVm
dCAtIEZyb250IFJpZ2h0CiAgTGltaXRzOiBQbGF5YmFjayAwIC0gODcKICBNb25vOgogIEZy
b250IExlZnQ6IFBsYXliYWNrIDg3IFsxMDAlXSBbMC4wMGRCXSBbb25dCiAgRnJvbnQgUmln
aHQ6IFBsYXliYWNrIDg3IFsxMDAlXSBbMC4wMGRCXSBbb25dClNpbXBsZSBtaXhlciBjb250
cm9sICdQQ00nLDAKICBDYXBhYmlsaXRpZXM6IHB2b2x1bWUKICBQbGF5YmFjayBjaGFubmVs
czogRnJvbnQgTGVmdCAtIEZyb250IFJpZ2h0CiAgTGltaXRzOiBQbGF5YmFjayAwIC0gMjU1
CiAgTW9ubzoKICBGcm9udCBMZWZ0OiBQbGF5YmFjayAyNTUgWzEwMCVdIFswLjAwZEJdCiAg
RnJvbnQgUmlnaHQ6IFBsYXliYWNrIDI1NSBbMTAwJV0gWzAuMDBkQl0KU2ltcGxlIG1peGVy
IGNvbnRyb2wgJ0Zyb250JywwCiAgQ2FwYWJpbGl0aWVzOiBwdm9sdW1lIHBzd2l0Y2gKICBQ
bGF5YmFjayBjaGFubmVsczogRnJvbnQgTGVmdCAtIEZyb250IFJpZ2h0CiAgTGltaXRzOiBQ
bGF5YmFjayAwIC0gODcKICBNb25vOgogIEZyb250IExlZnQ6IFBsYXliYWNrIDg3IFsxMDAl
XSBbMC4wMGRCXSBbb2ZmXQogIEZyb250IFJpZ2h0OiBQbGF5YmFjayA4NyBbMTAwJV0gWzAu
MDBkQl0gW29mZl0KU2ltcGxlIG1peGVyIGNvbnRyb2wgJ0Zyb250IE1pYyBCb29zdCcsMAog
IENhcGFiaWxpdGllczogdm9sdW1lCiAgUGxheWJhY2sgY2hhbm5lbHM6IEZyb250IExlZnQg
LSBGcm9udCBSaWdodAogIENhcHR1cmUgY2hhbm5lbHM6IEZyb250IExlZnQgLSBGcm9udCBS
aWdodAogIExpbWl0czogMCAtIDMKICBGcm9udCBMZWZ0OiAwIFswJV0gWzAuMDBkQl0KICBG
cm9udCBSaWdodDogMCBbMCVdIFswLjAwZEJdClNpbXBsZSBtaXhlciBjb250cm9sICdTdXJy
b3VuZCcsMAogIENhcGFiaWxpdGllczogcHZvbHVtZSBwc3dpdGNoCiAgUGxheWJhY2sgY2hh
bm5lbHM6IEZyb250IExlZnQgLSBGcm9udCBSaWdodAogIExpbWl0czogUGxheWJhY2sgMCAt
IDg3CiAgTW9ubzoKICBGcm9udCBMZWZ0OiBQbGF5YmFjayAwIFswJV0gWy02NS4yNWRCXSBb
b2ZmXQogIEZyb250IFJpZ2h0OiBQbGF5YmFjayAwIFswJV0gWy02NS4yNWRCXSBbb2ZmXQpT
aW1wbGUgbWl4ZXIgY29udHJvbCAnQ2VudGVyJywwCiAgQ2FwYWJpbGl0aWVzOiBwdm9sdW1l
IHB2b2x1bWUtam9pbmVkIHBzd2l0Y2ggcHN3aXRjaC1qb2luZWQKICBQbGF5YmFjayBjaGFu
bmVsczogTW9ubwogIExpbWl0czogUGxheWJhY2sgMCAtIDg3CiAgTW9ubzogUGxheWJhY2sg
MCBbMCVdIFstNjUuMjVkQl0gW29mZl0KU2ltcGxlIG1peGVyIGNvbnRyb2wgJ0xGRScsMAog
IENhcGFiaWxpdGllczogcHZvbHVtZSBwdm9sdW1lLWpvaW5lZCBwc3dpdGNoIHBzd2l0Y2gt
am9pbmVkCiAgUGxheWJhY2sgY2hhbm5lbHM6IE1vbm8KICBMaW1pdHM6IFBsYXliYWNrIDAg
LSA4NwogIE1vbm86IFBsYXliYWNrIDAgWzAlXSBbLTY1LjI1ZEJdIFtvZmZdClNpbXBsZSBt
aXhlciBjb250cm9sICdMaW5lIEJvb3N0JywwCiAgQ2FwYWJpbGl0aWVzOiB2b2x1bWUKICBQ
bGF5YmFjayBjaGFubmVsczogRnJvbnQgTGVmdCAtIEZyb250IFJpZ2h0CiAgQ2FwdHVyZSBj
aGFubmVsczogRnJvbnQgTGVmdCAtIEZyb250IFJpZ2h0CiAgTGltaXRzOiAwIC0gMwogIEZy
b250IExlZnQ6IDAgWzAlXSBbMC4wMGRCXQogIEZyb250IFJpZ2h0OiAwIFswJV0gWzAuMDBk
Ql0KU2ltcGxlIG1peGVyIGNvbnRyb2wgJ0lFQzk1OCcsMAogIENhcGFiaWxpdGllczogcHN3
aXRjaCBwc3dpdGNoLWpvaW5lZAogIFBsYXliYWNrIGNoYW5uZWxzOiBNb25vCiAgTW9ubzog
UGxheWJhY2sgW29uXQpTaW1wbGUgbWl4ZXIgY29udHJvbCAnSUVDOTU4IERlZmF1bHQgUENN
JywwCiAgQ2FwYWJpbGl0aWVzOiBwc3dpdGNoIHBzd2l0Y2gtam9pbmVkCiAgUGxheWJhY2sg
Y2hhbm5lbHM6IE1vbm8KICBNb25vOiBQbGF5YmFjayBbb25dClNpbXBsZSBtaXhlciBjb250
cm9sICdDYXB0dXJlJywwCiAgQ2FwYWJpbGl0aWVzOiBjdm9sdW1lIGNzd2l0Y2gKICBDYXB0
dXJlIGNoYW5uZWxzOiBGcm9udCBMZWZ0IC0gRnJvbnQgUmlnaHQKICBMaW1pdHM6IENhcHR1
cmUgMCAtIDYzCiAgRnJvbnQgTGVmdDogQ2FwdHVyZSAzOSBbNjIlXSBbMTIuMDBkQl0gW29u
XQogIEZyb250IFJpZ2h0OiBDYXB0dXJlIDM5IFs2MiVdIFsxMi4wMGRCXSBbb25dClNpbXBs
ZSBtaXhlciBjb250cm9sICdDYXB0dXJlJywxCiAgQ2FwYWJpbGl0aWVzOiBjdm9sdW1lIGNz
d2l0Y2gKICBDYXB0dXJlIGNoYW5uZWxzOiBGcm9udCBMZWZ0IC0gRnJvbnQgUmlnaHQKICBM
aW1pdHM6IENhcHR1cmUgMCAtIDYzCiAgRnJvbnQgTGVmdDogQ2FwdHVyZSAwIFswJV0gWy0x
Ny4yNWRCXSBbb2ZmXQogIEZyb250IFJpZ2h0OiBDYXB0dXJlIDAgWzAlXSBbLTE3LjI1ZEJd
IFtvZmZdClNpbXBsZSBtaXhlciBjb250cm9sICdBdXRvLU11dGUgTW9kZScsMAogIENhcGFi
aWxpdGllczogZW51bQogIEl0ZW1zOiAnRGlzYWJsZWQnICdFbmFibGVkJwogIEl0ZW0wOiAn
RW5hYmxlZCcKU2ltcGxlIG1peGVyIGNvbnRyb2wgJ0lucHV0IFNvdXJjZScsMAogIENhcGFi
aWxpdGllczogY2VudW0KICBJdGVtczogJ1JlYXIgTWljJyAnRnJvbnQgTWljJyAnTGluZScK
ICBJdGVtMDogJ0Zyb250IE1pYycKU2ltcGxlIG1peGVyIGNvbnRyb2wgJ0lucHV0IFNvdXJj
ZScsMQogIENhcGFiaWxpdGllczogY2VudW0KICBJdGVtczogJ1JlYXIgTWljJyAnRnJvbnQg
TWljJyAnTGluZScKICBJdGVtMDogJ1JlYXIgTWljJwpTaW1wbGUgbWl4ZXIgY29udHJvbCAn
UmVhciBNaWMgQm9vc3QnLDAKICBDYXBhYmlsaXRpZXM6IHZvbHVtZQogIFBsYXliYWNrIGNo
YW5uZWxzOiBGcm9udCBMZWZ0IC0gRnJvbnQgUmlnaHQKICBDYXB0dXJlIGNoYW5uZWxzOiBG
cm9udCBMZWZ0IC0gRnJvbnQgUmlnaHQKICBMaW1pdHM6IDAgLSAzCiAgRnJvbnQgTGVmdDog
MCBbMCVdIFswLjAwZEJdCiAgRnJvbnQgUmlnaHQ6IDAgWzAlXSBbMC4wMGRCXQoKISEtLS0t
LS0tTWl4ZXIgY29udHJvbHMgZm9yIGNhcmQgSERNSQoKQ2FyZCBzeXNkZWZhdWx0OjIgJ0hE
TUknLydIREEgQVRJIEhETUkgYXQgMHhhMDEyMDAwMCBpcnEgMTg3JwogIE1peGVyIG5hbWUJ
OiAnQVRJIFI2eHggSERNSScKICBDb21wb25lbnRzCTogJ0hEQToxMDAyYWEwMSwwMGFhMDEw
MCwwMDEwMDgwMCcKICBDb250cm9scyAgICAgIDogMjgKICBTaW1wbGUgY3RybHMgIDogNApT
aW1wbGUgbWl4ZXIgY29udHJvbCAnSUVDOTU4JywwCiAgQ2FwYWJpbGl0aWVzOiBwc3dpdGNo
IHBzd2l0Y2gtam9pbmVkCiAgUGxheWJhY2sgY2hhbm5lbHM6IE1vbm8KICBNb25vOiBQbGF5
YmFjayBbb25dClNpbXBsZSBtaXhlciBjb250cm9sICdJRUM5NTgnLDEKICBDYXBhYmlsaXRp
ZXM6IHBzd2l0Y2ggcHN3aXRjaC1qb2luZWQKICBQbGF5YmFjayBjaGFubmVsczogTW9ubwog
IE1vbm86IFBsYXliYWNrIFtvbl0KU2ltcGxlIG1peGVyIGNvbnRyb2wgJ0lFQzk1OCcsMgog
IENhcGFiaWxpdGllczogcHN3aXRjaCBwc3dpdGNoLWpvaW5lZAogIFBsYXliYWNrIGNoYW5u
ZWxzOiBNb25vCiAgTW9ubzogUGxheWJhY2sgW29uXQpTaW1wbGUgbWl4ZXIgY29udHJvbCAn
SUVDOTU4JywzCiAgQ2FwYWJpbGl0aWVzOiBwc3dpdGNoIHBzd2l0Y2gtam9pbmVkCiAgUGxh
eWJhY2sgY2hhbm5lbHM6IE1vbm8KICBNb25vOiBQbGF5YmFjayBbb25dCgoKISFBbHNhY3Rs
IG91dHB1dAohIS0tLS0tLS0tLS0tLS0tCgotLXN0YXJ0Y29sbGFwc2UtLQpzdGF0ZS5NaWNy
b3Bob25lIHsKCWNvbnRyb2wuMSB7CgkJaWZhY2UgUENNCgkJbmFtZSAnUGxheWJhY2sgQ2hh
bm5lbCBNYXAnCgkJdmFsdWUuMCAwCgkJdmFsdWUuMSAwCgkJY29tbWVudCB7CgkJCWFjY2Vz
cyAncmVhZCB2b2xhdGlsZScKCQkJdHlwZSBJTlRFR0VSCgkJCWNvdW50IDIKCQkJcmFuZ2Ug
JzAgLSAzNicKCQl9Cgl9Cgljb250cm9sLjIgewoJCWlmYWNlIFBDTQoJCW5hbWUgJ0NhcHR1
cmUgQ2hhbm5lbCBNYXAnCgkJdmFsdWUuMCAwCgkJdmFsdWUuMSAwCgkJY29tbWVudCB7CgkJ
CWFjY2VzcyAncmVhZCB2b2xhdGlsZScKCQkJdHlwZSBJTlRFR0VSCgkJCWNvdW50IDIKCQkJ
cmFuZ2UgJzAgLSAzNicKCQl9Cgl9Cgljb250cm9sLjMgewoJCWlmYWNlIE1JWEVSCgkJbmFt
ZSAnTWljIFBsYXliYWNrIFN3aXRjaCcKCQl2YWx1ZSB0cnVlCgkJY29tbWVudCB7CgkJCWFj
Y2VzcyAncmVhZCB3cml0ZScKCQkJdHlwZSBCT09MRUFOCgkJCWNvdW50IDEKCQl9Cgl9Cglj
b250cm9sLjQgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnTWljIFBsYXliYWNrIFZvbHVtZScK
CQl2YWx1ZS4wIDM0CgkJdmFsdWUuMSAzNAoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQg
d3JpdGUnCgkJCXR5cGUgSU5URUdFUgoJCQljb3VudCAyCgkJCXJhbmdlICcwIC0gMzcnCgkJ
CWRibWluIC0zMDAwCgkJCWRibWF4IDcwMAoJCQlkYnZhbHVlLjAgNDAwCgkJCWRidmFsdWUu
MSA0MDAKCQl9Cgl9Cgljb250cm9sLjUgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnU3BlYWtl
ciBQbGF5YmFjayBTd2l0Y2gnCgkJdmFsdWUgdHJ1ZQoJCWNvbW1lbnQgewoJCQlhY2Nlc3Mg
J3JlYWQgd3JpdGUnCgkJCXR5cGUgQk9PTEVBTgoJCQljb3VudCAxCgkJfQoJfQoJY29udHJv
bC42IHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUgJ1NwZWFrZXIgUGxheWJhY2sgVm9sdW1lJwoJ
CXZhbHVlLjAgMTcKCQl2YWx1ZS4xIDE3CgkJY29tbWVudCB7CgkJCWFjY2VzcyAncmVhZCB3
cml0ZScKCQkJdHlwZSBJTlRFR0VSCgkJCWNvdW50IDIKCQkJcmFuZ2UgJzAgLSA0MCcKCQkJ
ZGJtaW4gLTQwMDAKCQkJZGJtYXggMAoJCQlkYnZhbHVlLjAgLTIzMDAKCQkJZGJ2YWx1ZS4x
IC0yMzAwCgkJfQoJfQoJY29udHJvbC43IHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUgJ01pYyBD
YXB0dXJlIFN3aXRjaCcKCQl2YWx1ZSB0cnVlCgkJY29tbWVudCB7CgkJCWFjY2VzcyAncmVh
ZCB3cml0ZScKCQkJdHlwZSBCT09MRUFOCgkJCWNvdW50IDEKCQl9Cgl9Cgljb250cm9sLjgg
ewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnTWljIENhcHR1cmUgVm9sdW1lJwoJCXZhbHVlLjAg
OAoJCXZhbHVlLjEgOAoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUnCgkJCXR5
cGUgSU5URUdFUgoJCQljb3VudCAyCgkJCXJhbmdlICcwIC0gMjInCgkJCWRibWluIC04MDAK
CQkJZGJtYXggMTQwMAoJCQlkYnZhbHVlLjAgMAoJCQlkYnZhbHVlLjEgMAoJCX0KCX0KfQpz
dGF0ZS5QQ0ggewoJY29udHJvbC4xIHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUgJ0Zyb250IFBs
YXliYWNrIFZvbHVtZScKCQl2YWx1ZS4wIDg3CgkJdmFsdWUuMSA4NwoJCWNvbW1lbnQgewoJ
CQlhY2Nlc3MgJ3JlYWQgd3JpdGUnCgkJCXR5cGUgSU5URUdFUgoJCQljb3VudCAyCgkJCXJh
bmdlICcwIC0gODcnCgkJCWRibWluIC02NTI1CgkJCWRibWF4IDAKCQkJZGJ2YWx1ZS4wIDAK
CQkJZGJ2YWx1ZS4xIDAKCQl9Cgl9Cgljb250cm9sLjIgewoJCWlmYWNlIE1JWEVSCgkJbmFt
ZSAnRnJvbnQgUGxheWJhY2sgU3dpdGNoJwoJCXZhbHVlLjAgZmFsc2UKCQl2YWx1ZS4xIGZh
bHNlCgkJY29tbWVudCB7CgkJCWFjY2VzcyAncmVhZCB3cml0ZScKCQkJdHlwZSBCT09MRUFO
CgkJCWNvdW50IDIKCQl9Cgl9Cgljb250cm9sLjMgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAn
U3Vycm91bmQgUGxheWJhY2sgVm9sdW1lJwoJCXZhbHVlLjAgMAoJCXZhbHVlLjEgMAoJCWNv
bW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUnCgkJCXR5cGUgSU5URUdFUgoJCQljb3Vu
dCAyCgkJCXJhbmdlICcwIC0gODcnCgkJCWRibWluIC02NTI1CgkJCWRibWF4IDAKCQkJZGJ2
YWx1ZS4wIC02NTI1CgkJCWRidmFsdWUuMSAtNjUyNQoJCX0KCX0KCWNvbnRyb2wuNCB7CgkJ
aWZhY2UgTUlYRVIKCQluYW1lICdTdXJyb3VuZCBQbGF5YmFjayBTd2l0Y2gnCgkJdmFsdWUu
MCBmYWxzZQoJCXZhbHVlLjEgZmFsc2UKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdy
aXRlJwoJCQl0eXBlIEJPT0xFQU4KCQkJY291bnQgMgoJCX0KCX0KCWNvbnRyb2wuNSB7CgkJ
aWZhY2UgTUlYRVIKCQluYW1lICdDZW50ZXIgUGxheWJhY2sgVm9sdW1lJwoJCXZhbHVlIDAK
CQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIElOVEVHRVIKCQkJ
Y291bnQgMQoJCQlyYW5nZSAnMCAtIDg3JwoJCQlkYm1pbiAtNjUyNQoJCQlkYm1heCAwCgkJ
CWRidmFsdWUuMCAtNjUyNQoJCX0KCX0KCWNvbnRyb2wuNiB7CgkJaWZhY2UgTUlYRVIKCQlu
YW1lICdMRkUgUGxheWJhY2sgVm9sdW1lJwoJCXZhbHVlIDAKCQljb21tZW50IHsKCQkJYWNj
ZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIElOVEVHRVIKCQkJY291bnQgMQoJCQlyYW5nZSAn
MCAtIDg3JwoJCQlkYm1pbiAtNjUyNQoJCQlkYm1heCAwCgkJCWRidmFsdWUuMCAtNjUyNQoJ
CX0KCX0KCWNvbnRyb2wuNyB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdDZW50ZXIgUGxheWJh
Y2sgU3dpdGNoJwoJCXZhbHVlIGZhbHNlCgkJY29tbWVudCB7CgkJCWFjY2VzcyAncmVhZCB3
cml0ZScKCQkJdHlwZSBCT09MRUFOCgkJCWNvdW50IDEKCQl9Cgl9Cgljb250cm9sLjggewoJ
CWlmYWNlIE1JWEVSCgkJbmFtZSAnTEZFIFBsYXliYWNrIFN3aXRjaCcKCQl2YWx1ZSBmYWxz
ZQoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUnCgkJCXR5cGUgQk9PTEVBTgoJ
CQljb3VudCAxCgkJfQoJfQoJY29udHJvbC45IHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUgJ0hl
YWRwaG9uZSBQbGF5YmFjayBWb2x1bWUnCgkJdmFsdWUuMCA4NwoJCXZhbHVlLjEgODcKCQlj
b21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIElOVEVHRVIKCQkJY291
bnQgMgoJCQlyYW5nZSAnMCAtIDg3JwoJCQlkYm1pbiAtNjUyNQoJCQlkYm1heCAwCgkJCWRi
dmFsdWUuMCAwCgkJCWRidmFsdWUuMSAwCgkJfQoJfQoJY29udHJvbC4xMCB7CgkJaWZhY2Ug
TUlYRVIKCQluYW1lICdIZWFkcGhvbmUgUGxheWJhY2sgU3dpdGNoJwoJCXZhbHVlLjAgdHJ1
ZQoJCXZhbHVlLjEgdHJ1ZQoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUnCgkJ
CXR5cGUgQk9PTEVBTgoJCQljb3VudCAyCgkJfQoJfQoJY29udHJvbC4xMSB7CgkJaWZhY2Ug
TUlYRVIKCQluYW1lICdBdXRvLU11dGUgTW9kZScKCQl2YWx1ZSBFbmFibGVkCgkJY29tbWVu
dCB7CgkJCWFjY2VzcyAncmVhZCB3cml0ZScKCQkJdHlwZSBFTlVNRVJBVEVECgkJCWNvdW50
IDEKCQkJaXRlbS4wIERpc2FibGVkCgkJCWl0ZW0uMSBFbmFibGVkCgkJfQoJfQoJY29udHJv
bC4xMiB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdJbnB1dCBTb3VyY2UnCgkJdmFsdWUgJ0Zy
b250IE1pYycKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIEVO
VU1FUkFURUQKCQkJY291bnQgMQoJCQlpdGVtLjAgJ1JlYXIgTWljJwoJCQlpdGVtLjEgJ0Zy
b250IE1pYycKCQkJaXRlbS4yIExpbmUKCQl9Cgl9Cgljb250cm9sLjEzIHsKCQlpZmFjZSBN
SVhFUgoJCW5hbWUgJ0lucHV0IFNvdXJjZScKCQlpbmRleCAxCgkJdmFsdWUgJ1JlYXIgTWlj
JwoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUnCgkJCXR5cGUgRU5VTUVSQVRF
RAoJCQljb3VudCAxCgkJCWl0ZW0uMCAnUmVhciBNaWMnCgkJCWl0ZW0uMSAnRnJvbnQgTWlj
JwoJCQlpdGVtLjIgTGluZQoJCX0KCX0KCWNvbnRyb2wuMTQgewoJCWlmYWNlIE1JWEVSCgkJ
bmFtZSAnQ2FwdHVyZSBWb2x1bWUnCgkJdmFsdWUuMCAzOQoJCXZhbHVlLjEgMzkKCQljb21t
ZW50IHsKCQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIElOVEVHRVIKCQkJY291bnQg
MgoJCQlyYW5nZSAnMCAtIDYzJwoJCQlkYm1pbiAtMTcyNQoJCQlkYm1heCAzMDAwCgkJCWRi
dmFsdWUuMCAxMjAwCgkJCWRidmFsdWUuMSAxMjAwCgkJfQoJfQoJY29udHJvbC4xNSB7CgkJ
aWZhY2UgTUlYRVIKCQluYW1lICdDYXB0dXJlIFN3aXRjaCcKCQl2YWx1ZS4wIHRydWUKCQl2
YWx1ZS4xIHRydWUKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBl
IEJPT0xFQU4KCQkJY291bnQgMgoJCX0KCX0KCWNvbnRyb2wuMTYgewoJCWlmYWNlIE1JWEVS
CgkJbmFtZSAnQ2FwdHVyZSBWb2x1bWUnCgkJaW5kZXggMQoJCXZhbHVlLjAgMAoJCXZhbHVl
LjEgMAoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUnCgkJCXR5cGUgSU5URUdF
UgoJCQljb3VudCAyCgkJCXJhbmdlICcwIC0gNjMnCgkJCWRibWluIC0xNzI1CgkJCWRibWF4
IDMwMDAKCQkJZGJ2YWx1ZS4wIC0xNzI1CgkJCWRidmFsdWUuMSAtMTcyNQoJCX0KCX0KCWNv
bnRyb2wuMTcgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnQ2FwdHVyZSBTd2l0Y2gnCgkJaW5k
ZXggMQoJCXZhbHVlLjAgZmFsc2UKCQl2YWx1ZS4xIGZhbHNlCgkJY29tbWVudCB7CgkJCWFj
Y2VzcyAncmVhZCB3cml0ZScKCQkJdHlwZSBCT09MRUFOCgkJCWNvdW50IDIKCQl9Cgl9Cglj
b250cm9sLjE4IHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUgJ1JlYXIgTWljIEJvb3N0IFZvbHVt
ZScKCQl2YWx1ZS4wIDAKCQl2YWx1ZS4xIDAKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFk
IHdyaXRlJwoJCQl0eXBlIElOVEVHRVIKCQkJY291bnQgMgoJCQlyYW5nZSAnMCAtIDMnCgkJ
CWRibWluIDAKCQkJZGJtYXggMzAwMAoJCQlkYnZhbHVlLjAgMAoJCQlkYnZhbHVlLjEgMAoJ
CX0KCX0KCWNvbnRyb2wuMTkgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnRnJvbnQgTWljIEJv
b3N0IFZvbHVtZScKCQl2YWx1ZS4wIDAKCQl2YWx1ZS4xIDAKCQljb21tZW50IHsKCQkJYWNj
ZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIElOVEVHRVIKCQkJY291bnQgMgoJCQlyYW5nZSAn
MCAtIDMnCgkJCWRibWluIDAKCQkJZGJtYXggMzAwMAoJCQlkYnZhbHVlLjAgMAoJCQlkYnZh
bHVlLjEgMAoJCX0KCX0KCWNvbnRyb2wuMjAgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnTGlu
ZSBCb29zdCBWb2x1bWUnCgkJdmFsdWUuMCAwCgkJdmFsdWUuMSAwCgkJY29tbWVudCB7CgkJ
CWFjY2VzcyAncmVhZCB3cml0ZScKCQkJdHlwZSBJTlRFR0VSCgkJCWNvdW50IDIKCQkJcmFu
Z2UgJzAgLSAzJwoJCQlkYm1pbiAwCgkJCWRibWF4IDMwMDAKCQkJZGJ2YWx1ZS4wIDAKCQkJ
ZGJ2YWx1ZS4xIDAKCQl9Cgl9Cgljb250cm9sLjIxIHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUg
J0lFQzk1OCBQbGF5YmFjayBDb24gTWFzaycKCQl2YWx1ZSAnMGZmZjAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMCcKCQljb21tZW50IHsKCQkJYWNjZXNzIHJlYWQKCQkJdHlwZSBJRUM5NTgK
CQkJY291bnQgMQoJCX0KCX0KCWNvbnRyb2wuMjIgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAn
SUVDOTU4IFBsYXliYWNrIFBybyBNYXNrJwoJCXZhbHVlICcwZjAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwJwoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgcmVhZAoJCQl0eXBlIElFQzk1OAoJ
CQljb3VudCAxCgkJfQoJfQoJY29udHJvbC4yMyB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdJ
RUM5NTggUGxheWJhY2sgRGVmYXVsdCcKCQl2YWx1ZSAnMDQwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMCcKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIElF
Qzk1OAoJCQljb3VudCAxCgkJfQoJfQoJY29udHJvbC4yNCB7CgkJaWZhY2UgTUlYRVIKCQlu
YW1lICdJRUM5NTggUGxheWJhY2sgU3dpdGNoJwoJCXZhbHVlIHRydWUKCQljb21tZW50IHsK
CQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIEJPT0xFQU4KCQkJY291bnQgMQoJCX0K
CX0KCWNvbnRyb2wuMjUgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnSUVDOTU4IERlZmF1bHQg
UENNIFBsYXliYWNrIFN3aXRjaCcKCQl2YWx1ZSB0cnVlCgkJY29tbWVudCB7CgkJCWFjY2Vz
cyAncmVhZCB3cml0ZScKCQkJdHlwZSBCT09MRUFOCgkJCWNvdW50IDEKCQl9Cgl9Cgljb250
cm9sLjI2IHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUgJ01hc3RlciBQbGF5YmFjayBWb2x1bWUn
CgkJdmFsdWUgNjQKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBl
IElOVEVHRVIKCQkJY291bnQgMQoJCQlyYW5nZSAnMCAtIDg3JwoJCQlkYm1pbiAtNjUyNQoJ
CQlkYm1heCAwCgkJCWRidmFsdWUuMCAtMTcyNQoJCX0KCX0KCWNvbnRyb2wuMjcgewoJCWlm
YWNlIE1JWEVSCgkJbmFtZSAnTWFzdGVyIFBsYXliYWNrIFN3aXRjaCcKCQl2YWx1ZSB0cnVl
CgkJY29tbWVudCB7CgkJCWFjY2VzcyAncmVhZCB3cml0ZScKCQkJdHlwZSBCT09MRUFOCgkJ
CWNvdW50IDEKCQl9Cgl9Cgljb250cm9sLjI4IHsKCQlpZmFjZSBDQVJECgkJbmFtZSAnUmVh
ciBNaWMgSmFjaycKCQl2YWx1ZSBmYWxzZQoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgcmVhZAoJ
CQl0eXBlIEJPT0xFQU4KCQkJY291bnQgMQoJCX0KCX0KCWNvbnRyb2wuMjkgewoJCWlmYWNl
IENBUkQKCQluYW1lICdGcm9udCBNaWMgSmFjaycKCQl2YWx1ZSBmYWxzZQoJCWNvbW1lbnQg
ewoJCQlhY2Nlc3MgcmVhZAoJCQl0eXBlIEJPT0xFQU4KCQkJY291bnQgMQoJCX0KCX0KCWNv
bnRyb2wuMzAgewoJCWlmYWNlIENBUkQKCQluYW1lICdMaW5lIEphY2snCgkJdmFsdWUgZmFs
c2UKCQljb21tZW50IHsKCQkJYWNjZXNzIHJlYWQKCQkJdHlwZSBCT09MRUFOCgkJCWNvdW50
IDEKCQl9Cgl9Cgljb250cm9sLjMxIHsKCQlpZmFjZSBDQVJECgkJbmFtZSAnTGluZSBPdXQg
RnJvbnQgSmFjaycKCQl2YWx1ZSB0cnVlCgkJY29tbWVudCB7CgkJCWFjY2VzcyByZWFkCgkJ
CXR5cGUgQk9PTEVBTgoJCQljb3VudCAxCgkJfQoJfQoJY29udHJvbC4zMiB7CgkJaWZhY2Ug
Q0FSRAoJCW5hbWUgJ0xpbmUgT3V0IFN1cnJvdW5kIEphY2snCgkJdmFsdWUgZmFsc2UKCQlj
b21tZW50IHsKCQkJYWNjZXNzIHJlYWQKCQkJdHlwZSBCT09MRUFOCgkJCWNvdW50IDEKCQl9
Cgl9Cgljb250cm9sLjMzIHsKCQlpZmFjZSBDQVJECgkJbmFtZSAnTGluZSBPdXQgQ0xGRSBK
YWNrJwoJCXZhbHVlIGZhbHNlCgkJY29tbWVudCB7CgkJCWFjY2VzcyByZWFkCgkJCXR5cGUg
Qk9PTEVBTgoJCQljb3VudCAxCgkJfQoJfQoJY29udHJvbC4zNCB7CgkJaWZhY2UgQ0FSRAoJ
CW5hbWUgJ0Zyb250IEhlYWRwaG9uZSBKYWNrJwoJCXZhbHVlIHRydWUKCQljb21tZW50IHsK
CQkJYWNjZXNzIHJlYWQKCQkJdHlwZSBCT09MRUFOCgkJCWNvdW50IDEKCQl9Cgl9Cgljb250
cm9sLjM1IHsKCQlpZmFjZSBDQVJECgkJbmFtZSAnU1BESUYgUGhhbnRvbSBKYWNrJwoJCXZh
bHVlIHRydWUKCQljb21tZW50IHsKCQkJYWNjZXNzIHJlYWQKCQkJdHlwZSBCT09MRUFOCgkJ
CWNvdW50IDEKCQl9Cgl9Cgljb250cm9sLjM2IHsKCQlpZmFjZSBQQ00KCQluYW1lICdQbGF5
YmFjayBDaGFubmVsIE1hcCcKCQl2YWx1ZS4wIDAKCQl2YWx1ZS4xIDAKCQl2YWx1ZS4yIDAK
CQl2YWx1ZS4zIDAKCQl2YWx1ZS40IDAKCQl2YWx1ZS41IDAKCQljb21tZW50IHsKCQkJYWNj
ZXNzICdyZWFkIHZvbGF0aWxlJwoJCQl0eXBlIElOVEVHRVIKCQkJY291bnQgNgoJCQlyYW5n
ZSAnMCAtIDM2JwoJCX0KCX0KCWNvbnRyb2wuMzcgewoJCWlmYWNlIFBDTQoJCW5hbWUgJ0Nh
cHR1cmUgQ2hhbm5lbCBNYXAnCgkJdmFsdWUuMCAwCgkJdmFsdWUuMSAwCgkJY29tbWVudCB7
CgkJCWFjY2VzcyAncmVhZCB2b2xhdGlsZScKCQkJdHlwZSBJTlRFR0VSCgkJCWNvdW50IDIK
CQkJcmFuZ2UgJzAgLSAzNicKCQl9Cgl9Cgljb250cm9sLjM4IHsKCQlpZmFjZSBQQ00KCQlk
ZXZpY2UgMQoJCW5hbWUgJ1BsYXliYWNrIENoYW5uZWwgTWFwJwoJCXZhbHVlLjAgMAoJCXZh
bHVlLjEgMAoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgdm9sYXRpbGUnCgkJCXR5cGUg
SU5URUdFUgoJCQljb3VudCAyCgkJCXJhbmdlICcwIC0gMzYnCgkJfQoJfQoJY29udHJvbC4z
OSB7CgkJaWZhY2UgUENNCgkJZGV2aWNlIDIKCQluYW1lICdDYXB0dXJlIENoYW5uZWwgTWFw
JwoJCXZhbHVlLjAgMAoJCXZhbHVlLjEgMAoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQg
dm9sYXRpbGUnCgkJCXR5cGUgSU5URUdFUgoJCQljb3VudCAyCgkJCXJhbmdlICcwIC0gMzYn
CgkJfQoJfQoJY29udHJvbC40MCB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdQQ00gUGxheWJh
Y2sgVm9sdW1lJwoJCXZhbHVlLjAgMjU1CgkJdmFsdWUuMSAyNTUKCQljb21tZW50IHsKCQkJ
YWNjZXNzICdyZWFkIHdyaXRlIHVzZXInCgkJCXR5cGUgSU5URUdFUgoJCQljb3VudCAyCgkJ
CXJhbmdlICcwIC0gMjU1JwoJCQl0bHYgJzAwMDAwMDAxMDAwMDAwMDhmZmZmZWMxNDAwMDAw
MDE0JwoJCQlkYm1pbiAtNTEwMAoJCQlkYm1heCAwCgkJCWRidmFsdWUuMCAwCgkJCWRidmFs
dWUuMSAwCgkJfQoJfQp9CnN0YXRlLkhETUkgewoJY29udHJvbC4xIHsKCQlpZmFjZSBDQVJE
CgkJbmFtZSAnSERNSS9EUCxwY209MyBKYWNrJwoJCXZhbHVlIHRydWUKCQljb21tZW50IHsK
CQkJYWNjZXNzIHJlYWQKCQkJdHlwZSBCT09MRUFOCgkJCWNvdW50IDEKCQl9Cgl9Cgljb250
cm9sLjIgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnSUVDOTU4IFBsYXliYWNrIENvbiBNYXNr
JwoJCXZhbHVlICcwZmZmMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwJwoJCWNvbW1lbnQgewoJ
CQlhY2Nlc3MgcmVhZAoJCQl0eXBlIElFQzk1OAoJCQljb3VudCAxCgkJfQoJfQoJY29udHJv
bC4zIHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUgJ0lFQzk1OCBQbGF5YmFjayBQcm8gTWFzaycK
CQl2YWx1ZSAnMGYwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCcKCQljb21tZW50IHsKCQkJ
YWNjZXNzIHJlYWQKCQkJdHlwZSBJRUM5NTgKCQkJY291bnQgMQoJCX0KCX0KCWNvbnRyb2wu
NCB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdJRUM5NTggUGxheWJhY2sgRGVmYXVsdCcKCQl2
YWx1ZSAnMDQwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCcKCQljb21tZW50IHsKCQkJYWNj
ZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIElFQzk1OAoJCQljb3VudCAxCgkJfQoJfQoJY29u
dHJvbC41IHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUgJ0lFQzk1OCBQbGF5YmFjayBTd2l0Y2gn
CgkJdmFsdWUgdHJ1ZQoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUnCgkJCXR5
cGUgQk9PTEVBTgoJCQljb3VudCAxCgkJfQoJfQoJY29udHJvbC42IHsKCQlpZmFjZSBQQ00K
CQlkZXZpY2UgMwoJCW5hbWUgRUxECgkJdmFsdWUgJzEwMDAwODAwNmQxNDAwMDEwMDAwMDAw
MDAwMDAwMDAwMzY2OWQ4NGM0ZDQxNDcyMDMyMzczMTUxNTA1ODIwNDUzMjA5MDcwNycKCQlj
b21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHZvbGF0aWxlJwoJCQl0eXBlIEJZVEVTCgkJCWNv
dW50IDM2CgkJfQoJfQoJY29udHJvbC43IHsKCQlpZmFjZSBDQVJECgkJbmFtZSAnSERNSS9E
UCxwY209NyBKYWNrJwoJCXZhbHVlIHRydWUKCQljb21tZW50IHsKCQkJYWNjZXNzIHJlYWQK
CQkJdHlwZSBCT09MRUFOCgkJCWNvdW50IDEKCQl9Cgl9Cgljb250cm9sLjggewoJCWlmYWNl
IE1JWEVSCgkJbmFtZSAnSUVDOTU4IFBsYXliYWNrIENvbiBNYXNrJwoJCWluZGV4IDEKCQl2
YWx1ZSAnMGZmZjAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCcKCQljb21tZW50IHsKCQkJYWNj
ZXNzIHJlYWQKCQkJdHlwZSBJRUM5NTgKCQkJY291bnQgMQoJCX0KCX0KCWNvbnRyb2wuOSB7
CgkJaWZhY2UgTUlYRVIKCQluYW1lICdJRUM5NTggUGxheWJhY2sgUHJvIE1hc2snCgkJaW5k
ZXggMQoJCXZhbHVlICcwZjAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwJwoJCWNvbW1lbnQg
ewoJCQlhY2Nlc3MgcmVhZAoJCQl0eXBlIElFQzk1OAoJCQljb3VudCAxCgkJfQoJfQoJY29u
dHJvbC4xMCB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdJRUM5NTggUGxheWJhY2sgRGVmYXVs
dCcKCQlpbmRleCAxCgkJdmFsdWUgJzA0MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAnCgkJ
Y29tbWVudCB7CgkJCWFjY2VzcyAncmVhZCB3cml0ZScKCQkJdHlwZSBJRUM5NTgKCQkJY291
bnQgMQoJCX0KCX0KCWNvbnRyb2wuMTEgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnSUVDOTU4
IFBsYXliYWNrIFN3aXRjaCcKCQlpbmRleCAxCgkJdmFsdWUgdHJ1ZQoJCWNvbW1lbnQgewoJ
CQlhY2Nlc3MgJ3JlYWQgd3JpdGUnCgkJCXR5cGUgQk9PTEVBTgoJCQljb3VudCAxCgkJfQoJ
fQoJY29udHJvbC4xMiB7CgkJaWZhY2UgUENNCgkJZGV2aWNlIDcKCQluYW1lIEVMRAoJCXZh
bHVlICcxMDAwMDgwMDZkMTQwMDAxMDAwMDAwMDAwMDAwMDAwMDEwYWMzOTQyNDQ0NTRjNGMy
MDUzMzIzNzMyMzI0NDQ3NGQwOTA3MDcnCgkJY29tbWVudCB7CgkJCWFjY2VzcyAncmVhZCB2
b2xhdGlsZScKCQkJdHlwZSBCWVRFUwoJCQljb3VudCAzNgoJCX0KCX0KCWNvbnRyb2wuMTMg
ewoJCWlmYWNlIENBUkQKCQluYW1lICdIRE1JL0RQLHBjbT04IEphY2snCgkJdmFsdWUgdHJ1
ZQoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgcmVhZAoJCQl0eXBlIEJPT0xFQU4KCQkJY291bnQg
MQoJCX0KCX0KCWNvbnRyb2wuMTQgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAnSUVDOTU4IFBs
YXliYWNrIENvbiBNYXNrJwoJCWluZGV4IDIKCQl2YWx1ZSAnMGZmZjAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMCcKCQljb21tZW50IHsKCQkJYWNjZXNzIHJlYWQKCQkJdHlwZSBJRUM5NTgK
CQkJY291bnQgMQoJCX0KCX0KCWNvbnRyb2wuMTUgewoJCWlmYWNlIE1JWEVSCgkJbmFtZSAn
SUVDOTU4IFBsYXliYWNrIFBybyBNYXNrJwoJCWluZGV4IDIKCQl2YWx1ZSAnMGYwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMCcKCQljb21tZW50IHsKCQkJYWNjZXNzIHJlYWQKCQkJdHlw
ZSBJRUM5NTgKCQkJY291bnQgMQoJCX0KCX0KCWNvbnRyb2wuMTYgewoJCWlmYWNlIE1JWEVS
CgkJbmFtZSAnSUVDOTU4IFBsYXliYWNrIERlZmF1bHQnCgkJaW5kZXggMgoJCXZhbHVlICcw
NDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwJwoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3Jl
YWQgd3JpdGUnCgkJCXR5cGUgSUVDOTU4CgkJCWNvdW50IDEKCQl9Cgl9Cgljb250cm9sLjE3
IHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUgJ0lFQzk1OCBQbGF5YmFjayBTd2l0Y2gnCgkJaW5k
ZXggMgoJCXZhbHVlIHRydWUKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJ
CQl0eXBlIEJPT0xFQU4KCQkJY291bnQgMQoJCX0KCX0KCWNvbnRyb2wuMTggewoJCWlmYWNl
IFBDTQoJCWRldmljZSA4CgkJbmFtZSBFTEQKCQl2YWx1ZSAnMTAwMDA2MDA2NTE0MDAwMTAw
MDAwMDAwMDAwMDAwMDAwNDY5YTQyNDU2NDczMjM0MzgwOTA3MDcnCgkJY29tbWVudCB7CgkJ
CWFjY2VzcyAncmVhZCB2b2xhdGlsZScKCQkJdHlwZSBCWVRFUwoJCQljb3VudCAyOAoJCX0K
CX0KCWNvbnRyb2wuMTkgewoJCWlmYWNlIENBUkQKCQluYW1lICdIRE1JL0RQLHBjbT05IEph
Y2snCgkJdmFsdWUgZmFsc2UKCQljb21tZW50IHsKCQkJYWNjZXNzIHJlYWQKCQkJdHlwZSBC
T09MRUFOCgkJCWNvdW50IDEKCQl9Cgl9Cgljb250cm9sLjIwIHsKCQlpZmFjZSBNSVhFUgoJ
CW5hbWUgJ0lFQzk1OCBQbGF5YmFjayBDb24gTWFzaycKCQlpbmRleCAzCgkJdmFsdWUgJzBm
ZmYwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAnCgkJY29tbWVudCB7CgkJCWFjY2VzcyByZWFk
CgkJCXR5cGUgSUVDOTU4CgkJCWNvdW50IDEKCQl9Cgl9Cgljb250cm9sLjIxIHsKCQlpZmFj
ZSBNSVhFUgoJCW5hbWUgJ0lFQzk1OCBQbGF5YmFjayBQcm8gTWFzaycKCQlpbmRleCAzCgkJ
dmFsdWUgJzBmMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAnCgkJY29tbWVudCB7CgkJCWFj
Y2VzcyByZWFkCgkJCXR5cGUgSUVDOTU4CgkJCWNvdW50IDEKCQl9Cgl9Cgljb250cm9sLjIy
IHsKCQlpZmFjZSBNSVhFUgoJCW5hbWUgJ0lFQzk1OCBQbGF5YmFjayBEZWZhdWx0JwoJCWlu
ZGV4IDMKCQl2YWx1ZSAnMDQwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCcKCQljb21tZW50
IHsKCQkJYWNjZXNzICdyZWFkIHdyaXRlJwoJCQl0eXBlIElFQzk1OAoJCQljb3VudCAxCgkJ
fQoJfQoJY29udHJvbC4yMyB7CgkJaWZhY2UgTUlYRVIKCQluYW1lICdJRUM5NTggUGxheWJh
Y2sgU3dpdGNoJwoJCWluZGV4IDMKCQl2YWx1ZSB0cnVlCgkJY29tbWVudCB7CgkJCWFjY2Vz
cyAncmVhZCB3cml0ZScKCQkJdHlwZSBCT09MRUFOCgkJCWNvdW50IDEKCQl9Cgl9Cgljb250
cm9sLjI0IHsKCQlpZmFjZSBQQ00KCQlkZXZpY2UgOQoJCW5hbWUgRUxECgkJdmFsdWUgJycK
CQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHZvbGF0aWxlJwoJCQl0eXBlIEJZVEVTCgkJ
CWNvdW50IDAKCQl9Cgl9Cgljb250cm9sLjI1IHsKCQlpZmFjZSBQQ00KCQlkZXZpY2UgMwoJ
CW5hbWUgJ1BsYXliYWNrIENoYW5uZWwgTWFwJwoJCXZhbHVlLjAgMAoJCXZhbHVlLjEgMAoJ
CXZhbHVlLjIgMAoJCXZhbHVlLjMgMAoJCXZhbHVlLjQgMAoJCXZhbHVlLjUgMAoJCXZhbHVl
LjYgMAoJCXZhbHVlLjcgMAoJCWNvbW1lbnQgewoJCQlhY2Nlc3MgJ3JlYWQgd3JpdGUgdm9s
YXRpbGUnCgkJCXR5cGUgSU5URUdFUgoJCQljb3VudCA4CgkJCXJhbmdlICcwIC0gMzYnCgkJ
fQoJfQoJY29udHJvbC4yNiB7CgkJaWZhY2UgUENNCgkJZGV2aWNlIDcKCQluYW1lICdQbGF5
YmFjayBDaGFubmVsIE1hcCcKCQl2YWx1ZS4wIDAKCQl2YWx1ZS4xIDAKCQl2YWx1ZS4yIDAK
CQl2YWx1ZS4zIDAKCQl2YWx1ZS40IDAKCQl2YWx1ZS41IDAKCQl2YWx1ZS42IDAKCQl2YWx1
ZS43IDAKCQljb21tZW50IHsKCQkJYWNjZXNzICdyZWFkIHdyaXRlIHZvbGF0aWxlJwoJCQl0
eXBlIElOVEVHRVIKCQkJY291bnQgOAoJCQlyYW5nZSAnMCAtIDM2JwoJCX0KCX0KCWNvbnRy
b2wuMjcgewoJCWlmYWNlIFBDTQoJCWRldmljZSA4CgkJbmFtZSAnUGxheWJhY2sgQ2hhbm5l
bCBNYXAnCgkJdmFsdWUuMCAwCgkJdmFsdWUuMSAwCgkJdmFsdWUuMiAwCgkJdmFsdWUuMyAw
CgkJdmFsdWUuNCAwCgkJdmFsdWUuNSAwCgkJdmFsdWUuNiAwCgkJdmFsdWUuNyAwCgkJY29t
bWVudCB7CgkJCWFjY2VzcyAncmVhZCB3cml0ZSB2b2xhdGlsZScKCQkJdHlwZSBJTlRFR0VS
CgkJCWNvdW50IDgKCQkJcmFuZ2UgJzAgLSAzNicKCQl9Cgl9Cgljb250cm9sLjI4IHsKCQlp
ZmFjZSBQQ00KCQlkZXZpY2UgOQoJCW5hbWUgJ1BsYXliYWNrIENoYW5uZWwgTWFwJwoJCXZh
bHVlLjAgMAoJCXZhbHVlLjEgMAoJCXZhbHVlLjIgMAoJCXZhbHVlLjMgMAoJCXZhbHVlLjQg
MAoJCXZhbHVlLjUgMAoJCXZhbHVlLjYgMAoJCXZhbHVlLjcgMAoJCWNvbW1lbnQgewoJCQlh
Y2Nlc3MgJ3JlYWQgd3JpdGUgdm9sYXRpbGUnCgkJCXR5cGUgSU5URUdFUgoJCQljb3VudCA4
CgkJCXJhbmdlICcwIC0gMzYnCgkJfQoJfQp9Ci0tZW5kY29sbGFwc2UtLQoKCiEhQWxsIExv
YWRlZCBNb2R1bGVzCiEhLS0tLS0tLS0tLS0tLS0tLS0tCgo4NDJfY29tcHJlc3MKODQyX2Rl
Y29tcHJlc3MKYWM5N19idXMKYWNwaV9wYWQKYWNwaV90YWQKYWVzbmlfaW50ZWwKYWZfYWxn
CmFsZ2lmX2hhc2gKYWxnaWZfc2tjaXBoZXIKYW1kZ3B1CmFtZHhjcAphdXRoX3JwY2dzcwpi
bHVldG9vdGgKYm5lcApidGJjbQpidGludGVsCmJ0bXRrCmJ0cnRsCmJ0dXNiCmNlYwpjZmc4
MDIxMQpjbWFjCmNvcmV0ZW1wCmNyYzgKY3J5cHRvX3VzZXIKZG1fbW9kCmRuc19yZXNvbHZl
cgpkcm1fYnVkZHkKZHJtX2Rpc3BsYXlfaGVscGVyCmRybV9leGVjCmRybV9wYW5lbF9iYWNr
bGlnaHRfcXVpcmtzCmRybV9zdWJhbGxvY19oZWxwZXIKZHJtX3R0bV9oZWxwZXIKZWUxMDA0
CmZhdApnaGFzaF9jbG11bG5pX2ludGVsCmdwdV9zY2hlZApncmFjZQpoaWRfbG9naXRlY2hf
ZGoKaGlkX2xvZ2l0ZWNoX2hpZHBwCmhrZGYKaTJjX2FsZ29fYml0CmkyY19kZXYKaTJjX2k4
MDEKaTJjX211eAppMmNfc21idXMKaVRDT192ZW5kb3Jfc3VwcG9ydAppVENPX3dkdAppbnRl
bF9jc3RhdGUKaW50ZWxfb2Nfd2R0CmludGVsX3BjaF90aGVybWFsCmludGVsX3BtY19ieHQK
aW50ZWxfcG1jX2NvcmUKaW50ZWxfcG1jX3NzcmFtX3RlbGVtZXRyeQppbnRlbF9wb3dlcmNs
YW1wCmludGVsX3JhcGxfY29tbW9uCmludGVsX3JhcGxfbXNyCmludGVsX3RjY19jb29saW5n
CmludGVsX3VuY29yZQppbnRlbF91bmNvcmVfZnJlcXVlbmN5CmludGVsX3VuY29yZV9mcmVx
dWVuY3lfY29tbW9uCmludGVsX3ZzZWMKaW50ZWxfd21pX3RodW5kZXJib2x0CmlycWJ5cGFz
cwppd2xtdm0KaXdsd2lmaQpqb3lkZXYKa3ZtCmt2bV9pbnRlbApsaWJhcmM0CmxpYnBoeQps
b2NrZApsb29wCmx6NF9jb21wcmVzcwpsejRoY19jb21wcmVzcwptYWM4MDIxMQptYWNfaGlk
Cm1jCm1kaW9fYnVzCm1kaW9fZGV2cmVzCm1vdXNlZGV2Cm10ZApteG1fd21pCm5ldGZzCm5m
bmV0bGluawpuZnMKbmZzX2FjbApuZnNfbG9jYWxpbwpuZnN2MwpuZnN2NApudm1lCm52bWVf
YXV0aApudm1lX2NvcmUKbnZtZV9rZXlyaW5nCnBtdF9jbGFzcwpwbXRfZGlzY292ZXJ5CnBt
dF90ZWxlbWV0cnkKcHBzX2NvcmUKcHRwCnFydHIKcjgxNjkKcmFwbApyZWFsdGVrCnJmY29t
bQpyZmtpbGwKcnBjc2VjX2dzc19rcmI1CnNuZApzbmRfY29tcHJlc3MKc25kX2hkYV9jb2Rl
YwpzbmRfaGRhX2NvZGVjX2F0aWhkbWkKc25kX2hkYV9jb2RlY19nZW5lcmljCnNuZF9oZGFf
Y29kZWNfaGRtaQpzbmRfaGRhX2NvZGVjX3JlYWx0ZWtfbGliCnNuZF9oZGFfY29yZQpzbmRf
aGRhX2V4dF9jb3JlCnNuZF9oZGFfaW50ZWwKc25kX2hydGltZXIKc25kX2h3ZGVwCnNuZF9p
bnRlbF9kc3BjZmcKc25kX2ludGVsX3Nkd19hY3BpCnNuZF9wY20Kc25kX3BjbV9kbWFlbmdp
bmUKc25kX3Jhd21pZGkKc25kX3NlcQpzbmRfc2VxX2RldmljZQpzbmRfc2VxX2R1bW15CnNu
ZF9zb2NfYWNwaQpzbmRfc29jX2FjcGlfaW50ZWxfbWF0Y2gKc25kX3NvY19hY3BpX2ludGVs
X3NkY2FfcXVpcmtzCnNuZF9zb2NfYXZzCnNuZF9zb2NfY29yZQpzbmRfc29jX2hkYV9jb2Rl
YwpzbmRfc29jX2hkYWNfaGRhCnNuZF9zb2Nfc2RjYQpzbmRfc29jX3Nkd191dGlscwpzbmRf
c29mCnNuZF9zb2ZfaW50ZWxfaGRhCnNuZF9zb2ZfaW50ZWxfaGRhX2NvbW1vbgpzbmRfc29m
X2ludGVsX2hkYV9nZW5lcmljCnNuZF9zb2ZfaW50ZWxfaGRhX21saW5rCnNuZF9zb2ZfaW50
ZWxfaGRhX3Nkd19icHQKc25kX3NvZl9wY2kKc25kX3NvZl9wY2lfaW50ZWxfY25sCnNuZF9z
b2ZfdXRpbHMKc25kX3NvZl94dGVuc2FfZHNwCnNuZF90aW1lcgpzbmRfdW1wCnNuZF91c2Jf
YXVkaW8Kc25kX3VzYm1pZGlfbGliCnNvdW5kY29yZQpzb3VuZHdpcmVfYnVzCnNvdW5kd2ly
ZV9jYWRlbmNlCnNvdW5kd2lyZV9nZW5lcmljX2FsbG9jYXRpb24Kc291bmR3aXJlX2ludGVs
CnNwaV9pbnRlbApzcGlfaW50ZWxfcGNpCnNwaV9ub3IKc3F1YXNoZnMKc3VucnBjCnR0bQp1
YXMKdWlucHV0CnVzYl9zdG9yYWdlCnZmYXQKdmlkZW8Kd21pCndtaV9ibW9mCng4Nl9wa2df
dGVtcF90aGVybWFsCnpyYW0KCgohIVN5c2ZzIEZpbGVzCiEhLS0tLS0tLS0tLS0KCi9zeXMv
Y2xhc3Mvc291bmQvaHdDMUQwL2luaXRfcGluX2NvbmZpZ3M6CjB4MTEgMHg0MDM3YzU0MAow
eDE0IDB4MDEwMTUwMTAKMHgxNSAweDAxMDExMDEyCjB4MTYgMHgwMTAxMTAxMQoweDE3IDB4
NDExMTExZjAKMHgxOCAweDAxYTExMDQwCjB4MTkgMHgwMmExOTA1MAoweDFhIDB4MDE4MTEw
NGYKMHgxYiAweDAyMjE0MDIwCjB4MWUgMHgwMTQ1MTEzMAoKL3N5cy9jbGFzcy9zb3VuZC9o
d0MxRDAvZHJpdmVyX3Bpbl9jb25maWdzOgoKL3N5cy9jbGFzcy9zb3VuZC9od0MxRDAvdXNl
cl9waW5fY29uZmlnczoKCi9zeXMvY2xhc3Mvc291bmQvaHdDMUQwL2luaXRfdmVyYnM6Cgov
c3lzL2NsYXNzL3NvdW5kL2h3QzFEMC9oaW50czoKCi9zeXMvY2xhc3Mvc291bmQvaHdDMkQw
L2luaXRfcGluX2NvbmZpZ3M6CjB4MDMgMHgxODU2MDBmMAoweDA1IDB4MTg1NjAwZjAKMHgw
NyAweDE4NTYwMGYwCjB4MDkgMHgxODU2MDBmMAoweDBiIDB4NTg1NjAwZjAKCi9zeXMvY2xh
c3Mvc291bmQvaHdDMkQwL2RyaXZlcl9waW5fY29uZmlnczoKCi9zeXMvY2xhc3Mvc291bmQv
aHdDMkQwL3VzZXJfcGluX2NvbmZpZ3M6Cgovc3lzL2NsYXNzL3NvdW5kL2h3QzJEMC9pbml0
X3ZlcmJzOgoKL3N5cy9jbGFzcy9zb3VuZC9od0MyRDAvaGludHM6CgoKISFBTFNBL0hEQSBk
bWVzZwohIS0tLS0tLS0tLS0tLS0tCgoKCg==

--a11ee50f0a544f27954a34f235835d2e--
