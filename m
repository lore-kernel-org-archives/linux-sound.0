Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481066;
	b=ham2JGP91sREQiY7++ktdYxBkjY122CWbD9gRivLYBkuvPTGMnZrk5+E+zTxqSCa9b2/
	 6IW0QdkXn1Z7+pDg1hJd4MwZZu1TtwDDiwb6snBNWiQ6AIa5WcQTqoWsK+GigDuLdXvpu
	 3BkkoL+BKbyGwyl+uCQXGUf3QYmnN1d1fk3BotlLF4qVV8S4UJErETiYmUpQBxyOQYsD+
	 aPdDx5kU4h8UzH1dqC8CcJrYyvVh20vnFT8S4fPHyGXHLDXTcjwUobe5wrVISUWCEPLNu
	 2dCBRdIERpydlzpAHIs6zbGQXuNUllAa1kzWQsesSBEYvFDtRQyRzC8rGU4jBDxnSHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481066;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dLGawU+eQPktE9URAIDyRIFT75P1b8a0ibdQS+1c9Mk=;
	b=j6gYVm0wPUn/jOJMJFhJnb0DhB87sqLhh/sP0MFm+AG06teg2yWzbLWB/pW6hR0xqamG
	 hMLjE5iexzutSDkmy4BmMvcgIdU7OFKnnlLhFhRVKhNZoApViwoXxCI0Nx8n52Q3hLa3P
	 fnCviXyUwXBkV+S2JInArY/IeKa6U92HapuHe8XD9lH+Woj1jfjMNjc2fxtBKYMibWsRs
	 yywghxw2wTQvMZoPOv3/ZDmvoe3F4hwlYMw10Qh8C2NRd/a1AvUEkasaT6wwpHuYmOPsH
	 Mz3Q02BtlmWOGHAPHyNh0Y6bxwm7DmXHpWjoVoeZUDoZiSEPfpYPF9cswH+Oke56XxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JotPySjt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C9D606A323
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 10:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JotPySjt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC08C1F00A05;
	Thu, 12 Nov 2026 10:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481066;
	bh=dLGawU+eQPktE9URAIDyRIFT75P1b8a0ibdQS+1c9Mk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JotPySjt8L5VozyUEvgd46nQJfHdYyLO7aWndjF5K5TVoDiwq4UQnohUECiRGHBvE
	 pAZy9pfrZhRdjoCIrScm1QiZ6P1/sUJipoaYXS+/y0Q2UubLWYL4uSr+MwtJnmk112
	 sJMZgnVRJAIHaEXpJJNzemPn9hyZ6n5ug/7803egXFBZ40sf6kFUlrFfag7rcF/6az
	 l8PKjEXcL8rnYerJ4a3KfEUHfhkcYq2VrjjVcgwuQPmOYMi5CweSGayVGRmRZgyFsp
	 Stq4Gd96EgM9SloKbmCVjV3NNw4AiJTpa74g9udYXHzDiZjZEC750cQbZoJzKCnNrV
	 rwct/tq7Y98Lg==
Message-ID: <sashiko-outbox-210979@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] ASoC: fsl_asrc: Fix handling of deferred spba clock
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261112105116.32274-3-phucduc.bui@gmail.com>
References: <20261112105116.32274-1-phucduc.bui@gmail.com>
 <20261112105116.32274-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 10:57:45 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] ASoC: fsl_asrc: stale register states in
  fsl_asrc_config_pair() [1]
--

commit 62ba61794f6dac52b1de47eef34f329de32edee9
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: fsl_asrc: Fix handling of deferred spba clock

This commit updates fsl_asrc_probe() to return -EPROBE_DEFER when
devm_clk_get() for the spba clock defers, while preserving a warning for
other error codes.

> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 055593d5d37b6..c91ffb5e0c5e8 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -1315,8 +1315,11 @@ static int fsl_asrc_probe(struct platform_device *=
pdev)
>  				     "failed to get ipg clock\n");
> =20
>  	asrc->spba_clk =3D devm_clk_get(&pdev->dev, "spba");
> -	if (IS_ERR(asrc->spba_clk))
> +	if (IS_ERR(asrc->spba_clk)) {
> +		if (PTR_ERR(asrc->spba_clk) =3D=3D -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
>  		dev_warn(&pdev->dev, "failed to get spba clock\n");
> +	}

[Severity: Medium]
This problem wasn't introduced by this patch, but can [1]
fsl_asrc_config_pair() leave hardware registers with stale values across a
warm reboot?

Earlier in fsl_asrc_probe(), devm_regmap_init_mmio() initializes the regmap
cache to all-zero defaults without issuing a hardware soft-reset first:

sound/soc/fsl/fsl_asrc.c:fsl_asrc_probe() {
	...
	asrc->regmap =3D devm_regmap_init_mmio(&pdev->dev, regs, &fsl_asrc_regmap_=
config);
	...
}

When fsl_asrc_config_pair() later calls regmap_update_bits() on REG_ASRCNCR,
REG_ASRCDR, REG_ASRMCR1, or REG_ASRCFG with a target field value of 0 (for
example, a 24-bit audio width or 1:1 clock ratio), regmap_update_bits() sees
0 in the cache and skips the register write, leaving the hardware running
with non-zero dividers and modes from the prior boot.

[1] https://sashiko.dev/#/bug/linux-75f0b96f-de73-4139-881e-4c69d6455f22

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112105116.3227=
4-1-phucduc.bui@gmail.com?part=3D2
