Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C37A22836C
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 14:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757513205; cv=none; b=rzyD5RpZJKTtL4L0AoDT0wrBbyWVNlJlxkp4w0s9oS8Pd7+/HDPbeUy7BRRzfwhthMuhZUn7TZW93ygLnA+5fGF7pQv7LNc+5LG7DgyztOYv+Qlb6HryMIz9xF26cJYRwgBXUJO+bIg8y19MavE4El9O9WdsLvKzbJECiVOOmxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757513205; c=relaxed/simple;
	bh=bwDzemNw4BbjpPMICDGxskQKr6TFxzB4f34cZ/km2ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3gzgBpnN69hl44KT1m4V/Kk107aJ4HPlHznLD4bRlemgZzZKKJZVTMRJSmfXI2TVp3E4R8LGF+KGNQR9lr4sDFbu0vZo76WVYEel6w2QxrZLoMEJuw2e+AgLCdkC9W9QsGul55T2GCJNC1p1CIYJl9C2an8tybrH+DEnq0VtK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+wuWQ7w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+wuWQ7w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE4FC4CEF8;
	Wed, 10 Sep 2025 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757513205;
	bh=bwDzemNw4BbjpPMICDGxskQKr6TFxzB4f34cZ/km2ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O+wuWQ7wqhOAR1XspYke6QpmuUfK/GvlFw4XOf+w/R6IQStpd52Yt8t3M+m47CQAt
	 Q5ZvPvrAwinkLgT52jkYqLaA4EPTQQ8+84ibegRzhrtFXdQrwlIBVlsudxImfY3jlW
	 6tTJLKqg8Pe5gWbkiJVY6+k/EIRbfybgAEncRCkuNohP/tyiVnf0o/CgOpPPTQ8oDi
	 ig6Z3gR7Tl0yEr+q5VNwz5rSbMO2woxYLt+n+Fzl9atTVhwkumdB3s6dpEA5ep/Uxi
	 fbzyqtE6hLEhM1rZZ/EBnoKxZCRHuUx412EWp0v7t04g2BgRxIamZYbR17HzPljnbM
	 8j9pRTBW3Ln1A==
Date: Wed, 10 Sep 2025 15:06:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	yung-chuan.liao@linux.intel.com, cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
	navada@ti.com, shenghao-ding@ti.com, v-hampiholi@ti.com,
	baojun.xu@ti.com
Subject: Re: [PATCH v3 1/4] ASoc: tas2783A: Add soundwire based codec driver
Message-ID: <125fc7e8-facc-4dea-80b0-38551036a075@sirena.org.uk>
References: <20250910121917.458-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="980EMwrbTAPsrSiM"
Content-Disposition: inline
In-Reply-To: <20250910121917.458-1-niranjan.hy@ti.com>
X-Cookie: I think my career is ruined!


--980EMwrbTAPsrSiM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 10, 2025 at 05:49:14PM +0530, Niranjan H Y wrote:

> new file mode 100644
> index 000000000..ddadfb7c5
> --- /dev/null
> +++ b/sound/soc/codecs/tas2783-sdw.c
> @@ -0,0 +1,1417 @@

> +#if !IS_ENABLED(CONFIG_SND_SOC_TAS2783_UTIL)
> +static void tas25xx_register_misc(struct sdw_slave *peripheral) {}
> +static void tas25xx_deregister_misc(void) {}
> +#endif

This config symbol doesn't exist already and isn't defined by the patch.
If it did exist I'd expect these stubs to be in a header file rather
than a C file.  What's going on here?

> +static s32 tas2783_digital_getvol(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct tas2783_prv *tas_dev =
> +		snd_soc_component_get_drvdata(component);
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	s32 val, ret;
> +
> +	ret = regmap_read(tas_dev->regmap, mc->reg, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	ucontrol->value.integer.value[0] =
> +		tas_clamp(val, mc->max, mc->invert);

It feels like rather than define a custom read operation it'd be better
to make this clamping part of the generic ASoC ops if it's needed - the
code is totally generic and you could see something similar for any
device that has a limited set of values that are valid.  Presumably your
device happens to trigger this in some common situation but anything
could be affected and we should handle it generically.

> +static s32 tas2783_digital_putvol(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{

> +	val = tas_clamp(ucontrol->value.integer.value[0],
> +			mc->max, mc->invert);

This appears to be the only non-standard part of this function but the
generic implementation should already deal with invalid inputs.

> +	ret = regmap_write(tas_dev->regmap, mc->reg, val);
> +	if (ret)
> +		dev_dbg(tas_dev->dev, "put vol %d into %x %x\n",
> +			val, mc->reg, ret);
> +
> +	return ret;

This won't return 1 on change, mixer-test will tell you that (and spot a
bunch of other errors).

> +static const struct snd_kcontrol_new tas2783_snd_controls[] = {
> +	SOC_SINGLE_RANGE_EXT_TLV("Amp Gain Volume", TAS2783_AMP_LEVEL,
> +				 1, 0, 20, 0, tas2783_amp_getvol,
> +				 tas2783_amp_putvol, tas2781_amp_tlv),

Just Amp Volume.

--980EMwrbTAPsrSiM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjBhe4ACgkQJNaLcl1U
h9Agbwf+ILKfkPHGvI9VWLbEWmwM/iracD2tFkOxZ+TjknoLm1z9Q35Jqtprtb2u
EoR6szdSWQWnhbj49sXkVhdaPtob3Gc2YZ7ZF/qN34ko7FaPpvdYLpFvGNVJtYZr
kdX0Fu95aKqPDm6/Wl820WUY2M6BuY3FI+avxAwKMCi64BsaseyMjl1DN3enM4gw
DRkPz+scwn+ooEWCEWyqy/ij/zHHT2t2gtFTw+WgqWM8ECpX427g1PtHRw25pw44
jp3XydaDPM7S/0p4+ggWBuLw4A1cbv0QBManTkFQXAYIWP6qPkOXyYZZKZqw0fyu
qQKyCVbjKlwrsp+awRkBFEQLOwWZjw==
=2Wh4
-----END PGP SIGNATURE-----

--980EMwrbTAPsrSiM--
