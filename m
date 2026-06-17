Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CDB44B68E;
	Wed, 17 Jun 2026 15:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708528; cv=none; b=XQUXKmPtlLwXM06sDefwAn63AHVlqjSf+Fdp9fsNUxLxt+QSTeIUYbqW7bQLlysPs0khaQs94e6732cSJKcptdYOXhegmuggop0hDaxA0w3GvU9/3MT4z2bMSBmIK8d+4rjjnQKfajJ/0KCx2aGxN+lEeGvP9OmhJ00usSeRoXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708528; c=relaxed/simple;
	bh=cm9uc4m3hMipx9F0pg0UfZ9wTfj2n5Z59TjaJH031UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fataE/Q2F2Czm/eZWdFO1Dm6VbeyHr2RXy2N34dOgqg2YOJSXlHPqALQoUZ7CSajvbJtB5AiZAvzGIHA2l0lwDos+Dz55+XDbq8bQJojHsqCiDjcdcrQ6zfidxhLlNvaa3Q5rnMySi974CRYLv1GJGXarXcaLfqLLgOMl0EVjHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1wwi3Ou; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1wwi3Ou"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E597C1F000E9;
	Wed, 17 Jun 2026 15:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781708527;
	bh=cm9uc4m3hMipx9F0pg0UfZ9wTfj2n5Z59TjaJH031UA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S1wwi3OuRJeNvtoqVXl0GHzA+aX7N3AEkqwrDSaD09+82dtmOoIcrHXDLDZLnV7Z/
	 jfDMhu/AjdVyozqySXCXXcXczNgxWNgAiMf+YIOCLZKvjaOIvgujmi/2txobWvlqXG
	 aTG833St+3D76sIARvu9LBJ4TUN7RI9L1jJ40tqU4T/9EVkh8HfV6/Yb1wZu1/FfWp
	 gaBgKjGj4APSb2YwSCh35ifEVvSClX0qDacbddSBkemJqRpc0OWBkffAnsF1E+Z3Ek
	 7Fkw9RnJy8KqcMSdTFQrwNBSOGZaHgX6+YNVFDoFe5i9jQT7sj+sfI4xOTLB4YZC9m
	 OFrj4Nfh+WTbg==
Date: Wed, 17 Jun 2026 16:02:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
Subject: Re: [PATCH] Revert "ASoC: audio-graph-card2: recommend to use auto
 select DAI format"
Message-ID: <2867f233-2eb5-4990-91f8-9082e67bcc8b@sirena.org.uk>
Mail-Followup-To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
References: <20260617145508.327213-1-alvin@pqrs.dk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HQGvpTZfrh7PTonm"
Content-Disposition: inline
In-Reply-To: <20260617145508.327213-1-alvin@pqrs.dk>
X-Cookie: Absence makes the heart go wander.


--HQGvpTZfrh7PTonm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 04:55:08PM +0200, Alvin =C5=A0ipraga wrote:
> From: Alvin =C5=A0ipraga <alvin.sipraga@analog.com>
>=20
> This reverts commit 442cfd58e71260dcd983e393f750e36fe7ab34d0.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--HQGvpTZfrh7PTonm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoytuoACgkQJNaLcl1U
h9C1gAf/bOQfBvg9bQcy0ctXkq49Q2V5U1GK5A8P+mNQYoYcMVuCUg8sVXX0ohQi
x8MxphN55HhbJouQT755iPfjHsl+1T5zQI9mIumycK+3LNlshEJ1M9p9LJZD+/xn
iSvVlDkp86DxoaUev9dzawCF3WZqNDv2zZQKl1cTYO0U4G1+o9SqvueOsVAU6F/s
cguzLz/6kbCxesSzco5A6wZ532C/uYqcT5sxEcSpH+PfZHNr5mvy6rY8yrMrpGHF
0iTwGaoljZwPKztcwGGb9XmR7C2+txZftNf2OY9J1ShLAVO8EQitrKFn3hqBvxBW
mHbG0vTtAgMUGAlaAvaNmd4DvAJT5A==
=CXtD
-----END PGP SIGNATURE-----

--HQGvpTZfrh7PTonm--
