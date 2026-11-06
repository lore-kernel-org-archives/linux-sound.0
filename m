Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970054;
	b=WJDC3CE6Ys2typewGBKf69KupLBYM2mEU8KYj5Zu9cjdDRZQpEZO2l3q6YpN1rW9k8BT
	 RRYWkGB6CGFVLeGb2sMPIGWwB8+CbLKvwitx45hocikZy+Z9YzeF42JSlWVkf7X+Y3mXY
	 gYQMYySZIvK+eEkVlYM/TBcm40Vuq4b6Ht/N7YeYyk87A3uzJ8qcZv/c/pHrfC+6DjlIp
	 7g2ZVUpxx4TzyNOnJUs5LSiL8uFlVPMgF1DdxDmUoXbN0PtAsu0pmtdcvSVv4In10aaGh
	 hq1i76UkpiVJzwNH1jGEl7o2XeFmtLHwECPl+KokTLvvk0MTeAHMv4RVu6dRDsEwg4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970054;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ahna9oY486CBntf6C8KnmE4+1gd6IrLfCyRHjwYgd+8=;
	b=Xx4pazdzQv9ZnYiTdq8weIOU5kP9HSEgqmC7vJknzvhqmbqwwJOf3313X3NL2N0C7JmD
	 dpVbHQFc1gMBZMs/C88lHksoovBS18KzbaOOEWPiklUmLz9HxmfEyY9OroR4oXJNZU0WX
	 aSMp2Q+suBVM3xsBaAeVP7UQQQSBD2ZiAePKRCoGX/CcFw8LFUCBzaG9+Wcw8uwYjIwbR
	 txxo9gIPr8cfgMY2zymADFu24x/wehNgTsCN2J+b7OFQ4BJnt37u30UAG25KBeMkoFCle
	 fTxzU4nhnK2BcF8LBwRIR5jhD99b4RW4udlZzf6fRgxyyoHL9saS8L8Xe5GjeKf1s7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a1ZaRf/8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6692D606A32C;
	Fri,  6 Nov 2026 13:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a1ZaRf/8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F153F1F0089F;
	Fri,  6 Nov 2026 13:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793970054;
	bh=ahna9oY486CBntf6C8KnmE4+1gd6IrLfCyRHjwYgd+8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a1ZaRf/8RyWtFcBYtkgbI3/PqLqgGRkFqKn3Dzj28Sva5WbWuo+zzrNSOfgyW2jsZ
	 DjKPGXuk439euSxssQFSa1o/FSgfzlBcVspBXXL7scUKbY1ErkTp7b26S0XSeUM3HM
	 nZj3958uvMJ25yeVscJGdNic7UYZ6v1FTLkswkIgaF57JTNHzT35iCseyeVJ3vonKr
	 qbUvpNcnsPXsSyyZgLJzjiElGu8WH102zn3N+ukE3lFmRCdC93+9odXjO9E5wrXaYx
	 Tnc+q2s9ffN2VBLyqUpjn/4C9Y6asVQP8QpsyzJrqoAklM5LCo2cDm8eGUzlwV9KUR
	 kAwSrEDe9z7Ig==
Message-ID: <sashiko-outbox-201426@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 v6 8/9] ASoC: qcom: lpass-tx-macro: Add support for
 Bolero v4.0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-add_shikra_support-v6-8-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-8-2cda302237cc@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 13:00:53 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] ASoC: qcom: lpass-tx-macro: no-op ADPT disable in
  tx_macro_enable_dec()
- [Medium] ASoC: qcom: lpass-tx-macro: missing DAPM routes for
  RX_SWR_MIC in v15 map
- [Low] ASoC: qcom: lpass-tx-macro: mixing __free() with goto in
  tx_macro_probe()
- [Low] ASoC: qcom: lpass-tx-macro: stale REGCACHE_MAPLE claim in commit
  message
--

commit 359688a973454b992ccd5b2a57890a5f9b9973cf
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: qcom: lpass-tx-macro: Add support for Bolero v4.0

This commit adds Bolero v4.0 TX macro support for Hawi, including register
defaults, regmap extensions, decimator and port-select DAPM widgets and
routes, and ADPT control disabling.

> Add the v4.0 register defaults and extend the regmap accessors and
> maximum register offset only for the v4.0 match data. Use REGCACHE_MAPLE
> for the TX macro regmap since the register defaults are sparse and the
> v4.0 layout extends the register range.

