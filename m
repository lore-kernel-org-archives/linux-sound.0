Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087431F0994
	for <linux-sound@vger.kernel.org>; Sat,  3 Jan 2026 11:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767440924; cv=none; b=TtwTUul2EF5ZyrdpyzmfGqDQ3CWDawbABcXYSOz38q2pqUPR9eiWyy2Ddu3wjIQLCktzieq7p+yXwgUYB9n4dqIVbyZVpVXupP4/Km0gC8H4g85ciQi6iJBhHJ1mGjLkSb7UY5cnku2TpQYF8nTwnMnApiQF88dpQXp3qIUd1mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767440924; c=relaxed/simple;
	bh=u6MDQoAI3OcjAUep1bSgN0X3nyl1DNC2AkqfYQQ+84c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=avn7DHEDF6fPfnW6c79A9Zu0G6oJxwbsD4gz299PV/1OoXvssUvZIJ+xQpKTtM39Q/vGpp76NXlEebt4YRUR8zh7vK/wXpdeLtKk7DrI1Ytzp0BJ6kjvHCu9lFgO7fJM86QbGPzLKkx3Kgx8jbM8BRqNIJ0MI3PLCOpxl/Qlvg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=BvGm37ck; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="BvGm37ck"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 27408BD9A5
	for <linux-sound@vger.kernel.org>; Sat,  3 Jan 2026 13:48:38 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id C333FBDBB7
	for <linux-sound@vger.kernel.org>; Sat,  3 Jan 2026 13:48:36 +0200 (EET)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 38C45202346
	for <linux-sound@vger.kernel.org>; Sat,  3 Jan 2026 13:48:36 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1767440916;
	bh=nAGFZ71qFrgXSXp0Un6/R8Egi/03bGeTbsBT1rckaNg=;
	h=Received:From:Subject:To;
	b=BvGm37ckOHUU+7pcF/S41RZQ6G6FKrNIwQQvTOtopMvWcOu6L8JXtdUkh3DbDFwAp
	 g2mHXyG7KXgJohqRDjO3lpS+CHtwxjZrU1K65S3sysFz2UT9zQGYS05UbSAFHrkIys
	 lPlpt+X6vhSW9LNH/Y1VaNxsyPD372Ugf2yKwSDxOh/vGiGlUFZtz0moNX/WBl/5gO
	 hRHknXKLoUd1wWjnjNediA8biF7b8Ey1iH0Cb3iAJ4k59WEAi4y9LFQfvz8KyfpITT
	 OqRaQt1wztvaQj3NP0AY7TeElAZfrjGJwX5VzUYJHENR+ESCSKEsML58uuRfAGxV+H
	 tVaKeKopJ+IAg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.181) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f181.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-37d13ddaa6aso87353451fa.1
        for <linux-sound@vger.kernel.org>;
 Sat, 03 Jan 2026 03:48:36 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXDTor/WRSS/Gp6rsyV6mAO0HlchjubSN7J1FjITPfU7d9dY6xh0FHnfrdWVGrRwzvWe7X7/myhekWA2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz9qIMTm0+hSYYoPkYrnyFAzNC2Unbgn4qmMlJV4mbNSGvzXnv
	85OeHZbmqWyNY0lUqpwjTwLBv2yMrff+ClKdU6pDbszBEX7V2oKzSWUYFmtMG5gOkAjTLk5ICCq
	N57CwD2/ECSO/WhmOmCqyc5W32Vku1wI=
X-Google-Smtp-Source: 
 AGHT+IFzsz5YymitlLHXR7GbCCN1RIIogj7dM527w/fEb7W8uo9H03WAndEldUKsfcQ4NTZVG2Ik5R/Rz0zt3QbMUJ4=
X-Received: by 2002:a05:651c:507:b0:37a:4714:ff39 with SMTP id
 38308e7fff4ca-3812161d8e7mr136499221fa.23.1767440915567; Sat, 03 Jan 2026
 03:48:35 -0800 (PST)
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
 <CAGwozwH6A-NNCioS7J_EiTbxv2Y0B3YFXuyeWU_RMsW2Z+YsRA@mail.gmail.com>
 <0b18b97f-a5dc-4f24-9716-e1eb26ac85af@linux.dev>
