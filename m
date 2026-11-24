Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541546;
	b=wGgAP6lUnn5o1G1a45YhyB0W87ZzE495HLJjXy/DNIzwCYU+O/LgESiSewOEJmfEYegp
	 gDOJ7dQVXla8uLKDoZybyEy3AhK2Uhn7IgWlCBVGnPxsFu7/o9TGgUI/iWOD+Ul/HjHlt
	 HQQEAVpK6v/u1eLrl9ZGAAkArWevKnaL6h6WXE8nfF+DvLrB7uVZIpp36vDmtoXl2DGKv
	 7QvrBSc7Qc715bYb6zDezKmkj0snvhbEMQDHZCdTVeQ272IvTiDiBnYC3ZTDjMX7UYRMG
	 ee11ydgyPeDJlWLyeL54Ij95NrP9AawZGnOaRTQ3Br4V7tTuJC/F+4TT1TID15Y0Xcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=aQPrSDUxid3hTnblfq2igQmpuDYP0lgjM0zpbR4xQUg=;
	b=Kk2Fzg5tOwCWiojmDxXCNQHbGYMI38/ISS+dIZrxmk6cpt+2v7ddAeHWJGWUgshkMFhC
	 9AC9BZ/IQ3QOeidGi1N5spyWlblQbW6ZkEi/XUShsklxnqcBcMwYlETg72GOhrXN1wtQ1
	 6kprrhMurtXU4GvgeswboPudqWZmsqkt6q8t1HNIV7NIKgfKEoK2nPhwK4URcWMEMiieZ
	 ie4iSDxoRtSK5JGrgShzDABzXO6AFLseOatMmOVaOPrURMvIAALCFKVw/8UiR/uUllKjM
	 sroC6WvR/0X9ITLyfN19kphkTlDAX5gTzC7Hmsv3CPTvrlrhfEq7KVPVjYBFNJDMJeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FVeRQcOZ;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416A0606A6A2
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 17:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 416A0606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FVeRQcOZ
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490f38e9688so3413045f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541545; x=1796146345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQPrSDUxid3hTnblfq2igQmpuDYP0lgjM0zpbR4xQUg=;
        b=FVeRQcOZVp0e3u0B/vfbnMqSA+FJJcZKt8YasTolEiHjgLPcPxm4+4Rp3zA/jqVV7j
         Zf6ymi+BfBABlJraptf9D01xnojtkDaXppBdPAhq5kFf7+/UUaHkwGyXs27G1xTn6LCH
         JF8hcyFjnKAHHDvPhXiPxnGOxwsxKM9f9MRF+hupX8cym5wt8px9Wn92s6gdVR96kgUS
         wIg8UA22rjEzXFraJQUjjrQ3OkhC9CA/4WTnu+Zv/Yjh/brXqR1WSRGUVLnpHPXccIu9
         AxKNRB0eGbchsPpBZhdA75W7ewK3oPIPUXcRo6BhoYrzE6qhNnfJ3i2YZu6agNop/J3s
         ldGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541545; x=1796146345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQPrSDUxid3hTnblfq2igQmpuDYP0lgjM0zpbR4xQUg=;
        b=uk33VSf+2YPSEyoUCvPDcgsdH2EeJ+UAjorgS5JIyNFEZhKjnEYVsPZy207k9lDKHI
         tCLpBdU67zSDZ1OLuZ7ppCOx/cu4tQgUpfG6IkqKkfn26xtVCsAuk9oq7Ds+5jN22qBQ
         o6kQdN/6+i66GI8P5t10z2Ka4wLZDbY64c0zvCjO9j91qMetEGpXlTIC+q2Mpa5TD9mY
         RiFmLJyss+enuXI6hMh5D2/QgNYH05y/wVMrFBQbnxrjGjOvCwNP84db4n3YY5k9TNgs
         L574FFSBVXnUMEN7x9/m1UC12K8d1XZgszjAi3u3DfBQ/3z6T7riKab3i7QnpbmRFYGN
         1YuA==
X-Gm-Message-State: APuU4Z9wmLE/2VPPxR9Mw/AXNrQDC7blnhK47uYtJFBKPDhxNdkQUoVG
	RPEV9PZk7ooyVSNmlXR1tPxqvi7Zh+hHCb9W9hhTAmejVymHUp1YF81zdD5jfglizgY=
X-Gm-Gg: AZFdTZeAK+bShnjeLRsa03oRV5yMadz9fcj6lqS/hYu0dbIZq8spIBfr1CxBXOSAlp4
	gxYk8kgotukUj+FgdvfR2hdod5WRF7LPmtzDdYNMb4ia4EF+cqrAkHeUPyJn3ISjlY6E1m4jzE5
	wv4h+JyCKw0+oKU1OhI0UrnRQVEwl74O3v/pdgJRrJZXoiYEyxv7BiEXC2wLpdmKCOsJrpk0Uai
	9xRLnL/iCAEPYpODVqA0iOh9M6MTKdR3dBbSH2yEx1aUdydEt65nm7udyG2WTA/C1uzy+gYgRvb
	aKTs0vkDq3Lli0gSBh/q29lCTtxOiz/3z0jvwjg/BnwKA0tNNVe4/A6Gd+5CZxrL2FVli/9zoZG
	t6kMgcQ55UB43+/V/SbKepMas3BnoxbU/SqnO0qmDhGsTyxJ13KE5oz9RW5SCmPfrJMj61B1eBx
	B8emyiIPxQWX1ie1VOaB8O3YgwEMX0DPoCyt4iEIX36i8BsEmTZevHoazHuEX3Pr7UG53MYvQ6u
	RbgiWx9MGARn7qw9IMEeVYVcajW6KNOF5GOMytUXaMeIa1jVxMirJsRkVR4njOpwMLbrfzdZgoi
	PoPRIYIc1X8Lab9tAi7vG9HE4j/EJ15mRveFFsypZO9ewUK3tg==
