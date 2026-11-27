Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800124;
	b=47ylmfJNpJyvfMYRpqxKnNzCnD02AYfa91d9cNj/Yhk9+z4LBPQFV6MkxhVVm2Q9pMK1
	 0NWteNHYntcwfZY0GIVYFl8hnqv89JIF9fII5Zlg7Ns3RgyQ6GVvS5nNHoJYkR4jsF/jq
	 Np3lx2GPtwm1XIx6mGPeUtFkh0F9CTJJ1Kx9klxWsE//EgXkFSvXRLeIPe3CeXNNY6LHH
	 2ANEu4ZXaIJnqFTxpOkiEPwcHiCQFDH/Pex/I8/X+BH5mK4cSy0Eqo58NShQrdrik6rWO
	 hijpeBLZ0vHceciCBf3Mg9xng81IczM55MZTh3SizXeEkFRO7X8e7+dcbdXJGzjoq3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800124;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=V7hCu4Y4C7yOIs66CQoFdlm1Ar9QDEilAMSBdtmcGjY=;
	b=fBnmuzEs9+eWTc7As0eLhgOb7xEWk+fmZdF8SP9bUCQt47j7Wdj6yWDxJO2R4BShlQW+
	 ozo3gogKHX7FJTiODKpP1qtUKSyFwHhRAy5e6tXhRPvyQZT7O1JSiwU9FnHPcKW5VLbV2
	 WgD9O/36CsoRl+/n1f0W3atdJAYsU3zpDBgnVSLcS5Om7HhUk/A0WBmycKYcqk9oV4CH5
	 ZECneRVkMPsREJG3806oCctBPKKAyZLJyQQjJmRIDP74pq7nNTmaeZvZa9TELlva44h2J
	 EIdf6GUKXCIQUyVe/1TMhcmI33adcHKqftdPiYaSo3zxLiV2ac74gSis1guRqkGqHCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DjZANxMj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6664606A337
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 17:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DjZANxMj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B7E1F0089F;
	Fri, 27 Nov 2026 17:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795800123;
	bh=V7hCu4Y4C7yOIs66CQoFdlm1Ar9QDEilAMSBdtmcGjY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DjZANxMjmW7f0rGg5IE7dJM/WEeV4FyNzGNufsgVAPdPkph/Yne9dfa2EAFPFNyVC
	 BQCiP152b/cLhge4OUiZCYjLL257ecX+iUw/vf3ixVdCw2tOVejApGQwGcXWaXkiBK
	 gXWvXFKNFrCK1/V3MJv3mY6/uAPIT4zp1cEDl7uvtX5gkh49HSmtEva4/ox3vIH/cl
	 0Quu9DIvEsTkxNVE2kKvG7YEKd6MRp+VBxuesgbAHpPWfLShUixGTwLCP31zSao9bL
	 Cn4D2SnbZDMwz1dM85llSiQsCcrN/sFIyajfDSbVM24XjnDuSul4bQlR60yaDdCJmo
	 caePZ/w2Uqa4Q==
Message-ID: <sashiko-outbox-237987@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] ASoC: wm8962: implement GPIO .get callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurentiu Mihalcea" <laurentiumihalcea111@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261127170039.663-2-laurentiumihalcea111@gmail.com>
References: <20261127170039.663-1-laurentiumihalcea111@gmail.com>
 <20261127170039.663-2-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 17:22:03 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] ASoC: wm8962: missing direction_input callback on
  wm8962_template_chip
- [Medium] ASoC: wm8962: wm8962_gpio_get() rejects valid output pins
  GPIO2 and GPIO3
--

commit b87e152ac0d0fb816585617c6713e1d54f3b94a7
Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

ASoC: wm8962: implement GPIO .get callback

This commit implements the .get callback for the WM8962 gpio_chip to support
reading the logic level of GPIO5 and GPIO6.

> diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
> index 1832685aca40d..7122d93a742c5 100644
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -3505,12 +3505,63 @@ static int wm8962_gpio_direction_out(struct gpio_=
chip *chip,
>  	return 0;
>  }
> =20
> +/*
> + * If your input pins have debouncing enabled, then make sure DBCLK is e=
nabled
> + * before using this function! Otherwise, the value returned by this fun=
ction
> + * may not be correct!
> + *
> + * TODO: can we work around this limitation by force enabling SYSCLK bef=
ore
> + * attempting to read the pin's state? Is SYSCLK's source clock guarante=
ed
> + * to be configured by the time this function is called?
> + */
> +static int wm8962_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct wm8962_priv *wm8962 =3D gpiochip_get_data(chip);
> +	struct snd_soc_component *component =3D wm8962->component;
> +	unsigned int val;
> +	int ret;
> +
> +	/*
> +	 * only GPIO5/GPIO6 can be used as inputs! Note the difference between =
the GPIO
> +	 * index and the register offset.
> +	 */
> +	if (offset !=3D 4 && offset !=3D 5) {
> +		dev_err(component->dev, "Only GPIO5/GPIO6 can be used as inputs!\n");
> +		return -EINVAL;
> +	}

