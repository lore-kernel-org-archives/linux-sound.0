Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E9258AC4
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 13:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710249248; cv=none; b=kfYgMPM2qtU04usDlMy+4FjbgqjjfcUh3mUuayFCC+gpxIjp8xjvY4jnapHPq0k+1cHlrn/pBCeu7KuBWkRygXwFRFKgie2FjtUY8iyZ90tykVmWa1lNw7RBrbLK7yPYJ/BuTNzy+DHFfMAjXHBb5QR6/UeN12bMVV5Wv38BCM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710249248; c=relaxed/simple;
	bh=lYXMh/VhJOBdw8Q6ZNlQBSkqO+8vl05y+VDb2Pyunns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/v0KDq4A1tGCFa8Zh+qY0X5hLvtvKe9sR0PX8mpQ4i5nFu6WE0JJzScDKehcfAJi0+2NlDfeapuEvCqfZh/V1LEKHNMveC2JeMAIAgdOrTMCMZv2QNbBJx4DYQmxUwnwcjCIu7mylq4H7n1A9ss0w+aRwIjNJmnFNPbVCMd1CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3nF2gqL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3nF2gqL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254F4C433F1;
	Tue, 12 Mar 2024 13:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710249248;
	bh=lYXMh/VhJOBdw8Q6ZNlQBSkqO+8vl05y+VDb2Pyunns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O3nF2gqLPju45x0jCSbojBKmp3lqoNAR3KT740q76z8TCpwcQwFNaybjeBCFZ07GR
	 6JF19dvkhfa2XL2TiSbasArsa+h2GNoQV2YygAxwxq4OD6JoW9bT0GSLk1DPeGbY9n
	 eAXwTjLbWx+xCCwLaEle0hPdh51sABo6HALniMCbE3HKikfP2NzCCjS6Tn8VaE/rjB
	 Xr8SpXzoZYWrf+d8qnVKUFwrro/qP1k9bArjgdVjAYRZ3CuuUMecGf6hMt0n56i3Pt
	 8LXzz5xBfiAI2eXlHIialVa6VAxR4MFeNc08b+zJEBvW9yFIGFIlrAbFiqna/tS+iR
	 e9aIrgIHrm1Cw==
Date: Tue, 12 Mar 2024 13:14:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiawei Wang <me@jwang.link>
Cc: Mukunda Vijendar <vijendar.mukunda@amd.com>,
	Sasha Levin <sashal@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Revert "ASoC: amd: yc: add new YC platform variant
 (0x63) support"
Message-ID: <f977ddfe-50c7-4c08-9621-e9079f4a2d9c@sirena.org.uk>
References: <20240312023326.224504-1-me@jwang.link>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1Axp6qaALKcVUKbp"
Content-Disposition: inline
In-Reply-To: <20240312023326.224504-1-me@jwang.link>
X-Cookie: Oh, so there you are!


--1Axp6qaALKcVUKbp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 10:33:24AM +0800, Jiawei Wang wrote:
> Please revert my previous two commits:
>=20
> ASoC: amd: yc: add new YC platform variant (0x63) support
> [ Upstream commit 316a784839b21b122e1761cdca54677bb19a47fa ]
>=20
> ASoC: amd: yc: Fix non-functional mic on Lenovo 21J2
> [ Upstream commit ed00a6945dc32462c2d3744a3518d2316da66fcc ]

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--1Axp6qaALKcVUKbp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXwVRsACgkQJNaLcl1U
h9D7NQgAg4uOLRDuEwyqMOV3CyIfgrTU7i2m8OLZM/w/1wNHR+jmDRfPsv+Bqqkg
PEgDSwXSnHPLDGHN929XFbsPeM2gbYt+qBCIuMeGlRsVsw4DSpd1+CjR/i9L2fnR
nMCnBDS+9W3ZDC9nvJ7Hvl1LINtzDtqvlxlIzfCYL5ulUWdqsE/C0akYp4grhwEc
n8D8rWFkjgKQ9Sg18loFunWPDTh5WtBOxrgcMzCWOYrUrKD4MoEPQL5hp9nYBOUf
DSbuNHVfNOhv/dNdSwgoOEey9rdAZFIXBsQ3JeBd7v+a24lMROY1MTDoLFhRJ3yo
HGUS/EzjSwv3pKGR3rnApkpxKJl37g==
=hzkT
-----END PGP SIGNATURE-----

--1Axp6qaALKcVUKbp--
