Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016448;
	b=st2i/sxfCBG6l1RzpwWcbEgTReYjvH72UXAPhGzydsZKOJrWEg3waQCyV4TL/iMALCfA
	 MzCYwhp0m2gFjtw65JFNthSCNNghCti9PTVo+9+uSTlZT8WAnjVAD2+tRTz3uctHcvoJ/
	 Kfw9pBDitsxlJS3D4o/WNjWM+rnaiWzjQZvwfBJYDZehJckO4N9Kkv20FPbUwdlTfgCF2
	 mqvWbSjo6Pn6o+/tDiV1PKV/ZlsKse+DRi/Y1U+A/35PLmcgWQy1w5WEPea1uUOYqeLeQ
	 wX3QWA3wjn5VdL8D7rzDDSVZCdhW1PUTqTa2TsnfK3MZkKyZ+0bArRPKlVJgXObCRxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016448;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VpsO41RD76eKQuHUBhcdxSN8uK9fkUxPfzIgNN4JEzg=;
	b=sQ3crMpSyaFM6w/2LGHGoApLA0eGLhPlnoV/hx3BXTHtItd4zl4HmAyXbNDSU/1FZxcS
	 +JeHc6pXBfDjeGDdSic6J+lLDq+BQuUWNC2O9PEIvCs0B/Oay67l2Z9q5VxyYbCIop6M9
	 BYVWKIcUyGMI88QWucaYteFm5PQAsTEoi+4SY+QBzDPuO84iNGhKs8V/oLWGF+mA4T/jI
	 DbjFR26IP94sh71ONySftOjiSUq5C8RERqW+SAFZ/BxiM+i/I0+AzsBPO2AYfvYa6Vlji
	 Bjz9yay88jecDAUuyy/hRkxaYINDjB4JNIgC8hEhgJsuZLB/XE/tqzZ6TKEv3ICAeBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jb4HoP1f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81708606A320;
	Wed, 18 Nov 2026 15:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jb4HoP1f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1EAD1F000C4;
	Wed, 18 Nov 2026 15:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795016448;
	bh=VpsO41RD76eKQuHUBhcdxSN8uK9fkUxPfzIgNN4JEzg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jb4HoP1f3/HC+Rvi7cx7Psbgg4UJyUoRGcUk4FKzoyJ1mgSnwKRKulhVkCC07IN6t
	 jfChFU3b020MO17u6kuB6HCyPBfpvFL8dLnhh7cYwBpR5ValvJc39PQqoJsOJLeAwY
	 RVNvTdD+38Aocs3ItUAyvVT+Cw2Ub1oKZQZ/+/w/KE67kSRJkQ0ZQVZrslx2AZ1de/
	 stKssU3PkFd1HsRmTCKdb3ejQksUIKhik7CtGMLTps324tMuxdSCNMq9E7AtxSSq/1
	 lToIWjDKzBJwwFHAIHryGlCZ7LxiN2sGjLicVeCFqaQUjBw41Q8LDt1QJcWUXbfPq7
	 uWU24HRCNkYMw==
Message-ID: <sashiko-outbox-221354@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/11] iio: adc: stm32-mdf: add digital filter device
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Moysan" <olivier.moysan@foss.st.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261118-upstream_mdf_v2-v2-5-7939d3c3720a@foss.st.com>
References: <20261118-upstream_mdf_v2-v2-0-7939d3c3720a@foss.st.com>
 <20261118-upstream_mdf_v2-v2-5-7939d3c3720a@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 15:40:47 +0000
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
- [Medium] iio: adc: stm32-mdf: unpropagated rsflt_bypass in
  stm32_mdf_adc_parse_of()
- [Medium] iio: adc: stm32-mdf: unbalanced kclk prepare count for
  filters in suspend
--

commit 7cf0176f9896de83d6274c225f454821ace01160
Author: Olivier Moysan <olivier.moysan@foss.st.com>

iio: adc: stm32-mdf: add digital filter device support

