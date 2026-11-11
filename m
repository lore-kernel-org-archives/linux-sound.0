Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371761;
	b=Pg7/KFlLBIPHw5Fd8qwTxBLiz6q/pMmyWrX2YSWUjtyaDeYvMkoGkTaYO1ord7Uc8qpm
	 yvw12V63RfC2E7zEW+3zNxX48pjiXcnsoUnSCDasO9OxnbByjBj/Bf+C0O4H7NJHX7mIe
	 5iMM5+1XHsXrL7K+DAlCaqErh8TiPFNvrsRIpJ2lnEVBCoBmSfOR4IapJUaMSGH8hMCX2
	 298TM5xMfnY1wCqh5j3hhRqacV7yE0AhVXWaQLCwMD+vstR0Ws/XNxt3zRewRfz0zStaZ
	 AjTa0T69LV4cWAhHeN02fq5gkQPinNMl+k/Y/nZDSfxoH0Mckk0DoiaefYyBhKxs0WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371761;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JzRWvp9iglYgt4INj5Kec7JLaZ8xJsIGbhkL7FJ9QAA=;
	b=o/ufdxjcyhkGFgjcXxIET7ACwimxDZjJff4b++UiQ/mf8d92+GUCwCnnnoVFqbsBYs7c
	 9EgpxDmA8eBhXSIUYdGGKfHmf5IQi28O4dqs6dCn2OVed8LOllb3vvBoUo/1iPq5W//x2
	 rFkezii99R3xY5LNKt6burB8oDwOana7jhsHF1ET3u2ywrOVrTY8x6RwUjrUL9wKp0Q6i
	 EpSj5DyB4YvjfgB/gvwC/MGjJIPzfQAmVsAAz+69OiXtiCuJ+SVCmJ+AmenJFMhEdl1uk
	 tG5SURkrm3hkRzpZWQ0q2zSFYvWm9N8Ume1fXpbsVyQ5x/CuklWFGYMN27gfFYc0bOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QeZspO+s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE79A606A31C
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 04:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QeZspO+s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE931F00A00;
	Wed, 11 Nov 2026 04:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794371760;
	bh=JzRWvp9iglYgt4INj5Kec7JLaZ8xJsIGbhkL7FJ9QAA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QeZspO+sCO85c38V8CH49hHaFeWHT/h+2LHYL6MKnOIAlAlcudgmN86UEbiFxTfgr
	 aRMeZAxEDY/AyJcRWAk4VjU5Nd+OGsELBpCkUx36z4oPDiVIqkHdW+0HKbmOJNzQde
	 2fyrslosyynpqVavXkJn+wqiD8TuhnOsZHhuW5zMFAC1sPsnULMHWqGpRm1B3Xhfwq
	 cVR78DZ+Al9tHGnpLYuOg1rpdYEg5ApN7juO9FTQCU16Pt75eYzoNtPAmA3U59zGlG
	 tvlfMFXfQbwPCHbnXk534D/UGnf3zP1TWXKn2N+h/bXwtSXw8ej8lt5ZDVywuC7uXl
	 BIPpMQruo3ltg==
Message-ID: <sashiko-outbox-208300@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: atmel-i2s: Use devm_clk_get_enabled() for pclk
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261111042746.14714-1-phucduc.bui@gmail.com>
References: <20261111042746.14714-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 04:35:59 +0000
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
- [Medium] ASoC: atmel-i2s: wrong IRQ and pclk ordering in
  atmel_i2s_probe()
--

commit 722d5e2f3add0fa840d1f0e68c8baa8331615c85
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: atmel-i2s: Use devm_clk_get_enabled() for pclk

This commit replaces devm_clk_get() and clk_prepare_enable() for the
peripheral clock with devm_clk_get_enabled(), removing the manual clock
cleanup paths and the driver remove callback.

> diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
> index e1d8af0562341..a3aeb8e607f61 100644
> --- a/sound/soc/atmel/atmel-i2s.c
> +++ b/sound/soc/atmel/atmel-i2s.c
> @@ -660,8 +660,8 @@ static int atmel_i2s_probe(struct platform_device *pd=
ev)
>  	if (err)
>  		return err;
> =20
> -	/* Get the peripheral clock. */
> -	dev->pclk =3D devm_clk_get(&pdev->dev, "pclk");
> +	/* Get and enable the peripheral clock. */
> +	dev->pclk =3D devm_clk_get_enabled(&pdev->dev, "pclk");
>  	if (IS_ERR(dev->pclk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
>  				     "failed to get the peripheral clock\n");

[Severity: Medium]
Can enabling dev->pclk here cause atmel_i2s_interrupt() to dereference a
NULL dev->regmap or access registers while dev->pclk is disabled during
teardown?

atmel_i2s_probe() registers atmel_i2s_interrupt() via devm_request_irq()
just before this call, while dev->regmap and dev->dev are only assigned
after devm_clk_get_optional():

sound/soc/atmel/atmel-i2s.c:atmel_i2s_probe() {
	...
	err =3D devm_request_irq(&pdev->dev, irq, atmel_i2s_interrupt, 0,
			       dev_name(&pdev->dev), dev);
	if (err)
		return err;

	/* Get and enable the peripheral clock. */
	dev->pclk =3D devm_clk_get_enabled(&pdev->dev, "pclk");
	...
	dev->gclk =3D devm_clk_get_optional(&pdev->dev, "gclk");
	if (IS_ERR(dev->gclk))
		return PTR_ERR(dev->gclk);

	dev->dev =3D &pdev->dev;
	dev->regmap =3D regmap;
	...
}

Previously, clk_prepare_enable(dev->pclk) was called after dev->regmap
and dev->dev were initialized.  With devm_clk_get_enabled(), the
peripheral clock is enabled while dev->regmap is still NULL, so a pending
interrupt (for example across a driver rebind, as ATMEL_I2SC_IER is never
masked on unbind) will hit a NULL pointer dereference in
regmap_read(dev->regmap, ATMEL_I2SC_SR, &sr).

In addition, because devm_clk_get_enabled() is registered after
devm_request_irq(), devres teardown on probe failure or driver unbind now
disables dev->pclk before freeing the IRQ, leaving a window where
atmel_i2s_interrupt() can read I2S registers while the peripheral clock
is gated.  Initializing dev->dev and dev->regmap and calling
devm_clk_get_enabled() before devm_request_irq() would avoid both issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111042746.1471=
4-1-phucduc.bui@gmail.com?part=3D1
