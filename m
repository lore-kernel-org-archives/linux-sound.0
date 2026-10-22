Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792701895;
	b=BAG3224MoJVhyloSOLQoIAUxTFy5IIrbkq6bX8K/gckHYfgLOZ+Gscr1lzmBP+xUp3Af
	 516CwhEyMCR1h8rO+NTceG5brPfKlbOjnAL6TbY2Z6X0Eo05183+TWg9BW2KWrRcCRIe4
	 Z+Seh46PEfFWRxqiVDi5SYHFsCLcMw4TBhpbVqy8MVwWcLVutdsoF0hgs2gy8SSpfZLcR
	 totvj0RgFW/DlLI+fxdvnzE4ZkBqmvUL82mWqCNJY+6jn7WDnExJcTEkcufneVUyGmNpi
	 dHr8eIqr/PeKA5L+kBLVj0+P9wweiEwg9M1cLvAmJ/EYm3P+H4iw4j8+7jde7sVd+Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701895;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+ukyVStRq6aCLwTUj2EOn6H9yXqMS7cgPE9KOnM6X60=;
	b=bOWuIRBu/EVdpcXInoepp40ZByA75yIaUTXgsyvnJIlanudw15iEZhH7450XuDydrgM+
	 c2uss4M3/JFcr0T0Hkr6YlL8bR/DC4Wrk8PtMgnE06iZeiBTmUF1VKoh3fePbi3iFjPxZ
	 IsjjLp9bdraFuhUp6aWQwPncJUyKbt/ge7arRW1OYt00z/2IpOCFeTtKcVXu9NNgiuE1p
	 5JAPtqU6isdndJhrbX5i6TC1BG9cc+WiNVR+33g/RYY3wDwSUDXc+307No5XbYz/FiM2m
	 4LqWP/VjQxjC7LZrFtYfLbmXQoovfAkVxmFaIjIvJ8N1TyfRqzAeG8XoWMCXGFiFM/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gGWpJd+K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02190606A31A;
	Thu, 22 Oct 2026 20:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gGWpJd+K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 784761F01828;
	Thu, 22 Oct 2026 20:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792701894;
	bh=+ukyVStRq6aCLwTUj2EOn6H9yXqMS7cgPE9KOnM6X60=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gGWpJd+KXy0s92mhP5xb4+TALCuObmz3D/xa69iM8om3ypid91YQ1VpqhQQKp1nv+
	 53QPyYFCjZ3wrin56UcKh0krDK5ALapcDOANUOC4ChfBkA3xDCjUXb2zcRh24FvpJ3
	 bU2G60+8z6MO1Z/oyUC0tEcPkjiddaDzghPrf9P9PPRmEvDe8mrCH5C2oS3Srfrfpn
	 g/d9AX/dnfMZHHa9/PS5K6QrQHzV7OywQh0rvT5cAhi1eX4DJvhSxbeJ2rrDUZ8ud2
	 FbyyrsA3qgGWosEq8gMBEJv6cUNkNb1Q+BnCB6y2ne4s43vSyG8cpfAY8PlyLey/nC
	 Xm0F1g2jkQgIw==
Message-ID: <sashiko-outbox-182022@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: mfd: twl4030-audio: document preferred
 name for external mute
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022-twl4030-extmute-v1-2-3d2dbe260df9@gmail.com>
References: <20261022-twl4030-extmute-v1-0-3d2dbe260df9@gmail.com>
 <20261022-twl4030-extmute-v1-2-3d2dbe260df9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 20:44:54 +0000
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
- [Medium] dt-bindings: sound: ti,twl4030-audio: invalid $ref and missing d=
eprecated tag
- [Medium] ASoC: twl4030: legacy ti,hs_extmute_gpio property not matched by=
 gpiolib
--

commit 43d9eacfe52fdbf41c021df1d5b980ba9e4220b9
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>

dt-bindings: mfd: twl4030-audio: document preferred name for external mute

This commit updates the ti,twl4030-audio binding schema to document
ti,hs_extmute-gpios as the preferred external mute gpio property name and
retain ti,hs_extmute_gpio as a deprecated legacy property.

> diff --git a/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yam=
l b/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
> index c9c3f7513ad42..1d41f582261db 100644
> --- a/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
> +++ b/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
> @@ -39,12 +39,18 @@ properties:
>          description:
>            Enable the use of an external mute for headset pop reduction.
> =20
> -      ti,hs_extmute_gpio:
> +      ti,hs_extmute-gpios:
>          $ref: /schemas/types.yaml#/definitions/phandle-array
>          description:
>            The GPIO specifier for the external mute control.
>          maxItems: 1

