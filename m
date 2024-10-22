Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081FA84A36;
	Tue, 22 Oct 2024 06:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729577200; cv=none; b=r6QlMObP7NCzJ1e6hNzi75+1Yek+C7F1TT/wic6Y++tKDBJwM/c3T+uhojVTFgaoYq+qOlelnOFKuXpHVekszzQC+LnS/MOmhemly7P1kjvm78qpsIry8MfTZE1ukiuTb6IhwdN6/XkPR9BbRn8NQTCyvlIb92HV6Bi922vMLCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729577200; c=relaxed/simple;
	bh=8QbpdJWB1qxhMrePilvW1Sip+EP6uxpGcvOzDxVCiyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1HLGo5p9EopEnU/BAXEgDFaNG51YQMOQH9GqfN7ZaT6vOlD6mC6fI9CerF/P23Nco0TfUB1IN63E/Pur9CA8fuyby1QjM2J50mkyiCzRTgjlAzi1I+jsSU5U9I74EA5t/FH1zY8VsL4RughhX+GXbLohNPiT+7ZCTBui3EjLjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ruD4EqDL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ruD4EqDL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD458C4CEC3;
	Tue, 22 Oct 2024 06:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729577199;
	bh=8QbpdJWB1qxhMrePilvW1Sip+EP6uxpGcvOzDxVCiyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ruD4EqDLiA2I7chMy/TRZyq5BFFuODRQs1XJBE8a86UOEiWDsQ+mRujooDK57NtcX
	 m7+zn3ltXWyQRMSEjMyoD1F2b6pW7SgDc4OLGyTm0HOu7jg8EBm4h90mxwErzxBccT
	 tR0acX04FstTrqoPfSwWL02qKj4DMdA9i0b2GMhd3SeHAjexRUbA6rVaIWZ9TS8xit
	 H9C+xavpIXSk9ZpIG1IOvnKSuS2GkXj3iJMyWInEtqeqKrV9GeAQIPB9wvtUsPjetn
	 fa1jFb0QFj7mXAm48KnGaBREIaev0izt6xCSUnsRMoBSWvNoDVjy6t83KZDUrUJ6eL
	 +bFib2KosMnRQ==
Date: Tue, 22 Oct 2024 08:06:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nuno Sa <nuno.sa@analog.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: document the adau1373 Codec
Message-ID: <pj5clifybfwljpq3usfgca7cy54xpmzngdckyb53wc3u4lts53@gtm2mbuiiudw>
References: <20241021-adau1373-shutdown-v1-0-bec4ff9dfa16@analog.com>
 <20241021-adau1373-shutdown-v1-2-bec4ff9dfa16@analog.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241021-adau1373-shutdown-v1-2-bec4ff9dfa16@analog.com>

On Mon, Oct 21, 2024 at 03:46:46PM +0200, Nuno Sa wrote:
> Describe the adau1373 Low Power Codec with Speaker and
> Headphone Amplifier.
>=20
> While at it, properly add a MAINTAINERS entry for ADI sound bindings.
>=20
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>  .../devicetree/bindings/sound/adi,adau1373.yaml    | 102 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 103 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/adi,adau1373.yaml b/=
Documentation/devicetree/bindings/sound/adi,adau1373.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..b2b5b2226ed7b354f2fb7871c=
17272b347921fa5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/adi,adau1373.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/adi,adau1373.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +

Just one blank line

> +title: Analog Devices ADAU1373 CODEC
> +
> +maintainers:
> +  - Nuno S=C3=A1 <nuno.sa@analog.com>
> +
> +description: |
> +  Analog Devices ADAU1373 Low power codec with speaker and headphone amp=
lifiers.
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/AD=
AU1373.pdf
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,adau1373
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  powerdown-gpios:
> +    description: GPIO used for hardware power-down.
> +    maxItems: 1
> +
> +  adi,micbias1-microvolt:
> +    description:
> +      This property sets the microphone bias voltage for the first micro=
phone.
> +    enum: [1800000, 2200000, 2600000, 2900000]
> +    default: 2900000
> +
> +  adi,micbias2-microvolt:
> +    description:
> +      This property sets the microphone bias voltage for the second micr=
ophone.
> +    enum: [1800000, 2200000, 2600000, 2900000]
> +    default: 2900000
> +
> +  adi,input1-differential:
> +    description: This property sets the first analog input as differenti=
al.
> +    type: boolean
> +
> +  adi,input2-differential:
> +    description: This property sets the second analog input as different=
ial.
> +    type: boolean
> +
> +  adi,input3-differential:
> +    description: This property sets the third analog input as differenti=
al.
> +    type: boolean
> +
> +  adi,input4-differential:
> +    description: This property sets the fourth analog input as different=
ial.
> +    type: boolean
> +
> +  adi,lineout-differential:
> +    description: This property sets the line output as differential.
> +    type: boolean
> +
> +  adi,lineout-gnd-sense:
> +    description: This property enables the line output ground sense cont=
rol.
> +    type: boolean
> +
> +  adi,drc-settings:
> +    description:
> +      This setting is used to control the dynamic range of the signal. T=
he
> +      device provides a maximum of three full band DRCs with 13 entries =
each.
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    oneOf:
> +      - minItems: 13
> +      - minItems: 26
> +      - minItems: 39

and maxItems?

> +
> +required:
> +  - "#sound-dai-cells"
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        audio-codec@1a {
> +                compatible =3D "adi,adau1373";

Messed indentation.

> +                reg =3D <0x1a>;
> +                #sound-dai-cells =3D <0>;
> +                powerdown-gpios =3D <&gpio 100 GPIO_ACTIVE_LOW>;

Extend the example, you have like 10 unused properties.

Best regards,
Krzysztof

