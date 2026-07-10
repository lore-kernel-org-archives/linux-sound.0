Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323043C8182;
	Fri, 10 Jul 2026 09:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674230; cv=none; b=tu2eJz5xsHXFPUtnilc1bZqldFNnq1wAMsFZ9dFUB4npOPBOYwUkXDfYlvih6JCy49TBl35UoiZ5/yfjuttahFWuBII72QJWIrGhgDQON4WQJtWtQUlHgsWJR30Dab+Ui05G1Hqp19dPruuoQzZ1vaUTnXp/vdI3FfM4xj3kEko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674230; c=relaxed/simple;
	bh=861y7Ua2JnJPiROvHNc4mZHtHTRWGxHBGdkyRJIqmLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvkwC26u1Cy4D7VwbGv/Lf5k3xvlqdWId7S9r4a88MaImihMyZulb6HiuNsOkt+mrZgVZwWSXQPAc/l/6UMd6RvzQy/jdvAXhXGWLLAxXKgsu86cAxeFYL5UZaNFcP/ltOSnK95ftfplOXmTQ68ZrzXxztKVLVPYIQJSQCclsx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOoIfvwX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOoIfvwX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697CE1F000E9;
	Fri, 10 Jul 2026 09:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783674228;
	bh=qD3g2ZT2Tt+dTPEOvKUGP5g+R9lBVcYINAOqmFESI0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lOoIfvwXj2/naOd3sHvrnkBS1MliiGCDwTD65J+ZRqg8T4fa4S8+9avM5ru9fwoLW
	 VNuSbOMxI0oo8Jz6fug2uD2bh5xa74+1ZqEbwjlDMLwPFWU6pJ+vAqINUfiQogDfrv
	 FKtgN4Due+mwBWqONcRVO/4TsMQyvDbYy8swblYIPyo/FHG98gaq52WlPhda1uV7YU
	 ISIx+Q+9ikogGAWjRB0EudbzaUjpMWmBeAULM/leWNugqqC5fExKqsXw5bzp/QoLWT
	 zwMuW5l5YIidgw4u4ZHAFrr2EUoE4o6c4dnYbyfcYpjhiPTjUDTURawo5KLKV9ixBa
	 PJ/Hr9JOynU0g==
Date: Fri, 10 Jul 2026 11:03:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: qcom,wsa8855: add Qualcomm
 WSA8855 speaker amplifier
Message-ID: <20260710-analytic-astonishing-skink-a83cea@quoll>
References: <20260709175915.3805851-1-prasad.kumpatla@oss.qualcomm.com>
 <20260709175915.3805851-2-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709175915.3805851-2-prasad.kumpatla@oss.qualcomm.com>

On Thu, Jul 09, 2026 at 11:29:14PM +0530, Prasad Kumpatla wrote:
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,wsa8855
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  powerdown-gpios:
> +    description: GPIO controlling the SD_N powerdown pin.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: GPIO controlling the SD_N powerdown pin.

I think it is easier to go with reset-gpios only. There is no benefit in
allowing both in DTS. There is also almost no benefit in having driver
support for both. With reset-gpios you support both cases - shared and
single-line GPIO.

Well, in any case (I don't object):

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

