Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D65235C01;
	Thu,  2 Apr 2026 07:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775116419; cv=none; b=HvIw62bs1Ga7W+o4p4QN/hFcM7QrVmnFk55P93KDN/mRoObqjvBoDicjV0pwGWFw71BrrTRujUbK5GifPi3Z0Ugrwc2Tq8E3GyHzYQknL6qwv8m/eO+k+FcRaP83nf0rDtB5LpI86j2n88Af0Q0hQJXgBzSCTXiWY7OSPDEVY2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775116419; c=relaxed/simple;
	bh=g0zM7ZtHt2sfKk7kd+TUQ3hjLmi1SrZbzivvRU6y7aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/rHBUm+pSlcGRVzNcXqgWZViKHY8jAcAln+waAOLF5pvDk6KBGGENoxMFuFd+VKAsqGU7FDHLZb2EaBaPyUR4iPgdY8axs22617l5fjzfn4JGK+aTSsP/qQifOxLC6EyGO4v0cSBh1kPvBhDC5ZamiWkS5GgAB/fSyNFfvKZco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aIM4QRoI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aIM4QRoI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4007CC19423;
	Thu,  2 Apr 2026 07:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775116418;
	bh=g0zM7ZtHt2sfKk7kd+TUQ3hjLmi1SrZbzivvRU6y7aE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aIM4QRoIod9slbfeui7ZMfcH6mZ07JQpOmd23ML4MRRrH5klkv7yKYh2nMQjkeHi2
	 LtF0OT00et2IFI/QCs0Q3Z6G+WwBubdI6PUh8sqOKWZ4uQkbJT65OsL6od+p5GIcJG
	 tzAs1U4gUlA1YDA93ZhiJ1Sh2yZp/A86dRvU6Dn1Rb5upWLYpNpMP9gQfGc5UcDtHD
	 aHgIqkLf/SaFJErrsU1cSTXzl7fbRCwkCU6TpS/J0HXguNuKksYWfOgV5JI3+qkn9F
	 l2b+ojjfmiKP12ByuplvnBeWXkUoA3ZDH21gaPXHsnija2TuhwVAqp7d8FfqFuzxuY
	 an4DFfq13Lukw==
Date: Thu, 2 Apr 2026 09:53:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sen Wang <sen@ti.com>
Cc: linux-sound@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, perex@perex.cz, tiwai@suse.com, shenghao-ding@ti.com, 
	kevin-lu@ti.com, baojun.xu@ti.com, niranjan.hy@ti.com, l-badrinarayanan@ti.com, 
	devarsht@ti.com, v-singh1@ti.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: sound: Add ti,tas675x
Message-ID: <20260402-funky-lionfish-of-grandeur-fadba6@quoll>
References: <message-id-of-your-RFC-cover-letter>
 <20260401223239.1638881-1-sen@ti.com>
 <20260401223239.1638881-2-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401223239.1638881-2-sen@ti.com>

On Wed, Apr 01, 2026 at 05:28:42PM -0500, Sen Wang wrote:
> Add device tree binding for the Texas Instruments TAS675x family
> of four-channel Class-D audio amplifiers with integrated DSP.
> 
> Signed-off-by: Sen Wang <sen@ti.com>

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

> ---
>  .../devicetree/bindings/sound/ti,tas675x.yaml | 278 ++++++++++++++++++

Filename matching compatible, one of them.

>  1 file changed, 278 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,tas675x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,tas675x.yaml b/Documentation/devicetree/bindings/sound/ti,tas675x.yaml
> new file mode 100644
> index 000000000000..23e4cc77b4ae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,tas675x.yaml
> @@ -0,0 +1,278 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ti,tas675x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TAS675x Audio Amplifier
> +
> +maintainers:
> +  - Sen Wang <sen@ti.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The TAS675x family (TAS6754, TAS67524) are four-channel, digital-input,

And devices are not compatible?

> +  automotive Class-D audio amplifiers with load diagnostics and an integrated
> +  DSP for audio processing.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tas6754
> +      - ti,tas67524

