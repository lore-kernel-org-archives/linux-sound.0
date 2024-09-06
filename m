Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594911CB146
	for <linux-sound@vger.kernel.org>; Fri,  6 Sep 2024 12:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725627338; cv=none; b=p+DfRPWRP2Z1a7TtP9Qygwv34aqHx1zkWJ0cVJ0g713EFDyRmJlAjCsbK/carvYa5D6FqAVei8rlMWbM79T46w8/c4OefN6331oO60Ru8i7SvAUx4d2MAt0ZPRq5MFDcKAfzDt8G+XtQfOPQ6Iy2rI6RWTSJZV1PZ+lSqGzhJs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725627338; c=relaxed/simple;
	bh=rR1RTHP7pHhDvwJ63j4cufAGhg/DSavxqbtggcv3VsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYkTN2j7E1KOxsZ/udzbOIXGw7nCz99dy/K6lNvmNlOssroWMmq/7gDC+hAo34GMh5OsxEw4NTYf9sXQ5rF9IHfyfTqaD1hhIL8dbzjmGF9lNC9aUkBpIrbJv+6BFPSaSoAomu7g7blNtVmHXEGRbade3hRvYeoDPZL19BuPfvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZLQ6EHl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZLQ6EHl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42375C4CEC7;
	Fri,  6 Sep 2024 12:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725627337;
	bh=rR1RTHP7pHhDvwJ63j4cufAGhg/DSavxqbtggcv3VsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZLQ6EHlX303v7cR3MWqxnAAQikdvvTvz9u7kgL/Z0JXNNZgWloaJg0uppLD29N5x
	 1lU+1PW1fxVN+PNJf3aHigeJZ2O3L6j+pJg2CxCeP4yqxbUzytP7GCUHk5dtW+IKrJ
	 psBFPcToSQlJJKFd4pbyqdxC0Ta2m2fZL1KnFx7Jlw35Bk2TrG2jrMdjKUQBra1ygU
	 5/gMjbwu60phyXnu57GjSXMuoLPMwgqZshbbNvWmZ9BvqkBtZPO4NPXDCvG62o4CoH
	 tl6/mWGQQTD8KAe3lk2bh2hO6GW57IXdvaUnJ3+5wiJF4FQ8P1s3Q/y/zVTZzNVddp
	 Ma2NBZj4wGh1w==
Date: Fri, 6 Sep 2024 13:55:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: peter.ujfalusi@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH -next 0/5] sound/soc: fix some macro definitions and
 usages
Message-ID: <Ztr7wqQ9CNn1LC2d@finisterre.sirena.org.uk>
References: <20240821070815.2326534-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vOZFg3hwCRKMq5fg"
Content-Disposition: inline
In-Reply-To: <20240821070815.2326534-1-lihongbo22@huawei.com>
X-Cookie: Your love life will be... interesting.


--vOZFg3hwCRKMq5fg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 21, 2024 at 03:08:10PM +0800, Hongbo Li wrote:

> Hongbo Li (5):
>   sound/soc: fix macro definition on TWL4030_OUTPUT_PGA
>   sound/soc remove unused substream in macro soc_component_mark_pop
>   sound/soc remove unused substream in macro soc_dai_mark_pop
>   sound/soc remove unused substream in macro soc_link_mark_pop
>   sound/soc: fix macro definition on STM_SAI_HAS_EXT_SYNC

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--vOZFg3hwCRKMq5fg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmba+8IACgkQJNaLcl1U
h9Caiwf/VZjm90+G/a7oA3oyFPBOIQYUcXiuWuEds+rCiArSefxoOrSYwCdC87H7
/Xx2zl2mgXmzff7b9CCmFwbsoFUmXiUFbpPzjvWJRtyqraoXfBWCtBJqYMcu6T0q
atw1IzrnptV8CFQRcAd3OVp0hPKMYaNWFFUoIKpfwi/7jbrh22IuaJcv+LFWO/kJ
lWn79ab1/hFd0ZCui2ZOC43/70Se0eUKCG+EQQ0eowLaLpmi883R8uxmwTTPaNC9
DzPVLTUyIsMa9apcHMCQIgpJWSDT3/3S34lIOjaGCEsIMk06r/EkNf8BA5mZZsHZ
Y2uWIq/H2ofwidaAXkI5fRfU1qXA8A==
=N1UN
-----END PGP SIGNATURE-----

--vOZFg3hwCRKMq5fg--
