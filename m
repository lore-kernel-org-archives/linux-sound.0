Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9263DF008
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 08:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779870836; cv=none; b=CEObxmE0c/DgexCuNullzz9qtZ7/vWLzyythEvGHFkw2NkEkfueGQTFAWUrRg/Xhr16u8PdQjQLCveE3ae2xWK0NhWm4DTYWWUjtVbvuZijZ4xqteJziK0c9cctLuM+LSO09+wyKlmqoHDfji0NiwtommUWmU7OD8rikgKaxEjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779870836; c=relaxed/simple;
	bh=r7LHeyitT9uA5cFI/1Euud4qPTj4x7fs0D59pjrtCd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WOLJ1nVH9vMxZOlV8ql4eS2F//YHybzeaDJE7fsD7YXive25oTOQ8vN1VFfrLnBg9b+nax3fYrXFnI/NGv4xhTyit9peq42DsTWyaEg6PYfRxSWejp1qkwyX1uBLv5fRjVLYpzlR/1oEp5I9a/dBunnNA91ebJO0HNMTl7UpmL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4cv+DY8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4cv+DY8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB69F1F01563
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 08:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779870832;
	bh=aGfhix3sAC6HMvEiMkdh+KRyptLLFm29xcvjP5yNL60=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=E4cv+DY8au1ynXak65rTx7N2EL4fZTamFiP2QLaSDT7OryCk2Wr7WKWL/K6yKTdmZ
	 Qq176f+Ca8i50lAfi9rvmFvXvfgk0OrOZFW1XtAYQ++hNUEhlTKhQbtdNYAqn264/S
	 /Ob3B75SXREcyZyw/0U7YH5Wv9i8j+tbfyOFCNyDOljbKR2yaFX//OwDexQouVWPw1
	 t0V4aTJpWRIRH4dRCehK/4ioH9IcIttXTeweZJH2A8jgjgdV0OY0+d57BasZ13o+is
	 LCh022LOu/VW1rexAPL/uFPZfB+M/6xUOTPps88xiYcv6LDwuDNgMmDX6Y6YTUOEXu
	 sSIFDWlZOErDg==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-687d82dd690so5895413a12.2
        for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 01:33:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ944nLXKsBGXGub58XfFNIVoOh8FaScacvoi+Ir5X/yFN9hev8Ue87vQacify9AughvwryoGhrdEz2LnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1S2GZmiLKmR7/RwgL+6Hd8k6Vgt+HlEAO3aKxAXMkKiC3/HX+
	qdryZQLRjT+2+wmzvyyI6mG1v4icd6l62OkLbTCUguKNTo6gKLcp5wNPs8FzBdKBCSoM+oeICv5
	AnM1aME7h67/bFoCv9/HTxPPSuthMJ+s=
X-Received: by 2002:a17:906:8474:b0:bda:8e57:5639 with SMTP id
 a640c23a62f3a-bdd25337f07mr991870566b.20.1779870830272; Wed, 27 May 2026
 01:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526111940.2347847-1-chenhuacai@loongson.cn>
 <87pl2ixmxj.wl-tiwai@suse.de> <87cxyixgui.wl-tiwai@suse.de>
In-Reply-To: <87cxyixgui.wl-tiwai@suse.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 27 May 2026 16:34:11 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5szeU2Sxe5Yx67k7H8WSgq+e=+w715WtOP1wz=Oj4tuA@mail.gmail.com>
X-Gm-Features: AVHnY4Ig9MazqpXAwlGtBrHTM8t1Ay3xgbEpxFVEv8Ku74ukeFIxrb-aI-5yW9s
Message-ID: <CAAhV-H5szeU2Sxe5Yx67k7H8WSgq+e=+w715WtOP1wz=Oj4tuA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/hdmi: Use 'AC_PINSENSE_ELDV' to detect pinsense
 for Loongson
To: Takashi Iwai <tiwai@suse.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Takashi Iwai <tiwai@suse.com>, 
	Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org, 
	Baoqi Zhang <zhangbaoqi@loongson.cn>, Haowei Zheng <zhenghaowei@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Takashi,

