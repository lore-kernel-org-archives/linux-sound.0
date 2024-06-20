Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58F81A4F28
	for <linux-sound@vger.kernel.org>; Thu, 20 Jun 2024 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718876406; cv=none; b=SI26qtlqS/KvDpiNcxTNlsd8E5EhgVjMV2ZQYMohLyEO5FBOZnQHQvHSrekyc26Xn9emep8a7r462wpQh8Y1Qv6YTjnqKalYORZLOwIGPpwJH3yGZmv+AFXjaIJ29k2v2Nt3NfJNQABPYsuO+Y3W8cX5dfWRnv6q6SHGtv0f33c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718876406; c=relaxed/simple;
	bh=Dt9pPhUPKxY49NTj7PYxkDDnTHGBCFbjM6B6CNFCAiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ihaPCDnq+JMCwzNjMuUwYUREXOSrsIcEbCeGOYjVrA9IjrnVWFoLm3p0SoFv1jiBLNYeKJh82CctrzP3OhXBuiRGEyaLfFWxIeCA1Cfuv+zMYbmEWsVzok+0W7ifiPd/HyqCbgxmcLsYyZFu+hjktneCIO/4w0ZztPeumowPrCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KE13Pvu3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KE13Pvu3"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4218008c613so6889015e9.2
        for <linux-sound@vger.kernel.org>; Thu, 20 Jun 2024 02:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718876403; x=1719481203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1eoyKMeKwORnjXrfh8fRmcKanMlp49yxm/SsNRMKvko=;
        b=KE13Pvu3l12aL4gwxqzsoza+yc1PRJ9V4u39u52bWmSwZZctg4r1PFU92MLTF1zkNh
         dhxuI4f+haTwVRmQpTyxxiXZHTnu1T52xuQzqGBGqljZ8GEtcaAS6ug31DIRcq5JKf1a
         J/mvPnQwakF2H2X1X8Ys9PyanZd7fd7ogMUKoWLe1zFGG7dUc6ndpXbUcNMdsEqCn/T5
         kSy0mc74tGKPUM8ZlgYPmO0PrypgG7tqU3V0GaKFNSt5zgIKa2H582yM24CP+RP6jWGn
         lI6Lom0sP0ojNYG/q+V7nrZ/qv4DW7aDBtNBslGDY9jCWGWfi3f4cp5eqduUtxzvrXU9
         Jmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718876403; x=1719481203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eoyKMeKwORnjXrfh8fRmcKanMlp49yxm/SsNRMKvko=;
        b=A/E29IovpKr7Kg9hGKiMHn4DWV7VKP3ZXTwlSvNg7Ba+IRw6r4n6W//yqelwqAxS96
         KXmvbqcTQsLADLyYUdzU+rT/W+VRHfBD36u+bawZfdLWu/8JT6L6d/9NPt7p5gmBcb/M
         VnOTUT/qN8uaQ6ghb2QPYzn+NJXJh+vdzre8pMMaQKe9ArInGug62PnLRfzKkl4lLIOD
         vfJ134MvQcEml/RYaFOTuNfKZ6QHN/M8L0WVPXm3FAeDGRHia3xsjQ5xcS6VdvydPLsK
         b7geKMGmvbqOhH5Ggm+eXxIn+BmskuufW57LjhRd4ceYBC+RKwAzm/aL8/sY3PsballZ
         1JEw==
X-Gm-Message-State: AOJu0YwBblDPr2SSU5vaIIiBGJuEQC2lp4den3CuF0Ll5SKTpmsUYrsY
	aKqBIp94tJ0sq3IK6+en5VMqoxP6xA5FKL6S8z4qicRBO/Wnu0E5Ue3jARUjJeM=
X-Google-Smtp-Source: AGHT+IFDJlM479D2ow1xuBjPiaCS8XgHSUUVM8IEoVkLP3TsnYi7kngOy9GAbZDMsF3Dc3VZbJbjvw==
X-Received: by 2002:a05:600c:4999:b0:422:4fcd:d4b9 with SMTP id 5b1f17b1804b1-42475297a99mr34223535e9.29.1718876403164;
        Thu, 20 Jun 2024 02:40:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d211ae0sm19366095e9.41.2024.06.20.02.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 02:40:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 20 Jun 2024 11:39:58 +0200
