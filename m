Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793083;
	b=eOmaEH3OvKW9GvEdCRjm9UNffyGO2AayJ8g5wZhtwZZczXMa/4nSrBguEbiaDWA0/EuG
	 SUAIhSk13cdOdp2awm/HVSMK/+z4jlXa6Pqqj7uKzHbE+40gsqs6P3KwaMl3tHcjdOhMN
	 8a1qgwIzXgCAHWFb4Wp7wPNv/k9+gosdY+Q4J/vRnah2CaoTYHqOpS8v79e+CmykUljoK
	 6t1GGsUBCGcRS5nYjunEMBsnHhKHIuNx6n/YqXX7YGcXEI6fJWh3OSgb48kf7NPz3ObiM
	 BRS1eWznw/UQTDbWP6MMTo3hgQUK5+z2poNPQpzuZeK74surzjo7NzRBZ+sUwoyLkmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793083;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ju0RIGfC6l+B1CQpzdwbFgWzPoOZtIYQ6xB05gUuuAw=;
	b=ZdCrdW04WUkrIHP4fc3KHxR/wgZ0cVgj3ccouR34FKn7oUl8+y7xlrjC5AZvxDf4Q7fW
	 WQ7N6+KEHCpadpgz5t0x1JdBYZdAXLBxi4zQ5g6Alrmr48ZmPOaPZQId5wHuApYbTOb/i
	 0nYZSnzdFtWJOhSjYBp54BhpAwsZ3vKQve6qQhKi5talu47BFYtctPqwwRL2RpWlyzTn1
	 07U0Ho7O/9AhgPXh2vhc+THJ0FqA7Bm3fchmjnUE2FbXHGUtS0wBpgQhy4C2H1cV9GuTv
	 SZtVBo/pgEQwWMDKuDVhzzX4NbhbhzM9JDRl5q2Mc+D/nvagrELCRZdTGs4esUrD4Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="E/XKE0Yv";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E4A606A31B;
	Wed,  4 Nov 2026 11:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E/XKE0Yv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726551F00A16;
	Wed,  4 Nov 2026 11:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793793082;
	bh=ju0RIGfC6l+B1CQpzdwbFgWzPoOZtIYQ6xB05gUuuAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E/XKE0YvMWArkNayHl1n+uN0gUY07JAakbaHCngcu5q+n9dgXRcnsMDoNtLC+l9AK
	 9F9nQbZDcAIWDCptfms+75Xi7Sj3Z/93rntR3tEDG/ygUuG6Z19APqj8ZGQx/fLlRb
	 YB5cdX/qwTlq2JKfaowaSfp09vllBfJXVZh1ZadV1I/HhfbRNl8eatq1YjTrcY9Q0w
	 sWquRhgqPwiO1TJ1Xe8Yv0hrWFXAxZfpU4iKs62ckEhe02DqRao2q9BNB7SInFn9X3
	 8RJTa6kH/X9u7ebL8/CcBYNM/+Fy4v2d5ioRkYC9UafYP7DO3/Eacsfwlt6YRY++8O
	 wgEaTEMNBoq0Q==
Message-ID: <sashiko-outbox-197212@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 RESEND 4/4] ASoC: cdns: Add Cadence I2S-MC controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104113342.3660269-5-joakim.zhang@cixtech.com>
References: <20261104113342.3660269-1-joakim.zhang@cixtech.com>
 <20261104113342.3660269-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 11:51:22 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] ASoC: cdns: shared clk_i2s reparented in cdns_i2s_mc_hw_params()=
 while active
- [Medium] ASoC: cdns: clock and runtime PM leak in cdns_i2s_mc_probe() and=
 on unbind
- [Medium] ASoC: cdns: devm_pm_runtime_enable() ordered before IRQ in cdns_=
i2s_mc_probe()
- [Medium] ASoC: cdns: inverted DATA_WS_DEL bit for DSP_A and DSP_B in cdns=
_i2s_mc_set_fmt()
--

commit c19d92817bbbcb2d8d57a40b0aa755f6cec87691
Author: Joakim Zhang <joakim.zhang@cixtech.com>

ASoC: cdns: Add Cadence I2S-MC controller driver

