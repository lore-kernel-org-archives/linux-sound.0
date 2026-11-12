Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481453;
	b=lNhIQpA9iIKzhgNzaTd74s/yimopO7cZgmRxU/5peh9ISueyf4vVa7LF5vP20O/FIted
	 f1PU5r1rxmJyrOLjl4xmeuHML6T5lSF8pszFvwvgEXG1cw1BFaZbfJaZyq2JVPplnnMRO
	 jJI4tKrzSjPrTdHO6kKrl+KtdI0d+YRE5nDbRDwr1gi/jp4j6XJxvTWy5ziYrV0AJwItK
	 lRDhumC70u3JegPVf8RyQfVyUr8nwPrtt2zP0yvHzJDssCBCp1ASkK6DS9XXrOBqVmKVo
	 +nkim4pIbZjutIibsM6QSI49fydlqOuBLEbLrKmvMAy9WbBaWG+QIq1mHE4FC8ahKvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481453;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SlXQkG2Box+UiTGEILD88UfQbq8wUpdONeKPbdJutuQ=;
	b=OqynlGp8qqNsOv5ScMJxnAIA2/3Olizn7LsfVgu9tTiidsYjUMQmC/d/NgZ6+/eDKc0w
	 1g9WxNWMDtdCtE4UNizpFbtAgYn60bfg6dCZy4mLwkjuVkwX9fesiVyMUSL+KFGMPlQ/v
	 2s/KZTaZCuLLYOmTETz2ZBqxzRWUHLSjqFXDBx+jzq5n+22Eoxp7zqTMRasOWM6Ysfwb4
	 kj/THUjGQC/8wx3mu6X3qmaOqc67L9Mo9ThrOWKdTxumnW61Cjv3cTZXX8VI2yIUTuuL4
	 uA5NqYA0q4gGOOhiCkUvvtGKq6QwtqbvfN6DPRFoWQ1EqpvXKvnFLV47+CNTd9BBFwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lMAC9WCQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045B7606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lMAC9WCQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7773D1F00A05;
	Thu, 12 Nov 2026 11:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481452;
	bh=SlXQkG2Box+UiTGEILD88UfQbq8wUpdONeKPbdJutuQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lMAC9WCQW2KpbVmWyKKyriVlK7WghVd2viByYETZ9uTraH9htGBXUOETrFGWjAtRo
	 TLAqozohZwwczHhl4dLyj8N8HftAQGGiMHBeOFFeogihvN2cn3dPK98sCJEqI8KXwO
	 GKwdUDOVUAC72Qv2gJd/7RuqXtT8FHoo9/LlWe2POIh+RePSVo2uQiCSIDco+ewtmF
	 TYllHIvUbG9MeS0qn3C4Of1GqcmOU28xEFTPJ0KomjzW8rRHfWxfNs/6xtcWtG8nU/
	 krnPPkG07yedD5E5LEMvqeknsmWK/j7lb+QfAS6V5g8Oex2Gdt4QQwZSA5ejRBxUIt
	 tbMXe9KCR8bFA==
Message-ID: <sashiko-outbox-210986@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] ASoC: fsl_asrc: Use devm for runtime PM cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261112105116.32274-6-phucduc.bui@gmail.com>
References: <20261112105116.32274-1-phucduc.bui@gmail.com>
 <20261112105116.32274-6-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 11:04:12 +0000
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
- [Medium] ASoC: fsl_asrc: premature suspend action registration in
  fsl_asrc_probe()
--

commit d552655304748475ea350f20bd450d9524c4e316
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: fsl_asrc: Use devm for runtime PM cleanup

This commit replaces manual runtime PM cleanup in fsl_asrc_probe() and
fsl_asrc_remove() with devm_add_action() and devm_pm_runtime_enable().

> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index c97f814d7358b..09e09164a1061 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -1258,6 +1258,15 @@ static int fsl_asrc_m2m_pair_resume(struct fsl_asr=
c_pair *pair)
>  static int fsl_asrc_runtime_resume(struct device *dev);
>  static int fsl_asrc_runtime_suspend(struct device *dev);
> =20
> +/* devm action: runtime suspend the device if it is not runtime suspende=
d yet */
> +static void fsl_asrc_runtime_suspend_action(void *data)
> +{
> +	struct device *dev =3D data;
> +
> +	if (!pm_runtime_status_suspended(dev))
> +		fsl_asrc_runtime_suspend(dev);
> +}
> +
>  static int fsl_asrc_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np =3D pdev->dev.of_node;
> @@ -1413,22 +1422,34 @@ static int fsl_asrc_probe(struct platform_device =
*pdev)
> =20
>  	platform_set_drvdata(pdev, asrc);
>  	spin_lock_init(&asrc->lock);
> -	pm_runtime_enable(&pdev->dev);
> +
> +	/*
> +	 * Ensure the device is suspended after the IRQ and component
> +	 * have been released.
> +	 */
> +	ret =3D devm_add_action(&pdev->dev, fsl_asrc_runtime_suspend_action,
> +			      &pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return ret;
>  	if (!pm_runtime_enabled(&pdev->dev)) {
>  		ret =3D fsl_asrc_runtime_resume(&pdev->dev);
>  		if (ret)
> -			goto err_pm_disable;
> +			return ret;
>  	}

[Severity: Medium]
If CONFIG_PM is disabled and fsl_asrc_runtime_resume() fails here, does
devres unwind end up calling fsl_asrc_runtime_suspend() while the clocks are
still disabled?

When CONFIG_PM is disabled, pm_runtime_enabled() and
pm_runtime_status_suspended() both return false.  If
fsl_asrc_runtime_resume() fails, it cleans up any clocks it enabled and
returns an error, which now triggers fsl_asrc_runtime_suspend_action().
fsl_asrc_runtime_suspend() then reads the volatile REG_ASRCFG register over
MMIO with all ASRC clocks gated (which can cause an external abort or bus
hang on i.MX) and calls clk_disable_unprepare() on clocks that were never
enabled.

Registering fsl_asrc_runtime_suspend_action() after the !pm_runtime_enabled=
()
block (or using devm_add_action_or_reset() after devm_pm_runtime_enable()
with the !pm_runtime_enabled() resume handled first) would avoid suspending
an unresumed device.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112105116.3227=
4-1-phucduc.bui@gmail.com?part=3D5
