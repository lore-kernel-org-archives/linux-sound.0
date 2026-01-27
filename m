Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7925185E4A;
	Tue, 27 Jan 2026 12:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769518198; cv=none; b=SZB6Sji1L11PDYLv1uf5zfmPQHyiro8Hz9NF8/jjks4FBrPD9JE6Ig9BnNl0P4AEm+BNxcOcz574axwKYGgNd01xjW6AtgIq6DyPbd0hUU0f382AhG+Ilo++yzfLO3UrnzGWgmRrORv9ivMfhE37eWt3bca+s6oBVV0nd5PdfWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769518198; c=relaxed/simple;
	bh=KYms8UhlZqE4igiABRj1LzqgOIs+iJRMeClJApK6cbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RN13FvO5MtpR33C9Um61WWMZ24njiYGFWvSYOmbebfwIVaxO0z61GCweekF/8VKgLPMLjkw90NTIxkGAo0NCxOfxXuCSKV1KQn0Bxe/WoaIu5NRIXDg124e09xIDOwBsouQbKQbhA+nuvMhFWcOXE6XRd6bJkwAq8Nl/dvJH2KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uaNYvjUx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uaNYvjUx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E99C116C6;
	Tue, 27 Jan 2026 12:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769518198;
	bh=KYms8UhlZqE4igiABRj1LzqgOIs+iJRMeClJApK6cbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uaNYvjUxY0GIM4J6cCobQ23NebB7GjsM2DZfK6UILpYCSRtdQ1W8+iVvZACzt1Dhh
	 q3LFOHORgflGCdpvnxA9vWUHRxLFp3T1cmpz+iPnNnDW4EXZWjgqKVV4MY+oQP5D2T
	 vO58w5ZiPuVfGZ3MftsqHj/ud7fALXaNx3LVnMx4dHa2a3HSGZgSGDeFvrb3AmxnJX
	 gHBIFh0EFBFi1lCR/R3siM+huMpBhChoodmHn+Hpt1viDnik0ig2E4cFOckxsbSPBF
	 Rn3Y27pM6p0L1o1VHlu+FZMifmTtMX/0Owbk8X4xqVn971LrHdIjUoU7SaIoCnx0M7
	 HHX+4l1rl7CuQ==
Date: Tue, 27 Jan 2026 12:49:52 +0000
From: Mark Brown <broonie@kernel.org>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 5/6] ASoC: sophgo: add CV1800B internal DAC codec
 driver
Message-ID: <88ef974b-9fa8-490e-ba19-1fb31ca94342@sirena.org.uk>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-5-6ef787dc6426@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6aHygTPjbSMl5gIi"
Content-Disposition: inline
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-5-6ef787dc6426@gmail.com>
X-Cookie: I brake for chezlogs!


--6aHygTPjbSMl5gIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 20, 2026 at 11:06:07PM +0400, Anton D. Stavinskii wrote:

>  	help
>  	  This driver provides an ASoC codec DAI for capture and basic
>  	  control of the RXADC registers.
> -
>  	  Say Y or M to build support for the Sophgo CV1800B
>  	  internal analog ADC codec block (RXADC).
>  	  The module will be called cv1800b-sound-adc

Extra change here.

> +static int cv1800b_dac_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params,
> +				 struct snd_soc_dai *dai)
> +{
> +	struct cv1800b_priv *priv = snd_soc_dai_get_drvdata(dai);
> +	int ret;
> +	unsigned int rate = params_rate(params);

> +	cv1800b_dac_mute(priv, false);
> +	/* minimal decimation for 48kHz is 64*/

Nothing ever mutes the DAC so this is a bit redundant.  The mute should
probably be a mute_stream() operation.

--6aHygTPjbSMl5gIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml4tG8ACgkQJNaLcl1U
h9BHkQf+Kuc6BJjZWeAWQyoncG7fDBwM+k/TqBukcTrPjZHiGZ22yCkrEVWU06Lc
qWWOu9GIJM4QfBsRLYI9IEvy0L4b3RZK72dHfIsK0YEOUydC1oKWRYsm4qUqHnou
vXTYz6nDIuMxvIAlODl9SiLHxT4/BNRKMWdPl/RCV86jUbF7mBqyRpDx41tTTuen
lzSUWIvK8ZhTmCfkB6mdBapl4oxYANInUjMxq/28hOUOJ3xXIiPLTn/UHFLVYmdX
ORMrhBMCWuVIiagUgK8RwF0Uc9Fd1zPgfA5QjanVdstgKYDe1IhODVJNT5n+E2bE
8un1mgrWVdoXPo3r8LiZ9rth+YqXqw==
=0mgc
-----END PGP SIGNATURE-----

--6aHygTPjbSMl5gIi--
