Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594973;
	b=MvuYQg8zBF5Uuc+DaOLJ8nQne2gMHCVhIYze1OnmxFiLQmC1dXQV3aHzne3OvRvBh9Pk
	 ElUMzcronrJFhCr+SU92lNZ8UttCSPK20xvAJ3KSZ3CuvNH0THJAXZW8advRnVNnydnEO
	 KSRQ34kU/nJLsaS33vd5hkw7hn+qWOc4fR2OgRQ0DLh5NyTb8zm1t9pP8c2ittPv/Dq7V
	 qyHGIBlGlx0TQLzndayYqDCA4wVFfC8LPwfNO21RbCUnlzYSgDy13H22nufDzkdUdLj8S
	 iOtqiD4z5uESfycU+xbuVPMCzHroUJIb563WG6Vmy8clNxvVwzLpu3VQN0MWGuLk+Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594973;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=eZM59USBKgHsa4HvrScuof7QjfAux8/OP1cLm9QDFM0=;
	b=fb+6Lxgtg5eXUN3ktl2kmkvgvSGsYtJhAeXWi7LElpA9lwJKf79lkd+tUaTGrN4EmjyM
	 y8KUqWgtD2pN+cMfm7IEBtCuKBa+npJHdDh5oHOepTgbM5J49UbwwMxmfb4+FmeYi2+vL
	 UQIqplfyjAWVXXZGyEijyeDqZOhMiBajDnTH6+kGcN/c1IRfRcD7dwTvSxnA83SEL1Ck8
	 mSDM1FEUUdQc7mpY6ihn4/b6XS1K26uFYkVxiZ3xdUOiCreD7fX6nvnShTZNG1126tbUJ
	 A2KAhcegK+Xr+ME4FPCSpFpLQuJlPxO2SnYpShbHkgLgQH1VO/Y3xAR4RC+oxTkt8JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F7H8XKHN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36DA606A326;
	Wed, 25 Nov 2026 08:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F7H8XKHN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A9C1F000E0;
	Wed, 25 Nov 2026 08:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594972;
	bh=eZM59USBKgHsa4HvrScuof7QjfAux8/OP1cLm9QDFM0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=F7H8XKHNkgauC8XLjLIO1GwVJPJhq0CSZLSAKZEv+5MxnUdh4Z1/WLReX1yMR47Sq
	 WsHxj2YX2j9+E3ObCU1vzeKATdV8PH+jZv/Z+r0ORAqFffVBVYRjL6AQPv8TtT1vPz
	 4nTmFUztm1vehsKTInXMxENDeUUmmNivTt0pQCr9geFG/WnNkbIDK3Vsebr0msuhOX
	 HljZAiTLoMzc9tE0971m3phcw3vY4fm8RSzHwu2uv4eb90pHUffVSDmaM6SEu8KC/t
	 eAms+jNTFJOG5+R+vA8QgVlEuQtXPaeRkYB9Ce5dpFOWqSEsVemX/4YrSUgDx5sd0x
	 60UV8j2vH3Q+Q==
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 03/19] ASoC: dt-bindings: qcom,lpass: add Senary &
 Septenary MI2S ids
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-3-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-3-174e159f0f69@linaro.org>
Date: Wed, 25 Nov 2026 09:22:49 +0100
Message-Id: <179559496917.14607.8482681187806611845.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 18:32 +0100, Neil Armstrong wrote:
> Some SoCs like SM8650 have Senary & Septenary MI2S interfaces, which can't
> be referenced by the LPASS CPU DAI ids.
> 
> Add the MI2S_SENARY & MI2S_SEPTENARY DAI ids.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  include/dt-bindings/sound/qcom,lpass.h | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
