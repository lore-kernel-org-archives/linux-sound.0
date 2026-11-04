Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793367;
	b=Leytl2P6fj8uSpu+d26yi3dsx6pW1EcISNbrO2ze4A0Amng5jB+4nqgz0YAmjRSr0fzM
	 qzURgF/L62q7jC0+DB5gqEUZYxzrDRfPNdqV/m6NZRiD+SO2KwestHd/wvo03Yhxkjn9Z
	 LXnWkJuAzCpx6SfZ/WaqPmej60ulorTKcs5SCFqxPD6rBUBd0VdU9nHE4KIyQYzDuoY/N
	 OCgVaYomPfo7pGlLvWLjjFU6j5bJ79fypSqNMGGukns8VFqOpLesvCWNYumz6SiSxZDs+
	 0Vz9HE2G3ccw8bcNuDhrBMlFW7XdmzhXhELGHMAIgaJWnKGHuLF0a1XEBfw1OSgKpQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793367;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3Z+J6zTwOue/WyhMWlH2EQxFTfzHjqxqklWPoKUJkxE=;
	b=KsCRnlKluZctQ9qcHWxhiyxu/uXCCIKhpZYexqJlGID27HNiD744VXIR+pwSwXqf5nWR
	 GWMEOa7XECOzkqFLjT8ZKMD4cMXJFAaxbHrDr/sw0y62vHblB5EBMd5GyEPCSvtq8kXTI
	 yJDkhkLNHUrAFTV5zYPq0OO2gZCHbrvR9R44XOKRYYxdDgcXUNiSwxtUq2BBSQRgAL3r/
	 Zz/gBd/Q5QFgT/a9Ag6+5aX5Wn2+zq67UgDVaDLikTIJgYc7QsD1GzLNOVopPO3OhBIPN
	 0jtvFFFVnqfxFXIhMjqWClWTIWTokbbnFdTKT8XThy1VqxlsZZCKylJDlsddQX4Lxpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NZXxVFsb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24275606A326;
	Wed,  4 Nov 2026 11:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NZXxVFsb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03C21F000C1;
	Wed,  4 Nov 2026 11:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793793367;
	bh=3Z+J6zTwOue/WyhMWlH2EQxFTfzHjqxqklWPoKUJkxE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NZXxVFsboZQ9i6wav6VayYf0Uj/DEK428CnCaG8eU+Xf5UvYHRU5nGsUF+iAGQwsl
	 lB5Z50Pgks/Jz/C8Yzlx8rpIzUk/Wl2KB+jWJNXKAb8fRtRucf6xsFCgkG51NkrmJJ
	 XBA1svZkEQimwZ7qrNTGWOL0AOyJ5gAa5tqkxtCkPQrrj7mIgnT/Xd6WBw3N2FP3Op
	 eVCvInG4hfiKMg4OIOwiiYfUhjvPYEDPMB0iNY9oLvaJPiIFyTqO7zli78Oc4pT+WG
	 zQjiI3vzWYGx9pXBRL/xnmHtyK1jcQEerBGxx2xRkJJ9xqKpgMJV/xCFF6t9V3QLEz
	 VpHxTVXBzJUnA==
Message-ID: <sashiko-outbox-197215@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 RESEND 2/4] ASoC: cdns: Add Cadence I2S-SC controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104113342.3660269-3-joakim.zhang@cixtech.com>
References: <20261104113342.3660269-1-joakim.zhang@cixtech.com>
 <20261104113342.3660269-3-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 11:56:06 +0000
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
- [Medium] ASoC: cdns: unbalanced clock enable in cdns_i2s_sc_probe() and o=
n unbind
- [Medium] ASoC: cdns: wrong devres ordering for IRQ and PM in cdns_i2s_sc_=
probe()
- [Medium] ASoC: cdns: cdns_i2s_sc_set_tdm_slot() rejects slots =3D=3D 0 to=
 disable TDM
--

commit 8608e01e4e2208a8765fd0b404456a7e98eea27f
Author: Joakim Zhang <joakim.zhang@cixtech.com>

