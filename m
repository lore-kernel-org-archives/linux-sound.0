Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590A054BD4
	for <linux-sound@vger.kernel.org>; Mon,  8 Jan 2024 17:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fS/UOKi7"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3374e332124so1947372f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 08 Jan 2024 09:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704734777; x=1705339577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JXJiMqOKbjSdI9fl7QSkmkO27W4q4zFBoTaPBvbpDU=;
        b=fS/UOKi7EQznNBngncFH/dz3WRXfH1Q8vFSC1PNewTe7fr+kKq4LhrSVDqEXI/Y28j
         8t6Uw6RxUOrXVAJUld8N4aF7PSu77Vk0z2hLlfGSrLIo4IBDxYF1vABVX8ANGooNg34J
         q7HjYuP2xvY/EvtDgrj/NTg+PSyF11wBzxGR4SdWW2Obmf2IkZ+GBieoc2s3hnZau8HB
         qFHkJyZGkNEkkPZSIZdXnH5bpsWL9JVOK8G4woJivo5BQI89OrH7VXbeNesB1ZqFxO0N
         5ScpMmHlIFtMkVEdXG0zG8puAIjlR0Jcis8dLtWb2JbiSI4Yw08h2gOmWpdg8mCnq+YP
         9Ppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704734777; x=1705339577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4JXJiMqOKbjSdI9fl7QSkmkO27W4q4zFBoTaPBvbpDU=;
        b=EYh7QJNLZxev4RGSgV3OHRCXMurSPzVzNv30ae/pO4gZvBHFkzVC/yr9YHDFRq0OnN
         9PEjnfQ9FH5hIC4EpkbD6lJWM5DKA45jXNE3UP6ZRBv38TFdRNT7og0Ld+SGSwH9ZhrC
         QtWgEd7SyePN2Lk7zmqZeRG3zw/cAsR+stynPe1gBzjmC7anVIhHKMjVkYCrYlh5/k4C
         AwcLI6K0UVyp8CaKiviE5iFvjvXkwj1pN2TABbkul2EeA97h5a1UREj2XE1MX83oAGzb
         15aX80RlmPvW1hOhQGWOnY5Sj33GtIuoGmxneiWcx5gseLh6lL3CG7jye3eu/or/2S8x
         AXLw==
X-Gm-Message-State: AOJu0YwNaMkZEOY1vcbQWRyyvGOF55NzGgmBOR/yetpcteYroqWPwWLj
	OjQG+zSOQSd8xa7Nx02muTGmO2vJA3QqwI7U6n0=
X-Google-Smtp-Source: AGHT+IHyjvKg+JUnlw/+THrnjQK+zjDD4rV6naqMXbAm3lbNOOiHmharA+emJG0f0nsuME4Cu9dgD3cdBVYHFZ4rfTM=
X-Received: by 2002:adf:e90b:0:b0:337:476f:9966 with SMTP id
 f11-20020adfe90b000000b00337476f9966mr1921626wrm.104.1704734777112; Mon, 08
 Jan 2024 09:26:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_BADE40D9A6A1C82B21811A844E5FE3881D06@qq.com>
 <000001da424d$645814a0$2d083de0$@opensource.cirrus.com> <CAB5Sz21QOq3k7Uk7POSr_5XcSK8Hw+tBNu0QAi7Dzk3dUJjFBA@mail.gmail.com>
 <003501da4251$bfbcb310$3f361930$@opensource.cirrus.com>
In-Reply-To: <003501da4251$bfbcb310$3f361930$@opensource.cirrus.com>
From: Huayu Zhang <zhanghuayu.dev@gmail.com>
Date: Tue, 9 Jan 2024 01:26:05 +0800
Message-ID: <CAB5Sz23oS0+jSC+MLA7=5idjYjrm=8G5tdm3L_VvhZr+W65cyw@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v2] ALSA: hda: Add _DSD for ThinkBook 16p G4 IRH
 with Subsystem Id of 0x17aa38a9.
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org, 
	James Schulman <James.Schulman@cirrus.com>, David Rhodes <David.Rhodes@cirrus.com>, 
	rf@opensource.cirrus.com, perex@perex.cz, kailang@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

