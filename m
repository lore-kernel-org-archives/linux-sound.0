Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793509312;
	b=1/ONRVt5v2tzwpUcSe+Oieq3eVXMFdXjZ343zwnnopDJVA4/bmFxkQslz6+DsQ3eG2WQ
	 NgLzxgyNw2Nkax6AUioqI3ILNgspO7BRqOWA80cq+53taOtb1rG7MeL47LIjgbpbZeppq
	 4nwsh+x3Yb05JRp3pQvyRfQ6QDbX8h0THaBZbODztpt7i6Qax3YpVWoCCyF4qu12GQkeB
	 LZreyx56XE2zRcj0vTtkcB4gbzcrDuE81YL++VZt2QiggVdWC25cbp1M5rpFV1yCAqvKv
	 m1T4w/vdy6KTR7KInP0k7qqqVkonEU8X/l8+U5CdRK7rFgWb1a5U+b5SbSVEEdUYpqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793509312;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8c9g1YvoXl3dQdZ0csiY0Wy4dGb44DT9EIeLEFJBY+o=;
	b=22XseI8to1QA1FPz4HILSM2lsJT1W7u73mQnQwa+3Bscwnr85AGfOf8XGXqsn/pEmegm
	 hPbbysLvx5C6wnsnQpVnQrQ2RshFtQvUpwUEAScbw0sNlRpNKcZZjfsfXBYDjd39p3BLH
	 Kn2UP5Hv+P2FYH6t0qnEbhArCnajCG6fcWT17VhKetMpwTO8/3LzphwMhCoJcDxH/PUuQ
	 dYvn4LztB/9Oe7B+2FiuHeaq24rDd9gphNOUCu6se/jcFRd/UZIyG3scGMz0mg2UyotNs
	 BgEQ4DcixC7TPVLCOFG6pzsfRtxR7rpcb9f1WY4Ji/8wu4MuWrNXDzMHft97IlaVKnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A5UIRtS0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B101606A324;
	Sun,  1 Nov 2026 05:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A5UIRtS0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5881F000C1;
	Sun,  1 Nov 2026 05:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793509311;
	bh=8c9g1YvoXl3dQdZ0csiY0Wy4dGb44DT9EIeLEFJBY+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A5UIRtS083nw+bknX3uuX9NoYxkgt5bURxV1wmQ2phJHUfzQasGhuJWe7WAFlTz+e
	 k8da3eP1FI7SP4KMfJ77sHxRDNemGD5PW9kBbx9NpwN1w/oM7PpKE+CmO8Zx48DFyx
	 uv6fhJ53haXVa5sTmuxD5YpGFQ4aopxrLU2hVbPUMIjkSLOBMC16S34yXFD2MUSYn+
	 DyA9RFG5glEtmX0oxPHOaPHIJZpgUDbihVaqH3yBbxlbWySlF79Yes0QcmbS4Z2fHy
	 gVUcl872Vjm2qgxxhUjZwWc+Qd3ABt3npoC1K/7aXEfDzHbNU7dU4wgxww1BKZhVdk
	 m0ZZx19FFy0VA==
Message-ID: <sashiko-outbox-192275@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: restore RK3308 codec
 detection resources
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xing Zheng" <zhengxing@rock-chips.com>, linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261101044149.2018744-4-zhengxing@rock-chips.com>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-4-zhengxing@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 05:01:50 +0000
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
- [High] ASoC: codecs: rk3308: dangling dac_analog and component pointers o=
n unbind
- [Medium] ASoC: codecs: rk3308: rk3308_codec_adc_event() overwrites MIC mu=
te state
- [Medium] ASoC: codecs: rk3308: leaked devm_kmemdup() widget array on comp=
onent probe
--

commit a099049aa9bf21b04f0558d74e37572e81c21ec8
Author: Xing Zheng <zhengxing@rock-chips.com>

ASoC: codecs: rk3308: restore audio and headphone support

This commit restores the vendor analog enable/disable sequences, reference
current ramps, headphone detection, and output routing for the RK3308 audio
codec across revisions A, B, and C.

> diff --git a/sound/soc/codecs/rk3308_codec.c b/sound/soc/codecs/rk3308_co=
dec.c
> index a3d41cd8150d0..1894e1a93fbf8 100644
> --- a/sound/soc/codecs/rk3308_codec.c
> +++ b/sound/soc/codecs/rk3308_codec.c

[ ... ]

> +static int rk3308_codec_adc_event(struct snd_soc_dapm_widget *w,
> +				  struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->da=
pm);
> +	struct rk3308_codec_priv *rk3308 =3D snd_soc_component_get_drvdata(comp=
onent);
> +	unsigned int grp =3D w->shift;
> +	unsigned int zerocross;
> +
> +	if (event =3D=3D SND_SOC_DAPM_PRE_PMU) {
> +		regmap_update_bits(rk3308->regmap, RK3308_ADC_ANA_CON07(grp),
> +				   RK3308_ADC_CH1_IN_SEL_MSK | RK3308_ADC_CH2_IN_SEL_MSK,
> +				   RK3308_ADC_CH1_IN_MIC | RK3308_ADC_CH2_IN_MIC);
> +		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON00(grp),
> +				RK3308_ADC_CH1_MIC_UNMUTE | RK3308_ADC_CH2_MIC_UNMUTE);

