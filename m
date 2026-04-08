Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D9334AAF7;
	Wed,  8 Apr 2026 12:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775651344; cv=none; b=oVrfW4kM26bcC4a8iezpnz6CbWT3Y4sREJep4bR871cI5s/+35gthJZRwPso4347ver/N14eoLTFc1czUk1r+J6Jxf6PER16iGHDhKdiGaXy93p9G77eLCaP5eFxAavsTroUQ2gLTUAL3mFXKp9Ah0tip8Rs9dQajZYR4byf3zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775651344; c=relaxed/simple;
	bh=4BTcvw1V3P/PDMbvY3dAa90a1SxDMnrBICu523evSfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bf0hRUA6YcWV7y5lTR4PA/0Sw11wnXHHXYqd8vSxbwVWRlzbNr+vvpIJzeeJ1sqh0cD/uGcz8nJysFstSTQBHycaP3ZmFFDOQcrr801D0qtDymKOQ6aNm2kggpDqdWlm6F5GuEMJPcucXz1py5vaV/oQmTLnhSc7kbTAzhAh8KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cW9OcXoe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cW9OcXoe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA83C19421;
	Wed,  8 Apr 2026 12:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775651343;
	bh=4BTcvw1V3P/PDMbvY3dAa90a1SxDMnrBICu523evSfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cW9OcXoeM/xiPcCX6Q8ZIr23UDySiU3JEIjn325la8wmvEZfO2KMSOCkVzURJxSCV
	 HmvzpieD4gou1DEtQ71gM7HSbf+Gq4YbJiiveCzeLlS2sTqIu3X64Rti8vtRWwm1Je
	 4vtURDz/9uWEQs3ps1boYHFcguxjg8OBmIiugrAx5W9hgRvNuENuK5FlRHisPuvagi
	 QTyHf3gRgUxr+8SQxTm2ZrFRvgy/ZEXCzYrzJqqw9b4zvJokEqkbgWOR2VhzxbxiBM
	 nLyliTNeRFy/jv1lBmmjgnEHKTkXCIxsVrPg1n5/U8VM3zhZNcBg+xSxGUGzMpHFV+
	 uEAw910oPNcdg==
Date: Wed, 8 Apr 2026 07:29:01 -0500
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: Add support for the GPIOs driven
 amplifier
Message-ID: <20260408122901.GA42727-robh@kernel.org>
References: <20260330101610.57942-1-herve.codina@bootlin.com>
 <20260330101610.57942-3-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330101610.57942-3-herve.codina@bootlin.com>

On Mon, Mar 30, 2026 at 12:16:06PM +0200, Herve Codina wrote:
> Some amplifiers based on analog switches and op-amps can be present in
> the audio path and can be driven by GPIOs in order to control their gain
> value, their mute and/or bypass functions.
> 
> Those components needs to be viewed as audio components in order to be
> fully integrated in the audio path.
> 
> audio-gpio-amplifier allows to consider these GPIO driven amplifiers as
> auxiliary audio devices.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/sound/audio-gpio-amp.yaml        | 309 ++++++++++++++++++
>  1 file changed, 309 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/audio-gpio-amp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-gpio-amp.yaml b/Documentation/devicetree/bindings/sound/audio-gpio-amp.yaml
> new file mode 100644
> index 000000000000..15dc898f8574
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/audio-gpio-amp.yaml
> @@ -0,0 +1,309 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/audio-gpio-amp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Audio amplifier driven by GPIOs
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description: |
> +  Audio GPIO amplifiers are driven by GPIO in order to control the gain value
> +  of the amplifier, its mute function and/or its bypass function.
> +
> +  Those amplifiers are based on discrete components (analog switches, op-amps
> +  and more) where some of them, mostly analog switches, are controlled by GPIOs
> +  to adjust the gain value of the whole amplifier and/or to control
> +  the mute and/or bypass function.
> +
> +  For instance, the following piece of hardware is a GPIO amplifier
> +
> +                                         +5VA
> +                                           ^
> +                                        |\ |
> +                                        | \
> +        Vin >---------------------------|+ \
> +                                        |   +-------+-----> Vout
> +                .--\/\/\/--+------------|- /        |
> +                |          |            | /         |
> +                v          |            |/ |        |
> +               GND         o               v        |
> +                            \             GND       |
> +       gpio >----------->    \                      |
> +                         o    o                     |
> +                         |    |                     |
> +                         |    '--\/\/\/--.          |
> +                         |               +--\/\/\/--'
> +                         '---------------'
> +
> +  A GPIO driven amplifier can work in several mode depending on the electronic
> +  design.
> +    - points defined:
> +        The values of GPIOs used to control gain set a specific gain value
> +        without any specific relationship between each value. For instance,
> +        using 2 GPIOS:
> +          0b00 <-> -10.0 dB
> +          0b01 <-> +3.0 dB
> +          0b10 <-> 0 dB
> +          0b11 <-> +6.0 dB
> +
> +        This can be described using the gain-points property.
> +
> +    - range defined:
> +        The values of GPIOs used to control gain set a specific gain value
> +        following a linear dB range from a minimum dB value to a maximum dB
> +        value. For instance, using 2 GPIOS:
> +          0b00 <-> -3.0 dB
> +          0b01 <-> 0 db
> +          0b10 <-> +3.0 dB
> +          0b11 <-> +6.0 dB
> +
> +        This can be described using the gain-range property.
> +
> +    - labels defined:
> +        Some electronic design are not meant to a specific dB gain value. In
> +        that case it is relevant to use labels to describe them. For instance,
> +        using 2 GPIOS:
> +          0b00 <-> Low boost
> +          0b01 <-> Middle boost
> +          0b10 <-> High boost
> +          0b11 <-> Max boost
> +
> +        This can be described using the gain-labels property
> +
> +properties:
> +  compatible:
> +    const: audio-gpio-amp

