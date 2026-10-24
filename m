Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792832558;
	b=D3VcYeEZAoXko34SID0/Y6n8Bm6NwpKX+GSlDz86JT8SKJfBxyRC8bVk1vyTTB4BjMMU
	 m5zh95BTwF+3wP1cIcFKUR9wdY8qCnsXH2fn8RxpdfC9d5S2JmxKeGJqyKOue+k+pOGZu
	 bF6irQOSSy8jp1ur0NEhIfXB6okeZrWm1JFdkjsY3RDCBueYeYWEJOs04Xz6cduTQ2FQV
	 PU7TAn8WVTobi6tP0WxCH5OsqokOVJZhbiO2HiT+UCyFZIq//Qscp+XfH7/kJDWkT+Q4d
	 AVVYjR28Uo6cT99NtyHXjj00mvpxhSrztWYCvKW9rk8Yw68Ocb7La5riIBJQvGzQaiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792832558;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=usmhcxVXfXG4SdX+80C+AANZsV0XssYTk4JJ1OAUjT8=;
	b=CUPGd0SobEFrn/UmeBYQcecqrBKFOzxE7BBhBqwB++Ik3xYnCN3BR/NAdGRMh9XAygU4
	 jcuN5YgQC/UCLAsEk0EMpGQCUz+663t+fe0qZ6kJMkSPBbWFygXQmzstoQXf1Lqj9/T22
	 SYMXh1cdd8XhFaOPG6y0jui+l4NGMZFKRJPf6DxCm9jePB4Rvpcs6Npm4iI5emfYnJ1B7
	 w5Dg/0ND4I0SKb57RX+RxLUEKIBKjxdBDdSyO9ZsSj1IkC9dHI+juyt8rJyjIBGjNGqJU
	 Wp5PQB+vAU7OtSmpntwn7NoR6LhRp0UNfQTl08b2L7O5Jm6ABVY7ONE/JP99hwu3lpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KV7NxnTG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9CE606A324
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KV7NxnTG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B8D1F01825;
	Sat, 24 Oct 2026 09:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792832558;
	bh=usmhcxVXfXG4SdX+80C+AANZsV0XssYTk4JJ1OAUjT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KV7NxnTGq8svAUTKfhzG+MH3masLjCUor8YTYRtIFvxLqKfW9UhJekWh8YjPemFY+
	 hMEFfSoN1v2NPLwczsKv3ZIrpKWiDWw8Mls2iEgakIZlAErgqquCC6fyf0T+OVsqTc
	 6q98NvuRVFdzyQa+lOmd7LnQQ888MpZoqwkdTikwqEHZQTtpZ49c8CFEK/fNVRygaR
	 VXD+dUMvybZSAgrADNza2X6pQgLBpTKiKSsx2qx88gIaTwIS8lquv2OQ4AV8+trdhX
	 zSTnBjKR3ah51dO/Kd1g+B8zFjhcSiKsGvnwaSArCj6x7EhLgIPn3kJ92NY5ifJMDw
	 v//HScO7t3PUw==
Message-ID: <sashiko-outbox-183604@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ASoC: es8328: describe the power-on register values
 in the regmap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bob Hui" <bg9oxa@163.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261024-es8328-vol-init-v1-1-efbd24de9639@163.com>
References: <20261024-es8328-vol-init-v1-0-efbd24de9639@163.com>
 <20261024-es8328-vol-init-v1-1-efbd24de9639@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 09:02:37 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ASoC: es8328: cache/hardware mismatch from reg_defaults without re=
set
--

commit ba4a54ba4fc04177b18a7410bdd82d04a07933b8
Author: Bob Hui <bg9oxa@163.com>

ASoC: es8328: describe the power-on register values in the regmap

This commit populates es8328_reg_defaults with datasheet power-on reset val=
ues
for registers ES8328_CONTROL1 through ES8328_DACCONTROL30 and hooks them up=
 to
es8328_regmap_config.

> diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
> index aaa6646ad4c5e..d7f93de82f69a 100644
> --- a/sound/soc/codecs/es8328.c
> +++ b/sound/soc/codecs/es8328.c
> @@ -856,11 +856,69 @@ static void es8328_remove(struct snd_soc_component =
*component)
>  			       es8328->supplies);
>  }
> =20
> +static const struct reg_default es8328_reg_defaults[] =3D {
> +	{ ES8328_CONTROL1,	0x06 },
> +	{ ES8328_CONTROL2,	0x1c },
> +	{ ES8328_CHIPPOWER,	0xc3 },
> +	{ ES8328_ADCPOWER,	0xfc },
> +	{ ES8328_DACPOWER,	0xc0 },
> +	{ ES8328_CHIPLOPOW1,	0x00 },
> +	{ ES8328_CHIPLOPOW2,	0x00 },
> +	{ ES8328_ANAVOLMANAG,	0x7c },
> +	{ ES8328_MASTERMODE,	0x80 },
> +	{ ES8328_ADCCONTROL1,	0x00 },
> +	{ ES8328_ADCCONTROL2,	0x00 },
> +	{ ES8328_ADCCONTROL3,	0x06 },
> +	{ ES8328_ADCCONTROL4,	0x00 },
> +	{ ES8328_ADCCONTROL5,	0x06 },
> +	{ ES8328_ADCCONTROL6,	0x30 },
> +	{ ES8328_ADCCONTROL7,	0x30 },
> +	{ ES8328_ADCCONTROL8,	0xc0 },
> +	{ ES8328_ADCCONTROL9,	0xc0 },
> +	{ ES8328_ADCCONTROL10,	0x38 },
> +	{ ES8328_ADCCONTROL11,	0xb0 },
> +	{ ES8328_ADCCONTROL12,	0x32 },
> +	{ ES8328_ADCCONTROL13,	0x06 },
> +	{ ES8328_ADCCONTROL14,	0x00 },
> +	{ ES8328_DACCONTROL1,	0x00 },
> +	{ ES8328_DACCONTROL2,	0x06 },
> +	{ ES8328_DACCONTROL3,	0x32 },
> +	{ ES8328_DACCONTROL4,	0xc0 },
> +	{ ES8328_DACCONTROL5,	0xc0 },
> +	{ ES8328_DACCONTROL6,	0x08 },
> +	{ ES8328_DACCONTROL7,	0x06 },
> +	{ ES8328_DACCONTROL8,	0x1f },
> +	{ ES8328_DACCONTROL9,	0xf7 },
> +	{ ES8328_DACCONTROL10,	0xfd },
> +	{ ES8328_DACCONTROL11,	0xff },
> +	{ ES8328_DACCONTROL12,	0x1f },
> +	{ ES8328_DACCONTROL13,	0xf7 },
> +	{ ES8328_DACCONTROL14,	0xfd },
> +	{ ES8328_DACCONTROL15,	0xff },
> +	{ ES8328_DACCONTROL16,	0x00 },
> +	{ ES8328_DACCONTROL17,	0x38 },
> +	{ ES8328_DACCONTROL18,	0x38 },
> +	{ ES8328_DACCONTROL19,	0x38 },
> +	{ ES8328_DACCONTROL20,	0x38 },
> +	{ ES8328_DACCONTROL21,	0x38 },
> +	{ ES8328_DACCONTROL22,	0x38 },
> +	{ ES8328_DACCONTROL23,	0x00 },
> +	{ ES8328_LOUT1VOL,	0x00 },
> +	{ ES8328_ROUT1VOL,	0x00 },
> +	{ ES8328_LOUT2VOL,	0x00 },
> +	{ ES8328_ROUT2VOL,	0x00 },
> +	{ ES8328_MONOOUTVOL,	0x00 },
> +	{ ES8328_DACCONTROL29,	0x00 },
> +	{ ES8328_DACCONTROL30,	0x00 },
> +};
> +
>  const struct regmap_config es8328_regmap_config =3D {
>  	.reg_bits	=3D 8,
>  	.val_bits	=3D 8,
>  	.max_register	=3D ES8328_REG_MAX,
>  	.cache_type	=3D REGCACHE_MAPLE,
> +	.reg_defaults		=3D es8328_reg_defaults,
> +	.num_reg_defaults	=3D ARRAY_SIZE(es8328_reg_defaults),

[Severity: High]
Won't adding es8328_reg_defaults to es8328_regmap_config in
sound/soc/codecs/es8328.c without resetting the codec on probe cause the
regmap cache and hardware state to drift apart when the chip is left in a
non-default state?

Without reg_defaults, an empty REGCACHE_MAPLE cache causes _regmap_read() to
miss in regcache_read(), read the live register value from the chip via
map->reg_read(), and cache that value. With es8328_reg_defaults provided,
regcache_init() pre-populates the maple tree cache with power-on reset valu=
es
for every register without reading from or writing to the hardware.

However, neither es8328_probe() nor es8328_component_probe() issues a softw=
are
reset (such as ES8328_CONTROL1_SCP_RESET) or syncs the cache to hardware, a=
nd
regulator_bulk_enable() will not power-cycle the codec if the supplies were
already enabled (for example, by a bootloader, across a warm reboot/kexec, =
or
across driver unbind/rebind with always-on regulators):

sound/soc/codecs/es8328.c:es8328_component_probe() {
	es8328 =3D snd_soc_component_get_drvdata(component);

	ret =3D regulator_bulk_enable(ARRAY_SIZE(es8328->supplies),
				    es8328->supplies);
	...
}

Because all registers now hit in the pre-populated cache, _regmap_read() wi=
ll
return the datasheet reset values instead of the actual hardware state duri=
ng
ALSA control reads and initial DAPM widget setup. In addition,
snd_soc_component_update_bits() compares new values against the cached reset
defaults and elides the hardware write whenever they match.

For example, ES8328_DACCONTROL3 is cached as 0x32 (with
ES8328_DACCONTROL3_DACMUTE cleared). If the codec was left muted (0x36) pri=
or
to probe, unmuting in es8328_mute() with mute =3D=3D 0:

sound/soc/codecs/es8328.c:es8328_mute() {
	return snd_soc_component_update_bits(dai->component, ES8328_DACCONTROL3,
			ES8328_DACCONTROL3_DACMUTE,
			mute ? ES8328_DACCONTROL3_DACMUTE : 0);
}

will see ES8328_DACCONTROL3_DACMUTE already cleared in the cache and skip t=
he
register write, leaving the DAC muted in hardware.

Similarly, in es8328_set_dai_fmt() and es8328_hw_params(), updates to
ES8328_MASTERMODE (cached as 0x80, ES8328_MASTERMODE_MSC), ES8328_DACCONTRO=
L1
(cached as 0x00), ES8328_ADCCONTROL4 (cached as 0x00), and ES8328_DACCONTRO=
L6
(cached as 0x08) will be skipped as no-ops when the requested mode, I2S
format, 24-bit word length, or de-emphasis setting matches the cached defau=
lt
rather than the state left in the hardware.

Should the driver reset the hardware in es8328_component_probe() so the chip
is guaranteed to match es8328_reg_defaults?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-es8328-vol=
-init-v1-0-efbd24de9639@163.com?part=3D1
