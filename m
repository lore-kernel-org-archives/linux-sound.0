Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5B32561AE
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 09:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852364; cv=none; b=blVMyBQYzxzm8JKUmOlHdj6Qtx+qMkVGmf5q5xojRgkvfGFF9PysFies/dAMgG835Zu8fXqpvEFFjlCkfYYPnIHrGW2kdcf/i5RVG7MLsYru67+uZ7Zwwp6kbkZi/bXPtM+Fnyd6ltp6ZmNdBP66MIWESa9gqRlfrPelBaFcMpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852364; c=relaxed/simple;
	bh=Zj+oofvcEakxGJSIA5Ab66zj/gF8GhIfQqoW017ICvg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZO22OwIkGC3jcAlanMK3LEIt6ftdgAYRL+Rg3cX4uIEIuQ/eD5DD4btXsusx0te9jKr3Sh+qeb+qPE2HbNEl5WtAspbePVSFIiNFG8LF/s40VDwt1a+oewcRSGd80awiywhnizMOy/WPlKO1efIoWHBYR9xc124OV1jKOvbIqfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4ZgRhzo; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4ZgRhzo"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso20156965e9.1
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 01:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762852361; x=1763457161; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KpQkHpPD03tnJ/jJCw6udmZ3thReBzvDkldXvh/HuuA=;
        b=L4ZgRhzoLA6Wcf+QZy6qIbdoekPaS+KWwwha6uHRVVUtZZlGgoJwSZcjMKZt4kVtDX
         TgJn+TNNFBjuelAJGBqwDrGCTuheo3JQROmJvkcKTMisVKYWJNdoN4m+/BzAfrWpBu0G
         GGFuni+mVml/seiN8F5DjRWalHXZSKuEJ0YOqOfbjlb9obqkkxMLq1IWe4g1RcUt43L/
         CbtXPWweV3kqvyzj0Az81zr5kPDnv2SJXg/rSPJ9OMF1hesVFnRHMZg0eU3IFzSgnmDz
         t68uu8xQ4h5hDinco+WO6S2uX5YZniDhQFBHlBI6gs17p2E6y+e5vjtdvm/d6qFLDCVP
         OTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852361; x=1763457161;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KpQkHpPD03tnJ/jJCw6udmZ3thReBzvDkldXvh/HuuA=;
        b=HAX/pnzz5ipUO8jBba87d3shEbXSAfa92UrUC1EWSrS5Dlf/E/VBt0nQlY5mUw59lw
         q4Dlzhbm1UueRI6w3TBor5kPJeYDCE99ub9wUT2xZAqSEdexjs6Po6RW9rpjyXoOSgUc
         MtfXCiUt28a4rXaEiVnn8ux7fp2Z0ze92CEh4P94zBk9ZfbMaW6R6U7YA2lU18Q5IQAe
         snkBkMzRpno0BMeF3zQnmkLeH0CNh1rVKrB1RYWgssJSosvfVzVcZ3RXH+5YZSI+kDGY
         i0DGyLyrB/Ld5Y080W3BkUG9yc1YQdF/5h7EDQZZ6SPZrYAqmrnRzYEu0wn97ikm8wzK
         1xoA==
X-Gm-Message-State: AOJu0YyfMaus885rThyaF12pUqZwX+r5T5skcvOFD2JXCWVBnE1tx+cP
	PBUrYHe01ZzyEbQOx90rMKIvX1cgcX/OrOKuDcwYIMc/ISPB7L8MfF8B
X-Gm-Gg: ASbGnctzWrADfBPlHGtwl1IhWaCfoKtEW0LDZRGfkPZuEhxUElOhF1UTmVwfEy6699U
	mPg5Rr79BvSi4W0ME/V78yARMlyh1XZJk8z9tjfmKHWPFVyqvwtQfUK4CTIgjDn0H8oLWtukiQn
	f7dp6HSlyU0/8Pb6XBY+CP87wXyoCY0oKr5dACCOuhKbOpo7RIOTtr8JbDvPrOO9yZgYv3kSwR4
	hFsZE9KgawF1vvKx25cpWrhECau+eLXA7jq09FaQedxKNMshUdXYMS2fjMrA6/n6/j5SHnsKR+V
	ExTW9T4GHOW3Z9CntRVlA9kiQlzn6e+CFenGBtbeKkHCGnUuNmyTpJmLu+TTLnUB2NcRSXcgAnF
	UEmjVd96Oz8nkbHdujtieb5l/9LsVeWTmlN/Ejq8vz8207GETcK8gqViGD1re5K9/fuupUFYjFU
	6t70qtNW1F3j/8ezH//v8=
X-Google-Smtp-Source: AGHT+IHPHvnNLj+yQabcXm4Sc8osothT4ogjaEYLg5I9xYaF/GOq8/URhnOUhQUAd9breLF6JjRjTw==
X-Received: by 2002:a05:600c:4753:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-47773293939mr130184895e9.32.1762852360616;
        Tue, 11 Nov 2025 01:12:40 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679607esm26567408f8f.43.2025.11.11.01.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:12:40 -0800 (PST)
