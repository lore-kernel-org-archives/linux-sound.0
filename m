Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374020;
	b=gx7YDgUlMDWvW47HCeJnpqNlyzEoYV6kT7xwBREWzbDY38Z413vWsnbOEMpcc+wANp6V
	 mzu74UQwlJvWhT5zZr96fDvYqpUGYvC1lUVnE/6rlc4vfB0khWOkioJHysaCKUiGzmFTw
	 vdEmVe0qSOss+en13kjpP7wqZsl+T5J8UpThIVxgjX7Y4d9r+bFOHCyLps6xPLG0zTQMT
	 nrujeCLvz9uPYsxSUXJR3UtZbjNx435Z6BOgvo//lsAna1HcBxJeDp+CUdFltDVdsspBp
	 vp4UjhhGIIX3e+jdOtP3nzoBFcIMGxcrynkmt/MBpr5HDb7pKbqidQTu0l/y+PYdv1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374020;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=N0v5nXBZfI8O+QQrc7EqPa6QKyWLYSSW58gSr57aZ2s=;
	b=k1/tWOW4moBhicGjARu+NiihBD8i40V6yr5mQZkp9+vOaCnkTPxHR636V3H2BZTC0Zop
	 S0stnutSaQs9v3dlD3Nq9/qJb3eQSWMNZNHT9rncwegfyxNA1KEUj1gyHjeOxz9TBecFD
	 +I13sQFfOA239GZDH98GaWY/O4V92uiGeLyfzqlFQ0CmLf8cIvAJoAijiYXjxJfI6afAt
	 39AcTcwSuIy0DEs7pWVrG5uLP7SmKK1Pym7tuTN/CaL8nJlcDF+ZVVy8nRGJKOVkC5zEz
	 q5CysfovRPY/eLCawzMS8xYaJa6XB0mUA7INNQePr6x7wlVTdwUrdvASX+al0acVP3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="T8Be/oZ9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0C4606A335;
	Sun, 22 Nov 2026 19:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T8Be/oZ9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0377C1F000CA;
	Sun, 22 Nov 2026 19:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795374019;
	bh=N0v5nXBZfI8O+QQrc7EqPa6QKyWLYSSW58gSr57aZ2s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T8Be/oZ9qOhL/wQfG43zbzq58/8WoBvqk/HiP5RBtZxf+b/1us2eEeyvUTso2agEj
	 hPqyad1CL3iw198EYRqVDqrSYte55EJqkDEkqii9P0IERrf38CVcV9tPPs9IheThkZ
	 r2134eZiNijZzWciMnYjDLHKCIzeyy/0F2iLho0+wO8mYTukJMXQGP0iBAQO8WLYOp
	 6ZjJeX4nrdRutzwNVHnN/UZqt1DEWuoTA83xxmoCO0CFuYYKQnqOIjzexUxUW5MTRN
	 sZVpE3+mDxOsjEUtcVQDqkVazRWIPCk5I2++sz6WMi/aZxAGea5gq/EG4t7SxdbiOI
	 t9+BdrAgd6hqg==
Message-ID: <sashiko-outbox-228218@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 8/9] ASoC: qcom: lpass-tx-macro: Add support for Hawi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-add_shikra_support-v7-8-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
 <20261123-add_shikra_support-v7-8-7bf3aa089fc6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 19:00:17 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] ASoC: qcom: lpass-tx-macro: missing lpr clock handling in
  tx_macro_probe()
- [Medium] ASoC: qcom: lpass-tx-macro: no-op ADPT disable in
  tx_macro_enable_dec()
- [Medium] ASoC: qcom: lpass-tx-macro: missing RX_SWR_MIC routes and
  broken mux check
- [Low] ASoC: qcom: lpass-tx-macro: mixing __free() with goto in
  tx_macro_probe()
- [Low] ASoC: qcom: lpass-tx-macro: stale REGCACHE_MAPLE claim in commit
  message
--

commit f5a6e2235e16debb6b0952a1f083110a90b3bd33
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: qcom: lpass-tx-macro: Add support for Hawi

This commit adds support for the Bolero v4.0 (LPASS v15.0) TX macro on
Qualcomm Hawi platforms, including v4.0 register defaults, ADPT control
handling, and version-specific DAPM widgets and routes.

> Add the v4.0 register defaults and extend the regmap accessors and
> maximum register offset only for the v4.0 match data. Use REGCACHE_MAPLE
> for the TX macro regmap since the register defaults are sparse and the
> v4.0 layout extends the register range.

