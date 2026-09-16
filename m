Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7C94B0E3A
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 21:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594782; cv=none; b=jaM15oqQ8XztKcf0P2OU4LbULU5PkR583ohdr1BO0zKMAQtxuN5IqpgLjde/0qxIolO1hRxzR6kExWp7w1cO4IUu3Tv6Ewfdy2FU/EsdtEKAaAd4mE2t3dr3H0cVkw1SYVK1/jdPYwkkGFolwZMspNETVG2R00zgfe6fyBTcLG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594782; c=relaxed/simple;
	bh=6GQ99lacp4LlCPFF3R1g99Rh+m/D7gWt1Rrpd7ssTCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8v7uFOyCr7X+fA8XOw5tcjwK/zUC48aPoBUuJTYTasP0xcLXCCTXxG2Mi0Ben7x0Rtrl6DVUCFqDHbhi1l/M+UPcHVkhyD39L2JHuAii2hr1R3QbZXaJw5B3hxjbrGOj+mVupMaftOhguIrshKVF1SDJ1BKWPJj30cXx9YSaJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAAaXKPU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAAaXKPU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8821F00893;
	Wed, 16 Sep 2026 21:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789594762;
	bh=msZC3YFvH41Z8Uyz/5UAJ95zO5Xt0O8aBHVvQd2O+GQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XAAaXKPUBAxru+uGIUSDVwES9aPcRppb8cXXI7/92gVJ0M/eJ4qbv+wYEr8kkO6xH
	 Vg/02fnKpkMIhVR+c1eBCTwWPsqDVS/HKZiY3zS3xI/xCMFWQeQBl4VflLYmrJY5uG
	 C4EpbhQHD1G21UrKKH3S/01nwz2RoOQI0kGjpjfk4lHgR23Whraof5uNLnhZf9kA1T
	 J7CDx87lOTqcTc9ohozv0rKts5ircGNVied7te4csLmbGh38U1axzaK7LZalFUM0b+
	 K4YhNqAqY//8FuAwttxYas8KTRcCFpHs7WdVv6vw8LYbMMzL/YqL7XxZMyY39FVtLe
	 dA8WpL9E7yFHQ==
Date: Wed, 16 Sep 2026 22:39:18 +0100
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, lars@metafoo.de,
	flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com
Subject: Re: [PATCH] ASoC: rt712: add GPIOs for LED control
Message-ID: <3afc23b2-6072-4b65-b3e5-88cee7bf6997@sirena.org.uk>
References: <20260916090513.2294466-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vXgeF31AACmBEYVp"
Content-Disposition: inline
In-Reply-To: <20260916090513.2294466-1-shumingf@realtek.com>
X-Cookie: Double!


--vXgeF31AACmBEYVp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 05:05:13PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
>=20
> Certain platforms use the RT712 GPIOs to control the microphone mute LED =
and speaker mute LED.
> This patch lets the LED subsystem to handle the GPIO control.

> +static int rt712_sdca_gpio_request(struct gpio_chip *chip, unsigned int =
offset)
> +{
> +	struct rt712_sdca_priv *rt712 =3D gpiochip_get_data(chip);
> +	unsigned int gpio_pin =3D offset + 3;
> +	int ret;
> +
> +	dev_dbg(&rt712->slave->dev, "%s: gpio_pin=3D%d\n", __func__, gpio_pin);
> +
> +	ret =3D pm_runtime_resume(rt712->component->dev);
> +	if (ret < 0 && ret !=3D -EACCES)
> +		return ret;

This pm_runtime_resume() usage can race with autosuspend, if the
autosuspend timer is about to expire it could do so before we actually
update the register values so the writes won't actually happen.  It's
very unlikely to actually happen but the risk is there.

> +	/*
> +	 * Only support GPIO3 and GPIO4 for now
> +	 */
> +	switch (gpio_pin) {
> +	case 3:
> +		break;
> +	case 4:
> +		rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
> +			RT712_HDA_LEGACY_CONFIG_CTL0, 0x000c, 0x0004);

This doesn't do any locking with other regmap users and gpiolib won't
hold a lock for us - since rt712_sdca_index_update_bits() is a
read/modify/write cycle this could lead to corruption.

> +static void rt712_sdca_gpio_init(struct rt712_sdca_priv *rt712)
> +{
> +	int ret;
> +
> +	rt712->gpio_chip =3D rt712_sdca_template_chip;
> +	rt712->gpio_chip.parent =3D &rt712->slave->dev;
> +	rt712->gpio_chip.fwnode =3D dev_fwnode(&rt712->slave->dev);
> +
> +	ret =3D devm_gpiochip_add_data(&rt712->slave->dev, &rt712->gpio_chip, r=
t712);
> +	if (ret !=3D 0)
> +		dev_err(&rt712->slave->dev, "Failed to add GPIOs: %d\n", ret);
> +}

The gpiolib usage either needs to be conditional on gpiolib or we need
the driver to depend on it.  Either is fine.

> @@ -1101,6 +1204,9 @@ static int rt712_sdca_probe(struct snd_soc_componen=
t *component)
>  			rt712_sdca_spk_dapm_routes, ARRAY_SIZE(rt712_sdca_spk_dapm_routes));
>  	}
> =20
> +	/* initialize GPIOs */
> +	rt712_sdca_gpio_init(rt712);
> +
>  	if (!rt712->first_hw_init)
>  		return 0;
> =20

This will happen every time the card binds and uses devm, I'd expect it
to happen when the SoundWire device binds rather than during ASoC level
initialisation.  We don't want to continually register and unregister
the GPIOs.

> @@ -271,7 +276,6 @@ enum {
>  	RT712_CLK_FREQ_22_5792MHZ =3D 4,
>  };
> =20
> -
>  int rt712_sdca_io_init(struct device *dev, struct sdw_slave *slave);
>  int rt712_sdca_init(struct device *dev, struct regmap *regmap,
>  			struct regmap *mbq_regmap, struct sdw_slave *slave);

Unrelated whitespace change.

--vXgeF31AACmBEYVp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqrDIUACgkQJNaLcl1U
h9B17wf+KFR7eDNDv+lKnyyKWU5+tM/7HfJm9vrq3C7zdPbYGIMquQ93sMx/cXV9
zs7KY0srEhmyheOV0yIeJQlYyll4pbq6AJJjybV/iGfYNvv0y1hxAWIXCjjeb2ke
n/JGvN8pE5l4v2vTDiu5ymNTOOED7KP1E+vPhPTMzoeIL42aB4tLe42QMhTK2oK6
YHsiYPxtDsAwWb8TP4xoeSS1b3JlrXMQrooaKW/fRkoup3ghpF8yndrfDxA+TK2S
dboRMFQRhcDyMHeTDhrZ5nf+XNtLe+mD/Vdclk7a7F1116wY/hEFkvUcdurK05yL
Dc80Jz6Gjh9MSEqzQS4Hm33EyiRHMQ==
=f1mV
-----END PGP SIGNATURE-----

--vXgeF31AACmBEYVp--
