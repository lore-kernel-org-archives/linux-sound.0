Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374089;
	b=fx0Yted33EckEwlxvVuR2qToDEybf4cDAOJZe7SXZh0ueqxC3wEtkOj0hsPzFuSz0RLi
	 CU+JNcOXjPVXeZ7lqGFYc9ldRkWcJ1Cw/ZWlhYPMV8jKBQS8MerFvwO/TTWF6LRgdShsl
	 Op5hC3GoWcxd1YqvLMD9RMYYkd60hMrM8EJtAQAvZAV8ybEbe9Ez3T2tXvxwVmvJaP4Wb
	 hUUhPBQtksvlHWaE9F0GfAttZziDEz4AQK/gVpg8jmDNDl3110YA4Xh9p52/XHr/0Pe/F
	 5luOaTykZQw2FvpwRIjdOhVASFWE+4RxnEcB2cv//wGRS/x8aLUMdXsuleY+I31cByw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374089;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=j7+ZkBlJLRc3GQvod5W5lC36Q88YLIu7SUgPhKAEXlM=;
	b=kTE2wCmt3RmOlL9rFz0VM/sI3uVrgoiyWWjfZ79gFLRFmINlgkh6KwJdBZGSm8XpkMAG
	 QMplXhi7/hAXB5JF8Gk6CjZO4MJaad3uulEcQAtPEJ/HhKID5p6gRdIo3wDBycVu1QcK+
	 mn8J15/+vqlQ9Rh24K/V+Nt8FKKPRNQH5ZPIimwpaCUx1vDsCSW5TO1t0gCWh6H0iTh32
	 bgpshty0OsoIY5qQ0qqbig2XzE1NrHGF7Tr98ELHltUVEIpybK75hRS6GAYirOe0MQpGL
	 b0Mcq5oYpwxf3iaXPfZ1SpJ8KCsfy2Vd641TBQNYco4EhvrvFUVdtpHLkZuPPisl3kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ORrPD2nd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB893606A32A;
	Sun, 22 Nov 2026 19:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ORrPD2nd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 389A41F000CA;
	Sun, 22 Nov 2026 19:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795374089;
	bh=j7+ZkBlJLRc3GQvod5W5lC36Q88YLIu7SUgPhKAEXlM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ORrPD2ndw6+tQ1SqEFGHkUdw5/y6uXxfWPA2I/eYs1jf9qPNKx0uPJcP12oi33DdX
	 IlSEivRLcXH46VV44fW9e8LaJK5lsahurL13NqhCL624igNGMJcJ9+D1KvHY6Z//Xs
	 zXKS5wza/kWolLNx3i092vt66E2A+WvqgLQMOfSYLEAkJxYorgyuJQR6+Lv9++vwir
	 PvhsDbO/xFYSCQqvP+0EN0rCjbIDnQfBS2ZqNazhcXnour6ydzRhZzvpochwc03u1V
	 KraAHKq48/SUfnipd0mzGKtCSOK/4drqTHlLx99C4z4cUMm9PruJf/hPJgIqMJyRKO
	 OvTYjmUl4w4nA==
Message-ID: <sashiko-outbox-228220@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/9] ASoC: qcom: lpass-va-macro: Add shikra
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-add_shikra_support-v7-4-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
 <20261123-add_shikra_support-v7-4-7bf3aa089fc6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 19:01:27 +0000
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
- [Low] ASoC: qcom: lpass-va-macro: missing version cross-check in
  va_macro_probe()
- [Low] ASoC: qcom: lpass-va-macro: duplicate base defaults in
  va_4_0_defaults
--

commit 49c489f9da02e60f046ebb7c9e18f77c8725a603
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: lpass-va-macro: Add shikra compatible

This commit adds Shikra VA macro match data, LPASS codec v4.0 adaptive
filter (ADPT) register definitions and defaults, and frame sync counter
bypass handling.

> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-v=
a-macro.c
> index af8308eacb0ba..2401006387445 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c

[ ... ]

> @@ -396,6 +448,127 @@ static const struct reg_default va_defaults[] =3D {
>  	{ CDC_VA_TX3_TX_PATH_SEC6, 0x00},
>  };
> =20
> +static const struct reg_default va_4_0_defaults[] =3D {
> +	/* VA macro */
> +	{ CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
> +	{ CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
> +	{ CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},

[ ... ]

> +	{ CDC_VA_TX3_TX_PATH_SEC5, 0x00},
> +	{ CDC_VA_TX3_TX_PATH_SEC6, 0x00},
> +	/* ADPT blocks */
> +	{ CDC_VA_CDC_ADPT0_ADPT_CTRL, 0x51},

[Severity: Low]
This isn't a bug, but va_4_0_defaults[] copies all 75 base register
entries from va_defaults[] verbatim before appending the 40 new v4.0 ADPT
entries, which makes the two tables easy to get out of sync if a common
default changes.

[ ... ]

> @@ -542,7 +782,13 @@ static int va_macro_mclk_enable(struct va_macro *va,=
 bool mclk_enable)
>  	if (mclk_enable) {
>  		va_clk_rsc_fs_gen_request(va, true);
>  		regcache_mark_dirty(regmap);
> -		regcache_sync_region(regmap, 0x0, VA_MAX_OFFSET);
> +		regcache_sync_region(regmap, 0x0, regmap_get_max_register(regmap));
> +		/*
> +		 * Sync the decimator input muxes again to restore registers
> +		 * skipped by no_sync_defaults when they hold reset values.
> +		 */
> +		regcache_sync_region(regmap, CDC_VA_INP_MUX_ADC_MUX0_CFG0,
> +				     CDC_VA_INP_MUX_ADC_MUX3_CFG1);
>  	} else {
>  		va_clk_rsc_fs_gen_request(va, false);
>  	}

[ ... ]

> @@ -1565,6 +1817,14 @@ static int va_macro_set_lpass_codec_version(struct=
 va_macro *va)
>  		default:
>  			break;
>  		}
> +	} else if (maj =3D=3D 4) {
> +		switch (min) {
> +		case 0:
> +			version =3D LPASS_CODEC_VERSION_4_0;
> +			break;
> +		default:
> +			break;
> +		}
>  	}
> =20
>  	if (version =3D=3D LPASS_CODEC_VERSION_UNKNOWN) {

[Severity: Low]
As reported by Ajay Kumar Nandam on v4 [1], the commit message states that
probe cross-checks the register layout chosen from match data against the
version reported by hardware, but neither va_macro_probe() nor
va_macro_set_lpass_codec_version() compares the detected version against
the selected match data (such as data->regmap_config or data->has_adpt).

Also, the commit message does not mention why va_macro_mclk_enable() adds
a second regcache_sync_region() call for CDC_VA_INP_MUX_ADC_MUX0_CFG0
through CDC_VA_INP_MUX_ADC_MUX3_CFG1 across all VA macro platforms.

[1] https://lore.kernel.org/r/84c8e0d7-b3f6-497d-93ac-4c3ad7e5956a@oss.qual=
comm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-add_shikra=
_support-v7-0-7bf3aa089fc6@oss.qualcomm.com?part=3D4
