Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE3F471D06;
	Thu,  6 Aug 2026 11:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786016489; cv=none; b=n9SMQHjsSsgornFWeh05a3M3NIxkkwBhyK4O8MSuXHBm0muZFgouzpkIikhTKXXHiVWA8I89ZSMacZfx90NL/+ZbHea7xH/H7kFMmzwn9vgyt4Ys2KuxVn8xBdP0NDXL/EY1qr5peMFFkXDMm6c8vuFPrsZuzM1rnrPR+g5+jy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786016489; c=relaxed/simple;
	bh=Flo/uHX4QUjlM708gbPqM09Zj+zFE5pjBISZkGdM9xE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COsJM9H3LLZhpXEbuf2Ae4/+V4UWnK9dXTlG9MfpY5c2L0ZTPuihUcS7aq2Acrr8iy2IXRJ3qfNfawNa/mqg4kLmFpbl1Nu8Eoo0Gm/AslWi2UCCYi9/f5M+1TDv+0VJkVA+x+Wcgk45lGF6Cl0ihmwz4kjE6bobwNbnK8BMz9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nglPgRSq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nglPgRSq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225CE1F000E9;
	Thu,  6 Aug 2026 11:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786016485;
	bh=Flo/uHX4QUjlM708gbPqM09Zj+zFE5pjBISZkGdM9xE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nglPgRSqENZvFj3z1QCGSioSvVIpiqrBxeCoFlH74qebIBnM2r5cOPUWa798zYaOg
	 XyBXSPqc7wXWsnIGh465ZHQgspNEfzWCGZfEmafsIV17/lF1l0jhMf2fV8MQA/Pr2o
	 sTj2rcjtuTuSaWrMCTr9Wqo6bRfXZmXE3+gt03fNhlC7YhWrBmTuYyh+8f4N1y/Raq
	 t9O1GyWAFhf5ElUpPiqFOyGZ5AMjbnuTtOhpK32hfuDt0v4i0vgc4YrgITYVssw7Sb
	 Ec4W51QPG90CMdybu/q76CXNNrwwxwixc8g6tOciyBVWgdxm31lCBKP8tI3u6ztI8Y
	 7jTdw9AOlXlCA==
Date: Thu, 6 Aug 2026 12:41:20 +0100
From: Mark Brown <broonie@kernel.org>
To: YLCHANG2 <neo.chang70@gmail.com>
Cc: Neo Chang <YLCHANG2@nuvoton.com>, lgirdwood@gmail.com, perex@perex.cz,
	robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v7 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Message-ID: <24312caa-d38f-48ae-a137-63eac9f7d58b@sirena.org.uk>
References: <20260804032951.1069901-1-YLCHANG2@nuvoton.com>
 <20260804032951.1069901-3-YLCHANG2@nuvoton.com>
 <479efa04-2c02-4b5d-8fdd-e3d4c6e49c4f@sirena.org.uk>
 <7691eac8-5798-c1b5-5ffd-19c780b69a3f@gmail.com>
 <fe60dbe2-0626-4d52-8be3-62445a35ddaf@sirena.org.uk>
 <4bde20c7-2496-8122-7e0c-4fd986a59232@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6m+pV/bZ58Xr9IBk"
Content-Disposition: inline
In-Reply-To: <4bde20c7-2496-8122-7e0c-4fd986a59232@gmail.com>
X-Cookie: Brain fried -- Core dumped


--6m+pV/bZ58Xr9IBk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 06, 2026 at 11:27:43AM +0800, YLCHANG2 wrote:
> On 8/5/26 18:30, Mark Brown wrote:

> In the v8 patch, I will remove all fine-grained clock divider configurations
> from nau8360_dsp_hw_clk and nau8360_dig_sys_clk,
> leaving them to only handle source switching.
> Is this approach acceptable?

Yes, the concern was the fine grained dividers.

--6m+pV/bZ58Xr9IBk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp0ct8ACgkQJNaLcl1U
h9D7dAf/fNB/oCN7chAia30DfMPgccSts/Pd2aNA+/KjjZK+mpYPJNNEx3k9VLXt
C5C9RDUgVsA6PVwnMHSTjgCur77ADP5IZ9gs2zMmoV1iF+WynxQUQXgNNjXwJdGc
CK7LAJli4PxJCf83uKcciqTQOWKYANRQfn04yMKthQ6RrP6W/SpM4Yrzfzz88igH
PV/5+Ymzijn9sASLn3Ik4y9ufaT01Pt4mAlAGBTwxsVlMT+5QdNhEqR6H5VTW+NT
ZGXs/q3klie3jYnlfKE4EnpuoiF/r28LEalr8whWwfEDsyKv0jcIiG6sqJD5S2qu
W07nHoDhYWEMzRji88RpJqCOxVgDHw==
=drsC
-----END PGP SIGNATURE-----

--6m+pV/bZ58Xr9IBk--