On Wed, May 27, 2026 at 12:42=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote=
:
>
> On Tue, 26 May 2026 16:31:04 +0200,
> Takashi Iwai wrote:
> >
> > On Tue, 26 May 2026 13:19:40 +0200,
> > Huacai Chen wrote:
> > >
> > > Due to a hardware defect, for Loongson PCI HDMI devices with a revers=
ion
> > > ID of 2, the pin sense status must be determined via the ELD.
> > >
> > > Add a codec flag, eld_jack_detect, to indicate this case, and do spec=
ial
> > > handlings in read_pin_sense().
> > >
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Baoqi Zhang <zhangbaoqi@loongson.cn>
> > > Signed-off-by: Haowei Zheng <zhenghaowei@loongson.cn>
> > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > ---
> > >  include/sound/hda_codec.h    | 1 +
> > >  sound/hda/codecs/hdmi/hdmi.c | 8 +++++++-
> > >  sound/hda/common/jack.c      | 4 ++++
> > >  3 files changed, 12 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
> > > index 24581080e26a..1a1fe7a904c3 100644
> > > --- a/include/sound/hda_codec.h
> > > +++ b/include/sound/hda_codec.h
> > > @@ -259,6 +259,7 @@ struct hda_codec {
> > >     unsigned int forced_resume:1; /* forced resume for jack */
> > >     unsigned int no_stream_clean_at_suspend:1; /* do not clean stream=
s at suspend */
> > >     unsigned int ctl_dev_id:1; /* old control element id build behavi=
our */
> > > +   unsigned int eld_jack_detect:1; /* Machine jack-detection by ELD =
*/
> > >
> > >     unsigned long power_on_acct;
> > >     unsigned long power_off_acct;
> > > diff --git a/sound/hda/codecs/hdmi/hdmi.c b/sound/hda/codecs/hdmi/hdm=
i.c
> > > index f20d1715da62..423cd9f683c6 100644
> > > --- a/sound/hda/codecs/hdmi/hdmi.c
> > > +++ b/sound/hda/codecs/hdmi/hdmi.c
> > > @@ -2285,6 +2285,7 @@ EXPORT_SYMBOL_NS_GPL(snd_hda_hdmi_acomp_init, "=
SND_HDA_CODEC_HDMI");
> > >  enum {
> > >     MODEL_GENERIC,
> > >     MODEL_GF,
> > > +   MODEL_LOONGSON,
> > >  };
> > >
> > >  static int generichdmi_probe(struct hda_codec *codec,
> > > @@ -2302,6 +2303,11 @@ static int generichdmi_probe(struct hda_codec =
*codec,
> > >     if (id->driver_data =3D=3D MODEL_GF)
> > >             codec->no_sticky_stream =3D 1;
> > >
> > > +   if (id->driver_data =3D=3D MODEL_LOONGSON) {
> > > +           if (codec->bus && codec->bus->pci->revision =3D=3D 0x2)
> > > +                   codec->eld_jack_detect =3D 1; /* Jack-detection b=
y ELD */
> > > +   }
> > > +
> > >     return 0;
> > >  }
> > >
> > > @@ -2319,7 +2325,7 @@ static const struct hda_codec_ops generichdmi_c=
odec_ops =3D {
> > >  /*
> > >   */
> > >  static const struct hda_device_id snd_hda_id_generichdmi[] =3D {
> > > -   HDA_CODEC_ID_MODEL(0x00147a47, "Loongson HDMI",         MODEL_GEN=
ERIC),
> > > +   HDA_CODEC_ID_MODEL(0x00147a47, "Loongson HDMI",         MODEL_LOO=
NGSON),
> > >     HDA_CODEC_ID_MODEL(0x10951390, "SiI1390 HDMI",          MODEL_GEN=
ERIC),
> > >     HDA_CODEC_ID_MODEL(0x10951392, "SiI1392 HDMI",          MODEL_GEN=
ERIC),
> > >     HDA_CODEC_ID_MODEL(0x11069f84, "VX11 HDMI/DP",          MODEL_GEN=
ERIC),
> > > diff --git a/sound/hda/common/jack.c b/sound/hda/common/jack.c
> > > index 98ba1c4d5ba4..1f0ebf9cd151 100644
> > > --- a/sound/hda/common/jack.c
> > > +++ b/sound/hda/common/jack.c
> > > @@ -58,6 +58,10 @@ static u32 read_pin_sense(struct hda_codec *codec,=
 hda_nid_t nid, int dev_id)
> > >                               AC_VERB_GET_PIN_SENSE, dev_id);
> > >     if (codec->inv_jack_detect)
> > >             val ^=3D AC_PINSENSE_PRESENCE;
> > > +   if (codec->eld_jack_detect) {
> > > +           val &=3D ~AC_PINSENSE_PRESENCE;
> > > +           val |=3D !!(val & AC_PINSENSE_ELDV) << 31;
> > > +   }
> >
> > IMO it's worth for a comment in the above; basically it's faking the
> > AC_PINSENSE_PRESENCE from AC_PINSENSE_ELDV bit, which explains the
> > magic shift number.
>
> ... or an idiomatic form would be even simpler & safer:
>
>                 if (val & AC_PINSENSE_ELDV)
>                         val |=3D AC_PINSENSE_PRESENCE;
>                 else
>                         val &=3D ~AC_PINSENSE_PRESENCE;
>
Yes, this is better.

Huacai

>
> thanks,
>
> Takashi
