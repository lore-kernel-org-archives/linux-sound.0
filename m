Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B5210E3
	for <linux-sound@vger.kernel.org>; Fri, 19 Apr 2024 01:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713489921; cv=none; b=AX8miF0rlINO1F4gMEaq8hVUD8cdYhmADMTumcCMjn3WdLw3gXTneEBB/cJSDP8Cx3EXnJnm8rg+TmgGzxGE3GfmQu9ELfIkPRTQW/HmfOZ8lMCHIiWri6mic2P3Wi+LWiDRaO4JvUK2FO4qFmjyvZ77mrT0GK30lFhuWsrZ3FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713489921; c=relaxed/simple;
	bh=KGbKhUOEPigGgq2Jl8R0BeO4mee9gHipm6cfp8UjpCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQzqP2OcWHmhJq+wbCYEBHN9DwHAIAdPKirpL7qwaczysHnH5iUC+lo/abX26lld76nJzhcIG2dfCj+resDRqBDoLGwkJLU/asC5+0Ytuc6wOoKT+f86RVIR1MjDzyZZVnHhMNR5eZNOBj88t0SMRA7Ts5Rglc9N3AclqCmx/W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7hTFuXW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7hTFuXW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D78C113CC;
	Fri, 19 Apr 2024 01:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713489920;
	bh=KGbKhUOEPigGgq2Jl8R0BeO4mee9gHipm6cfp8UjpCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U7hTFuXWS1rN4vRFGlZpm+5AcFc1ufUbobeGwi6IyoKnBzO1HQ8sc2yHfE5zY05N9
	 S997pklLR0BUTD0HpPceeLvU8w9eidARmOkYShmhZAB0T9WJnLCj4FGsJfmqacqTfP
	 BULyw+QCZfrr7OntnEyLb5Eis1eocVFSv5nWAF7FztMgqAabIClfSJx9bdGJeR5sql
	 9i8Ie+ZzcKBmbmhh+eIcIZQg5lqlo3HlSrD5K/g+nnCt6TmQLPsxINBcVrNiYDMQ4R
	 n52rLEpof1dysIbbHkpzte+Sf2kKESqkJGdgi6lu46Bt4nOCdP7MxMh/00B4qaNSAz
	 ESCIJwrwgQP0Q==
Date: Fri, 19 Apr 2024 10:25:17 +0900
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	linux-sound@vger.kernel.org
Subject: Re: Question: layout of a patchset dependent on another tree
Message-ID: <ZiHH_ZG3YebvefRj@finisterre.sirena.org.uk>
References: <2d1980e9-f5b2-4c9e-9348-af69166d0882@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Li+p0Qq5xCtvKgsP"
Content-Disposition: inline
In-Reply-To: <2d1980e9-f5b2-4c9e-9348-af69166d0882@intel.com>
X-Cookie: TANSTAAFL


--Li+p0Qq5xCtvKgsP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 18, 2024 at 01:43:25PM +0200, Cezary Rojewski wrote:

> I'd like to send changes which do modify the avs-driver but are dependent on
> ACPI/NHLT changes I've recently upstream [1] to Rafael's linux-acpi tree.
> Thanks to Rafael, there's an immutable branch [2] that has all relevant
> commits on the top.

> Should I send both the NHLT+avs changes and have broonie/for-next as a base
> for that or provide only the avs changes and state the dependency within the
> cover-letter? The latter will fail to compile without its dependency
> obviously.

I'd send based on the immutable branch so long as that will merge into
my tree easily enough (doesn't have to be perfect).  If it needs the
immutable branch merging into the ASoC tree first then I'd send based on
that merge with a note in the cover letter explaining this.

--Li+p0Qq5xCtvKgsP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYhx/0ACgkQJNaLcl1U
h9CQ1Qf/R4/qXGOmW5XJw5wzcAFG9D51e/SNzL1ah9HEm0NexPfBt/omw5PzS/aZ
abg8j9ZvPYpSxxhM/nGaJ0Qf5NzybfB1ebUkPIAVI/sXXyWJRqUIK3kLqQsyUQOx
K6PWoezrCP6yWrKU3zEjApLMud+fgThArQnz5n0pfJd4eyu5gyojIaeg7NiurtDV
IXchjctOsrWVAMzcoxh5NGjcfCMJQnsID6006jDazXp/aIiKevfUdtV45Yv1UTzr
YhkLZi+G9kmfRBJ+xCP5mT1fjQNpeQuargnhPJu0x9U+zb1XKHApKstYRoYhbzyc
FygHl6AsO8ynHIhMsMgRsDjRH0zPBw==
=8PLJ
-----END PGP SIGNATURE-----

--Li+p0Qq5xCtvKgsP--
