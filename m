Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3C6311966
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 12:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771417254; cv=none; b=DowEYHbCJP4TcrD/bv1RoPs0wxrob+YbFnXGYWFgH07kvBliom4B4D/5hUoPZBze3YS97nUmfske34cRnXb9rr1X1HzYTOvP89PqVb/ZtF+rkcUS2Asx2qWgCPaPzuGx+pssmv1KsWTACXn7Eysicsvb3zI1tKUwGnWr3xVCVIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771417254; c=relaxed/simple;
	bh=TRC05JAoCqCLuDq8mAYmEsTGG0Zj39UsJ1FPVQMAU1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmFYVhQ89/DcqRvDT3+8PYf/VGoJqFQI63bf4Mh6xBRftUSS+Ll2XZj01AiStzqDG5BaxiKdN1mPu1s57LbwXULjmyVxSjOUgg1AqNR+slvisNywLVM0CW4pn1z90pdercb//EuJihwVM3dDIc1cZ+SFvUgvIDyU2M3EMcQBNBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQLqNsWn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQLqNsWn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC957C19421;
	Wed, 18 Feb 2026 12:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771417253;
	bh=TRC05JAoCqCLuDq8mAYmEsTGG0Zj39UsJ1FPVQMAU1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gQLqNsWnbnwID6NAicDcEhcNQ+BJTjf6g0b9aMJPd98b5UJkfHUQqBT2URVkIb+EG
	 3iw3Oeg9lKL0UHbfrs2+CC73EnmJN9jBIomkFbRiEpXgSDowB6grVDnow71pkX0gYT
	 vbGWOuyh4c6EdBX0YcxUYAA8bprlRferOjxxa4A80oU5fr5cTKTAU76RJuH2imtpg3
	 7skQS/HnQLiguAdlbDM0xdBqhpZm0a+HQhH4gHPhRvmL2Dusorz8lgMEFZLUFZ8Z1n
	 AhxG05jfkMXwLu10gbdZe2FsFE/8UG9A87Lmhrc5e0M/J4CthTrobWXCOFVGrIhgwA
	 l1lHkkVg1mvuw==
Date: Wed, 18 Feb 2026 12:20:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Azamat Almazbek uulu <almazbek1608@gmail.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: yc: Add ASUS EXPERTBOOK BM1503CDA to quirk
 table
Message-ID: <4f7aebec-57f4-4b51-b754-284af80b3618@sirena.org.uk>
References: <20260217121219.79960-1-almazbek1608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NRP9IY4/xxp4E0pR"
Content-Disposition: inline
In-Reply-To: <20260217121219.79960-1-almazbek1608@gmail.com>
X-Cookie: When does later become never?


--NRP9IY4/xxp4E0pR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 17, 2026 at 12:12:19PM +0000, Azamat Almazbek uulu wrote:
> The ASUS ExpertBook BM1503CDA (Ryzen 5 7535U, Barcelo-R) has an
> internal DMIC connected through the AMD ACP (Audio CoProcessor)
> but is missing from the DMI quirk table, so the acp6x machine
> driver probe returns -ENODEV and no DMIC capture device is created.

This doesn't apply against current code, please check and resend.

--NRP9IY4/xxp4E0pR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmVrqEACgkQJNaLcl1U
h9C6DQf+Ij+Y4pBBN+YRJ7G3Xi4TojNhygzKKK5pBs0Pw8mAxlNM8hHtukBxm0dL
EJ8lnxxz5rO8phXRZPWF8snl/GrOzB9f7TyRmiI5n1rOBg7G7u0D/L/5urZUvYaN
H2Y0kIXpFlviXCfDHYO/qfVQytSZw6fsa5AiF0/LF/KUBBzSrBaeTgztcv6hcjQo
PXtDDXYfdpS45B7fjvzffya3t8qexhEAnOUUq2zAOj/z9vwivaerwye8ONwCoihJ
a+FC04RzAIQV2P83OCzJrPirBQf5w6ZefX4lBoOeeZoQBvROf2zCpXtlsF7ZTpZo
CDOnnj6d7ctwd+RP19+IfyLH2gqOdg==
=B8i+
-----END PGP SIGNATURE-----

--NRP9IY4/xxp4E0pR--
