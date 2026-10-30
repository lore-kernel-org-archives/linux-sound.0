Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383328;
	b=0F3gJHXikkMOEBf+js6XL9per6hFYVttU2gvevcu3nTcO418YIl0flJBjwlMYL6/89yM
	 GbHUeE+q+MoDxYe6TM9KinlRpJjuYKVD4+9ZJftyr6XKJFwXx1DkXKSq7F0jI1Jj8nLmc
	 GIhGEPGOOZov+b1t0EWfbZ0Nytw7/uZjHG3RlTdMvnEpZE9L/lVqRaK676Rllw2WUzUkP
	 SAj2wy8IpFzROZLA+F43ZNkceDYoN1u92Xyn7QLav78sulDeLqfEHYMYKKOJqJygQ9GTr
	 wWEL1ldqEBDKceuS3rRyrPHV4GtTez/8MAlAPRnjsGHcMa2JHZT2lHpWd2OVWSvzrZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383328;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IZlJycpwiBtOkaDKRWNC+dnoH+aAfbVqdTdlmgddGxs=;
	b=OREUmtEW9XW+DMCq3vy2u4DDQKxTjHw24IDdg7fTBJUr7c8NPpsxRftATbIE11k1rBfH
	 Ehy7s2E8EeL3ISvdCwwrtGiM4FVkrKFLWiVBxT2jQyPxp9No7cMbHpHAaHZHBlyeIqlWP
	 ZNFcI/V2AZCVGe9f3rgoR9CN9WuZJaF45q0MMTtlTaJeiPJA5OHMASLV7WdOzDf2xxY9P
	 guurFSHO1Gk7FBEWh1rKDfOrU66Vo0VNyvWgPuTLYflvFxl1SHuUU2xFz2fyeM8IZoe35
	 BG2nXddrUninX3gsq6WJk4ArExx2AE1ED8P09s3T6DFZJV11W8brj4aZNEgl0OcROMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IbIbf5lH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFB7606A322
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 18:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IbIbf5lH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677B81F0093A;
	Fri, 30 Oct 2026 18:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793383327;
	bh=IZlJycpwiBtOkaDKRWNC+dnoH+aAfbVqdTdlmgddGxs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IbIbf5lHqsy3cL5jp57vAwV7MAs9buatB/yHy63aH6vFjaVyF38PruDdH9PiuMAug
	 36dLFgk95tIc/7bfTR1XulrYJ5TUVU9mScCS/5thoxZOtnHHUQ34tpKbLNJIWnTtjy
	 pDFS4nn89xyN5Cg9YPJMQEjAqwdNq9L2k4obrwz1tIWEuEMGw9KB83XTHcpyY+HEu7
	 MNpOmfbLtP9oqvecPda1qH/FvPtqaZS6WEKdydb/E+voBBy9NAbfN3G0o3QURQdb5P
	 YqhCTloFwK9fydkPGUi9roEum+T8C2XudJ5rbM9A4dVJWt2zlXpHY263x5v6Wr2xDP
	 KSf4F3XtWPYUw==
Message-ID: <sashiko-outbox-191388@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] ASoC: rt5659: cancel jack_detect_work on
 component removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261030174837.1839402-3-tristan@talencesecurity.com>
References: <20261030174837.1839402-1-tristan@talencesecurity.com>
 <20261030174837.1839402-3-tristan@talencesecurity.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 18:02:07 +0000
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
- [High] ASoC: rt5659: uncancelled jack_detect_work on I2C teardown without=
 card
- [High] ASoC: rt5659: broken jack detect and dangling hs_jack in rt5659_pr=
obe()
--

commit ed495f70ecb1520022a86353ac80bee32a4816ff
Author: Tristan Madani <tristmd@gmail.com>

ASoC: rt5659: cancel jack_detect_work on component removal

This commit disables the codec IRQ and cancels any pending jack_detect_work
in rt5659_remove() before resetting the codec, and re-enables the IRQ in
rt5659_probe() when a card rebinds.

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
As reported by Sashiko on v4 [1], when a sound card unbinds and rebinds, can
re-enabling the IRQ in rt5659_probe() restore jack detection or is it unsafe
while rt5659->hs_jack still holds a pointer from the previous card?

At the end of rt5659_remove(), regmap_write(rt5659->regmap, RT5659_RESET, 0)
resets all codec hardware registers to power-on defaults, clearing the GPIO1
IRQ pin mux (RT5659_GP1_PIN_IRQ in RT5659_GPIO_CTRL_1) and all jack-detecti=
on
and IRQ control registers (such as RT5659_EJD_CTRL_1, RT5659_RC_CLK_CTRL,
RT5659_GPIO_CTRL_3, RT5659_JD_CTRL_1, RT5659_IRQ_CTRL_1, and
RT5659_IRQ_CTRL_2) that were only programmed once in rt5659_i2c_probe().
Because RT5659_RESET is marked volatile in rt5659_volatile_register(), the
REGCACHE_RBTREE regmap cache is not marked dirty or resynced on re-probe,
leaving the codec unable to generate jack-detection interrupts after rebind.

In addition, rt5659_remove() does not clear rt5659->hs_jack or
rt5659->component. When a card rebinds, snd_soc_component_probe() invokes
rt5659_probe() and calls enable_irq() before the machine driver's DAI-link
init callback registers a new snd_soc_jack. If an interrupt fires before a
new jack is set (or if the new card does not call rt5659_set_jack_detect()),
rt5659_jack_detect_work() or rt5659_jack_detect_intel_hd_header() will pass
the dangling rt5659->hs_jack pointer from the old card to
snd_soc_jack_report().

> +
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
As reported by Sashiko on v4 [2], what happens if the I2C device is unbound
while no ASoC sound card is bound to the component, or if
devm_snd_soc_register_component() fails in rt5659_i2c_probe()?

In rt5659_i2c_probe(), when rt5659->pdata.jd_src is RT5659_JD3 or
RT5659_JD_HDA_HEADER, rt5659->jack_detect_work is initialized and hardware
interrupts are enabled via devm_request_threaded_irq() and
RT5659_GP1_PIN_IRQ before devm_snd_soc_register_component() is called. Once
devm_request_threaded_irq() succeeds, any interrupt on i2c->irq invokes
rt5659_irq() and queues rt5659->jack_detect_work onto
system_power_efficient_wq with a 250 ms delay.

Because disable_irq() and cancel_delayed_work_sync() are only placed in
rt5659_remove() (the snd_soc_component_driver.remove callback), and the ASoC
core in snd_soc_del_component_unlocked() -> snd_soc_component_remove() only
invokes component->driver->remove() when a card has probed the component,
unbinding the I2C device without a bound card (or failing in
devm_snd_soc_register_component()) never calls rt5659_remove(). Devres then
frees the IRQ, regmap, and struct rt5659_priv while rt5659->jack_detect_work
can still be pending, leading to a use-after-free when the worker runs.

Similarly, rt5659_i2c_shutdown() writes RT5659_RESET without disabling the
IRQ or cancelling rt5659->jack_detect_work. Should the work cancellation and
IRQ teardown also be tied to the I2C device lifecycle (for example via
devm_delayed_work_autocancel() or a devm action) and handled in
rt5659_i2c_shutdown()?

[1] https://lore.kernel.org/r/20261030170416.3561618-3-tristan@talencesecur=
ity.com
[2] https://lore.kernel.org/r/20261030170416.3561618-3-tristan@talencesecur=
ity.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030174837.1839=
402-1-tristan@talencesecurity.com?part=3D2
