Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9EE21638D;
	Sat,  4 Apr 2026 11:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775301068; cv=none; b=oaRS7sS0ayp1pn9XUoctGivTayz7rGPnuHdB1YHJWV1HfvZfEoNY8RHrKQD42NgZx+OfLsQ8C2Mroa1w8edPLxmQ6trfst0/jl4S+QrLvj6avOsLLJ0EHmlGJ2BS9C/+Y3aexbJ9dyrwt1Uy13QdSq0QmDAWQLyfKIoPv7pL8Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775301068; c=relaxed/simple;
	bh=yHCuDJkwIS+n8JF158AMxWIAXaCZeMqEE3mA4j4AL5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PvguNI92PfCBLdMPF5hyDZtq/s0K+tBEF+ofxW7weNFP/4R0lNnYdE8w7tamYCdTghMw7y1lqqJ9l5lDyeWcK9UvAqC2OElHWK+PCqmPB287zvPSz2d4ngcdrLTFQ2HrSAmSezdw0CGRDrVK08rpO9VJEmMO4LEywbQM9Cgtk7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFxGe1ZK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFxGe1ZK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9871AC19423;
	Sat,  4 Apr 2026 11:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775301068;
	bh=yHCuDJkwIS+n8JF158AMxWIAXaCZeMqEE3mA4j4AL5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aFxGe1ZKscIg6kLr3BtO9y4xldeH/JZv8w5vCRCdMkLCwhu7egG0hRTXaXDLg9SNE
	 N0W6e71HpHX1fvgQbqTe1av9cVe/qkZ+3oe+dTIa1xzR0R1I7dGg+bCsq8OtXdrrzE
	 NVN/3o+OY1cpIg8m8Rg4lsj4uMqcd7RwtQVCJN01nHFnM+CXri4ytnQvaJLij6RhRv
	 nXyK5COA1b7EFh9inQqoNOcrTHRsHr9tZ5LxhVQO0YLeM8MDLV6zF9O1Eeo27t5wFM
	 46WyimkjdwbONZTKCQ0OrSXhMqH8hGNYlMAnszrvWLki8ry06ROJiwPh0Fv4wTlrwt
	 6K+AEwVdacXTw==
Date: Sat, 4 Apr 2026 13:11:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: rockchip: Convert rk3399-gru-sound to
 YAML
Message-ID: <20260404-masked-venomous-jackrabbit-b543ac@quoll>
References: <20260402055635.8798-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260402055635.8798-1-anushkabadhe@gmail.com>

On Thu, Apr 02, 2026 at 11:26:35AM +0530, Anushka Badhe wrote:
> Convert the rockchip,rk3399-gru-sound.txt DT binding to YAML Schema.

DT Schema, not YAML Schema.

Same in subject.

https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

...

> +---
> +$id: http://devicetree.org/schemas/sound/rockchip,rk3399-gru-sound.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ROCKCHIP with MAX98357A/RT5514/DA7219 codecs on GRU boards

Rockchip

> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3399-gru-sound
> +
> +  rockchip,cpu:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Need to list items. See msm/gpu.yaml,
allwinner,sun4i-a10-display-engine.yaml and others.

And read the driver code to understand what is supposed to be here.


> +    description:
> +      The phandle of the Rockchip I2S controller that's connected to the codecs
> +
> +  rockchip,codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Same here.

> +    description: The phandle of the audio codecs

Best regards,
Krzysztof

