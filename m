Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72AD199FAB;
	Thu, 14 May 2026 01:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778722990; cv=none; b=XTJlzs5O7ZSAQogGqFqTFsZOs9ICDd8QD+s4YsTtlRv52d5M2VZQvgEzOk36Jc3ZsRb2tZI7hb0DeW+a7NB6DzqdVq7RY405Kq2D48xC5HfxtWC+r2chWRkZD/KoyAEOvPTYEKslZjzwJ3AGL+wIBaBZphxEULe1820cjwZikuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778722990; c=relaxed/simple;
	bh=tbkXta1J5LNJvxTrrlmNwwq7gpShrZauM2s4gHK3eLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/GmE9f4fbnrHcQ6WzF4H6DDSg8c0obB+6ZIRmKYE6mClOA7dgKrURqGU6WX6NV/pKU/mQbCQIPtJvxIg7vstXdxOImvPXL4YlFV42Y6Px8ENQexIsjI7xNX26K+u1JwPA3uuTMnorr6BFc2zayV08DHs7mICoJNfw3rcaSafiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORvpY4l/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORvpY4l/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D076C2BCB3;
	Thu, 14 May 2026 01:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778722989;
	bh=tbkXta1J5LNJvxTrrlmNwwq7gpShrZauM2s4gHK3eLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ORvpY4l/C/qJPqdDWmMhmc8C/OWnNAP94onagxwPafYldCxx+iFTFTIholIoUG+lE
	 luUEZZU2gVZ7cRBXzK4q1qiiUyly8m+3BX5u5nzxk7wDUAYcynb2Tq2HbP2PXujJ11
	 nfMVuuoqDFgwAdJU+PEOv0bgEXaipvIPfTVXbTWva5CgeIV5jWU5NjQyH6xGj7+tyo
	 C14lYxWuALKG6xBTAqNM6rK8AhDY14pUsBqBq48+SLMN2K/GpevkXCrbVJmf5iBf7p
	 lkNrc7wiEKdpxOCpMdEkTtE7zYdLfx8hXf30kVXWIqc5oGe5Ol+e9eB/lNnr7Q1UXC
	 QS9iLmdK96aqQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 71AE21AC58CE; Thu, 14 May 2026 02:43:07 +0100 (BST)
Date: Thu, 14 May 2026 10:43:07 +0900
From: Mark Brown <broonie@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, David Lin <CTLIN0@nuvoton.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: nau8822: add support for supply
 regulators
Message-ID: <agUoq2N_nE_Sz0Z_@sirena.co.uk>
References: <20260513-nau8822-reg-v1-0-c532e18e92ad@flipper.net>
 <20260513-nau8822-reg-v1-2-c532e18e92ad@flipper.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vrCjTCIVc9SgWozE"
Content-Disposition: inline
In-Reply-To: <20260513-nau8822-reg-v1-2-c532e18e92ad@flipper.net>
X-Cookie: Truckers welcome.


--vrCjTCIVc9SgWozE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 13, 2026 at 05:39:11PM +0400, Alexey Charkov wrote:

> +	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
> +		ret = devm_regulator_get_enable_optional(dev, regulators[i]);
> +		if (ret && ret != -ENODEV)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to get regulator %s\n",
> +					     regulators[i]);
> +	}

As ever unless the device can work with the supply being physically
absent regulators should never be optional.

--vrCjTCIVc9SgWozE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoFKKoACgkQJNaLcl1U
h9C9xgf9H5yCbmydtPVGo0h9e89LMXgDhDt7W4T78pU//PRAJqKaipbMDVWjTGaF
dOft2LaFkRbmI4+j7wNwF+AOHlaRd6qT8+sXheaWpNGBBU2G8ypW1h0nOi8AXL49
3r0ggZvZCnR4aSnSodqv/JIm67FWuOdCajXg1lDb1uD2XJtM6Z8GljoF7R8FNyqf
oEBsuX9ekGUH1uPwykD6mgASyncbkoRZVTg3a/+q5a1iPx9qMWoTA4WqsfpuXWrL
F9eDMPC2oyLhrFwDE27Ss7VUfvX56qHZ6q2B4BUYHW6vfOTr0g3k9DKAJtQqyWsZ
tj7IZxl7qM4PP9XOeLqn4+f1gC7lMA==
=uaFC
-----END PGP SIGNATURE-----

--vrCjTCIVc9SgWozE--
