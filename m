Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106458;
	b=oels1EXfVcJWfyz44oLgC8ztLVYKTFz76dpNvDFuPHjwY/maceyoBYyMiEUIROhvg7E8
	 pAg6cj/ojUse2HWhHAK1lu6vybj9hyBCFrjgfq+vQDizhq9d7YFaXDzFrGsnxS8SKz0EE
	 I0IBSI24iRbXmQlq0Ru4Evf9AR6F380ihg3YcdjmUrPWWjHpZHU8tpdWrdghJFu+ndlej
	 DemdMSLAQIr+1L3pZF7szwjrvEfe3M0cxKbGv19FEokOfp3jmUjCxcm3zOXqFhpB6zwi+
	 JKTxkuSIh+rWcKIPPT49dwHC6YrRnRk0TojjXktio0FvTm40rmQu+/CPubyPlJtVExA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106458;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=AZySMT1uU7wlY3CYeO28UhSAh5rHHrQpOqvsCMUAbds=;
	b=ALJGDlS0YFTizqVLdtQavmVkZFS5QP8xKG6goEL0zpsM19CKHLfn+Z3g6n5M2NJgePV+
	 6OCUn9GYVSIJ1daqUHqqWKa1OOBI9k+AHjwgCubqK2iErZ0rmS5M3jLZqoJDTa8sWcqA2
	 dmPBvOg8C34xjS5i7uWxOE4jovEj5HCPQkdI7LeEroi118TUg19c6/qEcUBSfUdvzbEIb
	 pSTQio09HGfzwuM5D2DG7X5v2/6mYfnfinwZM4PdVgaErxznmPpUb2taj13pDAG79SwEy
	 RI1csc14XndknWMVJGfggXIOTqiubhEH/AyH6/XZpdf6NMmIJKZf6fzyuBzaQ6G7mXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fMdV5UjX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12314606A320;
	Thu, 19 Nov 2026 16:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fMdV5UjX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DABE1F000C5;
	Thu, 19 Nov 2026 16:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795106457;
	bh=AZySMT1uU7wlY3CYeO28UhSAh5rHHrQpOqvsCMUAbds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fMdV5UjXdX/M8UzIX6qLsUyhd0zlCkn90kXBrTvBEcKGMjKb8Xc+juHj6UT0mwNd+
	 1hWoOCjuV7XxkYJg9/WAsZFMaHH5Q5CuCMYz9s3L4ZcjPYf28/A7c+YeDnHBVCVSde
	 pmWyfghpTUVEcXxXBzHCl/H6UhZ7B2O7OjlOTnHn+gsiazjXxzLKzVjXACnbl3jl1F
	 OyrsD7bzUieZZFeULh0uhjg+gQ7/3ns1nrVGCqJHlxWt1BlzhCFV8TGIQFIuvmeu7V
	 JRwhuhVDObgXXrWYglGs2rmA305KOuAa5aHAQ+xoZCTbqiSf780T38UJCiDHp7LjIG
	 6JnVr9j6wSrvg==
Date: Thu, 19 Nov 2026 16:40:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] ASoC: aw88261: fix sign bit check in
 aw88261_dev_get_vcalk()
Message-ID: <dabf17f4-f878-4412-a0d4-f9dfe5c4d66d@sirena.org.uk>
References: <SN6PR19MB2303E8188DC58BDC07645705FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
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
	protocol="application/pgp-signature"; boundary="9xUOkPRIi3otwYtj"
Content-Disposition: inline
In-Reply-To: <SN6PR19MB2303E8188DC58BDC07645705FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Cookie: I'm into SOFTWARE!


--9xUOkPRIi3otwYtj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 05:30:12PM +0100, Marco Giunta wrote:

> ---
> Hi everyone,
> I'm currently working on an aw88399 patch series targeting some QOL fixes.
>=20
> While working on this, I spotted some things needing fixes that I'm
> sending separately now, as they are all relatively straightforward.
>=20
> I checked whether the same bugs were present in other awinic drivers
> and found a couple of matches, that are included in this series as
> well.
>=20
> Overall:
>=20
> * patches 1 & 2 fix a missing bitmask inversion in aw88261 and aw88399;
> * patches 3 & 4 fix an OR that should be an AND in aw88166 and aw88399;
> * patch 5 fixes a forgotten rename from AW883XX to AW88399 in aw88399.

As covered in submitting-patches.rst this stuff should be in a cover
letter, patch 0 for the series.  No need to resend for just this.

--9xUOkPRIi3otwYtj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr/JpUACgkQJNaLcl1U
h9BZMAf/UnWn/DazoQR5q2evNfNl3nkKkInR1wCI+PFFGKVGTYlNaaeqxbJK6y1s
UpMjMfbY/Lucjsn1XpXKLyL0Vfk4IFqz0R5PkwTllrj1iBzrV0M1oUCYe0JTQs19
mC36ST0qLaAhXnWlfu/E4cS5x5/7m9H2KHMYQ5I0D/vKbZyECyLXZMmzMsxv/Dlc
9SEt2rChJ+ugTJ0Qh1EQNwXhZ6gKm9Pqud7iK5rhqw5jOMG+iYsHbteLNb/o9hHr
l+I62Jl6dGlwSqcd5XvG2jx5Al/ltqD5phPa1RIqN75yS5DIkPKXQu56gO+r0mk7
wavtpw7jsiUclFK6xqOYReNQtVgz7g==
=Uk0R
-----END PGP SIGNATURE-----

--9xUOkPRIi3otwYtj--