Thanks for your patience and instructions. I've changed the SPK-ID to
2 as you did. But the same issue seems still there: Expecting overall
louder volumn, but only get up-facing speakers get louder, if I lower
the volumn, the bass (down facing) speakers seems louder (overall more
bass).

And here is the out put of my dmesg in patch kernel:
sudo dmesg | grep CS35L41
[    3.935286] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Cirrus Logic
CS35L41 (35a40), Revision: B2
[    3.989985] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Cirrus Logic
CS35L41 (35a40), Revision: B2
[    5.866227] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: CS35L41 Bound
- SSID: 17AA38A9, BST: 1, VSPK: 1, CH: L, FW EN: 1, SPKID: 0
[    6.370399] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: CS35L41 Bound
- SSID: 17AA38A9, BST: 1, VSPK: 1, CH: R, FW EN: 1, SPKID: 0

Could you please help me more on this. I'm not a kernel developer nor
embedded developer. But I may could assist you by testing the code or
more.

Many thanks,
Huayu

On Tue, Jan 9, 2024 at 12:43=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> Hi,
>
> > -----Original Message-----
> > From: Huayu Zhang <zhanghuayu.dev@gmail.com>
> > Sent: Monday, January 8, 2024 4:34 PM
> > To: Stefan Binding <sbinding@opensource.cirrus.com>
> > Subject: Re: [PATCH] [PATCH v2] ALSA: hda: Add _DSD for ThinkBook 16p
> > G4 IRH with Subsystem Id of 0x17aa38a9.
> >
> > Hi Stefan,
> >
> > Thanks for your help. Sorry for the previous email. My email client
> > seems has some bug. I=E2=80=99ll attach the output file of acpidump in =
this
> > email. And my alsa-info output is here:
> > https://alsa-
> > project.org/db/?f=3D1c05a26e3b969f82d9e7b506571db6c8262d2e8a
> >
> > Thanks again. Please have a nice day.
>
> Looking at the ACPI, the entry should be:
>
> { "17AA38A9", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 2, -=
1, 0, 0, 0 },
>
> Since SPK-ID is entry 2 rather than entry 1.
>
> Thanks,
> Stefan
>
> >
> > Best,
> > Huayu
> >
> > On Tue, Jan 9, 2024 at 12:11=E2=80=AFAM Stefan Binding
> > <sbinding@opensource.cirrus.com> wrote:
> > >
> > > Hi,
> > >
> > > > -----Original Message-----
> > > > From: Huayu Zhang <932367230@qq.com>
> > > > Sent: Monday, January 8, 2024 2:05 PM
> > > > To: tiwai@suse.com
> > > > Cc: linux-sound@vger.kernel.org; james.schulman@cirrus.com;
> > > > david.rhodes@cirrus.com; rf@opensource.cirrus.com;
> > perex@perex.cz;
> > > > sbinding@opensource.cirrus.com; kailang@realtek.com;
> > > > zhanghuayu.dev@gmail.com; Huayu Zhang <932367230@qq.com>
> > > > Subject: [PATCH] [PATCH v2] ALSA: hda: Add _DSD for ThinkBook 16p
> > G4
> > > > IRH with Subsystem Id of 0x17aa38a9.
> > > >
> > > > Add _DSD for ThinkBook 16p G4 IRH with Subsystem Id of 0x17aa38a9
> > > > because those info are missing in the ACPI table.
> > > >
> > > > Before applying the changes: the laptop only have very poor and low
> > > > volumn with only up facing builtin speakers (down facing have no
> > > sound
> > > > at all).
> > > >
> > > > After applying: both down facing (bass) and up facing bultin
> > > speakers
> > > > will have sound in a reasonable level.
> > > >
> > > > But the behavior of volumn control is actually changing the
> > > frequency
> > > > division: adjust to louder
> > > > (which supposed to make overall louder) only makes the up facing
> > > bultin
> > > > speakers louder and downfacing gradually
> > > > lower its volumn at the meantime.
> > > >
> > > > Wondering if this is related to ALSA or should make further changes
> > > on
> > > > the AMP settings?
> > > >
> > > > Signed-off-by: Huayu Zhang <932367230@qq.com>
> > > > ---
> > > >  sound/pci/hda/cs35l41_hda_property.c | 2 ++
> > > >  sound/pci/hda/patch_realtek.c        | 1 +
> > > >  2 files changed, 3 insertions(+)
> > > >
> > > > diff --git a/sound/pci/hda/cs35l41_hda_property.c
> > > > b/sound/pci/hda/cs35l41_hda_property.c
> > > > index 35277ce890a4..b1844224123f 100644
> > > > --- a/sound/pci/hda/cs35l41_hda_property.c
> > > > +++ b/sound/pci/hda/cs35l41_hda_property.c
> > > > @@ -93,6 +93,7 @@ static const struct cs35l41_config
> > > > cs35l41_config_table[] =3D {
> > > >       { "10431F12", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, =
0
> > > > }, 0, 1, -1, 1000, 4500, 24 },
> > > >       { "10431F1F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, =
0
> > > > }, 1, -1, 0, 0, 0, 0 },
> > > >       { "10431F62", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, =
0
> > > > }, 1, 2, 0, 0, 0, 0 },
> > > > +     { "17AA38A9", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, =
0
> > > > }, 0, 1, -1, 0, 0, 0 },
> > >
> > > This entry doesn't quite match the ACPI that I have access to for thi=
s
> > > laptop,
> > > though what I have might be out of date.
> > > Can you attach an acpidump of this laptop so I can compare it to this
> > > entry.
> > > The ACPI dump that I have states that the SPK-ID is GPIO index 2,
> > > rather
> > > than index 1 as described in this entry.
> > >
> > > You can generate the acpidump using the acpidump tool:
> > > $ acpidump > acpidump.out
> > >
> > > Thanks,
> > > Stefan
> > >
> > > >       { "17AA38B4", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, =
0
> > > > }, 0, 1, -1, 0, 0, 0 },
> > > >       { "17AA38B5", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, =
0
> > > > }, 0, 1, -1, 0, 0, 0 },
> > > >       { "17AA38B6", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, =
0
> > > > }, 0, 1, -1, 0, 0, 0 },
> > > > @@ -427,6 +428,7 @@ static const struct cs35l41_prop_model
> > > > cs35l41_prop_model_table[] =3D {
> > > >       { "CSC3551", "10431F12", generic_dsd_config },
> > > >       { "CSC3551", "10431F1F", generic_dsd_config },
> > > >       { "CSC3551", "10431F62", generic_dsd_config },
> > > > +     { "CSC3551", "17AA38A9", generic_dsd_config },
> > > >       { "CSC3551", "17AA38B4", generic_dsd_config },
> > > >       { "CSC3551", "17AA38B5", generic_dsd_config },
> > > >       { "CSC3551", "17AA38B6", generic_dsd_config },
> > > > diff --git a/sound/pci/hda/patch_realtek.c
> > > > b/sound/pci/hda/patch_realtek.c
> > > > index 1dcfba27e075..3eae1a5d9bcd 100644
> > > > --- a/sound/pci/hda/patch_realtek.c
> > > > +++ b/sound/pci/hda/patch_realtek.c
> > > > @@ -10256,6 +10256,7 @@ static const struct snd_pci_quirk
> > > > alc269_fixup_tbl[] =3D {
> > > >       SND_PCI_QUIRK(0x17aa, 0x3886, "Y780 VECO DUAL",
> > > > ALC287_FIXUP_TAS2781_I2C),
> > > >       SND_PCI_QUIRK(0x17aa, 0x38a7, "Y780P AMD YG dual",
> > > > ALC287_FIXUP_TAS2781_I2C),
> > > >       SND_PCI_QUIRK(0x17aa, 0x38a8, "Y780P AMD VECO dual",
> > > > ALC287_FIXUP_TAS2781_I2C),
> > > > +     SND_PCI_QUIRK(0x17aa, 0x38a9, "ThinkBook 16p G4 IRH",
> > > > ALC287_FIXUP_CS35L41_I2C_2),
> > > >       SND_PCI_QUIRK(0x17aa, 0x38b4, "Legion Slim 7 16IRH8",
> > > > ALC287_FIXUP_CS35L41_I2C_2),
> > > >       SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8",
> > > > ALC287_FIXUP_CS35L41_I2C_2),
> > > >       SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8",
> > > > ALC287_FIXUP_CS35L41_I2C_2),
> > > > --
> > > > 2.34.1
> > > >
> > >
> > >
>
