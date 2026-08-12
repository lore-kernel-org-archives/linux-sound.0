Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEE537204D;
	Wed, 12 Aug 2026 19:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563756; cv=none; b=sTBsw9yPH+MTdytqW3y4TtMvkXOfbglp6Tp5fN2LwqJfejUw3D0Br2Ie9b/Lru+Bc36K1XRlmVfobEz+4gXlSszCGh4NvFd6GxT/Qhadi8mqpaJpVArke/At/rF2An6oaSz+TuAdpDjBHsxxh0SLs6tCXolHB0BeMwWAHgUajWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563756; c=relaxed/simple;
	bh=FwM4DmbIpPnO4eB/Dzqs+PdDealXiwlIr27tXGwzK1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMW/AamYzpRiqgGzEE2/Tg1mr+zN+vzLj2Xpg5w8LbkLpPPDcMvlkij+bH8RK/L/wdifpXzcPHdV33yr9y2lSKjLMa+1XhgFFJAJ8yhKMJv/bI43PeU6uncY8Q6qZcMB/yilmf4O67DsSsZ9kGbLTlcYPSOz1P3pyFKgwdnZXoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOiLoTv9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOiLoTv9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4BAD1F000E9;
	Wed, 12 Aug 2026 19:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786563754;
	bh=Z8uKxxkxtfyBhEbjH/Frtn8s1b4bFCuuEGKZbThLzLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TOiLoTv9XMsIkw6Beg/1MLS1Nc1kT6DaEXXdygn6PBvNpIsCYUOutnTA2v6Hzlwb6
	 Qb7YeIFXlwmJ18eLO0jPq+tb58A7UhHrif63HePr8c97m8Vh8UsZekBC7mgiiEhvtX
	 /PRIgchFxY6XSdxBzfPyemKeKqVLT90UkkzgQ17Nufldu4QhFtnOfP0yh5C6WTPJlZ
	 J1gi5hxzxdT4/qGan+8HX0OPUVM4jCvajgJ1M5CaK9jcfVEviDdMizVNYFG6JZH4x0
	 kYqRufat7XlzsaSl/2FVH7BPbquO+DK13ViW2WE0jnViEeBqsh3SGzbLBxCYjDdP43
	 1EqgOHr+W4YYw==
Date: Wed, 12 Aug 2026 14:42:34 -0500
From: Rob Herring <robh@kernel.org>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Drake <drake@endlessm.com>,
	Katsuhiro Suzuki <katsuhiro@katsuster.net>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: es8316: Add regulator supplies
Message-ID: <20260812194234.GA693895-robh@kernel.org>
References: <20260812-es8316-regulator-next-20260722-v2-0-e7078bc9bc9c@thundersoft.com>
 <20260812-es8316-regulator-next-20260722-v2-1-e7078bc9bc9c@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-es8316-regulator-next-20260722-v2-1-e7078bc9bc9c@thundersoft.com>

On Wed, Aug 12, 2026 at 05:35:43PM +0800, Hongyang Zhao wrote:
> The ES8316 has separate AVDD, CPVDD, DVDD and PVDD supply inputs for
> its analog, charge pump, digital core and digital I/O domains. Describe
> all four inputs so boards can model the codec power topology.
> 
> The binding also covers ES8311 and ES8323, whose supply inputs differ,
> so restrict these properties to the ES8316 compatible. Keep them
> optional for compatibility with existing descriptions.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>  .../devicetree/bindings/sound/everest,es8316.yaml  | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
> index fe5d938ca310..276c73bb4790 100644
> --- a/Documentation/devicetree/bindings/sound/everest,es8316.yaml
> +++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
> @@ -30,6 +30,17 @@ description: |
>  
>  allOf:
>    - $ref: dai-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: everest,es8316
> +    else:

Missing 'then'. You need to invert the 'if'.

Looks like Mark already applied, so you'll need to send incremental 
patch.

Rob