To be consistent with other GPIO controlled devices: gpio-audio-amp

> +
> +  vdd-supply:
> +    description: Main power supply of the amplifier
> +
> +  vddio-supply:
> +    description: Power supply related to the control path
> +
> +  vdda1-supply:
> +    description: Analog power supply
> +
> +  vdda2-supply:
> +    description: Additional analog power supply
> +
> +  mute-gpios:
> +    description: GPIO to control the mute function
> +    maxItems: 1
> +
> +  bypass-gpios:
> +    description: GPIO to control the bypass function
> +    maxItems: 1
> +
> +  gain-gpios:
> +    description: |
> +      GPIOs to control the amplifier gain
> +
> +      The gain value is computed from GPIOs value from 0 to 2^N-1 with N the
> +      number of GPIO described. The first GPIO described is the lsb of the gain
> +      value.
> +
> +      For instance assuming 2 gpios
> +         gain-gpios = <&gpio1 GPIO_ACTIVE_HIGH> <&gpio2 GPIO_ACTIVE_HIGH>;
> +      The gain value will be the following:
> +
> +          gpio1 | gpio2 | gain
> +          ------+-------+-----
> +            0   |    0  | 0b00 -> 0
> +            1   |    0  | 0b01 -> 1
> +            0   |    1  | 0b10 -> 2
> +            1   |    1  | 0b11 -> 3
> +          ------+-------+-----
> +
> +      Note: The gain value, bits set to 1 or 0, indicate the state active (bit
> +            set) or the state inactive (bit unset) of the related GPIO. The
> +            physical voltage corresponding to this active/inactive state is
> +            given by the GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags.
> +
> +    minItems: 1
> +    maxItems: 32

2^32 levels? Seems like a bit much. Also, unless you can change the 
values of all the GPIOs atomically, aren't you going to get some 
artifacts while the gain is being changed? Unless you mute I guess.

> +
> +  gain-points:
> +    $ref: /schemas/types.yaml#/definitions/int32-matrix
> +    items:
> +      items:
> +        - description: The GPIOs value

Can't this just be the index?

If not, then gain-range could be expressed using gain-points instead.

> +        - description: The related amplifier gain in 0.01 dB unit
> +    minItems: 2
> +    description: |
> +      List of the GPIOs value / Gain value in dB pair defining the gain
> +      set on each GPIOs value.
> +
> +      With 2 GPIOs controlling the gain, GPIOs value can be 0, 1, 2 and 3.
> +      Assuming that GPIOs values set the hardware gains according to the
> +      following table:
> +
> +         GPIOs | Hardware
> +         value | amplification
> +         ------+--------------
> +           0   | -10.0 dB
> +           1   | +3.0 dB
> +           2   | 0 dB
> +           3   | +6.0 dB
> +         ------+--------------
> +
> +      The description using gain points can be:
> +        gain-points = <0 (-1000)>, <1 300>, <2 0>, <3 600>;
> +
> +  gain-range:
> +    $ref: /schemas/types.yaml#/definitions/int32-array
> +    items:
> +      - description: Gain in 0.01 dB unit when all GPIOs are inactive
> +      - description: Gain in 0.01 dB unit when all GPIOs are active
> +    description: |
> +      Gains (in 0.01 dB unit) set by the extremum (minimal and maximum) value
> +      of GPIOs. The following formula must be satisfied.
> +
> +               gain-range[1] - gain-range[0]
> +      Gain  = ------------------------------- x GPIO_value + gain-range[0]
> +                        2^N - 1
> +
> +      With N, the number of GPIOs used to control the gain and Gain computed in
> +      0.01 dB unit.
> +
> +      With 2 GPIOs controlling the gain, GPIOs value can be 0, 1, 2 and 3.
> +      Assuming that gain value set the hardware according to the following
> +      table:
> +
> +         GPIOs | Hardware 1    | Hardware 2
> +         value | amplification | amplification
> +         ------+---------------+---------------
> +           0   | -3.0 dB       |  +10.0 dB
> +           1   | 0 dB          |  +5.0 dB
> +           2   | +3.0 dB       |  0 dB
> +           3   | +6.0 dB       |  -5.0 dB
> +         ------+---------------+---------------
> +
> +      The description for hardware 1 using a gain range can be:
> +        gain-range = <(-300) 600>;
> +
> +      The description for hardware 2 using a gain range can be:
> +        gain-range = <1000 (-500)>;
> +
> +  gain-labels:
> +    $ref: /schemas/types.yaml#/definitions/string-array

