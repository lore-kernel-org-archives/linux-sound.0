Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201806;
	b=nj/AfRf3DF7kxB970PBCTxJjXTABfPnD0+3jkUsBgyT/RdUqoQlNuCk8DGhIKYvZV0p5
	 XXANsWHE4dy6I+Lq8q7TnD5lDBaLnsWFRuRchutugIrBkpHni97JE/ZEGi417SX1MkEYa
	 F6xILYFsgAuJSuusnsOQeNintk4yjlmV8GxBMyX40tej+EHDpVfjOww7MhvOjYUiMkdlK
	 Cj8g3J7f1Bn0WDx3+NLo60KRtbkQlX5xgQ29oUixloaHT0nUP7JoZHFsK0kbh1IucI/T8
	 giSkDsE7n3/hCfVpvEdKVt/26gMpjQ97JA4f3p7j+TEBZY+V5x3+I46HRv9mjSIwWfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201806;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NJ7KxDbRPbylmFAPMsRT6r3JxS7V/VdYk7aTcCfsnjk=;
	b=aRDRTjenk4Ur8bYtsH3PJ5cVv06Oby5J4MOxdTYMZSeiAdj+8k3s8P1RV62+Nge97ExE
	 z5lZbKjfV16M3Fb0MGl9SSWp9/7oob/5dEiNlCLMjE1lvNj6gZ75OByW35VzSAzGhbbub
	 +pwinOHLbzaVoOD7gmJ820SshNxO4SNdRbF3pMg/ri66oCtpRz4ou64iqOHAEp883bFTD
	 eBH00ncS/Ks9bPdPVEb9H9uBOU37T9rpZOKqzd9vQi4bC7peWTngZtdKVQl/MZj7tVKFX
	 rpmYYClnbQTM5VFszulbRn2uHD65mQaaTNM8Fr4hx/OtGLnI2dWSiZg4Sqe60lyKWvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mk+v121V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22CE606A31C;
	Mon,  9 Nov 2026 05:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mk+v121V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2817E1F0089F;
	Mon,  9 Nov 2026 05:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794201805;
	bh=NJ7KxDbRPbylmFAPMsRT6r3JxS7V/VdYk7aTcCfsnjk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mk+v121VJElULRRsBaYvdeeoAikowRdOr7G1ubaTrlZXMDDudoGOVEd8O+S0KwZuF
	 ceLBmaOvsGKSDX0/V+IR/8OK8k5hqJ8VOSzT27PY3FYwEPm3G2KV7lSkSsWhBd7ELI
	 jmQ478BneBjnm7zWz1k9hitOpjXTUerhDa5kGpszXyy1NmPSVSVSnBKUn+toLllFbf
	 craU9h6jbbieeR1SEMzQSUqQ1KACUarweqoNjSxm7o87oQ+a+topNe18wcQ5pqiWCt
	 2ifmfJzWaqlCLpDQSD4tLSiZs+EdFG9rAD96uGa0KcAvNz+aKCB5b6rPggxv3sjIAu
	 DVrpTLCxx2s+A==
Message-ID: <sashiko-outbox-204432@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: nuvoton,nau8310: Add NAU83G10
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109051251.471879-2-YLCHANG2@nuvoton.com>
References: <20261109051251.471879-1-YLCHANG2@nuvoton.com>
 <20261109051251.471879-2-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 05:23:24 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] ASoC: dt-bindings: nuvoton,nau8310: inverted
  clock-det-disable description
- [Medium] ASoC: dt-bindings: nuvoton,nau8310: raw register values
  instead of units
- [Medium] ASoC: dt-bindings: nuvoton,nau8310: unconstrained nau8320
  variant properties
--

commit e187fb8f9c949cae2d11b255f2782d69bf853e02
Author: Neo Chang <YLCHANG2@nuvoton.com>

ASoC: dt-bindings: nuvoton,nau8310: Add NAU83G10

This commit adds Device Tree binding documentation for the Nuvoton
NAU83G10 and NAU83G20 mono Class-D audio amplifiers.

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
Should the boost converter properties (nuvoton,boost-delay,
nuvoton,boost-convert-enable, nuvoton,boost-target-limit, and
nuvoton,boost-target-margin) be disallowed for nuvoton,nau8320 via an
allOf if/then constraint?

In the driver, nau8310_read_device_properties() only parses those four
properties when silicon_id is NAU8310_REG_SI_REV_G10, so a nuvoton,nau8320
node with boost properties will pass schema validation while the driver
ignores them.  The commit message also only mentions NAU83G10 and omits
NAU83G20.

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
> +
> +  nuvoton,clock-det-data:
> +    type: boolean
> +    description:
> +      Clock detection non-zero samples configuration for power up signal.

[Severity: Medium]
Is the description for nuvoton,clock-det-disable inverted relative to its
name?

In the driver, nau8310_read_device_properties() sets clock_detection to
!device_property_read_bool(dev, "nuvoton,clock-det-disable") and
nau8310_init_regs() sets NAU8310_CLKPWRUP_DIS when !clock_detection, so
this boolean property disables clock detection rather than enabling it.
The example below also sets both nuvoton,clock-det-disable and
nuvoton,clock-det-data together.  In addition,
Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml already uses
nuvoton,clock-detection-disable for this feature.

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
Should these properties use physical units and standard unit suffixes
instead of raw register selector values?

Per Documentation/devicetree/bindings/writing-bindings.rst, properties
representing physical quantities should use standard unit suffixes (-ohms,
-microvolt, -ns, -us, -ms) rather than raw register encodings.
Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml already
defines nuvoton,vref-impedance-ohms (enum [0, 25000, 125000, 2500]) and
nuvoton,dac-vref-microvolt.

Here, nuvoton,vref-impedance, nuvoton,dac-vref, nuvoton,sar-compare-time,
nuvoton,sar-sampling-time, nuvoton,boost-delay, nuvoton,boost-target-limit,
and nuvoton,boost-target-margin all expose raw register codes or step
counts.  nuvoton,boost-convert-enable also uses a boolean-style -enable
name for a 2-bit register field where both 0 and 2 mean disabled, and
nuvoton,sar-voltage exposes duplicate register values 0 and 1 for 1.0 *
VDDA.  Finally, the schema defaults for nuvoton,vref-impedance (0),
nuvoton,boost-delay (0), nuvoton,boost-target-limit (63), and
nuvoton,boost-target-margin (0) do not match the driver defaults in
nau8310_read_device_properties() (2, 0x8, 0x32, and 0x2).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109051251.4718=
79-1-YLCHANG2@nuvoton.com?part=3D1
