Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976B6537F2
	for <linux-sound@vger.kernel.org>; Mon,  8 Jan 2024 16:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KsnKrKZf"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4085qUDN031948;
	Mon, 8 Jan 2024 10:43:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:references:in-reply-to:subject:date:message-id
	:mime-version:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=gX6Sspv11kjzsQ7jxXdMR+nwLpQZMP2WP1ITmhX+c5g=; b=
	KsnKrKZfarbrnnPeg8H/z9jYeGX7CO9j3wCyeZVDeJMALIMx9fD9Sxe8qUkMcQlV
	RScclJOl3QQbHG7cTB4VryQjzAsYoj6z9PkBPGrfTtsStpSX1BQlwd8z5IPhzAmX
	PG2h6Ny5hoz6/5QXVXVO7OgPAfwkRO4jdo8SU/Si2IldSJqOVdVJpLMpQAxhEH+A
	UsIyvPWwqa0MjDwwqEbiy6DcjDVeH6pxsuaLitEIj6FYvoqNYghLseUwp23TtSiW
	5k/eQPjudOZ1nNZEX4w2rX7jvdLPOa3spsF9MH0Pm8PLNO1eWRdwQsbDIOpOAY0p
	ook0IWVio702ZpkPzbuEaw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vf552jksf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 10:43:06 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 8 Jan
 2024 16:43:04 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Mon, 8 Jan 2024 16:43:04 +0000
Received: from LONN2DGDQ73 (LONN2DGDQ73.ad.cirrus.com [198.61.65.232])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 92B04474;
	Mon,  8 Jan 2024 16:43:03 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: 'Huayu Zhang' <zhanghuayu.dev@gmail.com>
CC: <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
        James Schulman
	<James.Schulman@cirrus.com>,
        David Rhodes <David.Rhodes@cirrus.com>, <rf@opensource.cirrus.com>,
        <perex@perex.cz>, <kailang@realtek.com>
References: <tencent_BADE40D9A6A1C82B21811A844E5FE3881D06@qq.com> <000001da424d$645814a0$2d083de0$@opensource.cirrus.com> <CAB5Sz21QOq3k7Uk7POSr_5XcSK8Hw+tBNu0QAi7Dzk3dUJjFBA@mail.gmail.com>
In-Reply-To: <CAB5Sz21QOq3k7Uk7POSr_5XcSK8Hw+tBNu0QAi7Dzk3dUJjFBA@mail.gmail.com>
Subject: RE: [PATCH] [PATCH v2] ALSA: hda: Add _DSD for ThinkBook 16p G4 IRH with Subsystem Id of 0x17aa38a9.
Date: Mon, 8 Jan 2024 16:43:03 +0000
Message-ID: <003501da4251$bfbcb310$3f361930$@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHXTbcUxrH9wZLiUHzw+OBEgS0+ewG+XcNbAlca1BawtVwVwA==
Content-Language: en-gb
X-Proofpoint-ORIG-GUID: Lc8Czf9reBlGkMUXbiFpnfNX3SD4Z697
X-Proofpoint-GUID: Lc8Czf9reBlGkMUXbiFpnfNX3SD4Z697
X-Proofpoint-Spam-Reason: safe

Hi,

> -----Original Message-----
> From: Huayu Zhang <zhanghuayu.dev@gmail.com>
> Sent: Monday, January 8, 2024 4:34 PM
> To: Stefan Binding <sbinding@opensource.cirrus.com>
> Subject: Re: [PATCH] [PATCH v2] ALSA: hda: Add _DSD for ThinkBook 16p
> G4 IRH with Subsystem Id of 0x17aa38a9.
>=20
> Hi Stefan,
>=20
> Thanks for your help. Sorry for the previous email. My email client
> seems has some bug. I=E2=80=99ll attach the output file of acpidump in =
this
> email. And my alsa-info output is here:
> https://alsa-
> project.org/db/?f=3D1c05a26e3b969f82d9e7b506571db6c8262d2e8a
>=20
> Thanks again. Please have a nice day.

Looking at the ACPI, the entry should be:

{ "17AA38A9", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 2, =
-1, 0, 0, 0 },

Since SPK-ID is entry 2 rather than entry 1.

Thanks,
Stefan

