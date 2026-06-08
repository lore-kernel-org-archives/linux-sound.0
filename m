Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB6E348866;
	Mon,  8 Jun 2026 12:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920122; cv=none; b=rxZOEivm4smmzJte8gXpeyWUM7ju4Ijj2EUuMnthijsKazAKIDFPC1az4OrEYFESPOSpft5cOVJbdJ3uOSsiUw5yM8SG7Nh2zEiQDuI45Uo5x16Q5pW4Y5179MX9GZRihmLIsBYJzMJM1kMDi6Iy9VkpB2BaSqDamV4wmxxjE8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920122; c=relaxed/simple;
	bh=jNt2FX7Uh7Zxmcau41tMiH3pglesGCrWudhzVbCsnco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euqS1kQ/oF0C7JwL2omsy2EjtMU3Dxg8dZ8szXPiNt9ZS3OlA0dJBtHH/Z98qJ9zcXpcGNlxou5nNy9teiR7eQAaOIvk5/UrZ4nBFCIreynIlfuJ61mSWDlaeKyo2svtD0Urj8u6VvsmSVhySS/DZcvVwJe395YTRwimN1xs2c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pn7yfErO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pn7yfErO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D791F00893;
	Mon,  8 Jun 2026 12:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780920121;
	bh=A+y+vRJyoOlaB751MA+9AXvBoLKprOzhfwW0uwy6fzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pn7yfErOI4mLQT3KPtv3iRIVHfkSpdsloWDPrxGCSIhUaliRTvzZmnR9v7JbXnh2/
	 2MpkrPBa7bj2DoUCBBEIghs+eZ+Lb9yXf06OOF835XTw5bNk5ty+awOMS5I5CNMgpE
	 JZaO7lFD79gNpoQ7AdTBVPGuRkDOwxYFJaF/SDVVj9q+2CuD1Cb04DScJRT/yAYOXf
	 eTqx47miNx10mmdWnt+GuhR2bYd9gCEnnwTvhPAsDZGWTp8rR6mQ6oDxQFFW1GBdUz
	 yWgskBHBvbmGrubTZyscpxNRTL0aWiXdWVg/B6fGfSKZPWMDN1mFepHxYUMAweBDYy
	 hbrsYpJzoQwZA==
Date: Mon, 8 Jun 2026 13:01:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock
 control
Message-ID: <e6567656-8745-4f07-9636-7779d32ccbcf@sirena.org.uk>
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608023011.942228-3-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RGMv96CRn1GDbQG5"
Content-Disposition: inline
In-Reply-To: <20260608023011.942228-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Cookie: We've upped our standards, so up yours!


--RGMv96CRn1GDbQG5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 08, 2026 at 08:00:10AM +0530, Mohammad Rafi Shaik wrote:
> Add support for MI2S clock control within q6apm-lpass DAIs, including
> handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.

> +static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int freq, int dir)
> +{
> +	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
> +	struct clk *sysclk;
> +	bool *enabled;

Neither sysclk nor enabled are initialised by default...

> +	switch (clk_id) {

> +	case LPAIF_MI2S_ECLK:
> +		sysclk = dai_data->priv[dai->id].eclk;
> +		enabled = &dai_data->priv[dai->id].eclk_enabled;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (sysclk) {

...but we just fall through the switch statement if the clock ID is
invalid and use the values.

> +	for_each_child_of_node(dev->of_node, node) {

> +			if (IS_ERR(priv->mclk)) {
> +				if (PTR_ERR(priv->mclk) == -EPROBE_DEFER)
> +					return dev_err_probe(dev, PTR_ERR(priv->mclk),
> +							     "unable to get mi2s mclk\n");
> +				priv->mclk = NULL;
> +			}

Do we need to drop any OF references on early return?

--RGMv96CRn1GDbQG5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmomrzMACgkQJNaLcl1U
h9B9JAf/WD4fg8jkd9mkfIQZJXqF5NmA+0g3Pdv7I83ChxGuAqtbgPirRB7MVuo7
RPfEdJM//8O/VwKIMInOoQnwli9dTlOqO2xLgZ6v2BiJN3OmuS8b0itC8rgiIgmW
L4aDaAHdRWjGhG2nTts+MLLoo70UVQFiBEIR0Faj0SL0llONCANfU9u1Dl4sQlcQ
KzhlYv4jrURu/uZbIj6oSmaWbW2+YD7tqC/vrOTUd2kKk+IbmquHCx8o1Cpi1HJc
yphCr4GjwOr+dBJ9eVGIt9po8X2A3HK//lKjK8ikzaaYjWn4/6wuesB+nbMHDCaV
z3vX9BX25mewM0kuSzu8r21XwnvdNQ==
=qd/q
-----END PGP SIGNATURE-----

--RGMv96CRn1GDbQG5--