minItems: 2
maxItems: 0x100000000

> +    description: |
> +      List of the gain labels attached to the combination of GPIOs controlling
> +      the gain. The first label is related to the gain value 0, the second label
> +      is related to the gain value 1 and so on.
> +
> +      With 2 GPIOs controlling the gain, GPIOs value can be 0, 1, 2 and 3.
> +      Assuming that gain value set the hardware according to the following
> +      table:
> +
> +         GPIOs | Hardware
> +         value | amplification
> +         ------+--------------
> +           0   | Low
> +           1   | Middle
> +           2   | High
> +           3   | Max
> +         ------+--------------
> +
> +      The description using gain labels can be:
> +        gain-labels = "Low", "Middle", "High", "Max";

Do we need to allow these to be anything? It's going to get hard to come 
up with 2^32 names. 

> +
> +dependencies:
> +  gain-points: [ gain-gpios ]
> +  gain-range: [ gain-gpios ]
> +  gain-labels: [ gain-gpios ]

gain-gpios is really optional?

> +
> +required:
> +  - compatible
> +  - vdd-supply
> +
> +anyOf:
> +  - required:
> +      - gain-gpios
> +  - required:
> +      - mute-gpios
> +  - required:
> +      - bypass-gpios
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +  - if:
> +      required:
> +        - gain-points
> +    then:
> +      properties:
> +        gain-range: false
> +        gain-labels: false
> +  - if:
> +      required:
> +        - gain-range
> +    then:
> +      properties:
> +        gain-points: false
> +        gain-labels: false
> +  - if:
> +      required:
> +        - gain-labels
> +    then:
> +      properties:
> +        gain-points: false
> +        gain-range: false
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    /* Gain controlled by gpios */
> +    amplifier0 {

amplifier-0

> +        compatible = "audio-gpio-amp";
> +        vdd-supply = <&regulator>;
> +        gain-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>, <&gpio 1 GPIO_ACTIVE_HIGH>;
> +    };
> +
> +    /* Gain controlled by gpio using range */
> +    amplifier1 {
> +        compatible = "audio-gpio-amp";
> +        vdd-supply = <&regulator>;
> +        gain-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>, <&gpio 1 GPIO_ACTIVE_HIGH>;
> +        gain-range = <(-300) 600>;
> +    };
> +
> +    /* Gain controlled by gpio using points */
> +    amplifier2 {
> +        compatible = "audio-gpio-amp";
> +        vdd-supply = <&regulator>;
> +        gain-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>, <&gpio 1 GPIO_ACTIVE_HIGH>;
> +        gain-points = <0 (-1000)>, <1 300>, <2 0>, <3 600>;
> +    };
> +
> +    /* Gain controlled by gpio with labels */
> +    amplifier3 {
> +        compatible = "audio-gpio-amp";
> +        vdd-supply = <&regulator>;
> +        gain-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
> +        gain-labels = "Low", "High";
> +    };
> +
> +    /* A mutable amplifier without any gain control */
> +    amplifier4 {
> +        compatible = "audio-gpio-amp";
> +        vdd-supply = <&regulator>;
> +        mute-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;

This case is just simple-amplifier...

> +    };
> +
> +    /*  Several supplies, gain controlled using range, mute and bypass */
> +    amplifier5 {
> +        compatible = "audio-gpio-amp";
> +        vdd-supply = <&regulator>;
> +        vddio-supply = <&regulator1>;
> +        vdda1-supply = <&regulator2>;
> +        gain-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>, <&gpio 1 GPIO_ACTIVE_HIGH>;
> +        gain-range = <(-300) 600>;
> +        mute-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
> +        bypass-gpios = <&gpio 3 GPIO_ACTIVE_HIGH>;
> +    };
> +...
> -- 
> 2.53.0
> 
