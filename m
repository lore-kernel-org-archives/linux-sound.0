Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C4B23BD1D
	for <linux-sound@vger.kernel.org>; Sat,  4 Apr 2026 15:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775317584; cv=none; b=kFOfBrh0wTS+wSfv4q05f49xurnS5d2sKk1z93M0vTTDdX7LVWxCmloH4Tnx89V3HbQUmUTxzcpF5v28+xdXFnuG72jMk9bt37SRfknpFAImwtlwXSad7Gfh64C7tsa8Ny9n8yWd7aGQ2rgkPquJQZBn+R7+krht0hoZx6mHFaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775317584; c=relaxed/simple;
	bh=WMvIAA85cXZe4Z2KZqIpuGHHv1h5Hoai+iw9a3FWOeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MPyZGthAJ8295AA5Ru5EBAtmEdUwKtiBPeaPS7iZnLG6xAShgO3FbY+D4LnN5s/FTFt1uD294PzDp95na2HBXQ0x/MoM8hwF0u2x2WLq5JqLhfr2gVCHm3cbgMGulXpw9tf/NM6keQsbOwq1EyrJfVw9lA+rDnAyb6cdQlgtkqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nevaberry.com; spf=pass smtp.mailfrom=fe-bounces.nevaberry.com; dkim=pass (2048-bit key) header.d=nevaberry.com header.i=@nevaberry.com header.b=WWJdm0bu; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nevaberry.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.nevaberry.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nevaberry.com header.i=@nevaberry.com header.b="WWJdm0bu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nevaberry.com;
 h=Content-Transfer-Encoding: Content-Type: Cc: To: Subject: Message-ID:
 Date: From: In-Reply-To: References: MIME-Version; q=dns/txt;
 s=fe-e0344519bf; t=1775317581;
 bh=v5Cn/WGra9Rxb3+X0lyvDtmYEY9t9RAo6oLGh7/5ntA=;
 b=WWJdm0buYGGVIBK8LoSCb6Vgr208b9e4cTUaukQMi2CYYdrupkrkawXbZ0CAAnd8tpxIPR7sX
 DqRiml6AhMezARBKzuTM3xGGFUSRn0ywhr32JfFPhaEDeZZgly8wdE8YAUdNMS7hHc5dugFfk/V
 t79a+H4Lp0BKaqOfdBn6S4Fj+rWwc4un5deQvmdLSVi7YCcdz3/dRviFiY4CMt0xI0Oxmt41Cnc
 gvk0+o6/Kvqe9GnRnytSIb1xmNEfkgT7HZwpbSAU4ZAYYk0LWY2hD4B8pXK/n4XWygC87yqYlox
 vv1tpOvME976V0DuCjvceltVBcLSxgSQ1c7fcaTDFY6w==
X-Forward-Email-ID: 69d1324c4d2e704dd29ec324
X-Forward-Email-Sender: rfc822; antti@nevaberry.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.6.68
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b299b3c739so29835ad.3
        for <linux-sound@vger.kernel.org>; Sat, 04 Apr 2026 08:46:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXy+uOr8aXWsdl7PiRjFUPXAx5Z7JLDxJ/InwH3sFK3dntir4DTujEnXZLEBSucSosiFwV6H17PgTTBag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc86UTLfK7vWBaEFh9IRiJavWyJdzYqFUaVhtivzo80CS1FqQA
	uMlIGmSVKCdovWAPZNGsEuDF3NXSd0GgdFQvcPEiGC12Th4aK6EUDB/xpPQZUWwMFagW6Y3sY00
	bvyCpdLLyCMNRbfH+g5KKnWqtRi2lTG0=
X-Received: by 2002:a17:903:b8d:b0:2ae:fc60:2650 with SMTP id
 d9443c01a7336-2b2817b24c3mr68090935ad.39.1775317579581; Sat, 04 Apr 2026
 08:46:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404144743.46466-1-antti@nevaberry.com> <87zf3ihhu0.wl-tiwai@suse.de>
In-Reply-To: <87zf3ihhu0.wl-tiwai@suse.de>
From: =?UTF-8?Q?Antti_Jalom=C3=A4ki?= <antti@nevaberry.com>
Date: Sat, 4 Apr 2026 18:46:08 +0300
X-Gmail-Original-Message-ID: <CAK=qmGDEk46xMeA22SScAA0U86XHEWOTt7nq4W6bE1fX+nAU5Q@mail.gmail.com>
X-Gm-Features: AQROBzCIXErvsSIGCzkGYnUKaFJkufO9bjsYF8R4TopI3PJvL3CYpy3oT-VttO4
Message-ID: <CAK=qmGDEk46xMeA22SScAA0U86XHEWOTt7nq4W6bE1fX+nAU5Q@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: intel-dsp-config: Force legacy HDA on Lenovo
 ThinkPad X1 Yoga Gen 5
To: Takashi Iwai <tiwai@suse.de>
Cc: =?UTF-8?Q?Antti_Jalom=C3=A4ki?= <antti@nevaberry.com>, 
	linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Thank you for the review. I re-tested without the workaround on kernel
6.19.10 (Fedora 43) with the latest SOF firmware available
(alsa-sof-firmware 2025.12.2, firmware
version 2:2:0-57864, ABI 3:22:1).

The SOF driver detects 4 DMICs in NHLT tables and attempts to load,
but fails with a CSE IPC timeout. Full dmesg:

