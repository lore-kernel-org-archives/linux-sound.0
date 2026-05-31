Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAE61E4AF;
	Sun, 31 May 2026 12:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780231532; cv=none; b=UZBaryfpYhvwcn+7hYttlV6A+bZJ65e7GpC9lGeaLP4JBhEAi86GEJK2Hetr/Qb4c+XhM6ezqyg8q3h8BMCS5KTZ9MFW5r4MZSK30BQIwB0QE5zKSFjG+V23P6seeE/2HHDJsiLavll+878/iLlmi8wB1TPRS3cml2eJ6IOu9go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780231532; c=relaxed/simple;
	bh=4ddagbOmeWE4pPrSmpowbtWvnBR8pGPt/Wfx50/zMyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWGyMXCBrJISH3fo+R8bHv9tt5haJE/UYegyUgp6ki6deZm1HngDgNdabfYWuVbnRVJ6kqSz40uJAmbVJ2VxnwU9L5P+B9rLsWzrj804BQjbs4PjJc1Obh1PDIfhtSG+EshghqRpnLSMxCZ1DGMG2wiVV1itBufMktR4M6uQkuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MRVQANP5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MRVQANP5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22C71F00893;
	Sun, 31 May 2026 12:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780231531;
	bh=gC7FGBCpOWE8WjlFTBs+odeMD/y+jDDq2vTzWmg11Uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MRVQANP5ZCmoB+ChcTpt0dfDi03BobhYrHFPntQQ18rwFD1ZgucagCxBUtSysO07u
	 KeTnY9qLElXGoClNbK61DaR93hghI3pssrOvLl6RNZDK/Bd7XPWLj2up+4ondYl5es
	 njSfaPcTaGkpVLT8O1lMHxTmBEqb5jSCHveBlF78RKfOX0GwoCwB3U2gOVedrxx2sr
	 d0ZZhUiHOrV4kzWgF08zNq5YltDPy6/Sg1/Q1ipPbgCLaEbNVTDxHBoue6doCOWhrc
	 9c2RLMKlT3y5Kzph9LAWDv+s2k4/efv1Sd5BkrO0YRw+cprm4/2sBAfgUPZnL/knIN
	 wfEinLVCJ0sWg==
Date: Sun, 31 May 2026 14:45:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/4] ASoC: dt-bindings: Add Airoha AN7581 AFE with
 WM8960 Codec schema
Message-ID: <20260531-chirpy-carp-of-promise-ec7dac@quoll>
References: <20260528174840.28644-1-ansuelsmth@gmail.com>
 <20260528174840.28644-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528174840.28644-3-ansuelsmth@gmail.com>

On Thu, May 28, 2026 at 07:48:30PM +0200, Christian Marangi wrote:
> Add YAML schema for Airoha AN7581 AFE with the specific WM8960 i2c Codec.

DT schema. There is no YAML schema.

Also, looks like sound card, not AFE... but previous patch said it is
a sound card (while it was AFE), so completely confusing...

> 
> This gives example on how to define and connect the AFE driver with the
> WM9860 for full functionality.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/sound/airoha,an7581-wm8960.yaml  | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> new file mode 100644
> index 000000000000..b637c294657f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> @@ -0,0 +1,71 @@
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
> +

additionalProperties go here. Looks at other Mediatek sound cards.

> +    properties:
> +      sound-dai:
> +        items:
> +          - description: The phandle of AN7581 platform.
> +
> +    required:
> +      - sound-dai
> +
> +    additionalProperties: false
> +
> +  codec:
> +    type: object
> +
> +    properties:
> +      sound-dai:
> +        items:
> +          - description: The phandle of WM8960 i2c codec.
> +
> +    required:
> +      - sound-dai
> +
> +    additionalProperties: false
> +
> +unevaluatedProperties: false

This goes after "required:".


> +
> +required:
> +  - compatible

Best regards,
Krzysztof

