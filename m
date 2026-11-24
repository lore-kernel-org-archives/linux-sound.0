Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541549;
	b=3foJJK9vmXXy7BjoxtikkBxPSDaRGzj8UeKN3zu9uu/1PZYcquApCjkwwtPRY/rkrR6t
	 RXZ/s+o/4BGIIOMbmJiZjgwhERj01+8ir4yjA+P1XVuMjkUwaOx3rNwPZtM2a2OfxTAaS
	 iQBnU6EzQ34Kg/TPny9/R0/iHYYDGW2+cMxgzzeDD2pOXbeVxqSZY/Va0dn/zVSs6AIFW
	 uOea6a90kdilKaQWdclqXS5W6gw9dCJz2FZnN7jGbqJwLtT4bhw9tORx1pWsgbtmXfkNV
	 +22krmXpbY0v3dzRFiKqyiOCkl/ivjTU1TrjB8jV/S9goJIiDXktv6bQEHVBeZ8W0mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=4b2lj7LeSQnKMrc53uVKFHrTjjDc4fNnYGcUzqoHzTQ=;
	b=u5p7s2aojJEbzhW/4KWn7EHlrXl6Hy+HXiP/s+YdxfbjFkNcfVgouYehCjzkrIgu88S6
	 t8s90kBzm7EjgqOLtJVpvNnNZ8DxlOcZ1ErAQUembRsTqFZ78hxHtYyPiJ80LuuRUoFbD
	 ns5AR7zcoZ8y6OzzFnnAjvROReENi+0MiGbQKICXebqGl0Kl/5/7HjJW4g4doCTqqeZu6
	 2VEVwmXJIdZsNo4P7sbOFJuVXCyGQTdqkFgZYLWIRFn1j73vJg+1+bxVQkutQ9Wz80OvW
	 iEnAGYlbaMsJqCrG38xloEQrmKoRGB1KyTGER2c5eSWnL/HFzyUffrNR26CwRk/YMjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V5jwhpik;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948DB606A33D
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 17:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 948DB606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V5jwhpik
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so22742605e9.3
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541548; x=1796146348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4b2lj7LeSQnKMrc53uVKFHrTjjDc4fNnYGcUzqoHzTQ=;
        b=V5jwhpikyXwu/TXPNnfM1qHbIKLQKEJ18I6Jyetz8ioEGjyMvttJvTbSWpw/1A1DWG
         NDYufi8CWtHfwzVQlxOdandaoeuFnriX1OfXZPdPU3bIyjBjn1V8dQAq4ys0TzzToR6V
         WWuxZjtS6gERJiarHRLkD5ivF7rIxvZs2rVUvK5ZSrXNZjpygkYmecGofV5arxMBVBWL
         AHXWyITCruLEP6uVL89SIi/rTKECXyml++jJ7DX1+L5abkSyedBUsm6QZwF+a2KcMVFK
         BRa7+KTXs336rqdTq9W7+NNpMddb0L8D82GWM/yfePbuOJEnM9KgTNrgcHIn+98iyBbP
         FCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541548; x=1796146348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4b2lj7LeSQnKMrc53uVKFHrTjjDc4fNnYGcUzqoHzTQ=;
        b=csm78VFwqlW9wwDYkpFYA1ATy0Ozf7RoKFD19hiz5enbTT9hb+tmHUzq2oBw3gpJSE
         HAj7AaAc3qtl97r7H6jli2p5SKESebdAbLhi7w2LZ7yw2cU2VZHQeLi4xCV3xHwcHJex
         3rOHDLQ4O+MJ9YL2TOnb+e/ZVQ60aq3xLUn4LA0eZGB/LfQMZ5Dsbip82DCMQpg4wLLY
         2RbIuQwJ8vU5LRMM82QQ4oFFGC/PVofnDThqMyJyinDJuyu8PkvilrSyvdWtKNnRQnk2
         2AdmVG/v7a3/D0Oke9IN2+m+U9DKurULWGSRO+Ld7M8ZR5kAEjDthBdWHToABrLG0UQK
         dYzw==
X-Gm-Message-State: APuU4Z9NsguhcLZ2J0gRwFSAJK9d97Qt8bhacETbeCPUwhpiuUFbqCsy
	DdqP8tSHJDHbV568yXv1KDdawoJuqOag2VFtWrYtCoocfyB7rFbVi2+iSwH42M+WWaA=