[Severity: Low]
This isn't a bug, but tx_regmap_config already switched to REGCACHE_MAPLE in
commit 8ed9306885eb ("ASoC: codecs: lpass-tx-macro: switch cache to
REGCACHE_MAPLE") and this patch does not change .cache_type.

> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-t=
x-macro.c
> index 6deaaabe43afa..6480a6c9032e3 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c

[ ... ]

> @@ -434,6 +458,26 @@ static struct reg_default tx_defaults[] =3D {
>  	{ CDC_TX7_TX_PATH_SEC6, 0x00},
>  };
> =20
> +static const struct reg_default tx_4_0_defaults[] =3D {
> +	{ CDC_TX_INP_MUX_ADC_MUX0_CFG2, 0x00},
> +	{ CDC_TX_INP_MUX_ADC_MUX1_CFG2, 0x00},
> +	{ CDC_TX_INP_MUX_ADC_MUX2_CFG2, 0x00},
> +	{ CDC_TX_INP_MUX_ADC_MUX3_CFG2, 0x00},
> +	{ CDC_TX_INP_MUX_ADC_MUX4_CFG2, 0x00},
> +	{ CDC_TX_INP_MUX_ADC_MUX5_CFG2, 0x00},
> +	{ CDC_TX_INP_MUX_ADC_MUX6_CFG2, 0x00},
> +	{ CDC_TX_INP_MUX_ADC_MUX7_CFG2, 0x00},
> +	{ CDC_TX0_TX_PATH_CFG2, 0x03},
> +	{ CDC_TX1_TX_PATH_CFG2, 0x03},
> +	{ CDC_TX2_TX_PATH_CFG2, 0x03},
> +	{ CDC_TX3_TX_PATH_CFG2, 0x03},
> +	{ CDC_TX4_TX_PATH_CFG2, 0x03},
> +	{ CDC_TX5_TX_PATH_CFG2, 0x03},
> +	{ CDC_TX6_TX_PATH_CFG2, 0x03},
> +	{ CDC_TX7_TX_PATH_CFG2, 0x03},
> +	{ CDC_ADPT0_ADPT_CTRL, 0x00},
> +};

[ ... ]

> @@ -929,6 +998,10 @@ static int tx_macro_enable_dec(struct snd_soc_dapm_w=
idget *w,
> =20
>  	switch (event) {
>  	case SND_SOC_DAPM_PRE_PMU:
> +		/* Disable the ADPT block before enabling the decimator */
> +		if (tx->data->has_adpt)
> +			snd_soc_component_write_field(component, CDC_ADPT0_ADPT_CTRL,
> +						      CDC_TX_ADPT_CTRL_EN_MASK, 0x0);

[Severity: Medium]
Does snd_soc_component_write_field() ever write to CDC_ADPT0_ADPT_CTRL here?

tx_4_0_defaults initializes the non-volatile cache entry for
CDC_ADPT0_ADPT_CTRL to 0x00, and nothing in the driver ever writes a
non-zero value to it.  Both snd_soc_component_write_field() and
regcache_sync() see that the cached value already matches 0x00 and skip the
register write, leaving the ADPT block in its hardware reset state during
capture.  Should tx_4_0_defaults record the actual non-zero hardware reset
value of CDC_ADPT0_ADPT_CTRL (as lpass-va-macro.c does in va_4_1_defaults)?

[ ... ]

> @@ -2027,6 +2103,418 @@ static const struct snd_soc_dapm_route tx_audio_m=
ap_v9_2[] =3D {
>  	{"TX SMIC MUX7", "SWR_MIC11", "TX SWR_INPUT11"},
>  };
> =20
> +static const char * const adc_mux_text_v9_3[] =3D {
> +	"MSM_DMIC", "SWR_MIC", "ANC_FB_TUNE1", "RX_SWR_MIC"
> +};

[ ... ]

> +static const struct snd_soc_dapm_route tx_audio_map_v15[] =3D {
> +	/* DEC0 */
> +	{"TX DEC0 MUX", "SWR_MIC", "TX SMIC MUX0"},

[Severity: Medium]
Are DAPM routes missing for the "RX_SWR_MIC" option in tx_audio_map_v15?

adc_mux_text_v9_3 adds "RX_SWR_MIC" to TX DEC0 MUX through TX DEC7 MUX, but
neither tx_audio_map nor tx_audio_map_v15 defines a route with the
"RX_SWR_MIC" control for any decimator.  When userspace selects "RX_SWR_MIC"
on a decimator mux, DAPM finds no connected input path, so the decimator
widget never powers up and tx_macro_enable_dec() is not called.

[ ... ]

> @@ -2250,6 +2751,9 @@ static int tx_macro_probe(struct platform_device *p=
dev)
>  	struct device_node *np =3D dev->of_node;
>  	struct tx_macro *tx;
>  	void __iomem *base;
> +	struct reg_default *reg_defaults __free(kfree) =3D NULL;
> +	struct regmap_config *reg_config __free(kfree) =3D NULL;
> +	size_t def_count;
>  	int ret, reg;
> =20
>  	tx =3D devm_kzalloc(dev, sizeof(*tx), GFP_KERNEL);
> @@ -2304,7 +2808,40 @@ static int tx_macro_probe(struct platform_device *=
pdev)
>  		}
>  	}
> =20
> -	tx->regmap =3D devm_regmap_init_mmio(dev, base, &tx_regmap_config);
> +	reg_config =3D kmemdup(&tx_regmap_config, sizeof(*reg_config), GFP_KERN=
EL);
> +	if (!reg_config) {
> +		ret =3D -ENOMEM;
> +		goto err;
> +	}

[Severity: Low]
This isn't a bug, but tx_macro_probe() mixes __free(kfree) variables with
goto-based error handling and declares reg_config as NULL at the top of the
function instead of defining and initializing it at kmemdup().  Registering
lpass_macro_pds_exit_action() via devm_add_action_or_reset() (as
rx_macro_probe() does in sound/soc/codecs/lpass-rx-macro.c) would avoid
mixing __free() with goto err.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-add_shikra=
_support-v6-0-2cda302237cc@oss.qualcomm.com?part=3D8