[Severity: Medium]
Will keeping $ref: /schemas/types.yaml#/definitions/phandle-array under
properties.codec.properties.ti,hs_extmute-gpios in
Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml cause a schema
validation error when running dt_binding_check?

The explicit phandle-array $ref was previously required on ti,hs_extmute_gp=
io
because its underscore _gpio suffix did not match standard gpio suffix
patterns. Because ti,hs_extmute-gpios uses the standard -gpios suffix, the
core dtschema meta-schema (meta-schemas/gpios.yaml and
schemas/gpio/gpio-consumer.yaml) automatically assigns its type and sets
additionalProperties: false, which disallows an explicit $ref to
phandle-array.

Also, for properties.codec.properties.ti,hs_extmute_gpio below, should
deprecated: true be added to the property definition in addition to the
description text so that dtschema validation tools recognize
ti,hs_extmute_gpio as deprecated?

> =20
> +      ti,hs_extmute_gpio:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +        description:
> +          Deprecated legacy name for ti,hs_extmute-gpios.
> +        maxItems: 1

[Severity: Medium]
Can gpiolib actually resolve the deprecated ti,hs_extmute_gpio property
documented here at properties.codec.properties.ti,hs_extmute_gpio when a
device tree uses the legacy underscore name (for example, under twl_audio in
arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi)?

During driver probe, twl4030_get_hw_params() calls
twl4030_get_board_params() in sound/soc/codecs/twl4030.c (updated in commit
"ASoC: codecs: twl4030: fix external mute GPIO lookup"):

	/*
	 * This will attempt to parse "ti,hs_extmute-gpios" or
	 * "ti,hs_extmute_gpio".
	 */
	params->hs_extmute_gpio =3D devm_fwnode_gpiod_get_optional(dev, codec_node,
								 "ti,hs_extmute",
								 GPIOD_OUT_LOW,
								 "hs_extmute");

This calls into gpiod_find_and_request() -> of_find_gpio() in
drivers/gpio/gpiolib-of.c:

	/* Try GPIO property "foo-gpios" and "foo-gpio" */
	for_each_gpio_property_name(propname, con_id) {
		desc =3D of_get_named_gpiod_flags(np, propname, idx, &of_flags);
		if (!gpiod_not_found(desc))
			break;
	}

	/* Properly named GPIO was not found, try workarounds */
	for (q =3D of_find_gpio_quirks; gpiod_not_found(desc) && *q; q++)
		desc =3D (*q)(np, con_id, idx, &of_flags);

However, for_each_gpio_property_name() in drivers/gpio/gpiolib.h formats
candidate names using a hyphen:

#define for_each_gpio_property_name(propname, con_id)					\
	for (const char * const *__suffixes =3D gpio_suffixes;				\
	     *__suffixes && ({								\
		const char *__gs =3D *__suffixes;						\
											\
		if (con_id)								\
			snprintf(propname, sizeof(propname), "%s-%s", con_id, __gs);	\

Because this only checks ti,hs_extmute-gpios and ti,hs_extmute-gpio, and
of_find_gpio_rename() in drivers/gpio/gpiolib-of.c has no entry mapping
ti,hs_extmute to ti,hs_extmute_gpio, devm_fwnode_gpiod_get_optional() retur=
ns
NULL for boards specifying ti,hs_extmute_gpio.

When ti,hs_extmute is absent, external mute is silently skipped in
headset_ramp(). When ti,hs_extmute is set alongside ti,hs_extmute_gpio,
twl4030_get_hw_params() in sound/soc/codecs/twl4030.c sees a null
hs_extmute_gpio and reprograms TWL4030_PMBR1_REG to mux the internal
gpio6/pwm0 pin as extmute instead of using the external gpio:

	if (board_params && board_params->hs_extmute &&
	    !board_params->hs_extmute_gpio) {
		u8 pin_mux;

		dev_info(dev, "use TWL4030 GPIO6\n");

		/* Set TWL4030 GPIO6 as EXTMUTE signal */
		twl_i2c_read_u8(TWL4030_MODULE_INTBR, &pin_mux,
				TWL4030_PMBR1_REG);
		pin_mux &=3D ~TWL4030_GPIO6_PWM0_MUTE(0x03);
		pin_mux |=3D TWL4030_GPIO6_PWM0_MUTE(0x02);
		twl_i2c_write_u8(TWL4030_MODULE_INTBR, pin_mux,
				 TWL4030_PMBR1_REG);
	}

Does of_find_gpio_rename() in drivers/gpio/gpiolib-of.c (or a fallback look=
up
in twl4030_get_board_params()) need to handle ti,hs_extmute_gpio so legacy
device trees continue to work as documented by this binding?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-twl4030-ex=
tmute-v1-0-3d2dbe260df9@gmail.com?part=3D2
