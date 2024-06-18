Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AA92139A2;
	Tue, 18 Jun 2024 14:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718720314; cv=none; b=tL52UcMQsKDsEKJ3aljTaycEg1UOO4cAngJSuYku92VolRPecjatcSSDfzpqEAQqHHTZ+OaHm8/PKMtuRms10bHGVY8+DpDp7IULktzN00iP9ZUlLIflL1l6SATR9fnpoSRe0AxJk6zg8jfa6brIFXBHqttQPqyXJeJ6VouUAzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718720314; c=relaxed/simple;
	bh=7ETWzcP/AwGrgV7qsRWFwYvhJb7AeLhQzE34ULRkJvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndYtTJyHxl/miGW5rWvNzYssPsvgyeqtmYnu/4/592ksBwNd1ubx6LhVG8A+C0PvptoRhy+ufFLP/6i5gan90P1J8cu71frUlTqpiSuHpR3Ng+kkv3sX0RCy/QS1381BnjgkpTFYKATKSPqPAVBLxqYCO78SNaC2v5APaF8QsIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gu7s4s3P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gu7s4s3P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C4AC3277B;
	Tue, 18 Jun 2024 14:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718720313;
	bh=7ETWzcP/AwGrgV7qsRWFwYvhJb7AeLhQzE34ULRkJvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gu7s4s3PrB2gM/WKdfZesnOWUQWj6cDot0heF93yIDh1tOGrmIpCqefK4MI3uXtNr
	 x8N384OnUjLBUFpl7C5PKvTTQFV2Iew6riP8xdUVJtvMsaQhucdfpIA/qU37vWGeH0
	 u/V0fDeadJ0y/n7+i+INvEy6/IfrSmdsjbfShr7qZzv6CIHKijSz4cTzcFzWlxNFfK
	 8UwU2pPQ+zTvJFjMLLIUIudZSYuVqfvoK1HN+uevgJ3DZgAN3mW+4E6B2wB9+DWUwH
	 RITSUv6D0gI+InGUz0vNtKPPV9Fy+76HhxMchGzOSUf8IL3KqA/UCvhn8LGo7xR1A2
	 5HA/ApFDdzj0Q==
Date: Tue, 18 Jun 2024 15:18:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Handrigan <paulha@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v3 2/2] ASoC: cs530x: Support for cs530x ADCs
Message-ID: <96162ff4-8c54-4efa-b06a-dc20e358e712@sirena.org.uk>
References: <20240617190102.1010597-1-paulha@opensource.cirrus.com>
 <20240617190102.1010597-2-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y9nGw+uFeuvuQoVc"
Content-Disposition: inline
In-Reply-To: <20240617190102.1010597-2-paulha@opensource.cirrus.com>
X-Cookie: If you can read this, you're too close.


--y9nGw+uFeuvuQoVc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 17, 2024 at 02:01:02PM -0500, Paul Handrigan wrote:

> +static bool cs530x_volatile_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case CS530X_DEVID:
> +	case CS530X_REVID:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}

Are these really volatile?  I would expect them to have no defaults so
they must be read from the device, but once read I'd expect we could
cache the values.

Otherwise this looks good.

--y9nGw+uFeuvuQoVc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZxlzQACgkQJNaLcl1U
h9BqGAf/ZtS+tnDIikWkRqwk8zt75Qw+5fGtTO23d5ZqdO/Zo34Uq/qAkxqykSjt
a8HWNo3atoRucwoknqtqE7vUFcKjohrZc4j8JDoLXE5SxXrQJIlONTvO2iPEhbOP
VdSHINJRQTnftR14gufGUDAUh4DZ1PdPiKBXevwsQLJ0fPx2sDNjmlTwz9JV/ZLY
s+Xe43ORkq1KPd4zhYXfyYOW17/DySZlnyT/zBxGlfOFqlQIOH3NbDai9eK8M8W/
tJe63je1RItFmclCPF2YhTDz6kbWFdhXvP7JJFGvKxmfbywVM0yqUncF6qNNa5tw
+Af6TWqAxuSEx8UlJDmJ+Fcsj9ppEg==
=QXRB
-----END PGP SIGNATURE-----

--y9nGw+uFeuvuQoVc--
