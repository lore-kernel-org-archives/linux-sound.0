Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410CB409128;
	Mon, 15 Jun 2026 17:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781545329; cv=none; b=hdQLqUjPYIKK78IDDyTyrVoZjuOdceuxIygUqkcdg8IP0ug5xVVTnJO2UWbog9YTaLKTVh3Jt6YpQ7gjW+uHsBpaJAoyKP4p9a0izn8ULy6ecDoQ/ZaJqi7rvVexVsI154vLBxeDZk2edUGAvMuIDYSWMCYAhi9daK1afxK3q74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781545329; c=relaxed/simple;
	bh=yybbf4grq/PTx5SLxZX/Rk2DKgwFyvTu/OFqgdTpTbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSyFmymCsEBLe2Ri3pSeGLAQmdtsjN8q1Hu9m6YpxvasT37TVN9zhaObGTBrKz7DkHQSvnw6dt5PBmMXq+E1wMx/bdFo3+TNcDr3SWd0mhbZanHERykYqummjdZ5mrtiNqx9eOxTqycr/uQM+zg/hUsY9Tl7WoRtN6hUr5b4qoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YO6IVEZa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YO6IVEZa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5DE1F000E9;
	Mon, 15 Jun 2026 17:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781545327;
	bh=roYVMc63L58mVDe0KaBW94nZVmEmmMfD6TQja88Liis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YO6IVEZajC7trIbZo9nQlVcPlmad5DEY2J/e8kSTlA/aOSZijFcZ85Y1ysogdBA4Y
	 XC7zi2psbcKKhNZ+8u9pD4F2W+PYJnVMYWClEPJJhFeg+EBK2TtWRHTTgwuwNfEX2U
	 lpw3+JhD9j+vA+PSzzYk5hF/yRnQKpyFsFvxK8lFsO5BhzQRA8Ny6YGt5GQOrTXgmd
	 p2wDcviQC7oXTPZnDPR3OWQApvWK8BisDVEYslemd3OzpAzRQBic8xDbsg3hKuU64Y
	 xfiWnp8OZTJP1RSfRD9xmgJGL0BJCTcAtZJw3+Ca954bE5cdwDadTXMDiF75NQ2fMm
	 SUwxxAbZVJl9A==
Date: Mon, 15 Jun 2026 18:42:03 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	kernel@collabora.com, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: cs35l41: Restore register state after system sleep
Message-ID: <bdc50ca9-7126-464e-9c11-05d308c8aa13@sirena.org.uk>
References: <20260615-cs35l41-s4-support-v1-1-f5a21e35dd9e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l4avMn/HOqa158IC"
Content-Disposition: inline
In-Reply-To: <20260615-cs35l41-s4-support-v1-1-f5a21e35dd9e@collabora.com>
X-Cookie: To stay youthful, stay useful.


--l4avMn/HOqa158IC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 10:54:10AM -0400, N=EDcolas F. R. A. Prado wrote:
> Currently, on the Steam Deck LCD when the system goes into hibernation
> and resumes back, the speakers are silent when playing with:

>  static int cs35l41_sys_resume(struct device *dev)
>  {
>  	struct cs35l41_private *cs35l41 =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	dev_dbg(cs35l41->dev, "System resume, restoring state\n");
> +
> +	regcache_cache_only(cs35l41->regmap, false);
> +
> +	ret =3D cs35l41_boot(cs35l41);
> +	if (ret)
> +		return ret;

The error handling in this function needs some attention, we probably
ought to go back to cache only mode here for example.

> +	ret =3D cs35l41_init_boost(cs35l41->dev, cs35l41->regmap,
> +				 &cs35l41->hw_cfg);
> +	if (ret)
> +		return ret;
> =20
> -	dev_dbg(cs35l41->dev, "System resume, reenabling IRQ\n");
>  	enable_irq(cs35l41->irq);

We can also leave the IRQ disabled now which might be fun if it's
shared.  Not sure there's a good solution to that though, and we're in
trouble if resume fails anyway.

> -	SYSTEM_SLEEP_PM_OPS(cs35l41_sys_suspend, cs35l41_sys_resume)
> +	.suspend  =3D pm_sleep_ptr(cs35l41_sys_suspend),
> +	.resume   =3D pm_sleep_ptr(cs35l41_sys_resume),
> +	.freeze   =3D pm_sleep_ptr(cs35l41_sys_suspend),
> +	.thaw     =3D pm_sleep_ptr(cs35l41_sys_thaw),

This undoes far less than freeze does...

--l4avMn/HOqa158IC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmowOWoACgkQJNaLcl1U
h9Bhpgf5AeLcoX2BhUwjx2RMdKv53gV0K9SHnojtrKKfJ9VosCGul3rhjBGnAN7r
YqGFOcKPaLY8h9TRKQ9jTyuV5QgRxQ9jkK7YwIytWefY887MSUlRPqkSFW8/CBm7
Q1VLKY2F2+o6K3jfjY8uI68MgAMyotRnY0GOewRNy7qhCLF5NTrLNHbyvadf/OsV
b3Xsp1YN3MNy13iBNLHc62iKyuYzDrQUvDL/iqVwye6iaMs4B+K1lmU/5Mkb8+id
nOXQk584Xxda+qEzwvNFEGIxzvLGpSKh+uu4TF0w5Zyek4bcPl1IzqbJkCoz3cpG
GAHzNkqcuXyy3RvCQE8RQ1q6TBq1jA==
=w7j/
-----END PGP SIGNATURE-----

--l4avMn/HOqa158IC--