[Severity: Medium]
Should wm8962_gpio_get() also accept output pins GPIO2 (offset 1) and GPIO3
(offset 2)?

gpiolib calls .get() on requested output lines too, such as from
gpiolib_dbg_show() when reading /sys/kernel/debug/gpio or when querying an
output's state via gpiod_get_value_cansleep().  WM8962_GPIO_2 and
WM8962_GPIO_3 are readable registers and expose WM8962_GP2_LVL and
WM8962_GP3_LVL at bit 6 just like GPIO5 and GPIO6, so rejecting offsets 1
and 2 here breaks output value readback and logs a dev_err() whenever
/sys/kernel/debug/gpio is read while GPIO2 or GPIO3 is requested.

> +
> +	/*
> +	 * we are forced to resume the device and bypass the regmap cache for t=
he
> +	 * read operation. This is because the GPIO level could change at any t=
ime.
> +	 * Remember that the GPIO registers are still marked as cacheable. This=
 is
> +	 * because the configuration bits and the GPIO LVL bits share the same =
registers.
> +	 */
> +	ret =3D pm_runtime_resume_and_get(component->dev);
> +	if (ret < 0) {
> +		dev_err(component->dev, "Failed to resume device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D regmap_read_bypassed(component->regmap, WM8962_GPIO_BASE + offs=
et, &val);
> +	if (ret < 0) {
> +		dev_err(component->dev, "Failed to read GP%d_LVL: %d\n", offset + 1, r=
et);
> +		pm_runtime_put(component->dev);
> +		return ret;
> +	}
> +
> +	pm_runtime_put(component->dev);
> +
> +	/* mask is intentional! We (ab)use the fact that GPn_LVL fields share t=
he same mask */
> +	return (val & WM8962_GP5_LVL) >> WM8962_GP5_LVL_SHIFT;
> +}
> +
>  static const struct gpio_chip wm8962_template_chip =3D {
>  	.label			=3D "wm8962",
>  	.owner			=3D THIS_MODULE,
>  	.request		=3D wm8962_gpio_request,
>  	.direction_output	=3D wm8962_gpio_direction_out,
>  	.set			=3D wm8962_gpio_set,
> +	.get			=3D wm8962_gpio_get,
>  	.can_sleep		=3D 1,
>  };

[Severity: Medium]
Does wm8962_template_chip also need a .direction_input (and .get_direction)
callback to support GPIO5 and GPIO6 as inputs?

When both .get_direction and .direction_input are NULL,
gpiochip_add_data_with_key() marks every line with GPIOD_FLAG_IS_OUT at
registration time, even though GPIO5 and GPIO6 default to inputs in hardwar=
e,
causing consumers that request them with GPIOD_ASIS or lock them as IRQs via
gpiochip_lock_as_irq() to fail with -EIO.  In addition,
gpiod_direction_input_nonotify() becomes a software-only flag clear when bo=
th
callbacks are absent:

drivers/gpio/gpiolib.c:gpiod_direction_input_nonotify() {
    ...
	if (guard.gc->direction_input) {
		ret =3D gpiochip_direction_input(guard.gc,
					       gpiod_hwgpio(desc));
	} else if (guard.gc->get_direction) {
		dir =3D gpiochip_get_direction(guard.gc, gpiod_hwgpio(desc));
    ...
	}
	if (ret =3D=3D 0) {
		clear_bit(GPIOD_FLAG_IS_OUT, &desc->flags);
		ret =3D gpio_set_bias(desc);
	}
}

As a result, calling gpiod_direction_input() on GPIO5 or GPIO6 never sets
WM8962_GP5_DIR or WM8962_GP6_DIR in hardware if the pin was previously driv=
en
as an output, and requesting output-only pins GPIO2 or GPIO3 with GPIOD_IN
silently succeeds instead of returning -EINVAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127170039.663-=
1-laurentiumihalcea111@gmail.com?part=3D1
