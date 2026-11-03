Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716793;
	b=eNtKq/sNSWrROZkastkjZEHndCcTCXm7HJ54WCLXfsPQqF5rYxd4xrueYAWnV1xkCnkw
	 TRtCNGnOn7DrJdrneqlKqiOOGSPiONlvtjo+Tx18n1RwzSRUOWTrS2+KuF5LThPw7AArB
	 h6AuiSc/Z93d0GA/8garwBxxOXwpGPztQeKtRiwNHKoBFBCsL8KcZjlLOIZzWhA/koLy+
	 ogtnp6atVE0JwCNQISIK2ZZJ7pbHjIZmyTyMgtQDA4qfOqzcAZ4KHnrAvD4AGx37Nqdq7
	 J2QB1stV935Upor6OUzp9unfgxoaRUQZuCw68OvtUIRjCpBs5/z8LHBt56Yx1R+PF5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716793;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZwbaMG6aUSMTnRL9MhToGte5CDhehKEdwXeLnhI65gw=;
	b=nDRqflq5TdVEc0OlHaHWm31Hy9MwFpTVi+rN+Yac2yxyf5jCvU7h6OxBduUoIalpo2kw
	 Gv1JMNAG+YbWtwjzhQDORX6UH8WEvmSBdz6pU9JwNVD5t04BgNu8dH6FQcY87nioUeljQ
	 PIu2Makun5Ql2mFc0Pzyk8EZJSDk7j5MjJ5k/Fcv8G+0oa41Q2Y6P/6q3VTy960yUrsAN
	 LXVwY09EydKRUlVjqIEbDQ2N12xCFNpbTrZBvtYn4odA5ZKGgFEuV05C66269Yb5BtDXi
	 sUuadusZAXqNyW7qUpxMt2DpfsLX7kWxnP7wGn9fbmOnHqoDkJPwD2Y96eJS1z1R/0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nONsd5+m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6D5606D81B
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 14:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nONsd5+m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3F11F00A18;
	Tue,  3 Nov 2026 14:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793716792;
	bh=ZwbaMG6aUSMTnRL9MhToGte5CDhehKEdwXeLnhI65gw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nONsd5+mNYQKLpyxoMGNVVdc9GdARJYZ3XBiEuXphj1e9E8fjbyc0IKVU8ulPuG0k
	 DfL/Q36pnyxUagX8IGKvGSnka25gVkF1A2bCH3xl44iQPtBH25yxB28NX5WrHuCVye
	 801U5HT8XyKfLJ4PrjVnbvYw+G9BgbNRz1EZACzNozDYvb7Z4SAG5KnfV1Ymhxf2db
	 b5rzjMCBhWAOOtT8tDfgd+RY/2/tJwBCrghmKtyqVcbyb9mCaPbfQ473G1mk+FHf0/
	 bswHd8vmdE4azuBZI6Xu6/G9cjOhPQIbm45c6Q3iHEr39ZZ8bmX+KfmfRM3KfV00We
	 8p8CVDLydJpHQ==
Message-ID: <sashiko-outbox-195464@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] ASoC: cs42l43: Improve pop performance of the
 input power up
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261103141857.672537-4-ckeepax@opensource.cirrus.com>
References: <20261103141857.672537-1-ckeepax@opensource.cirrus.com>
 <20261103141857.672537-4-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:39:52 +0000
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
- [Medium] ASoC: cs42l43: missing DAPM lock on Decimator 5 and 6 HPF contro=
ls
--

commit 8cf1c31ea6b0941fdadc51d4efe5a6f1e81ead1b
Author: Charles Keepax <ckeepax@opensource.cirrus.com>

ASoC: cs42l43: Improve pop performance of the input power up

This commit adjusts the decimator high pass filter settings and adds a 150ms
settling delay during microphone power up to reduce startup pop noises, whi=
le
converting the Decimator 1..4 HPF controls to take the DAPM lock.

> diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
> index 8fccddf7a1b22..43758f790cb0f 100644
> --- a/sound/soc/codecs/cs42l43.c
> +++ b/sound/soc/codecs/cs42l43.c
> @@ -1345,19 +1345,27 @@ static const struct snd_kcontrol_new cs42l43_cont=
rols[] =3D {
>  	SOC_ENUM("Decimator 3 WNF Corner Frequency", cs42l43_dec3_wnf_corner),
>  	SOC_ENUM("Decimator 4 WNF Corner Frequency", cs42l43_dec4_wnf_corner),
> =20
> -	SOC_SINGLE("Decimator 1 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL1,
> -		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
> -	SOC_SINGLE("Decimator 2 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL2,
> -		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
> -	SOC_SINGLE("Decimator 3 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL3,
> -		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
> -	SOC_SINGLE("Decimator 4 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL4,
> -		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
> +	SOC_SINGLE_EXT("Decimator 1 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL1,
> +		       CS42L43_DECIM_HPF_EN_SHIFT, 1, 0,
> +		       cs42l43_dapm_get_volsw, cs42l43_dapm_put_volsw),
> +	SOC_SINGLE_EXT("Decimator 2 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL2,
> +		       CS42L43_DECIM_HPF_EN_SHIFT, 1, 0,
> +		       cs42l43_dapm_get_volsw, cs42l43_dapm_put_volsw),
> +	SOC_SINGLE_EXT("Decimator 3 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL3,
> +		       CS42L43_DECIM_HPF_EN_SHIFT, 1, 0,
> +		       cs42l43_dapm_get_volsw, cs42l43_dapm_put_volsw),
> +	SOC_SINGLE_EXT("Decimator 4 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL4,
> +		       CS42L43_DECIM_HPF_EN_SHIFT, 1, 0,
> +		       cs42l43_dapm_get_volsw, cs42l43_dapm_put_volsw),
> =20
> -	SOC_ENUM("Decimator 1 HPF Corner Frequency", cs42l43_dec1_hpf_corner),
> -	SOC_ENUM("Decimator 2 HPF Corner Frequency", cs42l43_dec2_hpf_corner),
> -	SOC_ENUM("Decimator 3 HPF Corner Frequency", cs42l43_dec3_hpf_corner),
> -	SOC_ENUM("Decimator 4 HPF Corner Frequency", cs42l43_dec4_hpf_corner),
> +	SOC_ENUM_EXT("Decimator 1 HPF Corner Frequency", cs42l43_dec1_hpf_corne=
r,
> +		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
> +	SOC_ENUM_EXT("Decimator 2 HPF Corner Frequency", cs42l43_dec2_hpf_corne=
r,
> +		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
> +	SOC_ENUM_EXT("Decimator 3 HPF Corner Frequency", cs42l43_dec3_hpf_corne=
r,
> +		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
> +	SOC_ENUM_EXT("Decimator 4 HPF Corner Frequency", cs42l43_dec4_hpf_corne=
r,
> +		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),

[ ... ]

> @@ -1770,26 +1785,32 @@ static const struct decim_info cs42l43_decim_info=
[] =3D {
> =20
>  static const struct decim_info cs42l43b_decim_info[] =3D {
>  	{
> +		.freg =3D CS42L43_DECIM_HPF_WNF_CTRL1,
>  		.vreg =3D CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
>  		.vmask =3D CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
>  	},
>  	{
> +		.freg =3D CS42L43_DECIM_HPF_WNF_CTRL2,
>  		.vreg =3D CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
>  		.vmask =3D CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
>  	},
>  	{
> +		.freg =3D CS42L43_DECIM_HPF_WNF_CTRL3,
>  		.vreg =3D CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
>  		.vmask =3D CS42L43_DECIM3_VD_RAMP_MASK | CS42L43_DECIM3_MUTE_MASK,
>  	},
>  	{
> +		.freg =3D CS42L43_DECIM_HPF_WNF_CTRL4,
>  		.vreg =3D CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
>  		.vmask =3D CS42L43_DECIM4_VD_RAMP_MASK | CS42L43_DECIM4_MUTE_MASK,
>  	},
>  	{
> +		.freg =3D CS42L43B_DECIM_HPF_WNF_CTRL5,
>  		.vreg =3D CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
>  		.vmask =3D CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK | CS42L43B_DECIM5_=
MUTE_MASK,
>  	},
>  	{
> +		.freg =3D CS42L43B_DECIM_HPF_WNF_CTRL6,
>  		.vreg =3D CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
>  		.vmask =3D CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK | CS42L43B_DECIM6_=
MUTE_MASK,
>  	}

[Severity: Medium]
As reported by Sashiko on v1 [1], cs42l43b_decim_info[] adds
CS42L43B_DECIM_HPF_WNF_CTRL5 and CS42L43B_DECIM_HPF_WNF_CTRL6 so that
cs42l43_mic_ev() caches, temporarily overrides, and restores them across the
150ms settle delay during PDM2L and PDM2R startup.

While the Decimator 1..4 HPF controls in cs42l43_controls[] were updated to
use the DAPM-locked helpers, the Decimator 5 and 6 HPF controls in
cs42l43_b_controls[] still use plain SOC_SINGLE and SOC_ENUM:

sound/soc/codecs/cs42l43.c:cs42l43_b_controls[] {
	...
	SOC_SINGLE("Decimator 5 HPF Switch", CS42L43B_DECIM_HPF_WNF_CTRL5,
		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
	SOC_SINGLE("Decimator 6 HPF Switch", CS42L43B_DECIM_HPF_WNF_CTRL6,
		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),

	SOC_ENUM("Decimator 5 HPF Corner Frequency", cs42l43b_dec5_hpf_corner),
	SOC_ENUM("Decimator 6 HPF Corner Frequency", cs42l43b_dec6_hpf_corner),
};

If userspace reads or writes the Decimator 5 or 6 HPF controls on CS42L43B
while PDM2L or PDM2R is powering up in cs42l43_mic_ev(), can it read back t=
he
temporary startup filter settings or have a concurrent write overwritten wh=
en
SND_SOC_DAPM_POST_PMU restores priv->decim_cache[w->shift][1]?

Should the Decimator 5 and 6 HPF Switch and Corner Frequency controls in
cs42l43_b_controls[] also be converted to SOC_SINGLE_EXT and SOC_ENUM_EXT w=
ith
cs42l43_dapm_get_volsw, cs42l43_dapm_put_volsw, cs42l43_dapm_get_enum, and
cs42l43_dapm_put_enum?

[1] https://lore.kernel.org/r/sashiko-outbox-193741@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103141857.6725=
37-1-ckeepax@opensource.cirrus.com?part=3D3
