Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3CE176AC1
	for <linux-sound@vger.kernel.org>; Tue, 11 Jun 2024 09:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718097564; cv=none; b=BAdzmsoMqcflDY06uT9RS3/+NYlgVIjMiATL2NaN74OVc9GNQgt7J2cr8i4TDQRgW9FWHrABwZTI/qYDyUCCBoF2rC3cqKG40godRNPprAEmX1kA2zTTRJleOc3zjPj83qSUST9DraVXVSxk3Zo46JMpQGlfNiHUFO3yr4h06/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718097564; c=relaxed/simple;
	bh=1cs5TGFPvTYKhtCHEa9TjM2PD54r5lUpqR+/FnQDjtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=glPKTlRsIKOFI5Ose00DjZpNSeTAxATlYQVNwF5Wy/F0OUmIc03ezgWlXIMM6oesh5C5mhjE1DY4EVo4r9E9z1jL4Ald3KEOiK7qbofJJ/UsU5KxYOItVNwSt+Z6ob98O3+VY7fUd626qrKU5aT9PC7zJE0yhp5CnSuDWRasIDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pbf3plzH; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pbf3plzH"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-35f1c209842so2173238f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 11 Jun 2024 02:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718097561; x=1718702361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qAotCT98J9DGPM0wloiNQgoKSF4/BliAqLtlTwFXIJM=;
        b=pbf3plzH3HztTDDCbMLmWIzCw3uuTpWnsmtzCKMAHMlVLUGQQgNYEMfDc6S3VzTBOc
         BwwIGxt+AT07S601iLShbqILyVq4qh1AoqbZ6O4dWiS8KXCKq6WwhiYSLwcMsXyPdNY5
         8j/r41zhe89cQSczIIfxauL412KorZUJe8xztwFLmbnmZv+Z2WD17Oh7JJh/skJJgXKF
         Dmnp24dsYf/1B6zS2wh+rxmPZTABMVo0dKJiHLNz0nY3jInOy9IHjKEM1jmSj1Cy59uO
         6R5Zm9EbykOX0BYCAzAsXec/AWKK9dqez6jTlnuI4j8v4Fke6WAiqLZI519BIE2y1WQ1
         GpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718097561; x=1718702361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAotCT98J9DGPM0wloiNQgoKSF4/BliAqLtlTwFXIJM=;
        b=ec8wHSFExhLSSfQ+BIZuFJ5vJXNlVEnyk1KL9jUaa5zZBW8IW0WNV1BF3WmqJQKGW3
         FvWv6zmaESpIlCxySj8WzZHtSl4QuN/N9dk5asPAs3Y+8QVmbTNujkwRUcoPbBOACI0C
         Yb12GVUE6xebz3FV9emU/zN13I2xjeIf+8VSnoU8plMG13nRh+xD7QBtqAuuuesvyL/0
         9+R5NxOHApWtu3LTqXo6jLUp4KUVlnM2MwmGL3OJIZKfA893aeibspkW8DpeeLmtqH2y
         nCbF3JdXvrJY3k1ubC59atdllLfhLAEpmBMGkWRPHTdYUCrp3U2YuC4PQ4pkV88cl9Ff
         j7dA==
X-Gm-Message-State: AOJu0Ywh1B/IgkWEw5EnNpeAOBhxL1IAXkXMBgBGn4lL97mps7m23xAF
	Gwh99txgmMHgr+q+OB5A276goJvJ/mk87ZmwDDFmcF7DnOWBt6hAOwSfUqLu0c0=
X-Google-Smtp-Source: AGHT+IEIFRba6q3D9B0hOwfS+XRDGy4lOjv38Bc2+qra3hHB40ylNIX1noo/SC++PN5cxundgQ9AXA==
X-Received: by 2002:a5d:4d4d:0:b0:35f:1e39:4079 with SMTP id ffacd0b85a97d-35f1e3940dcmr4248482f8f.0.1718097560722;
        Tue, 11 Jun 2024 02:19:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5fc3197sm13334619f8f.101.2024.06.11.02.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 02:19:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 11 Jun 2024 11:19:17 +0200