This commit adds an ASoC driver for the Cadence I2S-MC multi-channel
controller in the CIX SKY1 audio subsystem, supporting up to 16 channels
across 8 configurable data pins with independent transmit and receive DAIs.

> diff --git a/sound/soc/cdns/cdns-i2s-mc.c b/sound/soc/cdns/cdns-i2s-mc.c
> new file mode 100644
> index 0000000000000..defbb93adfe76
> --- /dev/null
> +++ b/sound/soc/cdns/cdns-i2s-mc.c

[ ... ]

> +static int cdns_i2s_mc_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int=
 fmt)
> +{
> +	struct cdns_i2s_mc_priv *i2s_mc_priv =3D snd_soc_dai_get_drvdata(cpu_da=
i);
> +	struct device *dev =3D i2s_mc_priv->dev;
> +	u32 ctrl =3D 0, dev_conf =3D 0;
> +
> +	dev_dbg(dev, "fmt =3D 0x%x\n", fmt);

[ ... ]

> +		/* DAI hardware audio formats */
> +		switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +		case SND_SOC_DAIFMT_I2S:
> +			dev_conf |=3D I2S_DEV_CONF_TRAN_I2S_ALIGN_LR;
> +			dev_conf &=3D ~(I2S_DEV_CONF_TRAN_APB_ALIGN_LR |
> +				      I2S_DEV_CONF_TRAN_DATA_WS_DEL |
> +				      I2S_DEV_CONF_TRAN_WS_DSP_MODE);
> +			break;
> +		case SND_SOC_DAIFMT_RIGHT_J:
> +			dev_conf |=3D I2S_DEV_CONF_TRAN_DATA_WS_DEL;
> +			dev_conf &=3D ~(I2S_DEV_CONF_TRAN_I2S_ALIGN_LR |
> +				      I2S_DEV_CONF_TRAN_APB_ALIGN_LR |
> +				      I2S_DEV_CONF_TRAN_WS_DSP_MODE);
> +			break;
> +		case SND_SOC_DAIFMT_LEFT_J:
> +			dev_conf |=3D I2S_DEV_CONF_TRAN_I2S_ALIGN_LR | I2S_DEV_CONF_TRAN_DATA=
_WS_DEL;
> +			dev_conf &=3D ~(I2S_DEV_CONF_TRAN_APB_ALIGN_LR |
> +				      I2S_DEV_CONF_TRAN_WS_DSP_MODE);
> +			break;
> +		case SND_SOC_DAIFMT_DSP_A:
> +			dev_conf |=3D I2S_DEV_CONF_TRAN_I2S_ALIGN_LR | I2S_DEV_CONF_TRAN_DATA=
_WS_DEL |
> +				    I2S_DEV_CONF_TRAN_WS_DSP_MODE;
> +			dev_conf &=3D ~I2S_DEV_CONF_TRAN_APB_ALIGN_LR;
> +			break;
> +		case SND_SOC_DAIFMT_DSP_B:
> +			dev_conf |=3D I2S_DEV_CONF_TRAN_I2S_ALIGN_LR | I2S_DEV_CONF_TRAN_WS_D=
SP_MODE;
> +			dev_conf &=3D ~(I2S_DEV_CONF_TRAN_APB_ALIGN_LR |
> +				      I2S_DEV_CONF_TRAN_DATA_WS_DEL);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}

[ ... ]

