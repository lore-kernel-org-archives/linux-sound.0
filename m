Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85832248B4
	for <linux-sound@vger.kernel.org>; Fri,  2 Jan 2026 23:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767396168; cv=none; b=FpwaJ+IRBEMqyvd4MNUS1w5AMEnQ6MUjnn7rRiBVq+oOoAyj0EQqi1ZSrhMktEF9u2jAhSTOpeAMOO69Ci8IMbztfpewLY/4T2s1qjDCAa76SiLxmC2OpPTN/mknDwaynD+DG3accqDpclbOi2kLCNX7+UWF/89qLn0/wrEAAfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767396168; c=relaxed/simple;
	bh=a08qgsh068Zg+Act7ukzBPaeVKSUz2LPuQ33El7fDBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rlBH25VK3WciNh2VZDsf/07VWyH6DEiCBNxzu4ppwRUq/Jmm3NPy+0fBNHZl1rPOeyU9jSRf272SORf0C2EIbteRIgF8LwmE9MsDyCrwaKhRUJWbK9Z2s/EA93YsZgjda+kAV3TaX+73sH1i7Bg6hdKA8oqbsvYWyaImB4Kwq/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=aCFJMjTj; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="aCFJMjTj"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 2441CC0881
	for <linux-sound@vger.kernel.org>; Sat,  3 Jan 2026 01:13:17 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 49886BC562
	for <linux-sound@vger.kernel.org>; Sat,  3 Jan 2026 01:13:16 +0200 (EET)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id C8B501FE522
	for <linux-sound@vger.kernel.org>; Sat,  3 Jan 2026 01:13:15 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1767395596;
	bh=UIaNSJA+GUvFfHYA6dPGFTgBQqFH6DUnoHCgdN9RoyA=;
	h=Received:From:Subject:To;
	b=aCFJMjTjM2nqajGYDwrMFwqxeZMMm16DT+hJBidTipnr5VsRxbfTPOPF/hHHBNZP4
	 6WNOlZbfRl9sHfq7EQG2+23zNOqWy7kgfxwwk9/0GIR+bEwi/jkYFNHX7kqlvXdmKY
	 ieZehw+roQbm6S6RfNvrw+hxXx/GhBoUQ8irnsDolWgW2tyTTHJ4CpVPsLtEoPS++l
	 9yPIN+GMAN/l5ZvbohKfStYH+du6wJW/cWCB6kzQ0ZLlAMWHLA/zyt+vzu65DgIAwR
	 OQ2q/SotHLIEQCtKFB+21aRze8KMOa87JAlg3q2RyCV917+PGMdgTnkQrHmkfremjo
	 kj9qXh7FgQzRw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.173) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f173.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-37b95f87d64so96554401fa.2
        for <linux-sound@vger.kernel.org>;
 Fri, 02 Jan 2026 15:13:15 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUYunujNL6+yXzqvYkZy+pQAsqgw1fcbtObbLrNt32F5V37lMvlTiTskM8GVUmA3xWbOW+55h7bn/AxBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxB3987MZ+f8E1bxGQbX9zfZXZ5YEhPbspB2KJ8FM0FIhJqCcO
	snRO6VzsqTS7liooUW2n4kjptLfndQd3v9yoBag+HcnUyrXDCAPW9jNSlDfw9NAxUW1EuXulkvK
	g0nX8MN+3jK1I9hT1hkrK+Syd/hA0myU=
X-Google-Smtp-Source: 
 AGHT+IGRnPpsgOOoKcPSm66tnF0Ng3trIribi6uhr4cBF7hvdnq5FcbLYzlHegnzPXZfMqfR+a120hjs0mW9p8TZ104=
X-Received: by 2002:a05:651c:19a2:b0:37f:9168:c26c with SMTP id
 38308e7fff4ca-3812164e0demr129621491fa.41.1767395595181; Fri, 02 Jan 2026
 15:13:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0ba100d0-9b6f-4a3b-bffa-61abe1b46cd5@linux.dev>
 <2d8b782c-a97c-4521-9307-a2cf8934802a@linux.dev>
 <288f6482-9a6b-4362-ac97-18043659deb7@linux.dev>
 <09148B42-71C2-4428-8D21-903F85853091@linux.dev>
 <CAGwozwEJRDq96ZUQv+8H5fiXBVQ2jFvvuK48WpDqZ0eQ_NB+NA@mail.gmail.com>
 <c7929aa2-93d4-40d5-aa6f-d554729f4bee@linux.dev>
