Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595084;
	b=Cr+/NHUE92Lgr+R8eour7USxeCiXZ6jAg51C9kp8STb1QgWqUjW9BfPAY23wgd+OhhK4
	 QQiTgfNIQQKkgUvy+rpCgrdaOW4ow8XphdnKd3kSasP5Fe1LCn9aJQBkq0MF6MEPjhZDQ
	 wb0roeLW2YdIWurFNo0a9FfnPbnI8gHUHIzXKfv6PbpJZ1/dugYAinflaLsQp4G2pIdQl
	 WDoBd3Rdlu8HbEj/1QBMAerLTH0EQt1hrGcV9kGLEsaXWzCILciY7e+Ptlmq/AQd14B4B
	 CsVPA7r239C5M5RPo7h5dQICTEJ3FDc3VJWNN6DcZ81de8ma/HarU1E4SqKZIF0+eiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595084;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=uebEVTG2JkIQq11o7ESGWDLzRQJ/ZvksgVsdaNFkcxM=;
	b=nXp+qpQgdHfged6opRG+YmfETL0TwX8QD7NPk3eSndYrXx8SQwsPGZv6Dl3k76Drr/G8
	 l0wAY3uzBR/zPv7iIj7VAWcQde7MmU93MLdFF7WeUp9cfzCVzFL1/nNzId/hfPFvGS+MY
	 cPW5zjTSMkwQ7zrOuiOo2601AwYkT//n7vEULHWN8OqNgX2jrCEsRvWwzipEUyG2w0jPR
	 XiJ+VUbZHLvyzPZKLfAw1MAid4JFkPFEUKfy+e+MXtUfaXgqnWHuxDEM3UQ/DcLUPphGv
	 rdk9OJYrlWuGvonHusL67tVFMepDK/+sdl9S1j0dQFzB+G7fHKynWdx4S0io7DSX3VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bgBusS9w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA3B606A339;
	Wed, 25 Nov 2026 08:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bgBusS9w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11661F000CF;
	Wed, 25 Nov 2026 08:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795595083;
	bh=uebEVTG2JkIQq11o7ESGWDLzRQJ/ZvksgVsdaNFkcxM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=bgBusS9wrZ6tAgbbMes1EETaVSxcT5On9jYHJ9R4tGnF5KVWM+wCUcvUKjtlPBNOB
	 WurPWAi6W03h7rBE3qLZ7jbcFkMUH36lpVEih9FGfpgqNwR7TtHm4ZTlC1AXuc62eh
	 pQonV8vrjHf2OwWrX/vKtcUCPwT/kdo5uoSKpZyz5sEfg+CmWu3nn+0S8HiK6jb2w1
	 MhP2+FbsQuFUZRLeu/5tLP3D0BKtH3eRk23T+FoCVKB9zJbRvv3QG5BZLQJ9ED6ga1
	 Q6dgkwkcDl0tfgOA9Kj3VQpY4lB8tclSuxJDOCUgOSy3YOGG6OdKDPJ9wicpHtpiNy
	 1MpZj4MdSSoDA==
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
Subject: Re: [PATCH v2 06/19] ASoC: dt-bindings: qcom,lpass-cpu: document
 the SM8650 LPASS
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
In-Reply-To: <20261124-topic-sm8650-el2-v2-6-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-6-174e159f0f69@linaro.org>
Date: Wed, 25 Nov 2026 09:24:40 +0100
Message-Id: <179559508025.14607.6518320946607334666.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 18:32 +0100, Neil Armstrong wrote:
> The SM8650 LPASS can be driven by Linux through lpass-cpu, with extra LPAIF
> instances, LPMs and clocks compared to the other SoCs.
> 
> Document the SM8650 LPASS CPU registers, clocks and interrupts.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 74 ++++++++++++++++++++--
>  1 file changed, 68 insertions(+), 6 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
