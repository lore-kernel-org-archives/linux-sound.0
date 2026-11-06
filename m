Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969203;
	b=hjZLnmFCcGOnagFZ5/nYU2+Gy7knihVo1faI8NvbbSeX+mjYT9FCR6SPHDsMxNVXFTAy
	 zudNqtV8xU2xnLhJk9AP1NsNY3wFzF0B4ZN8XUFhw/6yV7v2YslH4Y+PWsGq1XWsMrabj
	 BUY6Lx0WtMqL09CGG0uKKo4J3SNOKOqa578OHQ2iei9e4PGtY44xAOdzyNKObxp9Q4w72
	 Tfp+kK8EbjSJB8vq0cyAAS0PJLHMEm+KQD37PxMD4hLVF51KVcS8Sf1hJrISQONMicQ7G
	 PdeDqEvKseYIWZQRAGhzR9z4XophKewJK3QH4wxKPNNIqPgkQJWCEjrfA4rGtQaweUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969203;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HUYID9OYVV79v5S1XOZwimXzL325GAo5Ig5is7Ew82k=;
	b=NOtPAYQqshyBA0M12kl+ph5rYURvl3aMQ+8B0FvhCftA8Pn0CEBBvAAFcCoc5ZcnruI6
	 Tv0fzSdxZXEVgHmPsRbMwGBgOCTdIpeOF4hnXhwgmKjEUbEKx+mRyzFZKGyoqrPcafDSQ
	 IxdeBRp9occWvks2nsvy/uQWTl5wwNfbRXtcxEwee4losc1RRknuVRvq5dRS4MA/6FhNy
	 JcdFdGUTqxMNP0FtH3lxZYKjpkslCit8AJ9KJ5haMn1/TeFouSKi7Y0KtHeXoVxEE9vgB
	 stpaOjXtwrO6uyRCXGYhOWOiz7ikH2oUMez3bMz61GTzb5Hd5j/zHc5fzXIo+teRlWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WaG9eFT2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64902606A32F;
	Fri,  6 Nov 2026 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WaG9eFT2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5DC81F008A1;
	Fri,  6 Nov 2026 12:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969203;
	bh=HUYID9OYVV79v5S1XOZwimXzL325GAo5Ig5is7Ew82k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WaG9eFT2ER/Zy/o130RcR8hkIpZl3EpiqI7v8YOC0CLi1kdIrOuq5HvbefwYB18Xo
	 MBa5GL+8v6e2Sn7pQss19RJibZIzklYn72xqOHG3iarBsllXMCOFw4+ap9/ctkxAEd
	 Ccwa52IUyHV+OeTA0oN1DbrRNvEWLVwvSQe4UawxNGVC6y3e9Rn+w5DjGDBnx1xvbq
	 SXw/xluG3raHhWTzpw/hICpLRSSex6yLbV4xNV6TYZ6BhaspUAZRTvQD3sskV4WWuZ
	 Co2DliU3roWmncXEFyksufvsMittBGrEMVTeZK0MfwOldvNhgySEdsvKjlzD/J+E9e
	 CAaGXvvKDG1tQ==
Message-ID: <sashiko-outbox-201411@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 v6 4/9] ASoC: qcom: lpass-va-macro: Add shikra
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-add_shikra_support-v6-4-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-4-2cda302237cc@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 12:46:42 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] ASoC: qcom: lpass-va-macro: missing input mux defaults in
  va_4_1_defaults
--

commit f5d496a0928cc1f25e90cbab9d135b94a6556cb6
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: lpass-va-macro: Add shikra compatible

This commit adds compatible support and register configuration for the
Qualcomm Shikra LPASS VA macro (LPASS codec v4.1), including adaptive
filter (ADPT) blocks and a dedicated regmap default table.

> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-v=
a-macro.c
> index 03d6434a4a126..db395674312c8 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c

[ ... ]

> @@ -357,6 +407,119 @@ static const struct reg_default va_defaults[] =3D {
>  	{ CDC_VA_TX3_TX_PATH_SEC6, 0x00},
>  };
> =20
> +static const struct reg_default va_4_1_defaults[] =3D {
> +	/* VA macro */
> +	{ CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
> +	{ CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
> +	{ CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},
> +	{ CDC_VA_TOP_CSR_TOP_CFG0, 0x00},
> +	{ CDC_VA_TOP_CSR_DMIC0_CTL, 0x00},
> +	{ CDC_VA_TOP_CSR_DMIC1_CTL, 0x00},
> +	{ CDC_VA_TOP_CSR_DMIC2_CTL, 0x00},
> +	{ CDC_VA_TOP_CSR_DMIC3_CTL, 0x00},
> +	{ CDC_VA_TOP_CSR_DMIC_CFG, 0x80},
> +	{ CDC_VA_TOP_CSR_DEBUG_BUS, 0x00},
> +	{ CDC_VA_TOP_CSR_DEBUG_EN, 0x00},
> +	{ CDC_VA_TOP_CSR_TX_I2S_CTL, 0x0C},
> +	{ CDC_VA_TOP_CSR_I2S_CLK, 0x00},
> +	{ CDC_VA_TOP_CSR_I2S_RESET, 0x00},
> +	{ CDC_VA_TOP_CSR_CORE_ID_0, 0x00},
> +	{ CDC_VA_TOP_CSR_CORE_ID_1, 0x00},
> +	{ CDC_VA_TOP_CSR_CORE_ID_2, 0x00},
> +	{ CDC_VA_TOP_CSR_CORE_ID_3, 0x00},
> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL0, 0xEE},
> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL1, 0xEE},
> +	{ CDC_VA_TOP_CSR_SWR_MIC_CTL2, 0xEE},
> +	{ CDC_VA_TOP_CSR_SWR_CTRL, 0x06},
> +	/* VA core */
> +	{ CDC_VA_TX0_TX_PATH_CTL, 0x04},

[Severity: High]
Should va_4_1_defaults include CDC_VA_INP_MUX_ADC_MUX0_CFG0 through
CDC_VA_INP_MUX_ADC_MUX3_CFG1 like va_defaults does?

va_4_1_regmap_config uses REGCACHE_MAPLE seeded from va_4_1_defaults, and
va_macro_runtime_suspend() puts the regmap into cache-only mode.  Because
those eight mux registers back the VA DEC0..3 MUX and VA DMIC MUX0..3 DAPM
widgets, reading or updating those controls while the device is runtime
suspended misses in the maple cache and fails with -EBUSY.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-add_shikra=
_support-v6-0-2cda302237cc@oss.qualcomm.com?part=3D4
