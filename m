Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383448;
	b=Mi1l1JOfPduYFrz2oiCYGWYH7VsRVHuT8IUrBrP1JGLV9mgfFwW9eUByzaTbT85dRdA7
	 v2p2KZpRyzJjicwcp7GqcCNAxYAJoKVGJhO2ICX26PLuOO2jLpf70J59IX5CvaUQUkhHm
	 rYeOuaFpG/NfV6kHhDig+S5ggTiOAmOE6PtsU5FQH/poRgA6+px83B/k+dPwxtl/ztuQg
	 oq6rclXOixPOHJNRlZ1ItJkSylxcCt9KuNJKPpmDAW4dD7tWMjTM0HGRf5RgWs2UlD0GI
	 ZEUFZLmTeb+rK4dkhQ8g/axhhJNgFXQLb8LZ47V+0Asi3cv7C+XCws8aBj4zZpJ1nTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383448;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jPTw1p+RhLXRLGuicLUzFHxnghVDjblJBIkxh6Ln/fY=;
	b=MMwyGDWa8D9AD27//g4f66889gUkbsbw7gejHK90tIhGG5/x9fjlAEpjZa0PE9nlnExa
	 /C980vhb1cMGVJldpqP0FkJUO8erqpZEOUXpedspvzboDHLEiMQaYTsZdzHBavbXCWEml
	 Ufrl5GB5UulDayyWLeUPOCMNztD4TNClYSNXwHyzYyx8HGWZxuTmIkYtFiPnDF64BjUql
	 RZLL4SzEk0tiv69daWLxsIdaRAfzMEUC+fJNW3wjejqRVNNHtu3Maj5ru2zZKEHaFW04H
	 mSPZuh+LFcS0e+fhYu7W1gd+35egCBV833PTdFKBnmjwCnNaIW0AHbDJ68cH1mPztmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U4iycJeg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74096606A31A
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 18:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U4iycJeg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305BA1F000C1;
	Fri, 30 Oct 2026 18:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793383448;
	bh=jPTw1p+RhLXRLGuicLUzFHxnghVDjblJBIkxh6Ln/fY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U4iycJeg2pN6WXA2lAZH4LlLZkc9yQdEd3VmJGMvnmrkKemjqdCpYLrdRq2rnE6yD
	 BzljsWZbJYepZ0Z8sG73ngjbMh3TmacicaQZM6F+kZzRdH6jmDQRFRmpum1u0yg8Ex
	 /v/7YrHgoegNoAMr81jZXAU0JmePu04KLIa3XpvViebl0Ch55snlMYNnsW4ypdbDdd
	 +icpCLEPokROElbCBS3q/ti0R6GzNUlSz5ePEiCA5jP/iapXiO0wi8Qgg2DithdmNJ
	 u8FbyPUy7/6k6ncQ2RhlZlzqDAo7sAdvxI7oo5Fetz8jMmlKSBYOu+v9sdUjPx9Vxn
	 DHEVZspIWKyqQ==
Message-ID: <sashiko-outbox-191391@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] ASoC: rt5668: cancel delayed works on component
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261030174837.1839402-2-tristan@talencesecurity.com>
References: <20261030174837.1839402-1-tristan@talencesecurity.com>
 <20261030174837.1839402-2-tristan@talencesecurity.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 18:04:07 +0000
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
- [High] ASoC: rt5668: uncancelled delayed work on I2C unbind in rt5668_rem=
ove()
- [High] ASoC: rt5668: stale jack and regcache state across rebind in rt566=
8_remove()
--

commit 17edcee2252c0f564a19636e40414b1293748590
Author: Tristan Madani <tristmd@gmail.com>

ASoC: rt5668: cancel delayed works on component removal

This commit disables the codec IRQ and cancels the jack_detect_work and
jd_check_work delayed works in rt5668_remove(), and re-enables the IRQ in
rt5668_probe() when a sound card rebinds.

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

[Severity: High]
As reported by Sashiko on v2 [1], what happens if the I2C device is unbound
when no ASoC sound card is bound to the component, or if
devm_snd_soc_register_component() fails in rt5668_i2c_probe()?

In rt5668_i2c_probe(), struct rt5668_priv is allocated via devm_kzalloc(),
rt5668->jack_detect_work and rt5668->jd_check_work are initialized, and
i2c->irq is immediately requested and enabled via devm_request_threaded_irq=
()
before any sound card binds:

