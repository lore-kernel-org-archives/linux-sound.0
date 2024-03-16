Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C1D8C07
	for <linux-sound@vger.kernel.org>; Sat, 16 Mar 2024 17:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710609058; cv=none; b=qFC4bIsuicZjCFUiXwdr+r8hwDsVg3+kkqUKjl8rIYfPfhw6PRIOEbSRpHDIvYKgpP29vJkwN34pVpCc1J+CYRdCHFksvQfa3LDlxVxPGPwRpa5hoDUEmhxmWZmFWAz5Pp24zzGMG/UuTXBlcA3ZNZwVeDLEBezgnFxu8X1VPws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710609058; c=relaxed/simple;
	bh=2C4TqCj9uagcJTH4KZSOP4wzXbm4UKJwzHzBVc5p5O0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SvNcMXLYf1wZfdcQVyVsaUPvAbfq/taY7ASCEIlXtj0P+joEdhPS9j4ZxdxtKz80vBsdPSx2baJ2fHzKmdQwKxJT1dJLWpJ1n+XsKyTMbaqTH6m0oGk7AQ710mautTZ6EfQUFJvxKULPCUPe/W/m9RJuyvgFOM7dRmucH/QMGDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZ7cn4aJ; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZ7cn4aJ"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-a450bedffdfso365268266b.3
        for <linux-sound@vger.kernel.org>; Sat, 16 Mar 2024 10:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710609055; x=1711213855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcGlz7VjH78Yh1a1KHLRiyW+MZRTE0hisB7kMvXRdBE=;
        b=AZ7cn4aJP1UrcipbTaFu9Y0PYrQUke07QF7Os88DpvU+tZ4+GcY76m7T8Udw170r2M
         L0z2gTVZx2YDWnOgJjlF6GakBHMzQJ1JljBckURj5y/j2tvW2PAO69vFDYZS1FVqAlU6
         MDeEEw/F47RNHcs80JcVc8pJLerwaEwKoR0Gy7IIjVL7DZllrShJ+kUuqlPMg1r2WNSt
         LdWWTz9GoqP5lriG2kqMBilfGiB3jDoCTc4QXpjQsjF10kwUgqxp8CA5wt1Nv2ZlOadZ
         YoxWmS5L1lUrIv70E9xCOsFtTUvlVfEPabY4C8SuDk0u13t2SleQMVJCshr5s+j9jCQI
         C+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710609055; x=1711213855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WcGlz7VjH78Yh1a1KHLRiyW+MZRTE0hisB7kMvXRdBE=;
        b=hLJdSXqs0E2878vRHrlKdlYVeYpnZirRkEhWNAu8ZAlurQdOwQEpw3aK/e9H9SkSvP
         yAZrMXe7rBoQovf6xP85CqT7DpeKvHnL8befRgwBNN63LM3B1p2Ewxyfm9YaRmOKoGEW
         VP5f4HjaDVG44xmO/65EHYZRIFYjQi13nTM9R9ZimjkNmMq7e1HXx5rDvisJMw9miqn6
         8pimiSBQIQqqzHBs6dw98CHteM7W/45E32BO+RHVaHGM+L+Of1UttvbWsSdtLfsCYZ/T
         CnDjvJwNwaO3DsSluuKlzUqvmt8BfQRaCCfwBKzR5erOC+R3KgbUDGIYQnpbqaLxkuQS
         GPUg==
X-Gm-Message-State: AOJu0YwIGFy+Yen8TITdPCMFdADh5R7JN3k3rFxAJC2SldMFRbTBMK+Q
	S+rMwY7HRDW8imUqclc01Z2Ji4d9ubIfWy6E9gnajSECT1Jk2Bopu1c45zkDWMC8OtFLWIIfemq
	xSF9JDSSzpNGTS37AGCNj5lFMGdPdyWEt82Szyw==
X-Google-Smtp-Source: AGHT+IFqoW7nWhV8IUA+TQG2fQc9qLd29Wk2q4rxPtFWQSwuIXGDepbg1ubnSnkWf5dAK+m67+iBxGQakS6NzOCrGXQ=
X-Received: by 2002:a17:906:d92b:b0:a46:a3df:6abc with SMTP id
 rn11-20020a170906d92b00b00a46a3df6abcmr1143114ejb.12.1710609055006; Sat, 16
 Mar 2024 10:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240316083744.28126-1-tiwai@suse.de>
