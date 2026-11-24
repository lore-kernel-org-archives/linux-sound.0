Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541545;
	b=qBJJw5RIeylpJzncUuHWS82Zt+YYYxZVisFvf59nVnbrZR296QkA3z6h5K7iQvC+eqwN
	 UNi2BUA1zkLN5iIVhRKa1MS1/trs56eeqFES2dcm36LD8b85PwQwW4CU7X5BIj8FE0pPs
	 HV3hbhDGFoBDbg26p/XXEnnnYHe32zkW4QW/GNv6y6wk4RJrSbLbHvWurZQE1/5F5N3VK
	 mChKO99El8ZRHVrk+/OECW6yXkvzrarw4mJDuB4m8+IsaHy/l8NDjgRtbANrdv/valbhB
	 h8ZpNdpObIUzJSrVfadcqU9iPacA27icWsqJqdSv3FtwEIh1ADHb2VJkdXFrcWDMNQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=11NepBsLD6QCYXRO1YRbk90ME/+rEshWAA4QA5dD6tY=;
	b=cYczqXE7J5p4WIbHpXyB2CD5s9IxcDM7bJJd+6nSvCCoHfyR3Vj67BjhhJqrUNO1HY88
	 j0y9mqU9ODbt4sXNz8rmEZBkP+0XO6ovPnLNLaVRkIj9BKfbWzHRkW5Gk9oc8L/XFw2K3
	 +fzPGAELkH7Tzm1iCgpP4buy7n9VVtiQTTyBg+mo1kOFDMqNLBek9owvpDii6PMNZX+j1
	 +XpngK96vKmSZqtGzx8dh369UjrHjrwfp6thaZtIn/fOkpKBoz7LrSNyKFcCThVAGY/nd
	 bpbZcVs1VMSjNakg5N21DCe2G3NynYw9jNiteogaUdXvgvrrEb8o6KrkQxqNv7R938w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lNsYRe3b;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E8E606A68C
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 17:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E8E606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lNsYRe3b
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so42755295e9.1
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541544; x=1796146344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11NepBsLD6QCYXRO1YRbk90ME/+rEshWAA4QA5dD6tY=;
        b=lNsYRe3btU7VMxDTeo1Pfr/oZ3x9wFi1mXH6ULDi+3dGmlc7GVM6Tof+Bl66NeVDzC
         HdLS75BM4CC6auVjh17vhJsNahWpZXKLofgX5XK6T3fux+XJIypDoDuhfSQEMO452HNJ
         suqziFfU9QfsU+CqCgH6uBx6MMQ5nDwjyosp9XgDUV9DJApYpZWbZegfzYHuae/QIQpH
         lGwnnGP5aKc8Sr53uf5pjriYfNzcgk4u56raFMxvEHdp5wpgn/m32pb+IcvP9JqCWPLG
         RiqbfwUrM2CTkEREh/BBY2swpXP/ndLyVDMeu9OcoZrM3/u5IvIfNIFB4W+pAxALHrem
         mULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541544; x=1796146344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11NepBsLD6QCYXRO1YRbk90ME/+rEshWAA4QA5dD6tY=;
        b=Jf4A9iS1yM+Hxol6pre5Sbv9T36w8joNrL0QLeCvIdCNekeqAqXt7UUsETmJQzDtPI
         woW8mSd+B8mtgIMFICafnGiqFu7U3CVko1x9jpok3aS7KhFXNR5XnHVRede7hJKy3sRp
         IvUf9jKgyTsJhsdGNeEtMJrvNBkXuV1HsigiT7pEI5mU7xZJtSGIiB9ktmlsNpjZyzHE
         doKcZFRsYNSmLTIpJip5+r6cleIdv40vp8EnM2QQAQUHLWGPK5LbQz3WzjP9/IJywTgb
         Y/QcNi4xJL4boWI+or9HghZLPnhSBZW4mQrDcll9euLqK0eAk8nkVy6DeccRk0hpFVCN
         9pNA==
X-Gm-Message-State: APuU4Z9brsdudbkK5bVtDaUCieqPyGoQZFNUZYHB9PvyteQf6nY7SRAf
	2VMVx57ttx1SPZlqzpO/7CV27Fjwn15rso9WsuQfuI5tzs2hTfcbS1gfUG3Gpzg+XYI=
