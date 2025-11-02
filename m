Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B902DEA9D
	for <linux-sound@vger.kernel.org>; Sun,  2 Nov 2025 17:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762104849; cv=none; b=gLHX2hFMf76k4WZSAgE3+p76CIUTg2jDLx/IEK5jyCcYWXcPxpd+5+LqbuGLnZbdd9CRBRvYtLduZl4zbpoC9zzIx8KOMsUcUTAsHf6kr5O11c3sfY3FtmO+1lUYRezEPeaKYJLdijL1Km74k2mtQ7SUu3gmj8Tq5L1+cUOCSEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762104849; c=relaxed/simple;
	bh=csvdvzB/2xawTZMXb5SbTVOQRr38OXUL2bB899eOBkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCyJwniYtBj76O7C9hHJ3d8q8nraMxQXSQNzExaFCaS4BO89JWzOfQKtwNLfBCJn5ZM7kaTk51OwyUeYKBHC0iGPQOzERf5o8P8HyElZ/NTA8hOl3rarutcRXxNlLESn/WNvBFu8emZv/NdvPR3B4iT+slC6A/olKNfAhsakcaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ZimVb+40; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ZimVb+40"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 97DA4BDA50
	for <linux-sound@vger.kernel.org>; Sun,  2 Nov 2025 19:33:57 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id C4E43BDA43
	for <linux-sound@vger.kernel.org>; Sun,  2 Nov 2025 19:33:56 +0200 (EET)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id DA71A201DCE
	for <linux-sound@vger.kernel.org>; Sun,  2 Nov 2025 19:33:55 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1762104836;
	bh=/ecRt3m8g8LRRa0zGfDiPLHt9Ca2vaZbSX8HFFw3eck=;
	h=Received:From:Subject:To;
	b=ZimVb+40cxYUHRFyircdaY/EWZ2QfmnSMIz+lMW4+TjFZDw8xN9w5Ugp/MxI5to+t
	 j8TXkBoS/57vLtBcBfg90gXUO17s2W94YyJpb9XJjK2b1Hljpwq89Ko0e+vD2Xuy3b
	 D1MXP014y9ujEtt2sCBpO2D2aE7uDNsvQOQS6gDBZlSZScn5ueKFmwy6REMLsUUNnD
	 jw3H2gIvgJjlZvnRBtvGJ5BDLB7eLF/s9xhc8SGoIi+8TCZ9J3TixCHkO79el0dpaM
	 Lm+Kg0DOZnOGeqKYwPQaUR69gPsT/qoBQRe/H2YBPGS11jHgS2Q+9+/4u+U+Fh11Pe
	 OmHCKzaZ0lX2g==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.170) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f170.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-37a2d9cf22aso9953161fa.1
        for <linux-sound@vger.kernel.org>;
 Sun, 02 Nov 2025 09:33:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU+5r5t/nNJcqP/xQRT6VQTFb0zFe8DaySNODM5xdZ+7gdqIYtGozzZM+BstExaCsyW0WzJrw2pHK0nlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSy/QVzuGJRgQdoCZOCCDi3YT06oZT4CxyQLh0+78dHN9jOr3H
	ATBLtP8pArFY1btQWlZfCIvjg8XZgiYmFx5QRRMmqy6xVq5fN2z6dHA3//X6CWJ5MH8CcGozGhy
	2D7F/urb7NjwAAM8aXHO0zjwgvGjzDys=
X-Google-Smtp-Source: 
 AGHT+IEGlHjrKlW8BbNvyBrM2cKx8XMFsCM4baG3D7IPUoKbq0P8QCIFfSjxzfeimt+tSsmI7Gcle+nvMES8ubT3qWY=
X-Received: by 2002:a05:651c:409b:b0:378:cddd:ca69 with SMTP id
 38308e7fff4ca-37a18de650fmr21154871fa.18.1762104835171; Sun, 02 Nov 2025
 09:33:55 -0800 (PST)
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
 <CAGwozwEKzurj7qeAnzvWjJbf03da70ij5DtOJ7svZaoJ7vK=aA@mail.gmail.com>