> +		/* DAI hardware audio formats */
> +		switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +		case SND_SOC_DAIFMT_I2S:
> +			dev_conf |=3D I2S_DEV_CONF_REC_I2S_ALIGN_LR;
> +			dev_conf &=3D ~(I2S_DEV_CONF_REC_APB_ALIGN_LR | I2S_DEV_CONF_REC_DATA=
_WS_DEL |
> +				      I2S_DEV_CONF_REC_WS_DSP_MODE);
> +			break;
> +		case SND_SOC_DAIFMT_RIGHT_J:
> +			dev_conf |=3D I2S_DEV_CONF_REC_DATA_WS_DEL;
> +			dev_conf &=3D ~(I2S_DEV_CONF_REC_I2S_ALIGN_LR |
> +				      I2S_DEV_CONF_REC_APB_ALIGN_LR |
> +				      I2S_DEV_CONF_REC_WS_DSP_MODE);
> +			break;
> +		case SND_SOC_DAIFMT_LEFT_J:
> +			dev_conf |=3D I2S_DEV_CONF_REC_I2S_ALIGN_LR | I2S_DEV_CONF_REC_DATA_W=
S_DEL;
> +			dev_conf &=3D ~(I2S_DEV_CONF_REC_APB_ALIGN_LR | I2S_DEV_CONF_REC_WS_D=
SP_MODE);
> +			break;
> +		case SND_SOC_DAIFMT_DSP_A:
> +			dev_conf |=3D I2S_DEV_CONF_REC_I2S_ALIGN_LR | I2S_DEV_CONF_REC_DATA_W=
S_DEL |
> +				    I2S_DEV_CONF_REC_WS_DSP_MODE;
> +			dev_conf &=3D ~I2S_DEV_CONF_REC_APB_ALIGN_LR;
> +			break;
> +		case SND_SOC_DAIFMT_DSP_B:
> +			dev_conf |=3D I2S_DEV_CONF_REC_I2S_ALIGN_LR | I2S_DEV_CONF_REC_WS_DSP=
_MODE;
> +			dev_conf &=3D ~(I2S_DEV_CONF_REC_APB_ALIGN_LR | I2S_DEV_CONF_REC_DATA=
_WS_DEL);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}

[Severity: Medium]
Are the data-to-word-select delay bits in dev_conf inverted between the
dsp_a and dsp_b cases in cdns_i2s_mc_set_fmt() for both the transmit and
receive DAIs?

In the standard i2s case above, clearing the delay bit in dev_conf selects a
1-bit-clock delay after the word-select transition, whereas in the left_j
and right_j cases, setting the delay bit selects a 0-bit-clock delay.

However, the dsp_a case sets the delay bit (0-bit delay) and the dsp_b case
clears it (1-bit delay), which shifts transmitted and received samples by
one bit clock cycle relative to the standard dsp_a (1-bit delay) and dsp_b
(0-bit delay) timings.

[ ... ]

> +static int cdns_i2s_mc_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params,
> +				 struct snd_soc_dai *cpu_dai)
> +{
> +	struct cdns_i2s_mc_priv *i2s_mc_priv =3D snd_soc_dai_get_drvdata(cpu_da=
i);
> +	struct device *dev =3D i2s_mc_priv->dev;
> +	u32 rate, sample_rate =3D 0;
> +	u32 slots, slot_width, resolution, ctrl;
> +	unsigned long i2s_clk_rate;
> +	u8 pin_tx_num, pin_rx_num;
> +	struct clk *clk_parent;
> +	bool is_master_mode;
> +	int ret;
> +
> +	rate =3D params_rate(params);
> +	slot_width =3D i2s_mc_priv->devtype_data->data_width;
> +	dev_dbg(dev, "rate =3D %d, slot_width =3D %d\n", rate, slot_width);
> +
> +	/* switch clk mux to select the appropriate clk parent */
> +	if (rate % 8000 =3D=3D 0) {
> +		/* Sampling rate is a multiple of 8KHz, select "audio-clk0" */
> +		clk_parent =3D i2s_mc_priv->clks[AUDIO_CLK0];
> +
> +		ret =3D clk_set_parent(i2s_mc_priv->clk_i2s, clk_parent);
> +	} else if (rate % 11025 =3D=3D 0) {
> +		/* Sampling rate is a multiple of 11.025KHz, select "audio-clk2" */
> +		clk_parent =3D i2s_mc_priv->clks[AUDIO_CLK2];
> +
> +		ret =3D clk_set_parent(i2s_mc_priv->clk_i2s, clk_parent);
> +	} else {
> +		dev_err(i2s_mc_priv->dev, "Invalid sample rate\n");
> +		return -EINVAL;
> +	}

[Severity: Medium]
As reported by Sashiko on v4 [1], what happens if playback on i2s-mc-aif1
and capture on i2s-mc-aif2 are configured concurrently with sample rates fr=
om
different clock families (for example, 48 kHz on one DAI and 44.1 kHz on the
other)?

Because cdns_i2s_mc_dai[] exposes two independent DAIs sharing the single
i2s_mc_priv->clk_i2s clock without cross-DAI rate family constraints or an
active-stream check, calling clk_set_parent(i2s_mc_priv->clk_i2s, clk_paren=
t)
in cdns_i2s_mc_hw_params() switches the parent clock underneath an already
active stream on the other DAI.

Can this corrupt the running stream's sample rate divider in the sample rate
register and violate the minimum functional-clock to bit-clock ratio?

[ ... ]

> +static int cdns_i2s_mc_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	pm_runtime_get_noresume(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	ret =3D devm_pm_runtime_enable(&pdev->dev);
> +	if (ret) {
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return dev_err_probe(&pdev->dev, ret, "Failed to enable runtime PM\n");
> +	}
> +
> +	ret =3D cdns_i2s_mc_clks_enable(i2s_mc_priv);
> +	if (ret) {
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
> +	}
> +
> +	cdns_i2s_mc_rst(i2s_mc_priv);
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		ret =3D irq;
> +		goto err_disable_clks;
> +	}
> +	i2s_mc_priv->irq =3D irq;
> +
> +	ret =3D devm_request_irq(&pdev->dev, irq, cdns_i2s_mc_isr, 0,
> +			       dev_name(&pdev->dev), i2s_mc_priv);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> +		goto err_disable_clks;
> +	}

