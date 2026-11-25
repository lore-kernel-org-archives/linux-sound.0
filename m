Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615386;
	b=IKAlqy0yRY3mkdDwt2UBrX1fDjX+/kmzStivXyZJ2rCGt1CJkaLUQsGdjlOlmYtE5g1B
	 7/0QI0pw4lKRiL2oEHcK5XIf+mQncm8y4sSWkeg8qrLMiF4c4uhibG9FaM0vvCyAe/7qy
	 OJHf3o5O4VcwWe6VwEMXEc0js8djR4/IbIfdFYrPvSndHN+cOGgsIGyyFApWUt4lR/r7I
	 xObMFC902RVtxyY7f0yfp7BhWu3z4MTRkTi2JATAt0iaX0z7K+TMqmdE0F/AwwLlnavgY
	 Fn4d3fAYTUDURZk+6EYCoVdNc/nn4WZChQcEkqZKf9YOFRUMWpjTEpFikJmqXg5LS7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615386;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=o0xCrp+ykgn22IEvePS7hj5uQUsEuSvg3Gk5u3CyDtM=;
	b=XL1jVTHke/qQa0HZnFTa4AEWBhjNLHhVEqcvov2uEZ4Nb8l9Gw7sDIIx402JLrdJ1Tnu
	 QUDsPKv7hizThxnufqvCPEUhhyo7Ok/whScoAtBw5M5z4oT9cop/0i4/5wyiAauEnWZom
	 BllKYaV9ezNqjt8ZuM6GzCo+tP6Kgx+uCIqwU9fErK9SWJcTKy+DHUI0UWazRoNStUC3u
	 nqE7v0m6r4TdSUeTzRSVTmdrq1flrdq9l4+BQcfkapYFUJGOJmInDX4R6wJr6nx6wVnFF
	 RdiZsqyx0Oez4jp/cszOD3lUEkZiPKYl66H3MqeOLZVEcwdrl5OabpSbE1roJOe0HhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cuPGoii+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FDD606A32A;
	Wed, 25 Nov 2026 14:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cuPGoii+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B531F000C4;
	Wed, 25 Nov 2026 14:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615385;
	bh=o0xCrp+ykgn22IEvePS7hj5uQUsEuSvg3Gk5u3CyDtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cuPGoii+b0q2m4MngsSIgYWxrJwQNwFYhvMnjxHMf1S6zd/qFlJuNIP0BGNV04B37
	 BcHt8C8TclPXbGg+e7wNwQQsG4EJ1CRGrq0DyetU0CQExm4m1DG1DnFziOvlSkSQV3
	 sRdBre2LHEKWJ9FFH7ELVH+MMrjNmR024jqx7OO0bYyWBIYr2luwT1rIdTgWJSkiEi
	 D0wRIcX4sebhVkFJFhWn52hrBkPVZDovLWEPM5jkOI+O8zhNPCaMx5mn7c/pFpSWmw
	 Ulha/o+6/ygNAlU3FN22131lSWVNLml49oeozggTHl39eS7mDP0jj1j6rvgSdQwt2e
	 JTqIJkbKFCnxA==
Date: Wed, 25 Nov 2026 14:03:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH RESEND 4/4] ASoC: cs35l56: Add test that probe() doesn't
 write SDW mux registers
Message-ID: <51679d08-a78f-4572-a280-daa3a032b5e8@sirena.org.uk>
References: <20261125110853.741337-1-rf@opensource.cirrus.com>
 <20261125110853.741337-5-rf@opensource.cirrus.com>
 <61660f09-9402-479e-92fe-6b1b2bc48158@opensource.cirrus.com>
 <44ae0233-b475-42f0-a1e8-2c3299a4df50@sirena.org.uk>
 <2e698fb5-6041-4ffb-99d6-d95644749f41@opensource.cirrus.com>
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
	protocol="application/pgp-signature"; boundary="n9uYdnkB3n7cnem4"
Content-Disposition: inline
In-Reply-To: <2e698fb5-6041-4ffb-99d6-d95644749f41@opensource.cirrus.com>
X-Cookie: -- Owen Meredith


--n9uYdnkB3n7cnem4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 25, 2026 at 01:26:36PM +0000, Richard Fitzgerald wrote:
> On 25/11/2026 12:39 pm, Mark Brown wrote:

> > Send something incremental, this was already applied even before your
> > resend.

> I don't see them in your for-7.4/for-7.5/for-next branches.
> Are you thinking of the previous series that did something similar
> for the ASP registers?

It should be in CI, though it's possible if you have two similar enough
inapplicable serieses one of them got dropped on the floor.  There is a
lag between me applying things and them actually appearing where I test
them.

--n9uYdnkB3n7cnem4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG6pUACgkQJNaLcl1U
h9CWNAf/a5z8E8P4PpuW3zAjcWxzspdfJedIKMBmWa3k15zpL/9tg73KO/nE4FeC
hFNcTGWupPIUWL0uN+8AQlD76d8GYtF7wLL3lUZ1uA4wXyaUv14k9MtY6q1vXB3m
oNLD/JMZm/5MRX6ScgisnPbZzGCSAvsSMI6BTfUjRuQM0TcSca4woqFs2i/A3MzI
GdQr6jaS8Y+TSiQpD2qA73uF8+A4CiFHc+o/HF02nki9Di4KW2gO0ZKaHSwaeVJu
HIRXHHkVZHzKazQ9xN/NkMa+jlGpC0fFZEWmxQGaEoZThylgs3gyqCO9y6y4An7M
KaIeoC6n+P7fMYHwXTLvzM3T2pk3Ug==
=x8hv
-----END PGP SIGNATURE-----

--n9uYdnkB3n7cnem4--
