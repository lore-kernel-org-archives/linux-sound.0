Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB37920DD5A;
	Thu, 23 Jan 2025 11:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630921; cv=none; b=h3NA4aVgi+ObUh0FlwFpdIjd4Zm/6s24IA8IwrLSUspmQxyQv8F+GL+2pXKGe2aY6vA5ESbKng8+2hTX22ji6sarPmDntSAJyImGf1cqT1vGN2+U8NJD7aJOxGTIVM1ONSRu8NWg6rfpdp5RHEB1z5SiX1wyEWUtTao5ivVBUbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630921; c=relaxed/simple;
	bh=E8b5FcNMemAHoTzQpHAvIxRnTEUV3+acEEGFOX7jCbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=db6oz6IVqVJ4ORf3FKc4pv+oMSmF4u3sMfnRulJ9qv/ROsOB4m4nlliw5WFaX5VgIzTSavmt/ev73Aim3GQmPT0vqMtpIvWlaR/Bz64C72NyuWR4b3gmdV0fGawDdoW//ffL1JfuelIzVc20l5xm91Uo6Q4ZWN6MPSzD0YKF9TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPye+IIf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPye+IIf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3817C4CED3;
	Thu, 23 Jan 2025 11:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737630920;
	bh=E8b5FcNMemAHoTzQpHAvIxRnTEUV3+acEEGFOX7jCbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kPye+IIfjHA9jTVE5WYkuN7E8Ql51d9YAvKfNuvOLalx0U71I1lxkkbVrrnXg5j5l
	 PHiB1TDEl79xK2TD8HGAaFMBYhqgsiOLg2xI9QriyMqf4/Z6mma5FVJ4djDC233Ja+
	 lyvG5jeXrWB58doO6zQtRKPqxD85w3WuzZSicoBBoqQ8JYCFn8W78hLxJ8Zz3jF/o3
	 bnovyy3hIW1Yh4mJaI7ONWcGounvTnvd2DDHEJ/3A2dlpqh5yzHETrVU/b0g8y/Gm3
	 JeOo+D3mPgfEuuEmxirbK2xJugYUBI2ss+ehB0An3CGPUdT/HNP02hNO16RVAG+Qoq
	 b1QK8CNs7LovQ==
Date: Thu, 23 Jan 2025 11:15:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Luoxi Li <lee.lockhey@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: Re: [PATCH] sound: soc: use to_platform_device() instead of
 container_of()
Message-ID: <f43f817f-c80f-4a9c-b904-12d1c32db478@sirena.org.uk>
References: <20250123033937.3587880-1-lee.lockhey@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RWxPd+4MDErmY7un"
Content-Disposition: inline
In-Reply-To: <20250123033937.3587880-1-lee.lockhey@gmail.com>
X-Cookie: Never kick a man, unless he's down.


--RWxPd+4MDErmY7un
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 11:39:37AM +0800, Luoxi Li wrote:
> Use the to_platform_device() macro where possible.
>=20
> Signed-off-by: Luoxi Li <lee.lockhey@gmail.com>

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--RWxPd+4MDErmY7un
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeSJMEACgkQJNaLcl1U
h9CMuAf8DEoSnKtUHDTogtreTY3jSsqvPMI9F4m2pe0TBUBm0PSgm25ttwsWcDKr
U6apH9Ths3azavJijHtExy6qJuzXYrn05aSuqcgVXdLNW8E5LOf+4saH+MkEzITD
Arh41NilypQwOV07twUpVqN6yrh4JdGybiNYLbe4sxoYw6AjXX74CSjjFvuKUfwO
zYJb39wvRINt6zH79dT8UcG59hLMqRfHPWLsbsjalU858Ud6vIGO/+lg5feHsqSY
9x06JjL2yCXXmBMfhyQi/BIYNuToLq2UPJ/sgXnoVR8HNCcYGJ6sN8csqTXdqSbb
rU1kVxLu3PF1D+9SSrm7+qJKaN/Gbw==
=u+70
-----END PGP SIGNATURE-----

--RWxPd+4MDErmY7un--
