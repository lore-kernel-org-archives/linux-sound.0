Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663384;
	b=UwRnU6n99ngEfcX7zDgEg06/dBBSD/T5mOCkQ2tdlGBea8S0pJ0fv3uw9oAPx/vD6OnZ
	 lQ2VIPHCK7MOqCDVbcaN173a0RIK0ADYroGlBGxilv5HNPwFSlwI9WwH2ZKDc2Pwfx2vE
	 MABKB4ACbkt0ndYuhz7JhWHq8rJt3REsXBeC7vDEowaUkQwreDXsI6FMzl75ccHD9uMTQ
	 8fSCue3GzHN99ttOnrzBr57YRpUPEyaJjCp2Xeil9fff17DIjhsyEvD/3e0jMy7Ea4sUq
	 Ram66hlGzrzGPVezl9/zH/8JnqTVAhO/d2lAc5hSWE4oLoWoxekduH+c8zB+8qZuSbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663384;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=jl79oDXPl1hpSaPXye88UvHHz/lLeXGNGscRp4zr85Y=;
	b=MmVBX7GYBoaW2Q7qz8ExbouRvRUWyuDN1VEZXPiA8ERj22OIxzArB+gBGKS0DHfrRPUn
	 fwHboThIq1ecpNP674C6H8GAOWRdZN8L/B0/XhPMqHB0LCnTZ9W3MODCM0mjMcHsnsN70
	 RQf5S70Zukl7tTBd4wUjFKE4sZVjzuDt7Rr/c9l30pL0hcWwFLk9dg3/xBzOX9imR+HSi
	 GJYxqMQ+W39H0fcpY8hsb0o2GYA7cp4Two3PGQ2yNBZiN900ksyztGH6ZuXdUX4QVZBUo
	 +y8CDKxwnPDuaQDutJQooxKyufo6H+0pB98/ddxnr/VPZFTuV90P601NN8RZLNbOh9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W4dgRoLF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78504606A31A
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 10:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W4dgRoLF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294811F000C1;
	Thu, 22 Oct 2026 10:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792663384;
	bh=jl79oDXPl1hpSaPXye88UvHHz/lLeXGNGscRp4zr85Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W4dgRoLF63bpBGuPhmrw93rux26mVa+4MzepBsyLvnsz7nTTGwNC/KZKX1tfxDoUc
	 ctrE7qi/Uu13Tr3FkCjfpd/5eXRoBGNnb1OaEUopYN9WWTLwd/FxoC4zwd+nnrXL4x
	 mxFfWtQ5fEg0pZ3MJidPU47wVxFxeFUDzqE671SRftEFIJhszesaszJ7K7e+QAEU9U
	 rxj2SwQ+RWg+UxpyS9CeTj0bQW5uQ54qRB+Qfayt4B6SRZBdZswjlZmoW7mQKB0fsS
	 zMD4oXFrlcOrJdKyvk1LaDc4xOVM5sbsgEguqHq68XBCzc1zLEiZaXbtyKJS6zKIZl
	 o9pZL6FNmhKqQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 7C42E1AC5994; Thu, 22 Oct 2026 11:03:00 +0100 (BST)
Date: Thu, 22 Oct 2026 11:03:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Artur Weber <aweber.kernel@gmail.com>,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/4] ASoC: wm8994/midas_wm1811: fix codec clocking
 issues
Message-ID: <atnfVHWwQlaiPeb_@sirena.co.uk>
References: <CGME20261022074752eucas1p20373b227c271ff18c3207b7f67ff3c2c@eucas1p2.samsung.com>
 <20261022074743.625223-1-m.szyprowski@samsung.com>
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
	protocol="application/pgp-signature"; boundary="80xgaOJv9FvD0DDL"
Content-Disposition: inline
In-Reply-To: <20261022074743.625223-1-m.szyprowski@samsung.com>
X-Cookie: You buttered your bread, now lie in it.


--80xgaOJv9FvD0DDL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 22, 2026 at 09:47:38AM +0200, Marek Szyprowski wrote:

> v2:
> - patch 1: move the MCLK enable to the newly selected MCLK when the AIF
>   clock source is changed by configure_aif_clock()
> - added collected Reviewed-by tags

v1 was already in my CI queue with other things stacked on top of it,
could you please send an incremental change with the differences from
v2?

--80xgaOJv9FvD0DDL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatnfUgAKCRAv73Ows9A4
iUoHAP0fsU42p9MOEXkNQoxtykUQzkZippJHtWspFOiDxgTvuAD+ONWmxN5VdvlC
wvT6xpbi4/w6N5rtVximxx354V6OYwU=
=D0Hg
-----END PGP SIGNATURE-----

--80xgaOJv9FvD0DDL--
