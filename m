Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635552;
	b=mVJS5JGWip5w99YM8JhwMiTR5v2zW+lIj7CnpGxBTmZyJOPS0I8OiV5m+gXCMBMaaGSa
	 FJ6Qm2Ha5c3ryRZh0Ao8lEPtqK4n626SD5qAPNO6e53KzvfNb54a3z0VvqzUA69JUyM1O
	 wpr6FRJvODfQH3PywrOL24bn2Rv9nEdQCuSv7EjJbawZTy+PtCj5/2AXf4XO8P1RJ9Diq
	 xDQ1YU80H/ZM7dHPOdBBDNJPcxupDad5dTi6UIyBIUnfVxLXMlxvEtzPmHLzh3Akg40BA
	 AUxvQjmI0ErS78Yt5fTCrSewwY199jKCyldlKqjF+ol14uFCpBefApjut47W1DXiYIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635552;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=K/hATIZgYo0i4DQpZHDgl/bOhq6/60LoUGaaJkF9Zcg=;
	b=D7gFVrK7sya7iGbAlzptwsZuiKVzIykQylixKISFFrZYgCDcPSJkqPhVoWS2hDkNqV7E
	 nLXt3mMYcfOrQK8o5rCeqD/X8u7lumrqXL2t2dXsC7cwSbpj6WOdk370BRFkGL6p1Lczn
	 IcKBTDIcnPqDsbkht4VoHYh7xkDD+89PABM8UOHLP+xP5i5KD1X5XL06XusOQPV+i4dAz
	 mBTGBxxVIakaATdT41EGq84zhDM/NnqcAMbkn8ksX8jzeMIZv+tyjz3GFtO11wygSefhZ
	 37wIRVIXUVzUkMiMZmulfCqYaTPeNBuiEZWt5poKitT35D+vtERCQI3NkoazHjijmAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uoq6ya17;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF40606C54E
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 16:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uoq6ya17
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC5111F00A16;
	Mon,  2 Nov 2026 16:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793635551;
	bh=K/hATIZgYo0i4DQpZHDgl/bOhq6/60LoUGaaJkF9Zcg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uoq6ya17pWekG+yD+z4FURFNj7qLKIIKYbLIB4B5TPV8UZB1ZKI3noKwC9uYBZ9Yl
	 7VysQ2GGhBbdnWohoX+LOkOCX1ofRxWIV3zQhFMOWYyXY2pupV2yla7W4itRfkY3xo
	 +SKfyjhXb0WKzwuAWRxjziPn+WnaHQHNU305cpKqaktVk9Us12Xlqw4FBv/JnAUJFP
	 KbQdJAXOw0cgRKkumEOCWGmBzw6hZYfwox6C7EWD7ksiPVCVO8UhUNnqQDvbT0EYfB
	 NiQRirgxq3+J6psi3IogRyyGuyV9aPahXlm3zXyR4eDM8oJ5cW2no49AT2yMIkta+C
	 G/vwXxR1Gr1xg==
Message-ID: <sashiko-outbox-193729@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] ASoC: cs42l43: Factor out decimator startup data to
 an array
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261102155440.3995136-3-ckeepax@opensource.cirrus.com>
References: <20261102155440.3995136-1-ckeepax@opensource.cirrus.com>
 <20261102155440.3995136-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 16:05:51 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ASoC: cs42l43: missing static const on decim_info lookup tables
--

commit aad56061661af8b4127504548c049c31c4e54dca
Author: Charles Keepax <ckeepax@opensource.cirrus.com>

ASoC: cs42l43: Factor out decimator startup data to an array

This commit replaces the variant-specific switch statements in
cs42l43_mic_ev() with the cs42l43_decim_info and cs42l43b_decim_info lookup
arrays indexed by w->shift.

> diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
> index 90c83bb33d69b..17d55a3de9de3 100644
> --- a/sound/soc/codecs/cs42l43.c
> +++ b/sound/soc/codecs/cs42l43.c
> @@ -1736,97 +1736,82 @@ static int cs42l43_hp_ev(struct snd_soc_dapm_widg=
et *w,
>  	return 0;
>  }
> =20
> +struct decim_info {
> +	unsigned int vreg;
> +	unsigned int vmask;
> +};
> +
> +struct decim_info cs42l43_decim_info[] =3D {
> +	{
> +		.vreg =3D CS42L43_DECIM_VOL_CTRL_CH1_CH2,
> +		.vmask =3D CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
> +	},
> +	{
> +		.vreg =3D CS42L43_DECIM_VOL_CTRL_CH1_CH2,
> +		.vmask =3D CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
> +	},
> +	{
> +		.vreg =3D CS42L43_DECIM_VOL_CTRL_CH1_CH2,
> +		.vmask =3D CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
> +	},
> +	{
> +		.vreg =3D CS42L43_DECIM_VOL_CTRL_CH1_CH2,
> +		.vmask =3D CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
> +	},
> +	{
> +		.vreg =3D CS42L43_DECIM_VOL_CTRL_CH3_CH4,
> +		.vmask =3D CS42L43_DECIM3_VD_RAMP_MASK | CS42L43_DECIM3_MUTE_MASK,
> +	},
> +	{
> +		.vreg =3D CS42L43_DECIM_VOL_CTRL_CH3_CH4,
> +		.vmask =3D CS42L43_DECIM4_VD_RAMP_MASK | CS42L43_DECIM4_MUTE_MASK,
> +	}
> +};
> +
> +struct decim_info cs42l43b_decim_info[] =3D {
> +	{
> +		.vreg =3D CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
> +		.vmask =3D CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
> +	},
> +	{
> +		.vreg =3D CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
> +		.vmask =3D CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
> +	},
> +	{
> +		.vreg =3D CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
> +		.vmask =3D CS42L43_DECIM3_VD_RAMP_MASK | CS42L43_DECIM3_MUTE_MASK,
> +	},
> +	{
> +		.vreg =3D CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
> +		.vmask =3D CS42L43_DECIM4_VD_RAMP_MASK | CS42L43_DECIM4_MUTE_MASK,
> +	},
> +	{
> +		.vreg =3D CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
> +		.vmask =3D CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK | CS42L43B_DECIM5_=
MUTE_MASK,
> +	},
> +	{
> +		.vreg =3D CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
> +		.vmask =3D CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK | CS42L43B_DECIM6_=
MUTE_MASK,
> +	}
> +};
> +
>  static int cs42l43_mic_ev(struct snd_soc_dapm_widget *w,
>  			  struct snd_kcontrol *kcontrol, int event)
>  {
>  	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->da=
pm);
>  	struct cs42l43_codec *priv =3D snd_soc_component_get_drvdata(component);
> +	struct decim_info *info =3D &cs42l43_decim_info[w->shift];

[Severity: Low]
Should cs42l43_decim_info and cs42l43b_decim_info in
sound/soc/codecs/cs42l43.c be declared static const (and info in
cs42l43_mic_ev() be a const struct decim_info *)?

Both tables are only used within sound/soc/codecs/cs42l43.c and are never
modified. Without static const, they are placed in writable .data instead of
.rodata and trigger -Wmissing-variable-declarations and Sparse warnings when
building with W=3D1 or C=3D1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102155440.3995=
136-1-ckeepax@opensource.cirrus.com?part=3D2
