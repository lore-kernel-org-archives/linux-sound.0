Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59EA3E7BD4;
	Wed, 27 May 2026 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779873337; cv=none; b=o12jJx3iKRvTHgfYxXMGxxfaSZj/1vuLtzIXPRqLqX+CrARlXt4hjmInknQlpTBdV5pgUjpK67pbgcM+TqumAKBeB+dgb85hMq6eYSWoelE3VW3tcHHgwwZ8kDVUQ/CTrypofCSgPKQI1gA18I4ZRGsOl1gONC9gdA2NCKd6Yyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779873337; c=relaxed/simple;
	bh=LJDhMjAyGdsNfusdw02XmBuKhGs98ar0VqkbMUPglo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrBfXBGyAtfJlf7BVbZhNPBZqkmKYfnNoU//SdDJnVo6jtW//rorbJ+LYUpWrv6Dr+ftESSWIESmD35Bq0t5eBRu4fejHwVbledeaOwOGoH1N682z6jpocQlxIhUzAovKouegAZS7S72Ti80UUDuyE+1p7upfZpP2wrwCNNEJH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aaOGlgQL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aaOGlgQL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5580E1F00A3C;
	Wed, 27 May 2026 09:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779873331;
	bh=Pyb7fuKdkRm7mLit3bJvr6ITAg9LyTkELoSIdbnZo6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aaOGlgQLIoeqy700pGTESUWPe7Kl2nO5W6wz9IjU4SAZTLp0SIlFqEL/GNNwjceiY
	 /CjNIb01HlWUuaraM0v6GuwMxg1cOqaXyKvvLQ5f8qdXeHb7wsXllOmrVQ8RxKGI5K
	 2bdaVit0YIqKW8Crctva4g7T6J6bn6TIXYuxnVKbn9s9F/EK70meQah8t3bDJV28qb
	 LbusxtwXnbZqkviG8kQNlyinNH7a/sYepZX3IrAXmoBJdiKPN/hzlK0D2WjQkg9tAC
	 MmsSLOeTNBs+g1VikO07S3u8anQ2qi+5Ix9XrkiHV6b7+z1KZL9XdKPh5g0wQGQyFo
	 dIbiFqjWcOpgg==
Date: Wed, 27 May 2026 11:15:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
	robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org, neo.chang70@gmail.com, 
	kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
Message-ID: <20260527-pink-cockatrice-of-expression-04b6e0@quoll>
References: <20260526015826.440769-1-YLCHANG2@nuvoton.com>
 <20260526015826.440769-2-YLCHANG2@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526015826.440769-2-YLCHANG2@nuvoton.com>

On Tue, May 26, 2026 at 09:58:25AM +0800, Neo Chang wrote:
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: mclk
> +
> +  nuvoton,dsp-bypass:
> +    type: boolean
> +    description:
> +      Forcibly disable/bypass DSP path.

Same questions as v1. Properties are not to control your probe() in the
driver, but to describe the hardware.

You have entire description or commit msg to convince that previously
questioned property is still reasonable in terms of DT.

OTOH, isn't lack of firmware binaries enough to deduce that DSP is not
going to be used?

> +
> +  nuvoton,pbtl-enable:
> +    type: boolean
> +    description:
> +      NAU83G60 supports PBTL mode for mono output.
> +
> +  nuvoton,dac-cur-enable:
> +    type: boolean
> +    description:
> +      Adjust DAC output current to match speaker impedance and prevent
> +      hardware damage. +3.2dB when present, 0dB by default.
> +
> +  firmware-name:
> +    minItems: 2
> +    maxItems: 2
> +    description:
> +      Assign firmware filenames for left and right DSP cores.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        codec@1a {
> +            #sound-dai-cells = <0>;

Please follow DTS coding style.

Best regards,
Krzysztof

