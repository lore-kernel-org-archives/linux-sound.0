Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793521627;
	b=5pEJ+i5DLoXl1WyYG1yjgud+439wDdhD+nGmjDMDbATo3qkRFxZnkGQRAMpuEpjW6nXO
	 l4Wqoez5gugWx5JrOnbrxqQ8D2BpKZic7GaV7Enzb9g9vetXMlSDp5BPh2CJYO5TfvuqF
	 VFPoUU09imRNBuiRUAqb0IOlekyINPs2Rtn99YA8OaDHltbUNLsjk8Kus+BBc3S+ZbN7I
	 WjPZrj0zYyQL6UfPLsmWCpS6rkq0xqlv1Hcxvl0TCDyKFI/Z1lZ3XFtKAqC0UmYpe/vCQ
	 Fr93M73Rcqc3/oQyDjKoqty1eigIfCh/4QVCmPBi/vZcCxsRk3f/+ElF1N72x9iQ0Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793521627;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8u92PMQ1u/LpJTFqNlCPBmtAAc5sOGlunFIIr1n+rO8=;
	b=oMFNJlHnJqfSW5Az4EvRYD4cD7V4nTVzSj7U70J/TSObjfc0p8Kl9zLMFcRgIA9asn7K
	 H/rdy7d+nESGqp9B97ns8yXqPaAO21gdhuC3rj7GqyL7xL2PEhzRvVOZCG72T6chLkC6H
	 GiumFDoN8F1IKaX36crd3z2TbgXpeoZ5zFSxy8CKKIBaESBQr78JLz4RMirrcW7MgpO8g
	 AOciwF/vIBaKSjNTzpQVck+SOk9u7FocKK2OI041LNyApeRtuqTbN6yPwqyk4LzrFPy+G
	 rLaKr8Hbb/KoYOd6R303hAG034cybgndhjAYZ31nBZ0w3iXnaXUCX7ILri05mobhufQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZKBEhmzG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68762606A324;
	Sun,  1 Nov 2026 08:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZKBEhmzG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C682B1F000C1;
	Sun,  1 Nov 2026 08:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793521627;
	bh=8u92PMQ1u/LpJTFqNlCPBmtAAc5sOGlunFIIr1n+rO8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZKBEhmzGiQLhxubZPiwdXNPfp8se8/N60IYdho5LoNJ1VtZaYFFXl74Dl9EfNM5n8
	 3SMjHfNY8scUf09HEmtHgXcbVSN+F8AQ1ZBBPfAzdTfp1vY6x3g0N3n+iik14kcoC2
	 qRUEPK8mGgdbt2o2ROYJnlHR5s6ableF3wfaCb0yuK8dEhejPJEkzESlbk2o1FZioJ
	 sTC22nQtGj0deW2z9RtdZK9GAeVR7j6tujurUDRKnm4w9cHZdZfZyZMUg5/CiW9PLF
	 SWdZXvjuWuwDOKjYMwCSDrqe0AFX+ORlOPxTpMEtQI9eZzNuly82QuYDx/i3omKJr0
	 bOH4TxkBb/Cog==
Message-ID: <sashiko-outbox-192327@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: codecs: add support for Everest ES7202 PDM
 ADC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261101080926.267041-3-jerrysteve1101@gmail.com>
References: <20261101080926.267041-1-jerrysteve1101@gmail.com>
 <20261101080926.267041-3-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 08:27:06 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] ASoC: es7202: regcache overwrite and ordering in es7202_suspend(=
) and es7202_resume()
- [Low] ASoC: es7202: positional initializer in es7202_i2c_id table
--

commit 8b7285d85de8871310d7776f1de182623a778972
Author: Jun Yan <jerrysteve1101@gmail.com>

ASoC: codecs: add support for Everest ES7202 PDM ADC

This commit adds an ASoC codec driver for the Everest Semiconductor ES7202
2-channel PDM analog-to-digital converter controlled over I2C.

Link: https://archive.org/details/es-7202-ds

> diff --git a/sound/soc/codecs/es7202.c b/sound/soc/codecs/es7202.c
> new file mode 100644
> index 0000000000000..b652916b44587
> --- /dev/null
> +++ b/sound/soc/codecs/es7202.c
> @@ -0,0 +1,373 @@

[ ... ]

> +static const struct reg_default es7202_reg_defaults[] =3D {
> +	{ ES7202_RESET,		0x10 },
> +	{ ES7202_SOFT_MODE,	0x00 },
> +	{ ES7202_CLK_DIV,	0x04 },
> +	{ ES7202_CLK_EN,	0x00 },
> +	{ ES7202_T1_VMID,	0x01 },
> +	{ ES7202_T2_VMID,	0x18 },
> +	{ ES7202_PDM_INF_CTL,	0x30 },

[ ... ]

> +static int es7202_suspend(struct snd_soc_component *component)
> +{
> +	struct es7202_priv *es7202 =3D snd_soc_component_get_drvdata(component);
> +
> +	return es7202_mute_pdm(es7202, true);
> +}
> +
> +static int es7202_resume(struct snd_soc_component *component)
> +{
> +	struct es7202_priv *es7202 =3D snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	/* re-run the power-up sequence to bring the analog front-end back up */
> +	ret =3D es7202_hw_init(es7202);
> +	if (ret)
> +		return ret;
> +
> +	regcache_mark_dirty(es7202->regmap);
> +	return regcache_sync(es7202->regmap);
> +}

[Severity: Medium]
Does the suspend and resume sequence corrupt the cached mute state in
ES7202_PDM_INF_CTL and re-write the initialization sequence twice?

When a capture stream is prepared, __soc_pcm_prepare() ->
snd_soc_dai_digital_mute() -> es7202_mute_stream() -> es7202_mute_pdm()
clears ES7202_PDM_INF_CTL_MUTE, setting ES7202_PDM_INF_CTL to 0x30 in both
hardware and the regmap cache.

During system suspend, snd_soc_suspend() calls es7202_suspend(), which calls
es7202_mute_pdm(es7202, true) without bypassing the regmap cache. That
overwrites the cached value of ES7202_PDM_INF_CTL with 0x33 (muted).

On resume, es7202_resume() then runs es7202_hw_init(es7202), which also
writes init_seq through regmap_multi_reg_write() into both hardware and the
cache (again setting ES7202_PDM_INF_CTL to 0x33), before calling
regcache_mark_dirty() and regcache_sync().

In addition, even if ES7202_PDM_INF_CTL had remained 0x30 in the cache, 0x30
matches the entry in es7202_reg_defaults, so regcache_mark_dirty() tells
regcache_sync() to skip syncing registers whose cached value matches the
default, leaving the hardware at 0x33 as programmed by es7202_hw_init().
Meanwhile, calling regcache_mark_dirty() after es7202_hw_init() causes
regcache_sync() to redundantly write all 9 non-volatile registers from
init_seq that differ from es7202_reg_defaults a second time over I2C.

Since soc_resume_deferred() only unmutes playback streams via
soc_playback_digital_mute(), won't a capture stream in
SNDRV_PCM_STATE_PREPARED before suspend (or resumed via
SNDRV_PCM_IOCTL_RESUME without re-running .prepare()) remain muted after
resume?

[ ... ]

> +static const struct i2c_device_id es7202_i2c_id[] =3D {
> +	{ "es7202" },
> +	{ }
> +};

[Severity: Low]
This isn't a bug, but per I2C subsystem conventions for new struct
i2c_device_id tables, could the entry in es7202_i2c_id use a named
initializer:

	{ .name =3D "es7202" },

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101080926.2670=
41-1-jerrysteve1101@gmail.com?part=3D2
