Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308883AB5DA;
	Tue,  9 Jun 2026 23:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781047578; cv=none; b=WaytIzIS+qsb5yiTw13DgXb+1Mb61N5i36vyfd48YOvD/5y+pg033k76fjv6ebUOrFKvKQywGPTFVFn9fasgqUaURIlZ9W4mB41tsGDIfCZ3vr4333f1t5lsMXD7ysLRQu6/KQMichPeRFqGFij7yoaQPr2e9uIza7rCdsj5HqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781047578; c=relaxed/simple;
	bh=TRJjoTCPCYTlhS++FYiGvAK8pIJghQ6dgzQsrO2oHn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtxIGH2/9JgJvd2TPXL0UQUQ0mEDsZPsn0DdPqch9Bsq/7D5Jhv/+DcgARRKWyDUGNQklzGAvKKLDFp6sbr+w6iqocukyXoCG+rKeWTWntxYSxX3uB9mu+I8gh2KDQuPP0HOIv9cRIPc4uFJJbJXyKGyC3Pp1CoDQ0HyxRfQidk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7uD2zGf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7uD2zGf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF421F00893;
	Tue,  9 Jun 2026 23:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781047576;
	bh=TRJjoTCPCYTlhS++FYiGvAK8pIJghQ6dgzQsrO2oHn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n7uD2zGfSZs7ZLS2ftMOPBINLSNg8GFgTXzExO8P+8jzBRbxhVFSYagapJcnMnrnY
	 I6+cJkJoUPKRN7hyxBU74SI3Otc6g3KB/SAMteqgXu93X98WgavhU91S6qFEyMT8TQ
	 U9pkVxy0QaCOVaoj2wgl0Fb3tsOlcJLo3ggCsHX94KoKvU7PdfJF1ChaVcP599m54J
	 z6sXrNGke4pLeCDriR7jglZrb8sIGQCoMJ9xbQDUcImZKYPlVafAW3es3uujR+ivMi
	 REZR7PXTMLTS8K9Vd9HrEAQGgSrsb7vOML0Bo6eOZJP2iCVYD/clqPF5OxjKyWTAgj
	 VgBoB7DAcF/gQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 7228F1AC56BD; Wed, 10 Jun 2026 00:26:13 +0100 (BST)
Date: Wed, 10 Jun 2026 00:26:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: fsl: remove Efika audio fabric driver
Message-ID: <aiihFWIOxS9XjZyK@sirena.co.uk>
References: <20260609215212.28713-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gQwYY4YF8YlIZBmQ"
Content-Disposition: inline
In-Reply-To: <20260609215212.28713-1-rosenp@gmail.com>
X-Cookie: Leave no stone unturned.


--gQwYY4YF8YlIZBmQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 09, 2026 at 02:52:12PM -0700, Rosen Penev wrote:
> The Efika 5K2 is an OpenFirmware-based PowerPC board from ~2006.
> The platform code (PPC_EFIKA) and its sound driver have no in-tree
> DTB references and the hardware is long obsolete. Remove the driver.

Is this solving an actual problem, and was the DT ever distributed with
the kernel?

--gQwYY4YF8YlIZBmQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoooRQACgkQJNaLcl1U
h9CmlAf9EuvW1fesFeX/BzkzffbA1XVuqZ8uDf0gPuLgLmgPNpB/dfEHK7OjoRp7
uT0jBr4UaLPlAM52Bah/hSqMIw01UAJtAZZEmm3sqiRTgJFh7+6nrQ3iQYAXEO7x
cpWYJC+gfX0chW+6S6Vo14qy4aTaagMcvXBhVBmOfckgNdyB3T0gm6jQIlIURnPb
Cr7NERcHlIanzh9e+Kru2URKLq77g6CSxjDrtRFt8jnruaWJMK7eLk+7fa+E+Cy6
28YmdLCZ0F8rLSBYDg/Kwt0j8HWISTpqshgBBwcQ8As/XohAax9VWtOi6FTmDjGS
6y2R6im5BIdzJLo5vxxJ91gsUFSQew==
=VCI9
-----END PGP SIGNATURE-----

--gQwYY4YF8YlIZBmQ--
