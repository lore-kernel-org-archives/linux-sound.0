Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659105;
	b=L2exHlWmPuHzYdkikKiK2DIyXDnAAhwJKeqizPLj9W/0DsyXgHUR7jtEUeq3Pxo+herk
	 hBQ+dnRqJ+I1wJDQOvj8rqV46MIQMwHbfWK1DFQU3XNHll0hjsnZvpuHD3SGInitpsZzY
	 I8FGrIgdHAR1Qjwexly1krD6lD94uXWx5JWcn4U+VQtmyGe3gopVPfFyZ0kncAUriH0I5
	 iTEHnG0pzCwUh1TeZYDdky+2tqZDuo+Gui1MN+8zzFGFnIAK+sdVqvQUtAvROXgxlpOIr
	 xdR0fkXPNSx1KnMH2X3I5VotAhpmBJYrM3ES3LG7KZaLlyD+6CwA6gDijh8/cZWbnSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659105;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ksFrELXIiwrK5kKPEgz2g60q+qfEzwI4wfenf9ZhiO4=;
	b=thRRpxHXB4XX/BSo/zO1cMR9Wc86N+3CsluIEY8b45sGkJ7Rlwp+caEIGLMHcMImLbrG
	 OHXSC5A/BReHwYWoxd5HURiQC9Ww9SJcyQyo3HRcjo30VZNs5ld1b/9HKvcOn9Jv7eKxV
	 9PGeME3dRRwyvCu9lIclxXVvT+WvKxGMfuPu1GZcSVMmJMVcp/ozBHiflXyTTynXGKd6d
	 cElrjZRC6TmgJLmi6zcrXJ0O9KRy7UyoJBwIwtJQWpAEcgzuCGysf0IXaAlgcdsOfm3iq
	 07fhzwIBKeldjezzAbbOliuSHeTOiWgGo8mElZt0LI6IW10Fs0OKL6WZXhLcEwXWhnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="A/r1WbMr";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA18606A319;
	Thu, 22 Oct 2026 08:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A/r1WbMr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADE41F000C1;
	Thu, 22 Oct 2026 08:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792659104;
	bh=ksFrELXIiwrK5kKPEgz2g60q+qfEzwI4wfenf9ZhiO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A/r1WbMrQMOzw2UAsI+AZy3mJQXpBxJ7RvdhwoBbX+lm4baduEpWzb25ef2+nQ5Mp
	 W7YMdliLTA0NJeeB9UJOr/fVOAy1RLOomdEGM6KlgUh6jiO26ppCFnFMgnsHvXKW/Z
	 HN7Qqttfe0TwaBM1PwqjmXjRuzdVTBvaOa1rCZgBm1ec/mU8AdQrz0/l/Z0CopXe4r
	 kGvXSiSLI3yccQHfnVHorHgnCZklaG1r4z/ZJFokkozYkZhM/pHjCHK55Xmv4rx5Re
	 C7r2JrXeKAza6ga4sXm0INjp29X8zCpr1rtGKgXZYOP6BhZotQY7jEYYtkqhRjfRAC
	 eZt/WYVLq2hjw==
Message-ID: <sashiko-outbox-181207@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: nuvoton,nau8310: Add NAU83G10
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022084037.259983-2-YLCHANG2@nuvoton.com>
References: <20261022084037.259983-1-YLCHANG2@nuvoton.com>
 <20261022084037.259983-2-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 08:51:43 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] ASoC: dt-bindings: nuvoton,nau8310: inverted clock-det-disable d=
escription
- [Medium] ASoC: dt-bindings: nuvoton,nau8310: raw register values instead =
of units
- [Medium] ASoC: dt-bindings: nuvoton,nau8310: unconstrained nau8320 varian=
t properties
--

commit 01b8fdb80988a85278fec4d71b7b4a47411ed6ee
Author: Neo Chang <YLCHANG2@nuvoton.com>

ASoC: dt-bindings: nuvoton,nau8310: Add NAU83G10

This commit adds the device tree binding schema in
Documentation/devicetree/bindings/sound/nuvoton,nau8310.yaml for the
Nuvoton mono class-d audio amplifier family.

> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8310.yaml=
 b/Documentation/devicetree/bindings/sound/nuvoton,nau8310.yaml
> new file mode 100644
> index 0000000000000..5a5142a583ed1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8310.yaml
> @@ -0,0 +1,200 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nuvoton,nau8310.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NAU83G10/20 Mono Class-D Amplifier with DSP
> +
> +description:
> +  Mono Class-D Amplifier with DSP and I/V-sense.
> +  This device supports I2C.
> +
> +maintainers:
> +  - Neo Chang <YLCHANG2@nuvoton.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,nau8310
> +      - nuvoton,nau8320

[Severity: Medium]
Should Documentation/devicetree/bindings/sound/nuvoton,nau8310.yaml restrict
the boost converter properties when compatible is set to nuvoton,nau8320?

In sound/soc/codecs/nau8310.c, nau8310_read_device_properties() only reads
nuvoton,boost-delay, nuvoton,boost-convert-enable,
nuvoton,boost-target-limit, and nuvoton,boost-target-margin for
nuvoton,nau8310 and ignores them on nuvoton,nau8320:

    if (nau8310->silicon_id =3D=3D NAU8310_REG_SI_REV_G10) {
        ret =3D device_property_read_u32(dev, "nuvoton,boost-delay",
            &nau8310->boost_delay);
        ...
    }

Without an allOf if/then block setting those four properties to false for
nuvoton,nau8320, devicetree nodes for nuvoton,nau8320 with boost converter
properties will pass schema validation even though the driver ignores them.
Should the commit message also mention nuvoton,nau8320 alongside
nuvoton,nau8310?