X-Gm-Gg: AZFdTZeqRTgWGuL/cvafnFKYPSvkaeKwRy0oRFS9hYGUDPFonRuAI7bf7BXFUsbevAM
	szEsiyd10jZrs8tYLDEhwZgov5GwjhsEct4GzHxsRHqkswDynPhwZYc51PQCASaJ5jbmp2dTLa8
	0e+CBQbX4IP7VFyW//+oP6fP+KbFWsWq8mK3jf60E/ILMwUoQaP3QRz3bWV6SRLtgqPUPdKZxcs
	UkwnZ/sRG4p/7LzZVi2UgZk+pyrc+IUGOcxAYKX2eyWUPagmNpMyW0oH5+1racM91QsXzlb5yhP
	lWLYAw076wogXSGpqbhNWXt78ZGBu1m5SOWwUn9Qf168iJhOiVwoakb7cZBzZwFx5OdgZH9VvDi
	T4RHGo0kksmB/6nB9Jx6LJoRPJ8bsWWwm3kmXm59H/ECORmAcneZnjXXysn0WHOyt4kvIbOmMQM
	wd/7mto3vmrUwcGL9sdFGyJN609aSvBjP8eWxMk3KVf7SPuJ9aRTm9SxxNwmwfx8pnDHYGxRh7w
	9Q5AA0TXCNYjcGSFZSJTc3cQfLY2JwDo83Tz0FRxG04IPAxMJMcPNLj74AfK6SiS2bSJ52TV5aR
	zw09IH7r/pY4QCsm8mrOro4yR0Ln37VqmSiE1n5b9hZ0N4+aeA==
X-Received: by 2002:a05:600c:4f0f:b0:4bb:87f4:3674 with SMTP id 5b1f17b1804b1-4bb8880ef40mr392620865e9.15.1795541543609;
        Tue, 24 Nov 2026 09:32:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:10 +0100
Subject: [PATCH v2 03/19] ASoC: dt-bindings: qcom,lpass: add Senary &
 Septenary MI2S ids
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
Message-Id: <20261124-topic-sm8650-el2-v2-3-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5I6Gvg7c3l0nKuQTPTMB1qG4Gtu3tCn1ElSv/OYu2fU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcobWxAIrUaikBSGw3tfCDe/BvDN5W1VJ7l4ptzE
 Q8mTg52JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKGwAKCRB33NvayMhJ0YbMEA
 Cef2bCqZVVI2O8r/CtoVbur+J5keWp49wViKQ2UMUyMQ05+wYQ1avJUMr0rgVlkz89rmzd7XhXaXP3
 +aNBSBgseud2LTgLyCkhIEuqJh788RVeLRfBPA8AuQkmqgWBAlhofTxFtRHlunh5hL4+nItKNvjBk+
 Dm+ArKSVLTyUtzv3p21ESILkMDaZ7DlfsyyL00VLWmI+E2ZyUEKLpDy0SIfMw6LSOqU76PKSwOCrmy
 HdPPxRyqCnUCa6dyQ0OmqcbhiHwSBFFR4Ds5GNZuDiZUCLVZAVNDh9Zzdg1DAflHfcVpF3ggzGRdxm
 nLAZyeYo+OvEERaSHbn2IcQ6Rp9hkwQQ1wV+M9vdcY0t0HcCWFmrLAuXq8gfCLh24JtnIXLBi8Cem3
 +XFPB+n+xuVG7X/CjoVGpBl3VosciA9ZVUmpHT1L3kZk7c11tobtt6rsdptFXpr4OEKuhJrInAT1pz
 Cg1FmGKwPZkSkBXcBWVS6SKhsRFNUn5u7c0lUinKo/9rLK5UpeiWDE2uAFlfk9uGzWRbLDh0GuZCKz
 G+KSxZa0GJpJVVBhUYyVEdWboaKAMGz7gIb2BDfjlKafK8pL0eukLVqTtRRRfBa+9sJ20Zip14VkCf
 Xfa9Fl2qwYUYTzP9B3Bk13LHA2Bj7y96Q+BjlRvdzNnH+Ec2xp97Q+J6acSQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Some SoCs like SM8650 have Senary & Septenary MI2S interfaces, which can't
be referenced by the LPASS CPU DAI ids.

Add the MI2S_SENARY & MI2S_SEPTENARY DAI ids.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/sound/qcom,lpass.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,lpass.h b/include/dt-bindings/sound/qcom,lpass.h
index a9404c3b8884..22f5e1fcc8a6 100644
--- a/include/dt-bindings/sound/qcom,lpass.h
+++ b/include/dt-bindings/sound/qcom,lpass.h
@@ -41,6 +41,9 @@
 #define LPASS_CDC_DMA_VA_TX7 32
 #define LPASS_CDC_DMA_VA_TX8 33
 
+#define MI2S_SENARY	34
+#define MI2S_SEPTENARY	35
+
 #define LPASS_MCLK0	0
 
 #endif /* __DT_QCOM_LPASS_H */

-- 
2.34.1

