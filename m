Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191589;
	b=TreIxpuBfHipc8Fw5P1NgnUIBDn96y0st5yXouSGGDyrsWT+EGOKx74a5c3QQMi1OT3S
	 wMfYH+zOw1jKdNh/q0ERO5GTdSuHrxJvlC6kTP2u/RIkFMXTnVnbbfcLNo8YcTe+vgxIa
	 YRUzvZXptGNUF4k9i4NJAMnzKBEgWyCj59WXGUlu98lKJUL7PRXEouvPDmegDlMSENWJm
	 DuK5tiGXv11DsmimyXuE1UMxXrtLd1r4wrl+D1UO3CCfmruSTYlDORElI13TMldeUWxDI
	 QhJ9hDJFhh3aFQZvm6YbFpasC2YrVSgsv4Jpo+Cu1Ez51Dw6G82jZxHFnyWBuVZITjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191589;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=5tiVo3bU0r1/QLdxlE6UI+qQtevuEzQQEMEF+vaoKQI=;
	b=td07ans/RcrYlXBo4lvxfsm3XREkT6xMYegoynEXKod9AhVlnwiD47oCVycogjLnBDJH
	 GWfEXq/n1v55i1b1KBf1Q9VePk+JwbLHUkCPybZRdC1mX2e4ElHEC7/zl3ugxAm/j3q53
	 EVr951oGg852yhA2LxO2Rt0to5SEsYLypieKKy7FQjdUdrviuhmClFaKuUU+ncORX0+P5
	 ZmSg1HFeqikA5HgV85yCb/G9s+6y8AKJxjMP/6042sofRkUVQcFwntG7QFr06Fa8REI5O
	 mrLVzBUVacAeuW0y/DAH2zA+cEZJn9ZlrZ/jFTSAxl9SGlToWCruPSM+WRt7cR4g0pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m5WXGt82;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F6D606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 12:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m5WXGt82
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A21B1F01828;
	Wed, 28 Oct 2026 12:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793191588;
	bh=5tiVo3bU0r1/QLdxlE6UI+qQtevuEzQQEMEF+vaoKQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m5WXGt82CCgIyPzjc430lPXjU0/Laj5fSeodHtpfQOrecMxEeMnkYtSbfAZ9Haykp
	 BXBZMbfuScTexh+TVn57yZnkIBFiGOgNuMaZ+T2EiEyFIbdE2IVbFDWxbp+m3D3bit
	 GAkndePM94XV4pa+rpU6FHrdLJxXIiT291Z1V0nBVJAJjYu9SxE5FDFjW7Su7rF7Fx
	 Ye3SDGtJGIr7gP1eUEQQSdgrjPJZz7FEGNy6JXTEJQ6ZFQaHLuZAGogZr2iz2fUzTq
	 ZXLGwtimjM8gJKDYyfdj8iHLuO8n98vw+KxrW7cVMhdAz3pQP//SjdZ6TDtqXgqybW
	 v87tnDzWbXYzA==
Date: Wed, 28 Oct 2026 12:46:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com
Subject: Re: [PATCH v2 0/3] Modify the initialization and headphone-related
 settings
Message-ID: <408aee47-19a8-4bac-b5b4-7be26ef51f80@sirena.org.uk>
References: <20261026064251.15017-1-zhangyi@everest-semi.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5D4eQ2H0Kd3m50Dd"
Content-Disposition: inline
In-Reply-To: <20261026064251.15017-1-zhangyi@everest-semi.com>
X-Cookie: Pushing 30 is exercise enough.


--5D4eQ2H0Kd3m50Dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 26, 2026 at 02:42:48PM +0800, Zhang Yi wrote:

> To support different versions of the ES9356, the code reads the chip version
> and performs different initialization configurations based on the version number.
> To improve button performance, we've adjusted the timing and settings related to the headphones.

v1 was already applied, please send incrmental patches with the changes
in v2.

--5D4eQ2H0Kd3m50Dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrh7qAACgkQJNaLcl1U
h9DghQf8D6HzAf2XUKm73/A+IERoe1ThuQXiwRMkLb3UATAmOj+3u8G3LmrA62VC
9aBQvYuMO6QKnIubIBUuJVQOIqjXIFc29AfUZ8mSUgnwHNnEAF0XC+yY5R/1tpbP
I8xjoUBe58tcfnAWd0/97rfCTVjv838nQTk8g/umDGAYX5eTyvVL66YNt9bEahbj
blL4f2UlT1ULclzvgIqBJyl086hkNL2F4ln1x7RsN6vEUFs/FFssPWtF/X9cmvTv
mdr5Bn60v+EXLxWJfKJJMNfHKMEQYqIy0R0eL2+4ZCtmNC+5P1hNCZca0NCW7CWp
MOigubm4+8+bK1vTBuS8sdu7E52gnw==
=Yo3n
-----END PGP SIGNATURE-----

--5D4eQ2H0Kd3m50Dd--
