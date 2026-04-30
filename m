Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA5326A08F;
	Thu, 30 Apr 2026 06:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777529542; cv=none; b=FZ+Bak9wL2X7YeR0rHFF0mkPUD4IWWTEM2RWpU7PBFvHw4mMBWulj2WY5HHnYO6puwC5EZ7T4QRuZAmapofBvJkzPkOFmydUFMR95vvo3jPSvEDu1kHpZYMCw+bK4T7Vu32stkW88Hdv2WhnedK88WcXATFN9i6ppk11HaQS0O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777529542; c=relaxed/simple;
	bh=kvAKDX5Mq5y5ycWcUtrWveKLskZUZR3FKJJav0RXSt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZM5zdeMAIlYUd5frhGGHVwGbPt2d9usd6ynKQOfqYIaVKEWvLEMdnTBaSHl4XHP5Hfv54h12NFhCw0FORpsE+gVEtpY4R4rPlABRdB2QEM3ek2nMlZkAvxYmMiVgqTOozsmjZkN6FlYP7jdccpcUHsMMsoa7/DzBqkI3nr4f4Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCSB78yq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCSB78yq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E85C2BCB8;
	Thu, 30 Apr 2026 06:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777529542;
	bh=kvAKDX5Mq5y5ycWcUtrWveKLskZUZR3FKJJav0RXSt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cCSB78yq7G3L84WOECFePz0hvBPxCAUUhEWKTvtSWWpYa8gZh8Ic3OuoPL+ZEqThf
	 eiwfNt18bNPTHRNmnnYrRBdxG3Wn7K5UlogRQ5OoHnTX8p8E6WtYxpVHIhqf+o5GVw
	 JLSbTsxXGFND+ZNx1GuF6cNJeK6QYsASyT2G9yxwfejDOG72BqqjdKqaQuw5uCKk2R
	 tkWGfnNc5E2W+Q2lI6tCw5pRjSN9xxQojK1m6Rd6z5Ad7nWFlNeLJzzonhqXR6myG2
	 jY8ak5rO73eoQVIa/pmpMcofHP/srYD6PrKGBDeNnqdWa6KOznVqOk8jKrWgFG9e6/
	 6bCTKmM78MHsQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 7367E1AC585E; Thu, 30 Apr 2026 07:12:20 +0100 (BST)
Date: Thu, 30 Apr 2026 15:12:20 +0900
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Ola Lilja <ola.o.lilja@stericsson.com>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: ab8500: Fix casting of private data
Message-ID: <afLyxMXsMt7G12g1@sirena.co.uk>
Mail-Followup-To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Ola Lilja <ola.o.lilja@stericsson.com>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20260428192255.2294705-2-u.kleine-koenig@baylibre.com>
 <177742366371.363516.7540902089580354260.b4-ty@b4>
 <afGUk057kw5f2EOO@monoceros>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sQu3Nu5hJZbz9tF2"
Content-Disposition: inline
In-Reply-To: <afGUk057kw5f2EOO@monoceros>
X-Cookie: 667:


--sQu3Nu5hJZbz9tF2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 07:21:48AM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:

> Thanks for applying. Sashiko found[1] that I should have written
> "private_value" instead of "private_data" in the commit log. I think it's
> still understandable as is, but if you want to fixup that would please
> the pedant in me.

Sorry, there's already other stuff on top of it (and I generally try to
avoid changing existing commits).

--sQu3Nu5hJZbz9tF2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmny8sMACgkQJNaLcl1U
h9CiZQf+NXxS7+gAHn02DUjklsli5x3j5Y+UBSbx1I6fS5NT1zEyor+Jq4dtqtPW
c5QPGKG0yu/lq/hKlenokRTY7Bg6+Bw2KcjATT+kFfBDaI5olbkyIuT9SbrsefB4
wQ0QhYDIVJPn4JS6JOnJL4N3qQYb8fZuBBsYr1BoFvgzgIC7pu7EdSPYkvz0/KJ1
yFDbnYjWTnrzMwSwSFZQ9gtM2cw02GPVKicB7DoT3rE8WDUFQGrPBTfXIYf69Ge1
dAgFFpvaxfIm7kkB0FFSw0WI23jxT5x0b8VRMBW052Cjrs4KzVTMVnkc0A6N7AMf
XtoJaPBUsVYYyD/EWozn17nWknxC5w==
=NEnZ
-----END PGP SIGNATURE-----

--sQu3Nu5hJZbz9tF2--
