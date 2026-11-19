Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077702;
	b=s6/42BeXSN1AjTblp1V2MF1U4t0nbEWvh9oBXUwmgCVEkqKiCu9r7YXnJF+ukCyEjoXl
	 JQzZ5UTxCjUkChRuZJNeZxZExhaZWmwSkJF6tZfpYI1Ls/7MXHiZ4968SRw/vaLM6uyBr
	 BRDgunzywfUnVUmpUcXEbgZgN9KY1QY8n/iljHRv05D6MegOmTCkmjw+xi4hF1xoM9T3K
	 aK2AtzojZHzgvKyJtvd8RBzfe5pRrBBrQ0XijnC4BQr3k3ZABSnwikJi5lpdpDiT1apoK
	 UhmbY0IgfgLwAMguljmKNP+yxusgCxJEBVpJJrEIK2fnQYMjaf7nqlCwnRYWcUxb1Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077702;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OCKQX5Z6k67c3S0DrC1VVL7/HnMiXMQd1ciErs9wB+U=;
	b=AOhmD9gVZnJDCB5z+9T25GIeKzLitE85YDldT9UilgkOdYl2/2aOKjwI9c7nbNwwIQUy
	 iaAjMXsa2Csk8kWTg6KCqLiczl5PvpOfnUtu/KzvnOaEPFllTD5indC1cLA+IE3WOWjhv
	 DD/M+rhS2rh2AFRk1PCeviepdJhYlAPtTsEkeXkAwqJLlpZiWlONYIFfcYzWKBlFeLycY
	 H7/I58aQ514mOiDBeUj5RdhUeix1CGxymwhZjwGeOPX3a0B9QxgZrJJOu+x1sea1OmDbG
	 BX8LXA/dgxVc8X98UcEQ4srvv3cwD/TBlLe6Qs4KKiifa0ML9BClJZ0vjFZBgnsmEpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OykBJckk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1FA606AEF3;
	Thu, 19 Nov 2026 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OykBJckk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7698C1F000C4;
	Thu, 19 Nov 2026 08:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795077701;
	bh=OCKQX5Z6k67c3S0DrC1VVL7/HnMiXMQd1ciErs9wB+U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OykBJckk8uX6o73FMGSE2UXxrJ1QFw48Y/SEMLMrijlya1WmzYgvbhSgWzlAcsTh3
	 IlZWiEU3PmM7Ak5ZXgLXYqh5bRg0Ae3UPUGtif/RCjsWj2Yu7LomAUSEQxkLuboJlK
	 89Uso1+47uh+Hv2hQbW30OgA/RY2x7tSqDu8adOFuITElS6pa+p7RKoMeN4dCh8zjz
	 RW+iazKYnZTRaXW0lpQ1hyEiHPlkdnPzOLaS4dUGkYv/CTcKNcr2KXcS2HrwiRn1SR
	 HD9m5oBeBYMwyhe54/8mrpCScsWKcsHLygLZUEBEgARx3oGtcz5Ly22ETEXXZiu2u4
	 ZcU4NDBxsbgFQ==
Message-ID: <sashiko-outbox-222697@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: codecs: Add NXP TFA9865 amplifier driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Venkat Yadlapati" <venkat.yadlapati@yahoo.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119-vantage-tfa9865-v3-2-5257fa45df57@yahoo.com>
References: <20261119-vantage-tfa9865-v3-0-5257fa45df57@yahoo.com>
 <20261119-vantage-tfa9865-v3-2-5257fa45df57@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 08:41:41 +0000
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
- [Medium] ASoC: tfa9865: tfa9865_b0_init re-asserts PWDN in
  tfa9865_init()
--

commit 22126aae516e932437c57483972adbeb537cf93f
Author: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

ASoC: codecs: Add NXP TFA9865 amplifier driver

This commit adds an ASoC codec driver for the NXP/Goodix TFA9865 mono
class-D speaker amplifier, supporting the B0 revision with 32-bit I2S
slots.

> diff --git a/sound/soc/codecs/tfa9865.c b/sound/soc/codecs/tfa9865.c
> new file mode 100644
> index 0000000000000..ca1a458e6f651
> --- /dev/null
> +++ b/sound/soc/codecs/tfa9865.c

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
> +	{ 0x62, 0x06c4 },
> +	{ 0x63, 0x80d4 },
> +	{ 0x65, 0x0c58 },
> +	{ 0x67, 0x006e },
> +	{ 0x68, 0x0820 },
> +	{ 0x69, 0x0119 },
> +	{ 0x74, 0x6028 },
> +	{ 0x75, 0x1daa },
> +	{ 0x78, 0x0001 },
> +	{ 0x7c, 0x10f2 },
> +	{ 0xdd, 0x01b6 },
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
> +	/* The reset changed every register, forget what was read before */
> +	regcache_drop_region(regmap, 0, tfa9865_regmap.max_register);
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
Does writing { 0x00, 0xf241 } at the start of tfa9865_b0_init[] put the
chip back into power down before the remaining protected registers in
tfa9865_b0_init[] are written?

tfa9865_init() clears BIT(TFA9865_SYS_CTRL0_PWDN) (bit 0 of register 0x00)
and waits for TFA9865_MANSTATE_WAIT_SRC so the protected registers are
accessible, then sets BIT(TFA9865_SYS_CTRL0_PWDN) again after locking the
keys.  However, 0xf241 has bit 0 set, which immediately re-asserts PWDN on
the first write of regmap_multi_reg_write() and turns the later
regmap_set_bits() on TFA9865_SYS_CTRL0 into a no-op.

Also, tfa9865_b0_init[] already writes { 0x5f, 0x00a0 } (5 <<
TFA9865_TDM_GAIN_TDMSPKG) to TFA9865_TDM_GAIN, so the regmap_update_bits()
call on TFA9865_TDM_GAIN at the end of tfa9865_init() is redundant.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-vantage-tf=
a9865-v3-0-5257fa45df57@yahoo.com?part=3D2
