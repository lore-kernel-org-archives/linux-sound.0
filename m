Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559C1376483;
	Thu, 11 Jun 2026 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168690; cv=none; b=hw0ECGcNuCls1+ZE+ZmyjM7QjUGlHG5rWgkOoRxxlWJhsgr6W2HITStq3lXl0+Ke4DeH6Jah5SsQyWyXEDvx329Ta/81d/XqxhI2y0bG7GBcNJ6Mk/pnHe+k2YWfYq2iI+VkvJAVsr3j+QjoRRNpCljqQ4XPl3/rFd0MtItUxqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168690; c=relaxed/simple;
	bh=x47ujLyAIU2bbyt0m/iZqfWkabVdq8ik+OEgdghe2n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LucGypviHKOiSu/xfUgADwCrQ9pkAqf79owwf3ABJaK+UYwOsyJxBP7jeHktF3xqTipw9+jK2+tOrxf/NrMMeuvtXZtssoXIU+vS6ACoVX6LslZJynElOYAHer365wRM0DULTKAmWYL3RmP309Og63eZIVrJEg/B3yqU9MUEJkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RICH0ae7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RICH0ae7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC541F00893;
	Thu, 11 Jun 2026 09:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781168689;
	bh=ipQ32VJfHUoEu593/W2ylhgdkuuByCYIM3A/cjwpnc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RICH0ae7xxL/dGPZ/+ufrAlHOnjy4IyHj4PB/do+/0KotYlBKZ2nSOp9o+E67jaE5
	 gux5PqR5XrOyeRlw+jxh5gawUR8EfIKYyMl8X1V0BFnL48zMzh3PL6qcsDMeIt+VQy
	 RZ4erZyXN8IOUcpTrbevPd3yzi5G/Kh8x2s2CEJ2QBj8Eg2tUlPOvwvjKHnBuM5nvq
	 qObjTQ/bfBgw7B7BwqQbtenc6B97QkzQXZmyFCfK11eRTd1b3hQ8t325kntSzHoNj0
	 tb1Uf7HlwnR+0KZin1G1wndC85RvWCzNr60M/zDLb+v8TSZyb5GQas/YJS3ff8T1ah
	 EHMU9o9AyjPxQ==
Date: Thu, 11 Jun 2026 11:04:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, kancy2333@outlook.com, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] ASoC: dt-bindings: qcom,sm8250: Add Ayaneo Pocket S2
 sound card
Message-ID: <20260611-viridian-wyvern-of-painting-6b533d@quoll>
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-4-18bb19c5ca22@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-4-18bb19c5ca22@linaro.org>

On Wed, Jun 10, 2026 at 09:41:48AM +0200, Neil Armstrong wrote:
> Document the bindings for the sound card on the Ayaneo Pocket S2
> which uses the special speaker connection incompatible with
> the default SM8650 sound card.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)
>

Please organize the patch documenting the compatible (DT bindings)
before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

