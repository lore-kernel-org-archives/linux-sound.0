Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380624;
	b=eBhvJi0v1V+140Tj4A/N81QffP66ylKMDgAr8YSulyJ7sVfvMlPUMAAZh+AGZDg33jnY
	 6ica8xU5/699X+tZgP5xIyXGt+LMgP72WUgmy47jZqnOmQBsDytyjAKxoguUri0H7NR3S
	 M3rP9uRnBebb+w8T5hHiZRZMAr4qeS7xY4fHe6bqhlBnrx264pIYtaz2+RGV/WEglzViD
	 bpIj1581XPaCnXiSa8Y5nXssdXR0R+GZLVQJECl1kGhL25G0CCmuqPTXpESSHBQOkSGrg
	 xJGiGD+Av/CFVBciU3yHGFphvVZOkOzSYTFFocVj88TC2vVg86irXvsbfI257HNz45A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380624;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=b8k0KogwMY8ZsCXcD0QYcd+sDqBk3XQeyaPZ7ZSPmTQ=;
	b=F0RhEDOQs8Uk7cxLCRRPlmwGqEJ7VjXtd8Jw9G8W8NRlhYOlYLVjp5KM/71HY9pPWDkD
	 Nuh3v1Y38CmqLZOpdk1pGtBjCannLARD4GAJYrS1vQb0N2g9w/fJ8VOurxTDo+a5hMzA5
	 oUuE26eWcFK9WVnPpV38m2Iau9dFjBCTAWye17CZfBs+xYDa9DQrDCI5NE5RYKaeT67tl
	 ZNiUwNspHEQ0K2zWYgRi8WjhAZTVTldfAiy0ZBaWcw/imL89csff3B2MeMqFLGzc4yF3V
	 cGEuxx0lskN2J2oZ9CHihVId0AxIWwcfhAyX/ODm9TUgDt60ONvDih93MmiLEgS4Isg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SEW+BXA+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD46606A320
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 17:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SEW+BXA+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98E51F000C1;
	Fri, 30 Oct 2026 17:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793380624;
	bh=b8k0KogwMY8ZsCXcD0QYcd+sDqBk3XQeyaPZ7ZSPmTQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SEW+BXA+hk8xBbRqqIkU1Z55RuF0e/3j81qkB8KukXhcESjWv/6Gid4il9hbtle27
	 FNz+swNnAtScFuQILthWo8adMrt3BTi5lNBHdKfsmdFluuN/bsE07qHYwLZFPX2LjJ
	 dBDts1G4qOpoMhBvDph7lJu5fAe8PF/yPz1RVLxwj+a3/hGMN7tyJ0/4MEWPuO3+yK
	 68WZq+LIAJbd0o2rEMsl2fQHV0HlIK08IhbNR/Ge3NHps7rxYJy30XSNAN2FiDqLZN
	 GGzGWyE5LllW3tP9iW2Jkxl2n22oRrWdDbwmFL+1izFzsW/pxVm6wGIt2pdxph8SGM
	 VDoSwNPf7vWuw==
Message-ID: <sashiko-outbox-191317@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] ASoC: rt5659: cancel jack_detect_work on
 component removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261030170416.3561618-3-tristan@talencesecurity.com>
References: <20261030170416.3561618-1-tristan@talencesecurity.com>
 <20261030170416.3561618-3-tristan@talencesecurity.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 17:17:03 +0000
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

commit 54b53c52a3c171380da559e1b3114044473f6136
Author: Tristan Madani <tristmd@gmail.com>

ASoC: rt5659: cancel jack_detect_work on component removal

This commit tracks IRQ acquisition and delayed work initialization in
struct rt5659_priv so that rt5659_remove() disables the IRQ and cancels
jack_detect_work before resetting the codec, and rt5659_probe()
re-enables the IRQ on subsequent component binds.

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
As reported by Sashiko on v3 [1], does re-enabling the host IRQ here on
card rebind actually restore jack detection, or can it trigger a
use-after-free on rt5659->hs_jack?

At the end of rt5659_remove(), the codec is software-reset:

	regmap_write(rt5659->regmap, RT5659_RESET, 0);

Writing RT5659_RESET resets all codec hardware registers to power-on
defaults, wiping out the GPIO1 IRQ pin mux (RT5659_GP1_PIN_IRQ in
RT5659_GPIO_CTRL_1) and the jack-detection and IRQ control registers
(such as RT5659_EJD_CTRL_1, RT5659_RC_CLK_CTRL, RT5659_GPIO_CTRL_3,
RT5659_JD_CTRL_1, RT5659_IRQ_CTRL_1, and RT5659_IRQ_CTRL_2) that were
configured only once in rt5659_i2c_probe(). Because RT5659_RESET is a
volatile register, the regmap cache is not marked dirty or resynced on
re-probe either, leaving the codec unable to generate jack interrupts
after card rebind.

In addition, rt5659_remove() does not clear rt5659->hs_jack or
rt5659->component. When a sound card unbinds and its card-owned struct
snd_soc_jack is freed, rt5659->hs_jack retains the dangling pointer. When
a card subsequently binds again, snd_soc_component_probe() calls
rt5659_probe() before the machine driver's init callback registers a new
jack. Calling enable_irq() at that point unmasks the IRQ while
rt5659->hs_jack still points to the freed jack, so an interrupt firing
before a new jack is set (or if the new card does not call
rt5659_set_jack_detect()) will schedule jack_detect_work and pass the
dangling rt5659->hs_jack pointer to snd_soc_jack_report().

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
As reported by Sashiko on v3 [2], what happens if the I2C device is
unbound while no ASoC sound card is bound to the component, or if
devm_snd_soc_register_component() fails in rt5659_i2c_probe()?

In rt5659_i2c_probe(), when rt5659->pdata.jd_src is RT5659_JD3 or
RT5659_JD_HDA_HEADER, the driver initializes rt5659->jack_detect_work,
enables codec jack-detection interrupts, requests rt5659_irq() via
devm_request_threaded_irq(), and enables the GPIO1 IRQ output pin before
calling devm_snd_soc_register_component(). Once the IRQ is requested, any
interrupt on i2c->irq runs rt5659_irq() and queues
rt5659->jack_detect_work with a 250 ms delay.

However, in the ASoC core, snd_soc_del_component_unlocked() and
snd_soc_component_remove() only invoke component->driver->remove
(rt5659_remove) when component->card is non-NULL and the component has
been probed:

sound/soc/soc-component.c:snd_soc_component_remove() {
	if (!component->card)
		return;

	if (probed && component->driver->remove)
		component->driver->remove(component);
	...
}

Because rt5659_i2c_driver defines no I2C remove callback and registers no
devm action (such as devm_delayed_work_autocancel()) to cancel
jack_detect_work, unbinding the I2C device without a bound sound card (or
failing devm_snd_soc_register_component()) skips rt5659_remove()
entirely. devres then frees the IRQ, regmap, and struct rt5659_priv while
rt5659->jack_detect_work remains pending, leading to a use-after-free when
the delayed work executes.

Similarly, rt5659_i2c_shutdown() writes RT5659_RESET without disabling the
IRQ or cancelling rt5659->jack_detect_work, allowing the work to run
against a reset codec during system shutdown.

[1] https://lore.kernel.org/r/20261030154202.2989936-3-tristan@talencesecur=
ity.com
[2] https://lore.kernel.org/r/20261030154202.2989936-3-tristan@talencesecur=
ity.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030170416.3561=
618-1-tristan@talencesecurity.com?part=3D2
