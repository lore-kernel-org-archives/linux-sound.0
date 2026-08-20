Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB318397940;
	Thu, 20 Aug 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787251975; cv=none; b=ohrFnmbE+gMMT57VNFoO1dFhU/gJiAeadosneN9ycTWt1/yYjwJ5oUPoZJhHJByIV973hYRhCyiop50/d85zPKad/wxIb4O2WzhcRffPIalbbxoGeE2HXWV5sKLduWtbjZb1nXAOjo79AYTkfjjT9sRwa4Xlqw3LVGHjEv2ez7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787251975; c=relaxed/simple;
	bh=dP86y1Y9qGtNrO2nb3gNuvRLmrYetagizKFh4nNqGbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWKLvA9p0hKnBFCemFjci2G+cOJiXWXDPHQOv27eFWVkX3DCkFnbtnjed4FXc9CcFMOXOSXTfs9FV3dWEXFjJ6yikB/QjNuvVctp/omhp5nomSmWZB8jm231eGzxlCR2qCKf/ylLFOf7WUKOLAgqBbqpId42VwZtkGZF5I7oQBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWUKuwzV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWUKuwzV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3D91F000E9;
	Thu, 20 Aug 2026 18:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787251973;
	bh=AZxW5LmZLIWL/HfpvB/XqHqxtz7SoQvtZW9avWEKaD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CWUKuwzVrKmryW5Iri2VdMR4SEnFf0OMzwdFIvipduj8aFXkC21iPe+Fp1ceNE8K1
	 aqMmdrl6qPoZeqfEjDs//VC6O2v9JslkA7VsS6UN/iOrb7ufmQUT/CBvJ+/MZ35BAn
	 Fnd1zYYGSKG7PIpvRlbTnpuNsPnk2ERp7FlYEO3g6otChypGAqFMneluZC6TpdZzRV
	 wYwnpE84sjORV4iW/03joGwJz+LOudawpqwEeOXXbSahrGEd+ToB/aOQApk6dhiyGQ
	 8k8RLVqRN2hncxYT7XUX8WXdVJP86aHFpXM36BoskT2fkkjPP3MP52rEydzgxnlKAk
	 egjKSYudwwG9Q==
Date: Thu, 20 Aug 2026 19:52:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Karl Asseily <karl@asseily.com>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M codec
 driver
Message-ID: <7f2e051a-1e77-49e0-bec8-e178855295b0@sirena.org.uk>
References: <20260820062626.39218-1-karl@asseily.com>
 <20260820062626.39218-4-karl@asseily.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L7gbSWtoCaxLqXHh"
Content-Disposition: inline
In-Reply-To: <20260820062626.39218-4-karl@asseily.com>
X-Cookie: Do not try this at home.


--L7gbSWtoCaxLqXHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 20, 2026 at 09:26:25AM +0300, Karl Asseily wrote:
> The ES9039Q2M is a 32-bit two-channel audio DAC with an asynchronous
> sample rate converter. It selects between two control personalities with
> its MODE pin: hardware mode, strapped by HW0/HW1/HW2 with no control bus
> at all, and software mode over I2C or SPI. This driver implements
> software mode over I2C, which MODE = GND selects.



> @@ -0,0 +1,1259 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ESS Technology ES9039Q2M 32-bit 2-channel audio DAC

Please make the entire comment block a C++ one so things look more
intentional.

> +#define ES9039_SYS_MODE			0x01	/* reg 1, reset 0xb1 */
> +#define   ES9039_ENABLE_TDM_DECODE	BIT(0)	/* set at reset */
> +#define   ES9039_ENABLE_DSD_DECODE	BIT(1)
> +#define   ES9039_ENABLE_DOP_DECODE	BIT(2)
> +#define   ES9039_ENABLE_SPDIF_DECODE	BIT(3)
> +#define   ES9039_SYNC_MODE		BIT(6)	/* 0 = ASYNC, which DATUM uses */
> +#define   ES9039_ENABLE_DAC_CLK		BIT(7)	/* set at reset */
> +#define   ES9039_DECODE_MASK		(ES9039_ENABLE_TDM_DECODE | \
> +					 ES9039_ENABLE_DSD_DECODE | \
> +					 ES9039_ENABLE_DOP_DECODE)

_DECODE_MASK doesn't cover S/PDIF.

> +
> +	ret = es9039_write_le(priv->regmap, p->reg + (p->shift / 8), 2,
> +			      (u16)v);
> +	return ret ? ret : 1;

Please write normal conditional expressions rather than ternary ones for
improved legibility.

> +static int es9039_dop_put(struct snd_kcontrol *kcontrol,
> +			  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
> +	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(c);
> +	bool on = !!ucontrol->value.integer.value[0];
> +	int ret;
> +
> +	if (on == priv->dop_auto)
> +		return 0;
> +
> +	priv->dop_auto = on;
> +
> +	ret = regmap_update_bits(priv->regmap, ES9039_INPUT_SEL,
> +				 ES9039_AUTO_INPUT_SEL,
> +				 on ? ES9039_AUTO_INPUT_SEL : 0);
> +	if (ret)
> +		return ret;
> +
> +	return 1;
> +}

