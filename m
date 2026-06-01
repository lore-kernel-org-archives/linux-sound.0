Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EDD314D13;
	Mon,  1 Jun 2026 17:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780335283; cv=pass; b=nfg+qLC8F6Q+N7LDshGDmkk8NcEx9nVB2YBsZMQrvJLytLS25KFcFJDMIAK1pzk6pGLA25y9nNJ8nfho00NM29EYX8til8PX4XnDJOv+sX5KRJwqMmgoVTAzFT4U7XjmOeoXs2C5eQk4XmKo9Gsxa7327+DWrrGFdbaTAadgZTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780335283; c=relaxed/simple;
	bh=WnUr5tkPcW979y6rboWYPfHeKDXUZfZfjO3o9jAjy+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9YkqbGVy+YKp/kde1EBytZ3iM9tnDzFlJiFva0uOTUr2+bKi4OXtx5dUUAXhQ0AVWiwkz9G+mHvx+2rcsZelUqbZbvS27pcUjdYpoM7rqYg1bcwRztldrImVb35yGvAvWnwSb/Ns6igbbkGELKK/4rCYifScBdGn0ZHMTJd+eU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=LnSokZIr; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="LnSokZIr"
ARC-Seal: i=1; a=rsa-sha256; t=1780335259; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KUjHSEAqyzDpBW9ytMwE6RzfWmygkd76KDpyIdA9AnxWV8XpoLyatlMjcX5EWqG5mTCmR45o/M0EccPXpJlOHymH7jlMY2Qp0Fd9ScY6FTQlQVxLrkS0+xrnJXoKWIK+DHldupwueiKTwcIRnMIItWk6VBZu1lAQrlNehjCTiTk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780335259; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ftUmG+OMtMYx53fAFYMFIhG4FIOY7nTZCL8KELWvf00=; 
	b=H7I2iBmsE6lM9LNn/n+P9s2hLIgmCwhfagLCPDmzOsNpGXDBWPn7BDfyPeGHuwjWtFlhJLnzu25A7UiPAzAYLs3k+Dq36UWxhNiD0wupdzXReXQkkRKPd1N3LEl16e8w8LiMkDGYz5M75I7Yg/PTI08JANNP6bkQRmS9Vx1kOJw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780335259;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=ftUmG+OMtMYx53fAFYMFIhG4FIOY7nTZCL8KELWvf00=;
	b=LnSokZIrKPfrUEv0YKR+nIoe4mqL4SO+3q3ENkXFsDv6gdqdvV54KkjWebFCUvQR
	aQFE9GMeJ8JrfS4+Y9TQbyBN/LpTJlXeF1yFLC8yPxuAzrcRuaUZWk1NZdf8L4edD1k
	tf0jbDxd76+HBLYqr+HppjeR9DJw+zvP+1z7PG0E=
Received: by mx.zohomail.com with SMTPS id 1780335257580567.7189231938526;
	Mon, 1 Jun 2026 10:34:17 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id BD4E6182618; Mon, 01 Jun 2026 19:34:13 +0200 (CEST)
Date: Mon, 1 Jun 2026 19:34:13 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: =?utf-8?Q?C=C3=A1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
	Heiko Stuebner <heiko@sntech.de>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: rockchip: i2s: Use managed hclk and runtime PM
 cleanup
Message-ID: <ah3Ccc6D3c7sxg6U@venus>
References: <20260521-asoc-rockchip-i2s-devm-cleanup-v1-1-9319bd781393@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ofxtbn4d6r6smg75"
Content-Disposition: inline
In-Reply-To: <20260521-asoc-rockchip-i2s-devm-cleanup-v1-1-9319bd781393@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.2.1.5.2/280.325.56
X-ZohoMailClient: External


--ofxtbn4d6r6smg75
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ASoC: rockchip: i2s: Use managed hclk and runtime PM
 cleanup
MIME-Version: 1.0

Hi,