>=20
> Best,
> Huayu
>=20
> On Tue, Jan 9, 2024 at 12:11=E2=80=AFAM Stefan Binding
> <sbinding@opensource.cirrus.com> wrote:
> >
> > Hi,
> >
> > > -----Original Message-----
> > > From: Huayu Zhang <932367230@qq.com>
> > > Sent: Monday, January 8, 2024 2:05 PM
> > > To: tiwai@suse.com
> > > Cc: linux-sound@vger.kernel.org; james.schulman@cirrus.com;
> > > david.rhodes@cirrus.com; rf@opensource.cirrus.com;
> perex@perex.cz;
> > > sbinding@opensource.cirrus.com; kailang@realtek.com;
> > > zhanghuayu.dev@gmail.com; Huayu Zhang <932367230@qq.com>
> > > Subject: [PATCH] [PATCH v2] ALSA: hda: Add _DSD for ThinkBook 16p
> G4
> > > IRH with Subsystem Id of 0x17aa38a9.
> > >
> > > Add _DSD for ThinkBook 16p G4 IRH with Subsystem Id of 0x17aa38a9
> > > because those info are missing in the ACPI table.
> > >
> > > Before applying the changes: the laptop only have very poor and =
low
> > > volumn with only up facing builtin speakers (down facing have no
> > sound
> > > at all).
> > >
> > > After applying: both down facing (bass) and up facing bultin
> > speakers
> > > will have sound in a reasonable level.
> > >
> > > But the behavior of volumn control is actually changing the
> > frequency
> > > division: adjust to louder
> > > (which supposed to make overall louder) only makes the up facing
> > bultin
> > > speakers louder and downfacing gradually
> > > lower its volumn at the meantime.
> > >
> > > Wondering if this is related to ALSA or should make further =
changes
> > on
> > > the AMP settings?
> > >
> > > Signed-off-by: Huayu Zhang <932367230@qq.com>
> > > ---
> > >  sound/pci/hda/cs35l41_hda_property.c | 2 ++
> > >  sound/pci/hda/patch_realtek.c        | 1 +
> > >  2 files changed, 3 insertions(+)
> > >
> > > diff --git a/sound/pci/hda/cs35l41_hda_property.c
> > > b/sound/pci/hda/cs35l41_hda_property.c
> > > index 35277ce890a4..b1844224123f 100644
> > > --- a/sound/pci/hda/cs35l41_hda_property.c
> > > +++ b/sound/pci/hda/cs35l41_hda_property.c
> > > @@ -93,6 +93,7 @@ static const struct cs35l41_config
> > > cs35l41_config_table[] =3D {
> > >       { "10431F12", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, =
0
> > > }, 0, 1, -1, 1000, 4500, 24 },
> > >       { "10431F1F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, =
0
> > > }, 1, -1, 0, 0, 0, 0 },
> > >       { "10431F62", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, =
0
> > > }, 1, 2, 0, 0, 0, 0 },
> > > +     { "17AA38A9", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, =
0
> > > }, 0, 1, -1, 0, 0, 0 },
> >
> > This entry doesn't quite match the ACPI that I have access to for =
this
> > laptop,
> > though what I have might be out of date.
> > Can you attach an acpidump of this laptop so I can compare it to =
this
> > entry.
> > The ACPI dump that I have states that the SPK-ID is GPIO index 2,
> > rather
> > than index 1 as described in this entry.
> >
> > You can generate the acpidump using the acpidump tool:
> > $ acpidump > acpidump.out
> >
> > Thanks,
> > Stefan
> >
> > >       { "17AA38B4", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, =
0
> > > }, 0, 1, -1, 0, 0, 0 },
> > >       { "17AA38B5", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, =
0
> > > }, 0, 1, -1, 0, 0, 0 },
> > >       { "17AA38B6", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, =
0
> > > }, 0, 1, -1, 0, 0, 0 },
> > > @@ -427,6 +428,7 @@ static const struct cs35l41_prop_model
> > > cs35l41_prop_model_table[] =3D {
> > >       { "CSC3551", "10431F12", generic_dsd_config },
> > >       { "CSC3551", "10431F1F", generic_dsd_config },
> > >       { "CSC3551", "10431F62", generic_dsd_config },
> > > +     { "CSC3551", "17AA38A9", generic_dsd_config },
> > >       { "CSC3551", "17AA38B4", generic_dsd_config },
> > >       { "CSC3551", "17AA38B5", generic_dsd_config },
> > >       { "CSC3551", "17AA38B6", generic_dsd_config },
> > > diff --git a/sound/pci/hda/patch_realtek.c
> > > b/sound/pci/hda/patch_realtek.c
> > > index 1dcfba27e075..3eae1a5d9bcd 100644
> > > --- a/sound/pci/hda/patch_realtek.c
> > > +++ b/sound/pci/hda/patch_realtek.c
> > > @@ -10256,6 +10256,7 @@ static const struct snd_pci_quirk
> > > alc269_fixup_tbl[] =3D {
> > >       SND_PCI_QUIRK(0x17aa, 0x3886, "Y780 VECO DUAL",
> > > ALC287_FIXUP_TAS2781_I2C),
> > >       SND_PCI_QUIRK(0x17aa, 0x38a7, "Y780P AMD YG dual",
> > > ALC287_FIXUP_TAS2781_I2C),
> > >       SND_PCI_QUIRK(0x17aa, 0x38a8, "Y780P AMD VECO dual",
> > > ALC287_FIXUP_TAS2781_I2C),
> > > +     SND_PCI_QUIRK(0x17aa, 0x38a9, "ThinkBook 16p G4 IRH",
> > > ALC287_FIXUP_CS35L41_I2C_2),
> > >       SND_PCI_QUIRK(0x17aa, 0x38b4, "Legion Slim 7 16IRH8",
> > > ALC287_FIXUP_CS35L41_I2C_2),
> > >       SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8",
> > > ALC287_FIXUP_CS35L41_I2C_2),
> > >       SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8",
> > > ALC287_FIXUP_CS35L41_I2C_2),
> > > --
> > > 2.34.1
> > >
> >
> >

