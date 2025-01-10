Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351D8212B10
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 15:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736523003; cv=none; b=iSloyMUUKPiJ7/5Ez0Oiq3b183ZfPtA24wyn4Qioxt+ihiTkMISrWHj3c3w7wRoSzxZ7Vbcrb5s9Tu3j1xc/WesARakgXnv56DDZKMfI7RWwr8HNAmFzx/ob9aCrzyqPSUGuRCkUmfsdIw6avWC0JsTdFzfkJkuInBSlR+Uqpqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736523003; c=relaxed/simple;
	bh=uhcCkDG+bHae8B5yW5MGZ9tcT2HxQFwZ+lmEJTamsbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nD3jqeWasqWeLsmL9nsSa+UI12ru4Uu2Q1VdDv2eeMncVgnqIilkyIsPvCrzqo9Vt2EjoQIyVOE9YjOZP5T3+xG6Y8LRVK+ol6PYqxRIEAkSUKC0+xSDAEmx+74afeOMFZLCn6T+6uuPnwQm4TP4NK/+Oy6fEgmNIHx+bNYGU+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mqvd1zDi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mqvd1zDi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964E1C4CEE1;
	Fri, 10 Jan 2025 15:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736523002;
	bh=uhcCkDG+bHae8B5yW5MGZ9tcT2HxQFwZ+lmEJTamsbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mqvd1zDiOfDQuaLn08dcUsvWho8yFUh+Gr3q3xl8nU7jTCYO+BsuiXLeCnI+X5Rno
	 4nO+BgPGq+fgKUROSG5K4MD0I5iozF4M8blgR3IhipexHorPRsJeUeC7KaimN4k4EW
	 tjSZ22jqYLyv/KQ4LTQtFd2VBG2jDKU9hNhEu7fWJNwtVmmTYooTnLW1p14b1QGLuN
	 naqZbDHA0PjS5HwOeiVU35szQATyFX5mLxYGFUPawpMjYXVWQvfL3iOjyEu7CC06d4
	 VkI3Dd7P0LQcvpChJPg7jt+W1/4CMKn7avVdWPS6RkIvFrr0/z/rNTnUYkBkj++Cb0
	 2LTwyIcIJX03g==
Date: Fri, 10 Jan 2025 15:29:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Andreas Herrmann <aherrmann@suse.de>
Cc: linux-sound@vger.kernel.org,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] ASoC: amd: Fix build dependency for SND_SOC_AMD_YC_MACH
Message-ID: <de9ba3c6-3dd6-4b09-9047-2a644f37e54c@sirena.org.uk>
References: <20250110152324.20529-2-aherrmann@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UtJ2+Njx4QcyOc71"
Content-Disposition: inline
In-Reply-To: <20250110152324.20529-2-aherrmann@suse.de>
X-Cookie: RELATIVES!!


--UtJ2+Njx4QcyOc71
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 10, 2025 at 04:22:39PM +0100, Andreas Herrmann wrote:
> Commit 4095cf872084 ("ASoC: amd: yc: Fix for enabling DMIC on acp6x
> via _DSD entry") introduced usage of acpi_evaluate_integer in
> acp6x-mach.c.

Someone already fixed this.

--UtJ2+Njx4QcyOc71
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeBPPUACgkQJNaLcl1U
h9DWEwf/Tha9gdlHfOZiiOrPXU0dSEOB+HowkGQ/ISqgOU4VtP44QAYhWIk9rVIr
ayS7ff96Icui7L9+2iCDIiG6pmDpUnzoM+CgxsWBEImYSBl95V1k6dO6D6SozcU/
YrHEKOF3YXOGqthYp3ha1GqRXYfr2z6PhqDrrD83ze10FQ6SbmFmBTquFy6ZVgfT
RCdLW3mk5QQEf9f91postb3TY9MZKWXEUT0JWR3u5ntSbyhVQrTIvSAV6JLSg9dp
kzote1qEciBPbmrkMiE7eVk37XzWHqLm8RTmxDhdoRf20XCeIpFqj/zW/4nBjpvL
0laBUr7oN2YvRwC5BBVdyZ2cgysu4A==
=fUvk
-----END PGP SIGNATURE-----

--UtJ2+Njx4QcyOc71--
