Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA56435B628;
	Thu, 12 Feb 2026 13:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770902801; cv=none; b=csgF2MuBEO0qS7EesvlNhUtgwhNBG8OHwa3gdKQiExKsyK/8O8AiktCHKeYNUAGDL+9JNuorop7OtxKXAG2U5PYNyLLY+hJn6782DouZ5jcPuqeS8FVWbsWZZAjcn0mjkr6hIajm0FCeiTR0MCmY1Ahgvq6IY0yVKH7mkFDO0EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770902801; c=relaxed/simple;
	bh=kmWCx2R37I1pesXP7b/LFUAHu+0JXSRayWiTrpXFvNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjwIHAJltnQmDoA80/wUnN2QamSR9Ew91f6/hw8b+y2/sTbXEBDsffHMnuy9b5fYKsQpIZw+vC30jPd42IRMiKvTQY0tpMP8uABH6mQ9WVqOzagC+NLVjl5B1a7FHfxoyd6w9MQWw71R8tuxRi+R6JS7MYncAyE2gq/hBDI+JkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5dqbsUW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5dqbsUW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA34C4CEF7;
	Thu, 12 Feb 2026 13:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770902800;
	bh=kmWCx2R37I1pesXP7b/LFUAHu+0JXSRayWiTrpXFvNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c5dqbsUWxWcM2PhGQh6IVEj7d3rqF+y2JDOXpD0LonGdkO9ee8s6JNLOEfvDpVg6K
	 vIciOFAYIgOlQpRe7IKeFxClqznPBW9mGnab+xtFL5eBZWcshnnxONIKDi2hkgHm1V
	 h25hzb8bl52DsucPESuMiLDTEIP8FVGB0pFioE0hO5mlv9dEE4DYg66y6mGKWdlT1D
	 eM2E0CEZPI031UZ/8hfABogoF9HYqquA4H5Lgayp6VeFj1JdtBGaZvMTiWuIiimrso
	 VqlO7ZIk6YnmXMoCRME3GjoX03HmZ0WVd2988oQcjCiRb47sdUeIu809MfTHC9QTWl
	 EGpSYZvmJ+QcQ==
Date: Thu, 12 Feb 2026 13:26:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Mingyou Chen <qby140326@gmail.com>
Cc: vijendar.mukunda@amd.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, mario.limonciello@amd.com,
	venkataprasad.potturu@amd.com, Sunil-kumar.Dommati@amd.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ASoC: amd: add DMIC support for RPL platform
Message-ID: <6bb77dea-bfd3-48c5-aa76-f5be32b5fce3@sirena.org.uk>
References: <c0c5382e-eda4-48b6-9afb-aadfe873b633@amd.com>
 <20260212111518.8646-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+3ILmmIEs9Cdz4Bz"
Content-Disposition: inline
In-Reply-To: <20260212111518.8646-1-qby140326@gmail.com>
X-Cookie: Save energy: be apathetic.


--+3ILmmIEs9Cdz4Bz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 12, 2026 at 07:15:18PM +0800, Mingyou Chen wrote:
> Add DMIC support for the AMD RPL platform. The drivers are derived on
> the YC platform driver.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--+3ILmmIEs9Cdz4Bz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmN1QoACgkQJNaLcl1U
h9BFXwf/SqXXtLUTeNc95vWDITzEmXJQFBH4Go4DrDXaLg+2ztXyTmfWdo8CRv+T
oQjiu9RNeHlEIJV0l9VwPIKVHAz1fKDm4zeuNFJ67akZXWd0COin3gt2XQ4Ebed8
/XVYYtc15hIJlh6R4yX+ryzSNZIuDkxz8iVVbxp9qI/JnkcZGS26Wm3pE0tsXxix
0geTVsut5wCnl4IVBmVTZfLTBnosi9KwDz3UDQSCIPZ9So/ST/UjT2723qbj1ncU
rP3uhvPzslplbqeDz4suxExggNE1nVtBqA0cD1PRDotukiwh/cr8NXceQgGDqAoy
l/AQ4bzIVg644Z8ryMfwv+IoI999RQ==
=yrwv
-----END PGP SIGNATURE-----

--+3ILmmIEs9Cdz4Bz--
