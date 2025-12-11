Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CB119C546;
	Thu, 11 Dec 2025 15:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765467518; cv=none; b=QY8fN3J/+JyHVxJMuHjFfuqZTLtkLivaAgRun11hc6qhJ5eLdEPScKVSSepuc4r51TF/TsJ53Mzke5g+lKlLX9Ru/qAgy1W3wiISAjoKs017O8eaRnVsG8RFQjke7CWccSUYDVRRrqzg2Ks+G/LZKZ39XcL5cGTnfXHu4RPb7P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765467518; c=relaxed/simple;
	bh=MJ1gyPr6loaROZIhwYVOWWE3NQ2VnakiFje9rVBA03A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=th58iYEKA4lY+wztNfSoyyYNZMG0F07qmbg6KYyEp8u2yINT5s7j9kHs2C0KDV9Ij+OKmbABg33KOfL/Ng7pByrK+rh8jai/QkPlEArLfNrkgk5a57HeKJ4tIqzzbZOPtuz04G/SnggEPN6EFksOxL8QT8PaxZOXeFYA/Khe5oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYmsbdks; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYmsbdks"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7135FC4CEF7;
	Thu, 11 Dec 2025 15:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765467517;
	bh=MJ1gyPr6loaROZIhwYVOWWE3NQ2VnakiFje9rVBA03A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iYmsbdksd51pbb6IQ5HDxAIc00S35FJfwV8+PYbKjb3iBFHNPjIYoDxgNeeuqZWnG
	 xmc5H/BpzfZLNf1BNrVf7DdYDzkfHAH0RsF+6gFzS017zmuj7wTAcTlfrlmx4IFPAS
	 MulEDVczs4nwE9MxPpdye46j0CI468/+L0ABzIBYWZpHA/1vjl7SXOnPmDBQo9eixs
	 +28mf7NwhritHgY6wPYy3/ags07NcAR9/d9Gva42e1ZJHO+nbN3RDtUfWZ0Wnw65xO
	 eRYn/+vPepXOnS8k0pQ2pdi0sjyT2XoAjQAWecvZhSWuPCyrSWZJgB5CA8GcAJuVOx
	 fX5Gg+6YoKpvg==
Date: Thu, 11 Dec 2025 09:38:35 -0600
From: Rob Herring <robh@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: cezary.rojewski@intel.com, broonie@kernel.org, lgirdwood@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org, flove@realtek.com,
	shumingf@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
Subject: Re: [PATCH v9 1/2] ASoC: dt-bindings: realtek,rt5575: add support
 for ALC5575
Message-ID: <20251211153835.GA1251928-robh@kernel.org>
References: <20251211110130.2925541-1-oder_chiou@realtek.com>
 <20251211110130.2925541-2-oder_chiou@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211110130.2925541-2-oder_chiou@realtek.com>

On Thu, Dec 11, 2025 at 07:01:29PM +0800, Oder Chiou wrote:
> Audio codec with I2S, I2C and SPI.
> 
> Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
> ---
>  .../bindings/sound/realtek,rt5575.yaml        | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
> new file mode 100644
> index 000000000000..60f9af399dd2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/realtek,rt5575.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ALC5575 audio CODEC
> +
> +maintainers:
> +  - Oder Chiou <oder_chiou@realtek.com>
> +
> +description:
> +  The device supports both I2C and SPI. I2C is mandatory, while SPI is
> +  optional depending on the hardware configuration.
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - realtek,rt5575
> +      - realtek,rt5575-use-spi
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        codec@57 {
> +            compatible = "realtek,rt5575";
> +            reg = <0x57>;
> +        };
> +    };

It is completely unclear what you are doing in the SPI case. I 
deciphered it studying the driver. I shouldn't have to do that, your 
binding should make that clear. 

So your DT must look like this:

i2c {
	codec@57 {
		compatible = "realtek,rt5575-use-spi";
		reg = <0x57>;
	};
};

spi {
	codec@1 {
		compatible = "realtek,rt5575";
		reg = <0x1>;
	};
};

First, there's no need for "-use-spi" because you can just check if 
there is a rt5575 SPI device and use it if there is. Why would you have 
the SPI device and not use it?

But really it is not ideal having 2 device nodes for a single device. It 
would be much simpler to just have something like this in the i2c node:

spi-parent = <&spi0 1>;

Where the cell is the chip-select #.

We have an 'i2c-parent' already for similar reasons when there are 2 
bus connections.

Rob