In-Reply-To: 
 <CAGwozwEKzurj7qeAnzvWjJbf03da70ij5DtOJ7svZaoJ7vK=aA@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 2 Nov 2025 18:33:43 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEErv_cLxsP93n0oj20E03oPOk9-5v31mVnf_Adwjkwgg@mail.gmail.com>
X-Gm-Features: AWmQ_bnTPDss_CEbonmSuzDG7b2Mn6vqtAhYXIVulFyiLqPKqfnnMiKOPfzjs_A
Message-ID: 
 <CAGwozwEErv_cLxsP93n0oj20E03oPOk9-5v31mVnf_Adwjkwgg@mail.gmail.com>
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
 <176210483623.1725119.3445547294314900884@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 28 Oct 2025 at 18:27, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Mon, 27 Oct 2025 at 20:58, Matthew Schwartz
> <matthew.schwartz@linux.dev> wrote:
> >
> > On 10/27/25 1:23 AM, Antheas Kapenekakis wrote:
> > > On Mon, 27 Oct 2025 at 07:02, Matthew Schwartz
> > > <matthew.schwartz@linux.dev> wrote:
> > >>
> > >>
> > >>
> > >>> On Oct 26, 2025, at 12:19=E2=80=AFPM, Antheas Kapenekakis <lkml@ant=
heas.dev> wrote:
> > >>>
> > >>> On Sun, 26 Oct 2025 at 20:16, Antheas Kapenekakis <lkml@antheas.dev=
> wrote:
> > >>>>
> > >>>> Bind the realtek codec to TAS2781 I2C audio amps on ASUS Xbox Ally
> > >>>> projects. While these projects work without a quirk, adding it inc=
reases
> > >>>> the output volume significantly.
> > >>>
> > >>> Also, if you can upstream the firmware files:
> > >>> TAS2XXX13840.bin
> > >>> TAS2XXX13841.bin
> > >>> TAS2XXX13940.bin
> > >>> TAS2XXX13941.bin
> > >>
> > >> This is the firmware at [1], correct? I=E2=80=99m testing the series=
 with that firmware on my ROG Xbox Ally X, and I found something interestin=
g.
> > >>
> > >> By default, with just your kernel patches and the firmware files hos=
ted at [1], my unit is loading:
> > >>
> > >> tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: Loaded FW: TAS2XXX13840.b=
in, sha256: 58cffa36ae23a2d9b2349ecb6c1d4e89627934cd79218f6ada06eaffe668824=
6
> > >>
> > >> However, with this firmware file,  TAS2XXX13840.bin, there is signif=
icant audio clipping above 75% speaker level on my individual unit.
> > >>
> > >> Then, I tried renaming the other firmware file, TAS2XXX13841.bin, in=
to TAS2XXX13840.bin. Now my unit is loading:
> > >>
> > >> tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: Loaded FW: TAS2XXX13840.b=
in, sha256: 0fda76e7142cb455df1860cfdb19bb3cb6871128b385595fe06b296a070f4b8=
c
> > >>
> > >> With this firmware file, audio is perfect all the way to 100% speake=
r level.
> > >>
> > >> If I recall, there have been other ASUS products that required match=
ing amplifier hardware with firmware correctly, right? It looks like this m=
ight be another case of since it seems my unit is loading the wrong firmwar=
e for its amplifiers.
> > >
> > > The original Ally X had a similar setup, yes.
> > >
> > > First patch might not be perfect and your speaker pin might be 1. My
> > > Xbox Ally's pin is 1. It loads:
> > > Loaded FW: TAS2XXX13941.bin, sha256:
> > > 0fda76e7142cb455df1860cfdb19bb3cb6871128b385595fe06b296a070f4b8c
> > >
> > > And it sounds loud and crisp. So the pin is read.
> > >
> > > I had multiple users verify the X works, but perhaps it is not perfec=
t
> > > yet. Make sure you are not using a dsp that might be interfering
> >
> > Seems like there have been other reports similar to mine on Xbox Ally X=
, where flipping the firmware files by renaming them fixes sound issues for=
 them.
