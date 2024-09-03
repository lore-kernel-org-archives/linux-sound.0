Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B98618DF78;
	Tue,  3 Sep 2024 18:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725387166; cv=none; b=fqPaXpMY/LKf6Rzpe1rjTiC4s+7E6hLFSRb4eLI5JTo5gDErw022Wii5uVA7tNrh0g3zIdpuuauqpUVoW3Csd1ScPVqNAhqVRhyaXUvKseWUL+VWyoEX786sgodS3n9rAVPcN3RY1JMnSgcO5CQDwHiUtN+wGoc1o5gTD2JB2O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725387166; c=relaxed/simple;
	bh=WtdrVLhuX7QUBk5Q47adV0XQCHtkPufPeUe4K0O64aM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/9T5UJcIRDj3s5VVBjxISyl1VFc/Q4Mf1X8qzuNq6GMFUeEtqUxLT9qgZ4nTzYXjJJQ6r91ti2Bql1pw9XrMYFxisBe8IaZvRIc/rzjkuWJv2tNAriZAcQm3WEUW9L43Zj0aMMC5orKlVRkWsUfiYZEbzO4OH71ACs1sOyI7I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYYRKIC0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYYRKIC0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCFEC4CEC4;
	Tue,  3 Sep 2024 18:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725387165;
	bh=WtdrVLhuX7QUBk5Q47adV0XQCHtkPufPeUe4K0O64aM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cYYRKIC0PbeYkpAoBfKETGfYGQ0LkNUp+ev/UcyIb9LpQmDreWObr9PnkNt+sy9PT
	 jzj+cqp4CujQcDOtRQbvAwui8NF6oUgteIozgzxQHaBTAsbvuEGeoUshhrxRnuND4B
	 ILgNTkyZmyuIrf6zdsLpZSxiF9QIHpQ6ktOuD0i1OCJGzXW13d8mv1gIvY1xEeOlEX
	 taDPcHxKO/cqwE6A0avt38rWJjeny0ubHRxtKFupn+SYRMFkU38QoCWi5CP85Xhvvk
	 DC8gLjsJYTroOTvJF3nZ8tL9QV1xD/gStbSTKKkiuFz11gX0FCKA0Rgl5G3r6MfCbH
	 nW9NVgsYqYYow==
Date: Tue, 3 Sep 2024 19:12:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	application@irondevice.com
Subject: Re: [PATCH v2 1/3] ASoC: sma1307: Add driver for Iron Device SMA1307
Message-ID: <51e05109-049f-4efa-b923-60943fe82777@sirena.org.uk>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-2-kiseok.jo@irondevice.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LRv0xbwjrHfLtCHo"
Content-Disposition: inline
In-Reply-To: <20240903054435.2659-2-kiseok.jo@irondevice.com>
X-Cookie: Words must be weighed, not counted.


--LRv0xbwjrHfLtCHo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2024 at 02:44:33PM +0900, Kiseok Jo wrote:

This looks basically fine, there's some mostly minor or stylistic things
below but nothing too major.

> +static int sma1307_regmap_write(struct sma1307_priv *sma1307,
> +				unsigned int reg, unsigned int val)
> +{
> +	int ret = 0;
> +	int cnt = sma1307->retry_cnt;
> +
> +	while (cnt--) {
> +		ret = regmap_write(sma1307->regmap, reg, val);
> +		if (ret == 0)
> +			break;
> +	}

If the hardware is actually stable we probably shouldn't bother with
these wrappers.  If they really are needed then we might want to
consider having regmap support doing retries.

> +	if (sma1307->force_mute_status == val)
> +		change = false;
> +	else {
> +		change = true;
> +		sma1307->force_mute_status = val;
> +	}

If one side of the if has {} both sides should.

> +	} else {
> +		dev_err(sma1307->dev, "%s: Invalid Control ID - %s\n",
> +			__func__, kcontrol->id.name);
> +		return -EINVAL;
> +	}

We shouldn't log errors that userspace can easily trigger like this, it
lets people DoS the logs - just return the error code (a bunch of the
other controls have this).

