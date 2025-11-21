Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A772E7BAD;
	Fri, 21 Nov 2025 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763714173; cv=none; b=iMAw73PMtsjd2eGCh19umanSVptEWjfnCDKYYwuJOya1xmL6ipKugpyT5vi6gJd7VX0Wj27uucZqWZoRlMBCdXYl6rAOVQhpN6cqIRCrs5t4mSnlysjjH1f/2ADnRxXsYdYjqj3WNsiniQAHoiyB3uSRRgmLCdpMufGIL/MTmdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763714173; c=relaxed/simple;
	bh=wRWUK4bk6yrVyHCmWgCal/1GBP6ThIRnf47wECoe8Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWL0iUtGU3ImJpAhEPyEUNgeTz/J1GE3Fuh1EiV/5tsXttOAnVpr+GiQRqrDzC1JSU8MDEAsNDWTKwdVVflR5jmnMp+zCWbTUF4jrnD3Yk9xgh0P8ILD4wNPCPnBoiDBs0lwJf6VsBW3VLF/fKx6KROm4nezDMN5MCxTgSwixFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bKUpJ3HN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bKUpJ3HN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198DBC4CEF1;
	Fri, 21 Nov 2025 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763714172;
	bh=wRWUK4bk6yrVyHCmWgCal/1GBP6ThIRnf47wECoe8Ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bKUpJ3HNhxrHvWQAxAA0RXMem7B5UOlso5mqgKnDuSVikvF4NR/7xKQcFE300OtQy
	 6riPlRiWRMtaNKd1w91P4PYJZ2RDATwsriSXGdl5BOAc8MkH/XMS0lUS8kS0zLSRfr
	 4JJh/agPnKVIOHU4tNdc28VekkH3JycBAmdX6UuNIYPWZ8dTPx7pDy8lDdl+N8JaVu
	 4SkT7ael30CRWT5c4zcsNXrOkcLT5PAOpz5ZPsYXKN/88oAFP4L6ujhSK3yFH0m6Ot
	 xV7rwzoB9Gw9vy7rvyeMKLKzy3a1qDm+0NNBuA1rCTkYASVqY4Dllk6PfpgiKMVZLY
	 fnDYe1Ptd3nMg==
Date: Fri, 21 Nov 2025 09:36:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: Add Airoha AN7581 AFE YAML
Message-ID: <20251121-daft-secret-collie-629a2c@kuoka>
References: <20251121054537.25796-1-ansuelsmth@gmail.com>
 <20251121054537.25796-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251121054537.25796-3-ansuelsmth@gmail.com>

On Fri, Nov 21, 2025 at 06:45:00AM +0100, Christian Marangi wrote:
> Add documentation for Airoha AN7581 AFE YAML schema.

Drop YAML and YAML schema from subbect and commit description. See also
submitting-patches in DT dir. You cannot add documentation for YAML
schema. It's like adding a Linux driver for C code.

> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/sound/airoha,an7581-wm8960.yaml  | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> new file mode 100644
> index 000000000000..ebeda0876280
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/airoha,an7581-wm8960.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN7581 sound card with WM8960 codec
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +allOf:
> +  - $ref: sound-card-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: airoha,an7581-wm8960-sound
> +
> +  platform:
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      sound-dai:
> +        description: The phandle of AN7581 platform.
> +        maxItems: 1
> +    required:
> +      - sound-dai
> +
> +  codec:
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      sound-dai:
> +        description: The phandle of wm8960 codec.
> +        maxItems: 1
> +    required:
> +      - sound-dai
> +
> +unevaluatedProperties: false

Please place it after 'required:' block.

> +
> +required:
> +  - compatible
> +  - audio-routing
> +  - platform
> +  - codec

Best regards,
Krzysztof

