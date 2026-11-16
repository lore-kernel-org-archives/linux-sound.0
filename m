Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816366;
	b=PVF0+2fxj1zrdLAYN0SBkJlvqeV6yRb/lfmGoydZ4RR3T53Bp8M+2i4AnfxcY46q+Ez9
	 eyNBV9K9UFrMoFnD0wgDokBIsrG5nivasAkqlAdeEtTIZFK3r3YcmevpwYiKsq7hZ+Lmm
	 oeYYXLzJh9J7M6h//dsits0JtW7IN1JveiSAuDAkZ4RaORSbOpTG3NZ4kuIpJTc2L7bGr
	 coN3AowV/5NnVFmfyGP3OKGkq/vfejeMnM+HDAlrbNK8+Vzq9wqS1ErhTobfFKoKTZznt
	 Cv95lBxGcAMs/v+MG+mZxgSQvXyWxH1k7/LakxkjXWvUVA9JTRZfzNa/n39V7IXiOEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816366;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yQYoYofCKIScM1Y2QYUcIEjZWxF0y23upUvtATR5GwA=;
	b=HDUPgmobuc7XrSWhoj418NLPrLZFSv/upK6LyjG8njQ934h7ZaV8N7JUNRaCK0pgcMrD
	 Hu5iDLjTg9qVRk5S7yQuIxt1ih1B1YzM0uDKY1cMxb03b5JqRGaCgLTIt4I9IZCG1BiUY
	 zjkr4HTYeqQY6S6K7LEWR+9O4EPQTID/+l8hyXrnULvXbPyED7V1K9FcbvfNlp9gGCjKo
	 LiW8uUOUpFQJPHbwjBrgDZlFQEuxsCQemXmlc1BaOylpb9LukO9qkuoHzeCJVQBBebW8d
	 h3X25NbOOsa82MebWmmjZjMxxtint0yphokmV3RUKHcNVnTOVUvf4j51OTw8p1PHwfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlybqxl5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55601606A323;
	Mon, 16 Nov 2026 08:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlybqxl5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8651F000C4;
	Mon, 16 Nov 2026 08:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794816365;
	bh=yQYoYofCKIScM1Y2QYUcIEjZWxF0y23upUvtATR5GwA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mlybqxl5uDhlJCaVWUgKWNKoX2txjnDV/2YZGiLQ5yhUmAWUvCoPrTx4orP0dM2ot
	 GtSIYvbogNCzxy9+lttUQbPP40VABgoUVSdC+YlmGKTBv1v2SY0Q562nf9BU97aVhv
	 mY1+fu/kHmAq/2k0ssq1xkPyqvJD7+c6+jo2EycTH4nYwXV59A2YNDHRCBZUC5p5bY
	 +GZhnIyo9H5ESEXO8ZwAH0UcHKaA8eO5RYog8PEUbx8xiwDpf8hcN0ISUNMuM4V1yV
	 Q9Pe2MMCZXLlYrzfwTgs5EKrkdwXmeTAJaDIBUILzxsNWHILjD5QYlt43lfyQZkjZQ
	 Ybtvcy7syLf1g==
Message-ID: <sashiko-outbox-216504@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: codecs: Add NXP TFA9865 amplifier driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Venkat Yadlapati" <venkat.yadlapati@yahoo.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-vantage-tfa9865-v2-2-a93f976c9479@yahoo.com>
References: <20261116-vantage-tfa9865-v2-0-a93f976c9479@yahoo.com>
 <20261116-vantage-tfa9865-v2-2-a93f976c9479@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 08:06:05 +0000
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
- [Medium] ASoC: tfa9865: tfa9865_b0_init re-asserts PWDN in
  tfa9865_init()
- [Low] ASoC: tfa9865: redundant volatile_reg callback with
  REGCACHE_NONE
--

commit 616efa16b28b605a452049773ef1a7ad03db31eb
Author: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

ASoC: codecs: Add NXP TFA9865 amplifier driver

This commit adds an ASoC codec driver for the NXP/Goodix TFA9865 mono class=
-D
speaker amplifier.

> diff --git a/sound/soc/codecs/tfa9865.c b/sound/soc/codecs/tfa9865.c
> new file mode 100644
> index 0000000000000..8a34ede04d43e
> --- /dev/null
> +++ b/sound/soc/codecs/tfa9865.c
[ ... ]
> +static bool tfa9865_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case TFA9865_SYS_CTRL0 ... TFA9865_DEVICE_INFO:
> +	case 0x10 ... 0x15:	/* status and interrupt flags */
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct regmap_config tfa9865_regmap =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 16,
> +	.max_register =3D 0xff,
> +
> +	.volatile_reg =3D tfa9865_volatile_reg,
> +	.cache_type =3D REGCACHE_NONE,
> +};

[Severity: Low]
Is tfa9865_volatile_reg() needed when tfa9865_regmap uses REGCACHE_NONE?

