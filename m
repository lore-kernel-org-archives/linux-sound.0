Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886B6481651
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 12:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909816; cv=none; b=sEmg3rDTfXdAwBGUfGMBmD7toaDx6EEOFddaz9AYkTcJBdmUlkZjzpkxOvG1x+lUP5QBs4jXA8Qebiav345PtIn0p8+BSeVTt0fD7GYoEjAiJUXrnFKJPPMAGj6ZMaB5h/6HV4n2z+DYHvgnrZ6Pud3qL2iOi4pkMwLsJhog8hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909816; c=relaxed/simple;
	bh=wdap0JyaG5mhtAS5jIm2FohYf/nBJDKhBJJPfpYEzZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3pT0pe4svBj6kgOo3Ujp7HjrXZAvBaSmCTcL660gogrdr1BfmRj+UTnGGkg9liLw0BxW/Dxt+whTGXwCdVWyUltnvJoLOxMlochGspuzYYrPH2BQdvS4EfGMyr6gtnlMxB7hiBu5W8l9XDu3sQwo/PElqJjaANApqwi/4nEyFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bKcuXjbO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bKcuXjbO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D32E1F000E9;
	Wed,  1 Jul 2026 12:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782909815;
	bh=ESDahHSNnwhY9P4DicqdGP+JsCV1AJdVtOZlmg2dEsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bKcuXjbOu8d/uw3DXbkyJNA/G420kIAuTsj2Bz6/8V7C0JRwaO18OnGUmSOm8qIY8
	 uQoPjjdCphSOczcHgSWbNqcgRhgsdzxc/D/BRxKuHBi7PA1LmfaBcs4Lus3nSE7/x4
	 vHP/jLdbLiIOsZPXmdAenCoB8ebRVfJM16BlwZ5LzKRXEWUfx4ZiMwsM4P0/Em4yyI
	 Vctu628oBTaY+IgbjPl1bii9Y7amdBhQRZmZwuXi8Sg1Di6DnTPtmKFIZpavgB4/6z
	 be6viQqGcOPaI59j75ibxsbUqiRuwB261slsxu3cz9BM38S4ONz7vYzWwMmaW+AI+c
	 NKqrQZlldF+5w==
Date: Wed, 1 Jul 2026 13:43:30 +0100
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, lars@metafoo.de,
	flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com, dirk.su@canonical.com, pin-hao.huang@hp.com
Subject: Re: [PATCH] ASoC: rt712: add mute led control for specific machines
Message-ID: <90c23bcb-f923-404a-a1ad-1b8fa5b8c0db@sirena.org.uk>
References: <20260701090530.3754881-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ghlyblaiZHaCZdIf"
Content-Disposition: inline
In-Reply-To: <20260701090530.3754881-1-shumingf@realtek.com>
X-Cookie: Do unto others before they undo you.


--ghlyblaiZHaCZdIf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 01, 2026 at 05:05:30PM +0800, shumingf@realtek.com wrote:

> Certain HP platforms use the RT712 GPIOs to control the microphone mute LED and mute LED.
> This patch registers LED class devices in the codec driver to control the GPIOs
> through the LED subsystem.


> +#ifdef CONFIG_LEDS_TRIGGERS
> +static int rt712_sdca_mute_led_set(struct led_classdev *led_cdev,
> +			       enum led_brightness brightness)
> +{

> +	rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
> +		RT712_HDA_GPIO_EN_CTL, (1 << gpio_pin), (1 << gpio_pin));
> +	rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
> +		RT712_HDA_GPIO_DIRECTION_CTL, (1 << gpio_pin), (1 << gpio_pin));
> +	rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
> +		RT712_HDA_GPIO_SET_CTL, (1 << gpio_pin), (value << gpio_pin));

This all looks like we should register a GPIO and let the LED subsystem
GPIO support do the LED glue.

> +	for (i = 0; i < NUM_AUDIO_LEDS; i++) {
> +		mute_led_cdev[i].trigger_data = (void *)rt712;
> +		err = devm_led_classdev_register(rt712->component->dev, &mute_led_cdev[i]);

trigger_data looks like it's for the triggers, and the LED subsystem
does overwrite it when configuring triggers.

--ghlyblaiZHaCZdIf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpFC3IACgkQJNaLcl1U
h9AHkQgAgQiwg+l669/ZjDcSym4eAerathPySESUTlsV2PnTkG5betcq1O8Eh9mE
18Iwq7Q+AuF/uAO9+E7MuZ/bX3oeBllDqXKDdqNkXqhm0c8lnc3iPSw/mPiBkHZR
aA+r7IZKyVc1QNuZjqrzn5v7n5m5blp9Llr3sL1o7DAerL+8GhNI8ymqlwtcKWM4
CzwmdEI+o0DwD7MzX3XqaAENqv5yzd+J38PeLWZ+okph7N31AIFvoJEstGD9+nQZ
9jJZmF71m3p0mqDvKWR/0ZmlsMKOxb6/qK6dulryWPhTeOcD57CFmLo9eBRPHTYj
hlQa8fEnjFv73Mzz3ILqMxqB1+Xpsw==
=dYkS
-----END PGP SIGNATURE-----

--ghlyblaiZHaCZdIf--
