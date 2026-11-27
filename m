Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800972;
	b=pIykXfsf3XHE9OL5UU0lJat2xEF36yYfPWOkFrdcDwQD5hEWy6fINxkkMapWj/dy0dt/
	 ht2ioNqzHCRy0Mf6PoJi+7WU9ZGgQFYKhqdsfyuhnVnBRAZ7kkhPzbgB+WWmh29Bpx9Kx
	 +floRILIbCxiiXn4xPiXwY7LREchzPIf/U2vAE/O2v3kr4EKhcgKU4d1nlq/pE8m6ewch
	 UVUZL9PjiYeAwM28OMqd4NSmckTKPlqfv21XfWKo/KOyE8Nf1JB2BD39k4ATwOG+d/PNb
	 2xFfTlqlK+f9IaD3ooYZ/yqET7DRqJz2Oq8Ag5jBn47WpjdkRfHxOzZi3+wL92eqixQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800972;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xnYiWk7zt992092X5vo27PgJ23tP1VfNcWFJjUoHnYY=;
	b=sMKjfOtZ4AZtAA+V3heU9jBIbKHRARGqzatYbLb3mkeothDUyLlIoTpLx3zRwjfoQnM8
	 YKwKVgr1020//t1xXU/BQruKV0kbQuaak29Fctz70h6MfrKKUoZhad2jmUElDZiNmNlCF
	 RpIlPKxivsKf+/wWbd1AZZINoxBqXAzcIoQcU1qQW0wldUY6z34xkM1egDIqbeU+Zc+EH
	 0nxqls21O/DAdulxtx3v17boz8xUs24y6tTrwm2AaDyBKFC0pRUsqP92UhoMJSD2hNIhz
	 TnyZ+6OOkMDvTJLpYgwpACNv0YCxJJJJ7xb/0WIlwg9mEuqueCFwpyirD1cVGawWgdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M9EdMz43;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ED9606A688
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 17:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M9EdMz43
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152081F00925;
	Fri, 27 Nov 2026 17:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795800972;
	bh=xnYiWk7zt992092X5vo27PgJ23tP1VfNcWFJjUoHnYY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M9EdMz43izO7SrWm8q1Id/0qiAr67/5LwVhkiYo5CTYhMWhlMgfdbQxGrXvypPzkG
	 n6YXg/E7PahQFEVcuDQkKy4+WTMm46yS8airJqE6CPYlbFZ9Lj2fqtAz08Z8fO3IcX
	 QP9JfDqbZDo6QYS3bqwrWP4wiw1svGnfS6T7imlZQHs/mvFqFDj6jPL2XJrQ2xUgL4
	 tC75UzDKfIrV4kbkNzzl7D+vfrmSh8sSQ+8pxMAQdLMVCQF335ihjj47amB0ByBxc9
	 xv04SNwVZUnl5DUkKAJaIwfdCKFH20KIeJiNiRGd9VKYY5V58A7wMGQ/ARHGyhtEP5
	 FfybiNoGPJ3vw==
Message-ID: <sashiko-outbox-237999@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] ASoC: wm8962: add GPIO interrupt controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurentiu Mihalcea" <laurentiumihalcea111@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261127170039.663-3-laurentiumihalcea111@gmail.com>
References: <20261127170039.663-1-laurentiumihalcea111@gmail.com>
 <20261127170039.663-3-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 17:36:11 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] ASoC: wm8962: build failure when CONFIG_GPIOLIB or
  GPIOLIB_IRQCHIP is disabled
- [High] ASoC: wm8962: setting gpio_chip.init_valid_mask disables GPIO2
  and GPIO3
- [High] ASoC: wm8962: lifecycle mismatch and UAF on gc->irq.domain in
  wm8962_irq()
- [High] ASoC: wm8962: lost GPIO IRQs due to runtime suspend and reset
  in wm8962_irq()
- [Medium] ASoC: wm8962: bitwise AND with WM8962_GPIO_FN_IRQ in
  wm8962_init_gpio_irq()
- [Medium] ASoC: wm8962: missing direction_input/get_direction breaks
  direct GPIO IRQ use
--

commit 836469865b058b5ef16dbf8d43d225333a1a1717
Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

ASoC: wm8962: add GPIO interrupt controller support

This commit registers a GPIO irqchip on the WM8962 codec so that GPIO5 and
GPIO6 can be used as interrupt sources by consumer devices.

> diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
> index 7122d93a742c5..3bbaacb08aafa 100644
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -3141,13 +3141,34 @@ static void wm8962_mic_work(struct work_struct *w=
ork)
>  			    WM8962_MICD_IRQ_POL, irq_pol);
>  }
> =20
> +static int wm8962_irq_status_masked(struct wm8962_priv *wm8962,
> +				    unsigned int status_reg,
> +				    unsigned int mask_reg,
> +				    unsigned int *status)
> +{
> +	int ret;
> +	unsigned int mask;
> +
> +	ret =3D regmap_read(wm8962->regmap, mask_reg, &mask);
> +	if (ret !=3D 0)
> +		return ret;
> +
> +	ret =3D regmap_read(wm8962->regmap, status_reg, status);
> +	if (ret !=3D 0)
> +		return ret;
> +
> +	*status &=3D ~mask;
> +
> +	return 0;
> +}
> +
>  static irqreturn_t wm8962_irq(int irq, void *data)
>  {
>  	struct device *dev =3D data;
>  	struct wm8962_priv *wm8962 =3D dev_get_drvdata(dev);
> -	unsigned int mask;
> -	unsigned int active;
> -	int reg, ret;
> +	unsigned int active_1, active_2;
> +	struct gpio_chip *gc =3D &wm8962->gpio_chip;
> +	int reg, ret, nirq;

[Severity: High]
Does this fail to build when CONFIG_GPIOLIB or CONFIG_GPIOLIB_IRQCHIP is
disabled?

SND_SOC_WM8962 neither depends on GPIOLIB nor selects GPIOLIB_IRQCHIP.
wm8962_priv.gpio_chip is only declared under #ifdef CONFIG_GPIOLIB, and
gpio_chip.irq as well as GPIOCHIP_IRQ_RESOURCE_HELPERS are only available
under CONFIG_GPIOLIB_IRQCHIP, so referencing wm8962->gpio_chip,
gc->irq.domain, and wm8962_irq_chip breaks builds without those options.

> =20
>  	ret =3D pm_runtime_resume_and_get(dev);
>  	if (ret < 0) {
> @@ -3155,43 +3176,51 @@ static irqreturn_t wm8962_irq(int irq, void *data)
>  		return IRQ_NONE;
>  	}
> =20
> -	ret =3D regmap_read(wm8962->regmap, WM8962_INTERRUPT_STATUS_2_MASK,
> -			  &mask);
> +	ret =3D wm8962_irq_status_masked(wm8962,
> +				       WM8962_INTERRUPT_STATUS_1,
> +				       WM8962_INTERRUPT_STATUS_1_MASK,
> +				       &active_1);

[Severity: High]
Are GPIO5 and GPIO6 interrupts lost whenever the codec is runtime
suspended?

Nothing holds a runtime PM reference on the codec while a GPIO IRQ is
requested (for example via irq_domain_set_pm_device()).  When the codec is
idle in RPM_SUSPENDED and a GPIO interrupt fires, pm_runtime_resume_and_get=
()
runs wm8962_runtime_resume() -> wm8962_reset(), which resets the hardware a=
nd
clears WM8962_INTERRUPT_STATUS_1 before wm8962_irq_status_masked() reads it.
In addition, commit "ASoC: wm8962: fix interrupt mis-firing during
runtime_resume()" later in this series disables wm8962->irq in
wm8962_runtime_suspend(), preventing GPIO interrupts from firing at all whi=
le
suspended.

[ ... ]

> @@ -3226,6 +3255,22 @@ static irqreturn_t wm8962_irq(int irq, void *data)
>  				   msecs_to_jiffies(250));
>  	}
> =20
> +	if (active_1 & WM8962_GP5_EINT) {
> +		nirq =3D irq_find_mapping(gc->irq.domain, 4);
> +		if (likely(nirq > 0))
> +			handle_nested_irq(nirq);
> +		else
> +			dev_warn(dev, "Unmapped GP5 interrupt\n");
> +	}
> +
> +	if (active_1 & WM8962_GP6_EINT) {
> +		nirq =3D irq_find_mapping(gc->irq.domain, 5);
> +		if (likely(nirq > 0))
> +			handle_nested_irq(nirq);
> +		else
> +			dev_warn(dev, "Unmapped GP6 interrupt\n");
> +	}

[Severity: High]
Can irq_find_mapping() dereference a freed gc->irq.domain or pass NULL
before the ASoC component is bound?

