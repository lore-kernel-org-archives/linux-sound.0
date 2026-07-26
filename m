Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421263D3D0E;
	Sun, 26 Jul 2026 17:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785086544; cv=none; b=hoFHeDQZq5U37pKmXxKgYs6S7I0B0jUrRlptUWJncVJHCAAbSWkl6lM/Menui1TQ7NXaAiHGBQTepuzdfMxQAN532VU44cCIA5GsxlChs5HZi1N1H/6Iz5hZZGDVR97Puwm1WzMClfU9xbnzk+gMqIFteP+xXsxjJYoJualpLr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785086544; c=relaxed/simple;
	bh=pTTA95gw3YO0si+WhRm+dNngxFM1b/mutpYw52jPbA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HchSjVS/OoFt5N/k4DESiqYHOmomDPsJksgpY276puqL+B3Eh8Ghx9XevYcsaurv9kxWhUud7OLJWZyQ+5uKZtRKd9hKfcade3b8nnz+u6Je1MVA7F5hgsZmL2XwVxqE/QZ+XMd7dU21MNSQLlpPx4apdyaA/78hO1SOq9ykQNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgJ2eK91; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgJ2eK91"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8851F1F000E9;
	Sun, 26 Jul 2026 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785086540;
	bh=pTTA95gw3YO0si+WhRm+dNngxFM1b/mutpYw52jPbA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JgJ2eK91BqHg8Cjxv5ekCKZ57z+fZ3EUnL8rFxK4W+0BY6Vli3RhC/meBrxZlqqQ4
	 jzwoyG2ECSg0LcY0Y35PNk9Rh3DvBglWci7FGRh8Op81ROnMu1eRcPsv6H+JA6CNG0
	 hxA9LdHEPoiqlxlYaHpVtFt9iklHUbYyVC7qKlo1BrOYS01KemhEgR8uYGfy02Pv8z
	 YssimzJxXSMTrC+Nf5MiLifxb7fV0hKcFz0jBk5wvkbibTZJgNz0pGWT3PseOfW0gv
	 7ANU+K2dr8XlwFDaz4LNvk0LkAG7aR4sBtxqxGNIDf0cVkBQDqSrRrT98+kjldQHX7
	 4IhB8mJfaN09Q==
Date: Sun, 26 Jul 2026 18:22:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 0/3] Add support for cs42l44
Message-ID: <5ee2a6cd-b021-4221-b6da-4fe179104814@sirena.org.uk>
References: <20260708140039.1993489-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rgiNE/44NynmqA6X"
Content-Disposition: inline
In-Reply-To: <20260708140039.1993489-1-ckeepax@opensource.cirrus.com>
X-Cookie: You might have mail.


--rgiNE/44NynmqA6X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2026 at 03:00:36PM +0100, Charles Keepax wrote:
> This series add support for the cs42l44 to the cs42l43 driver.
>=20
> I have based these patches on the series by Uwe from here:
>=20
> https://lore.kernel.org/lkml/cover.1783507945.git.u.kleine-koenig@baylibr=
e.com/
>=20
> Since they both touch the device id arrays, does mean Uwe's series will
> need to be merged before these but probably simpler this way round as
> his series is a lot bigger.

This doesn't apply, please resend whenver there is something it can be
applied against.

--rgiNE/44NynmqA6X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpmQkcACgkQJNaLcl1U
h9ASAwf+MVPpdeRt3X4QUFkW0xVMLE4sAjnt9eUKWOjCJU/dBiZchbrDCwPWEwbO
BIauQtdNDulDYt55+F3qvzR1XPPEVUNWrjKiANJzLc96YaZvUptAmFhc+dihhSy5
4Fs1PM/TgYUKCejzcqQN4/dBBju+NFID50zmteBO+GqgHaQLLrdkv/WZ+bPNUr0y
v4yeVX1aQ0rVGmtQEwejoklAFom6H5DHktE4Kar4alWcp9Z2/QsQUOqWFcCaUagO
aUslOlAXXtz/lyUvRU5yTl2A4qGyes7wKdzt3PmiWMTrwCe+Bbcf3pbHQDtGRzwt
VBvZDMt8xLyZCFTBJu/XiiuZsFx4rQ==
=CQTL
-----END PGP SIGNATURE-----

--rgiNE/44NynmqA6X--
