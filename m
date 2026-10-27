Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793137201;
	b=GPa+2Rc1JZpsyM3VHrFNp8edoD5iarCjd94yr5xkGZAntCNKQasPTwi335Sx8BvkcFCt
	 NKcaEVTQg0eIJiO5XsqOcFe3jTo/t/zmn+zf+kKi2fq0QEF07dSdXdwWJ3zGPnJknHWSu
	 Wtrj72uhTrtH3tQVxn8hVcaSlcZe4sxwExpQKSlJV7jKlwPZNnkKv/qv2S7mzbbmsXZ0d
	 8C4xW9lcAJsjI7KhSmnFonX8L5QmOWCeH/q1GcTT/JeEkoLovn0RuKTLag0yNubWbuZSO
	 rzZn0fJSDbKdEG2PblotzaIn2aSaylg1IuGTzI1MOCDGccDf9F61V1P2yVw6MfSOtjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793137201;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0O5/u60kefKEgQWoB5mMsVGarzwnUh/zwcowX1YUevY=;
	b=Bb+0Y49oWgQQHVHW0ZblEvuiP5F7BP5C0qNfJmkVwViLv+ociwkFmr4Lv1TlY2HFohD3
	 E2RkX7zoXsjRek6MKCTWwm7BJYSupfxf/S+PI2veTSarDb35/+zMzKMKbIOfdOXzkayUp
	 lrMWWQf+q71w4WJO3g3b6JxNVnBL+edk4k+5AqzeS8KnsRDnTJtdcjGQsCQakE0EWkGua
	 57IE+OzgSgrhnubdwo6AviScnNhvoUlf0hSSHSS6wk3qQ24Jqhtl3qolTQivrNUW/IhZz
	 klkUtmALuu+nM2hQtYqTch/L+QecuMfNpH7clSv0aKYiXdZWDpctYYg47fcwkkFPSYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqpWOD3Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF00606A31D;
	Tue, 27 Oct 2026 21:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqpWOD3Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB451F01828;
	Tue, 27 Oct 2026 21:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793137201;
	bh=0O5/u60kefKEgQWoB5mMsVGarzwnUh/zwcowX1YUevY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MqpWOD3Y41qUZzR6Aw0rJeKr6ItsyWP4OsFrqJdnm958bMR1EuraDwwJW8q5UCeKv
	 mIzfEZQ/9qrf6vcTqobNa9ofr1e+9pqvxgRgoGmrR0OyuntZdspvoUbPVtedxG8831
	 ezkj0Tg0xKbZo+kSgMgf9YfVMWhmoBIbHIMQlul36A5VMIYpyqohqX+t0JDV/a/FEB
	 6kES4EIhwrO1xe6bqhdqefnqEyDdxdWIGRzXcKv71n13K48s2c4I8O1k/H1bUpGFYr
	 2E2HDjK588GObtbgxRjCw3jSWqsXA85q6IBam+rkD5Hoy+qKVQuqgYDm1OaKISAPvO
	 gP2LTHstJPv5Q==
Message-ID: <sashiko-outbox-187135@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: codecs: twl4030: fix external mute GPIO
 lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027-twl4030-extmute-v2-1-c7e0c90509a1@gmail.com>
References: <20261027-twl4030-extmute-v2-0-c7e0c90509a1@gmail.com>
 <20261027-twl4030-extmute-v2-1-c7e0c90509a1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 21:40:00 +0000
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
- [High] ASoC: twl4030: broken ti,hs_extmute_gpio lookup in twl4030_get_boa=
rd_params()
--

commit 4ac8bbc6b258588c0a2286c88c8f200492ec2c36
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>

ASoC: codecs: twl4030: fix external mute GPIO lookup

This commit switches twl4030_get_board_params() to fwnode APIs and acquires
the external mute GPIO descriptor directly from the "codec" child firmware
node using devm_fwnode_gpiod_get_optional().

> diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
> index 7117af5a1a569..9541c8a5a24e8 100644
> --- a/sound/soc/codecs/twl4030.c
> +++ b/sound/soc/codecs/twl4030.c

[ ... ]

> @@ -198,41 +199,53 @@ static void twl4030_codec_enable(struct snd_soc_com=
ponent *component, int enable
>  	udelay(10);
>  }
> =20
> -static void
> -twl4030_get_board_param_values(struct twl4030_board_params *board_params,
> -			       struct device_node *node)
> +static struct twl4030_board_params *twl4030_get_board_params(struct devi=
ce *dev)
>  {
> -	of_property_read_u32(node, "ti,digimic_delay", &board_params->digimic_d=
elay);
> -	of_property_read_u32(node, "ti,ramp_delay_value", &board_params->ramp_d=
elay_value);
> -	of_property_read_u32(node, "ti,offset_cncl_path", &board_params->offset=
_cncl_path);
> -	board_params->hs_extmute =3D of_property_read_bool(node, "ti,hs_extmute=
");
> +	struct twl4030_board_params *params;
> +	int error;
> =20
> -	if (of_property_present(node, "ti,hs_extmute_gpio"))
> -		board_params->hs_extmute =3D 1;
> -}

[ ... ]

> +	/*
> +	 * This will attempt to parse "ti,hs_extmute-gpios" or
> +	 * "ti,hs_extmute_gpio".
> +	 */
> +	params->hs_extmute_gpio =3D devm_fwnode_gpiod_get_optional(dev, codec_n=
ode,
> +								 "ti,hs_extmute",
> +								 GPIOD_OUT_LOW,
> +								 "hs_extmute");

[Severity: High]
Will devm_fwnode_gpiod_get_optional() with con_id "ti,hs_extmute" actually
find the legacy "ti,hs_extmute_gpio" property (with an underscore)?

In drivers/gpio/gpiolib.h, for_each_gpio_property_name() constructs candida=
te
property names using a hyphen separator:

	if (con_id)
		snprintf(propname, sizeof(propname), "%s-%s", con_id, __gs);

With gpio_suffixes[] containing "gpios" and "gpio", passing "ti,hs_extmute"
makes of_find_gpio() in drivers/gpio/gpiolib-of.c look up
"ti,hs_extmute-gpios" and "ti,hs_extmute-gpio", and there is no entry in
of_find_gpio_rename() mapping "ti,hs_extmute" to "ti,hs_extmute_gpio".

However, both Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
and arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi spell the legacy property
with an underscore:

	twl_audio: audio {
		compatible =3D "ti,twl4030-audio";
		codec {
			ti,hs_extmute_gpio =3D <&gpio2 25 GPIO_ACTIVE_HIGH>;
		};
	};

On boards using "ti,hs_extmute_gpio", devm_fwnode_gpiod_get_optional() will
return NULL. When "ti,hs_extmute" is absent (as in logicpd-som-lv.dtsi), bo=
th
params->hs_extmute_gpio and params->hs_extmute remain unset, leaving extern=
al
mute disabled. When "ti,hs_extmute" is present alongside
"ti,hs_extmute_gpio", twl4030_get_hw_params() sees params->hs_extmute =3D=
=3D 1 and
!params->hs_extmute_gpio, causing it to mux TWL4030's internal GPIO6 as
EXTMUTE instead of driving the external GPIO.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-twl4030-ex=
tmute-v2-0-c7e0c90509a1@gmail.com?part=3D1
