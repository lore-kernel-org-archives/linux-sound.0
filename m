Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1668329993F
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761553406; cv=none; b=FOMQP7oJeYW468dGn7Pzpzk7Ylb/bx1em1XL04F5wtFz+GBD9Luj1lBaAFEMMAPb2whctWbjZSPjJ7+W3KX3gnXqGX6SU6sPwiZpQnyvZO97F/lSrt+gu5FUbqyWvQQ2RrXdgwb5iNppKAn1uCl71x434+UGGH58BfJabdw70LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761553406; c=relaxed/simple;
	bh=YEp7967Xa/06BcL8MWfSkzpGtDo5NycWkfludFawSnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aPrXV2HDFOhd/J999sAKg4tFk9YfCQWN1fLHTnCrMhoxhuvUtuHqTYaWo4XezctduiTEp9fC3cEQkZaSU0ZrKEKzZ/maFiNlNUgWBcXEGpTxniYa0jR4+94kEpIWQLxeZq+vGxIPhJGZAJQtzD1eeur/lEUM2o8iO8bw3Jq0bE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=M5IcIUUo; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="M5IcIUUo"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 3512EBDB5B
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 10:23:20 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 66D7ABDBF6
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 10:23:19 +0200 (EET)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id CAB5F1FF540
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 10:23:18 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761553399;
	bh=C4ndRWKnTrO/9RTcVK/h8dR1CxyvCTlmymVM5anKv60=;
	h=Received:From:Subject:To;
	b=M5IcIUUoK8QkXz+4jdi6SRDV4SoPu9+pKUqhve71fi7ex2qePESSoDbvSnoG4IRta
	 FfKQ6AIeq0TJ6kOCJQ4aQrWZm+KtUj1eK9fkmf2N+VfxG6c1OMP4iEkpKK3qBHOXnH
	 txImT2M02znpvFThQCX4WOuhaR9Qd/GnN+mg9HgxQlteUsImCYQrP9xJkuS+VL2BzE
	 GAC3dbhZAkXyv+Bdd+VQBGE5tuXVnlhTHGvoPyEGABJFwSO6kBTpE0mSVR39kcCgfA
	 czlkFw3onebzNLWF52O2Tf7tqeu8P8O5V8agXPV7XP3M+qZl8zfrKSz2rwQ5H29SLR
	 Q471jjBoEB9jg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.175) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f175.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-362e291924aso36716341fa.1
        for <linux-sound@vger.kernel.org>;
 Mon, 27 Oct 2025 01:23:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVd1CkptZUwabaVSEomsLR2Cb0DIYPjn7FL48ODicR1QbWW0Y/HteH8zs6uHnUwOynvsrF1SumQMnz35Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YygCwBNfotPG8tXyZvINMSEZiB3KTeMHKW+OTp5wepixkziWrpj
	5QVRGRjfNEzWrFsPbycilYqPO08pOxF2S6J78+0P03Gh4JDvnSRjeGL6p8dm6c1hTmwUaHClqtE
	Qagarqeojk/yU94exFCQhUfd38my7F8U=
X-Google-Smtp-Source: 
 AGHT+IFnw5YlPbs4UT/rVayD1Wc1YYfwG3Rn1tmxpyQFWkATDUzZX/lTIZZ0JQb5sEz2HZuizVHTAKbpJEc+9L01NiY=
X-Received: by 2002:a2e:b8c5:0:b0:378:e84c:d15d with SMTP id
 38308e7fff4ca-378e84cf802mr29244341fa.12.1761553398209; Mon, 27 Oct 2025
 01:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251026191635.2447593-1-lkml@antheas.dev>
 <20251026191635.2447593-2-lkml@antheas.dev>
 <CAGwozwEwPj9VRRo2U50ccg=_qSM7p-1c_hw2y=OYA-pFc=p13w@mail.gmail.com>
 <35A5783A-CA60-4B10-8C7B-5820B65307FE@linux.dev>
