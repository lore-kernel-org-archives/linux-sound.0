Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFA25577E;
	Wed, 22 Nov 2023 12:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IScqcdd4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCCB7C433C8;
	Wed, 22 Nov 2023 12:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700654749;
	bh=BWxKGy0JYbFu0lFpaQPRgtk6vaihyOBnyhYlcAebvYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IScqcdd4IpevTMFCAAg6pYAaQPiWvU5+fOssMIpneCcjvBFLamopy2TKAXSmd8r+E
	 lZ3SczlMbjPb1mF7lSPpRKxlPKyO44EsMylzl0GnQXhn3wjlFjCz735IFqLFQa6sfA
	 UZu78hfdwEwhy8b1q5FCowwjsfurkNIO8pycbU/60ELqejNn3YIYxo4GYE7AYIo5+V
	 8eqWfiUPsv4khjzdZpAOXOLNcj0FiL5j8iciOT50KUBi8zl3A68QEszz9JB6tGhduB
	 zWoqzxRKEWTMerNS6lQFR1hVhHFDbtXh7juk3Kg50xn8hiBkoHl7IMuvGsqreVhlBp
	 Zafda96WfvRXA==
Date: Wed, 22 Nov 2023 12:05:44 +0000
From: Mark Brown <broonie@kernel.org>
To: nikita.shubin@maquefel.me
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 27/39] ASoC: dt-bindings: ep93xx: Document DMA support
Message-ID: <ZV3umA6LtRi8iM0l@finisterre.sirena.org.uk>
References: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
 <20231122-ep93xx-v5-27-d59a76d5df29@maquefel.me>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Oa8Rsb4gPpBrlFd1"
Content-Disposition: inline
In-Reply-To: <20231122-ep93xx-v5-27-d59a76d5df29@maquefel.me>
X-Cookie: Slow day.  Practice crawling.


--Oa8Rsb4gPpBrlFd1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 12:00:05PM +0300, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
>=20
> Document DMA support in binding document.

Reviewed-by: Mark Brown <broonie@kernel.org>

--Oa8Rsb4gPpBrlFd1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVd7pgACgkQJNaLcl1U
h9DDHwf+Jw49YSgLY5zSlUUq+e2R4saHl01nhLURYtXLW9GRibtpSlihER4twPZi
YEgqo/Nql9q0raup07zwDd6uZeLXugfxGHuLlwLkzPmYs8bys5ZelLV8eKpfg8y4
vwXXzPKTOfbyUfxdMJZwZ3OirpG+kdSrNCnvnS8mgJuEuZuiaIRxCGgXIkhfsYme
nwc2vaSH43Ta4C088HugY84CgHaGt2lJHEt4CmntaSf4g8TMs0DPHfQGQz5gI8bJ
0LRdQEWe7dY6f3DZl4qffcuk5bKJ3rurT2KqvB041PE+keJEseCf8vHii/OZ6lg2
47i494uIA5HBENmTH7rjM5bUDAFZFQ==
=Hyl7
-----END PGP SIGNATURE-----

--Oa8Rsb4gPpBrlFd1--