With REGCACHE_NONE, register caching is disabled and all readable registers
already default to volatile.  Providing .volatile_reg here only causes
debugfs to report registers outside 0x00..0x06 and 0x10..0x15 as non-volati=
le
even though no cache is active, while marking static ID and control registe=
rs
in TFA9865_SYS_CTRL0 ... TFA9865_DEVICE_INFO as volatile.

[ ... ]

> +static const struct reg_sequence tfa9865_b0_init[] =3D {
> +	/* "generated code" version 2 for TFA9865 B0 from the NXP driver */
> +	{ 0x00, 0xf241 },
> +	{ 0x02, 0x0c28 },
> +	{ 0x08, 0x009a },
> +	{ 0x50, 0xc000 },
> +	{ 0x54, 0x10e0 },
> +	{ 0x5a, 0x5f5e },
> +	{ 0x5b, 0x74e2 },
> +	{ 0x5c, 0xb02b },
> +	{ 0x5f, 0x00a0 },
[ ... ]
> +};
> +
> +static int tfa9865_init(struct tfa9865 *tfa9865)
> +{
> +	struct regmap *regmap =3D tfa9865->regmap;
> +	unsigned int seed;
> +	int ret;
> +
> +	/*
> +	 * Start from the register defaults, also when the device stayed
> +	 * powered (no reset GPIO, driver rebind). This clears MANSCONF, so
> +	 * the device manager waits in WAIT_SRC below.
> +	 */
> +	ret =3D regmap_write(regmap, TFA9865_SYS_CTRL0, TFA9865_SYS_CTRL0_I2CR);
> +	if (ret)
> +		return ret;
> +	usleep_range(1000, 2000);
> +
> +	/* Leave power down to make the protected registers accessible */
> +	regmap_clear_bits(regmap, TFA9865_SYS_CTRL0, BIT(TFA9865_SYS_CTRL0_PWDN=
));
> +	regmap_clear_bits(regmap, TFA9865_CLK_GATING_CTRL, TFA9865_CLK_GATING_C=
TRL_MANAOOSC);
> +	ret =3D tfa9865_wait_manstate(tfa9865, TFA9865_MANSTATE_WAIT_SRC);
> +	if (ret)
> +		return ret;
> +
> +	/* Unlock key 1 and key 2 */
> +	regmap_write(regmap, TFA9865_HIDE_UNHIDE_KEY, 0x5a6b);
> +	ret =3D regmap_read(regmap, TFA9865_KEY1_SEED, &seed);
> +	if (ret)
> +		return ret;
> +	regmap_write(regmap, TFA9865_KEY1, seed ^ 0x005a);
> +	regmap_write(regmap, TFA9865_KEY2, 0x005a);
> +
> +	ret =3D regmap_multi_reg_write(regmap, tfa9865_b0_init, ARRAY_SIZE(tfa9=
865_b0_init));
> +
> +	/* Lock the keys again */
> +	regmap_write(regmap, TFA9865_KEY2, 0);
> +	regmap_write(regmap, TFA9865_KEY1, 0);
> +	regmap_write(regmap, TFA9865_HIDE_UNHIDE_KEY, 0);
> +	if (ret)
> +		return ret;
> +
> +	/* Go back to power down with the oscillator off */
> +	regmap_set_bits(regmap, TFA9865_SYS_CTRL0, BIT(TFA9865_SYS_CTRL0_PWDN));
> +	ret =3D tfa9865_wait_manstate(tfa9865, TFA9865_MANSTATE_POWERDOWN);
> +	if (ret)
> +		return ret;
> +	regmap_set_bits(regmap, TFA9865_CLK_GATING_CTRL, TFA9865_CLK_GATING_CTR=
L_MANAOOSC);
> +
> +	/* Input attenuation used by the vendor configuration */
> +	regmap_update_bits(regmap, TFA9865_TDM_GAIN,
> +			   TFA9865_TDM_GAIN_TDMSPKG_MAX << TFA9865_TDM_GAIN_TDMSPKG,
> +			   5 << TFA9865_TDM_GAIN_TDMSPKG);

[Severity: Medium]
Does the first entry of tfa9865_b0_init ({ 0x00, 0xf241 }) re-assert
TFA9865_SYS_CTRL0_PWDN before the rest of the protected registers are
written?

tfa9865_init() clears BIT(TFA9865_SYS_CTRL0_PWDN) in TFA9865_SYS_CTRL0 and
waits for TFA9865_MANSTATE_WAIT_SRC so the protected registers can be
accessed, and then sets BIT(TFA9865_SYS_CTRL0_PWDN) again after locking the
keys.  Writing 0xf241 to 0x00 at the start of regmap_multi_reg_write() sets
bit 0 (PWDN) back to 1 before registers 0x02..0xdd are programmed and makes
the later regmap_set_bits() on TFA9865_SYS_CTRL0 a no-op.

Also, tfa9865_b0_init already writes { 0x5f, 0x00a0 } (5 <<
TFA9865_TDM_GAIN_TDMSPKG), so the regmap_update_bits() call on
TFA9865_TDM_GAIN at the end of tfa9865_init() is redundant.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-vantage-tf=
a9865-v2-0-a93f976c9479@yahoo.com?part=3D2
