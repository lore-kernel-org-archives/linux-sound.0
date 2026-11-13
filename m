Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595123;
	b=hk0T1HWkmdX2eWskf46NnxFqtvgwL/TZBNmJ1YHJ+8X+IBagAspPhf+db4nJ2XhD7Eh1
	 VAf7hZ9SpDxQ8k9dITWOE5OcmmYs0Bl4AGu5Pgfne/Aj7fpM0qSZL6vcie/bsr0DxZDFw
	 EglTWvssk/dDU/42gRlgpbTW0wj1HbWQ0qIFAvxkfXxhrQd1weCQiFu62FZWaIGUU1hbc
	 90f9kEuMtlbun3pIes6hc43W//GUVGGy85YdpTK0fUlZgiNh82V6DSrpGluVyrE3Z4SMk
	 qw0jcbT5vNBwvct8qyqs7fhUjsrAQhm4JEnWNL+aO4T3RqhQlf+KzFexnu/02jrfHpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aQPrSDUxid3hTnblfq2igQmpuDYP0lgjM0zpbR4xQUg=;
	b=TezcCDdtqZLI0AZH+GcwYUi4tddJ4BqkDEZEbd9lVbijCkL0dv1hlUTcXsvzXozOWqGl
	 BnX+z8NPkwv6yQq9i5PKX55Rhrne63u3pzG0ugfUQzQwh0jS4M3L50SlZIyA4l/i7g6+2
	 cmSLgKCFj4IolH2Cbx4j4C5Ud9bhkE29u2kbjzXBZoH6+6hPeYtJHMld9lLx0CMN76pkv
	 HZeG4NjuPiPPezPZL1m7CeYsqnClFZnwbJ1UXmFXYJociez7zn11Dv3PujpeYqsaKYG+1
	 9AIKHn9rDRTgkql7GkoC0prMEncDbDxUWoobIjU/GTs9eWfkcJtEjk17ceqbsL39VPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kNvNHTUg;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199E0606BDFB
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 18:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 199E0606BDFB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kNvNHTUg
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49a92144733so523331f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 10:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595121; x=1795199921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQPrSDUxid3hTnblfq2igQmpuDYP0lgjM0zpbR4xQUg=;
        b=kNvNHTUgRjtH3mON9M91rXL1bm5mOnrWnMSeu1K73fYuLMy8EvA/ZS83+hjpvyJ4Yy
         2aprL0xs0PB40OQ6Dhhpugd6YRCMj33GDsubh7LMFUt3yVSSZQDZV9l5LxVVcm7EHhY0
         pjTO/mSguDcs4kyewWd9euNoJJdqA61YNmA1VwXvwD88303OTCnLnVca0Uf9X+LVbijM
         kyjoLiViBevsmqMY1+WOYgCanH6OrT+rqXkDdJS7IOaOERJ0THv7oqUVQAQ6jLoLHu1s
         EIa2/zQG+mdhkF1n+BHNbgY8K1grM+O1yTMHkZA0I5ebtHQBqxdMYuDHw3VcUUhJRxlj
         wE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595121; x=1795199921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQPrSDUxid3hTnblfq2igQmpuDYP0lgjM0zpbR4xQUg=;
        b=iBQd6kqQVY/MWO3g7bDMqfRL3vc69dPzpj3zgG2hYOYRmMpHZ+9f4pGEUQ54aGsLXP
         zrMnwXI47+k2K/2MEpyHEgd4IILT4WRSdZXWEg3DpA64vEkar1zCi17YzYWqAxdMxcKz
         BPehfBneqmovLuyBqJTfFzJK4hSXWtHkJIDeeDXr55SMyvJBPUk6Ro9g/33P3ehcY5Bs
         Rk01UJErVEOID4ovtPPQMhK3AFPWbl5PpZOFk8Uev3N/KzCZlDyqiS8Ywzeh244xPVsG
         hrWFZA4omN8wKfIv6tVf41LXBXhoTOIpWT3QMX+rhYCcc6JgaAJNo2R1NQ6YLvJ1l7tR
         DKhg==
