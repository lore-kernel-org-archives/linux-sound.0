Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472435227;
	Mon, 10 Jun 2024 08:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718009320; cv=none; b=r+neBaCZd0Fq5vvl5qoiJx20x7DWlthWAUFSWjwC8pPM9ojqkUNaiWo9kmpAWLUXl7cOK6cfyOIxDpcP9hgEzSarS8CLQimT7n4Nl1ovF/04cEVlKoIs8b/RlPIjRGXBTcPox2QGk8AVpVKSZlbL5MEU3/0b0mMeITaHGp3RdI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718009320; c=relaxed/simple;
	bh=2O6VCowfi9+qm2XVQJcl8X4ano021tmYvbEljpzKFag=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RJcXhsyI8h+bSWBL7QHCWHfc+fnf+USD4rTdig6wlU1L+mcaGp/4Arlxb/wODJMm/K4vrizkz74PgQ8c1jnLmK+biv9K5He2GCQaM+urXV2Zi9bh6tqUzwD+20lkRtzaVcodJB9/jlf9rgEogDF4f1IWhUlYmat1s9c1W54U6S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOoG6IMJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOoG6IMJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635DFC2BBFC;
	Mon, 10 Jun 2024 08:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718009319;
	bh=2O6VCowfi9+qm2XVQJcl8X4ano021tmYvbEljpzKFag=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=MOoG6IMJcaWsLz9Fc4OPaEa9WUROcgOdbxYnlgVsDYBRALpxb//v70soIHZfAjbgk
	 BVFdxac6M0f9TQxg9pTdAo4f9vdvKPX4z8bVO6PLZD/I9HsRvjHeHtlqEQi77BhSAP
	 SGVZb6oXESZRiuST80hOO3n8lVKX1AeWlCQsGBPsSG4SMpd7hmv9Ple5Pl3w16s5AN
	 VSDNfUsTjMIowEZqZVsG/ItnvQZjBf5jrYpF2m4wLa2XrN2Tq4L7q3sGIRkxxRmmvV
	 5ZG2tF+t3qR+1Rnn6dE2MUDdhThocvQsDozJmjHA7qL4ROiK4SRKO0+EbUL6hs5xdq
	 YcUcQprk5s4YQ==
Message-ID: <1ff68780-53c0-4dd3-9bd3-2b468ce8f71a@kernel.org>
Date: Mon, 10 Jun 2024 10:48:33 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: cirrus,cs530x: Add initial DT
 binding
To: Paul Handrigan <paulha@opensource.cirrus.com>, broonie@kernel.org,
 lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20240607202708.335752-1-paulha@opensource.cirrus.com>
 <20240607202708.335752-2-paulha@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240607202708.335752-2-paulha@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/06/2024 22:27, Paul Handrigan wrote:
> Add the YAML DT bindings for the cs530x high performance
> audio ADCs.
> 
> Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
> ---
>  .../bindings/sound/cirrus,cs530x.yaml         | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs530x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs530x.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs530x.yaml
> new file mode 100644
> index 000000000000..a4e2493ff03e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs530x.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/cirrus,cs530x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus Logic cs530x family of audio ADCs
> +
> +maintainers:
> +  - paulha@opensource.cirrus.com

Please provide full name here.

> +  - patches@opensource.cirrus.com
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The CS530X devices are a family of high performance audio ADCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cirrus,cs5302
> +      - cirrus,cs5304
> +      - cirrus,cs5308

Blank line

> +  reg:
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    description:
> +      The first cell indicating the audio interface.

Drop description, it's obvious.

> +    const: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  vdd-a-supply:
> +    description: voltage regulator phandle for the vdd-a supply

Drop redundant parts "voltage regulator phandle" and say what supply is
it. Do not describe DT syntax but hardware.

> +
> +  vdd-io-supply:
> +    description: voltage regulator phandle for the vdd-io supply
> +
> +  cirrus,in_hiz_pin12:

No underscores in node names.

> +    description:
> +      Sets input channels one and two to high impedence.

Typo

> +    type: boolean
> +
> +  cirrus,in_hiz_pin34:
> +    description:
> +      Sets input channels three and four to high impedence.
> +    type: boolean
> +
> +  cirrus,in_hiz_pin56:
> +    description:
> +      Sets input channels five and six to high impedence.
> +    type: boolean
> +
> +  cirrus,in_hiz_pin78:
> +    description:
> +      Sets input channels seven and eight to high impedence.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#sound-dai-cells"
> +

Missing ref to dai-common


> +additionalProperties: false
This should be unevaluatedProperties instead

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        cs5304: adc@48 {
> +            #sound-dai-cells = <1>;
> +            compatible = "cirrus,cs5304";
> +            reg = <0x48>;

compatible is *always* the first property. reg is the second.




Best regards,
Krzysztof

