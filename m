Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2543A33C508
	for <linux-sound@vger.kernel.org>; Tue, 28 Oct 2025 17:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761672490; cv=none; b=sEIlNoOdZlvq/nWFHn8Br8NesLPEUPL6e2R39Dk4pk1ZzfGhIZiXaqNmOgdRYHu5u76i42+pI3WhfuPTXhpbjU8Y9cvQCZz4U51QXbk4g0rGhDlCZClkYW+UBLn+fPJgLfj2ZHcWSoeDBMieyhvUI5vragBmlEd3WTvS2eQAWS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761672490; c=relaxed/simple;
	bh=8wquMDkIHq4Im1b0jco8M/fwii9bGnFoFZqwSeh30y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hKfhLspcRwda+qfxpDbYVwpgzHXgEb7tdso/m930rS0Yta4dYsu5B0HEczUWJ1ePelTDyhj4Roh5pCGSa4zKdXE8nl2jPMwN9QWBBhs781EQkBLtY1Rt/ol1oOE3Jo7l7rPdrpXYWoUeMJytzC098q/Pyh/DB/kAIzRWnalcTXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Evy3n3eD; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Evy3n3eD"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id C9D41BDBB4
	for <linux-sound@vger.kernel.org>; Tue, 28 Oct 2025 19:27:56 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id EECEEBDC59
	for <linux-sound@vger.kernel.org>; Tue, 28 Oct 2025 19:27:55 +0200 (EET)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 502B6201B92
	for <linux-sound@vger.kernel.org>; Tue, 28 Oct 2025 19:27:55 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761672475;
	bh=HU9UoBsZbHguHWD5/Van7BmfUQKq6GqEPH0N/82zYvQ=;
	h=Received:From:Subject:To;
	b=Evy3n3eDhb5LOeS00Ta0GF51crMw1ASmTSRa9C6+OAuP1hdiUeYd/Iu+nZg8pk9gE
	 +LIq9VCQZWTaM3Oyv32DbrweXrZdDUg3iilqkFqnmjMJaQ6LcK3Bt8t3xfcVXkf38L
	 GJanCt1B0oMYV6cNo48RarKoQVyA6NKMspHgAbI0Bbi/RBx1+w5ecxwTPZHpvYGSGR
	 Uz5bAeXw5Mu+1gcCFyYftT+g1C2eY2CJ2LhCLl2Iy58ol/uE72AAYmn4MO4EMQoru7
	 hzL1nFIGORmHe0TpxiH7zXRl7n2yp4VGx0VBtJL4X86ie9Ev61/Vpr1xZSFJR7skhU
	 DwcMY6dPVBlmw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.181) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f181.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-378d65d8184so14265391fa.0
        for <linux-sound@vger.kernel.org>;
 Tue, 28 Oct 2025 10:27:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUQv+cNBLAWBFCMmz3uc7d7MxYteHQKrQvA3WKG/DJEfRlIyit9WEKwbH07+mkNz7J83mLKBLW6/BKunA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEpMZkNTzplQay5vXLO9fINIwVRoJpmXKO88zDmn9OAXAhTv2R
	WfZ8UfctzNIP5lhlzliYUz9Eb0EScgoLgV+v1xdw+kUU6hMiDzqoEnJr9htkFh9ZdNZFMXGN4za
	IqMU2JzytiXKUzJo33JcgqgrZ1rADRbM=
X-Google-Smtp-Source: 
 AGHT+IHy0bQSvjL9vt4t1fRebvpa51jhls+H0tpgM+NyIsSmCqYDEqgqrovCxhPw24e+mMwJk/l4HHRkUnBcqxQWKzA=
X-Received: by 2002:a2e:a805:0:b0:376:2802:84ce with SMTP id
 38308e7fff4ca-37a052f8c58mr653481fa.47.1761672474783; Tue, 28 Oct 2025
 10:27:54 -0700 (PDT)
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
 <CAGwozwFtah66p=5oy9rf5phVGdDTiWg0WuJBT3qGpWdP3A62Pg@mail.gmail.com>
 <eb749233-0342-49a9-a41b-6d18239eb1d9@linux.dev>
In-Reply-To: <eb749233-0342-49a9-a41b-6d18239eb1d9@linux.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 28 Oct 2025 18:27:42 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEKzurj7qeAnzvWjJbf03da70ij5DtOJ7svZaoJ7vK=aA@mail.gmail.com>
X-Gm-Features: AWmQ_bkSaMOjigM12P8qgnp_UJNXlYwcZ6Aw14wC6rOeZBYojHWBPQG5b2veNn0
Message-ID: 
 <CAGwozwEKzurj7qeAnzvWjJbf03da70ij5DtOJ7svZaoJ7vK=aA@mail.gmail.com>
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
 <176167247560.3088173.9898537130667515878@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Mon, 27 Oct 2025 at 20:58, Matthew Schwartz
