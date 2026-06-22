Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B773A6F1B;
	Mon, 22 Jun 2026 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133454; cv=none; b=JBJHAvADV7QXB9i6j7Te0RAf4JIzHa3Gel+WlvbYETG9q+ISLwFk+qL41XtX6+ViVx8gAUakyayTxN2QR0mW+qDBaMmViondcjhho0Z+ZDOrA4sVnnS/zvABysvNzmo66SZzRoaIyKLbL5gx038APfmdkmELV5mzoSleuNzhXWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133454; c=relaxed/simple;
	bh=rdbxK10/RF3PYI0ZHOrClGSBqjL+4ueZDFu3DxgEkTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkhQxxWbADH/qMguCj/pm8XanssEm6BQimTVqXEoz6irK1AHGMij+dS8cZ8H2jgwAeP8JDXguM5Rt+iTCPQQEiJFvxdSLv6wWFZiagx9ktKWQufdalASdB+aslX63sAfcCbrN+zkyM1FzyN3nwQZ9Biqxtm7w0/oUrHNlrD86gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jH7lhj1E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jH7lhj1E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A521F000E9;
	Mon, 22 Jun 2026 13:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782133453;
	bh=9uJLyNreVTlbr1SNYZGicUMtN2H427gOySX/h3LnkcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jH7lhj1EqyIwd+vhCsjC43yNRV5CTq3QC5YsPrfJaOYXH/R7pF+l/oZOTKBCfbVpT
	 V7xNLLAgmtFd0+G4BfktMEAJ4iilOuSjdn9sNJ/y7wqXPHaPkQLZbynQj0H9dDteuN
	 62fpUdATTz1rBkqB10X/12gPWFcaJT1Yv4H6c2MPvCcSwJAVzw4l88f4AgB/M9ve4u
	 QKU605Qa+x+AVvNUKODHvj1DWMIgK0KSDOop5uxasdLeY5YT2679RapPTF6ZLdtnL7
	 gacSIBp20D3ZCBGK3Yi1UK6RmmgMG4UaWEob0j6qgGD30N2Sy65D+DUG1vw/Ahzjnl
	 X9uYwPpy/bEGA==
Date: Mon, 22 Jun 2026 14:04:08 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: rockchip: rockchip_sai: Hand over hclk control
 exclusively to Runtime PM
Message-ID: <229ba136-66eb-4a30-a316-58377836b4dc@sirena.org.uk>
References: <20260622005613.21870-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cKNKF0zS5mQrCs4i"
Content-Disposition: inline
In-Reply-To: <20260622005613.21870-1-phucduc.bui@gmail.com>
X-Cookie: Now I am depressed ...


--cKNKF0zS5mQrCs4i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 07:56:13AM +0700, phucduc.bui@gmail.com wrote:

> Although switching to devm_clk_get_enabled() in a previous patch was
> tested successfully, it introduces overlapping ownership of the clock
> lifecycle. Since the driver requires early register access to read the
> device version during probe(), enabling hclk at that point is mandatory.

> Clean up the design by:

>    1 Reverting back to devm_clk_get() to remove the implicit devres
>      enable/disable behavior.
>    2 Manually enabling and disabling hclk explicitly only around the
>      early register access before Runtime PM takes over.
>    3 Dropping the stray clk_disable_unprepare() at the end of probe()
>      so Runtime PM solely owns hclk afterward.

Note that runtime PM can be disabled at build time so we might not have
runtime PM at all...

> Links:=20
> 1 This change is based on the discussion around manual hclk handing durin=
g probe(),
>   as raised by Krysztof:
>   https://lore.kernel.org/all/20e4754b-ea9a-404d-b529-ec44a7263cbf@kernel=
=2Eorg/#t
> 2 Background for the earlier devm_clk_get_enbabled() conversion:
>   https://lore.kernel.org/all/2818018.CQOukoFCf9@workhorse/

> An alternative approach would be use devm_regmap_init_mmio_clk() and let =
regmap
> manage clock enablement around register accesses. If preferred, I can rew=
ork the=20
> driver accordingly.

> -	sai->hclk =3D devm_clk_get_enabled(&pdev->dev, "hclk");
> +	sai->hclk =3D devm_clk_get(&pdev->dev, "hclk");
>  	if (IS_ERR(sai->hclk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(sai->hclk),
>  				     "Failed to get hclk\n");
> =20
> +	ret =3D clk_prepare_enable(sai->hclk);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to enable hclk\n");
> +

> @@ -1482,8 +1492,6 @@ static int rockchip_sai_probe(struct platform_devic=
e *pdev)
>  	pm_runtime_use_autosuspend(&pdev->dev);
>  	pm_runtime_put(&pdev->dev);
> =20
> -	clk_disable_unprepare(sai->hclk);
> -
>  	return 0;

Are you sure that the runtime PM state there is such that it knows a
reference is held?  The driver used pm_runtime_get_noresume() so the
device didn't have RPM_ACTIVE set I think?

The runtime PM API really is a miserable collection of landmines :(

--cKNKF0zS5mQrCs4i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo5MscACgkQJNaLcl1U
h9CQYQf/adqv8RJKgMokC1NRZh4uUXUMaQXveY6Q+MCWIdNoRHiASHqgFrTG9Pxd
e7ai470vl9oHiWIgbD5/JmyvhvA/qRMeyl2rTW0dvGddQ2QIpcHGCXe5Q4+iZpnz
puv6Y3f5+oheBWibcvRji8Iujgv6Lau795A/Nru4W23LbqbUhmmKkHpIQTOeCqK/
5gW5gPobVrHrlI7GiZVNmtXgOAcbVN0SarwowDibZVU6/a/RFL4fYohXOarhx92z
PGH6Pu+Ga1e19CAXZD97Rl/tG4Yeye7uMm52FdKYOucHzzu8jNnriptlU4OVom3b
U+kSp5Fz3tWtqIKtTpspBv01TcoAAA==
=XgUn
-----END PGP SIGNATURE-----

--cKNKF0zS5mQrCs4i--
