Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3F13B2FF0;
	Fri, 13 Mar 2026 15:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773415694; cv=none; b=C6PjLKnWXlg5sHPVRbvmgfqtfS3yd26LfubS5MhT64vjNJrNPVPMY4Wh0SPFoFtIYMpWo2O4qDYMtOGANuiBD5yukO/AMjIbCmn2gctsiggABE3H6Iv3MCA2iHG43SDxRsF8RUOOMtTJ2ampjKqqR16VUbF4Z38ICwYIMUTvuj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773415694; c=relaxed/simple;
	bh=rFILzoKWoElpGGk2c197ay7sEBZ/W9N1UvImsLmTNfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0bf3BT0vES8lSIMS2vD9OcK87eCHwm95oW3+/Rnp9lpHZB5esyo8A+bWqN9EhuNfSnuO/HYTnbAPUUX4FUuP42IVjbQeeelD+ZBp3bde1q11yFqBrUjQOb887BSGtcNBeEVcqu8AroqMCgiBsRbarql0X7u+0d3JZw2C6Rxc9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AF8C19425;
	Fri, 13 Mar 2026 15:28:10 +0000 (UTC)
Date: Fri, 13 Mar 2026 15:28:07 +0000
From: Mark Brown <broonie@debian.org>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Drake <drake@endlessm.com>,
	Katsuhiro Suzuki <katsuhiro@katsuster.net>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Roger Shimizu <rosh@debian.org>
Subject: Re: [PATCH 2/6] ASoC: es8316: Get sysclk rate from MCLK clock when
 not explicitly set
Message-ID: <11e84371-57b2-4ea3-b3a4-0119d182229a@sirena.org.uk>
References: <20260305-rubikpi-next-20260304-v1-0-327595a4528a@thundersoft.com>
 <20260305-rubikpi-next-20260304-v1-2-327595a4528a@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x/ZTG4VBz00XuE8/"
Content-Disposition: inline
In-Reply-To: <20260305-rubikpi-next-20260304-v1-2-327595a4528a@thundersoft.com>
X-Cookie: List at least two alternate dates.


--x/ZTG4VBz00XuE8/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 05, 2026 at 01:47:43PM +0800, Hongyang Zhao wrote:

> @@ -477,9 +477,20 @@ static int es8316_pcm_hw_params(struct snd_pcm_subst=
ream *substream,
>  	u8 bclk_divider;
>  	u16 lrck_divider;
>  	int i;
> -	unsigned int clk =3D es8316->sysclk / 2;
> +	unsigned int clk;
>  	bool clk_valid =3D false;
> =20
> +	if (es8316->sysclk =3D=3D 0 && es8316->mclk) {
> +		/* If the sysclk has not been set, try to get it from the MCLK */
> +		es8316->sysclk =3D clk_get_rate(es8316->mclk);
> +		if (es8316->sysclk =3D=3D 0) {
> +			dev_err(component->dev, "unable to get mclk rate\n");
> +			return -EINVAL;
> +		}

It would be better to do this by bootstrapping es8316->sysclk when we
get the clock, we do a clk_set_rate() when we set the sysclk so the two
should be in sync for robust operation.

--x/ZTG4VBz00XuE8/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0LQYACgkQJNaLcl1U
h9CWjAf+OtH27tXp5eIwCodjCU4XIqPbJzni3xWmEnAXzV4eBqZchkUZXUH7FSu6
NRoR0LfRJ0/+6sqMie28+KN9L1EacEh3juFfvRVAHwkug35gDBN1UJ64XeHzU/kt
fzVeicGnjNr6zwtPRTnJ99jJFGCyqHZTEcUnw62ndrZtIhx2PQwPxjXHAjqjbBpT
zTZVhVYHEPrafWlDPwmX0ao29xiSkQC7FyLztydazkI5+8WZTTo/fZi3Bb/sb296
aDvx8M8/YE2DDoRccWQ50QkeYz4gxm+en9VEsw/fe+DLqStuFrDyDcYHNh3aurIt
zGFxGd4czN2xbqlI0oVXY3/v+qrFSw==
=RVOM
-----END PGP SIGNATURE-----

--x/ZTG4VBz00XuE8/--
