Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793137185;
	b=fVUa1mey/pOUXw3bTp5wbjZ64WQq2VdSrAIZT84ONhDwo6UcvEPhEwfB2s8r76UH078O
	 2mE1nsrmmBO62QzvztfIsQxIFpoevSF/GgwMb828nnI5hr/PcxqJNzq128CMT2Hn9ckIy
	 sHUgHUSRLi/s/0PLKezp+GdNcrmftQg5hg86htCdHsRgxLX+S7/5WZPL8AfbldFQclz0J
	 oEpttGDepMaWAumvrHVo/agJ95P5ZIiCoNtn3QNXM72ZfwIwgEwY6qVtXFBV6OH/sRfbh
	 XqHfYxf4RJGe0ajbq8wsrM3QTB2dusO1flKjiLAgahJrMLCQ5mLDacxYaJZI0CMF5Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793137185;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Xuma8OO7O3VViBcICTszAcNSNDrylIoxoS5YOYGNlX4=;
	b=qLifQ03f9gwl+9FP7SzNzXPYaguHmt1Puwb/IOBrzjXR0WEljzKUgej32iuRMJ/29klQ
	 jJyF9mHYDPc/l3H390g/9MDt6Y3YEQaOWkjnMos/gyw67S04Jcd4mWRPchDEuPOh7CJft
	 ZL1dAq8e9bd5UZ5GOk3g/I62wUsB+pwQryyMZB/YuDcwTBlk0pNo2FceSsY5Dy3FJ1Wld
	 VrFREUE3xj0MCzfbEkFNb3EuDYa7cw4Zk7RU25x41TIcA1qlzk4qO5qUFGmytU9W38r7k
	 vQBeFihHQnVE3sYQchU9HMD5Ykk7R9TUYq+CDk/Iz+Iff1iN2RgzLw4ZTwdOEV2NtVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Icq8BMRq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2846F606A31D;
	Tue, 27 Oct 2026 21:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Icq8BMRq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5F81F01825;
	Tue, 27 Oct 2026 21:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793137184;
	bh=Xuma8OO7O3VViBcICTszAcNSNDrylIoxoS5YOYGNlX4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Icq8BMRq8O4/LpBuohCDFfioQEDEbPMcHF4SoQAbj1khu4+8xa8xqyWmFb/wgAUEh
	 pTs2vCFxAZr/t4lu7CPUeFuij7Wcjnc8rbP1XRtFkkb55ThDjN2l5hPMsWYqoCjeIu
	 BBvQZ2BK/qSBseyODvn68I5AUjx6IvRlTDF9DSF6qk+5f51U3MgFvkI17noUmyfzDL
	 ffOGDGRQ/r9bld/kOCyTgY5L2VOmtDx5hC6ImQpSX2eHFy/mgjZDvKV5/JIktjJcf2
	 p4Eg7NYo7SoWywywK7UPrYTFv6AxuS6VlsE42BsfuaEWAz6ADJyGXzA04DgutF/w6K
	 wEkR8DK5gwsWg==
Message-ID: <sashiko-outbox-187132@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: mfd: twl4030-audio: document
 preferred name for external mute
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027-twl4030-extmute-v2-2-c7e0c90509a1@gmail.com>
References: <20261027-twl4030-extmute-v2-0-c7e0c90509a1@gmail.com>
 <20261027-twl4030-extmute-v2-2-c7e0c90509a1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 21:39:44 +0000
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
- [Medium] dt-bindings: mfd: twl4030-audio: legacy ti,hs_extmute_gpio not p=
arsed by gpiolib
--

commit 532ee39ea30fdb221d903a6c57f70fe4aec67890
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>

dt-bindings: mfd: twl4030-audio: document preferred name for external mute

This commit documents ti,hs_extmute-gpios as the preferred property name for
the external headset mute GPIO in the twl4030-audio binding and marks
ti,hs_extmute_gpio as deprecated.

> diff --git a/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yam=
l b/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
> index c9c3f7513ad42..399693bed077a 100644
> --- a/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
> +++ b/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
> @@ -39,10 +39,16 @@ properties:
>          description:
>            Enable the use of an external mute for headset pop reduction.
> =20
> +      ti,hs_extmute-gpios:
> +        description:
> +          The GPIO specifier for the external mute control.
> +        maxItems: 1
> +
>        ti,hs_extmute_gpio:
>          $ref: /schemas/types.yaml#/definitions/phandle-array
>          description:
> -          The GPIO specifier for the external mute control.
> +          Deprecated legacy name for ti,hs_extmute-gpios.
> +        deprecated: true
>          maxItems: 1

[Severity: Medium]
Does gpiolib actually resolve the deprecated ti,hs_extmute_gpio property
(with an underscore before gpio) when the driver requests con_id
"ti,hs_extmute"?

In sound/soc/codecs/twl4030.c, twl4030_get_board_params() requests the GPIO
via:

	/*
	 * This will attempt to parse "ti,hs_extmute-gpios" or
	 * "ti,hs_extmute_gpio".
	 */
	params->hs_extmute_gpio =3D devm_fwnode_gpiod_get_optional(dev, codec_node,
								 "ti,hs_extmute",
								 GPIOD_OUT_LOW,
								 "hs_extmute");

However, of_find_gpio() builds property names using
for_each_gpio_property_name() in drivers/gpio/gpiolib.h, which formats
candidates with a hyphen separator over gpio_suffixes[] ("gpios" and "gpio"=
):

	if (con_id)
		snprintf(propname, sizeof(propname), "%s-%s", con_id, __gs);

For con_id "ti,hs_extmute", gpiolib only checks "ti,hs_extmute-gpios" and
"ti,hs_extmute-gpio", not "ti,hs_extmute_gpio", and of_find_gpio_rename() in
drivers/gpio/gpiolib-of.c has no rename entry for this property.

On device trees using the legacy ti,hs_extmute_gpio property, such as
twl_audio in arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi:

	twl_audio: audio {
		compatible =3D "ti,twl4030-audio";
		codec {
			ti,hs_extmute_gpio =3D <&gpio2 25 GPIO_ACTIVE_HIGH>;
		};
	};

devm_fwnode_gpiod_get_optional() will return NULL, leaving external headset
mute disabled or configuring the internal TWL4030_PMBR1_REG EXTMUTE mux
instead of driving the external GPIO when ti,hs_extmute is also present.

Should the driver fall back to requesting the legacy property name (or add a
quirk in gpiolib-of.c) so that existing device trees using ti,hs_extmute_gp=
io
continue to work?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-twl4030-ex=
tmute-v2-0-c7e0c90509a1@gmail.com?part=3D2