[ ... ]

> +  nuvoton,vref-impedance:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      VREF Impedance Selection.
> +    enum:
> +      - 0 # Open
> +      - 1 # 25 kOhm
> +      - 2 # 125 kOhm
> +      - 3 # 2.5 kOhm
> +    default: 0
> +
> +  nuvoton,dac-vref:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      DAC Reference Voltage Setting.
> +    enum:
> +      - 0 # Voltage source directly from VDDA pin
> +      - 1 # VDDA * 1.5/1.8V
> +      - 2 # VDDA * 1.6/1.8V
> +      - 3 # VDDA * 1.7/1.8V
> +    default: 1
> +
> +  nuvoton,sar-voltage:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      SAR Gain Tracking Selection.
> +    enum:
> +      - 0 # VDDA
> +      - 1 # VDDA * 1.0
> +      - 2 # VDDA * 1.1
> +      - 3 # VDDA * 1.2
> +      - 4 # VDDA * 1.3
> +      - 5 # VDDA * 1.4
> +      - 6 # VDDA * 1.54
> +      - 7 # VDDA * 3.12
> +    default: 0
> +
> +  nuvoton,sar-compare-time:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      SAR compare time.
> +    enum:
> +      - 0 # 500 ns
> +      - 1 # 1 us
> +      - 2 # 2 us
> +      - 3 # 4 us
> +    default: 1
> +
> +  nuvoton,sar-sampling-time:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      SAR sampling time.
> +    enum:
> +      - 0 # 2 us
> +      - 1 # 4 us
> +      - 2 # 8 us
> +      - 3 # 16 us
> +    default: 1
> +
> +  nuvoton,clock-det-disable:
> +    type: boolean
> +    description:
> +      Enable Clock Detection Module.

[Severity: Medium]
Is the description for nuvoton,clock-det-disable in
Documentation/devicetree/bindings/sound/nuvoton,nau8310.yaml inverted
relative to the property name and driver behavior?

In sound/soc/codecs/nau8310.c, nau8310_read_device_properties() and
nau8310_init_regs() disable clock detection when nuvoton,clock-det-disable
is present in the devicetree node:

    nau8310->clock_detection =3D
        !device_property_read_bool(dev, "nuvoton,clock-det-disable");

    if (!nau8310->clock_detection)
        regmap_update_bits(nau8310->regmap, NAU8310_REG_CLK_DET,
            NAU8310_CLKPWRUP_DIS, NAU8310_CLKPWRUP_DIS);

Also, Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml already
defines nuvoton,clock-detection-disable for this feature. Could this binding
reuse nuvoton,clock-detection-disable and state that it disables the clock
detection module?

> +
> +  nuvoton,clock-det-data:
> +    type: boolean
> +    description:
> +      Clock detection non-zero samples configuration for power up signal.
> +
> +  nuvoton,boost-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Boost Control Hold Timer in decrement (msec).
> +    enum:
> +      - 0 # 0 msec
> +      - 1 # 1 msec
> +      - 2 # 2 msec
> +      - 3 # 4 msec
> +      - 4 # 8 msec
> +      - 5 # 16 msec
> +      - 6 # 32 msec
> +      - 7 # 64 msec
> +      - 8 # 128 msec
> +    default: 0
> +
> +  nuvoton,boost-convert-enable:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Boost Convert Enable.
> +    enum:
> +      - 0 # BOOST CONVERTER disabled
> +      - 1 # BOOST CONVERTER enable gated by POWERUP signal
> +      - 2 # BOOST CONVERTER disabled
> +      - 3 # BOOST CONVERTER enabled
> +    default: 0
> +
> +  nuvoton,boost-target-limit:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Boost Control Target Value Limit.
> +      The value ranges from 0 to 63, representing 0V to 12V with a 0.19V=
 step.
> +    minimum: 0
> +    maximum: 63
> +    default: 63
> +
> +  nuvoton,boost-target-margin:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Boost Margin Value between Boost Target Voltage and peak output le=
vel.
> +      The value ranges from 0 to 63, representing 0V to 12V with a 0.19V=
 step.
> +    minimum: 0
> +    maximum: 63
> +    default: 0

[Severity: Medium]
Could these vendor properties in
Documentation/devicetree/bindings/sound/nuvoton,nau8310.yaml use standard
unit suffixes and physical values instead of raw register encodings?

Specifically:
- nuvoton,vref-impedance and nuvoton,dac-vref use raw register indices 0..3,
  whereas Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
  already defines nuvoton,vref-impedance-ohms and nuvoton,dac-vref-microvol=
t.
- nuvoton,sar-compare-time, nuvoton,sar-sampling-time, nuvoton,boost-delay,
  nuvoton,boost-target-limit, and nuvoton,boost-target-margin expose raw
  register indices or step counts (0..3, 0..8, 0..63) rather than physical
  values with -ns, -us, -ms, and -microvolt suffixes.
- The schema default values for nuvoton,vref-impedance (0),
  nuvoton,boost-delay (0), nuvoton,boost-target-limit (63), and
  nuvoton,boost-target-margin (0) do not match the defaults applied in
  nau8310_read_device_properties() (2, 0x8, 0x32, and 0x2).
- nuvoton,boost-convert-enable has a boolean-style -enable suffix for a
  uint32 register field where both 0 and 2 mean disabled, and
  nuvoton,sar-voltage exposes duplicate register values 0 and 1 for the same
  1.0 gain setting.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022084037.2599=
83-1-YLCHANG2@nuvoton.com?part=3D1