Subject: [PATCH 1/2] ASoC: dt-bindings: convert everest,es7241.txt to
 dt-schema
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240611-topic-amlogic-upstream-bindings-convert-everest-v1-1-a7f9b4c9005c@linaro.org>
References: <20240611-topic-amlogic-upstream-bindings-convert-everest-v1-0-a7f9b4c9005c@linaro.org>
In-Reply-To: <20240611-topic-amlogic-upstream-bindings-convert-everest-v1-0-a7f9b4c9005c@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3415;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1cs5TGFPvTYKhtCHEa9TjM2PD54r5lUpqR+/FnQDjtQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmaBaWMs4BdnUrsNhbin/f8ULd8qsrytgAW1Y1t6GU
 MQDH0X6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmgWlgAKCRB33NvayMhJ0RjYD/
 9+UEEq/VMc1zkdDhx7JiEKEJa+539lj6I5Iv/XLR321W3gp/yjra37phZ7VM3HpFDh/2+hVvREn1+Z
 fPMH9NEcQdYnwqVUtKARPsp0eT257lY9U9F9MI6ybH3t1caWf08m+XfMm0EleCiZ5785oEuwGSIEPH
 85kOpGBIjtNtzSU/B7PphRq8CeWFvn//API1rvYwVIP5OwAgq4wyDXr3UNGgqPWgWAbVk85gZ1vhMh
 Rlu/zo4RlS8dGUnjmKFXoXtHGt7mClhQiBeUSJYNhqqMVpDWFjEghWbBMydtEZ64MzFcUgzPq2b3PD
 YYhI/N+z8SmNOEyASTVWXjmGSxbtvMH1lbZS6tl3RZ5RKRS8/7G/yF0woXNNa3xmIK2APNhnfH0Tr3
 ZAyvsN2IrQUWBlkyUTYOfHmS33SSesMLSshecmDSBmr5kH35zaE82kIAqItupUrrY8orY4djuSnMQ+
 KJJiNJYaQiJyzfiiZK2UNp6II/cAebDzBHimndkCzHqwO187VaesVjghoAM6ZqB2hyZuP24Pm+nnQk
 oP9GoI6a3pWK5UokUVccjV0RLPPdytkqniVudWiU3lg9bzG8I2kG4marmHuWnN+ihVEFwK0Wc7t95p
 b779uYePLNPSm76xUaXmSUcF2dl8FebSKKRlR/HScA6pTW4VknsWFU7PLsZQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Convert the text biddings for the Everest ES7241 2 channels I2S analog
to digital converter to dt-schema.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/sound/everest,es7241.txt   | 28 ---------
 .../devicetree/bindings/sound/everest,es7241.yaml  | 66 ++++++++++++++++++++++
 2 files changed, 66 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/everest,es7241.txt b/Documentation/devicetree/bindings/sound/everest,es7241.txt
deleted file mode 100644
index 28f82cf4959f..000000000000
--- a/Documentation/devicetree/bindings/sound/everest,es7241.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-ES7241 i2s AD converter
-
-Required properties:
-- compatible : "everest,es7241"
-- VDDP-supply: regulator phandle for the VDDA supply
-- VDDA-supply: regulator phandle for the VDDP supply
-- VDDD-supply: regulator phandle for the VDDD supply
-
-Optional properties:
-- reset-gpios: gpio connected to the reset pin
-- m0-gpios   : gpio connected to the m0 pin
-- m1-gpios   : gpio connected to the m1 pin
-- everest,sdout-pull-down:
-   Format used by the serial interface is controlled by pulling
-   the sdout. If the sdout is pulled down, leftj format is used.
-   If this property is not provided, sdout is assumed to pulled
-   up and i2s format is used
-
-Example:
-
-linein: audio-codec@2 {
-	#sound-dai-cells = <0>;
-	compatible = "everest,es7241";
-	VDDA-supply = <&vcc_3v3>;
-	VDDP-supply = <&vcc_3v3>;
-	VDDD-supply = <&vcc_3v3>;
-	reset-gpios = <&gpio GPIOH_42>;
-};
diff --git a/Documentation/devicetree/bindings/sound/everest,es7241.yaml b/Documentation/devicetree/bindings/sound/everest,es7241.yaml
new file mode 100644
index 000000000000..57ab429b320f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es7241.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es7241.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES7241 2 channels I2S analog to digital converter
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - everest,es7241
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the reset pin
+
+  m0-gpios:
+    maxItems: 1
+    description: GPIO connected to the m0 pin
+
+  m1-gpios:
+    maxItems: 1
+    description: GPIO connected to the m0 pin
+
+  everest,sdout-pull-down:
+    type: boolean
+    description:
+      Format used by the serial interface is controlled by pulling
+      the sdout. If the sdout is pulled down, leftj format is used.
+      If this property is not provided, sdout is assumed to pulled
+      up and i2s format is used
+
+  VDDP-supply: true
+  VDDA-supply: true
+  VDDD-supply: true
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - VDDP-supply
+  - VDDA-supply
+  - VDDD-supply
+
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+   codec-0 {
+       compatible = "everest,es7241";
+       #sound-dai-cells = <0>;
+       reset-gpios = <&gpio1 15 0>;
+       VDDP-supply = <&vddp_supply>;
+       VDDA-supply = <&vdda_supply>;
+       VDDD-supply = <&vddd_supply>;
+   };
+
+...

-- 
2.34.1