Subject: [PATCH v2 2/2] ASoC: dt-bindings: convert everest,es7134.txt to
 dt-schema
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-topic-amlogic-upstream-bindings-convert-everest-v2-2-660985615522@linaro.org>
References: <20240620-topic-amlogic-upstream-bindings-convert-everest-v2-0-660985615522@linaro.org>
In-Reply-To: <20240620-topic-amlogic-upstream-bindings-convert-everest-v2-0-660985615522@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2687;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Dt9pPhUPKxY49NTj7PYxkDDnTHGBCFbjM6B6CNFCAiM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmc/juS/ZiY6C79JWMKeEjMvnvKqkxo+frglHe7jEy
 BNabhHOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZnP47gAKCRB33NvayMhJ0XkPD/
 9rBxrmrn4vIR3SwOwviZZesq/gdjryZkvsSTmtlO1OqgBgn3dG7HT2soideZLUMeW/6cybHrS9QdI8
 p3xyBrlQn8Wmuw5j6Ez0k7TCrVsKalJABR0Uls36chUlM6fa4YozeKZ4U6heu8U4zEjk0pXeIuca5E
 JAgeTdfVhPtPTSR6PUPmViDzpRbhbpTzHbuEfVGuBMTkmGLIERk6JYgFk5bzWMqDGD84HHlNdZp4kQ
 bbt/o6u04i19PXeKCVAjWgVFGsbkgCFLbevzK4TnPFUNNuHfUh0qYJ3fZ8WJfOn4blmB/s5VEyeQ74
 oos6ShGSMWpDBraiOtAuhvrI0mr7xV4UpwfOW94FKbNqx4hYYZ4C0JTL1iM2+wHFBRP7Anm0lvHXvu
 uBFzemAD9wVw+wswOgPQaRJBOrMyP8Rgc5Z4dgxyZ/PqNafCI0IAc1MOdfzjRPFNQZ5kkM/Kh0CZX9
 xCMDbD6oLoiACwubxgYXCZWngQ3HYI4ny38HGuEMvvPjZZ6Yg2aYmvkKU40fIx2JT9pyu4+8o+T4Gh
 3U/Weg23DYh2tNHjHI+qBaMTALwa5kQC4uT2yD0tJEEUNaH5oi3Cpim5dikWXCoCGBvaO8hn6+9ZOR
 n100tO79w5h3WF4i52DTRIvqFR1/dA+gAXaWJOM9BTOhe6bKtZWmR3OzZ6gg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Convert the text bindings of the Everest ES7134/7144/7154 2 channels
I2S analog to digital converter to dt-schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/sound/everest,es7134.txt   | 15 ------
 .../devicetree/bindings/sound/everest,es71x4.yaml  | 62 ++++++++++++++++++++++
 2 files changed, 62 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/everest,es7134.txt b/Documentation/devicetree/bindings/sound/everest,es7134.txt
deleted file mode 100644
index 091666069bde..000000000000
--- a/Documentation/devicetree/bindings/sound/everest,es7134.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-ES7134 i2s DA converter
-
-Required properties:
-- compatible : "everest,es7134" or
-               "everest,es7144" or
-	       "everest,es7154"
-- VDD-supply : regulator phandle for the VDD supply
-- PVDD-supply: regulator phandle for the PVDD supply for the es7154
-
-Example:
-
-i2s_codec: external-codec {
-	compatible = "everest,es7134";
-	VDD-supply = <&vcc_5v>;
-};
diff --git a/Documentation/devicetree/bindings/sound/everest,es71x4.yaml b/Documentation/devicetree/bindings/sound/everest,es71x4.yaml
new file mode 100644
index 000000000000..fd1b32812228
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es71x4.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es71x4.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES7134/7144/7154 2 channels I2S analog to digital converter
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - everest,es7134
+      - everest,es7144
+      - everest,es7154
+
+  VDD-supply: true
+  PVDD-supply: true
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - VDD-supply
+
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - everest,es7134
+              - everest,es7144
+    then:
+      properties:
+        PVDD-supply: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - everest,es7154
+    then:
+      required:
+        - PVDD-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+   codec {
+       compatible = "everest,es7134";
+       #sound-dai-cells = <0>;
+       VDD-supply = <&vdd_supply>;
+   };
+
+...

-- 
2.34.1

