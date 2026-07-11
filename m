Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B0325DB1A;
	Sat, 11 Jul 2026 15:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783782669; cv=none; b=mhEt7aLdBQ/koQWGm6vcmP+VhYKxfasAJWEJ+nPB0t4o6rT22vHGP1QB16yACKg+k4s4HHHqqyHQwTlqc0PylvWNYHpwdeS2B6/SmEC1SPnt9n1wyJ4EJIEfRJx8vVaUYTDV24WDG4walm9zRmOU8MJsDvwA+zBPIJ/xkqXytZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783782669; c=relaxed/simple;
	bh=jopIlU40djw0uBu9T8l5UGgKinpkCibpmYPSupV2fww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q9AzRHAVRkiSx+kRZFQj7Dvt95BW7EkhyF3A74C4KT3zIlU9/asST1wvAciePHg9I1szgsp0hPuG7r/coMcGQQaufMTzQL6QsApf4A9z19np6Vf7Z4zW4tObV6iDJ4633eurIzFjCDchRbx8M5OnynT2nSooM6432nKLGqFSkyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hk96XOpp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hk96XOpp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9F91F000E9;
	Sat, 11 Jul 2026 15:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783782668;
	bh=axckjhCvJAg+3q366NpeJjK1KCH7Sgnxhcy0PcUEVbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hk96XOppAMOLSselPK06lJyL5Uwa52NFXay+JXdGOgNoP18xsU+zTAOHP4Z/uPvYn
	 dP+CS5SYT/C+DppJQ9VXqKEESQbdf92eyYdlSyQfq7kLkoENkQXsDkaAII2ZoES8uB
	 /Zmz71sKxA8CilsNSCm2fJxU1oakqua+EDwdwyL3NBpKEes8aMRxwKLZYaTDfxjX+g
	 EWAhLRTGMT3+D1XSPTTFPgoXaji4UVltuiYbdrjuGNMzi6EnFFlzDlQlUIQ0DYjcdG
	 lmcn2hMlcgEyVe+4ge+XWPSur0IsXfmXyG2dffhI/B1uCz6PNVQeHrIQZ/lmDhkOMi
	 0RIdVSf391hqg==
Date: Sat, 11 Jul 2026 17:11:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais:
 Document DAI subnode
Message-ID: <20260711-mauve-skunk-of-contentment-f51be0@quoll>
References: <20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260711125740.3083236-2-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260711125740.3083236-2-mohammad.rafi.shaik@oss.qualcomm.com>

On Sat, Jul 11, 2026 at 06:27:38PM +0530, Mohammad Rafi Shaik wrote:
> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
> describe Digital Audio Interface (DAI) child nodes.
> 
> Add #address-cells and #size-cells to allow representation of multiple
> DAI instances as child nodes, and define a dai@<id> pattern to document
> per-DAI properties such as the interface ID and associated clocks.
> 
> On platforms such as Monaco and Lemans, third-party codecs are hardware
> wired to the SoC and do not always have an in-tree codec driver to manage
> their clocks. For these designs, clock line enablement must be driven
> from the platform side, and this series provides the necessary support
> for that.
> 
> On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
> I2S MCLK and BCLK has moved from the DSP to the kernel. This series
> introduces the required device tree binding support to represent and
> vote for these clocks from the kernel.
> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Drop my tag, you made a important change to ABI.

> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>

Drop, you cannot test a binding (in the meaning of Tested-by tag).

> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> index 2fb95544db8b..f3a8b12d7fc8 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> @@ -21,6 +21,49 @@ properties:
>    '#sound-dai-cells':
>      const: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +# Digital Audio Interfaces
> +patternProperties:
> +  '^dai@[0-9a-f]+$':
> +    type: object
> +    description:
> +      Q6DSP Digital Audio Interfaces.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description:
> +          Digital Audio Interface ID
> +
> +      clocks:
> +        minItems: 1
> +        items:
> +          - description: MI2S master clock
> +          - description: MI2S bit clock
> +          - description: MI2S external bit clock
> +
> +      clock-names:
> +        minItems: 1
> +        maxItems: 3
> +        items:
> +          enum:

That wasn't here and that's also not correct, usually. Especially that
it does not fit your clocks property.

Best regards,
Krzysztof

