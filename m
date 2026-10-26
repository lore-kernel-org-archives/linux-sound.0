Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017316;
	b=26wiFX9Q67012R/dNJX3JJH/2xq6PlxDhI2vSzU7vFTENNjnLZyK5G5o/nA+PIHnj+9v
	 WvL/CnEmZ8yLqjkCee3MppcY01mt5K2Kq3bP6pnxCiWOZHkVaJeMTnfCYGrlCoa53g/SE
	 3oXv6kmcDmnlA85C0XYUGLTbAE20WeLPogSSs5b11r7P9nQF3kANvUT9j97/H4XvaO/y/
	 wLTJkOi9xstihAiv+L+NqLJsiQWffHk9tZpnMrQ8XwKLBGCvDq0nzl6RizH39PqCtP8M4
	 3KRgkQ8jAeCwkOqAKio2ZwJxD6P+62Q8oSBrqEo+WZDfkbpMljJY0yEp7fD3+5VqskQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017316;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9HXtfC4hYpYRrXAhWrdoZwXLL81i4pSVwe+f8IxVGi0=;
	b=24/kOolHsk2wARWJQfVpGsKpTVLtDrXtDojEySFGJ0sgXpScWvmVamvh9eS7QJkM2yjC
	 HgiW1lymAMpeya5XQLvLVnZ7LkUE4+XfboVFAysSa693T5xRsL+tooFA3tGk7T1z56gT1
	 fE3rfxPiVrnRIRUz7WqHpMZhw2hqzY5HDU9JffwAQ2lzj33iXmlR5tZ5LrZ5UihRZCUxr
	 L38lZAJbLShedSNIrCh5osgqy1pqu2XLeFXswaNUO3zWOVKWmMRj164BhnWP/kaUc/vSg
	 IvVHvQ9+VKyiL4mJFYLBjir/s5JL7ktT3dHfOwMd692qY4zVJ2nuAO3dHMYSPLzuVBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OIozVqya;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB52606A31E
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 12:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OIozVqya
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9E31F01825;
	Mon, 26 Oct 2026 12:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793017316;
	bh=9HXtfC4hYpYRrXAhWrdoZwXLL81i4pSVwe+f8IxVGi0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OIozVqyaV4m8cWKyR2ivrvAoZ3ZQi8BFKCNkv5EYF2/blGuCtXiNQ/2mLsQ/FWRqZ
	 To8k7ZOil9lVTyadDqQDn3l8wDzRunI/iY9aeZWp9y5fgV44MPiErFqubug+ehEqR5
	 /COElg0bJ4hkLLshrj8xkb/c5v00HtYXkvX4C+8O3MWy5ekIvbw2WB976wySrhu7bD
	 u5Lo0yqBFCPM1jqLKef0lgjRzNgP01hULEWYHYp7U/j0ybgDbLuhz0nXyOtrybSqfe
	 waDbJSuqEG0hLvySgNgWvf9z5X2JAH1yc/6qX2MYRKC8BNEcEIAdNLDU6GQJNkOzHq
	 sEqfZwotSh6Rw==
Message-ID: <sashiko-outbox-185199@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] ASoC: rt5668: cancel pending delayed works on
 component remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261026112212.2519775-2-tristmd@gmail.com>
References: <20261026112212.2519775-1-tristmd@gmail.com>
 <20261026112212.2519775-2-tristmd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 12:21:55 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ASoC: rt5668: delayed works not cancelled on I2C unbind without a =
card
- [High] ASoC: rt5668: stale jack state and regcache desync on component re=
bind
--

commit fa6da49bfd9e751eff346b0d1417045a1c8e0f42
Author: Tristan Madani <tristan@talencesecurity.com>

ASoC: rt5668: cancel pending delayed works on component remove

This commit tracks IRQ acquisition in struct rt5668_priv, disables the IRQ =
and
cancels jack_detect_work and jd_check_work in rt5668_remove(), and re-enabl=
es
the IRQ in rt5668_probe() on component rebind.

> diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
> index cd6245d6b91af..0e20e09b5434e 100644
> --- a/sound/soc/codecs/rt5668.c
> +++ b/sound/soc/codecs/rt5668.c
> @@ -62,6 +62,8 @@ struct rt5668_priv {
>  	int pll_out;
> =20
>  	int jack_type;
> +	bool irq_acquired;
> +	bool irq_disabled;
>  };
> =20
>  static const struct reg_default rt5668_reg[] =3D {
> @@ -2213,6 +2215,12 @@ static int rt5668_set_bias_level(struct snd_soc_co=
mponent *component,
>  static int rt5668_probe(struct snd_soc_component *component)
>  {
>  	struct rt5668_priv *rt5668 =3D snd_soc_component_get_drvdata(component);
> +	struct i2c_client *i2c =3D to_i2c_client(component->dev);
> +
> +	if (rt5668->irq_disabled) {
> +		enable_irq(i2c->irq);
> +		rt5668->irq_disabled =3D false;
> +	}
> =20
>  	rt5668->component =3D component;
> =20
> @@ -2222,7 +2230,15 @@ static int rt5668_probe(struct snd_soc_component *=
component)
>  static void rt5668_remove(struct snd_soc_component *component)
>  {
>  	struct rt5668_priv *rt5668 =3D snd_soc_component_get_drvdata(component);
> +	struct i2c_client *i2c =3D to_i2c_client(component->dev);
> =20
> +	if (rt5668->irq_acquired) {
> +		disable_irq(i2c->irq);
> +		rt5668->irq_disabled =3D true;
> +	}
> +
> +	cancel_delayed_work_sync(&rt5668->jack_detect_work);
> +	cancel_delayed_work_sync(&rt5668->jd_check_work);
>  	rt5668_reset(rt5668->regmap);
>  }

[Severity: High]
When a sound card unbinds and later rebinds to this component, can stale ja=
ck
state and regcache desynchronization break jack detection or dereference a
dangling rt5668->hs_jack pointer?

First, rt5668_remove() does not clear rt5668->hs_jack, rt5668->jack_type, or
rt5668->component when the previous card is removed and frees its
struct snd_soc_jack. On rebind, rt5668_probe() calls enable_irq(i2c->irq)
before rt5668->component is updated and before the new card sets a jack (and
rt5668_set_jack_detect() also schedules jack_detect_work before assigning
rt5668->hs_jack). If an interrupt fires and rt5668_jack_detect_handler() ru=
ns
after card instantiation before or without a new jack being set,
snd_soc_jack_report(rt5668->hs_jack, ...) will dereference the dangling
rt5668->hs_jack pointer from the old card.

Second, if a headset was plugged in when the card was unbound
(rt5668->jack_type !=3D 0), rt5668_remove() resets the hardware without cle=
aring
rt5668->jack_type. On rebind with the jack still inserted,
rt5668_jack_detect_handler() sees rt5668->jack_type !=3D 0:

sound/soc/codecs/rt5668.c:rt5668_jack_detect_handler() {
	...
	if (!val) {
		/* jack in */
		if (rt5668->jack_type =3D=3D 0) {
			/* jack was out, report jack type */
			rt5668->jack_type =3D
				rt5668_headset_detect(rt5668->component, 1);
		} else {
			/* jack is already in, report button event */
			rt5668->jack_type =3D SND_JACK_HEADSET;
			btn_type =3D rt5668_button_detect(rt5668->component);
	...
}

and takes the button detection branch instead of calling
rt5668_headset_detect(rt5668->component, 1) to reinitialize the headset and
button detection hardware.

Third, rt5668_remove() calls rt5668_reset(rt5668->regmap), which resets all
hardware registers to power-on defaults, without resetting or marking dirty
the REGCACHE_MAPLE regmap cache. When rt5668_set_jack_detect() runs on the
next card bind:

sound/soc/codecs/rt5668.c:rt5668_set_jack_detect() {
	...
		snd_soc_component_update_bits(component, RT5668_CBJ_CTRL_3,
			RT5668_CBJ_IN_BUF_EN, RT5668_CBJ_IN_BUF_EN);
		snd_soc_component_update_bits(component, RT5668_SAR_IL_CMD_1,
			RT5668_SAR_POW_MASK, RT5668_SAR_POW_EN);
		regmap_update_bits(rt5668->regmap, RT5668_GPIO_CTRL_1,
			RT5668_GP1_PIN_MASK, RT5668_GP1_PIN_IRQ);
		regmap_update_bits(rt5668->regmap, RT5668_RC_CLK_CTRL,
				RT5668_POW_IRQ | RT5668_POW_JDH |
				RT5668_POW_ANA, RT5668_POW_IRQ |
				RT5668_POW_JDH | RT5668_POW_ANA);
		regmap_update_bits(rt5668->regmap, RT5668_PWR_ANLG_2,
			RT5668_PWR_JDH | RT5668_PWR_JDL,
			RT5668_PWR_JDH | RT5668_PWR_JDL);
		regmap_update_bits(rt5668->regmap, RT5668_IRQ_CTRL_2,
			RT5668_JD1_EN_MASK | RT5668_JD1_POL_MASK,
			RT5668_JD1_EN | RT5668_JD1_POL_NOR);
	...
}

these cached non-volatile register updates become no-ops because the softwa=
re
cache still holds the pre-reset bit values, leaving GPIO1 IRQ output
(RT5668_GP1_PIN_IRQ) and JD1 (RT5668_JD1_EN) disabled in hardware.

> @@ -2553,7 +2569,9 @@ static int rt5668_i2c_probe(struct i2c_client *i2c)
>  		ret =3D devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
>  			rt5668_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
>  			| IRQF_ONESHOT, "rt5668", rt5668);
> -		if (ret)
> +		if (!ret)
> +			rt5668->irq_acquired =3D true;
> +		else
>  			dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
> =20
>  	}

[Severity: High]
What happens if the I2C device is unbound while no ASoC sound card is bound
(or if devm_snd_soc_register_component() fails after the IRQ is requested)?

In rt5668_i2c_probe(), devm_request_threaded_irq() enables i2c->irq before
any card is bound. If an interrupt fires while rt5668->component is NULL or
before card instantiation (or if snd_soc_component_set_jack(component, NULL,
NULL) queues jack_detect_work during card teardown), rt5668_irq() schedules
rt5668->jack_detect_work, which then Rearms itself every 15 ms indefinitely:

sound/soc/codecs/rt5668.c:rt5668_jack_detect_handler() {
	...
	if (!rt5668->component ||
	    !snd_soc_card_is_instantiated(rt5668->component->card)) {
		/* card not yet ready, try later */
		mod_delayed_work(system_power_efficient_wq,
				 &rt5668->jack_detect_work, msecs_to_jiffies(15));
		return;
	}
	...
}

Because snd_soc_component_remove() only invokes component->driver->remove
when component->card is non-NULL:

sound/soc/soc-component.c:snd_soc_component_remove() {
	if (!component->card)
		return;

	if (probed && component->driver->remove)
		component->driver->remove(component);
	...
}

unbinding the I2C client when no card is bound skips rt5668_remove()
completely, and rt5668_i2c_driver has no .remove callback or devm cleanup
action to cancel jack_detect_work and jd_check_work before devres frees
struct rt5668_priv. Similarly, rt5668_i2c_shutdown() resets the codec witho=
ut
disabling the IRQ or cancelling the delayed works.

Should the delayed works also be cancelled (and the IRQ quiesced) on I2C
driver removal/devres release and shutdown, or via
devm_delayed_work_autocancel()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026112212.2519=
775-1-tristmd@gmail.com?part=3D1
