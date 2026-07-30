Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97862853FD
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 17:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785432371; cv=none; b=ES0+pvf4lEM0BVujNN4i2EuOnHj5depfhOKtYwsq3NZdc1jWZ7b18zFseHXzVEG5j30qq5kzpSRparhsGgv3uYLn9iwAZT7R9bG4p2hZSroO3LZTQ77lBfF4dj3WNsF+PZFmB3MODu5aGZ9sKwstk+FcUpJjvav3QOqdOVZy0Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785432371; c=relaxed/simple;
	bh=sfUljYottyPt2lt/p3qpzkcym/zJOzEd2U/RSLQrrqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOmcRClycNj+ao3J1dCLC9FevXfs0+sl9/cFaDINV8Gc+mzOpkLG52DN3EYv1F1HIVY6OujNB5P/KJVTfCUyj0tkNYOyjBa/2UG9mUl7PewcgYcfPqauq7n3GahsmyslYFYf54A2TL7wzr6vQFrVCnb5DlvsD4WBLfj+C+SfQm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C40VfV9M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C40VfV9M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CBF21F00A3A;
	Thu, 30 Jul 2026 17:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785432370;
	bh=n47K4ulJiSdkhAXmJb6QoyUW9kd6cd/4S1GZRD1WFF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C40VfV9MRc89UEtioxTlFRjXe6OSmAnRpmJL/ALMWuzOxkFAFh2VCqMHRMntzvBEX
	 9mZlnjgZIqrtyEo5EJz9MkWOo9gTZIhvwTc91NlhCW3LudL8Gg/o6Ut5nnp2iQuJas
	 MubJGIJpwuz6M74m8EEKPWbBIMWZbjgvq2K764uKh9lPYRHdO0zWEVKRN9vOcmTPc6
	 w1HSfA2O2uDQzbbeXNXQdNYG71kj7lepV0Orm2qpQO6ZlxRbnqmEdAzMv5PpqMJpox
	 gAXkE4+/ZVWjAdqr1tQIpbWLxTvj6+e4QA2b7dAaBRMlvAk6WSJTzZ4ueiq7VDRNXH
	 NYA81uBJcVlWw==
Date: Thu, 30 Jul 2026 18:26:06 +0100
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, lars@metafoo.de,
	flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com
Subject: Re: [PATCH v2 3/3] ASoC: rt766: add RT766/RT767 SDCA driver
Message-ID: <40a15f17-4e3c-4304-8b68-8ccb8ef7ca4f@sirena.org.uk>
References: <20260729032246.3750820-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2rKYeeGVPSpO1S0r"
Content-Disposition: inline
In-Reply-To: <20260729032246.3750820-1-shumingf@realtek.com>
X-Cookie: In specially marked packages only.


--2rKYeeGVPSpO1S0r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 11:22:46AM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
>=20
> This patch adds the initial SDCA multi-function codec driver for the RT76=
6 and RT767.

> +config SND_SOC_RT766_SDCA_SDW
> +	tristate "Realtek RT766 SDCA Codec - SDW"
> +	depends on SOUNDWIRE
> +	depends on SND_SOC_SDCA
> +	select REGMAP_SOUNDWIRE
> +	select REGMAP_SOUNDWIRE_MBQ
> +

Does this need SND_SOC_SDCA_IRQ and SND_SOC_SDCA_HID?

> +static int rt766_sdca_mbq_size(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case RT766_VOLUME_REG(UAJ, USER_FU41, 1):
> +	case RT766_VOLUME_REG(UAJ, USER_FU41, 2):
> +	case RT766_VOLUME_REG(UAJ, USER_FU36, 1):
> +	case RT766_VOLUME_REG(UAJ, USER_FU36, 2):
> +	case RT766_VOLUME_REG(MIC, USER_FU113, 1):
> +	case RT766_VOLUME_REG(MIC, USER_FU113, 2):
> +	case RT766_VOLUME_REG(MIC, USER_FU113, 3):
> +	case RT766_VOLUME_REG(MIC, USER_FU113, 4):
> +	case RT766_VOLUME_REG(AMP, USER_FU21, 1):
> +	case RT766_VOLUME_REG(AMP, USER_FU21, 2):
> +		return 2;

Are the FU33 gain registers also 2 bytes?

> +static void rt766_sdca_sdw_remove(struct sdw_slave *slave)
> +{
> +	struct rt766_sdca_priv *rt766 =3D dev_get_drvdata(&slave->dev);
> +
> +	pm_runtime_disable(&slave->dev);
> +
> +	mutex_destroy(&rt766->disable_irq_lock);
> +}

The mutex is used by the interrupt code, probably better to allocate it
using devm so it's ordered with everything else during teardown.

> +static int rt766_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
> +				struct snd_pcm_hw_params *params,
> +				struct snd_soc_dai *dai)
> +{

> +
> +	/* set sampling frequency */
> +	switch (dai->id) {
> +	case RT766_AIF1:
> +		regmap_write(rt766->regmap,
> +			RT766_SDCA_CTL(UAJ, CS41, SDCA_CTL_CS_SAMPLERATEINDEX),
> +			sampling_rate);
> +		regmap_write(rt766->regmap,
> +			RT766_SDCA_CTL(UAJ, CS36, SDCA_CTL_CS_SAMPLERATEINDEX),
> +			sampling_rate);
> +		break;

Are these separate playback/capture clocks?  If so should we only be
programming the one that's active, or if they have to be in sync should
the DAI be flagged as needing symmetric rates?


> +int rt766_sdca_init(struct device *dev, struct regmap *regmap, struct sd=
w_slave *slave)
> +{

> +			rates =3D rt766_find_dt_rates(dev, func_data_ptr, "IT 41");
> +			if (rates)
> +				rt766_sdca_dai[RT766_DAI_UAJ].playback.rates =3D rates;
> +
> +			rates =3D rt766_find_dt_rates(dev, func_data_ptr, "OT 36");
> +			if (rates)
> +				rt766_sdca_dai[RT766_DAI_UAJ].capture.rates =3D rates;

This should modify a local copy rather than the global in case there's
multiple devices with different configs.

--2rKYeeGVPSpO1S0r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpriS0ACgkQJNaLcl1U
h9AYEAf/aYWtxsHWtXtZRq88XnkfxadtKiW8HKpSxdi9WrzScrOiSktgLjTZycrQ
58GMwqwR2EVxh++h6qHvO4BYvbcc/HGknSuxLPXG9b/BGsSlD39EjIZbV3hiwGPp
dYJMaOK/mfELywR/74/nTrZzF3q3SJOUVdmWAwLmeRHn5urZUd3RBOh4uS/JV4Hc
jOBixeJtFYavAxQDC7KwEnRnABlJYGkI/MoBfgMosJNi+2mcptvtspaxMzotLSRL
l6PNPKMStNccvSm3Nq5UMfD3xD13M7gHmWcppS2Z0rw5Ads4TMErGqMI1Bo0hS+0
XIYyErIPJYig9OQ2yPVVcEC/VyBycg==
=bTLq
-----END PGP SIGNATURE-----

--2rKYeeGVPSpO1S0r--
