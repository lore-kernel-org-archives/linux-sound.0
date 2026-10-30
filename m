Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380981;
	b=I8RtKGTB+8y4Ux67ckej15Z3eQHMwiXoiT4FmJWEFAfgnlhbayOCNKOP3MWQcvC6bukC
	 2sHnUj97ZK7m3EcD/+bOJ5u0EzlFtbFBVdi8r1P7GuN7xmCPQEiskNlZGGlLUP1dBNCaV
	 oC3h23oY72aqX987aFnLBbqBKk1fGSQwj4s7eZpSvzMEx2O99eriKOZOtSmAt2Yt6fR7v
	 zzmVf+rsKj8h2edskrmwq+repe5BkSXTLmYxLhSDJHEo2jetS+h39YEWRDAn2rx4h42VL
	 nnPwDrpWHQtFEVlahEY9QdIM4uRPUdVcXSU3uqM5DRzROW0r5om49NVkpL3HJlCWgPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380981;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6s/x5RUUHLc9xLRJWB1JON3WfC7q+XWyRogt0y7gr8A=;
	b=Z8DO8tbzqABSf0sbU5ZszieoREJU1Lby1TyAqUYU7nA60aQ91m/FIBfO2kg5HCfoMLRE
	 qrxoI+MX1hqi9TWSZOG60HQd4xlH8Xpfc2jlleqYQ+Quo2pp8F5KjTK8R7m2RIXf0waDo
	 30GGZv1bR47GEhyRh33tVFoXG1j9J1SwK7ipi/CvdqjhgzGD+/yYtkL6fzidgnDFl1bG7
	 NELGOffPyrWwfCV581z8vNsuBPiXpz9f1+xR6vh0DM+f2DyKjzS95OJ1XhcZdjtQ3G44T
	 N5CTD2XWxj4sLwk4NP8oAv7croI3BB1ju4mE6CfcVndgVhkSj/1+zdkns/dZ+YqydLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZLdKFoeO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7105606A31D
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 17:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZLdKFoeO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 665301F000C1;
	Fri, 30 Oct 2026 17:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793380980;
	bh=6s/x5RUUHLc9xLRJWB1JON3WfC7q+XWyRogt0y7gr8A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZLdKFoeOkLBLiml9cdx831dBPqDKkzR6dNpwGSeeylp272JFC8es+qDe4UtgDdaa5
	 g+3pWP3/hJuvd7Y9QlgQl6tUhUPT5XLSRu5tPNwyfHbCrltvq8Vid4JplkpoeFFMcD
	 pvfKFcCjZn+NRneA/dp/C+lU/ZLpbJeVkZh1V/8jcGFglvpp8H/oVbtxVYB3jGay1H
	 qP0ChbpAN//Z2DYuea8xPiieJYwuBcbgH1N/T3CbERY3ZazGEkDTFY2r6XdtO/yluG
	 wNAzHURJMKtkGAIIeMeiSmHpEcI6WHRJHVFV9oiipLbS5C93EfyIwlakJSnjWRXrzt
	 53DoHpeU+i1Gg==
Message-ID: <sashiko-outbox-191331@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] ASoC: rt5668: cancel delayed works on component
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261030170416.3561618-2-tristan@talencesecurity.com>
References: <20261030170416.3561618-1-tristan@talencesecurity.com>
 <20261030170416.3561618-2-tristan@talencesecurity.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 17:22:59 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] ASoC: rt5668: uncancelled delayed work on I2C unbind in rt5668_rem=
ove()
- [High] ASoC: rt5668: stale jack and regcache state across rebind in rt566=
8_remove()
- [Low] ASoC: rt5668: invalid commit SHA in Fixes tag
--

commit 9008f92a159bf733c1de1c91549b388f6f8c95c5
Author: Tristan Madani <tristmd@gmail.com>

ASoC: rt5668: cancel delayed works on component removal

This patch tracks IRQ acquisition in rt5668_i2c_probe(), disables the IRQ a=
nd
cancels pending jack detection delayed works in rt5668_remove(), and
re-enables the IRQ in rt5668_probe() when a sound card rebinds.

>     ASoC: rt5668: cancel delayed works on component removal
>    =20
>     rt5668_remove() does not disable the IRQ or cancel the pending
>     jack_detect_work and jd_check_work delayed works.  If the component is
>     unbound while work is pending, the handlers access freed memory.
>    =20
>     Track IRQ acquisition in rt5668_i2c_probe() via an irq_acquired flag.
>     In rt5668_remove(), disable the IRQ (if acquired) and cancel both
>     delayed works before resetting the codec.  Re-enable the IRQ in
>     rt5668_probe() when a sound card rebinds to prevent permanent IRQ
>     silencing across card unbind/rebind cycles.
>    =20
>     Fixes: e13da14e8543 ("ASoC: add rt5668 codec driver")
>     Cc: stable@vger.kernel.org
>     Signed-off-by: Tristan Madani <tristan@talencesecurity.com>

[Severity: Low]
Does commit e13da14e8543 ("ASoC: add rt5668 codec driver") exist in the git
tree? It looks like sound/soc/codecs/rt5668.c was introduced by:

  Fixes: d59fb2856223 ("ASoC: rt5668: add rt5668B codec driver")

> diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
> index cd6245d6b91af..29d70802a046a 100644
> --- a/sound/soc/codecs/rt5668.c
> +++ b/sound/soc/codecs/rt5668.c

[ ... ]

