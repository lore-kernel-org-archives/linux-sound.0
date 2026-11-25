Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595029;
	b=O6rlKUymhQ9/Xze73ogkF7F46m/ylZB4zXEvukKc+QjPrKcJ4R5ow9QuYSCcRQf/pLem
	 clnkQT7OtxqkUoR15RDigSuMoOP19WV4yrE6Pc/bMonQ5ssHlgFo/z/mHgQ0W1JhOCtLV
	 coFzhqhwwGlMySY/OzoR+MuIoKRC6lPNreqhJaX3GjtyrtVy3Q2iMvzwFUvUU73upnNLp
	 n2saW8QeJN9kaCBmym1EB/UOhRuuTHnty+GEmBrr8yzy3Obo21xq74qsIYoPwCZAYMrNj
	 1VOTfXqljc0zxa3usY+Auwh/LCoRI4mrpCN5eEQcru78V+xQQfj7HoQ3L0spq0T8oyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595029;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=njuH02YUJOCvgYAwTeoMInVLEZpKHQzfD3zGkKypiXE=;
	b=uCEYSynJzjEMnbelMjJZfbJk5XJOgMjwUWl6114a9buNF8ooHgIZ72z4/ZgpnWhHmYOf
	 ndmonY/K+4b+/xnNcP1E0R7TMx7W77pZ73Oftt30DmMgHlxE+sB9AMjAQm1b29ILKJB2t
	 JHPo8Bw+0RBdyo/BIRP0ss3nLPfLAkIMr6Y7Q6iEw3Q0c5cMDpnec+ftEw9vtizueiTfS
	 gzNcftcqzOhOxlhKk1siAcv6hTlyTR/eqb8Vy9QF8KSYbyb/5BBw9bZIlP/vjlsU66qBR
	 T2u4AD40h6+Mx0AlpGq+oN/WJe9h61Oj+tUFnF08h+GiYOW0YN813SRgAdOqIpGfOjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GiJ0v5wZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BAD606A31E;
	Wed, 25 Nov 2026 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GiJ0v5wZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCA01F000D0;
	Wed, 25 Nov 2026 08:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795595028;
	bh=njuH02YUJOCvgYAwTeoMInVLEZpKHQzfD3zGkKypiXE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=GiJ0v5wZG7KtODWtXK3PqWmuIELH2luSgxYq/o6bxDcY2P2ANjua4gANJY8U+Sy4Q
	 3dlZCiKyHZMsLZvUZ4/AtgAyoTiJbO5ftNFn+knuqfv1vhTkWkdMUL1YoW59xMRRpP
	 uJfq6lHP2Jh2vLoZFXg3/jfWj7Q55ITOH1ehW2US5K+1g+qk3qdypvD6a8vlNF0dZi
	 p68NjMJWLpeddyudTi3qmHGuw15mWb/5BSNlGKzYj0Kjk1zcWKnUXxfw3ci0Manoy9
	 gqnWaaG9ufNfP9QnOqp4WSxAS7bbL+n6IzKeDndCQX0eMUjIyVKUuixHwiGV3oqhCa
	 XZkx17QZ6U91w==
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
Subject: Re: [PATCH v2 05/19] ASoC: dt-bindings: qcom,lpass-*-macro:
 document less clock when ADSP is not used
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
In-Reply-To: <20261124-topic-sm8650-el2-v2-5-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-5-174e159f0f69@linaro.org>
Date: Wed, 25 Nov 2026 09:23:44 +0100
Message-Id: <179559502497.14607.14408264735612246019.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 18:32 +0100, Neil Armstrong wrote:
> On platforms where the ADSP is not used and the RX/TX/VA/WSA macros
> are entirely handled by the OS, the macros blocks requires a different
> set of clocks and power-domains to replace the clocks exposed by the
> ADSP firmware interface.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/sound/qcom,lpass-rx-macro.yaml        | 17 ++++++++-----
>  .../bindings/sound/qcom,lpass-tx-macro.yaml        | 20 +++++++++------
>  .../bindings/sound/qcom,lpass-va-macro.yaml        | 13 ++++++----
>  .../bindings/sound/qcom,lpass-wsa-macro.yaml       | 29 ++++++++++++++++------
>  4 files changed, 52 insertions(+), 27 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
