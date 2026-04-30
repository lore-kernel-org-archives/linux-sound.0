Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A813D7D97;
	Thu, 30 Apr 2026 12:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550508; cv=none; b=dSoYXwCObxZqoor22C0fva3lQP60LS7q77untJeEt/g+2pjN5d0BSfNvVyDedEP/wj4wQyvUCpyyuxY1yH/wGqfxLdTeTdLd7fwrTuI3maPEl1CSj/R0GqDNCxPql+edXkdJ57Wjar142fssT1fOTsEPiIu4r0lSM4msVfUgvHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550508; c=relaxed/simple;
	bh=IV9g4ZwLr8OltYknyWwgkPlaopAbf6RRhghSyRxuMCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQWre0zGXfsv8J21KG2Lj3MKCG+DL1YJoi0dhsrVfZhQ1gKl8WYioJW3Craqed9PFoimckr5i9Yyfrl0bAlarWHCGe4OG+JAkdnFrbRIfCvapPb+tq5jIBqB6YVGIwdDKjTwTFwgCLFoULI/61sMo0YI12bV7nyQ2ZtZn/lldf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DTuYeXm9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DTuYeXm9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4655C2BCB3;
	Thu, 30 Apr 2026 12:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777550507;
	bh=IV9g4ZwLr8OltYknyWwgkPlaopAbf6RRhghSyRxuMCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DTuYeXm90pxGoSPdy11TaSBmPtCNCrpn0GmIRa7B2iarUav50vZpOV3d1f4p/0jtZ
	 1eNw8iQkL+7BxQoxqq9mPbTaUDUj2i+yf977LTxpeHsfYK3hmR29I5h6N8K7Nr6X7i
	 zCnrQbmQIrY77O/KygGZQm4cq8+IdIK+Ri/4mJzYAr6Mm09o8Xg59KBj7PjKNTIXq1
	 N4v6ZRrCX9QSF/Teth8lGJ/Bq0rFXjOiocKZ2sCkJrdmR1tZyc7ycKVyF23U6KNNCB
	 xl0DmnyFB8fFTbwulIKaDFtxX3iUQBmdnicmk8h/s31RqppPP7dqvd4Fk586CEz+ei
	 93I10KpjnYEGQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 37F7A1AC585F; Thu, 30 Apr 2026 13:01:45 +0100 (BST)
Date: Thu, 30 Apr 2026 21:01:45 +0900
From: Mark Brown <broonie@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	jinmei.wei@spacemit.com
Subject: Re: [PATCH 1/3] ASoC: soc-dai: add shared BCLK clock for cross-DAI
 rate constraints
Message-ID: <afNEqXIKRgzRJt7W@sirena.co.uk>
References: <20260430-i2s-same-blk-v1-0-3a1f04eb6159@linux.spacemit.com>
 <20260430-i2s-same-blk-v1-1-3a1f04eb6159@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LP/4rLfr3gGl1SWy"
Content-Disposition: inline
In-Reply-To: <20260430-i2s-same-blk-v1-1-3a1f04eb6159@linux.spacemit.com>
X-Cookie: 667:


--LP/4rLfr3gGl1SWy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 03:46:01PM +0800, Troy Mitchell wrote:

> @@ -116,10 +116,27 @@ int snd_soc_dai_set_bclk_ratio(struct snd_soc_dai *=
dai, unsigned int ratio)
>  	    dai->driver->ops->set_bclk_ratio)
>  		ret =3D dai->driver->ops->set_bclk_ratio(dai, ratio);
> =20
> +	dai->bclk_ratio =3D ratio;
> +
>  	return soc_dai_ret(dai, ret);
>  }

This needs an error check, if the op fails we'll write the error code as
the BCLK ratio.

--LP/4rLfr3gGl1SWy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnzRKUACgkQJNaLcl1U
h9C0LQf9Gg/ej8yDL7e3JCskfpRbEHWZL+hrdT18BF9bPjEfAkm5JjUJTKlgCGZL
9/ywXiuHg26nQyYeEy5qUpvO7xi07TuDtXDib+9PODa16OyBYmMD3va5AFRarP81
WnXpOyX98PUc9SdnI5vz2KSoiEW9gp6LXlmFP7tsWAb5eHrBMWLaCrNuKRxsXcvA
9RZ3pRspDYSRntaRUrFEO7GvrZidKdEAW2j6h+mNgYuBeT/6Grj6W6GO/qnm3f/6
DKTC8flBURawpkqtktGfsCk5qi7uZDt37NwhPVIavmH/suCRB67p8xqg7XVi2TyD
r35ssypOquxGkK1aOWdW/xUDZZ2mvw==
=5Vap
-----END PGP SIGNATURE-----

--LP/4rLfr3gGl1SWy--