If a stream is already running then the handling in hw_params() won't
have a chance to kick in - should this return an error in that case, or
try to do some reconfiguration?

> +	/*
> +	 * Not "... Volume". ALSA reserves that suffix for gain controls
> +	 * carrying a dB scale, and these are signed correction coefficients
> +	 * for the second and third harmonic - they have no dB meaning and no
> +	 * TLV. Useful values come from measuring a given board's distortion on
> +	 * an analyser and solving for them; zero, the reset value, is the only
> +	 * honest default until someone has.
> +	 */

Volume controls don't *need* TLV data or dB scales, it's more about
their intended effect.

> +	ES9039_STAT("Clock Fault", ES9039_IRQ_SOURCES + 1, BIT(7), 1),

There was a symbolic name for WS_FAIL, and there's TDM_VALID as well.
It feels like this should be able to use the defines, especially since
it's a driver local control type.

> +/*
> + * In asynchronous mode - a fixed oscillator with no relationship to the incoming
> + * frame clock, which is how any board using the ASRC properly is wired - the
> + * datasheet requires MCLK >= 130 * FS (hardware mode table, ASYNC rows). Cap the
> + * rate accordingly so a machine driver cannot open a stream the clock cannot
> + * legally carry. With a 24.576 MHz oscillator that ceiling is 189 kHz, which
> + * means 176.4 kHz is available and 192 kHz is not.
> + */
> +#define ES9039_ASYNC_MIN_MCLK_FS	130
> +
> +static int es9039q2m_startup(struct snd_pcm_substream *substream,
> +			     struct snd_soc_dai *dai)
> +{
> +	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(dai->component);
> +	unsigned int max_rate;
> +
> +	if (!priv->mclk_rate)
> +		return 0;
> +
> +	max_rate = priv->mclk_rate / ES9039_ASYNC_MIN_MCLK_FS;
> +
> +	return snd_pcm_hw_constraint_minmax(substream->runtime,
> +					    SNDRV_PCM_HW_PARAM_RATE,
> +					    8000, max_rate);
> +}

This means that if MCLK is specified but syncronous we'll reject things
that could be supported, that doesn't seem ideal.  We should have some
mechanism for specifying if the clock is actually async.

> +	/*
> +	 * The part can generate BCLK/WS (PCM_MASTER_MODE), but on a board fed a
> +	 * fixed oscillator that means deriving them from MCLK and throwing away
> +	 * the ASRC's entire purpose. Consumer only, and say so.
> +	 */
> +	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_CBC_CFC)
> +		return -EINVAL;

That seems odd - usually an ASRC is a workaround for mismatched clocks,
not a goal.  It is very common for the CODEC to drive clocks on the
audio bus from a high quality MCLK.

> +static int es9039q2m_mute_stream(struct snd_soc_dai *dai, int mute, int dir)
> +{
> +	struct es9039q2m_priv *priv = snd_soc_component_get_drvdata(dai->component);
> +
> +	return regmap_update_bits(priv->regmap, ES9039_DAC_MUTE,
> +				  ES9039_MUTE_BOTH, mute ? ES9039_MUTE_BOTH : 0);
> +}

This is shared with the user visible mute control, they're going to
fight and be buggy.  The register needs to be owned by one of them or
they need to coordinate.

> +	if (priv->mclk) {
> +		priv->mclk_rate = clk_get_rate(priv->mclk);
> +		if (priv->mclk_rate > 50000000)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "mclk %u Hz exceeds the 50 MHz maximum\n",
> +					     priv->mclk_rate);
> +	}

As per the above comments on driving the clocks from the CODEC it'd be
pretty standard to use clk_set_rate() to configure the MCLK to be a
suitable multiple of the sample rate and get everything nice and
synchronous.

--L7gbSWtoCaxLqXHh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqHTQAACgkQJNaLcl1U
h9B3Xgf+OotwOUqsVuMX1uGJzDnWgw5HKE3lf5ONL7lAlc0cNFHzRygQ5bfi8Jwb
uZYvzvWl12ft0w5N+444HBUQCIs5+knG6LuejlTtEf/1Z2np8yxp14w0u9z7ZhKP
oxdNpdjowwW607w4YzjVna6HGvlyEOMySITNfvV3Zv0cRD1QuoRWFVB7D0uoxo7h
uKGS52hxjaAUk2x9VS14UwbX3EqmIC3brVzETv6DCQddI/GMbJwh538kcYVH9a4j
aUEWfZRjNzQU/ZY1RfE5hIhouu1w/jm8E74QVdR0Viq1l3+P7affaUm4xuZBlh9Q
9iofhoEKEzudnrsh23+uRnWZkeQcmA==
=Zq0s
-----END PGP SIGNATURE-----

--L7gbSWtoCaxLqXHh--