X-Gm-Gg: AZFdTZdTxzYBC/ZSkneu/VZX8wklt84CQFkW23ZvqBmHwL4tcngTTzrztcxUANTg8o+
	QFehYcJ+kJLzp1ncBOzgre13AENzyyQOb1ijJDLobe68eGZ9o6o19Zx24kEm6U7yKirmEyvQFcs
	WlJCWZjjri63/VIRPHmiWfjVXXBYA/nlmbwZHhbxu0r8Cu7kgZz7/8gOsElGvjOO2U7fgw9zK1K
	5yTIXGDqW/oObnsummYxzdvkVsjn2RzTHg/Z348wn/ddbCN3n7YlkxPs/2rX2N8dW5hMyhUhKDy
	z8EYQjd6t117QiFyQ0FlCmx0i0Tu8x3i4oUE32vOkcedTMEdCBqt1+5eAyQaTEZydnW5RG5Sq4H
	wNSZNavLojHXjd+YuDj4nPpQsffR+FpooQxzLb9IbAHWvYgZxWuw74uuoF57uK8ZqT1JsIf4J7x
	r4WO+ur9td997k1vOemYnE3zmIo7gU/Z9vdnAKINwvNdTkye/LmVLpQkIX5ztcu9P82MAk81pcB
	vCCocVCjqkaTWwLcWMJSW8UH/PxuylO6Ff5m33HNHzjKWuxy+rHxhFSp5/BiXoNnOhXD5gC5WTp
	o7nCN3zzE+5lBX3G9byoRSC6eSaSVIAQ/CP4zqdzVs4NT36pmw==
X-Received: by 2002:a05:600d:82d0:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb88818955mr372919435e9.23.1795541547810;
        Tue, 24 Nov 2026 09:32:27 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:15 +0100
Subject: [PATCH v2 08/19] ASoC: qcom: lpass-cpu: get the optional
 codec_mem3 clock
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
Message-Id: <20261124-topic-sm8650-el2-v2-8-174e159f0f69@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1381;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pXnTVAJqMJDc+ez9ePxnZpJ1MFfUD+R6xCuBW4vIYFQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcodGB9I7riwXAp+aGDB5k5XeXbhAbXlGgaFTIGg
 Y8+JTsCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKHQAKCRB33NvayMhJ0bc0EA
 DI6fycJ9LLgLoXLvvmfraq+keh8lyjQzZxIstq5ye/jBOGLp4pgPnXytFbeYtLpA6adA+r2sp8k8+b
 53Mf9PGjhdSTmbGRsu7WTatMN/ubrQ/OpLXx+RXA2DI6CDkktohBDjuQwJZx69OhJz7U/ARceMTegG
 Fa3cBO8PEe3ZnbbIXvBjK/mkEWThwoCaYUbJpbi+s7HpU4yvNxfT0EIje1JdhV8wxxA5odSyIN47jD
 5Rjrc131gWsAL0ReaYhiTNUxg0ITTSV3AtALZTVwSNulyi9y6mCCwbrtwZHEbjkzokny4TVvdy3g0c
 8xFMV7prfziCH26ydAS+sooH+uO/m1gRe5ILimo8zE6NiIylzukT0jIQ2VtTu99bG5v3NIONVKxdXe
 +R0x2u/o6J8i5NXMIhLK8TIHWvIWMRourXiGmQXCzpkS7a54fMBfFuts8AzvY4qb577LKFpfjZ7Rje
 Fg6Q5Eg/l8OxjHyBXxYUixHFb/bgIF5OukAuWcILTLbVzA+xKJKPjm6aTvntvgAAcbL0+RXzA57jbQ
 53ddUGCeTxh48msDKiJPRNtctGxsYH5mM8l1l3oXH+Qo8Il9psuiGqnIH7Zw77hYKXjULKGoDc9jwR
 Z4NmIDfYYqQoY+kMcT/0C9tsQkUs+jOFNmH/LLdSt4mIafAHu25hWgU86SKg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Some SoCs like SM8650 have a 4th codec LPM block, gated by its own
codec_mem3 clock, which the driver doesn't get.

Get the optional audio_cc_codec_mem3 clock with the other codec DMA clocks.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c | 4 ++++
 sound/soc/qcom/lpass.h     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 5fb20e284afe..308910744223 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1072,6 +1072,10 @@ static int of_lpass_cdc_dma_clks_parse(struct device *dev,
 	if (IS_ERR(data->codec_mem2))
 		return PTR_ERR(data->codec_mem2);
 
+	data->codec_mem3 = devm_clk_get_optional(dev, "audio_cc_codec_mem3");
+	if (IS_ERR(data->codec_mem3))
+		return PTR_ERR(data->codec_mem3);
+
 	data->va_mem0 = devm_clk_get(dev, "aon_cc_va_mem0");
 	if (IS_ERR(data->va_mem0))
 		return PTR_ERR(data->va_mem0);
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 68b71039b981..4231466928d4 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -107,6 +107,7 @@ struct lpass_data {
 	struct clk *codec_mem0;
 	struct clk *codec_mem1;
 	struct clk *codec_mem2;
+	struct clk *codec_mem3;
 	struct clk *va_mem0;
 
 	/* MI2S SD lines to use for playback/capture */

-- 
2.34.1

