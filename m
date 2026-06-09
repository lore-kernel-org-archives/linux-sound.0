Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9B53D811B;
	Tue,  9 Jun 2026 07:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780988697; cv=none; b=SvtJrF15/1GKq4vpr4SByOfu30laJr7OdrNCz+l2zy9KhqunDxjRWvi6HzWGcRWA1dPKvxRnyEy9Z6lmcRWPbQUkncE35+WuSrIcuO26Gb5qCRO3xd0HqpxlJojHjjbqj7ymIIkob7AD1TdCwhPIH1rZX29GZkSOrALPI6LpYNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780988697; c=relaxed/simple;
	bh=iypVwKQAl1d161PJuCJiQZ8cL2LK++n+cytP17W2zIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3AH03uZ+Kg5wQDSxnP12xaYK8MeJ/jMnoLMLDtpcQKNvfddulyLkJO3rCdTkej5lvJVEPakbN9I/Q2dsoLdOX3Hx/ZWIIVELpb6F16qKlpnatMf7oConjqEN1DE5T2vujolQPGUfrZziA30dsPLcxQYTMEJUYn/89JV8HJXmNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRRqhosw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRRqhosw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFA91F00893;
	Tue,  9 Jun 2026 07:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780988695;
	bh=DJUmtmPwmSVMMnBBfyUFcLIcI7msLFbvO5LL8BmNMbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GRRqhoswSTG0xi9C9hO+ZQDQEUXOX0KkrQjj3zbJ0PJx8gynRHUTiyLPkJECOqRAA
	 +NUQnxNOAq2C7oah1yPdbxBkOt6u7adUrc7J7Se3Ikt5GvxeKGKAieIFFIXs1fgCE+
	 Q79od3Dh+sgXJzhlbjx1HagOR7c3c7vpsReBYcuZk6NM4hbyO/0XtiYKL3PrHFeKOo
	 yZCRCO6scD57PAVc2SvsZ168j4YOvAXHH63pwtLnmlz0T/E6djeZK1uSFpXVx91GdW
	 T2ugzuukhNzO9FGFSpQbUW8t0t3QcH8VTwSIdju6e9dC0Ks8WfqJrsZ0StnVGu4TeW
	 VEcz1p/lRhNSA==
Date: Tue, 9 Jun 2026 09:04:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
	robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org, neo.chang70@gmail.com, 
	kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v4 1/2] ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
Message-ID: <20260609-hysterical-rhino-of-resistance-d7e1da@quoll>
References: <20260609024128.585938-1-YLCHANG2@nuvoton.com>
 <20260609024128.585938-2-YLCHANG2@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609024128.585938-2-YLCHANG2@nuvoton.com>

On Tue, Jun 09, 2026 at 10:41:27AM +0800, Neo Chang wrote:
> Add device tree bindings documentation for the Nuvoton NAU83G60
> audio amplifier.
> 
> Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>
> ---
> Changes in v4:
> - Refine the `firmware-name` description to clarify the loading order
>  (Left then Right) and the PBTL mode behavior.
> - Remove the "dsp bypass" option description.
> - Update the example node to follow devicetree coding styles.
> 
> Changes in v3:
> - Remove colon to resolve YAML build warnings.
> - Fix 'firmware-name' property definition to comply with binding schemas
> 
> Changes in v2:
> - Dropped the word "driver" from the description.
> - Removed runtime/software configuration properties:
>   nuvoton,low-latency, nuvoton,anc-enable, nuvoton,aec-enable,
>   nuvoton,vbat-microvolt, and nuvoton,tdm-channel-length.
> - Added missing "nuvoton,dac-cur-enable" property for static speaker impedance matching.
> - Removed unnecessary '|' formatting from single-line descriptions.
> - Fixed typo in firmware-name property.
> ---
>  .../bindings/sound/nuvoton,nau8360.yaml       | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
> new file mode 100644
> index 000000000000..2d19aedf1419
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nuvoton,nau8360.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NAU83G60 Stereo Class-D Amplifier with DSP
> +
> +description:
> +  Stereo Class-D Amplifier with DSP and I/V-sense.
> +  This device supports I2C.
> +
> +maintainers:
> +  - Neo Chang <YLCHANG2@nuvoton.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,nau8360
> +
> +  reg:
> +    maxItems: 1
> +    description:

You want |

Or this could be just enum of addresses, no need to copy paste address
decoding from datasheet.

> +      The I2C address of the device. The address is determined by the external
> +      hardware configuration of GPIO1 and GPIO2 pins.
> +       - 0x1a (GPIO2=Low, GPIO1=Low)
> +       - 0x1b (GPIO2=Low, GPIO1=High)
> +       - 0x4a (GPIO2=High, GPIO1=Low)
> +       - 0x4b (GPIO2=High, GPIO1=High)
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: mclk
> +
> +  firmware-name:
> +    minItems: 2
> +    maxItems: 2
> +    description:
> +      Assign firmware filenames for Left and Right DSP cores.
> +      The first firmware is for the Left channel,
> +      and the second is for the Right channel.

Drop all above and just list the items with description

> +      In PBTL mode, the Left firmware is ignored and only the Right is applied.

Combining also this.

items:
 - description: ...
 - description: ...


Best regards,
Krzysztof