X-Received: by 2002:a05:6000:4028:b0:4b7:6dcb:e909 with SMTP id ffacd0b85a97d-4b76dcbeaa9mr4964922f8f.8.1795541544368;
        Tue, 24 Nov 2026 09:32:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:11 +0100
Subject: [PATCH v2 04/19] ASoC: dt-bindings: qcom,lpass: add WSA RX and TX
 channels ids
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
Message-Id: <20261124-topic-sm8650-el2-v2-4-174e159f0f69@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7B0HLPkz/JmSein0hlLzb+UyX+3YoDiyYBasK2j51sI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcobHT3wfA2dFegDM6YyeCf/EjweRT9Bfr20/CMi
 fRq85nmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKGwAKCRB33NvayMhJ0ZcMD/
 9IZE1CdzQwYE3MXJB4tNl1yvGP94XqFSZE6c/N4gyF54PCyf6E7gs0CovGuulFHzDiUUhCp8RpE1+0
 xEHQkSUvWkym/v/VDccJKA57XdKX+RRycZ53j7gC4m7d2sHCKH6MNV99s5Og+PfpOo8rC7ZeJfMQ+Z
 1hexuC1yj4i1VBnDxI4ubfyxBnhy3NVW4fvrjL4Rp32FPt66+MxW/Q8P5N6cW3QPkXVy8IsNWkRtbH
 R/JuRuiCm8oh0njunzrQFb4DklIbx24HWR1Bi0mcjWGmdPJj/yEMBkonqpFoG81Afz92Sfzr8JbG0X
 c18hGgABLKE9QBS+8/QWIXnL8t8dUEaUUkhZGKxtHAdyOsx6zO+Pjuj8k9+BNoyxmbiKYdu+BUxONb
 j1tOU2zdHsFIc/UtyiHwE8+3LvIRUxnqywK72uwTOqshJI9Ez0WP6SPO+SyXPAVqi9xfKTzs0o4WhJ
 fNdEBwDVPkKV84tgxthnvvFNyXRh0cnqfLOSj1gOTwV1DKOGO4JqPHqKdYHlcFmeYjZ61cyVhmhPjB
 a0MJ1suqL8f4eftaFz8oDt6K4QvM61bEfyfgA2+a2i4yAFcjl+uRdoVt7mkNQalJwPqrRCu5SGCmGw
 TFEUKcn+akM2cV0P74rKdfqhlkcFU2I+2KYy10c/SWeQorKGzwmzF+UII+3A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the bindings to connect to the Qualcomm WSA interfaces.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/sound/qcom,lpass.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,lpass.h b/include/dt-bindings/sound/qcom,lpass.h
index 22f5e1fcc8a6..5d8db5195dad 100644
--- a/include/dt-bindings/sound/qcom,lpass.h
+++ b/include/dt-bindings/sound/qcom,lpass.h
@@ -44,6 +44,27 @@
 #define MI2S_SENARY	34
 #define MI2S_SEPTENARY	35
 
+#define LPASS_CDC_DMA_WSA_RX0 36
+#define LPASS_CDC_DMA_WSA_RX1 37
+#define LPASS_CDC_DMA_WSA_RX2 38
+#define LPASS_CDC_DMA_WSA_RX3 39
+#define LPASS_CDC_DMA_WSA_RX4 40
+#define LPASS_CDC_DMA_WSA_RX5 41
+#define LPASS_CDC_DMA_WSA_RX6 42
+#define LPASS_CDC_DMA_WSA_RX7 43
+#define LPASS_CDC_DMA_WSA_RX8 44
+#define LPASS_CDC_DMA_WSA_RX9 45
+
+#define LPASS_CDC_DMA_WSA_TX0 46
+#define LPASS_CDC_DMA_WSA_TX1 47
+#define LPASS_CDC_DMA_WSA_TX2 48
+#define LPASS_CDC_DMA_WSA_TX3 49
+#define LPASS_CDC_DMA_WSA_TX4 50
+#define LPASS_CDC_DMA_WSA_TX5 51
+#define LPASS_CDC_DMA_WSA_TX6 52
+#define LPASS_CDC_DMA_WSA_TX7 53
+#define LPASS_CDC_DMA_WSA_TX8 54
+
 #define LPASS_MCLK0	0
 
 #endif /* __DT_QCOM_LPASS_H */

-- 
2.34.1

