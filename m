Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471C92B9B3
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 21:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BobBgE+a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839ABC433C7;
	Wed, 29 Nov 2023 21:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701293518;
	bh=YjAGVESRLvsK0NiT3pHkYj/TZu9G20YInTk2adZOymU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BobBgE+ag95f05O7EL6Uhtouac09JLNUCdsIE/dV/2drWWUJU1b/BCIhVqePRZM+B
	 sC9d1ININ1hhLLkDkT3lr2L/gA+Lc0uHChvGmc5ZfMvGwWouyiK1nrun+x5C9N0IdP
	 SNWTcsOoND6Bltar7FKmA7af+MX7r89Fx5FEwu3uKa5YCJ0CX6jLCLzZHuBVI0augW
	 sUUaWsbWapU9+oU8xTLB3SkbtYlSBmeBsr5JdEGA4CUI03JjjwYSq8Nyk1OehEDlGh
	 ww4DS+GvwVe8kGkFC5ueXenljhZzhPYz5iZHC9G9hF7Hl4jO0mhFbWpvestqPrAW6d
	 GaekCekp7GJCw==
Date: Wed, 29 Nov 2023 21:31:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Handrigan <Paul.Handrigan@cirrus.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/10] ASoC: cs35l33: Fix GPIO name and drop legacy
 include
Message-ID: <1451c3ee-ae48-4151-ace4-2cf2ab9854ef@sirena.org.uk>
References: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
 <20231129-descriptors-sound-cirrus-v1-2-31aa74425ff8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8qFzdh/puJOBRAP3"
Content-Disposition: inline
In-Reply-To: <20231129-descriptors-sound-cirrus-v1-2-31aa74425ff8@linaro.org>
X-Cookie: You enjoy the company of other people.


--8qFzdh/puJOBRAP3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 29, 2023 at 10:28:38PM +0100, Linus Walleij wrote:

> Further the driver is requesting "reset-gpios" rather than
> just "gpios" from the GPIO framework. This is wrong because

s/gpios/reset/

--8qFzdh/puJOBRAP3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVnrccACgkQJNaLcl1U
h9DyeQf/TBc6PoOjQzWgFz59WRahFpJ5md8waFHS/0y3D3JoTSfMlIpeq9HNbUcu
YR1TQMT/ThWJ8Sgh2IF2d1ch07dG7o7CBwxHrwnbursrm+oiO0c1ddebK1n7M8a4
viHqQ3TKGM0DCPUd6xBMovcSDhRen+cEa4QGeIwEMHFwxRc9AGASBOFlqNJ5Ernr
LUoLhlVT+2f92i8m76vcFfMXk2ZC1j6p1dD4IEYdnvVU2CccBhKACAW5Lbz000uz
oZUTgiP/albHyyz3957NoNa1zVOfWSVPgB2O+Ie0I++jqxUhMLkKBqQQPa9P2X6E
v0Mh4fhQ77g+3grAWYbLd2nf+z41cA==
=5cDG
-----END PGP SIGNATURE-----

--8qFzdh/puJOBRAP3--