In-Reply-To: <20240316083744.28126-1-tiwai@suse.de>
From: =?UTF-8?B?TmlrbMSBdnMgS2/EvGVzxYZpa292cw==?= <pinkflames.linux@gmail.com>
Date: Sat, 16 Mar 2024 19:10:38 +0200
Message-ID: <CAG+bWs0kNpOP0EnAh44CSEDn2aCn-i8nJasqZdfSzr+KfLL4Og@mail.gmail.com>
Subject: Re: [PATCH] Revert "ALSA: usb-audio: Name feature ctl using output if
 input is PCM"
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Kenny Levinsen <kl@kl.wtf>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If it's relevant:

Reported-and-tested-by: Nikl=C4=81vs Ko=C4=BCes=C5=86ikovs <pinkflames.linu=
x@gmail.com>

sestd., 2024. g. 16. marts, plkst. 10:37 =E2=80=94 lietot=C4=81js Takashi I=
wai
(<tiwai@suse.de>) rakst=C4=ABja:
>
> This reverts commit 1601cd53c7e3197181277326dbfc131d20a74e46.
>
> This fix is applied globally to all devices, and it may change the
> existing control names.  When the devices are managed with the fixed
> configuration like UCM, such control name mismatch may lead to
> significant regressions.
>
> For avoiding that kind of regression, we would need to apply such
> changes conditionally, but it'd take time to settle down.
> While the original fix is a good thing in general, in order to address
> the regression, let's revert the change for now.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218605
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/mixer.c | 49 ++++++++++++++---------------------------------
>  1 file changed, 14 insertions(+), 35 deletions(-)
>
> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index 81256ab56835..409fc1164694 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -1652,34 +1652,6 @@ static const struct usb_feature_control_info *get_=
feature_control_info(int contr
>         return NULL;
>  }
>
> -static int feature_unit_mutevol_ctl_name(struct usb_mixer_interface *mix=
er,
> -                                        struct snd_kcontrol *kctl,
> -                                        struct usb_audio_term *iterm,
> -                                        struct usb_audio_term *oterm)
> -{
> -       struct usb_audio_term *aterm, *bterm;
> -       bool output_first;
> -       int len =3D 0;
> -
> -       /*
> -        * If the input terminal is USB Streaming, we try getting the nam=
e of
> -        * the output terminal first in hopes of getting something more
> -        * descriptive than "PCM".
> -        */
> -       output_first =3D iterm && !(iterm->type >> 16) && (iterm->type & =
0xff00) =3D=3D 0x0100;
> -
> -       aterm =3D output_first ? oterm : iterm;
> -       bterm =3D output_first ? iterm : oterm;
> -
> -       if (aterm)
> -               len =3D get_term_name(mixer->chip, aterm, kctl->id.name,
> -                                   sizeof(kctl->id.name), 1);
> -       if (!len && bterm)
> -               len =3D get_term_name(mixer->chip, bterm, kctl->id.name,
> -                                   sizeof(kctl->id.name), 1);
> -       return len;
> -}
> -
>  static void __build_feature_ctl(struct usb_mixer_interface *mixer,
>                                 const struct usbmix_name_map *imap,
>                                 unsigned int ctl_mask, int control,
> @@ -1761,15 +1733,22 @@ static void __build_feature_ctl(struct usb_mixer_=
interface *mixer,
>         case UAC_FU_MUTE:
>         case UAC_FU_VOLUME:
>                 /*
> -                * Determine the control name:
> -                * - If a name id is given in descriptor, use it.
> -                * - If input and output terminals are present, try to de=
rive
> -                *   the name from either of these.
> -                * - Otherwise, make up a name using the feature unit ID.
> +                * determine the control name.  the rule is:
> +                * - if a name id is given in descriptor, use it.
> +                * - if the connected input can be determined, then use t=
he name
> +                *   of terminal type.
> +                * - if the connected output can be determined, use it.
> +                * - otherwise, anonymous name.
>                  */
>                 if (!len) {
> -                       len =3D feature_unit_mutevol_ctl_name(mixer, kctl=
, iterm,
> -                                                           oterm);
> +                       if (iterm)
> +                               len =3D get_term_name(mixer->chip, iterm,
> +                                                   kctl->id.name,
> +                                                   sizeof(kctl->id.name)=
, 1);
> +                       if (!len && oterm)
> +                               len =3D get_term_name(mixer->chip, oterm,
> +                                                   kctl->id.name,
> +                                                   sizeof(kctl->id.name)=
, 1);
>                         if (!len)
>                                 snprintf(kctl->id.name, sizeof(kctl->id.n=
ame),
>                                          "Feature %d", unitid);
> --
> 2.43.0
>
