Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CAD195FE1
	for <linux-sound@vger.kernel.org>; Wed,  5 Jun 2024 08:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717575337; cv=none; b=npI4YR2/fy3dddUk5o+5RzXIGxnbyFdGf20DuNV3lI8Nb6F0h0qfY7/4JfI8HWJC/7u8FZWwrx7bzfw2fVR9TSM+8ruo8CJIvQI3cWGzWe2MxpkQvMsL1Azm+82wxxi5y3H8FFLCiEe2FliMtiqaDC62a2av/BXJPVdFvDdrNrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717575337; c=relaxed/simple;
	bh=wwczkAnxiPnhiTU2luJ8i5BIFpa3mGxUm4/6rAw6d74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrHGu8XcKBsDeN1c/cSHQWOTmDC1f07fvJuikzf+nuGtzT+eVHiOzapf/gSTnEPu3fU0WayOwsBNQE2ZAkVZuB8UGOnyxIxn8XKoMg8PMcZpXrXld9w6kxu/CJW8v9r7Kz5vRFkmO5VwuoOZdCEpAW01luJxmkMzw3RcfAMdNKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZHzhvcdv; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZHzhvcdv"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52b976b5d22so3846650e87.1
        for <linux-sound@vger.kernel.org>; Wed, 05 Jun 2024 01:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717575334; x=1718180134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBJGp2n7Qi8iczry8F3rJYPAUsV9sny6tREW8YboOY4=;
        b=ZHzhvcdvOEz8u08tGLrehvO+c0l4iWRYzveRW+c+K+CuU3Rv/f8IQmS2KwWvpavF3A
         k/m/oWYqUKSSPL2kKgfdcsE/TecEivehwLgZz3bZuMPyvRht6QIy+VNdLPelYA60Cdjj
         lg6WlYAgzqX0iGNjib5IPwr4PXJTR1+aRf/7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717575334; x=1718180134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBJGp2n7Qi8iczry8F3rJYPAUsV9sny6tREW8YboOY4=;
        b=WpKdsyRZqr/hWJUKdRsBU1SSUzFo1tD7yRKK26OYRRRJ+zQWMFngWzUxgMVsFFuamR
         y65PErlNqrdu7wOF29jWF2FcZcfAtsMAMY2+gXdp6n+Nhq5j3fQ5Pj0ZdbbkcmkgbSyJ
         jd/RZ0VEduAUDvlusyfCCA+pSF6t221eo3Ud9I/kwl3F00fy/j0P4EGwQuay3YFm6X7F
         fvEnzK4aDX8Ec7s8S1u73jmDqt3ytYun6/Kw9GPAVkIqfGWxuSB0T+n3fc0XmY0zf+Xl
         eWtECt6k791K3YQDF/8b+QLmtjHzHiT2VLjXZ7dF/ys0cuZuwYbIV2jL/CxowZuLQf47
         //OA==
X-Forwarded-Encrypted: i=1; AJvYcCVeyiO41z2R1IbK4jB9F32nsWIe8IzZR4Voeo363ISuiLPduoijNCI2NTVExaLszPFKovcSNsuhjhYpaWtbZP6aaksW3xOlYfYAPM4=
X-Gm-Message-State: AOJu0YzJwcEACuNLrUpgCAxpiQJM7FXnAD69j2qROUVCH1j+IJRKiTMm
	o0b4DqQKfDeN4iHIHw6TO4c9p1gjslWt6pLKMyjWGQglUpLBZ6GWDupHphTRm+9V/mZKpeInxon
	/6139poA4Di5b3MLc8Lr4r0NZpoyyagmzpNHg
X-Google-Smtp-Source: AGHT+IFv2EhtdnevSPCvIeqSgMPmgn2c2ifR+LCf/RGmcOYSAbDEQu2piNDxPs8NQh7dFB09wa+cSR9ks7fS+1w/wzo=
X-Received: by 2002:ac2:4c92:0:b0:52b:84bd:344f with SMTP id
 2adb3069b0e04-52bab4fa611mr941691e87.53.1717575331623; Wed, 05 Jun 2024
 01:15:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531-da7219-v1-1-ac3343f3ae6a@chromium.org>
