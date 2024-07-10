Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB74190492
	for <linux-sound@vger.kernel.org>; Wed, 10 Jul 2024 11:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720611592; cv=none; b=kkJhT7Zn7MAzELkXp6uZENXnNlV4aIiqHNAJiMI5zbSxSv6V7+OaJNGWGrcECFVkfHyBm7DL3xGREcZTyuaJBLtlEDZFosgW0pqI69OW3fEwjB2iaHvzKPkSjiRCrpKtQNjG+hFVgUL/FfPZUvXiRGzebT9X+TqyZ8uo5QXhDX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720611592; c=relaxed/simple;
	bh=kXcXQlQw8cCu7vUhvQQqw7fNx9k+D9plQJiW4hesxaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJ66U1wwSPCBZsboSe+5tJFeYd1mcXDqQaQiEBzRaKrVGdIcob26cSpTvwO+s0Qeyxau0CUw9f+0kNN5OvMnmlzJFNfyHUBFYmDud+v0YBTFDIhnFAG9JzIWVWTKN6PLksdGkoDyGqeYF/o3JWHh95V5aw7Fe1+wybJ57zgSA7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bSdt83b+; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bSdt83b+"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52ea2f58448so7986768e87.1
        for <linux-sound@vger.kernel.org>; Wed, 10 Jul 2024 04:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720611589; x=1721216389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrw0KmyxDKt0z/+5CdGnxoQjpcekSUdd2Exq++60Pok=;
        b=bSdt83b+STqv3sRkm97i6CNTLb5vmyIPPBOtsDdCeR9q504OtYvtUZpnjR43P6rpQW
         QAKQGboF/VDP7rEtJ2hO307qIW7qFcTaQzOiqM1Yv6Q/lqFaa67Cu3RB+5RnPr4/Ey/T
         3BFXhJP4/k/B226e01Ve03cAXIZsoH1efsb56+VHOh3wNF60vZUwGm0MoaofXw7Pkrmt
         SzCQh1LFyalLhqpZsptgfkRM3vYiK736Ktu+nflInnVeg3jZC335nISUbCn/xJdK2D1V
         zAzsX9+VQEOPdGSJady+UoCoHQPirJgDQZPhMazvZROwz3SOKemvlMPdWcUR/4ttnfCo
         v4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720611589; x=1721216389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrw0KmyxDKt0z/+5CdGnxoQjpcekSUdd2Exq++60Pok=;
        b=WSAzkH81/8uP9qIvjHmhlQn4ch0E3CEWVuZwOFrsyniBqjYRBi9PAiP7qoem9oTDJ/
         WcgN35vAzb4G3WQ6UDhIYNW6bJF6cAsTKoIYvi1nO8SQ7gpa09YImU7I6oltA4N8NJX1
         /D2PSg1UScYAlR7c4A56Z6eJULneJ/C5YSH3pmTb3Mdb9xYR6WHs3stWGL7at3l5akCs
         vf1spJO8Hbuo7p/2Pf1YtgacESy+kcPY2NCyEZrgM+egFU1Vu6g7iLeduR/UrvCVAlv0
         sB3VLMAlK7ccz7aS0MPOttv3GasCsT5I8Zl8PytF9fH6DFkhXTxn+EaZKxTJ+XZrjPlt
         uOMw==
X-Forwarded-Encrypted: i=1; AJvYcCWEICagMg4nzNHg8Tg75KReTNq8/bhr3TiINXdjmyaGh/L+AII+SIbbZFj9DhZW9vXOoiqMiy6XlWodSqIRYOGDl8EAlqf4irNxCm4=
X-Gm-Message-State: AOJu0YxpQeZyYFxnxLTqBRJ9W6nVJtiY7eCkaLq3otJV6TjfaC8Zy4y9
	Y9GNS71vkC3Y2RPJiece7lot1YoS5iFjsnm7IVLWrYExwhrDnCgyjnzuMFK2R2M=
X-Google-Smtp-Source: AGHT+IGCIfQQFWizC9oYA0R7wEwIwKOXXTqvLbF5U7LfpTs+Ls/Zyvmg+QDt0ocqWOmzblGuzvrQSA==
X-Received: by 2002:a05:6512:b0b:b0:52c:a724:5ae3 with SMTP id 2adb3069b0e04-52eb99cb0admr3854086e87.51.1720611589220;
        Wed, 10 Jul 2024 04:39:49 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f7361b5sm78602875e9.29.2024.07.10.04.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 04:39:48 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	alsa-devel@alsa-project.org,
	Banajit Goswami <bgoswami@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: qcom,msm8916-wcd-digital-codec: convert to dtschema
Date: Wed, 10 Jul 2024 12:36:06 +0100
Message-ID: <20240710113833.39859-2-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240710113833.39859-1-rayyan.ansari@linaro.org>
References: <20240710113833.39859-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Qualcomm MSM8916 WCD Digital Audio Codec bindings from text
to yaml dt schema format.
Make bindings complete by adding #sound-dai-cells.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
v1 -> v2: removed unneeded minItems, added ref to dai-common.yaml

 .../sound/qcom,msm8916-wcd-digital-codec.yaml | 55 +++++++++++++++++++
 .../sound/qcom,msm8916-wcd-digital.txt        | 20 -------
 2 files changed, 55 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt

diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
new file mode 100644
index 000000000000..a899c4e7c1c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,msm8916-wcd-digital-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8916 WCD Digital Audio Codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description:
+  The digital WCD audio codec found on Qualcomm MSM8916 LPASS.
+
+properties:
+  compatible:
+    const: qcom,msm8916-wcd-digital-codec
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: ahbix-clk
+      - const: mclk
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#sound-dai-cells'
+
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
+    audio-codec@771c000 {
+        compatible = "qcom,msm8916-wcd-digital-codec";
+        reg = <0x0771c000 0x400>;
+        clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
+                 <&gcc GCC_CODEC_DIGCODEC_CLK>;
+        clock-names = "ahbix-clk", "mclk";
+        #sound-dai-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt
deleted file mode 100644
index 1c8e4cb25176..000000000000
--- a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-msm8916 digital audio CODEC
-
-## Bindings for codec core in lpass:
-
-Required properties
- - compatible = "qcom,msm8916-wcd-digital-codec";
- - reg: address space for lpass codec.
- - clocks: Handle to mclk and ahbclk
- - clock-names: should be "mclk", "ahbix-clk".
-
-Example:
-
-audio-codec@771c000{
-	compatible = "qcom,msm8916-wcd-digital-codec";
-	reg = <0x0771c000 0x400>;
-	clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
-		 <&gcc GCC_CODEC_DIGCODEC_CLK>;
-	clock-names = "ahbix-clk", "mclk";
-	#sound-dai-cells = <1>;
-};
-- 
2.45.2

