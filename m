Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792777431;
	b=hyQ+1pcuFZbiBApHmQKA/7za1Z1GkxZ4iDtS8y8EILTgN7xq6rqPDXOgxSIJVgBakV9u
	 5/kR32d8Qy3h6DoAGtC4hgRnwDB58huXtNiUeMBBLJMx5E8kiMnhrCHgNoYJjUm5kAXLk
	 v3Ar4YEyLIv8fvB3II7OPOoLFXMSieDv1481e7M7DO3NjZgskQuWPQWRvVMyG5dSie8qs
	 sBcLvAv+hQ7SzuVnlde3x+ju9enMxFIjBg+iG742MpM3XboYzR0b4FY0XrgQDtSTX7qeC
	 5Dd1AcwD6tmtcN+hHjX0gGfJxYTOH92Wj218mGmN3N30QzwSttzwKw6dYsDgHFzmx5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777431;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=H4oRe+p4S1WQlWzBXGbUDW64VnOKmi4+AlO//4YuXMk=;
	b=bxF0AGCz2Dm3fsfzONknQnICv2RE2gyfPGUGEo1qv+IPiwN6dj4Blf/p/uAT2xAsUycL
	 8mNWiw8M5E5T4FvyZFaQN987eW5ZqvY3HloChTBEEkLLh5JYTTHXT/kyShEMoccTdtAB+
	 tC2OBUVIJfQjxVXOl5NBEnZW4xeJEeXonj2HerIdOBv1bIUiNhZOipz55YFhQLV8RE25Q
	 wNdIE38cq1DU8+hf0xhsrg3VsB7+Oq7BNbi2VvnZWRz5jG6fCMUqG3mBvB0H30mI4psuY
	 O5kj7+SCCxr8iWkSijLvvrkFal5ZQugSibSBoCJUJdjynZxfExMzLmYFYwPRA0gsKMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lO+uM1sF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9631606A31B
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lO+uM1sF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4CF1F01828;
	Fri, 23 Oct 2026 17:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792777430;
	bh=H4oRe+p4S1WQlWzBXGbUDW64VnOKmi4+AlO//4YuXMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lO+uM1sFYHpT1bd64Zca1sEk5BWGjXaYcjH/gREfe7h65vqEzzOUI1hcxdmrZkN2V
	 Q4FzST2VrztYRpM6aAbNjrBYcyqh+01N92t2JfuFx2p+Uv68jesytphX/ESyRqkHb1
	 1fobjSVumfMF66Tx6bnE91wYAhSZroqnfcFVDshUErpffdfQLjQGWJe3o2mbTmdjtL
	 P0CY9rLPnpSwu6jXgwaooqN+QeMJGrR9VdQHa+SN9LQOI7hmp9vij+Aid4PCA/71e6
	 ZKSXjjBjf1QkGEWXgYQmiVMZNsYxJ/NMF5IvzinoUoUusRCNx87kW9Vclx4xEBWcYi
	 8jq0SGme0C+hQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id A640C1DD1A5B; Fri, 23 Oct 2026 18:43:36 +0100 (BST)
Date: Fri, 23 Oct 2026 18:43:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com
Subject: Re: [PATCH v2] ASoC: codecs: es8375: Modify Register Configuration
Message-ID: <atucyN-hsQaSaUEq@sirena.org.uk>
References: <20261022025309.24028-1-zhangyi@everest-semi.com>
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
	protocol="application/pgp-signature"; boundary="FWfpeUUKuu/BHHrP"
Content-Disposition: inline
In-Reply-To: <20261022025309.24028-1-zhangyi@everest-semi.com>
X-Cookie: Whoever dies with the most toys wins.


--FWfpeUUKuu/BHHrP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 10:53:09AM +0800, Zhang Yi wrote:
> Modify the Initialization Configuration and Clock Table

This doesn't explain what this change is intended to achieve; we can
tell from the diff that the data is changing but not why.

>=20
> v2 -> v1:
> 	-Resolving a compilation issue in v1 caused by
> 	the omission of sound/soc/codecs/es8375.h
>=20
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---

Inter-version changelogs should go after the --- so they get dropped by
tools when being applied.

No need to resend.

--FWfpeUUKuu/BHHrP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatucyAAKCRAv73Ows9A4
iTKqAQDR3lwUff5XjI/RcTrb5unAScQOzsyaEfUoWoaWbcqLPQD+LZUfAZmZJpbl
eZaiernjlwEFntgndd1eE2F9f3L+FgU=
=jU93
-----END PGP SIGNATURE-----

--FWfpeUUKuu/BHHrP--
