Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751CC361DBF;
	Wed,  1 Apr 2026 16:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775059683; cv=none; b=izLiJ/HCuwlDWKk4rwlrbRq+9RwFqu2VpJq8W9wDwvJehckEoKS5Juroo2zS8RemVxt36ztPmtrr1DjHU9d6TMOt1BaR/aDGjG/TRtmmS0UWdY8xl+F0JkXStHS00Lql+T9ahrlSlxWVIojCeLsODI6B+Z1mhH9DOEXj1yiFjec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775059683; c=relaxed/simple;
	bh=CAWqjT7a0ECle0p+cjJLfFVUz4QZKrWzh+L4muolz8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBmQjAxJnny/7V83Rl6cLvg/CrhE+GZ2HdhVfh05pQO57zKRBuukfVF8fz/xzzvysYMZnlkBtGWDazr41ZbXLt0E6+Ve+3Z8XjL3vfUv1DqrQN50wkVj56XniWoTuuy2Jyfrf1flbn1PvqkiORsWWtZM4XuCLZPhG1x7aYZCCQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYlcOAC2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYlcOAC2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD24C4CEF7;
	Wed,  1 Apr 2026 16:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775059683;
	bh=CAWqjT7a0ECle0p+cjJLfFVUz4QZKrWzh+L4muolz8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IYlcOAC2JmrabV6k0EQdev65ty7gp/D9x3bQKT5TdXg7Cd0Gy0QxJNiXK+zYhWq42
	 VKsMmrDPhE1djTENe2EAW0pSB/xWM31Hb/uTtYdwipRtxCgl48I9sP2JG/2o0w8RuF
	 RpbrhRZfeIhYvx+tarcltqdLUIw7IFTqYvkqL6cBL4l9l19gCR4SeCU5DS654vFYMS
	 Dms8ba5NVnK0NUF6WpgZMx7kBSrcPIWrb6KbyDe2/FOhRTDxij5WMLJscwG+gx4b/K
	 omEZW7lLI0J51CH0GmlVDDXB+XXanK/PvazJxkdpulYQFzjPGabj0It1T6BnL7b74d
	 N3F8XFQu+CsRA==
Date: Wed, 1 Apr 2026 17:07:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Sen Wang <sen@ti.com>
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	perex@perex.cz, tiwai@suse.com, shenghao-ding@ti.com,
	kevin-lu@ti.com, baojun.xu@ti.com, niranjan.hy@ti.com,
	l-badrinarayanan@ti.com, devarsht@ti.com, v-singh1@ti.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: codecs: Add TAS675x quad-channel audio
 amplifier driver
Message-ID: <8eb47e54-12e1-4f92-a488-09485df035c6@sirena.org.uk>
References: <20260401024210.28542-1-sen@ti.com>
 <20260401024210.28542-3-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6Krvfc3UkUAr2EV/"
Content-Disposition: inline
In-Reply-To: <20260401024210.28542-3-sen@ti.com>
X-Cookie: "Yo baby yo baby yo."


--6Krvfc3UkUAr2EV/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2026 at 09:42:07PM -0500, Sen Wang wrote:

> The TAS675x (TAS6754, TAS67524) are quad-channel, digital-input
> Class-D amplifiers with an integrated DSP, controlled over I2C.
> They support I2S and TDM serial audio interfaces.

> +static int tas675x_dapm_sleep_event(struct snd_soc_dapm_widget *widget,
> +				    struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
> +	int ret = 0;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		ret = pm_runtime_resume_and_get(component->dev);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		pm_runtime_mark_last_busy(component->dev);
> +		pm_runtime_put_autosuspend(component->dev);
> +		break;
> +	}
> +	return ret < 0 ? ret : 0;
> +}

I'm confused what's going on here, there's runtime PM management in the
ASoC core - isn't this just duplicating what's there?

> +static int tas675x_runtime_resume(struct device *dev)
> +{

> +       if (!to_i2c_client(dev)->irq)
> +               schedule_delayed_work(&tas->fault_check_work,
> +                                     msecs_to_jiffies(TAS675X_FAULT_CHECK_INTERVAL_MS));

This is the only place where we start the fault checking but runtime PM
can be disabled in configuration and we also start runtime PM in the
active state so potentially might never suspend and resume.  probe()
should kick off the work as well.

> +static int tas675x_init_device(struct tas675x_priv *tas)
> +{
> +	struct regmap *regmap = tas->regmap;
> +	unsigned int val;
> +	int ret, i;
> +
> +	/* Clear POR fault flag to prevent IRQ storm */
> +	regmap_read(regmap, TAS675X_POWER_FAULT_LATCHED_REG, &val);


> +static int tas675x_i2c_probe(struct i2c_client *client)
> +{

> +	if (client->irq) {
> +		ret = devm_request_threaded_irq(tas->dev, client->irq, NULL,
> +						tas675x_irq_handler,
> +						IRQF_ONESHOT | IRQF_TRIGGER_FALLING,
> +						"tas675x-fault", tas);
> +		if (ret)
> +			return dev_err_probe(tas->dev, ret, "Failed to request IRQ\n");
> +	}

We request the interrupt here...

> +	INIT_DELAYED_WORK(&tas->fault_check_work, tas675x_fault_check_work);

> +	ret = tas675x_power_on(tas);
> +	if (ret)
> +		return ret;

...before we do _power_on() which is what calls _hw_init() and clears any
faults that were latched in the registers.  This means that if there is
something there we'll handle it through the normal interrupt handling
flow and the rest won't buy is much, probably better to reorder the init
vs the interrupt request.

--6Krvfc3UkUAr2EV/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnNQtwACgkQJNaLcl1U
h9DEZgf+JmeogiHBNBqjFfUuOhJrTON5+mFF7hOVQfKBu9BY+B38erPJbUHdDG09
SieFXCx3Unz3J/GpJpszArF4KH7B9fBfpCkCGzhlhs3tPRFVFG4mO+L9OX+DfDG5
qzonRXx6T+gIhIewRMtwCiAJJnXR0Gw/qqtLJGhQQfqQFpXETK/Pwrq1eipF7CWh
aYcRkZd4lQjdxdknUGP/KTC/govAq+0KS5XYDkQkX+zKxsOw2tBsNz2JgB4Cdj4v
rkf4AM4G3g51yIvmjerUjlgxK8WVOm6w96ThZVN5hZXr5B0qaOiIuEAs8DV88FDi
V6DR47In130joJMHqrfZFIRZBaR9Hw==
=hPV1
-----END PGP SIGNATURE-----

--6Krvfc3UkUAr2EV/--
