Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCBB367290;
	Fri, 12 Jun 2026 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270394; cv=none; b=HyIq81T36sGloiALvNFenZcvIY1mmeje0aayMYZ2C8fLpU4TUhHfweYeauoZyg5e90ly7SwOEsH/vCu13MomxVBhW+a95Y0MGywUgDO6MHclF5jXjm9bkGuIOPH8joTkoCJ387OYqfKtYQX6a/QLI96NXTWxC2pHbTzc8AQZNwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270394; c=relaxed/simple;
	bh=dMiy8YJilqeLy4yuLyeoa1DWJAaISk3XLmw6h+N4mFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UeCzFOOjFWEu/9UYNwMxEftciU3pEUxKC4exxIi18GymphO5WcgeZucO1aO5P1U3tFwtV6/RYJONqXOYKjqSwSTJqlAEEftzHaheULUbswHmLcU+w6f149D7XugbXjLVunjfdm8fVPNLkzeSjssialymCI3GeJoalLRWzO5UL7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRWaSvc6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRWaSvc6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BDB1F000E9;
	Fri, 12 Jun 2026 13:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781270393;
	bh=taNgp4KGsZ3KiXZSZvUQMLkfqRwbGhzPbNLDn7Y5E3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gRWaSvc697+zpk8A7FOUkBv+zrymR3irREfWIgwvAlNE/BxppA4V648OReKSQc8fp
	 J3R3YL8sEiSOnsEdKj6XwmuaOpQ6ta9vePgHXJBEmqcwbxjJYiHwGZu6b9QyRWTGUC
	 vAVXTrOmyt0akvDpkYpk4JJp9IhEemH2e4+/vwYU0vTWKnmj5OhS1YC5CLaruu+xqi
	 VKQKaRtjZUBcKE3N7wD28JcsM0zWdZowDDK1fYjLLRInkQDGK9nhOeP3civb+CAn2H
	 S3SAiAzenl7h12DoE1ntDoUH80lttvHmEVfh2ff4AtaQtsRn3yAm9VQTAenFSnxpoj
	 IeWk2wxbZjcLg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2A3061AC58C5; Fri, 12 Jun 2026 14:19:40 +0100 (BST)
Date: Fri, 12 Jun 2026 14:19:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Valerio Setti <vsetti@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 2/4] ASoC: meson: aiu-encoder-i2s: prepare for
 multiple streams
Message-ID: <aiwHbBM8UAYRKnvO@sirena.co.uk>
References: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
 <20260610-reshape-aiu-as-axg-v2-2-cac3663a8b51@baylibre.com>
 <1jik7pebk7.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DTWiBsS0PG7p6gAP"
Content-Disposition: inline
In-Reply-To: <1jik7pebk7.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Nice guys get sick.


--DTWiBsS0PG7p6gAP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 10:16:56AM +0200, Jerome Brunet wrote:
> On mer. 10 juin 2026 at 23:29, Valerio Setti <vsetti@baylibre.com> wrote:
>=20
> > aiu-encoder-i2s is going to be the interface that handles both playback
> > and capture, so this commit does all the required changes to prepare
> > for that since so far it only handled playback:
> > - probe/remove functions are added to allocate/free per stream data,
> >   respectively.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--DTWiBsS0PG7p6gAP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmosB2sACgkQJNaLcl1U
h9BePAf/YY4oU9BYnoYM1az7OlkzIVHobdSBXPdAMqYYrlPj/WIZuTEDI1cdo/22
hoqllO3JKTLGy44Zy5I1P7ijkgOEkx2mZeJ7AZYOgZPlIXPH6AKbscA/xYjzfYP4
2CwyerLXM7UAy8RJv2Kimqj24HF6mzVVgYRbghHGqDWnLSGWj6BQLSlgaUYhwIcM
xdrydiGGZz2vkC/HOmwFqpGSyk4XQAm3HFkW5OwsK3R6CmVSwcFxa2fhjcTw8CXc
3gcvi70GBGQi8+9nMiAyGmnqxT4aONevk4cF8sVxLOxH1Gg0hwgMmsllFORiBdap
sDGZbqCPoyuQ/1hjHLvs3sqbo32+3Q==
=PhOT
-----END PGP SIGNATURE-----

--DTWiBsS0PG7p6gAP--
