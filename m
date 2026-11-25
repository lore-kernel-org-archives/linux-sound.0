Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605653;
	b=cdXigrrxBRllZQ33lP6EGPSC3C0IzxoroT4us/amY7duLv0AVpN20IoKsiE+OCkdgFk0
	 8hKB1PRTzTgBCkozJo1o+XGtUZ5lpPvI1n9eTb9xGqY9WRkC9KQey9sfyqJpZAw71tLF8
	 jInsWjBsqcsS3DlrIEzw2LJB6P8LNq4l8ZXaqgxhT5AXw3vwpQOb86bZVFJQo1z6s6TER
	 JqMJ+BDfKjD7hwQ4cSwaN8HyKeHaSh0S9WAeVxLOe67JqPfEfsM0XiSGOrkOl5rJgiHq0
	 jTlo+dsy9SYpDq27ER/Lu4bI6rpF5XJfDte4puHtj7H6obDwgwS1Cbq4d3U6Na42VXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605653;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GEcOOLUNKKyf30LhsR3stZbBnO2x2FvYEJHyVGewrvE=;
	b=UMfhtC0LtcpNnKJKIzdSU14Dsb465BNWGRdKTb9T+B0N6RByhEqwQeb8Igrtvf1WW3Gi
	 HsPa+dn7St4dByhwRz6i5ZEFXC4XPixWbRrUsHiDUx9yuWlCGD1Fh/6gfCI5zkK3PX3Vv
	 vh/74eOotSYki/GjeILOA9POwb2xwFpoMZua5fDRaadfodCRPZR6J3r1nRNwdSA08ZSUG
	 v9IFkx0LaFgURATS7G2nClk85CGrFPi0ymU6PeuwQ/io0m1uHiyNjYsyM9egFePz5GsZu
	 ApbluS4S48fvqUB+2/CpWJdEi/nsxCRrJ3mRNH6YS2DZQOifquhTdDFpptxk0yyrgPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ef7cpGMJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2DB606A321
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 11:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ef7cpGMJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9945C1F000C0;
	Wed, 25 Nov 2026 11:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795605652;
	bh=GEcOOLUNKKyf30LhsR3stZbBnO2x2FvYEJHyVGewrvE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ef7cpGMJSpz6arto6/ow7z7garCWsqS/Y8yH6ucBRu1Vfz52sej4WY8jtSJ5rvuLa
	 RjNGFDmJ0z5T4VvXXvOZI+NaFRdKbB3KTBr9VkqSINmM0s9YUngFsztpVaFOGYN+Xs
	 n7SWXlkCB2HsXTJVov4HGu138bkaq4ieBfrnuIZYiqDt9gGhQ1BfbSW2Ihwy+/MonD
	 DpNehtoeYSc3BqRUGo6gkx1IxOVR1ojSfZjoEMuKblTglZcVaarhwVfXFUJWlmFG3n
	 7UfbgID2BdKM/6brAACwic1GHY+Bs0osBvJf1sOHFs027E3rSAr8w4d+Y7bgx++icL
	 4sZIcHVYHQ5Gw==
Message-ID: <sashiko-outbox-233220@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND 4/4] ASoC: cs35l56: Add test that probe() doesn't
 write SDW mux registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Fitzgerald" <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261125110853.741337-5-rf@opensource.cirrus.com>
References: <20261125110853.741337-1-rf@opensource.cirrus.com>
 <20261125110853.741337-5-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 11:20:52 +0000
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
- [Medium] ASoC: cs35l56: missing SDW mux call to
  cs35l56_test_fill_register_range()
--

commit 6abf5b53b66d893e6ef45aa41f1e494247ead199
Author: Richard Fitzgerald <rf@opensource.cirrus.com>

ASoC: cs35l56: Add test that probe() doesn't write SDW mux registers

This commit adds a KUnit test verifying that probing the cs35l56 component
does not write to the SoundWire TX mux registers directly or via a
subsequent regcache_sync().

> diff --git a/sound/soc/codecs/cs35l56-test.c b/sound/soc/codecs/cs35l56-t=
est.c
> index b422d19ba0b21..362da30b949e6 100644
> --- a/sound/soc/codecs/cs35l56-test.c
> +++ b/sound/soc/codecs/cs35l56-test.c

[ ... ]

> @@ -929,6 +938,79 @@ static void cs35l56_test_component_probe_omits_asp(s=
truct kunit *test)
>  	KUNIT_EXPECT_FALSE(test, priv->asp_mixer_regs_written);
>  }
> =20
> +/*
> + * Probing the component must not write the SoundWire TX mux registers,
> + * either directly or through a subsequent regcache_sync().
> + */
> +static void cs35l56_test_component_probe_omits_sdw_mux(struct kunit *tes=
t)
> +{
> +	struct cs35l56_test_priv *priv =3D test->priv;
> +	struct cs35l56_private *cs35l56 =3D priv->cs35l56_priv;
> +	struct snd_soc_card *card =3D cs35l56->component->card;
> +	struct snd_soc_aux_dev *aux;
> +	struct faux_device *card_dev;
> +
> +	cs35l56_test_create_mock_supplies(test);
> +	cs35l56_test_create_mock_device_registers(test);

[ ... ]

> +	/*
> +	 * Flush cache to ensure there aren't cached values for the SoundWire m=
uxes.
> +	 * The first case without regcache_mark_dirty() tests flushing when
> +	 * hardware registers have not reset, and requires a dummy write to
> +	 * the cache to make it dirty.
> +	 */
> +	regcache_cache_only(cs35l56->base.regmap, true);
> +	KUNIT_ASSERT_EQ(test, 0, regmap_write(cs35l56->base.regmap,
> +					      CS35L56_DSP_VIRTUAL1_MBOX_1, 0));
> +	regcache_cache_only(cs35l56->base.regmap, false);
> +	KUNIT_ASSERT_EQ(test, 0, regcache_sync(cs35l56->base.regmap));
> +	regcache_mark_dirty(cs35l56->base.regmap);
> +	KUNIT_ASSERT_EQ(test, 0, regcache_sync(cs35l56->base.regmap));
> +
> +	KUNIT_EXPECT_FALSE(test, priv->sdw_mux_regs_written);
> +}

[Severity: Medium]
Should cs35l56_test_create_mock_device_registers() also pre-populate
cs35l56_test_sdw_mux_registers_range with
cs35l56_test_fill_register_range()?

priv->registers is in cache-only mode, and the CS35L56_SWIRE_DP3_CH?_INPUT
registers are only filled for ASP ranges:

sound/soc/codecs/cs35l56-test.c:cs35l56_test_create_mock_device_registers()=
 {
	...
	cs35l56_test_fill_register_range(test, &cs35l56_test_asp_config_registers_=
range, 0);
	cs35l56_test_fill_register_range(test, &cs35l56_test_asp_mixer_registers_r=
ange, 0);
}

Without pre-populating cs35l56_test_sdw_mux_registers_range, any read of
the SoundWire mux registers during probe (for example, via dapm_read()
when initializing mux widgets) fails with -EBUSY in
cs35l56_test_mock_registers_read().  _regmap_read() then skips caching the
value in cs35l56->base.regmap, so the subsequent regcache_sync() test will
silently pass instead of catching a read that populated the cache.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125110853.7413=
37-1-rf@opensource.cirrus.com?part=3D4