<matthew.schwartz@linux.dev> wrote:
>
> On 10/27/25 1:23 AM, Antheas Kapenekakis wrote:
> > On Mon, 27 Oct 2025 at 07:02, Matthew Schwartz
> > <matthew.schwartz@linux.dev> wrote:
> >>
> >>
> >>
> >>> On Oct 26, 2025, at 12:19=E2=80=AFPM, Antheas Kapenekakis <lkml@anthe=
as.dev> wrote:
> >>>
> >>> On Sun, 26 Oct 2025 at 20:16, Antheas Kapenekakis <lkml@antheas.dev> =
wrote:
> >>>>
> >>>> Bind the realtek codec to TAS2781 I2C audio amps on ASUS Xbox Ally
> >>>> projects. While these projects work without a quirk, adding it incre=
ases
> >>>> the output volume significantly.
> >>>
> >>> Also, if you can upstream the firmware files:
> >>> TAS2XXX13840.bin
> >>> TAS2XXX13841.bin
> >>> TAS2XXX13940.bin
> >>> TAS2XXX13941.bin
> >>
> >> This is the firmware at [1], correct? I=E2=80=99m testing the series w=
ith that firmware on my ROG Xbox Ally X, and I found something interesting.
> >>
> >> By default, with just your kernel patches and the firmware files hoste=
d at [1], my unit is loading:
> >>
> >> tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: Loaded FW: TAS2XXX13840.bin=
, sha256: 58cffa36ae23a2d9b2349ecb6c1d4e89627934cd79218f6ada06eaffe6688246
> >>
> >> However, with this firmware file,  TAS2XXX13840.bin, there is signific=
ant audio clipping above 75% speaker level on my individual unit.
> >>
> >> Then, I tried renaming the other firmware file, TAS2XXX13841.bin, into=
 TAS2XXX13840.bin. Now my unit is loading:
> >>
> >> tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: Loaded FW: TAS2XXX13840.bin=
, sha256: 0fda76e7142cb455df1860cfdb19bb3cb6871128b385595fe06b296a070f4b8c
> >>
> >> With this firmware file, audio is perfect all the way to 100% speaker =
level.
> >>
> >> If I recall, there have been other ASUS products that required matchin=
g amplifier hardware with firmware correctly, right? It looks like this mig=
ht be another case of since it seems my unit is loading the wrong firmware =
for its amplifiers.
> >
> > The original Ally X had a similar setup, yes.
> >
> > First patch might not be perfect and your speaker pin might be 1. My
> > Xbox Ally's pin is 1. It loads:
> > Loaded FW: TAS2XXX13941.bin, sha256:
> > 0fda76e7142cb455df1860cfdb19bb3cb6871128b385595fe06b296a070f4b8c
> >
> > And it sounds loud and crisp. So the pin is read.
> >
> > I had multiple users verify the X works, but perhaps it is not perfect
> > yet. Make sure you are not using a dsp that might be interfering
>
> Seems like there have been other reports similar to mine on Xbox Ally X, =
where flipping the firmware files by renaming them fixes sound issues for t=
hem.
>
> @TI, Maybe something is different with the conditional logic for the ROG =
Xbox Ally X? The current GPIO-detected speaker_id doesn't always correspond=
 to the correct firmware choice on this model it seems.

Yeah, it seems that specifically on the Xbox Ally X, the firmwares are
swapped around? What could be the case for that?

I had three users with popping and dropped audio swap the firmware on
their X and they said the other one fixed it. And another two without
issues swapping the firmware and saying it does not make a
quantifiable change.

Antheas


Antheas

> >
> > Antheas
> >
> >> Matt
> >>
> >> [1]: https://github.com/hhd-dev/hwfirm
> >>
> >>>
> >>> That would be great :)
> >>>
> >>> Antheas
> >>>
> >>>> Cc: stable@vger.kernel.org # 6.17
> >>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>> ---
> >>>> sound/hda/codecs/realtek/alc269.c | 2 ++
> >>>> 1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/re=
altek/alc269.c
> >>>> index 8ad5febd822a..d1ad84eee6d1 100644
> >>>> --- a/sound/hda/codecs/realtek/alc269.c
> >>>> +++ b/sound/hda/codecs/realtek/alc269.c
> >>>> @@ -6713,6 +6713,8 @@ static const struct hda_quirk alc269_fixup_tbl=
[] =3D {
> >>>>        SND_PCI_QUIRK(0x1043, 0x12f0, "ASUS X541UV", ALC256_FIXUP_ASU=
S_MIC_NO_PRESENCE),
> >>>>        SND_PCI_QUIRK(0x1043, 0x1313, "Asus K42JZ", ALC269VB_FIXUP_AS=
US_MIC_NO_PRESENCE),
> >>>>        SND_PCI_QUIRK(0x1043, 0x1314, "ASUS GA605K", ALC285_FIXUP_ASU=
S_GA605K_HEADSET_MIC),
> >>>> +       SND_PCI_QUIRK(0x1043, 0x1384, "ASUS RC73XA", ALC287_FIXUP_TX=
NW2781_I2C),
> >>>> +       SND_PCI_QUIRK(0x1043, 0x1394, "ASUS RC73YA", ALC287_FIXUP_TX=
NW2781_I2C),
> >>>>        SND_PCI_QUIRK(0x1043, 0x13b0, "ASUS Z550SA", ALC256_FIXUP_ASU=
S_MIC_NO_PRESENCE),
> >>>>        SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_=
FIXUP_ASUS_ZENBOOK),
> >>>>        SND_PCI_QUIRK(0x1043, 0x1433, "ASUS GX650PY/PZ/PV/PU/PYV/PZV/=
PIV/PVV", ALC285_FIXUP_ASUS_I2C_HEADSET_MIC),
> >>>> --
> >>>> 2.51.1
> >>>>
> >>>>
> >>>
> >>>
> >>
> >>
> >
>
>