In-Reply-To: <0b18b97f-a5dc-4f24-9716-e1eb26ac85af@linux.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 3 Jan 2026 13:48:24 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFQKoQgo_Q=qdr-FTD+uoVWA8AtHyDmKwTOV4ZU6+F3SQ@mail.gmail.com>
X-Gm-Features: AQt7F2pSDDXTzt8TqT6mvVKS6KH9ypQEPhJg9utIwjwYgno_qRxD1lKa81TaoBk
Message-ID: 
 <CAGwozwFQKoQgo_Q=qdr-FTD+uoVWA8AtHyDmKwTOV4ZU6+F3SQ@mail.gmail.com>
Subject: Re: [BUG] hda/tas2781: ASUS ROG Xbox Ally X audio issues with default
 firmware
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: Baojun Xu <baojun.xu@ti.com>, Shenghao Ding <shenghao-ding@ti.com>,
 linux-sound@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176744091640.421434.1981531776682921215@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sat, 3 Jan 2026 at 02:31, Matthew Schwartz
<matthew.schwartz@linux.dev> wrote:
>
> On 1/2/26 3:13 PM, Antheas Kapenekakis wrote:
> > On Fri, 2 Jan 2026 at 21:17, Matthew Schwartz
> > <matthew.schwartz@linux.dev> wrote:
> >>
> >> On 1/2/26 9:12 AM, Antheas Kapenekakis wrote:
> >>> On Tue, 30 Dec 2025 at 22:44, Matthew Schwartz
> >>> <matthew.schwartz@linux.dev> wrote:
> >>>>
> >>>>
> >>>>
> >>>>> On Dec 8, 2025, at 8:00=E2=80=AFPM, Matthew Schwartz <matthew.schwa=
rtz@linux.dev> wrote:
> >>>>>
> >>>> - snip
> >>>>> 2.52.0
> >>>>
> >>>> After reading the TI E2E forums, it seems these calibration tuning c=
onfigurations are only meant to be used during a calibration process.
> >>>
> >>> A source would be good here, a link or two
> >>
> >> Sorry about that, here is where I read about the differences between t=
he two configs:
> >> https://e2e.ti.com/support/audio-group/audio/f/audio-forum/1558310/tas=
2563-what-is-the-difference-between-tuning-and-calibration-configuration-in=
-exported-smartamp-binary
> >
> > This link describes "calibration" configurations that are used in the
> > calibration procedure. It is not clear to me that it refers to the
> > calibration parameters exported by UEFI or in the configuration itself
> > to be used alongside a configuration. I would tend toward this being
> > irrelevant.
> >
> >> It's about a different amplifier model, but I assume the same applies =
to tas2781 given the naming structure is the same for the configurations.
> >>
> >>>
> >>>> Instead, something else I found that works is not overriding the fir=
mware file calibration data with the UEFI calibration data:
> >
> > I misunderstood what you meant by this before. I thought you meant
> > that the firmware overrode the UEFI data, not the other way around.
> > Surely, using the dummy data in the firmware file is better than using
> > incorrect data from UEFI. However, the manufacturer calibrated data
> > from the factory floor for each specific unit is in UEFI, so that is
> > what should be used.
> >
> >>> I did not look into the source code, do you have any reference in the
> >>> ACPI TAS code that r0_buf is prefilled with UEFI data?
> >>
> >> From what I understand, I think the current flow goes like this:
> >>
> >> 1. During driver init, tas2781_save_calibration() reads UEFI calibrati=
on data into the cali_data memory buffer and sets is_user_space_calidata=3D=
true: https://github.com/torvalds/linux/blob/master/sound/hda/codecs/side-c=
odecs/tas2781_hda.c#L162-L173
> >>
> >> 2. When switching to a DSP config, tasdevice_select_tuningprm_cfg() ca=
lls tasdevice_load_data() which writes the firmware configuration, includin=
g any calibration values embedded in that config: https://github.com/torval=
ds/linux/blob/master/sound/soc/codecs/tas2781-fmwlib.c#L2510
> >>
> >> 3. Immediately after, tasdev_load_calibrated_data() writes the UEFI ca=
libration data from step 1, overwriting the values just set in step 2: http=
s://github.com/torvalds/linux/blob/9b043680446067358913edc2e9dd71bf8ffae208=
/sound/soc/codecs/tas2781-fmwlib.c#L2392-L2428 + https://github.com/torvald=
s/linux/blob/master/sound/soc/codecs/tas2781-fmwlib.c#L2519
> >>
> >> I confirmed this this by inserting some debug logs around tasdev_load_=
calibrated_data:
> >
> > I went through the code. It loads the UEFI data, sets
> > is_user_space_calidata=3D1, then if the data is available it loads it.
> > This is correct.
> >
> > To me this seems like the calibration data for amp 1 is written to
> > both amp 1 and amp 2, and for your firmware this breaks amp2.
>
> If this were the case, shouldn't my debug logs have the same data being w=
ritten to dev 0 and dev 1?
>
> [    6.367380] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_cal=
ibrated_data: dev 0 writing calibration: r0_reg=3D0x000ce4 data=3D3c5f7222
> [    6.371718] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_cal=
ibrated_data: dev 1 writing calibration: r0_reg=3D0x000ce4 data=3D3c90e72d
>
> >
> > In tasdev_load_calibrated_data(), an i index is provided, but
> > cali_data is nested under priv. So only one calibration set is
> > supported. This means that amp 2 gets amp 1 calibrations.
> >
> > Perhaps there is a "SmartAmpCalibrationData2" that should be read
> > instead for amp 2 instead, can you dump the EFI variables and check?
>
> (128)(deck@steamdeck ~)$ ls /sys/firmware/efi/efivars/
> AmdAcpiVar-79941ecd-ed36-49d0-8124-e4c31ac75cd4               BugCheckPro=
gress-ba57e015-65b3-4c3c-b274-659192f699e3             MemoryOverwriteReque=
stControl-e20939be-32d4-41be-a150-897f85d49829
> <snip>
> There's only one EFI var that seems to be for calibration data:
>
> xxd /sys/firmware/efi/efivars/CALI_DATA-1f52d2a1-bb3a-457d-bc09-43a3f4310=
a92:
>
> 00000000: 0700 0000 dd0a 0000 0300 0000 7e4a 9d68  ............~J.h
> 00000010: 0000 0000 2272 5f3c d515 f610 ac9a 9b2e  ...."r_<........
> 00000020: 5d91 9600 0000 8025 0100 0000 2de7 903c  ]......%....-..<
> 00000030: 283c e810 ffc8 c12e fcce 9600 0000 8025  (<.............%
> 00000040: 8000 0000 0000 1964 0000 1974 0000 197c  .......d...t...|
> 00000050: 0000 1560 0000 1a70 eb7f b12b            ...`...p...+

I reviewed the loader for CALI_DATA, it supports multiple device
calibration data and indexes it currently. In addition, it has two
versions with CRC checks that pass, so one of those versions loads the
data correctly.

So everything looks technically correct

Here is your data from the first amp reordered:
       r0_reg=3D0x000ce4 408f5c29
       r0_reg=3D0x000ce4 3c5f7222
   invr0_reg=3D0x000cf4 0fdc788c
   invr0_reg=3D0x000cf4 10f615d5
r0_low_reg=3D0x000cfc 0f7e9100
r0_low_reg=3D0x000cfc 2e9b9aac
  pow_reg=3D0x000ae0 009b5281
  pow_reg=3D0x000ae0 0096915d
 tlimit_reg=3D0x000d70 25800000
 tlimit_reg=3D0x000d70 25800000

And the second amp:
    r0_reg=3D0x000ce4 40cccccd
    r0_reg=3D0x000ce4 3c90e72d
 invr0_reg=3D0x000cf4 0fcd6e9e
 invr0_reg=3D0x000cf4 10e83c28
r0_low_reg=3D0x000cfc 0f8d4fdf
r0_low_reg=3D0x000cfc 2ec1c8ff
   pow_reg=3D0x000ae0 009b9c58
   pow_reg=3D0x000ae0 0096cefc
tlimit_reg=3D0x000d70 25800000
tlimit_reg=3D0x000d70 25800000

There is a large deviation in r0, invr0, and r0_low in both of them.
Unfortunately, I do not have my Xbox Ally non-X to check to see if
it's incorrect. This hints to me that the registers get incorrect data
loaded, so there might be a mistake in the UEFI parser.

Here is a breakdown of your efivar
0700 0000 # This is not supposed to be here / Might have been thrown
out by kernel if v2 loads

dd0a 0000 # 2781, is v2 protocol
0300 0000 # Data-Group-Sum / How many nodes
7e4a 9d68 # Timestamp

# First amplifier data
0000 0000
2272 5f3c # r0
d515 f610 # invr0
ac9a 9b2e # r0_low
5d91 9600 # pow
0000 8025 # tlimit

# Second amplifier data
0100 0000
2de7 903c # r0
283c e810 # invr0
ffc8 c12e # r0_low
fcce 9600 # pow
0000 8025 # tlimit

8000 0000 # Calibration data / Derivation logic in TASDEVICE_REG
0000 1964 # r0 addr
0000 1974 # invr0 addr
0000 197c # r0_low addr
0000 1560 # pow addr
0000 1a70 # tlimit addr

eb7f b12b # CRC32

Specifically for the 0x80, cali_reg addresses get stored into
r0/invr0... iff p->dspbin_typ =3D=3D TASDEV_BASIC.

I suspect the problem here is that the UEFI override for the first
three values tries to change different registers and not r0, invr0 and
r0_low. The pow, tlimit look correct.

But, due to p->dspbin_typ !=3D TASDEV_BASIC, cali_reg ends up being
thrown out and the UEFI values end up corrupting the r0, invr0 and
r0_low default addresses. and not 00, 19, 64/74/7c

Antheas

> >
> > In that case, a minor refactor to move cali_data and
> > is_user_space_calidata from priv to priv->tasdevice[i] and then use
> > the proper efi var would fix this.
> >
> > Antheas
> >
> >> [    3.908963] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tas2781_appl=
y_calib: dspbin_typ=3D2, ndev=3D2, Setting is_user_space_calidata=3Dtrue
> >> <snip>
> >>
> >> where it loads the UEFI calibration over top of the firmware calibrati=
on.
> >>
> >>>
> >>> It could be that there is a specific priority, where UEFI data is
> >>> supposed to be loaded after the firmware code, replacing the
> >>> calibration data from the file, or that is what is done in Windows.
> >>> But here it is done the other way. In that case, it might be more
> >>> appropriate to set a dummy var such as bool uefi_calib that becomes 1
> >>> when loading calibration from UEFI, and skip loading from the fw file
> >>> if available.
> >>>
> >>> But links, etc. Here, this would affect all TAS devices too, so it is
> >>> more major.
> >>
> >> Yes, was really hoping to get TI's feedback before potentially sending=
 it out, as it would be a major change and the documentation on this is sca=
rce. I could also be misunderstanding the calibration data load flow, but t=
his is just from poking at this issue from every angle I can think of.
> >>
> >> Happy new year,
> >> Matt
> >>
> >>>
> >>> Happy new year,
> >>> Antheas
> >>>
> >>>> diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/ta=
s2781-fmwlib.c
> >>>> index 78fd0a5dc6f2..1e768e6187da 100644
> >>>> --- a/sound/soc/codecs/tas2781-fmwlib.c
> >>>> +++ b/sound/soc/codecs/tas2781-fmwlib.c
> >>>> @@ -2377,6 +2377,7 @@ static void tasdev_load_calibrated_data(struct=
 tasdevice_priv *priv, int i)
> >>>>         unsigned char *data =3D cali_data->data;
> >>>>         struct tasdevice_calibration *cal;
> >>>>         int k =3D i * (cali_data->cali_dat_sz_per_dev + 1);
> >>>> +       unsigned char r0_buf[4];
> >>>>         int rc;
> >>>>
> >>>>         /* Load the calibrated data from cal bin file */
> >>>> @@ -2389,6 +2390,20 @@ static void tasdev_load_calibrated_data(struc=
t tasdevice_priv *priv, int i)
> >>>>         }
> >>>>         if (!priv->is_user_space_calidata)
> >>>>                 return;
> >>>> +
> >>>> +       /*
> >>>> +        * Check if the DSP config already set the calibration regis=
ters.
> >>>> +        * Some tuning configs contain their own calibration data wh=
ich should
> >>>> +        * not be overwritten by user space calibration data.
> >>>> +        */
> >>>> +       rc =3D tasdevice_dev_bulk_read(priv, i, p->r0_reg, r0_buf, 4=
);
> >>>> +       if (rc >=3D 0 && (r0_buf[0] | r0_buf[1] | r0_buf[2] | r0_buf=
[3])) {
> >>>> +               dev_dbg(priv->dev,
> >>>> +                       "%s: dev %d r0_reg already set by config, sk=
ipping calibration\n",
> >>>> +                       __func__, i);
> >>>> +               return;
> >>>> +       }
> >>>> +
> >>>>         /* load calibrated data from user space */
> >>>>         if (data[k] !=3D i) {
> >>>>                 dev_err(priv->dev, "%s: no cal-data for dev %d from =
usr-spc\n",
> >>>>
> >>>> Is this more suitable to be upstreamed?
> >>>>
> >>>> Thanks,
> >>>> Matt
> >>>> <snip>
> >>>>
> >>>
> >>
> >>
> >
>
>

