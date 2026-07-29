Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AE032E141;
	Wed, 29 Jul 2026 15:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338188; cv=none; b=JxsE2vYa5kMpqbR1NnjdOVpllsaG5okRVHtvOlpYqa+uhHFCEMScyjv8328e92KpNxIDHXp2j3vWSsfG0RqSSNyH1TQSoUx3azaCeLKvTU6WNwYfXMweiMejHs7pANjo6inBOlIiD7lSPkrV5N4hdI/Z2inhhaSw5kvoJ7Xp0Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338188; c=relaxed/simple;
	bh=NVqzGzmGmCUDTJHN7jcuNK0ECTNPe1G1FPpBY2/IwF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJYS68jawt4fRYPPLqW5Rf+FkJP8pMvL70ja+jeRYq6Yi4ZkKPPbSf1sXWKfQ/DhXERaf69B8N9ZzDf5bOFB0SDEzDLfI2JhqthQxh+g8qFuQ4b9FFmzaPTd2gjmNXm1wu9iIW2He0ILaobXl1UYMLiRjELw6BuOr7BJGBl3oVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gk7JWc5F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gk7JWc5F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640C11F000E9;
	Wed, 29 Jul 2026 15:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785338186;
	bh=incL/I4BrkXqsxP5DOXxPiMFd5yjeXLE6E6CNQG60v8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gk7JWc5Fy6J008FZPqY1jodwjlZZPBXoBKr/2QL9ODrar/0jGx84LB1gWNh69DOKX
	 XiMHlv9/lj7lG0M+HrblUlvLmPV1rZumQeVGSfhW+p/PDJC7C1vIPbOAuxSVAS1Mf8
	 fyI7CQfZxh5Mut/xZLywIMMyyRaHnZpBJaLSh9+ctJ/mASa/OwEbktyjEga40d1JkI
	 ZOYZzuEPgD/nN6HLwsB/lOdMQsCw2Vz0fXgvrgeN3KqL37djmoIzli0pv+t4tDxiHP
	 QYmORAElvWWoG8x+C1aRHkTrpGWRF5RZ6kvpBRB+r40Z3HWPlozC05UjEgk9KF1tPF
	 35GS/aC9W8o+w==
Date: Wed, 29 Jul 2026 16:16:22 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-generic-dmaengine: report DMA channel request
 failures more clearly
Message-ID: <7a49d38f-4e71-48c5-bc15-6d449cfa4c7c@sirena.org.uk>
References: <20260716080428.57979-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dvyn6X8w2tpUbzwG"
Content-Disposition: inline
In-Reply-To: <20260716080428.57979-1-phucduc.bui@gmail.com>
X-Cookie: There's no future in time travel.


--Dvyn6X8w2tpUbzwG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2026 at 03:04:28PM +0700, phucduc.bui@gmail.com wrote:

> +			if (device_property_match_string(dev, "dma-names", name) >= 0)
> +				dev_warn(dev, "dma-names has '%s' but request failed (%ld)\n",
> +					 name, PTR_ERR(chan));
> +

This is going to generate warnings for unidirectional PCMs, if we don't
pass a name for a direction then a default will be provided and we'll
try to look it up even if it shouldn't exist.

--Dvyn6X8w2tpUbzwG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpqGUYACgkQJNaLcl1U
h9B1Hgf/bWXfVKSaE5JBoA3j+PG64cTla3/nYrx8RrjUC/e6gRUFm4d8KTu59+ma
MxCbJ7G6eApFECriuYrXl5gJzVANYYCOEDENkvhrwDa6OXd8gW116AZwPwUUjhau
K8v2iS6HVK2Y/UAbRiJsoy/EILKYuX4kovkHhyrJQN0BTSnoFbZa9kLI7N+Ec53+
pQok6L4TlalPYWzyw6zlSQca98TD6YmHdWJHv9SF8O6ZDqCod8lTadiq/Pk8D8z9
4U8AGCJgprx5FYkblNxRFszN3//O9wzYZkYXsQOwLG8XnF9CiUut6xLyegZi2MRG
UqzdcsWYBvjqDQ0BgWMBjQc0A1uelg==
=Mp9g
-----END PGP SIGNATURE-----

--Dvyn6X8w2tpUbzwG--
