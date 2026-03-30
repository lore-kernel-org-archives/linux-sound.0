Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6A0364EA3;
	Mon, 30 Mar 2026 15:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774885740; cv=none; b=Ssk/3P0B1kARncuzo3IFdei7wIRKylLU/GL1MxE3yVdLP695FLQ8V0P5hX4LAvT/rrpxaLNxUrnSAUmmlJ/Sh3vceh845Jx0iA0OGVjvv8+6k9rouSwi+gIi5Jw++vogOJeqPDFbgdNs8JRVQC1WknYtWoVqhJK67Uyo2NJBJrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774885740; c=relaxed/simple;
	bh=c3DcR3gdUc5qDYwinSxx9wie4yGGHZTU5Qmvzn/OVL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9Ye27kDOzEorwOAfOKAwFGZCEB7YlNqv4UvMbHZ6iFnviQTKd1q4w3/tXRUBTpda/s5qNkRCANmmV024brgU828qfMUpeoxJElwJ1hpAKNm16ecmLQ7vhcGgzU0o20ulMD1kYNFyus1364lvZrrhfHLma/TKxNd3q7Vve8abHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nenM3QzT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nenM3QzT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738FBC19423;
	Mon, 30 Mar 2026 15:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774885740;
	bh=c3DcR3gdUc5qDYwinSxx9wie4yGGHZTU5Qmvzn/OVL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nenM3QzT1aXixLPLC+neDk2wyrlOhEvZAbO786uaH/GIwrkciwetNZTFz3q0eP6fX
	 NfEokuokInc0SGTNuM8lLA0XxQ7SMcEPI74Cw4bRUpnp9dyv7lxTx3ocYumVaC3G4w
	 Sy0NQ69K+TyFtlqxrsQVEsng1VA6qDz36DNuk4xBpSAkko85riJtuss6biaG4jgoeQ
	 P1+WyyEQ7YptJeUFqJQDWrVm7cW2GZfleD+y4cZzIBhVubn91u2uT0iOZOeu3SohZi
	 ltEaqX5m0XibHPmnuU6abSJJIxTmCZBnyOaEFk7B4f6GnSRxwP4ocRntGRIn9/Hprb
	 JagEIgyCTdYxg==
Date: Mon, 30 Mar 2026 16:48:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/4] ASoC: Add support for GPIOs driven amplifiers
Message-ID: <27e23c7b-4aca-41d2-96b8-df02c52e8121@sirena.org.uk>
References: <20260330101610.57942-1-herve.codina@bootlin.com>
 <4daaa17d-5673-4efa-92ce-4f2ce87eb812@sirena.org.uk>
 <20260330173944.3fdc27ec@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Go/sM200WrU4YOFa"
Content-Disposition: inline
In-Reply-To: <20260330173944.3fdc27ec@bootlin.com>
X-Cookie: HUGH BEAUMONT died in 1982!!


--Go/sM200WrU4YOFa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 30, 2026 at 05:39:44PM +0200, Herve Codina wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > This sounds a lot like simple-amplifier.c?

> The gpio driven amplifier proposed is more generic and can handle
> more complex design. I.e. op-amp + resistor and/or line (mute,
> bypass) switching. Hardwares handled by this driver are a superset
> of just dio2125 and so simple-amplifier.c.

> IMHO, it makes sense to have a specific driver for those kind
> of hardware design.

Right, and if it's a superset it feels like it should all be one driver
rather than two separate ones.

--Go/sM200WrU4YOFa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnKm2UACgkQJNaLcl1U
h9BHQQf8CVVbWHnNEH+M5HqSW7TikbMdvEqNJxt/Bp1keCQKeD7hINwpOXZcbhl2
xNh15rOn+fjdemD7LNtmp6NzUE965bRY7hrkBQ9B1G1EFZYCw1ouhuD62ujmztr9
U5onR76o8Dl2a0iY/qF3OVXIEeyNJOmEzmTFS7XFUM4WJrEBN8wKNitz2ArKtp3q
+Fi+sWcTo5TluRwE/XJuBGkURCr5EsvwtrwY+beczMsw4KTVIJzgTfRGwPZnwH1G
V+4nRYweADv/kGNKhGBun5A4dJmxGS4WzygQpjlKwUnzApPakCby/+FLI3rtzTQo
dM5hVhovyT8nTaKstQrUC7vS3JAIjw==
=6CAc
-----END PGP SIGNATURE-----

--Go/sM200WrU4YOFa--
