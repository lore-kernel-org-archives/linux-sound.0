Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3E73A8749
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 12:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942709; cv=none; b=Iv2gqdh14lgbwYRXmRHY15Z93d2XUcQeFQrfKLjciQgfnwqJREiqzutEqhs6fY+HJM+It6hg4k2VCdIlbNhDdWc1FcBo8fWSOh2c9d2dZutds+dYeW3YZeHgVxbLAjd684XOeVQSJV4l6JH5qGyK1iGImrn0uIGa6WLKOwCsIQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942709; c=relaxed/simple;
	bh=3ppz+0+KC8RglXupDw5XvzdR0ItiGOGYf6l0j5c834k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKb444l8qaVxnQxcG1TSv35zqfvRbZ2bGTKomYIMLDe0e+pIDZgEEXN4u0KZdEgrf1w7dgKFt6w7sC6pIG+/FP+QRCzCTlHo2BkxJfNDLAcMn6BSeQQg9lSx/aQZumu6WN9TSpX6BoqLTrUwz9jPBG27BFdBhDnjtfmO4/W+HcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDEfR6Ho; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDEfR6Ho"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A324F1F000FF;
	Fri,  2 Oct 2026 12:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790942706;
	bh=gaSbE/diFRPGNNC+XPDwbrpG8w8gTuZ71z6p6AbQaPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MDEfR6HoIgDfSqOvtOjcUMW/x+U1N3y8VOGZNY5NF3Ixgri3nnd2ZaWAXqmymJ5+Y
	 v9kJ5SNSfWdz4g1WMgkNdicwmnixLaF0YKv27OzUBWKQaLDaSTIvEespcf2+8ElXsE
	 EYDdLvUxFIcDfzWLeq8J3Ep8V4uXLs3EMGP1R8btvTcYRHvtb2rIaYg1SIAzR5ZOEr
	 hJ32dHsh6qe60PUJ65NHAQWlX1nFTcPtX0JKm3dz9FyWFZ73ghQkieMPlx+5UxIeVn
	 mGxrbW3qFyw0ZKsC74jZATZZEg5PVTZ7ZK/fJRtxsElST5SZlxeLtfXkTNEW46hFaa
	 oxJeQzVXaQoYw==
Date: Fri, 2 Oct 2026 13:05:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.3-rc5
Message-ID: <68deab21-b10e-47d5-b0f3-f533c995a87e@sirena.org.uk>
References: <20261002115438.DD6341AC57CB@finisterre.sirena.org.uk>
 <877bk01fii.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d9K1qqkfkzkYn4k5"
Content-Disposition: inline
In-Reply-To: <877bk01fii.wl-tiwai@suse.de>
X-Cookie: Measure twice, cut once.


--d9K1qqkfkzkYn4k5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2026 at 01:57:41PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > ASoC: Fixes for v7.4
>=20
> This is meant for a PR for 7.3-rc6?  Or really for 7.4?

v7.3, sorry - I thinkoed when I was typing stuff and fixed up the tag
name but not the subject.

--d9K1qqkfkzkYn4k5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq/ne4ACgkQJNaLcl1U
h9CnpQf9EZ2p8fTtZL7ztr6ap3dqTdgl7Py6wi5vic8PC2FBXhy4mnbmTqlL9ftX
7bl+TyNCb2SFAY0L9fIoU3CgIQXhYSeUOnQIfgxv4t29NGXKz0Rs0EOJ1TNcoz4t
6jpIW0d+rtFv5Ert7pXxSh7zmLnzQOxM6QhGRo24DbWqEOKd/h/wfPp4B0J/uJ//
DcWv4glorolT/lmZ0b/FYyY9QBAg8dqcoigS6LOpTu3eYjsCRtYCSfOZNKc5s6g9
qF7ZZlNWIQfl1+Hjh+7PBLh0wW8AUCg5TlqVcgVp/IsIimv8BJq9onIE/THyasMg
cqzqLgHEtkX2gLH/CDg5jWminOamKA==
=UoQs
-----END PGP SIGNATURE-----

--d9K1qqkfkzkYn4k5--