ASoC: cdns: Add Cadence I2S-SC controller driver

This commit adds an ASoC driver for the Cadence I2S-SC controller found in
the CIX SKY1 audio subsystem, supporting full-duplex stereo I2S and up to
16-slot TDM modes with dmaengine PCM and runtime/system PM support.

> diff --git a/sound/soc/cdns/cdns-i2s-sc.c b/sound/soc/cdns/cdns-i2s-sc.c
> new file mode 100644
> index 0000000000000..160a0ec573d72
> --- /dev/null
> +++ b/sound/soc/cdns/cdns-i2s-sc.c

[ ... ]

> +static int cdns_i2s_sc_set_tdm_slot(struct snd_soc_dai *cpu_dai, unsigne=
d int tx_mask,
> +				    unsigned int rx_mask, int slots, int slot_width)
> +{
> +	struct cdns_i2s_sc_priv *i2s_sc_priv =3D snd_soc_dai_get_drvdata(cpu_da=
i);
> +	struct device *dev =3D i2s_sc_priv->dev;
> +
> +	dev_dbg(dev, "tx_mask =3D 0x%x, rx_mask =3D 0x%x, slots =3D %d, slot_wi=
dth =3D %d\n",
> +		tx_mask, rx_mask, slots, slot_width);
> +
> +	if (slots < 1 || slots > 16) {
> +		dev_err(i2s_sc_priv->dev, "TDM mode supports 1 to 16 slots\n");
> +		return -EINVAL;
> +	}
> +
> +	if (slot_width < 8 || slot_width > 32) {
> +		dev_err(i2s_sc_priv->dev, "TDM slot width must be 8 to 32 bits\n");
> +		return -EINVAL;
> +	}
> +
> +	if ((tx_mask >> slots) || (rx_mask >> slots)) {
> +		dev_err(i2s_sc_priv->dev, "TDM slot mask has bits outside the slots\n"=
);
> +		return -EINVAL;
> +	}
> +
> +	i2s_sc_priv->tdm_config.slots =3D slots;
> +	i2s_sc_priv->tdm_config.slot_width =3D slot_width;
> +	i2s_sc_priv->tdm_config.rx_mask =3D rx_mask;
> +	i2s_sc_priv->tdm_config.tx_mask =3D tx_mask;
> +
> +	i2s_sc_priv->is_tdm_mode =3D true;
> +
> +	return 0;
> +}

[Severity: Medium]
As reported by Sashiko on v4 [1], snd_soc_dai_set_tdm_slot() allows callers
to disable TDM mode by passing slots =3D=3D 0, in which case tx_mask, rx_ma=
sk,
and slot_width are ignored.

In cdns_i2s_sc_set_tdm_slot(), checking slots < 1 rejects slots =3D=3D 0 wi=
th
-EINVAL, and nothing ever clears i2s_sc_priv->is_tdm_mode back to false.

Should cdns_i2s_sc_set_tdm_slot() handle !slots by setting
i2s_sc_priv->is_tdm_mode =3D false and returning 0?

[ ... ]

> +static int cdns_i2s_sc_probe(struct platform_device *pdev)
> +{
> +	struct cdns_i2s_sc_priv *i2s_sc_priv;
> +	struct resource *res;
> +	void __iomem *base;
> +	int i, irq, ret;

[ ... ]

> +	pm_runtime_get_noresume(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	ret =3D devm_pm_runtime_enable(&pdev->dev);
> +	if (ret) {
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return dev_err_probe(&pdev->dev, ret, "Failed to enable runtime PM\n");
> +	}
> +
> +	ret =3D cdns_i2s_sc_clks_enable(i2s_sc_priv);
> +	if (ret) {
> +		pm_runtime_put_noidle(&pdev->dev);
> +		return dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
> +	}
> +
> +	cdns_i2s_sc_rst(i2s_sc_priv);
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		ret =3D irq;
> +		goto err_disable_clks;
> +	}
> +	i2s_sc_priv->irq =3D irq;
> +
> +	ret =3D devm_request_irq(&pdev->dev, irq, cdns_i2s_sc_isr, 0,
> +			       dev_name(&pdev->dev), i2s_sc_priv);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> +		goto err_disable_clks;
> +	}

