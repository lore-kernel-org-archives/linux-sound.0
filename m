Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636148;
	b=1Q5PIS8xwOxZ+FSzmk6YJVYdzeT9y412pTaLttyRrpTsfFLh4xEc6HWbX7g5X1/AnomC
	 Ny/JsA3ayZA7ois0W0mfv7uaOY2yZV8XyLLWP8xLzgIWLqbEfu2/xqJu79qn/xM1lEd6S
	 dsuLFGwnv+J6OiXGt8KopyvGltvhc6HRH59u9XsY3vws0+jobL21o74gBQDq6oiLtZ/FS
	 EMV5Hw+bb24oAbAAl9L1ohBIt/X+5e5X8r1XHpmGQSVJmBkV3EiomouwlD9YbFaOEVp3K
	 iC1PSRZ2tfjR/9JOeY5ho1jaj7izPQrpMxhbRxprnRulAko020/AY/rf78XNVG01hRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636148;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lrlk85/ZsHr5rujz74PPIndHNdBxoDtXFTMdpI6s0VI=;
	b=yJ6Ffdwux23Os0Q4WAqdgrqOKavWoduXK3+nUbjFP2452lLV+6OPSshRxW1L+bPQsRE8
	 e0DuBY7BTLg0cEPUeVdp41u6RJYBpqmJI38puqNEYChGCN8O4Ur2sZFT10Wrum9b0CSM0
	 twar4RDkniRu+0UODcvtfI48D0kLrC9vePTURcjSxbziwsh0dZV1anJvGItM5WVfQn5Kz
	 ewdl+zAbO443R7O9vvKKsdlzPF9OwK+Y0VlfZTLV7BkInJ5VBk1uBUxR+KUg8rDRqf/8T
	 +RXuWQvzNQfMGP1GXWvxpuodnzfA6qUFLNBR9v0qnail6n7Zozm5FTADOPl5fxcEvvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VV2E358I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21972606A915
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 16:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VV2E358I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5781F00A1B;
	Mon,  2 Nov 2026 16:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793636147;
	bh=lrlk85/ZsHr5rujz74PPIndHNdBxoDtXFTMdpI6s0VI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VV2E358IUDuxI992bwiz9vT2uMsFTW/bNtiDEMRpUpNDpB3cEN4Q4+cJjhgPnon3p
	 5sUE7z1mwm0KhrBi7wuccR4bszy8VqJrp7xQ5yRX2UpfgZkznlaeQNx/yFTQzXKQ2Z
	 tQGKUcL4i443TntJGs7Ae265h3az/6U0OinchFnInLR10RLsCUD+nAUo4MpLJAYYk3
	 jMMW9hZUvk7hSn03V8PuIA2nf79PeWlLvdqu2NXbZNR3iuDScCjXhdJyDk/lBNAtZM
	 GazDP4gloOogbIH21my6LB/fmEr3X3wdfKb3mRI0AHj1Rp34g9k1Mg9CV85FFwtXFy
	 ur5Yc95Frwj4g==
Message-ID: <sashiko-outbox-193741@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] ASoC: cs42l43: Improve pop performance of the input
 power up
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261102155440.3995136-4-ckeepax@opensource.cirrus.com>
References: <20261102155440.3995136-1-ckeepax@opensource.cirrus.com>
 <20261102155440.3995136-4-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 16:15:47 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] ASoC: cs42l43: swapped filter registers for ADC2 and PDM1L in cs42=
l43_decim_info
- [Medium] ASoC: cs42l43: missing DAPM lock on Decimator HPF controls racin=
g with cs42l43_mic_ev()
- [Low] ASoC: cs42l43: missing static const on cs42l43_decim_info tables
--

commit 09aa11a71081b83cbebd343e4e4609f427672725
Author: Charles Keepax <ckeepax@opensource.cirrus.com>

ASoC: cs42l43: Improve pop performance of the input power up

This commit adjusts the decimator high pass filter settings during
microphone startup in cs42l43_mic_ev(), waits 150ms for the filter to
settle, and then restores the cached user settings.

> diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
> index 17d55a3de9de3..9576f7abba97f 100644
> --- a/sound/soc/codecs/cs42l43.c
> +++ b/sound/soc/codecs/cs42l43.c
> @@ -1737,32 +1737,39 @@ static int cs42l43_hp_ev(struct snd_soc_dapm_widg=
et *w,
>  }
> =20
>  struct decim_info {
> +	unsigned int freg;
>  	unsigned int vreg;
>  	unsigned int vmask;
>  };
> =20
>  struct decim_info cs42l43_decim_info[] =3D {
>  	{
> +		.freg =3D CS42L43_DECIM_HPF_WNF_CTRL1,
>  		.vreg =3D CS42L43_DECIM_VOL_CTRL_CH1_CH2,
>  		.vmask =3D CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
>  	},
>  	{
> +		.freg =3D CS42L43_DECIM_HPF_WNF_CTRL1,
>  		.vreg =3D CS42L43_DECIM_VOL_CTRL_CH1_CH2,
>  		.vmask =3D CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
>  	},
>  	{
> +		.freg =3D CS42L43_DECIM_HPF_WNF_CTRL2,
>  		.vreg =3D CS42L43_DECIM_VOL_CTRL_CH1_CH2,
>  		.vmask =3D CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
>  	},

[Severity: High]
Are the .freg assignments for entries 1 and 2 in cs42l43_decim_info[]
swapped?

cs42l43_mic_ev() indexes cs42l43_decim_info[] by w->shift from
CS42L43_BLOCK_EN3:

  0: CS42L43_ADC1_EN_SHIFT       -> Decimator 1
  1: CS42L43_ADC2_EN_SHIFT       -> Decimator 2 (.vmask uses DECIM2)
  2: CS42L43_PDM1_DIN_L_EN_SHIFT -> Decimator 1 (.vmask uses DECIM1)
  3: CS42L43_PDM1_DIN_R_EN_SHIFT -> Decimator 2 (.vmask uses DECIM2)

Entry 1 (ADC2, Decimator 2) sets .freg =3D CS42L43_DECIM_HPF_WNF_CTRL1, and
entry 2 (PDM1L, Decimator 1) sets .freg =3D CS42L43_DECIM_HPF_WNF_CTRL2.

When ADC2 or PDM1L powers up individually on CS42L43, cs42l43_mic_ev()
adjusts the HPF register of the wrong decimator channel.

Furthermore, when stereo ADC1 + ADC2 (shifts 0 and 1) or PDM1L + PDM1R
(shifts 2 and 3) power up together in a coalesced DAPM sequence via
dapm_seq_run_coalesced(), SND_SOC_DAPM_PRE_PMU runs for both widgets
before SND_SOC_DAPM_POST_PMU runs for either. Because both widgets in the
pair point info->freg to the same register, the first PRE_PMU caches the
user setting and writes the temporary fval, and the second PRE_PMU then
reads that temporary fval into priv->decim_cache[w->shift][1]. When
SND_SOC_DAPM_POST_PMU runs, the second widget writes fval back to
info->freg, permanently overwriting the user's HPF configuration while the
other decimator channel's HPF was never adjusted.

>  	{
> +		.freg =3D CS42L43_DECIM_HPF_WNF_CTRL2,
>  		.vreg =3D CS42L43_DECIM_VOL_CTRL_CH1_CH2,
>  		.vmask =3D CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
>  	},
>  	{
> +		.freg =3D CS42L43_DECIM_HPF_WNF_CTRL3,
>  		.vreg =3D CS42L43_DECIM_VOL_CTRL_CH3_CH4,
>  		.vmask =3D CS42L43_DECIM3_VD_RAMP_MASK | CS42L43_DECIM3_MUTE_MASK,
>  	},
>  	{
> +		.freg =3D CS42L43_DECIM_HPF_WNF_CTRL4,
>  		.vreg =3D CS42L43_DECIM_VOL_CTRL_CH3_CH4,
>  		.vmask =3D CS42L43_DECIM4_VD_RAMP_MASK | CS42L43_DECIM4_MUTE_MASK,
>  	}
> @@ -1770,26 +1777,32 @@ struct decim_info cs42l43_decim_info[] =3D {
> =20
>  struct decim_info cs42l43b_decim_info[] =3D {

[Severity: Low]
This isn't a bug, but should cs42l43_decim_info[] and
cs42l43b_decim_info[] (and the info pointer in cs42l43_mic_ev()) be
marked static const since they are only used inside sound/soc/codecs/cs42l4=
3.c
and have no external declarations?

[ ... ]

> @@ -1819,11 +1836,27 @@ static int cs42l43_mic_ev(struct snd_soc_dapm_wid=
get *w,
>  			return ret;
>  		}
> =20
> +		ret =3D regmap_read(cs42l43->regmap, info->freg,
> +				  &priv->decim_cache[w->shift][1]);
> +		if (ret) {
> +			dev_err(priv->dev,
> +				"Failed to cache decimator filter settings: %d\n", ret);
> +			return ret;
> +		}
> +
>  		regmap_update_bits(cs42l43->regmap, info->vreg,  info->vmask, vval);
> +		regmap_update_bits(cs42l43->regmap, info->freg, fmask, fval);
>  		break;
>  	case SND_SOC_DAPM_POST_PMU:
> +		if (priv->decim_pre_pmu) {
> +			msleep(150);
> +			priv->decim_pre_pmu =3D false;
> +		}
> +
> +		regmap_update_bits(cs42l43->regmap, info->freg, fmask,
> +				   priv->decim_cache[w->shift][1]);
>  		regmap_update_bits(cs42l43->regmap, info->vreg, info->vmask,
> -				   priv->decim_cache[w->shift]);
> +				   priv->decim_cache[w->shift][0]);
>  		break;

[Severity: Medium]
Should the Decimator 1..6 HPF Switch and Decimator 1..6 HPF Corner
Frequency controls in cs42l43_controls[] and cs42l43_b_controls[] also use
cs42l43_dapm_get_volsw() / cs42l43_dapm_put_volsw() and
cs42l43_dapm_get_enum() / cs42l43_dapm_put_enum() to hold the DAPM mutex?

The other controls whose register bits are cached in SND_SOC_DAPM_PRE_PMU
and restored in SND_SOC_DAPM_POST_PMU (Decimator 1..6 Switch, Decimator
1..6 Ramp Up/Down, and EQ Switch) serialize kcontrol access under
snd_soc_dapm_mutex_lock(dapm).

Because the HPF controls in cs42l43_controls[] and cs42l43_b_controls[]
use plain SOC_SINGLE and SOC_ENUM:

	SOC_SINGLE("Decimator 1 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL1,
		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
	...
	SOC_ENUM("Decimator 1 HPF Corner Frequency", cs42l43_dec1_hpf_corner),

can a userspace read or write during the 150ms msleep() window in
cs42l43_mic_ev() observe the temporary fval override or have a newly
written HPF setting clobbered when SND_SOC_DAPM_POST_PMU restores
priv->decim_cache[w->shift][1]?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102155440.3995=
136-1-ckeepax@opensource.cirrus.com?part=3D3
