Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F0631CA4E;
	Wed,  8 Apr 2026 15:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662898; cv=none; b=u2iHOUJY9if/mTh1rp+cPcap49PsxJb2cMCgZRc0gb5ur89A5zqAD5pAZgLLDO2YKV9U6h4EPFgKgvHCIdIYPR2M4M1PiN/8DT3FLgVyJDtcbI2+5ldIHPyfqWPOrCvKbr8l+I2Ih4NcWEYppt7TjkNjbuGgHtRne93B/AYTX0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662898; c=relaxed/simple;
	bh=HnjpWZWv4oa3+uPeyz0eYjGyj48PHQZfGZVRIeT8thA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uv76fLTZCfTyGPuPFgr487QtiriI7GAO1aYkWjO8TN6/0wHJUAXY4PjiVWh/OrHaY+H/A+znQGFouhQeBRtcXYTlGQF3QivKZ6RHWQcDO6boT+kUyBrh5DsGDZIUM1DuqM7mtxIzQC4QvVhlEJ1EV+5+Gh+HIrn3wz5RExWQfkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJ7D8gFz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJ7D8gFz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E26C19425;
	Wed,  8 Apr 2026 15:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775662897;
	bh=HnjpWZWv4oa3+uPeyz0eYjGyj48PHQZfGZVRIeT8thA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XJ7D8gFz1C42k1i6VXLrqsUVJhqUWOIoYWWloBfivEcjb2/Zv2vZk91pmBLvZcGrq
	 O5Pim/+cZzfBcHbjyllLhpV1GEjS7Qahx2boSN+Iwx/UXFek12YbH3HnBNykCXiOJi
	 z66OrUIiKu0dLGwicH+yP9PyLrjMVBpw2haj0VeTvjdqOB8I2krBt9Otwh+NPZ+LB4
	 L96BT5uAMN066E3FTkCvPzn/0gM83oU4AN+Jt2oQsMqsBE54hXFNS3/5BzfWXRtRjz
	 fmokdy5iqGvDmjDVzWSO9loUeI2Q5VQyE6Bv8p87IjPh7xN7bLFFD1NMqQOH0IdXnq
	 6jKN+xYEl9dxQ==
Date: Wed, 8 Apr 2026 16:41:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Sen Wang <sen@ti.com>
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	perex@perex.cz, tiwai@suse.com, shenghao-ding@ti.com,
	kevin-lu@ti.com, baojun.xu@ti.com, niranjan.hy@ti.com,
	l-badrinarayanan@ti.com, devarsht@ti.com, v-singh1@ti.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] ASoC: codecs: Add TAS67524 quad-channel audio
 amplifier driver
Message-ID: <588c699e-7ad0-4f71-9727-56e8a3c78805@sirena.org.uk>
References: <20260408053149.1369350-1-sen@ti.com>
 <20260408053149.1369350-3-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wwDffXShvDV19HKf"
Content-Disposition: inline
In-Reply-To: <20260408053149.1369350-3-sen@ti.com>
X-Cookie: Often things ARE as bad as they seem!


--wwDffXShvDV19HKf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 08, 2026 at 12:31:46AM -0500, Sen Wang wrote:

> +static int tas675x_dsp_mem_write(struct tas675x_priv *tas, u8 page, u8 reg, u32 val)
> +{

> +out:
> +	__tas675x_select_book(tas, TAS675X_BOOK_DEFAULT);
> +	mutex_unlock(&tas->io_lock);

Do we really need to restore the book here?  The book select register is
marked as volatile so regmap will figure things out if it's the next
thing to write, and anything else will need to set whatever it wants
anyway.  Alternatively if the book register were cached (which wouldn't
be a bad idea) then we'd need to restore whatever the cache has or
invalidate the cache.

> +static int tas675x_dsp_mem_read(struct tas675x_priv *tas, u8 page, u8 reg, u32 *val)
> +{

> +out:
> +	__tas675x_select_book(tas, TAS675X_BOOK_DEFAULT);
> +	mutex_unlock(&tas->io_lock);

Same here

> +static int tas675x_rtldg_thresh_info(struct snd_kcontrol *kcontrol,
> +				     struct snd_ctl_elem_info *uinfo)
> +{
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
> +	uinfo->count = 1;
> +	uinfo->value.integer.min = 0;
> +	/* Accepts 32-bit values, even though 8bit MSB is ignored */
> +	uinfo->value.integer.max = 0xFFFFFFFF;

This is going to break on 32 bit architectures since long is a 32 bit
signed value.  You want LONG_MAX, or to restrict the value (which would
be more friendly to mixer-test!).

> +static int tas675x_set_dcldg_trigger(struct snd_kcontrol *kcontrol,
> +				     struct snd_ctl_elem_value *ucontrol)
> +{

> +	/* Wait for LOAD_DIAG to exit */
> +	regmap_read_poll_timeout(tas->regmap, TAS675X_STATE_REPORT_CH1_CH2_REG,
> +				 state, (state & 0x0F) != TAS675X_STATE_LOAD_DIAG &&
> +					(state >> 4) != TAS675X_STATE_LOAD_DIAG,
> +				 TAS675X_POLL_INTERVAL_US,
> +				 TAS675X_STATE_TRANSITION_TIMEOUT_US);
> +	regmap_read_poll_timeout(tas->regmap, TAS675X_STATE_REPORT_CH3_CH4_REG,
> +				 state34, (state34 & 0x0F) != TAS675X_STATE_LOAD_DIAG &&
> +					  (state34 >> 4) != TAS675X_STATE_LOAD_DIAG,
> +				 TAS675X_POLL_INTERVAL_US,
> +				 TAS675X_STATE_TRANSITION_TIMEOUT_US);

Don't know how likely it is in practice but we ignore any timeout
failures in this function.

> +static irqreturn_t tas675x_irq_handler(int irq, void *data)
> +{
> +	struct tas675x_priv *tas = data;
> +
> +	if (!tas675x_check_faults(tas))
> +		return IRQ_NONE;
> +
> +	regmap_write(tas->regmap, TAS675X_RESET_REG, TAS675X_FAULT_CLEAR);
> +	return IRQ_HANDLED;
> +}

This probably ought to take a runtime PM reference to ensure the I2C
controller is woken up, and in case in future you get regulator support.
Even if the device itself shouldn't be generating interrupts while it's
idle the interrupt might be shared or something might fire for some
other reason.

--wwDffXShvDV19HKf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWdyoACgkQJNaLcl1U
h9ChEQf+IxWtw/VLcwZPpsmL+aypDnL3ZfCwK+NEszO0Ph8SEETRkadUfarMKvuP
n/uImJ95d54xIwI0pmbAkMRqyIyq6t4MuqcWrbAl3BfqvG591jLDJupML/HtxoKc
hDd7q0D7nj47Ab1gLByfwIqrNCn0Iy49mhrA41mGzQ0oeuiLTJE/xytGfuTCsD+E
A6z+JahVNrpMm5OhUfuWYFgZQynGX0A5fS7qr/CvUXrMVh6ulc5l+7gQD08XM8F/
9feU7sQnmfNrPQG8BFbjxGsgo1wPvMhZUKv/XoQznEeYTZyVqYF3bEMeX0/a0CYq
akjjsfVKNp0qatf95Xi9RZZfVCKQow==
=RwnG
-----END PGP SIGNATURE-----

--wwDffXShvDV19HKf--