[Severity: Medium]
Does rk3308_codec_adc_event() overwrite the user-configured microphone mute
state when capture starts?

Bits 3 (RK3308_ADC_CH1_MIC_UNMUTE) and 7 (RK3308_ADC_CH2_MIC_UNMUTE) of
RK3308_ADC_ANA_CON00(grp) directly back the MIC1..8 Capture Switch controls
in rk3308_codec_controls:

	SOC_SINGLE("MIC1 Capture Switch", RK3308_ADC_ANA_CON00(0), 3, 1, 0),
	SOC_SINGLE("MIC2 Capture Switch", RK3308_ADC_ANA_CON00(0), 7, 1, 0),

And rk3308_codec_initialize() already sets the initial unmuted default after
codec reset:

	/* Match the vendor analog defaults; controls remain adjustable. */
	for (grp =3D 0; grp < ADC_LR_GROUP_MAX; grp++)
		regmap_set_bits(rk3308->regmap, RK3308_ADC_ANA_CON00(grp),
				BIT(3) | BIT(7));

If userspace mutes a microphone channel via MIC1..8 Capture Switch while
capture is idle and then starts a capture stream, DAPM powers up the
ADC_CURRENT_EN12..78 supply widgets and runs rk3308_codec_adc_event() with
SND_SOC_DAPM_PRE_PMU, which unconditionally sets RK3308_ADC_CH1_MIC_UNMUTE |
RK3308_ADC_CH2_MIC_UNMUTE and clobbers the mute setting.

[ ... ]

> +static int rk3308_codec_add_widgets(struct snd_soc_component *component)
> +{
> +	struct snd_soc_dapm_widget *widgets;
> +	int i, grp, ret;
> +
> +	widgets =3D devm_kmemdup(component->dev, rk3308_codec_dapm_widgets,
> +			       sizeof(rk3308_codec_dapm_widgets), GFP_KERNEL);
> +	if (!widgets)
> +		return -ENOMEM;

[ ... ]

> +	ret =3D snd_soc_dapm_new_controls(snd_soc_component_to_dapm(component),
> +					widgets, ARRAY_SIZE(rk3308_codec_dapm_widgets));
> +	if (ret)
> +		return ret;

[Severity: Medium]
Does rk3308_codec_add_widgets() leak the widgets template array across
component probe cycles?

snd_soc_dapm_new_controls() -> snd_soc_dapm_new_control_unlocked() ->
dapm_cnew_widget() duplicates each widget individually with kmemdup() and
does not retain a pointer to the input widgets array after returning.

Because rk3308_codec_add_widgets() runs from the component probe callback
rk3308_codec_probe() and allocates widgets with devm_kmemdup() on the
underlying platform device (component->dev), the temporary array remains
allocated for the lifetime of the platform device and allocates another copy
on every sound card unbind/rebind or deferred probe cycle. Could this use
kmemdup() and kfree() (or __free(kfree)) instead?

[ ... ]

>  static int rk3308_codec_probe(struct snd_soc_component *component)
>  {
>  	struct rk3308_codec_priv *rk3308 =3D snd_soc_component_get_drvdata(comp=
onent);
> +	int ret;
> =20
> +	ret =3D rk3308_codec_add_widgets(component);
> +	if (ret)
> +		return ret;
>  	rk3308->component =3D component;
> +	rk3308->dac_output =3D 11;
> +	rk3308->output_routes_mask =3D 3;
> =20
>  	rk3308_codec_reset(component);
>  	rk3308_codec_initialize(rk3308);
> =20
> -	return 0;
> +	return rk3308_codec_add_mic_boost_controls(component);
>  }

[ ... ]

> +static void rk3308_codec_remove(struct snd_soc_component *component)
> +{
> +	struct rk3308_codec_priv *rk3308 =3D snd_soc_component_get_drvdata(comp=
onent);
> +
> +	rk3308_codec_set_jack(component, NULL, NULL);
> +	mutex_lock(&rk3308->io_lock);
> +	rk3308->component =3D NULL;
> +	mutex_unlock(&rk3308->io_lock);
> +}

[Severity: High]
Can rk3308->dac_analog and rk3308->component become dangling pointers across
sound card unbind/rebind or component probe failure?

In rk3308_codec_dac_event(), the driver caches the component's DAC_CURRENT_=
EN
DAPM widget pointer:

	rk3308->dac_analog =3D w;

When the sound card is unbound, snd_soc_component_remove() calls
rk3308_codec_remove() and then snd_soc_dapm_free(), which frees all DAPM
widgets belonging to the component. Neither rk3308_codec_remove() nor
rk3308_codec_probe() clears rk3308->dac_analog. If the card is rebound and
rk3308_codec_output_event() runs before rk3308_codec_dac_event(), it will
see a non-NULL rk3308->dac_analog and dereference the freed widget:

	if (!rk3308->dac_analog)
		return 0;
	...
	if (event =3D=3D SND_SOC_DAPM_PRE_PMD && !rk3308->dac_analog->new_power)
		return 0;

Additionally, in rk3308_codec_probe(), rk3308->component is set before
calling rk3308_codec_add_mic_boost_controls(component). If that call fails,
snd_soc_component_probe() aborts before marking the component as probed, so
rk3308_codec_remove() is not called during error cleanup and
rk3308->component is left pointing to an unprobed component.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101044149.2018=
744-1-zhengxing@rock-chips.com?part=3D3