On Thu, May 21, 2026 at 11:30:07PM -0300, C=E1ssio Gabriel wrote:
> The Rockchip I2S driver mixes devm-managed probe resources with manual
> runtime PM and hclk cleanup.  This leaves the remove path doing runtime PM
> shutdown and clock disable before devm-managed ASoC and PCM resources are
> released.
>=20
> Keep the bus clock enabled for the device lifetime with
> devm_clk_get_enabled(), and move the runtime PM teardown into devres so t=
he
> unwind order matches the managed registrations.  This also removes the
> remove callback, which only existed for cleanup.
>=20
> Use a devm action for the final runtime suspend and register it before the
> managed runtime PM action, so teardown disables runtime PM before forcing
> the device into the suspended state.
>=20
> Signed-off-by: C=E1ssio Gabriel <cassiogabrielcontato@gmail.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  sound/soc/rockchip/rockchip_i2s.c | 68 +++++++++++++++------------------=
------
>  1 file changed, 26 insertions(+), 42 deletions(-)
>=20
> diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockc=
hip_i2s.c
> index 49ff86b35ef1..4e3af0f37941 100644
> --- a/sound/soc/rockchip/rockchip_i2s.c
> +++ b/sound/soc/rockchip/rockchip_i2s.c
> @@ -664,6 +664,14 @@ static const struct of_device_id rockchip_i2s_match[=
] __maybe_unused =3D {
>  };
>  MODULE_DEVICE_TABLE(of, rockchip_i2s_match);
> =20
> +static void rockchip_i2s_suspend(void *data)
> +{
> +	struct device *dev =3D data;
> +
> +	if (!pm_runtime_status_suspended(dev))
> +		i2s_runtime_suspend(dev);
> +}
> +
>  static int rockchip_i2s_init_dai(struct rk_i2s_dev *i2s, struct resource=
 *res,
>  				 struct snd_soc_dai_driver **dp)
>  {
> @@ -758,37 +766,28 @@ static int rockchip_i2s_probe(struct platform_devic=
e *pdev)
>  	}
> =20
>  	/* try to prepare related clocks */
> -	i2s->hclk =3D devm_clk_get(&pdev->dev, "i2s_hclk");
> +	i2s->hclk =3D devm_clk_get_enabled(&pdev->dev, "i2s_hclk");
>  	if (IS_ERR(i2s->hclk)) {
>  		dev_err(&pdev->dev, "Can't retrieve i2s bus clock\n");
>  		return PTR_ERR(i2s->hclk);
>  	}
> -	ret =3D clk_prepare_enable(i2s->hclk);
> -	if (ret) {
> -		dev_err(i2s->dev, "hclock enable failed %d\n", ret);
> -		return ret;
> -	}
> =20
>  	i2s->mclk =3D devm_clk_get(&pdev->dev, "i2s_clk");
>  	if (IS_ERR(i2s->mclk)) {
>  		dev_err(&pdev->dev, "Can't retrieve i2s master clock\n");
> -		ret =3D PTR_ERR(i2s->mclk);
> -		goto err_clk;
> +		return PTR_ERR(i2s->mclk);
>  	}
> =20
>  	regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> -	if (IS_ERR(regs)) {
> -		ret =3D PTR_ERR(regs);
> -		goto err_clk;
> -	}
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> =20
>  	i2s->regmap =3D devm_regmap_init_mmio(&pdev->dev, regs,
>  					    &rockchip_i2s_regmap_config);
>  	if (IS_ERR(i2s->regmap)) {
>  		dev_err(&pdev->dev,
>  			"Failed to initialise managed register map\n");
> -		ret =3D PTR_ERR(i2s->regmap);
> -		goto err_clk;
> +		return PTR_ERR(i2s->regmap);
>  	}
> =20
>  	i2s->bclk_ratio =3D 64;
> @@ -799,8 +798,7 @@ static int rockchip_i2s_probe(struct platform_device =
*pdev)
>  			i2s->bclk_off =3D pinctrl_lookup_state(i2s->pinctrl, "bclk_off");
>  			if (IS_ERR_OR_NULL(i2s->bclk_off)) {
>  				dev_err(&pdev->dev, "failed to find i2s bclk_off\n");
> -				ret =3D -EINVAL;
> -				goto err_clk;
> +				return -EINVAL;
>  			}
>  		}
>  	} else {
> @@ -811,16 +809,23 @@ static int rockchip_i2s_probe(struct platform_devic=
e *pdev)
> =20
>  	dev_set_drvdata(&pdev->dev, i2s);
> =20
> -	pm_runtime_enable(&pdev->dev);
> +	ret =3D devm_add_action(&pdev->dev, rockchip_i2s_suspend, &pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
>  	if (!pm_runtime_enabled(&pdev->dev)) {
>  		ret =3D i2s_runtime_resume(&pdev->dev);
>  		if (ret)
> -			goto err_pm_disable;
> +			return ret;
>  	}
> =20
>  	ret =3D rockchip_i2s_init_dai(i2s, res, &dai);
>  	if (ret)
> -		goto err_pm_disable;
> +		return ret;
> =20
>  	ret =3D devm_snd_soc_register_component(&pdev->dev,
>  					      &rockchip_i2s_component,
> @@ -828,36 +833,16 @@ static int rockchip_i2s_probe(struct platform_devic=
e *pdev)
> =20
>  	if (ret) {
>  		dev_err(&pdev->dev, "Could not register DAI\n");
> -		goto err_suspend;
> +		return ret;
>  	}
> =20
>  	ret =3D devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Could not register PCM\n");
> -		goto err_suspend;
> +		return ret;
>  	}
> =20
>  	return 0;
> -
> -err_suspend:
> -	if (!pm_runtime_status_suspended(&pdev->dev))
> -		i2s_runtime_suspend(&pdev->dev);
> -err_pm_disable:
> -	pm_runtime_disable(&pdev->dev);
> -err_clk:
> -	clk_disable_unprepare(i2s->hclk);
> -	return ret;
> -}
> -
> -static void rockchip_i2s_remove(struct platform_device *pdev)
> -{
> -	struct rk_i2s_dev *i2s =3D dev_get_drvdata(&pdev->dev);
> -
> -	pm_runtime_disable(&pdev->dev);
> -	if (!pm_runtime_status_suspended(&pdev->dev))
> -		i2s_runtime_suspend(&pdev->dev);
> -
> -	clk_disable_unprepare(i2s->hclk);
>  }
> =20
>  static const struct dev_pm_ops rockchip_i2s_pm_ops =3D {
> @@ -866,7 +851,6 @@ static const struct dev_pm_ops rockchip_i2s_pm_ops =
=3D {
> =20
>  static struct platform_driver rockchip_i2s_driver =3D {
>  	.probe =3D rockchip_i2s_probe,
> -	.remove =3D rockchip_i2s_remove,
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  		.of_match_table =3D of_match_ptr(rockchip_i2s_match),
>=20
> ---
> base-commit: 40cc9602caf2539369bd3dd7d66ee67e204e75ef
> change-id: 20260521-asoc-rockchip-i2s-devm-cleanup-6cade5f495e5
>=20
> Best regards,
> -- =20
> C=E1ssio Gabriel <cassiogabrielcontato@gmail.com>
>=20
>=20

--ofxtbn4d6r6smg75
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmodwo4ACgkQ2O7X88g7
+prfDQ/9HZBSvaYcBXn13fk4Ncegbv8u6RLBL8+prh7UNIBxmyyI+dJVHC+pk/m9
HrrrJMK42wZ226eFsozZXx0wxA7Fl3+4LgsRKCrjY7kDJjkPXSVmdLjivD3vlJri
EGxShZv1rUXEboJdHjZamO7RBsvnNoOpmxLVkKxvYsl7LCpWFIbTGUN/v4xexi3N
bmSvb0dEpD9+1Hte9ty5/WTfIYPaJxYQTC6jMFYmBGBxTjSK9VpD3bNJrZgaM4Ja
ra0p4HxglgZJl/ab+Lp2qwu6mRqFnJnlhwjsv5wdsrqn6wu6ldiNmoY5JfHSZBE4
xV+K8FRf0LKBtqWfz9f+3r3V7Jd3FniIcW6/5CuGGBaAuaCqUxe/Clgc5rPMl+AS
sWMNXIEKG/zAmM1SGb8P48Qx6H7aEAzYyCNb0riZQ+wr5zuxKnlFVKfdanP0Tk/d
oBOCMnu8TGpzxIt/oIzia7avlPuC1QIi46NE3SQ3ngRngrZcJBajAhDpseUfVEAR
aQQf9vVr6UxrfYi1okaYDgtAeY40SI1cnZjzggzrA9+i0EvEqMv3F0LLb9X9ajG7
JQ8V1s2DckE3AGeKOGn3eTIKh2u32rk2PWXWy9mO7LDK+LWsr2i6Q8TeT96QsrgQ
wa1XZsZ8r5kiyooYHjLC5Z1m/lECrps9Bqy+rEVyyfBijrIqq1I=
=Nry6
-----END PGP SIGNATURE-----

--ofxtbn4d6r6smg75--
