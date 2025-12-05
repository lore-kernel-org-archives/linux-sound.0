Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B2D311587;
	Fri,  5 Dec 2025 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764924837; cv=none; b=g9TqzHuy/pMWKWxGqUAfMgTkFgHu9YoNzgFSCCywkjf2qgJIed+52b/5KCm/s+MFLxE8TYxPgckJ4xeEzwdNn7U87Vp4Xmjlx3KglCqEHNk1+rJPIkNuqcWp/eDO5eg1fnw6+1Slao4UU4p5jyruenCAXjZ9qI+8sma2/I3LaYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764924837; c=relaxed/simple;
	bh=BPZWYBRtorpnsEq++EX+QE27mma0TRopio8NfKMdocg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuIkfOjK+EabwV5herLEh7JXfGRWHZQBeHfdOynS2mpF8N/KYx6iNQysrWiECK2hnkNQd3Qv+IHoMkiTw/0szdNSmlRoVoksx1+wBn39u3i7dVsZcz/pblIvIJqFBrhgj97rqlnmeHJNRfPgwByh78o8yhpypU/M0pq+eF+mq3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKl4T36M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKl4T36M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839D2C4CEF1;
	Fri,  5 Dec 2025 08:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764924835;
	bh=BPZWYBRtorpnsEq++EX+QE27mma0TRopio8NfKMdocg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dKl4T36MtrUu+n+nc8tmFQC81YHIN3FJG1P0pG07//yTT5i5tzfUGZGTflcsp+/X6
	 1IZNLgxsMYHmoD+nmVCWuQaAQIBwyfwKqAmCnZQAiizpBjXDnm3kQUwJJVFE3V3W5I
	 mTBsVrhgeXfBgbGSzLfQhmJKnlgerixKljiywo38ojF16pecixsWuObPgEdgcas4NU
	 lppRG7lEm/8Lz+5H79UzPiGyVe7zR/7AYVu8UFPminEs4I+lTHSHdP29u11kz/2U6C
	 L+JoqY84LEDe59zMYG6b0AkHrhcY/ISQHjxgrJ93WscWUydn6g65Hs5lTX5glXA+k6
	 GtTrgQydpVxhg==
Date: Fri, 5 Dec 2025 09:53:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v4 1/3] ALSA: hda: dt-bindings: add CIX IPBLOQ HDA
 controller support
Message-ID: <20251205-interesting-determined-gecko-fce146@quoll>
References: <20251202113132.1094291-1-joakim.zhang@cixtech.com>
 <20251202113132.1094291-2-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251202113132.1094291-2-joakim.zhang@cixtech.com>

On Tue, Dec 02, 2025 at 07:31:29PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add CIX IPBLOQ HDA controller support, which is integrated into
> CIX SKY1 audio subsystem. HDA controller supports 64bit, but the
> audio subsystem can only 32bit transaction. Use jack polling mode
> as there is a hardware issue, lead to interrupt strom if the RIRB
> interrupt enabled. Host and hdac has different view of memory, so
> need do dma address translation.

About subject:
I honestly don't know if "ALSA: hda:" is the correct prefix here,
usually SoC stuff was "ASoC: dt-bindings: ....", but that's not ASoC.
Fine for me anyway.

> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../bindings/sound/cix,sky1-ipbloq-hda.yaml   | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
> new file mode 100644
> index 000000000000..b27d47523af3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/cix,sky1-ipbloq-hda.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX IPBLOQ HDA controller
> +
> +description:
> +  CIX IPBLOQ High Definition Audio (HDA) Controller
> +
> +maintainers:
> +  - Joakim Zhang <joakim.zhang@cixtech.com>
> +
> +allOf:
> +  - $ref: sound-card-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: cix,sky1-ipbloq-hda
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: sysclk
> +      - const: clk48m

How is the pin or clock input named? It's really clk48m? This looks
oddly specific about frequency.

> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: hda

Just drop the reset-names property completely, it is not useful when it
is the same as device name.

> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The user-visible name of this sound complex

Drop property here, not needed because it already comes via sound-card schema.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +
> +additionalProperties: false

And this should be unevaluatedProperties: false instead.

Best regards,
Krzysztof