Keep alphanumerical order (not natural).

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    const: 1
> +    description: |
> +      The device exposes three DAIs, selected by index.
> +        0 - Standard Audio Path (Playback)
> +        1 - Low-Latency Playback Path (Playback)
> +        2 - Sensory Feedback (Capture - Vpredict and Isense)
> +      By default, all four channels of each DAI are active. Runtime
> +      reconfiguration is available through DAPM widgets.
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      Active-low falling-edge interrupt from the FAULT pin. When provided,
> +      the driver uses IRQ-driven fault reporting instead of polling.
> +
> +  pd-gpios:

Use names from gpio-consumer-common

> +    maxItems: 1
> +    description:
> +      GPIO connected to the power-down (PD#) pin, active low. Controls the
> +      internal digital circuitry power state. When asserted the device enters
> +      full power-down mode and all register state is lost. Can be omitted if
> +      PD pin is hardwired or externally controlled.
> +
> +  stby-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO connected to the standby (STBY#) pin, active low. Controls the
> +      analog power stage. When asserted the device enters Deep Sleep mode
> +      but remains I2C-accessible with registers retained. Can be omitted if
> +      STBY pin is tied to PD or hardwired.
> +
> +  dvdd-supply:
> +    description:
> +      Digital logic supply (1.62 V to 3.6 V). All three supply rails must
> +      be within their recommended operating ranges before the PD pin is
> +      released.
> +
> +  pvdd-supply:
> +    description:
> +      Output FET power supply (4.5 V to 19 V). All three supply rails must
> +      be within their recommended operating ranges before the PD pin is
> +      released.
> +
> +  vbat-supply:
> +    description:
> +      Battery supply for the Class-D output stage (4.5 V to 19 V). Optional
> +      when PVDD and VBAT are connected to the same supply rail. When absent,
> +      VBAT is assumed hardwired to PVDD.
> +
> +  ti,fast-boot:
> +    type: boolean
> +    description:
> +      Skip DC load diagnostic sweep at power-on to reduce boot latency.
> +      Automatic diagnostics after fault conditions remain enabled. Hardware
> +      overcurrent protection is always active.
> +
> +  ti,audio-slot-no:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      TDM slot offset for the standard audio playback path via SDIN1. A value
> +      of 4 maps to slot 4. If omitted, slot assignment is derived from the
> +      tx_mask provided via set_tdm_slot(). Without either property, no slot
> +      mapping is configured.
> +
> +  ti,llp-slot-no:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      TDM slot offset for the low-latency playback path via SDIN1. If omitted,
> +      slot assignment is derived from the tx_mask provided via set_tdm_slot().
> +      Without either property, no slot mapping is configured. Disabled outside
> +      of LLP mode, and only relevant for TDM formats.
> +
> +  ti,vpredict-slot-no:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      In TDM mode, enables Vpredict output and assigns its starting slot;
> +      four consecutive slots carry Vpredict Ch1-4 on SDOUT1. May coexist
> +      with ti,isense-slot-no using separate non-overlapping slots.
> +
> +      In I2S mode, enables Vpredict output on SDOUT1 (Ch1/Ch2) and SDOUT2
> +      (Ch3/Ch4). The slot value is unused. Requires a GPIO configured as
> +      sdout2 for Ch3/Ch4; without it only Ch1/Ch2 are output. Mutually
> +      exclusive with ti,isense-slot-no; if both are set, Vpredict takes
> +      priority.
> +
> +      Irrelevant in Left-J and Right-J modes.
> +
> +  ti,isense-slot-no:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      In TDM mode, enables Isense output and assigns its starting slot;
> +      four consecutive slots carry Isense Ch1-4 on SDOUT1. May coexist
> +      with ti,vpredict-slot-no using separate non-overlapping slots.
> +
> +      In I2S mode, enables Isense output on SDOUT1 (Ch1/Ch2) and SDOUT2
> +      (Ch3/Ch4). The slot value is unused. Requires a GPIO configured as
> +      sdout2 for Ch3/Ch4; without it only Ch1/Ch2 are output. Mutually
> +      exclusive with ti,vpredict-slot-no; Vpredict takes priority if both
> +      are set.
> +
> +      Irrelevant in Left-J and Right-J modes.
> +
> +  ti,gpio1-function:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      Function for the GPIO_1 pin. When omitted, GPIO_1 remains in its
> +      power-on default state.

Best regards,
Krzysztof