This commit introduces the STM32 MDF digital filter platform driver, regmap
configuration, and device tree parsing for filter parameters and BSMX serial
interface routing.

> diff --git a/drivers/iio/adc/stm32-mdf-adc.c b/drivers/iio/adc/stm32-mdf-=
adc.c
> new file mode 100644
> index 0000000000000..411af78911c91
> --- /dev/null
> +++ b/drivers/iio/adc/stm32-mdf-adc.c

[ ... ]

> +static int stm32_mdf_adc_parse_of(struct platform_device *pdev, struct s=
tm32_mdf_adc *adc)
> +{

[ ... ]

> +	/*
> +	 * In interleave mode the filters in range [1..n] share their configura=
tion with filter 0.
> +	 * In this case, use config from filter 0, instead of parsing DT.
> +	 */
> +	if (!MDF_IS_FILTER0(adc) && adc->fl_id < adc->mdf->nb_interleave) {
> +		adc->interleaved =3D true;
> +	} else {
> +		ret =3D stm32_mdf_get_filters_config(dev, adc);
> +		if (ret)
> +			return ret;
> +
> +		if (MDF_IS_FILTER0(adc) && adc->mdf->nb_interleave) {
> +			/* Filter 0 is the TRGO trigger source in interleave mode */
> +			adc->trgo =3D true;
> +			adc->interleaved =3D true;
> +			buf_size =3D adc->mdf->nb_interleave;
> +		}
> +	}

[Severity: Medium]
Does skipping stm32_mdf_get_filters_config() here leave adc->rsflt_bypass
unset on interleaved filters 1..n?

In commit "iio: adc: stm32-mdf: configure cic filters and sample rates",
stm32_mdf_adc_apply_filters_config() copies datsrc, cicmode, decim_cic,
nbdis, and hpf_cutoff from filter 0 to each interleaved filter, but never
copies adc->rsflt_bypass.  When st,rs-filter-bypass is set on filter 0,
interleaved filters 1..n will leave MDF_DFLTRSFR_RSFLTBYP cleared while
filter 0 bypasses the reshape filter, resulting in mismatched decimation
ratios and gain across the interleaved channels.

[ ... ]

> +static int stm32_mdf_adc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct stm32_mdf_adc *adc;
> +	struct iio_dev *iio;
> +	struct resource *res;
> +	void __iomem *base;
> +	int ret;
> +
> +	iio =3D devm_iio_device_alloc(dev, sizeof(*adc));
> +	if (!iio) {
> +		dev_err(dev, "Failed to allocate IIO device\n");
> +		return -ENOMEM;
> +	}
> +	iio->modes =3D INDIO_DIRECT_MODE;
> +
> +	adc =3D iio_priv(iio);
> +	adc->mdf =3D dev_get_drvdata(dev->parent);
> +
> +	platform_set_drvdata(pdev, iio);
> +
> +	base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(base))
> +		return dev_err_probe(dev, PTR_ERR(base), "Failed to get resource\n");
> +	adc->phys_addr =3D res->start;
> +
> +	adc->regmap =3D stm32_mdf_regmap_init(dev, adc->mdf->kclk, base, &stm32=
_mdf_regmap_cfg);

[Severity: Medium]
Does attaching adc->mdf->kclk to adc->regmap here leave kclk prepared
across system suspend?

stm32_mdf_regmap_init() calls regmap_mmio_attach_clk(), which prepares
mdf->kclk once for each probed filter.  However, stm32_mdf_core_suspend()
and stm32_mdf_core_resume() only unprepare and re-prepare kclk for the
core regmap and each entry in mdf->sitf_list (and stm32_mdf_adc_suspend()
in commit "iio: adc: stm32-mdf: add dma buffered acquisition support"
does not unprepare it either), preventing mdf->kclk from being unprepared
during system sleep whenever any filter is probed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-upstream_m=
df_v2-v2-0-7939d3c3720a@foss.st.com?part=3D5