sof-audio-pci-intel-cnl 0000:00:1f.3: Digital mics found on Skylake+
platform, using SOF driver
sof-audio-pci-intel-cnl 0000:00:1f.3: DSP detected with PCI
class/subclass/prog-if 0x040380
sof-audio-pci-intel-cnl 0000:00:1f.3: hda codecs found, mask 5
sof-audio-pci-intel-cnl 0000:00:1f.3: using HDA machine driver
skl_hda_dsp_generic now
sof-audio-pci-intel-cnl 0000:00:1f.3: DMICs detected in NHLT tables: 4
sof-audio-pci-intel-cnl 0000:00:1f.3:  Firmware file:     intel/sof/sof-cml=
.ri
sof-audio-pci-intel-cnl 0000:00:1f.3:  Topology file:
intel/sof-tplg/sof-hda-generic-4ch.tplg
sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware info: version 2:2:0-57864
sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:=
1
sof-audio-pci-intel-cnl 0000:00:1f.3: cl_dsp_init: timeout with
rom_status_reg (0x80000) read
sof-audio-pci-intel-cnl 0000:00:1f.3: Boot iteration failed: 3/3
sof-audio-pci-intel-cnl 0000:00:1f.3: 0x06000021: module: ROM, state:
CSE_IPC_RESET_PHASE_1, waiting for: CSE_CSR, running
sof-audio-pci-intel-cnl 0000:00:1f.3: extended rom status:  0x6000021
0x0 0x0 0x0 0x0 0x0 0x1811102 0x0
sof-audio-pci-intel-cnl 0000:00:1f.3: error: dsp init failed after 3
attempts with err: -110
sof-audio-pci-intel-cnl 0000:00:1f.3: error: hda_dsp_core_reset_enter:
timeout on HDA_DSP_REG_ADSPCS read
sof-audio-pci-intel-cnl 0000:00:1f.3: error: dsp core reset failed: core_ma=
sk f
sof-audio-pci-intel-cnl 0000:00:1f.3: error: sof_probe_work failed err: -11=
0

The DSP gets stuck at CSE_IPC_RESET_PHASE_1, waiting for CSE_CSR. This
appears to be a communication failure between the SOF driver and the
Intel CSE, not a firmware
version issue.

With snd_intel_dspcfg.dsp_driver=3D1, the legacy HDA driver works
correctly (ALC285 codec, PCI SSID 17aa:22be).

System info:
- Lenovo ThinkPad X1 Yoga Gen 5 (20UBCTO1WW)
- BIOS: N2WET51W (1.41)
- PCI: Intel Comet Lake PCH-LP cAVS [8086:02c8]
- Kernel: 6.19.10-200.fc43.x86_64
- SOF firmware: alsa-sof-firmware-2025.12.2

I'm happy to adjust the patch approach if you suggest a better way to
handle this. Would using FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE with a
different fallback be preferred
over .flags =3D 0?

Best regards,
Antti Jalom=C3=A4ki

On Sat, Apr 4, 2026 at 6:21=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sat, 04 Apr 2026 16:47:43 +0200,
> Antti Jalom=C3=A4ki wrote:
> >
> > The SOF driver fails to initialize on the Lenovo ThinkPad X1 Yoga Gen 5
> > with Intel Comet Lake PCH-LP cAVS [8086:02c8]. Add a DMI quirk to force
> > legacy HDA driver selection for this device.
> >
> > Link: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1120554
> > Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2455066
> > Signed-off-by: Antti Jalom=C3=A4ki <antti@nevaberry.com>
>
> Have you tested with the latest kernel together with the latest
> SOF-firmware?  Just to be sure, as your reports above didn't indicate
> it, and ....
>
> > ---
> >  sound/hda/core/intel-dsp-config.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/sound/hda/core/intel-dsp-config.c b/sound/hda/core/intel-d=
sp-config.c
> > index f0a44fd11..179fe4d59 100644
> > --- a/sound/hda/core/intel-dsp-config.c
> > +++ b/sound/hda/core/intel-dsp-config.c
> > @@ -269,6 +269,21 @@ static const struct config_entry config_table[] =
=3D {
> >               .device =3D PCI_DEVICE_ID_INTEL_HDA_CML_LP,
> >               .codec_hid =3D  &essx_83x6,
> >       },
> > +     {
> > +             .flags =3D 0,
>
> ... there is no other quirk entries setting like this.  It already
> looks very special, and such a case is often due to other problems.
>
>
> thanks,
>
> Takashi
>
> > +             .device =3D PCI_DEVICE_ID_INTEL_HDA_CML_LP,
> > +             .dmi_table =3D (const struct dmi_system_id []) {
> > +                     {
> > +                             .ident =3D "Lenovo ThinkPad X1 Yoga Gen 5=
",
> > +                             .matches =3D {
> > +                                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO=
"),
> > +                                     DMI_MATCH(DMI_PRODUCT_FAMILY,
> > +                                               "ThinkPad X1 Yoga Gen 5=
"),
> > +                             },
> > +                     },
> > +                     {}
> > +             }
> > +     },
> >       {
> >               .flags =3D FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> >               .device =3D PCI_DEVICE_ID_INTEL_HDA_CML_LP,
> >
> > base-commit: 9f2a23bd5d30dc0968e56a2b6e5edb58aff1bc6d
> > --
> > 2.53.0
> >