> @@ -2216,12 +2219,26 @@ static int rt5668_probe(struct snd_soc_component =
*component)
> =20
>  	rt5668->component =3D component;
> =20
> +	if (rt5668->irq_disabled) {
> +		enable_irq(to_i2c_client(component->dev)->irq);
> +		rt5668->irq_disabled =3D false;
> +	}
> +
>  	return 0;
>  }
> =20
>  static void rt5668_remove(struct snd_soc_component *component)
>  {
>  	struct rt5668_priv *rt5668 =3D snd_soc_component_get_drvdata(component);
> +	struct i2c_client *i2c =3D to_i2c_client(component->dev);
> +
> +	if (rt5668->irq_acquired) {
> +		disable_irq(i2c->irq);
> +		rt5668->irq_disabled =3D true;
> +	}
> +
> +	cancel_delayed_work_sync(&rt5668->jack_detect_work);
> +	cancel_delayed_work_sync(&rt5668->jd_check_work);
> =20
>  	rt5668_reset(rt5668->regmap);
>  }

[Severity: High]
As reported by Sashiko on v2 [1], if the I2C device is unbound while no sou=
nd
card is bound, can rt5668_jack_detect_handler() still run after devres frees
rt5668?

In rt5668_i2c_probe(), the driver initializes jack_detect_work and
jd_check_work and immediately requests and enables i2c->irq before
devm_snd_soc_register_component() and before any sound card binds:

sound/soc/codecs/rt5668.c:rt5668_i2c_probe() {
	INIT_DELAYED_WORK(&rt5668->jack_detect_work,
				rt5668_jack_detect_handler);
	INIT_DELAYED_WORK(&rt5668->jd_check_work,
				rt5668_jd_check_handler);
	...
	if (i2c->irq) {
		ret =3D devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
			rt5668_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
			| IRQF_ONESHOT, "rt5668", rt5668);
}

If an interrupt fires while no card is bound or instantiated (or if
devm_snd_soc_register_component() fails), rt5668_irq() queues
rt5668->jack_detect_work, which re-arms itself every 15 ms:

sound/soc/codecs/rt5668.c:rt5668_jack_detect_handler() {
	if (!rt5668->component ||
	    !snd_soc_card_is_instantiated(rt5668->component->card)) {
		/* card not yet ready, try later */
		mod_delayed_work(system_power_efficient_wq,
				 &rt5668->jack_detect_work, msecs_to_jiffies(15));
		return;
	}
}

Because rt5668_remove() is the snd_soc_component_driver.remove callback and
rt5668_i2c_driver has no .remove callback or devm cleanup action, unbinding
the I2C device when component->card is NULL goes through:

devm_component_release()
  -> snd_soc_unregister_component_by_driver()
    -> snd_soc_del_component_unlocked()

which skips snd_soc_unbind_card() and snd_soc_component_remove() when card =
is
NULL. As a result, rt5668_remove() is never called on I2C unbind without a
bound card, and devres frees the IRQ and struct rt5668_priv while
rt5668->jack_detect_work remains pending and self-rearming.

Should the delayed work cancellation (or a devm action / i2c_driver.remove
callback) also run on I2C teardown?

[Severity: High]
Also in rt5668_probe() and rt5668_remove(), when re-enabling the IRQ across=
 a
sound card unbind and rebind cycle, does rt5668_remove() leave stale state =
in
rt5668->hs_jack, rt5668->jack_type, and the REGCACHE_MAPLE regmap cache aft=
er
calling rt5668_reset()?

Specifically, when rt5668_remove() calls rt5668_reset(rt5668->regmap), it
resets the hardware registers to power-on defaults via the volatile
RT5668_RESET register without resetting or marking dirty the regmap cache, =
and
without clearing rt5668->hs_jack, rt5668->jack_type, or rt5668->component:

1. When the previous card unbound, soc_cleanup_card_resources() freed its
   snd_jack. If the machine driver allocated struct snd_soc_jack with devm =
on
   the card device without calling snd_soc_component_set_jack(component, NU=
LL,
   NULL) on teardown, rt5668->hs_jack is left dangling. When rt5668_probe()
   calls enable_irq() on rebind before set_jack updates hs_jack (or if the =
new
   card does not call set_jack), an interrupt will cause
   rt5668_jack_detect_handler() to pass the freed rt5668->hs_jack pointer to
   snd_soc_jack_report().

2. When the rebound card calls rt5668_set_jack_detect(), regmap_update_bits=
()
   and snd_soc_component_update_bits() on non-volatile cached registers such
   as RT5668_CBJ_CTRL_3, RT5668_SAR_IL_CMD_1, RT5668_GPIO_CTRL_1,
   RT5668_RC_CLK_CTRL, RT5668_PWR_ANLG_2, and RT5668_IRQ_CTRL_2:

sound/soc/codecs/rt5668.c:rt5668_set_jack_detect() {
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
}

   will see those bits already set in the regmap cache from the first bind =
and
   skip writing them to the reset hardware, leaving the codec IRQ output pin
   and jack detection disabled in hardware.

3. If a headset was plugged in when the card unbound (rt5668->jack_type !=
=3D 0),
   on rebind rt5668_jack_detect_handler() will see rt5668->jack_type !=3D 0=
 and
   skip initial headset detection via rt5668_headset_detect(rt5668->compone=
nt,
   1):

sound/soc/codecs/rt5668.c:rt5668_jack_detect_handler() {
		if (rt5668->jack_type =3D=3D 0) {
			/* jack was out, report jack type */
			rt5668->jack_type =3D
				rt5668_headset_detect(rt5668->component, 1);
		} else {
			/* jack is already in, report button event */
			rt5668->jack_type =3D SND_JACK_HEADSET;
			btn_type =3D rt5668_button_detect(rt5668->component);
}

[1] https://lore.kernel.org/r/sashiko-outbox-190014@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030170416.3561=
618-1-tristan@talencesecurity.com?part=3D1
