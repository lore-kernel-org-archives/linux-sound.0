Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E883F5BCE;
	Mon, 15 Jun 2026 13:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781531378; cv=none; b=t4+JG9jwTuzNceEBJow6LBf3g48p50NHiMIx3MbAmW93QQyINb2YM12gJdRZBOuLnjJYFfd5+Gy+G3x53KNpgGDDBeuxU+tKfU0c36A6zm22beW/miNqBi/JllyOsvMHeJdB6rAyhUMUwhIy0i21gQmjMBXSu9JiHTskw+a0DYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781531378; c=relaxed/simple;
	bh=IO3By52drsLyPyCXbTpxsXQbYph+A2bkgrN+ZYab0aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufD8Fabw/jja6dor7FSbZ2seICutXYRhUtRWtxkR/GCUKTNx7Srnl76uuQwM8F0kLZLnnP5Wy8UdAkZVULUEs+yCx6jbqykczPYC8iL7Kv8eAY7H6QzPCkOaPDNGEn0LcnInHOuo0hk/DPPfiqtleuZYL/YxlT7nfJTd17ATo3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAYG2ip4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAYG2ip4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DAE1F00A3A;
	Mon, 15 Jun 2026 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781531376;
	bh=IhTcK2/QkNpWF7uWjIm+f7w8CY6mOCIjTXZ+KmCHSfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XAYG2ip4qffx/aZj7UsYjyQdK3PDa6Jq8Ns/cQSsvKuj7mT8tJ5dPxeSAJ6dLBVaT
	 HvxGJCpzZPi3PqdEgA30XOMfdw7tWwgRe5b/aP//gnXKRcvZztoQc+erI8nr3DgwUP
	 7kcpVSzlN89nQo0ctUnkwCXbiayp+EYlq0Kuqi5fS4vKINKvKx4J/StYSnFFYLuaFv
	 7BZIlFjZiAWGIvDG3ondMJeDErodSL7i0rJ+9GU2OuJ85SkVv6pKeNvxavXdRRZ4UT
	 P8SBzC1ynzVqfFJ35wxeesoYbJ5F0Yp9Al2o2GWqiIo7QREphkrsX9Q2RhsdcKyjwv
	 MPDghshlgTwDg==
Date: Mon, 15 Jun 2026 14:49:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Tagir Garaev <tgaraev653@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] ASoC: Intel: sof_es8336: add Huawei BOD-WXX9 HWSP
 support
Message-ID: <110da016-a562-41af-a126-a3ad647bd782@sirena.org.uk>
References: <20260614161028.10405-1-tgaraev653@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IEU2QExjT5huXKY/"
Content-Disposition: inline
In-Reply-To: <20260614161028.10405-1-tgaraev653@gmail.com>
X-Cookie: To stay youthful, stay useful.


--IEU2QExjT5huXKY/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 14, 2026 at 07:10:28PM +0300, Tagir Garaev wrote:
> Huawei BOD-WXX9 routes the ES8336 HPOL/HPOR outputs to both the
> headphone jack and an internal speaker amplifier. The amplifier is
> represented in ACPI as HWSP0001 and is not controlled by the ES8336
> GPIOs alone.

> +static const struct sof_es8336_hwsp_regval hwsp_speaker_restore_profile[] = {
> +	{ 0x01, 0x69 },
> +	{ 0x03, 0x16 },
> +	{ 0x04, 0x80 },
> +	{ 0x05, 0x0c },
> +	{ 0x06, 0x11 },
> +	{ 0x07, 0x93 },
> +	{ 0x09, 0x0b },
> +	{ 0x0b, 0x4b },
> +	{ 0x0c, 0x00 },
> +	{ 0x0d, 0x77 },
> +	{ 0x0f, 0x51 },
> +	{ 0x10, 0x58 },
> +	{ 0x58, 0x00 },
> +	{ 0x59, 0x80 },
> +};

Magic number write sequences in a machine integration...  this looks
awfully like it should be either user visible controls or something more
structured.  In a chip driver it's usually something the manufacturer
simply does not document but this is a third party thing.

> +	} else if (priv->gpio_hwsp) {
> +		gpiod_set_raw_value_cansleep(priv->gpio_hwsp, 0);
> +		usleep_range(SOF_ES8336_HWSP_MUTE_PULSE_MS * 1000,
> +			     SOF_ES8336_HWSP_MUTE_PULSE_MS * 1000 + 1000);
> +		gpiod_set_raw_value_cansleep(priv->gpio_hwsp, 1);

Why _raw?

> +static void sof_es8336_apply_gpio_mux(struct sof_es8336_private *priv)
> +{
> +	struct gpio_desc *speaker_gpio = priv->gpio_speakers;
> +	struct gpio_desc *headphone_gpio = priv->gpio_headphone;
> +	bool hwsp_enabled = sof_es8336_hwsp_amp_enabled() && priv->hwsp_client;
> +	bool hwsp_speaker_on = false;
> +	bool speaker_on;
> +	bool headphone_on;
> +	bool need_enable_delay;
> +
> +	if (!priv->gpio_speakers)
> +		return;
> +
> +	mutex_lock(&priv->gpio_mux_lock);
> +
> +	speaker_on = priv->output_active && !priv->hp_jack_present;
> +	headphone_on = priv->output_active && priv->hp_jack_present;

Why is this not being done by userspace, it looks like policy is being
encoded into the kernel here?  Does having the speaker and headphone
active simultaneously physically work?

--IEU2QExjT5huXKY/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmowAusACgkQJNaLcl1U
h9D7cAf/UWomyNikGFBRA1JbrXWi8pJcC6NoCn3jrXO8r1mLUnFICltLT5vU/bNc
D3SxMnDE0oEoRyT88963pEbbuacGM9TzaLZoMOi0ixBTujMW5dgqgQHalShCLbxq
qY0PBCeAPJCkQI9t6zQp1PKUbLQpe/j0ABevLi44GXwXsIatXISofVfhx0b6K1X3
nQjxWK/mfYC3auLemFP7y5nnD3XCFS19ynA2sEsobrc0FokiyffwrDAtSultvYHv
JUKgblKrmGUNbsonesHOtLrPK6sSKthBWNu0F1imCSecmeshEFTBJbKxJdCLn4iU
TOQ3GObjZbXg6lcQvL4xds1iDumi9w==
=ynGE
-----END PGP SIGNATURE-----

--IEU2QExjT5huXKY/--