In-Reply-To: <c7929aa2-93d4-40d5-aa6f-d554729f4bee@linux.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 3 Jan 2026 01:13:03 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwH6A-NNCioS7J_EiTbxv2Y0B3YFXuyeWU_RMsW2Z+YsRA@mail.gmail.com>
X-Gm-Features: AQt7F2pKR8fDMD3pORqycaw44HdyPNVA6zCYo6gmZEUrOXDJJiI4rWmsi7kM_zM
Message-ID: 
 <CAGwozwH6A-NNCioS7J_EiTbxv2Y0B3YFXuyeWU_RMsW2Z+YsRA@mail.gmail.com>
Subject: Re: [BUG] hda/tas2781: ASUS ROG Xbox Ally X audio issues with default
 firmware
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: Baojun Xu <baojun.xu@ti.com>, Shenghao Ding <shenghao-ding@ti.com>,
 linux-sound@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176739559601.1579912.12143797334255603467@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Fri, 2 Jan 2026 at 21:17, Matthew Schwartz
<matthew.schwartz@linux.dev> wrote:
>
> On 1/2/26 9:12 AM, Antheas Kapenekakis wrote:
> > On Tue, 30 Dec 2025 at 22:44, Matthew Schwartz
> > <matthew.schwartz@linux.dev> wrote:
> >>
> >>
> >>
> >>> On Dec 8, 2025, at 8:00=E2=80=AFPM, Matthew Schwartz <matthew.schwart=
z@linux.dev> wrote:
> >>>
> >> - snip
> >>> 2.52.0
> >>
> >> After reading the TI E2E forums, it seems these calibration tuning con=
figurations are only meant to be used during a calibration process.
> >
> > A source would be good here, a link or two
>
> Sorry about that, here is where I read about the differences between the =
two configs:
> https://e2e.ti.com/support/audio-group/audio/f/audio-forum/1558310/tas256=
3-what-is-the-difference-between-tuning-and-calibration-configuration-in-ex=
ported-smartamp-binary

This link describes "calibration" configurations that are used in the
calibration procedure. It is not clear to me that it refers to the
calibration parameters exported by UEFI or in the configuration itself
to be used alongside a configuration. I would tend toward this being
irrelevant.

> It's about a different amplifier model, but I assume the same applies to =
tas2781 given the naming structure is the same for the configurations.
>
> >
> >> Instead, something else I found that works is not overriding the firmw=
are file calibration data with the UEFI calibration data:

I misunderstood what you meant by this before. I thought you meant
that the firmware overrode the UEFI data, not the other way around.
Surely, using the dummy data in the firmware file is better than using
incorrect data from UEFI. However, the manufacturer calibrated data
from the factory floor for each specific unit is in UEFI, so that is
what should be used.

> > I did not look into the source code, do you have any reference in the
> > ACPI TAS code that r0_buf is prefilled with UEFI data?
>
> From what I understand, I think the current flow goes like this:
>
> 1. During driver init, tas2781_save_calibration() reads UEFI calibration =
data into the cali_data memory buffer and sets is_user_space_calidata=3Dtru=
e: https://github.com/torvalds/linux/blob/master/sound/hda/codecs/side-code=
cs/tas2781_hda.c#L162-L173
>
> 2. When switching to a DSP config, tasdevice_select_tuningprm_cfg() calls=
 tasdevice_load_data() which writes the firmware configuration, including a=
ny calibration values embedded in that config: https://github.com/torvalds/=
linux/blob/master/sound/soc/codecs/tas2781-fmwlib.c#L2510
>
> 3. Immediately after, tasdev_load_calibrated_data() writes the UEFI calib=
ration data from step 1, overwriting the values just set in step 2: https:/=
/github.com/torvalds/linux/blob/9b043680446067358913edc2e9dd71bf8ffae208/so=
und/soc/codecs/tas2781-fmwlib.c#L2392-L2428 + https://github.com/torvalds/l=
inux/blob/master/sound/soc/codecs/tas2781-fmwlib.c#L2519
>
> I confirmed this this by inserting some debug logs around tasdev_load_cal=
ibrated_data:

