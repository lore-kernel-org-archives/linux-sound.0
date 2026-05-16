Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D253405C31;
	Sat, 16 May 2026 09:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778925258; cv=none; b=BONBk9Zhoc4Zdrt6MRWTiCTU/hxQRnMnLwqK1dD/fJRWPQLQ9dz8DdLBl/67eihVeQ72R8xyUJHi2E42tR5UV9TJWs9F46xaB/fqmUsUz0IiGvxxGw4rDujNzEXvmRcP/++sWHqyvjTs4Hf7R7K2di9MFyZbiTWitVkRbue18RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778925258; c=relaxed/simple;
	bh=5G0GfRhdqxXnwfX/hPUHRaG7/hPxNu5Sbp3rVTLqTNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4ZVPCieCf3AtQHHcgTvdc70CJzAVqdsJNGmcNS6GRFoS5Ldw1ym0Sjchuign7+Fvprjirw+yHm01/6IMhlKzmprWclm0BMwhjQEwTlQR8UeYzklIaqTwgxHwC9ZIu07wcqbHhnCHYCl1giC3QPecp680S66s98JK9dPiWRJoac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qvlHvpor; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qvlHvpor"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58487C19425;
	Sat, 16 May 2026 09:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778925258;
	bh=5G0GfRhdqxXnwfX/hPUHRaG7/hPxNu5Sbp3rVTLqTNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qvlHvporq1hB86OQgIRETeEvQNR8PJUj5MlOvcItLiNJ6c4gwthYNPv6NfZC/xiKO
	 Id7+WpaaDnS1oFzFbaf00uFy8ebDJjfWSOwnOAPxHmOpEasRF32uduSMBYtG8Cfb0C
	 20WM0wvIXIod+PD4VJ4M7gDfEQjsUDa2da+Q10jor2kmDIdVXO6+mAIAb2Cwi+DX2e
	 h6x/O5VWMHm1mZL7zTzk9qd9wCkPU8/gKhLENZGLk13jW2o5apbCnC3g0JzRxxGOFb
	 NmgDevyR6nn1ikO2ZdMBx2A8TPoyT/lMzP4Ip6ld/Fq1WrI7ZM0o+YcB4i2JD1w+n7
	 C+POh7acgcOig==
Date: Sat, 16 May 2026 11:54:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sen Wang <sen@ti.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: simple-card: add
 system-clock-id property
Message-ID: <20260516-resilient-magenta-reindeer-4f0bcd@quoll>
References: <20260515161358.1462453-1-sen@ti.com>
 <20260515161358.1462453-2-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515161358.1462453-2-sen@ti.com>

On Fri, May 15, 2026 at 11:13:57AM -0500, Sen Wang wrote:
> Document the new optional "system-clock-id" u32 property for cpu/codec
> sub-nodes in simple-audio-card and audio-graph-card.
> 
> The property maps directly to the clk_id argument of
> snd_soc_dai_set_sysclk(). When absent the existing default of 0 is

That's driver argument in bindings. Poor way to start discussion. Please
describe the hardware instead.


> used, so no existing DT is affected. CPU and codec sub-nodes are
> parsed independently; each side may carry a different value to select
> different clock sources on the two DAIs within the same dai-link.

Again, nothing about the hardware here.

> 
> Signed-off-by: Sen Wang <sen@ti.com>
> ---
> changes in V2:
>   - Newly added (V1 is RFC)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index d1cbfc5edd3a..8094a76b9b4a 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -67,6 +67,8 @@ definitions:
>          $ref: simple-card.yaml#/definitions/system-clock-direction-out
>        system-clock-fixed:
>          $ref: simple-card.yaml#/definitions/system-clock-fixed
> +      system-clock-id:
> +        $ref: simple-card.yaml#/definitions/system-clock-id
>  
>        dai-format:
>          description: audio format.
> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
> index a14716b2732f..47a02d340d5e 100644
> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
> @@ -49,6 +49,14 @@ definitions:
>        single fixed sampling rate.
>      $ref: /schemas/types.yaml#/definitions/flag
>  
> +  system-clock-id:
> +    description:
> +      Selects which system clock to configure via set_sysclk(). Corresponds
> +      to the clk_id argument of snd_soc_dai_set_sysclk(). When absent the

So now driver APIs are part of binding :/. No.

You should have built on top or use previous discussion instead of
making new mistakes:
https://lore.kernel.org/linux-devicetree/20221022162742.21671-2-aidanmacdonald.0x0@gmail.com/

Best regards,
Krzysztof