Message-ID: <bcd954b7ba0243a997b2fe90bd5f5ea7b232b67b.camel@gmail.com>
Subject: Re: [PATCH 019/292] ASoC: codecs: adau17x1: convert to
 snd_soc_dapm_xxx()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	 <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Date: Tue, 11 Nov 2025 09:13:17 +0000
In-Reply-To: <87ldkd8lr9.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
	 <87ldkd8lr9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-11-11 at 00:18 +0000, Kuninori Morimoto wrote:
> This patch converts below functions.
>=20
> dapm->dev					-> snd_soc_dapm_to_dev()
> dapm->card					-> snd_soc_dapm_to_card()
> dapm->component					-> snd_soc_dapm_to_component()
>=20
> dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()
>=20
> snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
> snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unloc=
ked()
> snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
> snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlo=
cked()
> snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
> snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
> snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
> snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
> snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enabl=
e_pin_unlocked()
> snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
> snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
> snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
> snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()
>=20
> snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component(=
)
> snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
> snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
> snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0sound/soc/codecs/adau17x1.c | 14 +++++++-------
> =C2=A01 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/sound/soc/codecs/adau17x1.c b/sound/soc/codecs/adau17x1.c
> index 0b6b0d2115eb0..26d7eb437ad18 100644
> --- a/sound/soc/codecs/adau17x1.c
> +++ b/sound/soc/codecs/adau17x1.c
> @@ -185,8 +185,8 @@ static const struct snd_soc_dapm_route adau17x1_dapm_=
pll_route =3D {
> =C2=A0static int adau17x1_dsp_mux_enum_put(struct snd_kcontrol *kcontrol,
> =C2=A0	struct snd_ctl_elem_value *ucontrol)
> =C2=A0{
> -	struct snd_soc_component *component =3D snd_soc_dapm_kcontrol_component=
(kcontrol);
> -	struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(compon=
ent);
> +	struct snd_soc_component *component =3D snd_soc_dapm_kcontrol_to_compon=
ent(kcontrol);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> =C2=A0	struct adau *adau =3D snd_soc_component_get_drvdata(component);
> =C2=A0	struct soc_enum *e =3D (struct soc_enum *)kcontrol->private_value;
> =C2=A0	struct snd_soc_dapm_update update =3D {};
> @@ -230,7 +230,7 @@ static int adau17x1_dsp_mux_enum_put(struct snd_kcont=
rol *kcontrol,
> =C2=A0static int adau17x1_dsp_mux_enum_get(struct snd_kcontrol *kcontrol,
> =C2=A0	struct snd_ctl_elem_value *ucontrol)
> =C2=A0{
> -	struct snd_soc_component *component =3D snd_soc_dapm_kcontrol_component=
(kcontrol);
> +	struct snd_soc_component *component =3D snd_soc_dapm_kcontrol_to_compon=
ent(kcontrol);
> =C2=A0	struct adau *adau =3D snd_soc_component_get_drvdata(component);
> =C2=A0	struct soc_enum *e =3D (struct soc_enum *)kcontrol->private_value;
> =C2=A0	unsigned int stream =3D e->shift_l;
> @@ -383,7 +383,7 @@ static int adau17x1_set_dai_pll(struct snd_soc_dai *d=
ai, int pll_id,
> =C2=A0static int adau17x1_set_dai_sysclk(struct snd_soc_dai *dai,
> =C2=A0		int clk_id, unsigned int freq, int dir)
> =C2=A0{
> -	struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(dai->c=
omponent);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(dai->co=
mponent);
> =C2=A0	struct adau *adau =3D snd_soc_component_get_drvdata(dai->component=
);
> =C2=A0	bool is_pll;
> =C2=A0	bool was_pll;
> @@ -881,7 +881,7 @@ static int adau17x1_setup_firmware(struct snd_soc_com=
ponent *component,
> =C2=A0	int ret;
> =C2=A0	int dspsr, dsp_run;
> =C2=A0	struct adau *adau =3D snd_soc_component_get_drvdata(component);
> -	struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(compon=
ent);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> =C2=A0
> =C2=A0	/* Check if sample rate is the same as before. If it is there is n=
o
> =C2=A0	 * point in performing the below steps as the call to
> @@ -922,7 +922,7 @@ static int adau17x1_setup_firmware(struct snd_soc_com=
ponent *component,
> =C2=A0
> =C2=A0int adau17x1_add_widgets(struct snd_soc_component *component)
> =C2=A0{
> -	struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(compon=
ent);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> =C2=A0	struct adau *adau =3D snd_soc_component_get_drvdata(component);
> =C2=A0	int ret;
> =C2=A0
> @@ -958,7 +958,7 @@ EXPORT_SYMBOL_GPL(adau17x1_add_widgets);
> =C2=A0
> =C2=A0int adau17x1_add_routes(struct snd_soc_component *component)
> =C2=A0{
> -	struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(compon=
ent);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> =C2=A0	struct adau *adau =3D snd_soc_component_get_drvdata(component);
> =C2=A0	int ret;
> =C2=A0