wm8962_irq() is requested in wm8962_i2c_probe() and wm8962_init_gpio_irq()
unmasks GP5 and GP6 interrupts immediately, whereas gpio_chip is added in
wm8962_probe() and removed in wm8962_remove() -> wm8962_free_gpio().
Before wm8962_probe() runs, gc->irq.domain is NULL, which causes
__irq_resolve_mapping() to fall back to irq_default_domain.  When the sound
card unbinds, gpiochip_remove() frees gc->irq.domain while GP5/GP6
interrupts remain unmasked and wm8962_irq() is still active, causing a
use-after-free on subsequent GP5/GP6 interrupts.

[ ... ]

> @@ -3555,6 +3600,18 @@ static int wm8962_gpio_get(struct gpio_chip *chip,=
 unsigned int offset)
>  	return (val & WM8962_GP5_LVL) >> WM8962_GP5_LVL_SHIFT;
>  }
> =20
> +static int wm8962_init_valid_mask(struct gpio_chip *chip,
> +				  unsigned long *valid_mask,
> +				  unsigned int ngpios)
> +{
> +	bitmap_zero(valid_mask, ngpios);
> +
> +	/* only GPIO5/GPIO6 can be used as interrupt sources! */
> +	bitmap_set(valid_mask, 4, 2);
> +
> +	return 0;
> +}
> +
>  static const struct gpio_chip wm8962_template_chip =3D {
>  	.label			=3D "wm8962",
>  	.owner			=3D THIS_MODULE,
> @@ -3562,13 +3619,42 @@ static const struct gpio_chip wm8962_template_chi=
p =3D {
>  	.direction_output	=3D wm8962_gpio_direction_out,
>  	.set			=3D wm8962_gpio_set,
>  	.get			=3D wm8962_gpio_get,
> +	.init_valid_mask	=3D wm8962_init_valid_mask,
>  	.can_sleep		=3D 1,
>  };

[Severity: High]
Does setting wm8962_init_valid_mask on gpio_chip.init_valid_mask disable
GPIO2 and GPIO3 as output GPIOs?

gpio_chip.init_valid_mask restricts which GPIO lines exist for all gpiolib
operations, so clearing everything except offsets 4 and 5 causes
gpiod_request_commit() to reject GPIO2 (offset 1) and GPIO3 (offset 2) with
-EINVAL.  To restrict only which lines can be mapped as interrupts, this
callback should be assigned to girq->init_valid_mask instead.

> =20
> +/*
> + * TODO: implement mask()/unmask()/bus_sync() if required. At the moment=
, we
> + * operate under the assumption that the pins' function is set to IRQ us=
ing
> + * the "gpio-cfg" DT property. The interrupts are unmasked regardless of=
 the
> + * pins' function!
> + */
> +static const struct irq_chip wm8962_irq_chip =3D {
> +	.flags			=3D IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};

[Severity: Medium]
Can gpiochip_lock_as_irq() succeed when wm8962_template_chip defines
neither .direction_input nor .get_direction?

During gpiochip_add_data_with_key(), gpiolib sets GPIOD_FLAG_IS_OUT on every
line when both .get_direction and .direction_input are NULL.  When a consum=
er
requests a GPIO5 or GPIO6 interrupt, GPIOCHIP_IRQ_RESOURCE_HELPERS calls
gpiochip_lock_as_irq(), which sees GPIOD_FLAG_IS_OUT set and rejects the
interrupt request with -EIO.

> +
> +static void wm8962_init_gpio_irq(struct wm8962_priv *wm8962)
> +{
> +	unsigned int val =3D ~(WM8962_IM_GP5_EINT | WM8962_IM_GP6_EINT);
> +	unsigned int mask =3D WM8962_IM_GP5_EINT | WM8962_IM_GP6_EINT;
> +
> +	if (!(wm8962->pdata.gpio_init[4] & WM8962_GPIO_FN_IRQ))
> +		val |=3D WM8962_IM_GP5_EINT;
> +
> +	if (!(wm8962->pdata.gpio_init[5] & WM8962_GPIO_FN_IRQ))
> +		val |=3D WM8962_IM_GP6_EINT;

[Severity: Medium]
Should these checks mask with WM8962_GP5_FN_MASK / WM8962_GP6_FN_MASK and
compare equal to WM8962_GPIO_FN_IRQ instead of using a bitwise AND?

GP5_FN and GP6_FN are 5-bit function codes where WM8962_GPIO_FN_IRQ is 3,
so testing with & WM8962_GPIO_FN_IRQ matches any non-IRQ function with bit
0 or bit 1 set (such as WM8962_GPIO_FN_LOGIC or WM8962_GPIO_FN_MICD) and
unmasks GP5/GP6 interrupts when the pins are not configured for IRQ output.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127170039.663-=
1-laurentiumihalcea111@gmail.com?part=3D2