sound/soc/codecs/rt5668.c:rt5668_i2c_probe() {
	...
	INIT_DELAYED_WORK(&rt5668->jack_detect_work,
				rt5668_jack_detect_handler);
	INIT_DELAYED_WORK(&rt5668->jd_check_work,
				rt5668_jd_check_handler);

	mutex_init(&rt5668->calibrate_mutex);

	if (i2c->irq) {
		ret =3D devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
			rt5668_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
			| IRQF_ONESHOT, "rt5668", rt5668);
		if (ret)
			dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
		else
			rt5668->irq_acquired =3D true;
	}

	return devm_snd_soc_register_component(&i2c->dev, &soc_component_dev_rt566=
8,
			rt5668_dai, ARRAY_SIZE(rt5668_dai));
}

If i2c->irq fires before a sound card is bound or instantiated, rt5668_irq()
queues rt5668->jack_detect_work, and rt5668_jack_detect_handler() continuou=
sly
re-arms itself every 15 ms:

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

However, rt5668_remove() is the snd_soc_component_driver.remove callback, a=
nd
the ASoC core only invokes it when a card was bound to the component:

devm_component_release()
  -> snd_soc_unregister_component_by_driver()
    -> snd_soc_del_component_unlocked()
      -> if (card) snd_soc_unbind_card(card)
        -> soc_cleanup_card_resources()
          -> snd_soc_dapm_shutdown() / snd_soc_component_remove()

Because rt5668_i2c_driver has no .remove callback and registers no devm act=
ion
to disable the IRQ and cancel the delayed works (and rt5668_i2c_shutdown()
also resets the codec without stopping them), won't unbinding the I2C device
without an instantiated card cause devres to free struct rt5668_priv while
rt5668->jack_detect_work remains pending and self-rearming?

> =20
>  	rt5668_reset(rt5668->regmap);
>  }

[Severity: High]
As reported by Sashiko on v4 [2], since rt5668_probe() now calls enable_irq=
()
to support sound card unbind/rebind cycles, does rt5668_remove() leave the
regmap cache and jack state out of sync with the hardware after calling
rt5668_reset()?

In rt5668_remove(), rt5668_reset(rt5668->regmap) writes 0 to the volatile
RT5668_RESET register, resetting all codec registers in hardware to power-on
defaults without resetting or dirtying the REGCACHE_MAPLE regmap cache and
without clearing rt5668->hs_jack, rt5668->jack_type, or rt5668->component.

When a sound card subsequently binds again, can this cause the following
issues?

1. If the previous card's struct snd_soc_jack was freed when that card unbo=
und
   without clearing rt5668->hs_jack, rt5668->hs_jack is left dangling. When
   rt5668_probe() immediately calls enable_irq(), if an interrupt triggers
   rt5668_jack_detect_handler() before a new jack is registered (or if the =
new
   card does not call snd_soc_component_set_jack()), snd_soc_jack_report() =
is
   called with the dangling rt5668->hs_jack pointer.

2. When the newly bound card calls rt5668_set_jack_detect(), the
   snd_soc_component_update_bits() and regmap_update_bits() calls on cached
   non-volatile registers (RT5668_CBJ_CTRL_3, RT5668_SAR_IL_CMD_1,
   RT5668_GPIO_CTRL_1, RT5668_RC_CLK_CTRL, RT5668_PWR_ANLG_2, and
   RT5668_IRQ_CTRL_2) see those bits already set in the stale regmap cache
   from the first bind and skip writing them to the reset hardware, leaving
   the physical IRQ output pin and jack detection disabled in the codec.

3. If a headset was plugged in when the card unbound (rt5668->jack_type !=
=3D 0),
   rt5668_jack_detect_handler() on rebind sees rt5668->jack_type !=3D 0 and
   skips initial headset detection via rt5668_headset_detect():

sound/soc/codecs/rt5668.c:rt5668_jack_detect_handler() {
	...
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

[1] https://lore.kernel.org/r/sashiko-outbox-190014@kernel.org
[2] https://lore.kernel.org/r/20261030170416.3561618-2-tristan@talencesecur=
ity.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030174837.1839=
402-1-tristan@talencesecurity.com?part=3D1