X-Forwarded-Encrypted: i=1; AL+hErEoje2w5mPaRqBhlWV8POCm1Jtfz1NHS9dwM6UAtOZkt+3Fn+9eV3BsI8r6yJk5j4Zd/lLyMyGUCRt6UA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/LhVW1yLDBMFlRjIPGfl+YxRWl6U8WpF3I+PF9Y/t4ieprLKz9
	7Qf2duGmxM1eCq1YfOWKo/2yO9JkVDW6alEe965pduwacwfnZWlkUgwR6o5A9qHBBL0=
X-Gm-Gg: AYBFou1W9xN2FNJGOROxmh333G7UqSEyrnYcKerCjx1eXLeebHwT3Q+sLz60pYhAsoY
	5K0xrfDABUyZFVAN54KJ5IVoAvg3l1df7OIjToRDcyfC+UGY3kCgyMIYibBavEX4e7+WsB+Klql
	7wc+FfSgxATo3DR//y0EoROWf/QDC/Dpuk5XcPvA+C/H+/3iktW9UAIKRUp5QlD4OaMdMXBZODl
	vPwGizS0fVguwbOYTzpAMBAilMcQyHFIXzb3GyFsmWFcckM/lKhj+k6g9YxWLI4ZBPHXyU+GfSW
	C4IM6FYTYTVAtX9Ejsr0zrghy3HC7oT+IJ5Pl6sU83tUtlyUdn9HoawZK++ikP6uEesGPmY3n6b
	a1XorW+tbWBTvwoIzglvpgmcNfXiBSvsL29q6jZP3d192kN9F3i5m+xaqaQfEYcAwGrllNxU7Qg
	1TXpAtxfT8I5/LN1MN75sQANCY5qhYab0ae/ZxSM2i6By+lacJlVWThRGuhUkEtZw0s5X4PjjTr
	yg8vel6ytjrJAtFPG56wphdMPCiTtN/tJq3pDF1hN0xD0MDGj5R4YnP1nPR/2ZvcSqUACFhqADo
	KEAuk3LWC2oUh7VfhBsz7hVGYYtlEPmk6zHKV4Urfic=
X-Received: by 2002:a05:6000:29cf:b0:48d:f9dd:e3df with SMTP id ffacd0b85a97d-49c712ac8edmr4249814f8f.18.1794595121078;
        Fri, 13 Nov 2026 10:38:41 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:40 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:19 +0100
Subject: [PATCH RFC 05/23] ASoC: dt-bindings: qcom,lpass: add WSA RX and TX
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
Message-Id: <20261113-topic-sm8650-el2-v1-5-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7B0HLPkz/JmSein0hlLzb+UyX+3YoDiyYBasK2j51sI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kfPhvTXeMs73QmE5NQsahYZG9H830cDEBY6m9o
 UEhCBleJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZHwAKCRB33NvayMhJ0VCjD/
 9N0CE7ZXY2semuBrhYN0RyvNDEYoK7WutoyBIX5xdZDi43Z4J3tQePDZTIgp8ZFCYT9aiv6iW+vjmB
 Lf9Yo9oJ66bHsV1hoAeXLrXicmkYA2NGEckDOE6g2tdkKXaIAJ8lFri+9GnGPOmeu+V21fWgKg10MX
 TgUf4zSTk0mtjwhOgAX5H2EfWQmg0eubO5w4aEmLPfn4vJBx9y6eqbo3H5sFIvStYXxniE6jargFkS
 fImd31BCwFKxStoRZJrbfUZDK1DlqyaSJfOV719LYbkYewTqbE8yh1sJHOYS8KwxBiNqUXPOtl6UH5
 F2nPJNyuL7PGUKadHNl4hJ7v32XmAfQ43twMGR/vDOdmCy700unX5t9Y57nQL7tHjTCiesr7RPxzzE
 gaDLBZ0IHe50oUdmjMoWImbsr3iZjLkrXPUwtg45m0i3uAJsyLY3D8JzgbewybuCv9nVcld/PV73EF
 VfklXWvriz7PNi3AjEN+z9X7+3SjIOmCewotFOQQMgKDWiLx5cju3UfzuuGl6V15fVxORUnV+JdhCG
 AAiSPsKru+jO0WEzQ8x5Rb+2ywsk+vdXIqAP+tODE2TUNe5gklfawC/OPSzdvCDhrWPm5um/xMIpFf
 liQuTT+BHUy6GBVORrke3b9xJAz9GqO5UKYjwiCt4RKagd+C+Z5bzmIR5Bzw==
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

