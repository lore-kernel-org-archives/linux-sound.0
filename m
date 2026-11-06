Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969760;
	b=g9wyqhTxoEDtPup3Uy8lZ9Y29UZLJ6Ki2LeAemYEnAEJi01mMcGtmhsAK6Bi4Z7q9Elk
	 OfDKCQVZHDaz5HVqbMtE0GuXvyXIqd2552tjLgX+9qRLH/dvyIYPPZQI1tm6IGY1Y1lzS
	 u9Jk4tElKJ6tJHWj0inTMieHzLcKrugvSpmGcHe7ideQmISL7kVs3IF0ZydFZFyiZnQkC
	 /s3EizcniICOuIR26dE7q8NMqiqncRsu7zdVTbjBW4ZILk2dx2q7lg72rw1qVOpTZ2mQu
	 Fvx0sz9GcaaVJ5oGDhh/k67O/lqzyAZ3wYqsU0wPNdmS6TaNO7tVZXK3mF68vp+Zw5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969760;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fjh7pNgYPKGM+B2YLRzXcq6LIbmTxUnRRadThHFSC9Y=;
	b=BUIkN3Q4Rz6XLzDoUBeqWw+Z+IeEH1sPW4F3Q6SkB4nLCeZ5fi4C89qNNMXAvFfZUQto
	 0jeCR1oBM1bNOWv4UDj7uRvdTCnpS5FLSGZmSt4rNBNxQhHkBoR2nHQFJM27K+O+OMimN
	 py8TTNj9MMmZmgHRK6AAPto26vfrHryN//9zZyZ+B5brTrLw20IAF+E6YqiYL180UVO/Z
	 iBNKJ13iHGGf4BXVdQM3PtB0kWEWjy4BZm/Hb9SLv3ThaCZcMEsnnzI/I98VU0vsHYGU8
	 3wIr7kH5z4MC3+IaA6I3DCH9JZYelDedx2cZ0Q+LUQHkQg1lBgpVCpNx7uhEK2M+bCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a/0UYIw1";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C118C606A326;
	Fri,  6 Nov 2026 12:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a/0UYIw1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2071B1F008A1;
	Fri,  6 Nov 2026 12:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969759;
	bh=fjh7pNgYPKGM+B2YLRzXcq6LIbmTxUnRRadThHFSC9Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a/0UYIw1S6XRencqLyQBG+pusWx2MXuydIIj4J4CA5hr3Hgz3VuZyALQpqw1urBo0
	 P0X2/Jar3ZdlXKr3+UIytiPk1lOQd+IbVe+LjCxXIVsS6bw4k8Lnyt7/YIa8Lskb60
	 yzUfItnQ6LorcCMhMLgOPZ4RpKl7cq2EzqUr4i5SOk8F82jTWUs9aNHW+KX3NhZ7F5
	 pf/usjpfnOFtcKzQBU/LeFUcB9QSq8ukmG3T5OpHkjPT7EUBwN07GKC6oYqWBWC6Mv
	 B1z4X/CL2aZwPF5TTgL33+tZrh2gH7a9/WAPhBZhl8eVsQxbdoHaWGDCxRMuLgGLS9
	 E5NG2l58ulxOg==
Message-ID: <sashiko-outbox-201424@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 v6 5/9] ASoC: qcom: lpass-va-macro: Add SoundWire
 microphone support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-add_shikra_support-v6-5-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-5-2cda302237cc@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 12:55:58 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] ASoC: qcom: lpass-va-macro: missing mux defaults in
  va_4_1_defaults
- [Medium] ASoC: qcom: lpass-va-macro: stale ADC_DMIC_SEL on live VA
  DECn MUX switch
--

commit f5c01e0bfec50d93943d485c6c12559471c5aee6
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: lpass-va-macro: Add SoundWire microphone support

This commit adds DAPM mux widgets, routes, and decimator source selection
logic to support SoundWire microphone (SMIC) inputs alongside DMIC inputs.

> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-v=
a-macro.c
> index db395674312c8..a113474040587 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -754,6 +754,16 @@ static int va_macro_mclk_event(struct snd_soc_dapm_w=
idget *w,
>  	return 0;
>  }
> =20
> +static bool is_amic_enabled(struct snd_soc_component *comp, int decimato=
r)
> +{
> +	u16 adc_mux_reg;
> +
> +	adc_mux_reg =3D CDC_VA_INP_MUX_ADC_MUX0_CFG1 +
> +		      VA_MACRO_ADC_MUX_CFG_OFFSET * decimator;
> +
> +	return snd_soc_component_read(comp, adc_mux_reg) & BIT(0);
> +}

[Severity: High]
Does this fail when the codec is runtime-suspended on LPASS v4.1 (Shikra)?

va_4_1_regmap_config uses REGCACHE_MAPLE backed by va_4_1_defaults[], which
unlike va_defaults[] omits CDC_VA_INP_MUX_ADC_MUX0_CFG0 through
CDC_VA_INP_MUX_ADC_MUX3_CFG1.  Once va_macro_runtime_suspend() enables
cache-only mode, reading or updating those uncached mux registers returns
-EBUSY.

