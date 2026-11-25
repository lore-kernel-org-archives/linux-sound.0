Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594988;
	b=Hg++Tp1uW8bGiuMi2kipuFCRymk8+dI9PCspDFas8iaFiTT5wnOitVAhTc0ANd1d0QPZ
	 VjNHKtt4qSPJv1NuFoFAmFO73mAbVzySCVFhDDw8O6HFZWlyUrfCL3I5gfT4IBmY82ilj
	 HOUsVb8P5vRr5Sfm6FGS3SATFeQ0zklsfx3I9wf4Tik6ee+SnhBtrjJn+zJESiTuARA5V
	 hxi0ItyAEsr3tajEKoZaBhxY0zT9VkFN2D0Ag4tRuDf0+d71jWoufWlE7ZqF6IB2eeOPL
	 0NsLY/ENnjbJlCj8A9azAacxqDpNU3K8JbYfWVW4I+4Swsp3DMrB8fFA7Ulnista+pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594988;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=gnQlK4DsQ7WG4TpPxca8WQ73c097fGvKB/VcHabYUwg=;
	b=Y65hI/KKC3tsjx9kkgcRKOqPRPvOReL8kMVvDiE6CPgzb5hXyUEXynxydw4roGBsN9Hl
	 oMXhJ7SNWU5ZCWv/WhpEcvQWaqlBaFBJ266U3daVmawiwlmBlKPHyf8DiWXdxk8V3zbtu
	 wr/znDClNXt49j8RsYMvkDvNs4rnmXXGq4Z6rQbPoG3+9ainyiK8KyOvYxzuUqgYK15y2
	 yoDU1klXahJWD+Y9aHTb0PoYtnK2vLtnkyuQVV9lFImcDWFb2iAVNfV4jK4HXoyXg3p/N
	 CNQuHc7OOqV1+sPtW4FnOAgQ0bpvKLiYhDw5n7X5fXwATyWMqg+kr1F/xhoGNLk4z6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HxNGnmND;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388AA606A31E;
	Wed, 25 Nov 2026 08:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HxNGnmND
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2791F000D2;
	Wed, 25 Nov 2026 08:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594987;
	bh=gnQlK4DsQ7WG4TpPxca8WQ73c097fGvKB/VcHabYUwg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=HxNGnmNDUq6rnaU27G+N2TKlekNVYzDOjyEZD2ge7y8wM1GEZ1RcnJraJPpgdkreS
	 0bOQ9HOOAYvOYdR6CrPmwn8b1mntmZOGoBdv3cbA4KHgjFcCKSU7K4BZsTiz/6rHN+
	 vfN7bKUeu+/+lRF84tB0ggDMUOMwhd/qbkUVoQfLFl2axC8zAxXE6g1a3GiE7RfChW
	 qwNud7T3XIvwd/yzIZhzDTibSvtZh04sVHRlUxPZoYdLgAP/AFnuB67T1yVuOQwnLy
	 ejb9AIH0I3H67ta0eRkfX51eUBxHgZ7VCN/PFDJItx+Hyo9BlRoMKTJuy8XbVsg1AS
	 kZkkNaSDxsUHQ==
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
Subject: Re: [PATCH v2 04/19] ASoC: dt-bindings: qcom,lpass: add WSA RX and
 TX channels ids
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
In-Reply-To: <20261124-topic-sm8650-el2-v2-4-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-4-174e159f0f69@linaro.org>
Date: Wed, 25 Nov 2026 09:23:04 +0100
Message-Id: <179559498436.14607.867594860068529126.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 18:32 +0100, Neil Armstrong wrote:
> Add the bindings to connect to the Qualcomm WSA interfaces.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  include/dt-bindings/sound/qcom,lpass.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