I went through the code. It loads the UEFI data, sets
is_user_space_calidata=3D1, then if the data is available it loads it.
This is correct.

To me this seems like the calibration data for amp 1 is written to
both amp 1 and amp 2, and for your firmware this breaks amp2.

In tasdev_load_calibrated_data(), an i index is provided, but
cali_data is nested under priv. So only one calibration set is
supported. This means that amp 2 gets amp 1 calibrations.

Perhaps there is a "SmartAmpCalibrationData2" that should be read
instead for amp 2 instead, can you dump the EFI variables and check?

In that case, a minor refactor to move cali_data and
is_user_space_calidata from priv to priv->tasdevice[i] and then use
the proper efi var would fix this.

Antheas

> [    3.908963] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tas2781_apply_c=
alib: dspbin_typ=3D2, ndev=3D2, Setting is_user_space_calidata=3Dtrue
> <snip>
>
> where it loads the UEFI calibration over top of the firmware calibration.
>
> >
> > It could be that there is a specific priority, where UEFI data is
> > supposed to be loaded after the firmware code, replacing the
> > calibration data from the file, or that is what is done in Windows.
> > But here it is done the other way. In that case, it might be more
> > appropriate to set a dummy var such as bool uefi_calib that becomes 1
> > when loading calibration from UEFI, and skip loading from the fw file
> > if available.
> >
> > But links, etc. Here, this would affect all TAS devices too, so it is
> > more major.
>
> Yes, was really hoping to get TI's feedback before potentially sending it=
 out, as it would be a major change and the documentation on this is scarce=
. I could also be misunderstanding the calibration data load flow, but this=
 is just from poking at this issue from every angle I can think of.
>
> Happy new year,
> Matt
>
> >
> > Happy new year,
> > Antheas
> >
> >> diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2=
781-fmwlib.c
> >> index 78fd0a5dc6f2..1e768e6187da 100644
> >> --- a/sound/soc/codecs/tas2781-fmwlib.c
> >> +++ b/sound/soc/codecs/tas2781-fmwlib.c
> >> @@ -2377,6 +2377,7 @@ static void tasdev_load_calibrated_data(struct t=
asdevice_priv *priv, int i)
> >>         unsigned char *data =3D cali_data->data;
> >>         struct tasdevice_calibration *cal;
> >>         int k =3D i * (cali_data->cali_dat_sz_per_dev + 1);
> >> +       unsigned char r0_buf[4];
> >>         int rc;
> >>
> >>         /* Load the calibrated data from cal bin file */
> >> @@ -2389,6 +2390,20 @@ static void tasdev_load_calibrated_data(struct =
tasdevice_priv *priv, int i)
> >>         }
> >>         if (!priv->is_user_space_calidata)
> >>                 return;
> >> +
> >> +       /*
> >> +        * Check if the DSP config already set the calibration registe=
rs.
> >> +        * Some tuning configs contain their own calibration data whic=
h should
> >> +        * not be overwritten by user space calibration data.
> >> +        */
> >> +       rc =3D tasdevice_dev_bulk_read(priv, i, p->r0_reg, r0_buf, 4);
> >> +       if (rc >=3D 0 && (r0_buf[0] | r0_buf[1] | r0_buf[2] | r0_buf[3=
])) {
> >> +               dev_dbg(priv->dev,
> >> +                       "%s: dev %d r0_reg already set by config, skip=
ping calibration\n",
> >> +                       __func__, i);
> >> +               return;
> >> +       }
> >> +
> >>         /* load calibrated data from user space */
> >>         if (data[k] !=3D i) {
> >>                 dev_err(priv->dev, "%s: no cal-data for dev %d from us=
r-spc\n",
> >>
> >> Is this more suitable to be upstreamed?
> >>
> >> Thanks,
> >> Matt
> >> <snip>
> >>
> >
>
>