[Severity: Medium]
As reported by Sashiko on v4 [2], devm_pm_runtime_enable() is registered in
cdns_i2s_sc_probe() before cdns_i2s_sc_clks_enable(), before
i2s_sc_priv->irq is initialized, and before devm_request_irq().

Because devres cleans up in reverse registration order, devm_request_irq()
will free the IRQ before devm_pm_runtime_enable() disables runtime PM on
unbind or probe failure. While runtime PM is still enabled after the IRQ is
freed, can cdns_i2s_sc_runtime_suspend() or cdns_i2s_sc_runtime_resume() run
and call disable_irq() or enable_irq() on i2s_sc_priv->irq?

Similarly, if cdns_i2s_sc_clks_enable(), platform_get_irq(), or
devm_request_irq() fails in cdns_i2s_sc_probe(), pm_runtime_put_noidle()
drops the usage count to zero while runtime PM is still enabled and marked
active, before devres disables runtime PM.

Would it be safer to request the IRQ and enable clocks (for example via
devm_clk_get_enabled() or a devm action) before enabling runtime PM?

> +
> +	/*
> +	 * Let pm_runtime_put_sync() disable the clocks, and take regcache effe=
ct.
> +	 * If CONFIG_PM is not enabled, the clock will stay powered.
> +	 */
> +	pm_runtime_put_sync(&pdev->dev);
> +
> +	ret =3D devm_snd_soc_register_component(&pdev->dev, &cdns_i2s_sc_compon=
ent,
> +					      &cdns_i2s_sc_dai, 1);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to register soc componen=
t\n");
> +
> +	return 0;
> +
> +err_disable_clks:
> +	cdns_i2s_sc_clks_disable(i2s_sc_priv);
> +	pm_runtime_put_noidle(&pdev->dev);
> +	return ret;
> +}

[ ... ]

> +static struct platform_driver cdns_i2s_sc_driver =3D {
> +	.probe =3D cdns_i2s_sc_probe,
> +	.driver =3D {
> +		.name =3D DRV_NAME,
> +		.pm =3D pm_ptr(&cdns_i2s_sc_pm_ops),
> +		.of_match_table =3D cdns_i2s_sc_of_match,
> +	},
> +};

[Severity: Medium]
As reported by Sashiko on v4 [3], clk_hst and clk_i2s are acquired with
devm_clk_get() and enabled via cdns_i2s_sc_clks_enable() in
cdns_i2s_sc_probe(), relying on pm_runtime_put_sync() to invoke
cdns_i2s_sc_runtime_suspend() and disable the clocks.

When CONFIG_PM is disabled, or when runtime suspend is prevented (such as
via sysfs power/control), pm_runtime_put_sync() leaves clk_hst and clk_i2s
prepared and enabled. If devm_snd_soc_register_component() then fails, or
when cdns_i2s_sc_driver is unbound while runtime-active or with !CONFIG_PM
(since there is no .remove callback and devm_pm_runtime_enable() only calls
pm_runtime_disable()), won't clk_hst and clk_i2s remain prepared and
enabled, leaking their clock enable references?

Also, on the error paths in cdns_i2s_sc_probe() before pm_runtime_put_sync(=
),
should pm_runtime_set_suspended(&pdev->dev) be called to undo
pm_runtime_set_active(&pdev->dev)?

[1] https://lore.kernel.org/r/20261019122048.1107179-3-joakim.zhang@cixtech=
.com
[2] https://lore.kernel.org/r/20261019122048.1107179-3-joakim.zhang@cixtech=
.com
[3] https://lore.kernel.org/r/20261019122048.1107179-3-joakim.zhang@cixtech=
.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104113342.3660=
269-1-joakim.zhang@cixtech.com?part=3D2
