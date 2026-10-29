Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793310976;
	b=4Uooq3WvOR19riGOiW3Kq7jP09YoD+QNUl0gE8eFDgf7IRIeWkQxbeurIwgzYZy93MkO
	 U2ybCTeRE6frmFEe4aMwnztE8ypFoTz/Py4xo/qJ9fVoLcv6DhkW8X0jdZj7+h6ciNcwF
	 F7NUD5ILFDuNbozTFciqNxk+XgMV/O/jUaRDXdgbzNgL2giuLN429jJ7CciVjXJ2WDffl
	 s9Bm1FqAlhvEMWWgbqaz58TkzouvK0/sUOCfe8YRuDTXcr2DYpQc1Ozt1vBjZuIJ1TRBr
	 BLAsEO5OMoPkrp4O3oS2MTXdW6titxF7837tdODEbUF8Kx0nqPLag3Nn8M4T5MXCRwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793310976;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xY7j9sbc0lC9bz4RFu9Rv6KnLeL6UKOPEKyhimqlohE=;
	b=zSfoo1BkYEtbapVHRYDO3b63tXg8RL4HX7S8FAkIVlgFgIUwYCSIg/YHDHBjE89FMVay
	 lwUn2W3eg20Z4XfC1BqdKdnaxzzHi+aQs7UgW5CfcY0wbn6Z+QvYgT08rqQC2b4NhriyE
	 rRnDxMyqJ73GONgHCSNmy6Tur4vsrYu2ygj2B0fKArzcwzQRpVKtuIZ0+1UWkXMhdMB2V
	 F+hD91+EzFwW0LJhDfnq1oK9WBZX2YHvLozUAVkERn+d9AYVNs9JT6mLN/uw3rxIJGous
	 4cf715AS2TbMbDAmjeM7IVgHoLuFfc1fU93n1423jXS7kisHPSbAXGOsdjg6k/xVgIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P792ad0X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6F6606A31A
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 21:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P792ad0X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833B31F01816;
	Thu, 29 Oct 2026 21:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793310975;
	bh=xY7j9sbc0lC9bz4RFu9Rv6KnLeL6UKOPEKyhimqlohE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P792ad0XI2JMyYceJ+Jx62ZAHMbf/2f3VOSJhCTxwPF8XEaVWNVqPKccB8wuFKFxe
	 EIxTp99oNvzA/P3+q9HKBSg7X5BIioK5kM+34SdCGmXWELC8SfHSlkb130v63FnIv7
	 vje4L/PSjViTa0JFjAcjM6p27yDt8gmGKs1uesH9QFhWO11fGk865/ZNlOuyeGYFfc
	 7rJgSnAxDCK/q+WCILooW508xDqBWthWBlcLgcLwZZag0WJxKcN4tdgvxXqufo/0r+
	 MSXKr8yPEd0XOGJ8T+nYN6+H8vdjgXFg3LGwpxXKYEvKcMSF96NbSzj2ZIaV1ugC16
	 cuWqn6QwijjJQ==
Message-ID: <sashiko-outbox-190025@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: rt5659: cancel jack_detect_work on
 component removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261029212504.2997364-3-tristmd@gmail.com>
References: <20261029212504.2997364-1-tristmd@gmail.com>
 <20261029212504.2997364-3-tristmd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 21:56:13 +0000
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
- [High] ASoC: rt5659: jack_detect_work not cancelled on I2C unbind without=
 card
- [High] ASoC: rt5659: broken jack detect state and dangling hs_jack in rt5=
659_probe()
--

commit 58a577f04ded4350869b1fdee73beb3b1dbfecaa
Author: Tristan Madani <tristmd@gmail.com>

ASoC: rt5659: cancel jack_detect_work on component removal

This commit tracks IRQ acquisition and jack_detect_work initialization so
that rt5659_remove() can disable the IRQ and synchronously cancel the
delayed work before resetting the codec. It also re-enables the IRQ in
rt5659_probe() when a sound card rebinds to the component.

> diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
> index af8051fa69f89..68f7d5673e190 100644
> --- a/sound/soc/codecs/rt5659.c
> +++ b/sound/soc/codecs/rt5659.c
> @@ -3667,6 +3667,11 @@ static int rt5659_probe(struct snd_soc_component *=
component)
> =20
>  	rt5659->component =3D component;
> =20
> +	if (rt5659->irq_disabled) {
> +		enable_irq(to_i2c_client(component->dev)->irq);
> +		rt5659->irq_disabled =3D false;
> +	}

[Severity: High]
Does re-enabling the IRQ here in rt5659_probe() in sound/soc/codecs/rt5659.c
actually restore jack detection after a card unbind/rebind, or can it also
trigger a use-after-free on rt5659->hs_jack?