[Severity: Low]
This isn't a bug, but the commit message says this patch switches the TX
macro regmap to REGCACHE_MAPLE, whereas that change was already made in
8ed9306885eb ("ASoC: codecs: lpass-tx-macro: switch cache to
REGCACHE_MAPLE").

> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-t=
x-macro.c
> index 6f2af4907cb84..6cc700db7d04e 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c

[ ... ]

> @@ -480,6 +504,26 @@ static struct reg_default tx_defaults[] =3D {
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

> @@ -975,6 +1044,10 @@ static int tx_macro_enable_dec(struct snd_soc_dapm_=
widget *w,
> =20
>  	switch (event) {
>  	case SND_SOC_DAPM_PRE_PMU:
> +		/* Disable the ADPT block before enabling the decimator */
> +		if (tx->data->has_adpt)
> +			snd_soc_component_write_field(component, CDC_ADPT0_ADPT_CTRL,
> +						      CDC_TX_ADPT_CTRL_EN_MASK, 0x0);

[Severity: Medium]
Does snd_soc_component_write_field() ever write to CDC_ADPT0_ADPT_CTRL
here?

tx_4_0_defaults[] initializes CDC_ADPT0_ADPT_CTRL to 0x00 in the
REGCACHE_MAPLE cache, and the register is not volatile and is never
written elsewhere.  Clearing CDC_TX_ADPT_CTRL_EN_MASK via
snd_soc_component_write_field() sees the cached value already at 0x00 and
becomes a no-op, and regcache_sync() also skips registers whose cached
value matches their default, leaving the ADPT block in its hardware reset
state (compare lpass-va-macro.c, where va_4_0_defaults sets
CDC_VA_CDC_ADPT0_ADPT_CTRL to 0x51).

[ ... ]

> @@ -2073,6 +2149,418 @@ static const struct snd_soc_dapm_route tx_audio_m=
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
> +	{"TX SMIC MUX0", NULL, "TX_SWR_CLK"},

[Severity: Medium]
Are DAPM routes missing for the "RX_SWR_MIC" option added in
adc_mux_text_v9_3[]?

Neither tx_audio_map[] nor tx_audio_map_v15[] defines a route for
"RX_SWR_MIC" on TX DEC0 MUX through TX DEC7 MUX, so selecting "RX_SWR_MIC"
disconnects all inputs to the mux and prevents the decimator widget from
powering up.

In addition, tx_macro_enable_dec() and is_amic_enabled() test the register
value with "& SWR_MIC" (where SWR_MIC is 1):

sound/soc/codecs/lpass-tx-macro.c:tx_macro_enable_dec() {
    ...
		adc_mux_reg =3D CDC_TX_INP_MUX_ADC_MUXn_CFG1(decimator);
		if (snd_soc_component_read(component, adc_mux_reg) & SWR_MIC) {
    ...
}

Because "RX_SWR_MIC" is at enum index 3, that bitwise check also matches
when "RX_SWR_MIC" is selected and treats it as "SWR_MIC".

[ ... ]

> @@ -2296,6 +2797,9 @@ static int tx_macro_probe(struct platform_device *p=
dev)
>  	struct device_node *np =3D dev->of_node;
>  	struct tx_macro *tx;
>  	void __iomem *base;
> +	struct reg_default *reg_defaults __free(kfree) =3D NULL;
> +	struct regmap_config *reg_config __free(kfree) =3D NULL;
> +	size_t def_count;
>  	int ret, reg;
> =20
>  	tx =3D devm_kzalloc_obj(dev, *tx);
> @@ -2350,7 +2854,40 @@ static int tx_macro_probe(struct platform_device *=
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
goto-based error handling and declares reg_config =3D NULL at the top of the
function instead of defining and initializing it at its kmemdup() call (or
converting lpass_macro_pds_init() cleanup to devm_add_action_or_reset() as
in lpass-rx-macro.c).

[ ... ]

> @@ -2528,6 +3077,9 @@ static const struct of_device_id tx_macro_dt_match[=
] =3D {
>  	}, {
>  		.compatible =3D "qcom,sm8550-lpass-tx-macro",
>  		.data =3D &lpass_ver_11,
> +	}, {
> +		.compatible =3D "qcom,hawi-lpass-tx-macro",
> +		.data =3D &lpass_ver_15,
>  	}, {

[Severity: High]
Does tx_macro_probe() fail to acquire the "lpr" clock on
qcom,hawi-lpass-tx-macro?

The Devicetree binding for qcom,hawi-lpass-tx-macro added in 5979f967ae4f
("ASoC: dt-bindings: qcom: Add Hawi LPASS macro codecs") specifies
clock-names as "mclk", "lpr", "dcodec", and "fsgen", replacing "macro"
with "lpr".  However, tx_macro_probe() only looks up the optional "macro"
clock:

sound/soc/codecs/lpass-tx-macro.c:tx_macro_probe() {
    ...
	tx->macro =3D devm_clk_get_optional(dev, "macro");
	if (IS_ERR(tx->macro))
		return dev_err_probe(dev, PTR_ERR(tx->macro), "unable to get macro clock\=
n");
    ...
}

Since 8af1ecd5b81c ("ASoC: codecs: lpass-tx-macro: manage clocks in
runtime PM") switched the driver from of_pm_clk_add_clks() to explicit
clock management, the "lpr" vote clock is never acquired or enabled on
Hawi, leaving LPASS CPU subsystem sleep enabled during register accesses.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-add_shikra=
_support-v7-0-7bf3aa089fc6@oss.qualcomm.com?part=3D8