In-Reply-To: <35A5783A-CA60-4B10-8C7B-5820B65307FE@linux.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 27 Oct 2025 09:23:05 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFtah66p=5oy9rf5phVGdDTiWg0WuJBT3qGpWdP3A62Pg@mail.gmail.com>
X-Gm-Features: AWmQ_bmcMAbS2COtf6aWdSaATJGAcXDZABokpndxSIpaBG3ZNqKN57EWd_EDXE4
Message-ID: 
 <CAGwozwFtah66p=5oy9rf5phVGdDTiWg0WuJBT3qGpWdP3A62Pg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ALSA: hda/realtek: Add match for ASUS Xbox Ally
 projects
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176155339906.4187909.3317987167099956061@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Mon, 27 Oct 2025 at 07:02, Matthew Schwartz
<matthew.schwartz@linux.dev> wrote:
>
>
>
> > On Oct 26, 2025, at 12:19=E2=80=AFPM, Antheas Kapenekakis <lkml@antheas=
.dev> wrote:
> >
> > On Sun, 26 Oct 2025 at 20:16, Antheas Kapenekakis <lkml@antheas.dev> wr=
ote:
> >>
> >> Bind the realtek codec to TAS2781 I2C audio amps on ASUS Xbox Ally
> >> projects. While these projects work without a quirk, adding it increas=
es
> >> the output volume significantly.
> >
> > Also, if you can upstream the firmware files:
> > TAS2XXX13840.bin
> > TAS2XXX13841.bin
> > TAS2XXX13940.bin
> > TAS2XXX13941.bin
>
> This is the firmware at [1], correct? I=E2=80=99m testing the series with=
 that firmware on my ROG Xbox Ally X, and I found something interesting.
>
> By default, with just your kernel patches and the firmware files hosted a=
t [1], my unit is loading:
>
> tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: Loaded FW: TAS2XXX13840.bin, s=
ha256: 58cffa36ae23a2d9b2349ecb6c1d4e89627934cd79218f6ada06eaffe6688246
>
> However, with this firmware file,  TAS2XXX13840.bin, there is significant=
 audio clipping above 75% speaker level on my individual unit.
>
> Then, I tried renaming the other firmware file, TAS2XXX13841.bin, into TA=
S2XXX13840.bin. Now my unit is loading:
>
> tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: Loaded FW: TAS2XXX13840.bin, s=
ha256: 0fda76e7142cb455df1860cfdb19bb3cb6871128b385595fe06b296a070f4b8c
>
> With this firmware file, audio is perfect all the way to 100% speaker lev=
el.
>
> If I recall, there have been other ASUS products that required matching a=
mplifier hardware with firmware correctly, right? It looks like this might =
be another case of since it seems my unit is loading the wrong firmware for=
 its amplifiers.

The original Ally X had a similar setup, yes.

First patch might not be perfect and your speaker pin might be 1. My
Xbox Ally's pin is 1. It loads:
Loaded FW: TAS2XXX13941.bin, sha256:
0fda76e7142cb455df1860cfdb19bb3cb6871128b385595fe06b296a070f4b8c

And it sounds loud and crisp. So the pin is read.

I had multiple users verify the X works, but perhaps it is not perfect
yet. Make sure you are not using a dsp that might be interfering

Antheas

> Matt
>
> [1]: https://github.com/hhd-dev/hwfirm
>
> >
> > That would be great :)
> >
> > Antheas
> >
> >> Cc: stable@vger.kernel.org # 6.17
> >> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >> ---
> >> sound/hda/codecs/realtek/alc269.c | 2 ++
> >> 1 file changed, 2 insertions(+)
> >>
> >> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/real=
tek/alc269.c
> >> index 8ad5febd822a..d1ad84eee6d1 100644
> >> --- a/sound/hda/codecs/realtek/alc269.c
> >> +++ b/sound/hda/codecs/realtek/alc269.c
> >> @@ -6713,6 +6713,8 @@ static const struct hda_quirk alc269_fixup_tbl[]=
 =3D {
> >>        SND_PCI_QUIRK(0x1043, 0x12f0, "ASUS X541UV", ALC256_FIXUP_ASUS_=
MIC_NO_PRESENCE),
> >>        SND_PCI_QUIRK(0x1043, 0x1313, "Asus K42JZ", ALC269VB_FIXUP_ASUS=
_MIC_NO_PRESENCE),
> >>        SND_PCI_QUIRK(0x1043, 0x1314, "ASUS GA605K", ALC285_FIXUP_ASUS_=
GA605K_HEADSET_MIC),
> >> +       SND_PCI_QUIRK(0x1043, 0x1384, "ASUS RC73XA", ALC287_FIXUP_TXNW=
2781_I2C),
> >> +       SND_PCI_QUIRK(0x1043, 0x1394, "ASUS RC73YA", ALC287_FIXUP_TXNW=
2781_I2C),
> >>        SND_PCI_QUIRK(0x1043, 0x13b0, "ASUS Z550SA", ALC256_FIXUP_ASUS_=
MIC_NO_PRESENCE),
> >>        SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FI=
XUP_ASUS_ZENBOOK),
> >>        SND_PCI_QUIRK(0x1043, 0x1433, "ASUS GX650PY/PZ/PV/PU/PYV/PZV/PI=
V/PVV", ALC285_FIXUP_ASUS_I2C_HEADSET_MIC),
> >> --
> >> 2.51.1
> >>
> >>
> >
> >
>
>

