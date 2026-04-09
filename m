Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CE73D75BA
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 17:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775754498; cv=none; b=o5vX5932M/leDpEIt8aVSR+Y3ELBxqaLq+EmJL9wnpbAVKQOCcgQ6koIa9FY/yLAWWUVjCvliV8k0DGmI42+fODSdxsUl+pmA24LIyuvyeaLRx5I75xkZ5QOljq2XyJRS5fcNmhkPy6Bn0nme1zmuRUMvTClhkSe1gmPXd6Gjv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775754498; c=relaxed/simple;
	bh=BxB8rOGw7XTvIWyZdtaueonvxg0lwTlCFXn8mMPSPA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6erPhNJg8mql0QCc4hxgMhNjhE4KzbTR76HaSczDDCtZaMUxccqLYKZExWHvZT7LuJdNVxxBO9Yv7IsIcLPW/JnRDH76DcKyMYWFMmeXslmcV35oTR/WMxDyDdbEKs+M7+X9kjT4lq5Lwhd6tX9L20spPYcrOu6nmPlxKeirEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qLdRod9J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qLdRod9J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9340C4CEF7;
	Thu,  9 Apr 2026 17:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775754498;
	bh=BxB8rOGw7XTvIWyZdtaueonvxg0lwTlCFXn8mMPSPA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qLdRod9JeZZ3FPiF2KmCRFgvryyFsEtDLWYWygvP0D9JFvl3XlC70Hbe6KSvYYea0
	 4aoHB1X0XkZDCvu6Itlf783y3ePd0gygloMV8IfYg4oo6xf1qDn1Q6Ih+jJzVFDrQE
	 ZSoSxPkDBth8cu49gZ1ydELNvMAGPAtmzAIqAr2bFrvYh9z3WlNQzi29d9FGU2Qu/0
	 0HbfOmrTUayioqcx6dIb2N/JY5LOFu2SmhPvOFH2KV/uaPURtY90knnijpf4d5VwxI
	 sT859VrpQXIYViuYvzt00yb15vxhqOscZR1nKVk5m3GjY3qE6fLWB46zokS8e6X2sA
	 FrxwfZL7B2hyw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4D8171AC52C8; Thu, 09 Apr 2026 18:08:10 +0100 (BST)
Date: Thu, 9 Apr 2026 18:08:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
	shumingf@realtek.com, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 4/4] ASoC: SDCA: Update text of FIXME
Message-ID: <adfc-q2KTRLIP3q1@sirena.co.uk>
References: <20260409164328.3999434-1-ckeepax@opensource.cirrus.com>
 <20260409164328.3999434-5-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NNoScBrlVNonMmlB"
Content-Disposition: inline
In-Reply-To: <20260409164328.3999434-5-ckeepax@opensource.cirrus.com>
X-Cookie: Are we not men?


--NNoScBrlVNonMmlB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 09, 2026 at 05:43:28PM +0100, Charles Keepax wrote:
> A couple of attempts to correct this FIXME have been sent upstream but
> the situation is not quite a simple as the FIXME implies. Update the
> FIXME to include a better description of the situation.

Please don't try to mix versions in the middle of a series, that is just
going to confuse both people and tooling.  The versioning applies to the
series as a whole.

--NNoScBrlVNonMmlB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnX3OMACgkQJNaLcl1U
h9CvNQf+PjZPEyNJdkKR/MU/9wsqMC+rMtJm7C5oExoAdH5ycXu0PzbwgX0RTtYq
Z4EJD9gvJb3YbjuPSm+cK86khhzt/Xgsz5Zr4oujsUhhXROakIZzyBtmypZNpad1
NuQxkNwQNlPw6iQCEH5n+ehiKe1q3/ghqm6mQ6oZrDVBPRLEBXdsRmFjtM9ONHE2
6cj5BShsckZoMP6jZ26vV0jWansS8xiH/6IOkG5BZUpq5jLR4lBSEABW0kttdysi
Kum8aUnhqRFzGF//2XqWTsgQPYskE7Z4uUxvm5PW6evq4AdbZqkqTuoLqfGjOOcx
IhHPL3UEG3+l18BbYGb85KtoYwGzWg==
=Ajsx
-----END PGP SIGNATURE-----

--NNoScBrlVNonMmlB--