At the end of rt5659_remove(), regmap_write(rt5659->regmap, RT5659_RESET, 0)
resets all codec hardware registers to their power-on defaults. This wipes
out the GPIO1 IRQ pin mux (RT5659_GP1_PIN_IRQ in RT5659_GPIO_CTRL_1) and all
jack-detection and IRQ control registers (RT5659_EJD_CTRL_1,
RT5659_RC_CLK_CTRL, RT5659_JD_CTRL_1, RT5659_IRQ_CTRL_1, RT5659_IRQ_CTRL_2)
that were programmed only once in rt5659_i2c_probe(). Because RT5659_RESET
is marked volatile in rt5659_volatile_register(), the regmap cache is not
marked dirty or resynced on re-probe, leaving the codec unable to generate
jack detection interrupts after rebind.

In addition, rt5659_remove() does not clear rt5659->hs_jack or
rt5659->component. When the previous sound card unbinds, its card-owned
struct snd_soc_jack is freed, but rt5659->hs_jack retains the dangling
pointer. When a card binds again, snd_soc_component_probe() calls
rt5659_probe() before the machine driver init callback runs to register a
new jack via rt5659_set_jack_detect(). If an interrupt fires once
enable_irq() unmasks the line (or if the rebound card does not call
rt5659_set_jack_detect()), jack_detect_work will pass the freed
rt5659->hs_jack pointer to snd_soc_jack_report().

>  	switch (rt5659->pdata.jd_src) {
>  	case RT5659_JD_HDA_HEADER:
>  		break;
> @@ -3684,6 +3689,15 @@ static int rt5659_probe(struct snd_soc_component *=
component)
>  static void rt5659_remove(struct snd_soc_component *component)
>  {
>  	struct rt5659_priv *rt5659 =3D snd_soc_component_get_drvdata(component);
> +	struct i2c_client *i2c =3D to_i2c_client(component->dev);
> +
> +	if (rt5659->irq_acquired) {
> +		disable_irq(i2c->irq);
> +		rt5659->irq_disabled =3D true;
> +	}
> +
> +	if (rt5659->jack_detect_work_inited)
> +		cancel_delayed_work_sync(&rt5659->jack_detect_work);
> =20
>  	regmap_write(rt5659->regmap, RT5659_RESET, 0);
>  }

[Severity: High]
What happens if the I2C device is unbound while no sound card is bound to
the component, or if devm_snd_soc_register_component() fails in
rt5659_i2c_probe()?

In rt5659_i2c_probe() in sound/soc/codecs/rt5659.c, when
rt5659->pdata.jd_src is RT5659_JD3 or RT5659_JD_HDA_HEADER, the driver
initializes rt5659->jack_detect_work, enables the codec jack-detection
interrupt registers, requests rt5659_irq() via devm_request_threaded_irq(),
and enables the GPIO1 IRQ output before calling
devm_snd_soc_register_component():

sound/soc/codecs/rt5659.c:rt5659_i2c_probe() {
	...
	if (i2c->irq) {
		ret =3D devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
			rt5659_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
			| IRQF_ONESHOT, "rt5659", rt5659);
		...
		regmap_update_bits(rt5659->regmap, RT5659_GPIO_CTRL_1,
				   RT5659_GP1_PIN_MASK, RT5659_GP1_PIN_IRQ);
	}

	return devm_snd_soc_register_component(&i2c->dev,
			&soc_component_dev_rt5659,
			rt5659_dai, ARRAY_SIZE(rt5659_dai));
}

As soon as devm_request_threaded_irq() succeeds, an interrupt on i2c->irq
can run rt5659_irq() and queue rt5659->jack_detect_work on
system_power_efficient_wq with a 250ms delay.

However, the ASoC core only calls the component .remove callback
(rt5659_remove) when component->card is non-NULL:

sound/soc/soc-core.c:snd_soc_del_component_unlocked() {
	...
	if (card) {
		instantiated =3D card->instantiated;
		snd_soc_unbind_card(card);
		...
	}
}

sound/soc/soc-component.c:snd_soc_component_remove() {
	if (!component->card)
		return;

	if (probed && component->driver->remove)
		component->driver->remove(component);
	...
}

Because rt5659_i2c_driver has no I2C .remove callback and does not register
a devres action such as devm_delayed_work_autocancel(), unbinding the I2C
device when component->card is NULL (or failing in
devm_snd_soc_register_component()) skips rt5659_remove() entirely.
devres_release_all() will free the IRQ, regmap, and struct rt5659_priv while
rt5659->jack_detect_work is still pending or running, leading to a
use-after-free in rt5659_jack_detect_work() or
rt5659_jack_detect_intel_hd_header(). Similarly, rt5659_i2c_shutdown()
resets the codec via RT5659_RESET without disabling the IRQ or cancelling
jack_detect_work.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029212504.2997=
364-1-tristmd@gmail.com?part=3D2
