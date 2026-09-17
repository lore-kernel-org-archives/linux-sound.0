Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1859F41C2E0
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 22:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789684406; cv=none; b=JYHcFP1heTtpcyLaQlts+UAetX+WYSUc2RgLl2G4zB70JgQsqJLK6H7MxpacZJVKgCy5FuRbKmUwbQ5gl+yIzopH2QlPbPMzjr4YfVYNsvYSzEK6hhmsARdy2SYKJXTpSLSFSb2KXya0K52b2HXSVHCWsm2ytWgQglx4l0VnzAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789684406; c=relaxed/simple;
	bh=gMgkxCdp5ZQaN9WwxzxlOcH0YMNLeV1GIyQxomcfK+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cfEDZHiPMmjn3VVj/zvvx2KTq1GTK7KayxvdhXoAFdNIt8FYgOSK91/v7oWux8XqeUFqFNchekyI2ED1wSHcUi83Y+3rqK+pjBPFM0PuWEPwmcdNHDiwmUjVGaJ8w/mGWqiWv6MyjoaP3vNAsAXpxaATmhXlocaLYBB9PwlGUv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8jERCnR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8jERCnR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F2BB1F000FF;
	Thu, 17 Sep 2026 22:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789684404;
	bh=gMgkxCdp5ZQaN9WwxzxlOcH0YMNLeV1GIyQxomcfK+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g8jERCnRh1LUXwnadXzyTa4fWA6ynQpIksd6KfsKwpy0i7rmjohPYHyqi9ZpQRaCJ
	 fKpLOhAQq/dNCOntab95/FPhbnWh6mJzOeyz/1JCjOXKLVbdPghc/3WD0fy1zzYow8
	 yautoTTfk9l8xUJtVMKUu+2cyyRGHLE6K90b7zrlfM6TaCZU1GyaGuAbaShHjSl4/X
	 xLtaeYHUh4XipEE94ukl3Y0wo4S3UaucAAYuIFWaIhIQnB8Jjv3J0F15Cr3uNPhqNP
	 C7skVBV4AIkHEKmTpiqqfrvQRSrojy+uAFmOIn1Ac0dYpes1Ubl20yo3fwmOBiz1lG
	 08S014oSKEpDQ==
Date: Thu, 17 Sep 2026 23:33:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Ruslan Vagner <rusya92266@gmail.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: fix comment typos in codecs and atmel driver
Message-ID: <2e3f4adc-d214-4a06-a864-cee9a53d40e9@sirena.org.uk>
References: <CAF9RqJ5xANuq+=b2Cfaz42zufDp5f=E_vpncKCO9ap_neqi_ng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fplYvgn7Esh2kAHS"
Content-Disposition: inline
In-Reply-To: <CAF9RqJ5xANuq+=b2Cfaz42zufDp5f=E_vpncKCO9ap_neqi_ng@mail.gmail.com>
X-Cookie: Whip it, whip it good!


--fplYvgn7Esh2kAHS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 15, 2026 at 07:56:10AM -0500, Ruslan Vagner wrote:
> Fix the spelling in comments. No functional change.

This doesn't apply against current code, please check and resend.

--fplYvgn7Esh2kAHS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqsarAACgkQJNaLcl1U
h9AP+Af+KNO6MsIEgs6lIMPYj9zw570VLcx3q+8i1zt2gVyNUpS7bwddXC6aIIo4
U9Dk91Dg1QH0OuAVQJcqv5LGv84wEU1YRnnuWWpVbfC+wuSq4yMA6cD/QDq6/qbS
LjREuwFrOYBHcKj3MGBW2K/inKQ6pjKCWzMpP8qYF7QdEZBj7ytIpmVAK74XrbqB
CTHsDFkzO3dDNvtg1ftgYNRPpUkswp4uiyMn5fKpnB22plbOsumT2y4C2Ge62xF1
gl60qissR95l9zJERDNz+Th4HbbYbgqfsEoylbbbL6N2upH41E/8sNHcKRINBcNh
KtulWp+cWSYZsUScjyveMhmIoeJrhA==
=Z3QK
-----END PGP SIGNATURE-----

--fplYvgn7Esh2kAHS--
