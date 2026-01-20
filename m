Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB923D666F;
	Tue, 20 Jan 2026 10:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768903858; cv=none; b=o6iUa+JkHM5daTAm/fEniwuzv3gzX6H5fwpTnhi6JdJYfCURSF0jyGzgOx8eBQBp7ItwEV/g8xcias5X4Jpblm4zW4HmpUZvXOKT125M09q/D9CCU8kgZ5pN+qPeNyeYukaQ3rLQWyR9pzDZ6pZccYunHOCKvTQ/2bKsW4Ww100=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768903858; c=relaxed/simple;
	bh=14sFAjB4MwXkB5IYvz/vbPhNzMMnETtzo0mJN+fJcs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lD3fKqdAEBwV6VUeZrV1tAIMcffsUr0C6C2Tb3bueS44BqNUSr5RKhQ5l2cgauTpL7fTHcCqhGlcdE1tihIVYkKA6PgZ1Ak4yVDF4jfz0JZGw/0GMGs+CBQGHHl5791TXOe4VYOnSU/MwITQENDhvumecoWvjWHLW4jzYigswZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SO12JgQo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SO12JgQo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD260C16AAE;
	Tue, 20 Jan 2026 10:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768903858;
	bh=14sFAjB4MwXkB5IYvz/vbPhNzMMnETtzo0mJN+fJcs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SO12JgQoStGryPgG+5UcjczgvJ5BAcP6qqISOP6AXmS7I24DgPG2BSSsi5f69PaSr
	 bqK1JLZTXU7/t1TWiFuB7lMzp8MRxiQwgNVHlm8x3UaLb1DcOOy7u0OYKZH6rKmW1j
	 ZCadcmWUvl1vu4H0l6OTbtAVTFDF0zYQ2urehZlpVHL/UVA9aEPVbFDzhLx0CcpkVD
	 1jV4XFdhwKFLS9aDVVZUy6mIhxBq9Fv8NNMfWWPabjnGabOGkEP9/DIkQkHEgbkDnN
	 5RbPjtMkk/XMmx/2TaBaZYkXjnK8UaR/4wMeIaoEwNYAWGCKaUP0Q070Cv1dz6d3Jo
	 wDiBqPyVfJDpw==
Date: Tue, 20 Jan 2026 11:10:55 +0100
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
Subject: Re: [PATCH v3 1/6] ASoC: dt-bindings: sophgo,cv1800b: add I2S/TDM
 controller
Message-ID: <20260120-chirpy-booby-of-potency-ece1d7@quoll>
References: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
 <20260119-cv1800b-i2s-driver-v3-1-04006f4111d7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260119-cv1800b-i2s-driver-v3-1-04006f4111d7@gmail.com>

On Mon, Jan 19, 2026 at 08:30:42PM +0400, Anton D. Stavinskii wrote:
> There are 4 TDM controllers on the SoC. Each controller can receive or
> transmit data over DMA. The dma it self has 8 channels.
> Each channel can be connected only to a specific i2s node. But each
> of dma channel can have multiple purposes so in order to save dma
> channels the configurations allows to use tx and rx, only rx, only tx
> or none channels. I2S controller without channels can be useful in
> configuration where I2S is used as clock source only and doesn't
> produce any data.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
>  .../bindings/sound/sophgo,cv1800b-i2s.yaml         | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
> new file mode 100644
> index 000000000000..e09631308bb6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV1800B I2S/TDM controller
> +
> +maintainers:
> +  - Anton D. Stavinskii <stavinsky@gmail.com>
> +
> +description: I2S/TDM controller found in CV1800B / Sophgo SG2002/SG2000 SoCs.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: sophgo,cv1800b-i2s
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  clocks:
> +    minItems: 2

Drop minItems, redundant in such case, implied by maxItems.

> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: i2s
> +      - const: mclk
> +
> +  dmas:

missing minItems, I already pointed out that your constraints always
need to be synchronized between xxx and xxx-names.


> +    maxItems: 2
> +
> +  dma-names:
> +    minItems: 1
> +    items:
> +      - enum: [rx, tx]
> +      - const: tx

Best regards,
Krzysztof

