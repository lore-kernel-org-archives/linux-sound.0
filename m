Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837313AC0D7;
	Thu, 16 Jul 2026 20:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784235282; cv=none; b=jsE8qsNhcgilH0b1bvj0/qM5JPp2V60kLVOlsJFMZqY+/ZQO2iqpZOZ8LOgEYahQlyGzf9XnImcWyCLLdrB6gQnoF2wGjFdlR8MKcOpAJCuzYzX3jBZLXETqnvxsTmwsDrbZQJsHMFu+Yw0kbmA3+MXx1OXhrVgj84y/DcJGK9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784235282; c=relaxed/simple;
	bh=2nL6yH0Z5+V9Fiymdfdl1UaDos11NT4OB1MTKxhknvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Plgr7NXiif/ACgjzwXZDYaVjyzcKMU//r9xWZpzvXHIanrRChEUFx+BnseO6QnTIr8YMxxKWYka2POu0Zb7W//jnh4eQ7hs+1J1hqKRAOWZJJqPYawKs/tPc/8J66CRpPRTdiKaxJc/0YfxOXLy0CeYca8BU/mtsnZaS8SRpk4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SgclHpSi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SgclHpSi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77F11F000E9;
	Thu, 16 Jul 2026 20:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784235281;
	bh=meAebJ/T/XKwYUBPzFYe//dSJMQFw3ay+daMZQwMPEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SgclHpSiJbDW5I6PZT5mZs4uWLjNTRCO7CKMDeYJeLOC5ukrZxTL++/Be+5f74gmI
	 H1JMZc1jZJsww035+hUPUVOsmLeE1PXsbUuXR1fb7raKoEzKAjUb9Z+SxACB60q435
	 q4U9u/PXNlEwhibz4HBMEZljLuzdhZoSTe5MSDR60QSzmrOkQF6FuHUpJ7H85ZWqS9
	 bL0i9iKHP860bTX+RvoYTCJklcnh9XYDbxATOuNeyV+34RNPTmEupGaYf7rQ3F8MkD
	 h1jv0m9y8IpTfulq/3p/bioVvzjEbbsBTzlh9KF+f8AWZfSiJEjhaJZYRZdrQEr9/o
	 oA6GWt/VlWjrA==
Date: Thu, 16 Jul 2026 15:54:40 -0500
From: Rob Herring <robh@kernel.org>
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: add the Qualcomm WCD9378 audio
 codec
Message-ID: <20260716205440.GA1272112-robh@kernel.org>
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
 <20260706192229.144137-3-jorijnvdgraaf@catcrafts.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706192229.144137-3-jorijnvdgraaf@catcrafts.net>

On Mon, Jul 06, 2026 at 09:22:28PM +0200, Jorijn van der Graaf wrote:
> The Qualcomm WCD9378 is a standalone audio codec IC found on SM7635
> boards such as the Fairphone 6. Like the WCD937x/938x/939x codecs it
> presents RX and TX SoundWire slave devices controlled by a common
> parent node, so the parent binding references qcom,wcd93xx-common.yaml;
> unlike those codecs it has three ADCs and three mic bias supplies
> rather than four, hence qcom,micbias4-microvolt is rejected.
> 
> The slave devices enumerate with manufacturer ID 0x0217 and part ID
> 0x0110, hence the sdw20217011000 compatible. The TX slave carries five
> device ports (ADC1, ADC2, ADC3, DMIC0/1 plus MBHC, DMIC2-5) and the RX
> slave the usual five (HPH, CLSH, COMP, LO, DSD).
> 
> The -codec suffix in the parent compatible follows the existing
> qcom,wcd93xx/pm4125 family compatibles and matches the compatible
> shipped by production devicetrees for this chip.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
> ---
>  .../bindings/sound/qcom,wcd9378-codec.yaml    |  76 +++++++++++
>  .../bindings/sound/qcom,wcd9378-sdw.yaml      | 122 ++++++++++++++++++
>  2 files changed, 198 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml
> new file mode 100644
> index 000000000000..32554541b279
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,wcd9378-codec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm WCD9378 Audio Codec
> +
> +maintainers:
> +  - Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
> +
> +description:
> +  The Qualcomm WCD9378 is a standalone Hi-Fi audio codec IC with three
> +  ADCs, three mic bias supplies, headphone/earpiece/line outputs and
> +  MBHC. It has RX and TX SoundWire slave devices; the control registers
> +  live in the SDCA control address space accessed through the TX slave.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +  - $ref: qcom,wcd93xx-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,wcd9378-codec
> +
> +  qcom,micbias4-microvolt: false
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    audio-codec {
> +        compatible = "qcom,wcd9378-codec";
> +        reset-gpios = <&tlmm 162 GPIO_ACTIVE_LOW>;
> +        vdd-buck-supply = <&vreg_l8b>;
> +        vdd-rxtx-supply = <&vreg_l7b>;
> +        vdd-io-supply = <&vreg_l7b>;
> +        vdd-mic-bias-supply = <&vreg_bob>;
> +        qcom,micbias1-microvolt = <1800000>;
> +        qcom,micbias2-microvolt = <1800000>;
> +        qcom,micbias3-microvolt = <1800000>;
> +        qcom,rx-device = <&wcd9378_rx>;
> +        qcom,tx-device = <&wcd9378_tx>;
> +        #sound-dai-cells = <1>;
> +    };
> +
> +    /* ... */
> +
> +    soundwire@3210000 {
> +        reg = <0x03210000 0x2000>;
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +
> +        wcd9378_rx: audio-codec@0,4 {
> +            compatible = "sdw20217011000";
> +            reg = <0 4>;
> +            qcom,rx-port-mapping = <1 2 3 4 5>;
> +        };
> +    };
> +
> +    soundwire@33b0000 {
> +        reg = <0x033b0000 0x2000>;
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +
> +        wcd9378_tx: audio-codec@0,3 {
> +            compatible = "sdw20217011000";
> +            reg = <0 3>;
> +            qcom,tx-port-mapping = <1 1 1 2 3>;
> +        };
> +    };

Drop these 2. They are just duplicated from qcom,wcd9378-sdw.yaml.

Rob
