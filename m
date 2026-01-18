Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE93E1946C8;
	Sun, 18 Jan 2026 10:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768731327; cv=none; b=Do8KOvRxPTnpa5TLKN2m9YV4vOcwyk/LYG2jvMszT8zyEg2VDZZgmSWoRvHgjNIlgp2iolWa9NSyZLlDRzKim+4jcuWC6TTOpfT0lo6yheaiL/j2Knsd8Vs7WgigJuIipKj0YT8X4alQoIB6+Xgjfrba8iJG1nH72C2KydJBDoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768731327; c=relaxed/simple;
	bh=N/dVNcBLkw0XJOLT6p0rpf1f1NNJg75jSEfBr0ZqoRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhwrFl93t+L2HAWlBuQOo7/P/l9TXbtjJImDJxXODrHJlOjExx/5eiOfC0EMUhHkZPRBrzs9Tee5PDeoZcguLVIMZDiPbYENgGBDkc8vPE4yD1DrSG28h3EtPe31aAsz30Ar1rIF8WFnhptY0fY21MEiqKbUon5ZhkdAuueVl5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZVD1WG+q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVD1WG+q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F39C116D0;
	Sun, 18 Jan 2026 10:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768731327;
	bh=N/dVNcBLkw0XJOLT6p0rpf1f1NNJg75jSEfBr0ZqoRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZVD1WG+qT6TJhFc6LCFnTglrP3tM5uk2S62OTZKlh/m5x2sCJceOFYKLDuqpc2uhZ
	 Zs//2956o3AhATFHclKW54W/x61AykukzjJ/LiBxBTm5Uojbc2bJDGu1wIlDj3Mz9N
	 hbFYvQe2dZYPBuH+CT8jZNMSMDjmFN6d/L3/jsuftdfJ6WagLEliYgKd1C8kUKXrcY
	 xI4GK1XnHmTy4s3YgxSeWK7hwrNpIuu5nM0Qzot2yGwmagFBpfTL9cbQy7mH/OYhNl
	 ukSlewoOnqnqFBuggGgC+87bI9MYBLYoDRl5r4WlDPE2q3cLWdwSI1V9ZA0BEpOMYW
	 hNntZYmDgTe5w==
Date: Sun, 18 Jan 2026 11:15:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/7] dt-bindings: sound: sophgo: add CV1800B internal
 ADC codec
Message-ID: <20260118-literate-tan-sheep-33bdf3@quoll>
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-3-d10055f68368@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260118-cv1800b-i2s-driver-v2-3-d10055f68368@gmail.com>

On Sun, Jan 18, 2026 at 12:18:55AM +0400, Anton D. Stavinskii wrote:
> Document the internal ADC audio codec integrated in the Sophgo
> CV1800B SoC.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
>  .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml
> new file mode 100644
> index 000000000000..339b60e317e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-sound-adc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV1800B Internal ADC Codec
> +
> +maintainers:
> +  - Anton D. Stavinskii <stavinsky@gmail.com>
> +
> +description: |

Same comments as for first bindings patch.

All of them.


> +  Internal ADC audio codec integrated in the Sophgo CV1800B SoC.
> +  The codec exposes a single DAI and is intended to be connected
> +  to an I2S/TDM controller via an ASoC machine driver.
> +
> +properties:
> +  compatible:
> +    const: sophgo,cv1800b-sound-adc
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Base address and size of the ADC register block.

Drop description, redundant.

> +
> +  "#sound-dai-cells":
> +    const: 0

Best regards,
Krzysztof