When userspace configures va_smic0..3, va_dmic0..3, or va_dec0..3 while the
codec is idle, snd_soc_component_read() in is_amic_enabled() returns
(unsigned int)-EBUSY (0xfffffff0, where BIT(0) is 0),
snd_soc_dapm_put_enum_double() fails with -EBUSY without updating the mux,
and snd_soc_dapm_get_enum_double() reads 0xfffffff0 and extracts an
out-of-bounds enum index (15).

Adding CDC_VA_INP_MUX_ADC_MUX0_CFG0..CDC_VA_INP_MUX_ADC_MUX3_CFG1 to
va_4_1_defaults[] to match va_defaults[] would populate them in the maple
tree cache.

> +
>  static int va_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
>  				 struct snd_ctl_elem_value *ucontrol)
>  {
> @@ -763,20 +773,26 @@ static int va_macro_put_dec_enum(struct snd_kcontro=
l *kcontrol,
>  	struct soc_enum *e =3D (struct soc_enum *)kcontrol->private_value;
>  	unsigned int val;
>  	u16 mic_sel_reg;
> +	int decimator;
> +	bool smic_mux;
> =20
>  	val =3D ucontrol->value.enumerated.item[0];
> =20
>  	switch (e->reg) {
>  	case CDC_VA_INP_MUX_ADC_MUX0_CFG0:
> +		decimator =3D 0;
>  		mic_sel_reg =3D CDC_VA_TX0_TX_PATH_CFG0;
>  		break;
>  	case CDC_VA_INP_MUX_ADC_MUX1_CFG0:
> +		decimator =3D 1;
>  		mic_sel_reg =3D CDC_VA_TX1_TX_PATH_CFG0;
>  		break;
>  	case CDC_VA_INP_MUX_ADC_MUX2_CFG0:
> +		decimator =3D 2;
>  		mic_sel_reg =3D CDC_VA_TX2_TX_PATH_CFG0;
>  		break;
>  	case CDC_VA_INP_MUX_ADC_MUX3_CFG0:
> +		decimator =3D 3;
>  		mic_sel_reg =3D CDC_VA_TX3_TX_PATH_CFG0;
>  		break;
>  	default:
> @@ -785,10 +801,24 @@ static int va_macro_put_dec_enum(struct snd_kcontro=
l *kcontrol,
>  		return -EINVAL;
>  	}
> =20
> -	if (val !=3D 0)
> +	/*
> +	 * SMIC enums use shift 0 (lower nibble of CFG0), DMIC enums use
> +	 * shift 4 (upper nibble of CFG0). Use e->shift_l to distinguish them
> +	 * without relying on widget name comparisons.
> +	 */
> +	smic_mux =3D (e->shift_l =3D=3D 0);
> +
> +	/*
> +	 * Both muxes feed the same decimator and share ADC_DMIC_SEL, so only
> +	 * the one the decimator is routed through may program it. A write to
> +	 * the mux that is not part of the active path would otherwise switch
> +	 * the input domain of a running capture.
> +	 */
> +	if (val !=3D 0 && smic_mux =3D=3D is_amic_enabled(component, decimator))
>  		snd_soc_component_update_bits(component, mic_sel_reg,
>  					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
> -					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
> +					      smic_mux ? CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC :
> +							 CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
> =20
>  	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
>  }

[ ... ]

> @@ -995,6 +1024,18 @@ static int va_macro_enable_dec(struct snd_soc_dapm_=
widget *w,
> =20
>  	switch (event) {
>  	case SND_SOC_DAPM_PRE_PMU:
> +		/*
> +		 * ADC_DMIC_SEL is shared by the DMIC and the SoundWire mic
> +		 * mux, so its value depends on the order in which userspace
> +		 * restores the two controls. Program it from the resolved
> +		 * mux state of this decimator, which is what selects the
> +		 * input domain.
> +		 */
> +		snd_soc_component_update_bits(comp, dec_cfg_reg,
> +					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
> +					      is_amic_enabled(comp, decimator) ?
> +					      CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC :
> +					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);

[Severity: Medium]
Can switching VA DEC0 MUX..VA DEC3 MUX during an active capture leave
CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK stale?

If capture is running on VA_DMIC (e.g. DMIC0) and userspace pre-selects a
non-ZERO input on VA SMIC MUXn (e.g. SWR_MIC0), va_macro_put_dec_enum()
skips updating CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK because smic_mux does not
match is_amic_enabled().  When userspace then switches VA DECn MUX from
VA_DMIC to SWR_MIC, both input branches have connected endpoints, so
VA DECn MUX stays powered and SND_SOC_DAPM_PRE_PMU in va_macro_enable_dec()
does not fire.

Because va_dec0_mux..va_dec3_mux use plain SOC_DAPM_ENUM() without a custom
put callback or SND_SOC_DAPM_POST_REG event, CDC_VA_TX_PATH_ADC_DMIC_SEL_MA=
SK
remains stuck on the previous input domain for the rest of the stream.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-add_shikra=
_support-v6-0-2cda302237cc@oss.qualcomm.com?part=3D5
