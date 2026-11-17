Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921784;
	b=NWEd1s2dLdx3pFvUA2yPglppEIP+uG/hyl43lmSXBifpH9CSxY1h5T7bXyOcoo3/dAUV
	 AhyzemBZdsOwc0Cw3nMw75y1fwYI1MaCuE6lwU/ElEuPV0p51wWSLkEXRxCjlHDhK+4aM
	 NnwbRgV+JQiBy5WHsXj2edTLFIZvB6SXL/ZhiahLxg2l05hQf9K8i0gzhuK2AYLLbEukW
	 5Bb4xEmGY6ETioclhEfNZfnwi9Ze4Y6o8BFg5KbpMLvWM0ldOlwCUtjDABj8Nt/O3sYuL
	 OT0ahUV5LlF62/RPatKZJJo2LrjNlFUAgzJZFjAiM84bCgrMDk5w64ruygyMEaV/dmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921784;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y1/6oJdDHsmtL3DFsNugzgnEeGIGwnIrlzrHGfuNGHQ=;
	b=nUs4NJbQoI7cRzpWSpAYzTIVDwNO9Fuv/mMFoNbB9o8WU5WTeBMLt31n5571uXUK5QAF
	 Md/SK9eH5xoFrRS+L1pPyLpuKwtJy2dkwKJ6z6bjpNbLXg43fHcW3/ITKsUk1E58gBJnJ
	 PhCZJcDG0LaiKUhrKFfp/O9uCozT8H0y5qnEmE5zz7aNlGDXMJ9xy8B+jsJKRJ8/Uc36H
	 sG1XrfLMcI8ajbBKZ8ea6LQ/YvHjouRrBDaRRy3SOuz6oHjW1BrbRdPJapa2kQPEL93r0
	 HFJVnn0Z9XtlC0kjhzGZhsAgXq+9y7GvyadR0mscqi663U6IQVTqLGNsMmrirl1IRSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJJaFnsV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A263E606A323
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 13:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJJaFnsV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221641F000C6;
	Tue, 17 Nov 2026 13:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794921784;
	bh=y1/6oJdDHsmtL3DFsNugzgnEeGIGwnIrlzrHGfuNGHQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fJJaFnsVSBE0SUtJ3WuU+iBTVh+mChPv6WFNcT+zDp6I7vq2fqcBdwJZ94FkH+QMZ
	 Uswj2Bmk438DvkcpgrXwWN3Vxe/MFJTHc81H2gmsOPcNUvIqPJpgS5dQrx9qsNyuuv
	 DdlaSW5zty1GVAfsUdIGSStIYITmUGswYBddATCDFx0a812MiVglBmMLTlfmrImzVs
	 yTdJeR9L0wSQ5PP5rrI7PAN9e3mnuNNQf3yjhIQvdr2qEtQ0/fVEnge0l2y/YchMIy
	 cc7G1TTGbxEqU/+6VIOGILHQm6etFaEBfKKlTTT07OY+K8lKCPnOc68aQdJHOqwDw6
	 iHP2Ht4Eyz8gg==
Message-ID: <sashiko-outbox-218869@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ASoC: cs35l56: Add KUnit test that widget init
 doesn't write ASP registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Fitzgerald" <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261117125937.658976-2-rf@opensource.cirrus.com>
References: <20261117125937.658976-1-rf@opensource.cirrus.com>
 <20261117125937.658976-2-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 13:23:03 +0000
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
- [Medium] ASoC: cs35l56: unpopulated mock ASP regs prevent read caching
  in test
--

commit df48b571346ca1593755186a19b76f7e8aefd40b
Author: Richard Fitzgerald <rf@opensource.cirrus.com>

ASoC: cs35l56: Add KUnit test that widget init doesn't write ASP registers

This commit adds a KUnit test with a cache-only mock regmap and dummy
regulators to verify that probing the cs35l56 component as an auxiliary
device does not write to the ASP config or mixer registers during probe or
subsequent regcache syncs.

> diff --git a/sound/soc/codecs/cs35l56-test.c b/sound/soc/codecs/cs35l56-t=
est.c
> index b58df099bf726..eda2f8ae6f21f 100644
> --- a/sound/soc/codecs/cs35l56-test.c
> +++ b/sound/soc/codecs/cs35l56-test.c
[ ... ]
> @@ -79,6 +95,211 @@ static const struct software_node *cs35l56_test_dev_a=
nd_af01_node_group[] =3D {
>  	NULL
>  };
> =20
> +/* Some mocked registers need default values for driver init to work */
> +static const struct reg_default cs35l56_test_mock_reg_defaults[] =3D {
> +	{ CS35L56_OTPID,		0x00000003 },
> +	{ CS35L56_IRQ1_STATUS,		0x00000000 },
> +	{ CS35L56_IRQ1_MASK_1,		0x83ffffff },
> +	{ CS35L56_IRQ1_MASK_8,		0xfc000fff },
> +	{ CS35L56_DSP_VIRTUAL1_MBOX_1,	0x00000000 },
> +	{ CS35L56_DIE_STS1,		0x00000000 },
> +	{ CS35L56_DIE_STS2,		0x00000000 },
> +	{ CS35L56_DSP_RESTRICT_STS1,	0x00000000 },
> +	{ CS35L56_OTP_MEM_53,		0x00000000 },
> +	{ CS35L56_OTP_MEM_54,		0x00000000 },
> +	{ CS35L56_OTP_MEM_55,		0x00000000 },
> +	{ CS35L56_DSP1_FW_VER,		0x00040710 },
> +	{ CS35L63_PROTECTION_STATUS,	0x00000000 },
> +	{ CS35L56_PROTECTION_STATUS,	0x00000000 },
> +};
> +
> +/* Trap the entire ASP address space, not only particular registers */
> +static const struct range cs35l56_test_asp_config_registers_range =3D {
> +	.start =3D 0x4800,
> +	.end =3D 0x48ff,
> +};
> +
> +static const struct range cs35l56_test_asp_mixer_registers_range =3D {
> +	.start =3D CS35L56_ASP1TX1_INPUT,
> +	.end =3D CS35L56_ASP1TX4_INPUT,
> +};
> +
> +
> +static int cs35l56_test_mock_registers_read(void *context,
> +					    const void *reg_buf, size_t reg_size,
> +					    void *val_buf, size_t val_size)
> +{
[ ... ]
> +	for (i =3D 0; i < val_size; i +=3D sizeof(u32), reg +=3D sizeof(u32)) {
> +		ret =3D regmap_read(priv->registers, reg, &val);
> +		if (ret)
> +			return ret;
> +
> +		put_unaligned_be32(val, buf + i);
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Can cs35l56_test_mock_registers_read() ever succeed on an unwritten ASP
config or ASP mixer register when priv->registers is in cache-only mode and
cs35l56_test_mock_reg_defaults has no entries for those ranges?

When the driver reads an uncached ASP register through cs35l56->base.regmap
(for example during DAPM widget initialization), regmap_read(priv->register=
s,
reg, &val) returns -EBUSY.  Because _regmap_read() only calls
regcache_write() when map->reg_read() returns 0, the read fails to populate
cs35l56->base.regmap's cache (and dapm_read() ignores the error), so the
subsequent regcache_sync() calls in cs35l56_test_component_probe_omits_asp()
will never flush those registers or set priv->asp_config_regs_written or
priv->asp_mixer_regs_written.  Unchecked regmap_update_bits() calls on ASP
registers also fail at the initial read before reaching
cs35l56_test_mock_registers_write().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117125937.6589=
76-1-rf@opensource.cirrus.com?part=3D1