> >
> > @TI, Maybe something is different with the conditional logic for the RO=
G Xbox Ally X? The current GPIO-detected speaker_id doesn't always correspo=
nd to the correct firmware choice on this model it seems.
>
> Yeah, it seems that specifically on the Xbox Ally X, the firmwares are
> swapped around? What could be the case for that?
>
> I had three users with popping and dropped audio swap the firmware on
> their X and they said the other one fixed it. And another two without
> issues swapping the firmware and saying it does not make a
> quantifiable change.

Update on this. Users with a pin value of 1 are happy with the 1
firmware. Users with a value of 0 are not happy with TAS2XXX13840 and
TAS2XXX13841 works better for them. Moreover, users of the 1 firmware
are not happy with the 0 firmware.

This is just on the Ally X, on the normal Ally there are no issues.

So there is an issue with TAS2XXX13840 on the linux side, TAS2XXX13841
is correctly selected.

Antheas

> Antheas
>
>
> Antheas
>
> > >
> > > Antheas
> > >
> > >> Matt
> > >>
> > >> [1]: https://github.com/hhd-dev/hwfirm
> > >>
> > >>>
> > >>> That would be great :)
> > >>>
> > >>> Antheas
> > >>>
> > >>>> Cc: stable@vger.kernel.org # 6.17
> > >>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > >>>> ---
> > >>>> sound/hda/codecs/realtek/alc269.c | 2 ++
> > >>>> 1 file changed, 2 insertions(+)
> > >>>>
> > >>>> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/=
realtek/alc269.c
> > >>>> index 8ad5febd822a..d1ad84eee6d1 100644
> > >>>> --- a/sound/hda/codecs/realtek/alc269.c
> > >>>> +++ b/sound/hda/codecs/realtek/alc269.c
> > >>>> @@ -6713,6 +6713,8 @@ static const struct hda_quirk alc269_fixup_t=
bl[] =3D {
> > >>>>        SND_PCI_QUIRK(0x1043, 0x12f0, "ASUS X541UV", ALC256_FIXUP_A=
SUS_MIC_NO_PRESENCE),
> > >>>>        SND_PCI_QUIRK(0x1043, 0x1313, "Asus K42JZ", ALC269VB_FIXUP_=
ASUS_MIC_NO_PRESENCE),
> > >>>>        SND_PCI_QUIRK(0x1043, 0x1314, "ASUS GA605K", ALC285_FIXUP_A=
SUS_GA605K_HEADSET_MIC),
> > >>>> +       SND_PCI_QUIRK(0x1043, 0x1384, "ASUS RC73XA", ALC287_FIXUP_=
TXNW2781_I2C),
> > >>>> +       SND_PCI_QUIRK(0x1043, 0x1394, "ASUS RC73YA", ALC287_FIXUP_=
TXNW2781_I2C),
> > >>>>        SND_PCI_QUIRK(0x1043, 0x13b0, "ASUS Z550SA", ALC256_FIXUP_A=
SUS_MIC_NO_PRESENCE),
> > >>>>        SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269V=
B_FIXUP_ASUS_ZENBOOK),
> > >>>>        SND_PCI_QUIRK(0x1043, 0x1433, "ASUS GX650PY/PZ/PV/PU/PYV/PZ=
V/PIV/PVV", ALC285_FIXUP_ASUS_I2C_HEADSET_MIC),
> > >>>> --
> > >>>> 2.51.1
> > >>>>
> > >>>>
> > >>>
> > >>>
> > >>
> > >>
> > >
> >
> >