In-Reply-To: <20240531-da7219-v1-1-ac3343f3ae6a@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 5 Jun 2024 16:15:20 +0800
Message-ID: <CAGXv+5G3RjUOyGR2kqd1V-keQZLvBPaMmiW8BZgLGw6jcZe0nA@mail.gmail.com>
Subject: Re: [PATCH RFT] ASoC: mediatek: mt8183-da7219-max98357: Fix kcontrol
 name collision
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alper Nebi Yasak <alpernebiyasak@gmail.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 4:38=E2=80=AFPM Hsin-Te Yuan <yuanhsinte@chromium.o=
rg> wrote:
>
> Since "Headphone Switch" kcontrol name has already been used by da7219,
> rename the control name from "Headphone" to "Headphones" to prevent the
> colision. Also, this change makes kcontrol name align with the one in

  ^ collision

> mt8186-mt6366-da7219-max98357.c.
>
> Fixes: 9c7388baa2053 ("ASoC: mediatek: mt8183-da7219-max98357: Map missin=
g jack kcontrols")
> Change-Id: I9ae69a4673cd04786b247cc514fdd20f878ef009
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
> This patch fix the kcontrol name collision in mt8183-da7219-max98357.c.
> Originally, the "Headphone" kcontrol is added to meet PulseAudio's and
> PipeWire's needs, but that patch was untested. Since I don't have
> either setup, I wonder if someone can test this patch.
> ---
>  sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/s=
oc/mediatek/mt8183/mt8183-da7219-max98357.c
> index acaf81fd6c9b..f848e14b091a 100644
> --- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
> +++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
> @@ -31,7 +31,7 @@ struct mt8183_da7219_max98357_priv {
>
>  static struct snd_soc_jack_pin mt8183_da7219_max98357_jack_pins[] =3D {
>         {
> -               .pin    =3D "Headphone",
> +               .pin    =3D "Headphones",
>                 .mask   =3D SND_JACK_HEADPHONE,
>         },
>         {
> @@ -626,7 +626,7 @@ static struct snd_soc_codec_conf mt6358_codec_conf[] =
=3D {
>  };
>
>  static const struct snd_kcontrol_new mt8183_da7219_max98357_snd_controls=
[] =3D {
> -       SOC_DAPM_PIN_SWITCH("Headphone"),
> +       SOC_DAPM_PIN_SWITCH("Headphones"),
>         SOC_DAPM_PIN_SWITCH("Headset Mic"),
>         SOC_DAPM_PIN_SWITCH("Speakers"),
>         SOC_DAPM_PIN_SWITCH("Line Out"),
> @@ -634,7 +634,7 @@ static const struct snd_kcontrol_new mt8183_da7219_ma=
x98357_snd_controls[] =3D {
>
>  static const
>  struct snd_soc_dapm_widget mt8183_da7219_max98357_dapm_widgets[] =3D {
> -       SND_SOC_DAPM_HP("Headphone", NULL),
> +       SND_SOC_DAPM_HP("Headphones", NULL),
>         SND_SOC_DAPM_MIC("Headset Mic", NULL),
>         SND_SOC_DAPM_SPK("Speakers", NULL),
>         SND_SOC_DAPM_SPK("Line Out", NULL),
> @@ -680,7 +680,7 @@ static struct snd_soc_codec_conf mt8183_da7219_rt1015=
_codec_conf[] =3D {
>  };
>
>  static const struct snd_kcontrol_new mt8183_da7219_rt1015_snd_controls[]=
 =3D {
> -       SOC_DAPM_PIN_SWITCH("Headphone"),
> +       SOC_DAPM_PIN_SWITCH("Headphones"),
>         SOC_DAPM_PIN_SWITCH("Headset Mic"),
>         SOC_DAPM_PIN_SWITCH("Left Spk"),
>         SOC_DAPM_PIN_SWITCH("Right Spk"),
> @@ -689,7 +689,7 @@ static const struct snd_kcontrol_new mt8183_da7219_rt=
1015_snd_controls[] =3D {
>
>  static const
>  struct snd_soc_dapm_widget mt8183_da7219_rt1015_dapm_widgets[] =3D {
> -       SND_SOC_DAPM_HP("Headphone", NULL),
> +       SND_SOC_DAPM_HP("Headphones", NULL),
>         SND_SOC_DAPM_MIC("Headset Mic", NULL),
>         SND_SOC_DAPM_SPK("Left Spk", NULL),
>         SND_SOC_DAPM_SPK("Right Spk", NULL),
>
> ---
> base-commit: 4a4be1ad3a6efea16c56615f31117590fd881358
> change-id: 20240531-da7219-2281085838a5
>
> Best regards,
> --
> Hsin-Te Yuan <yuanhsinte@chromium.org>
>
>
