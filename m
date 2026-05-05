Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE573264C2;
	Tue,  5 May 2026 23:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778025505; cv=none; b=MZDCYd7uDszVi5yFSnFRlU7Vn0FQniapqudWhdNbCAET2HtAhuEHgyL6cwFEfsng8U6SvxaQ6Ta8MW8t0oYZesAYFzq998CJjkRRIB9tCD3pNg+H2Ww7z8P7coOJkmF3dNj1TurGuFytFzrxm+Da/cBcJDaHCPx2cJKP9SkFqls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778025505; c=relaxed/simple;
	bh=oZi5mOLJO5tHaHGOBk0mIAUMjE6TaWnkHFAMBM6by+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecdur72VTH8vZEU7vWMSHMSl7e3UJu5G7mCKtXxaV2diAz6UJ3QHUosUWGOQcVjNE92gAVCeExpQhriSXWAzSSKi4TyvGEqofy5EXMbVzbx5usBiOrtBDnKS5rTg/EaAsusEKqoph9i5l6xYRAJUZzcT/JmpVGEcVtIsCSoS9WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JsmR+I5H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JsmR+I5H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95368C2BCB4;
	Tue,  5 May 2026 23:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778025504;
	bh=oZi5mOLJO5tHaHGOBk0mIAUMjE6TaWnkHFAMBM6by+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JsmR+I5H5ev8eTvCdYfQowrbT0G+qLlOffLa6uWw/PMCnR5YANoFysupz43z1cPV3
	 yygfJJWwCDheUdWDgoCBEM/PYXcP6bOICgdUTDCg1Ym7sB8ukKk+5POoeBuxS4MiPg
	 5Crk8mUZ/kMz/n5PwGij9h/Hot1o4HwTGePlMgZ1lVq0hhnc1YcsGfDb9H+CA2LJus
	 Hj/HYGg5IbzsJU6HJTeTMG9NqpFNOIYdNAl7iXo5QTIoY2t5k1olVcKiSDtujuFUP3
	 4Fehqr9TDWriaorqRQdmuUF+RHQWUcEJm9jwqsaPoHRo66yxbWNa8P0zAKWAjoE5AW
	 XXI5hzmYEtpbA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 9B99D1AC5878; Wed, 06 May 2026 00:58:21 +0100 (BST)
Date: Wed, 6 May 2026 08:58:21 +0900
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/3] ASoC: pxa2xx: push gpio usage into arch code
Message-ID: <afqEHZSUCASXPUze@sirena.co.uk>
References: <20260505202426.3605262-1-arnd@kernel.org>
 <20260505202426.3605262-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0lcLZ48zRt5QpNpN"
Content-Disposition: inline
In-Reply-To: <20260505202426.3605262-2-arnd@kernel.org>
X-Cookie: Alex Haley was adopted!


--0lcLZ48zRt5QpNpN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2026 at 10:24:25PM +0200, Arnd Bergmann wrote:

> index 7df78867db49..0d5eaf4b100c 100644
> --- a/include/linux/platform_data/asoc-pxa.h
> +++ b/include/linux/platform_data/asoc-pxa.h
> @@ -6,6 +6,6 @@
>  #include <sound/pcm.h>
>  #include <sound/ac97_codec.h>
> =20
> -extern void pxa27x_configure_ac97reset(int reset_gpio, bool to_gpio);
> +extern void pxa27x_configure_ac97reset(struct gpio_desc *reset_gpio, boo=
l to_gpio);
> =20
>  #endif

You're adding a use of struct gpio_desc but not including the header for
it or declaring it.  Which won't really matter here but still.

--0lcLZ48zRt5QpNpN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn6hBwACgkQJNaLcl1U
h9BV7wf+Jmw366XieA0d2MdbU3V0YXlDc+OCwyOPneDbRc8EVPKcVBtuGL3uDNrg
mcKj4o5Vz6xBqJTo601VF9QKjxP8m6GHMoBaqnTigLj2cpijXYk/P/IRg5R5++tZ
HUivwwyNM4Irp8wRyEn2+I+6cdRX/urSBzRNVPhyIC/VIKNSG4BjfMr7v2t26PMj
J1iCQ/psxlDDj8pxFHtBlgG9FTLDJFJUnbAGVSE3kMFFk9XAbnj2rTOqvtzfXt62
Z2aDCvNtzaCV/H0mN1uRyJGNdf2GCv8Qg30aT7ytbEB0PBUbozCbe4ZYQbLQ74N6
kITzSVhWFCoWqejbh9OCPiE1wKlwEw==
=yhzA
-----END PGP SIGNATURE-----

--0lcLZ48zRt5QpNpN--