[Severity: Medium]
As reported by Sashiko on v4 [2], since devm_pm_runtime_enable() is
registered before i2s_mc_priv->irq is initialized and before
devm_request_irq() is called in cdns_i2s_mc_probe(), devres teardown on
driver unbind or late probe failure will free the interrupt before disabling
runtime power management.

During teardown, can cdns_i2s_mc_runtime_resume() or
cdns_i2s_mc_runtime_suspend() still run and call enable_irq() or
disable_irq() on i2s_mc_priv->irq after it has already been freed?

> +
> +	/*
> +	 * Let pm_runtime_put_sync() disable the clocks, and take regcache effe=
ct.
> +	 * If CONFIG_PM is not enabled, the clock will stay powered.
> +	 */
> +	pm_runtime_put_sync(&pdev->dev);
> +
> +	ret =3D devm_snd_soc_register_component(&pdev->dev, &cdns_i2s_mc_compon=
ent,
> +					      cdns_i2s_mc_dai, ARRAY_SIZE(cdns_i2s_mc_dai));
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to register soc componen=
t\n");
> +
> +	return 0;
> +
> +err_disable_clks:
> +	cdns_i2s_mc_clks_disable(i2s_mc_priv);
> +	pm_runtime_put_noidle(&pdev->dev);
> +	return ret;
> +}

[Severity: Medium]
As reported by Sashiko on v4 [3], does cdns_i2s_mc_probe() leak the prepared
and enabled clock references on i2s_mc_priv->clk_hst and
i2s_mc_priv->clk_i2s when runtime power management is disabled in the kernel
configuration or prevented via sysfs?

Specifically:

1. If devm_snd_soc_register_component() fails when pm_runtime_put_sync() did
not suspend the device, cdns_i2s_mc_probe() returns without calling
cdns_i2s_mc_clks_disable(i2s_mc_priv).

2. Because cdns_i2s_mc_driver defines no remove callback and registers no
devm action to disable the clocks, unbinding the driver while the device is
runtime-active or when power management is disabled leaves clk_hst and
clk_i2s enabled when devm_clk_get() releases them.

3. On the earlier error paths after pm_runtime_set_active(&pdev->dev),
including err_disable_clks, pm_runtime_set_suspended(&pdev->dev) is not
called, leaving the runtime power management state marked active with clocks
disabled.

[1] https://lore.kernel.org/r/20261019122048.1107179-5-joakim.zhang@cixtech=
.com
[2] https://lore.kernel.org/r/20261019122048.1107179-5-joakim.zhang@cixtech=
.com
[3] https://lore.kernel.org/r/20261019122048.1107179-5-joakim.zhang@cixtech=
.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104113342.3660=
269-1-joakim.zhang@cixtech.com?part=3D4
