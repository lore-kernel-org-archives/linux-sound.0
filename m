Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B4123D7C2;
	Fri, 10 Jul 2026 13:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691749; cv=none; b=R4aioxQxgkV86nzXpEAM7o4S8Px6eknf0dZxgBxduplKfyTi5HSmp0kF4oHujL3ESPkXQeNgOmz4mpMIG4kqSupOWtTmNl6TB7qcLYmE96ZoO8ZGWqBXckFbT2YCgyTLbAEk6rvNrUclOwmIvaPbZpFPSaa/aLrSHe1KftyUCh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691749; c=relaxed/simple;
	bh=zGH6/UoidOUJX1GGxuENbg2obstwFb+znMjTEFJ+mBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZKIyx/ZA5VNLuqvo/XNjR1VWiACFdWDIq4WAZULTH7aVL20e7lOfLx8pBMk2mXixt4z/hIDjdX2ZQmRHeLJxY62Syb1nIG99Odz6PVmGHwUfZJIwV1UdzYJavcW4vZN4f7RsHo80IxYRh6W+otyLZ8J1g7PfUKoIyWKMR8vNi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3iJ0fr1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3iJ0fr1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F174E1F000E9;
	Fri, 10 Jul 2026 13:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783691748;
	bh=Vg+BaXA2y1/rVl6+xeOssCA/C7mxttAAHghTmLyrHnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R3iJ0fr1GE7a+w0yzsB5cuC5AKYztKN9D9R4LRQEpTbMzyrz0EW0wJFmvPfhy4BOv
	 Gps4YH6SfQ0EyKP9wN7QPmMYGgPZNLjqsBc7msHTpUnFKkIP143GUafbunbrggcwoG
	 D0ADDDSmdT2VLcNKuf8QvW2s+LQY3TE88XsNDn8DE+EdeAGCWb+zB0dnipiGomq0ER
	 NifSEqB0GWVDVVCE8Ny0AHMxzukr3K/RrAboZHxX7WOtADonoK9SmmZjWkE3Apg1W/
	 WbN4hTj2L8sbSlFXeUSAOvTBxoZApZW91Mtac4J5fZLpwakIOohiRiGXXi/O1FM3aF
	 oVYSFTuoI+lDw==
Date: Fri, 10 Jul 2026 14:55:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Gianluca Boiano <morf3089@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: codecs: add TAS2557 mono smart amplifier
 driver
Message-ID: <e1471661-cf25-4db4-9a77-48d726811a51@sirena.org.uk>
References: <20260709221331.989109-1-morf3089@gmail.com>
 <20260709221331.989109-3-morf3089@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J0SSosx8O0lFALVO"
Content-Disposition: inline
In-Reply-To: <20260709221331.989109-3-morf3089@gmail.com>
X-Cookie: Did I say I was a sardine?  Or a bus???


--J0SSosx8O0lFALVO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 12:13:29AM +0200, Gianluca Boiano wrote:
> The TAS2557 is a mono Class-D smart amplifier with an on-chip DSP for
> speaker protection. Audio is received over I2S/TDM (ASI) and processed
> by DSP firmware before reaching the Class-D output stage.

> +static const unsigned int tas2557_startup_data[] =3D {
> +	TAS2557_GPI_PIN_REG,              0x15,	/* enable DIN, MCLK, CCI */
> +	TAS2557_GPIO1_PIN_REG,            0x01,	/* enable BCLK (ASI1) */
> +	TAS2557_GPIO2_PIN_REG,            0x01,	/* enable WCLK (ASI1) */
> +	/* ASI2 GPIO wiring; arm the BCLK source (GPIO5) before its dividers */
> +	TAS2557_GPIO6_PIN_REG,            0x01,	/* GPIO6 =3D ASI2 WCLK input */
> +	TAS2557_GPIO8_PIN_REG,            0x02,	/* GPIO8 =3D ASI2 DIN */
> +	TAS2557_GPIO5_PIN_REG,            0x01,	/* GPIO5 =3D ASI2 BCLK input */

This looks suspicously board specific, it should probably come from
device tree.

> +	TAS2557_ASI2_DAC_FORMAT_REG,      0x18,	/* ASI2: 32-bit I2S */

This should be set_dai_fmt().

> +	TAS2557_ASI2_BDIV_CLK_SEL_REG,   0x01,
> +	TAS2557_ASI2_BDIV_CLK_RATIO_REG, 0x01,
> +	TAS2557_ASI2_BDIV_CLK_RATIO_REG, 0x81,	/* power up BDIV */
> +	TAS2557_ASI2_WDIV_CLK_RATIO_REG, 0x40,
> +	TAS2557_ASI2_WDIV_CLK_RATIO_REG, 0xc0,	/* power up WDIV */

Can't these be worked out dynamically?

> +	/* Power sequencing: Class-D + Boost first, then DSP/PLL */
> +	TAS2557_POWER_CTRL2_REG, 0xA0,		/* Class-D, Boost power up */
> +	TAS2557_POWER_CTRL2_REG, 0xA3,		/* Class-D, Boost, IV-sense power up */

tas2557_isense_put() also writes to this register, there's a disconnect
with blind writing. =20

> +/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + * Firmware parsing
> + *
> + * Format (all multi-byte fields are big-endian):

Is there any overlap with other TI firmware parsers?

> +static irqreturn_t tas2557_irq_handler(int irq, void *data)
> +{
> +	struct tas2557_priv *tas2557 =3D data;
> +	unsigned int int1 =3D 0, int2 =3D 0, pwr_flag =3D 0;
> +	int ret;
> +
> +	mutex_lock(&tas2557->lock);
> +
> +	if (!tas2557->fw || !tas2557->powered) {
> +		mutex_unlock(&tas2557->lock);
> +		return IRQ_HANDLED;
> +	}

We definitely didn't handle an IRQ in this case - this will break
sharing and debug features in the interrupt core.

> +	/* Gate the chip's INT output while diagnosing the fault */
> +	tas2557_dev_write(tas2557, TAS2557_GPIO4_PIN_REG, 0x00);

Is GPIO4 the only line that can be an interrupt source?

--J0SSosx8O0lFALVO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpQ+d4ACgkQJNaLcl1U
h9Ctugf+JqafgH6Ph31bwWwBHP8mTHAwfrluUC9IOgPq9uldrYKtt6oYVg0XTrbv
w0zfsMq9fA4+3Dr6+YawNzm/q4NG7qMC2Cm1aZYQ+O8/gdGqDOf0xXQZkl0JynPN
d+WnSwBMjnw3RinVVdBP20ec/Gyw/vpo6jRxTzU425nx+cGVSSUwSDPbvT+Rw6/U
YbB5ZPydD7SrO1rSbOi1+rN9QznzG49ClhzobGNbXyVShBGg1pY7f+v+7rI8wcno
pQVneWFxyRnXflRA2VluDrVzCcRD67uWh+kCQvBlKZAmjvOfpYLvAVZJ1bZwaauP
b9N10UkaRnWAf/Vt5m59Hpgrx4v94w==
=DHzl
-----END PGP SIGNATURE-----

--J0SSosx8O0lFALVO--
