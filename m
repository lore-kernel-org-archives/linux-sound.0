Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891E8430CCF
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784213205; cv=none; b=UUDwgzyP4LAn9RTstqjSE6Mwmn1DUn83PgBWD1hAxaQHixD7G4RngmSRt7gy2TQfBLPbp46i5o8yQXQ+RgdesulS1x4l0pSXFqv/khXvggoeVo12LHjVduOkm2uwfZR687lT4vgqqAc+E41PyAZpveu6bBAEu/dfYR8yYFx7MPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784213205; c=relaxed/simple;
	bh=Ax+I/TdfcjXRu97ATgmR2KxMinvDyBJvLCqO5a2r390=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4YXRC9Z79su/AbAv3FiAX3eVs8YkJmVbyywjyvU5hYAxdR7boWm/ZxlnisOMbA7IYmiyIyyJNkIt9s8+WQr+UQivDHeZopwyH1WUjVupzPhw6o9VS5lzzONivvJP3Dgq1GmQclY9kcYrOuwwsKsg3mdx2vYrdAvjcLEIkdeiUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGp4M1K+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGp4M1K+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 163E01F000E9;
	Thu, 16 Jul 2026 14:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784213199;
	bh=Ax+I/TdfcjXRu97ATgmR2KxMinvDyBJvLCqO5a2r390=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DGp4M1K+aeIQxLBnK5/qU5iRfJEckQW2WdnPLHwP8gc+TDI7KOEgBjepMX3q/82Ms
	 BlSSUYNCZKVilD6qfKGxtvmmutN/PZdtVD+hPM73iZqfC/M3D6zghFsnrTvDrES+YP
	 mBM/Iz3D0Ditlve0xv3giCLPDXU4HVn07gotFX92Uuh+uuJw2lgu7ZcuA65o9nUl34
	 Zgl/rn25qAzqJ3T3jE0ZS7Wyy8ORHCkeYYvvRAxMiDKilzNWQT+DtUlgtQWSoiwlOx
	 ieRUVvXyWb7Xr0TSZRKU0pidVyUf/YMHsC1UIx/f/yYRPyEPqBuhlD6EncDrnOkQgt
	 7dc9m3btznmnQ==
Date: Thu, 16 Jul 2026 15:46:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] ASoC: generic: Card name parsing should be called
 after xxx_for_each_link()
Message-ID: <b26877f6-c22e-4dbd-964d-eb6fbeaa26fa@sirena.org.uk>
References: <87ech34o8b.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RE3qcHEYmiNSxqBy"
Content-Disposition: inline
In-Reply-To: <87ech34o8b.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: The more the merrier.


--RE3qcHEYmiNSxqBy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2026 at 03:17:40AM +0000, Kuninori Morimoto wrote:
> "tidyup simple_util_parse_xxx() in xxx_parse_of()" commit changed the
> function call order. But simple_util_parse_card_name() should be called
> after dai_link settings, because it might use dai_link->name as card->name.

Like I said I already applied v1 - if you could send an incremental
version that'd be good.

--RE3qcHEYmiNSxqBy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpY7soACgkQJNaLcl1U
h9CMtQf9GZPzyrdpj/yuNg6FcG0heO3Ady4MVtU4zMPMxfgBLakHrR0Df4Izr85j
XhT9wGMzvDplt2k4WSEwO9CTcyCU7rWas9cG7CPYuftxpChtkgwKFCreVMpAnbNU
7dzGhBvHU/WtgZYQcvCs/lR7Q8RUCDS3IVs6bl+GmSXgSXYSibkIXIXFTzcTPDsR
reisuLjOQWXghtLIVT7LYHTjj1J6bF4NpAoep+7uBkWkZFQG5JemRn1odmu/KJAI
OtTD3y0Msw7yvVs/UD5CK5P2KQwvWBwSWRANU3EZIQobSy1SqghuONIrqrHUdAPM
8XDpHfnbtDOM1RbwOeQdZNSVPfHhtw==
=mYkG
-----END PGP SIGNATURE-----

--RE3qcHEYmiNSxqBy--