> +static int sma1307_reset_put(struct snd_kcontrol *kcontrol,
> +			     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +	    snd_soc_kcontrol_component(kcontrol);
> +	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
> +	bool val = (bool)ucontrol->value.integer.value[0];
> +
> +	if (sma1307->reset == val)
> +		return false;
> +
> +	sma1307->reset = val;
> +	if (ucontrol->value.integer.value[0] != 0
> +	    && ucontrol->value.integer.value[0] != 1) {
> +		dev_err(sma1307->dev, "%s: Invalid value\n", __func__);
> +		return false;
> +	}

You probably don't need to store a value here, you can just always read
0 for the control.  It's how other similar one shot controls work IIRC.

> +	sma1307_regmap_update_bits(sma1307, SMA1307_00_SYSTEM_CTRL,
> +				   SMA1307_RESET_MASK, SMA1307_RESET_ON);
> +	sma1307_reset(component);

This should really generate a change notification for all the controls
with non-default values (or all the controls would be easier and
probably fine, it's not like this is going to be a particularly pretty
process for userspace whatever happens).  snd_ctl_notify() does this.

It'd also be good to have a comment about why we've got this.

> +static int sma1307_dapm_amp_enable_put(struct snd_kcontrol *kcontrol,
> +				       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_dapm_context *dapm =
> +	    snd_soc_dapm_kcontrol_dapm(kcontrol);
> +	struct sma1307_priv *sma1307 =
> +	    snd_soc_component_get_drvdata(dapm->component);
> +	int val = (int)ucontrol->value.integer.value[0];
> +	bool change;
> +
> +	if ((val < 0) || (val > 1)) {
> +		dev_err(sma1307->dev, "%s: Out of range\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	if (sma1307->dapm_amp_en != val) {
> +		change = true;
> +		sma1307->dapm_amp_en = val;

I didn't manage to find what reads this value - do we need this control
at all, I'm not clear what it does?  If it's for stopping the amp from
coming on the normal approach is for the board to register a
_PIN_SWITCH() DAPM control attached to whatever the end output is for
the path, that will cause DAPM to not power anything in the output path
up.

A similar thing is true for at least the binary_mode control, I can't
see where the written value is read.

> +static void sma1307_check_fault_worker(struct work_struct *work)
> +{

> +	ret = sma1307_regmap_read(sma1307, SMA1307_FA_STATUS1, &status1_val);
> +	if (ret != 0) {
> +		dev_err(sma1307->dev,
> +			"%s: failed to read SMA1307_FA_STATUS1 : %d\n",
> +			__func__, ret);
> +		return;
> +	}
> +
> +	ret = sma1307_regmap_read(sma1307, SMA1307_FB_STATUS2, &status2_val);
> +	if (ret != 0) {
> +		dev_err(sma1307->dev,
> +			"%s: failed to read SMA1307_FB_STATUS2 : %d\n",
> +			__func__, ret);
> +		return;
> +	}

If we manage to read one of the registers should we perhaps soldier on
and try to report any errors it shows?  Probably a bit academic.

> +	if (~status1_val & SMA1307_OT1_OK_STATUS) {
> +		dev_crit(sma1307->dev,
> +			 "%s: OT1(Over Temperature Level 1)\n", __func__);
> +		if (sma1307->sw_ot1_prot) {
> +			/* Volume control (Current Volume -3dB) */
> +			if ((sma1307->cur_vol + 6) <= 0xFA)
> +				sma1307_regmap_write(sma1307,
> +						     SMA1307_0A_SPK_VOL,
> +						     sma1307->cur_vol + 6);
> +		}
> +		sma1307->tsdw_cnt++;

This is changing a user visible control so it should really generate an
event, although given that it should never happen it's not the end of
the world.  Given that a lot of other speaker drivers have a similar
setup with warning and critical temperature alerts I actually wonder if
we should consider factoring this out as a helper other things can use,
that's definitely a separate thing though and you don't need to do it
right now.

> +static DEVICE_ATTR_RW(check_fault_period);

Any reason the fault stuff isn't an ALSA control?

> +static const struct regmap_config sma_i2c_regmap = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +
> +	.max_register = SMA1307_FF_DEVICE_INDEX,
> +	.readable_reg = sma1307_readable_register,
> +	.writeable_reg = sma1307_writeable_register,
> +	.volatile_reg = sma1307_volatile_register,
> +
> +	.cache_type = REGCACHE_NONE,

_NONE is the default, although given that you've described the volatile
registers I don't see why you wouldn't just enable _MAPLE.  There's
regcache_drop_region() which can be used to throw away cached values
during reset if you want to do that.  Most drivers use a cache to help
make suspend/resume easier to implement - if the device looses power you
can just write the cache contents back to it to restore most userspace
visible things.

Not doing a cache (or suspend/resume) is also OK though, it can always
be implemented when needed.

> +++ b/sound/soc/codecs/sma1307.h
> @@ -0,0 +1,454 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + * sma1307.h -- sma1307 ALSA SoC Audio driver
> + *
> + * r005,
> + *
> + * Copyright 2023 Iron Device Corporation

2024 now!

--LRv0xbwjrHfLtCHo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbXUZcACgkQJNaLcl1U
h9CzIQf+Ji9zGTJET0wedIKT9B8Otdn4R1QZjLksm9TywNQGsBi2nvw4lJMRgdUu
wtuG013UE2v3QR0R0RWXxKnFkkmMJgh++av9IfG9EG9ffi4Fz6LwBCgYcwhwgQeV
Xh/VYpeivVjMWz6Kzy0xo/7K/uj+JYmc/WW0ARtt8MwkkzKAUrc1PdYU0e70gYUG
eJa6Yf89C8VrfqGN/uQxKXgrJGd9DfGPqzDeoYIucgN0O0Gxs0z3RoKcrn1qDWum
uIRvam4KIDqcncCyRfKKIFmpDYE1EH64jvMej+vojhDLk3GziB03lxvAuxHa/KlK
Ql/ZdjGsnzSywYQdD2KVqB57+T0ScQ==
=yskV
-----END PGP SIGNATURE-----

--LRv0xbwjrHfLtCHo--
