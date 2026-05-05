Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE032F745E
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 23:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778024096; cv=none; b=JITC1Je24rBRPxlYRtNa8vfj6dWaxPWJ/fvDw87VQIy4GW4tbgrZWG5D05mnq/jYfwLhLwB5Sj1V+EGynzo8hd9tb38KQV4+YDE6L4dHGGgAR8eezuOsLyPjykPm46SnHbcCJVvVL5VI61cBY3uaJTZvFh8/+0HstQY1zHUxvW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778024096; c=relaxed/simple;
	bh=I4clqWJBQF+mPm5vwO8/th2jz5ng2CXGJLyucI+uwZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKRCVpLn7EPDKRCJoV4oGlsYCzdT4raJH+SoND/1zGEaunkYKPP42SyBU/sguhwzsjjQahjLQZrexlHl5LIcK26RIsMVbHafX4nBvASf0nhCmwqjc3Ixr/Immmasc2OgmX7SN6VNWivFkmoGh6dgJGBiJf8l0es9BXMgx9d9HJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ErWZdTUr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErWZdTUr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF4CC2BCB4;
	Tue,  5 May 2026 23:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778024095;
	bh=I4clqWJBQF+mPm5vwO8/th2jz5ng2CXGJLyucI+uwZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ErWZdTUrJWLw5Lxnp5FGpCSIu906rKErvzJtC44YDGtEuoTf1RbSkeKLSZjNq74sR
	 dWRNXIaKQjiXtTuzCcqBV8fAPc8FRza3/1gUWgNQlS5QpxWFb/iv/2mTDloCAhcZqN
	 9MllUYXuHZI9+kc3Xz5U4ez+jP3MSrhQUXL6/ZzdYnCgMg+5fT9Kxtb51zsnM1Ojt+
	 yU5ycAm8rTZZMoOzxNOJqDAjmyKtqL35ZLapRMVqhNbfMzWXQHH1kK72JgwyuKp+jn
	 +/M6JB8gBiXQ/XgSXqnQcIAPfWq6KFlrEcWnZ7a9cU84Irj/D3SGxHw2zqzzg/TX2Y
	 pLtwAHBuae5sw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 7A9D01AC5877; Wed, 06 May 2026 00:34:52 +0100 (BST)
Date: Wed, 6 May 2026 08:34:52 +0900
From: Mark Brown <broonie@kernel.org>
To: Md Shofiqul Islam <shofiqtest@gmail.com>
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: nau8825: Fix typos in comments
Message-ID: <afp-nAp_cRWMWA30@sirena.co.uk>
References: <20260505221958.3751-1-shofiqtest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ybzoMfUxtqtQHpf/"
Content-Disposition: inline
In-Reply-To: <20260505221958.3751-1-shofiqtest@gmail.com>
X-Cookie: Alex Haley was adopted!


--ybzoMfUxtqtQHpf/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 06, 2026 at 01:19:58AM +0300, Md Shofiqul Islam wrote:
> Fix spelling mistakes in comments:
>  - suppresstion -> suppression (twice)
>  - funciton -> function (twice)
>  - imedance -> impedance
>  - tak -> talk
> ---
>  sound/soc/codecs/nau8825.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)


You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--ybzoMfUxtqtQHpf/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn6fpsACgkQJNaLcl1U
h9BmbAf/Zy+rQmpxFW6syldu9hnaMsMf1iE/ygzr16bSqM5Avz+317m+mHfxWwBB
vtoiezXR8pwqJWyEdikuKysX/Cs1xSBwK+FePehoZkiovHTcWL05raYwVoRk/Xt5
rKWoAqnStw+dXvMlggbV77Xu26Mbg7Wr70//QO9Gh6Klm6VHY8uG5NdkThJu3Pg3
WOdbMwVTS0COP+P3cl4GMDEoshYEoGQudoKO6+Y9DLBbZkw4gOuYYOLw3QS1MGNI
9Yq4K/uYc+iZqNPt/fwcusBGTecyQvxqsvZQkbq08YZwVL+W7i31VwNwWtHywK1A
C8vHxrrzlwBwBS8t7a/rEinEE1ywuQ==
=NCV6
-----END PGP SIGNATURE-----

--ybzoMfUxtqtQHpf/--
