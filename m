Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE6024A11
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 13:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710251765; cv=none; b=umcgiCxyVV1vhGnpQxWPpp3zdkHuchuwz2Io78AkbqFTUHxBqetrzRfOA9HH2tj/ySpWLxJ+9VLCufZsRbTGCgHFDLrjNwikQlIL8TWX9JSie61F5KdU7hL0StWpalHfJx1uEaMrlY2YrxgCl1XPjAaiwi6BkDgWRy4pFfQTFuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710251765; c=relaxed/simple;
	bh=P/vHwoKqmXP7+9oNKpcGUtIinGJQ/nDqltHhcaR+VYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lnln4vNGMibZ1zE6qdRqw7czzB6xnauumVA5Lp2UXBYgu8+IQ34AjPrIA2aFKpLyT9e1lOS7OzwS3nqSdaVyJIrv4RvBm+27NjbM56DE9hsBcJCcpA91bLMK5EgBII9Bv5RWEEOl4BAC9lVUwUfYV+wiHG4kI8/MGAaKj8L6kYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBfs8nYr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBfs8nYr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3A4C433C7;
	Tue, 12 Mar 2024 13:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710251765;
	bh=P/vHwoKqmXP7+9oNKpcGUtIinGJQ/nDqltHhcaR+VYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EBfs8nYrweh9rwR7/qbEwucDKRCqF5e7eSHp7s7ZvVDwMkOEx1dpUUog7vVnYc5zM
	 0tC113iIjbxlo4XCvbvgt0J1V4bMreQdAdEGY6AV9McEr1iX76nspFxQphS0Gx6++D
	 woN/PjhV1DWGpA4jIr5EmQ8cPk4q1eJd6ePi5qQUGeK1NDnzuxZV5EwAMTu1F9siS5
	 Vt0Ou2DNMzreRBfxrC5BrVoB55XGjP220QkKkx9BnRUZuOz5nFRCKV74Nxhxdqcigq
	 hXI9Pk7Evlph1bNBxpvspfe22XX7S1jgoHvdSUPYbQKaZHZaS8wnkANbdrTBE96Et8
	 ix7kr3llZm1Pw==
Date: Tue, 12 Mar 2024 13:56:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiawei Wang <me@jwang.link>
Cc: Mukunda Vijendar <vijendar.mukunda@amd.com>,
	Sasha Levin <sashal@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "ASoC: amd: yc: Fix non-functional mic on
 Lenovo 21J2"
Message-ID: <a9a4f09f-f38a-48c0-81dc-2796c6126e3e@sirena.org.uk>
References: <20240312023326.224504-1-me@jwang.link>
 <20240312023326.224504-2-me@jwang.link>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zE+hGh33rIYDAGwk"
Content-Disposition: inline
In-Reply-To: <20240312023326.224504-2-me@jwang.link>
X-Cookie: Oh, so there you are!


--zE+hGh33rIYDAGwk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 10:33:25AM +0800, Jiawei Wang wrote:
> This reverts commit ed00a6945dc32462c2d3744a3518d2316da66fcc.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

> Lenovo 21J2 uses the Pink Sardine (PS) platform, not Yellow Carp
> (YC). Thanks to Mukunda Vijendar [1] for pointing this out.
>=20
> Lenovo 21J2 should not be in YC's quirk table.

This doesn't apply against current code, please check and resend - there
was another quirk went in yesterday which might also need to be
reverted.

--zE+hGh33rIYDAGwk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXwXvAACgkQJNaLcl1U
h9CTrwf+LkdaeDbTqc0rwwLJ7naJX8TuQRqDMd95Cpezq66YabVlHuV3X/u2oa3s
eJno2A7wi9Uga2hu8fvlpfLz8j4d2utyzFz/OlNE3H0dIfGYgT7R70xuX1PEU7xr
c3KVsfVwMSbtSNhHLYPiJx30ufY7F40q4hYBImTHRzxmSpY0691uzugll+RWwP+n
zTkV2P3lbGaYpOI3x9ZLTM4jJe69Jy4QybXS+VqLRhS/3LoxLS+yga3FfOZdg+RR
BZobf2MPQGdBqHdnzJzMN9j+IbKkOwSBUaoMh9HPwzv2RaJRguKu0e0Z7GaJn3Yf
5h2DXWqkztUocjLN5HzMKveoPJvBkg==
=QXWp
-----END PGP SIGNATURE-----

--zE+hGh33rIYDAGwk--
