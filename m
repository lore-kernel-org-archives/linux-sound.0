Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3EC1A0BC9
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 17:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935662; cv=none; b=ezrpJWCvUGXam7qcdPnBWg6GS+50f3UHRvM8nnlC3HjQf87T7nMsotXHZE3PfpGFbc//rJuDILs6lo56soMZcgrVgIQVK4dLIi+HnPTbWrRyY4BWNoY965myhOXKBxLx5lp5kDQFswBHF/Fe/TJjiBpnqoAnLTQOI3/7z1NEcrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935662; c=relaxed/simple;
	bh=rpsqCVq7VP7V/ZiMOKAAYLcouhxitWaKRIaoGe3WXLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MKqMEC8sqGcexIGSl0IVCC4PT8HVqJK3yy2npWtlY2vO5T8k+d7cXwK7++zKQZF7+9kB2F07oN6lJZkU2AotcWuaxSgDiaEkQxpKM4yC6kl2ZgohG7NhhZj3WeJyOoXuzKLb83rmgfa+o4bbOpWESm2wRh/vM2W6muTTpWKEWNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=poGRJIOo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="poGRJIOo"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d0618746bso68218935e9.2
        for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 10:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935657; x=1748540457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igl4C5n1V3kSpKRSnre7+wY5FZ4wjT5bm40mamAmyxY=;
        b=poGRJIOoSX4V2zXKxmFvJNO5fXModrvNMhiYhDm9hKfIoO0ZOA7yBtnG/J5/V6jEkh
         +JW3lJjXG0tHNO0hMkojCD40uoQJ6x62nrmYje0ckLsm7jkDX4ycStBgaE9OxKTEVCfJ
         psjszQelOXrW4HKqRVv603Iqbm55hFljydaeT+zV2Nh3MAafflgbQec1Qmd5gy24A4ok
         gMwHYPvD9rXIuq+umtj0RCULwb5QiDr5D+LKfxn6v1qFjQzonFtledT5oOwmzd/k2bQm
         L6ffgM1/EgAh18LjXBxMnpdpMII8YtA/v99THB97MpRwHt3VgaFta5Nk7B2J4tDLl+zV
         tl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935657; x=1748540457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igl4C5n1V3kSpKRSnre7+wY5FZ4wjT5bm40mamAmyxY=;
        b=hz+NeuSdbe5AaWauzBaYL4/fcGSHAT/x+oNWut9Kl8yjZH8DtUkHYx6ykGKXPdvIns
         euEUcAXX7JAmTShGlqtJHRZrR4yyAja1ggpKum8m38G/VcIpY6oDDbyQBGrJDK9R/J3I
         FNAG7/dsspcdv9oOGVl8o1x/vFKQqEO4X5IlaJobqNU450pmyacewOfCLxFzho5355cc
         cwwo0/g1Bl6vem82Tl43N3RjXsM5WotZpYSGj0pUvvinGZCB3Lhac63Fi30no7vw25rN
         fgpzSKqxp0EaMJq21BCVOVLjt53Xua9kxH4prva0I8TjY8y36IH4p0wCd7GzX8UtuDcC
         0F/g==
X-Forwarded-Encrypted: i=1; AJvYcCU8143bbtmbfsDHVy47KEZ3GFxWRHVlmFqKmcIaXuM9wX3o3y4dsgBOJBb8I9vWc+/z1yMrqTBurg7kig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCN62Hq0g5Her5dkoXgMWSDeGxNpnaMoKiKjzijQYjWoNtu6Ri
	Df7BT4KhYaKIKCg7xXzRYp0v7xzwRNVzaAyFlZq5fwgjkMKYP+9FGkxX0SPbJaaEmdB2P42Fvs2
	m6Sfy
X-Gm-Gg: ASbGncun7SB/NuzO6Zsaj0s2zk1Ic41uD4EA0Qhbe8Yofa14JtjPU581QXnLZPt95ZQ
	vnDc2tnuVu+6HWQ4iwjFksiuNSKnkQ3Mw0VbtuIoVNsedUazlmjVNdz9LNcPIGgbog2CbiExtla
	b1AzOciv7Tdny+sT+xHiGtvhcfeq0aJZmFRc/+SOKUhmnS1h67fLOD7BsxITwEUCAU8pKheyMsy
	gnNMwLncofyheT54s25Alz7TQzSejmhpllO47m/sCX+OALVCFX+QB0uFeeiaLIM+XStge3QZ+sn
	5J5IZhdnwMhK1WQ/IEB2bGaYZTMhvn/3RZ2b6Bsa1LlXeI4zm2w6496FtgM=
X-Google-Smtp-Source: AGHT+IE0OKfhp+kIa/ZAYDcixA4XAmMDVXBsJz/sOmX77omH4NylPuG7drJ6v1RuKyyGP3ilU9meVg==
X-Received: by 2002:a05:600c:3b21:b0:441:b3eb:5720 with SMTP id 5b1f17b1804b1-442ff0396b5mr240458235e9.29.1747935657302;
        Thu, 22 May 2025 10:40:57 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:40:56 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:40:53 +0100
Subject: [PATCH v3 03/12] ASoC: dt-bindings: qcom,wsa881x: extend
 description to analog mode
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-3-9eeb08cab9dc@linaro.org>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.2

WSA881X also supports analog mode when device is configured via i2c
only. Document it, add properties, new compatibles and example.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../devicetree/bindings/sound/qcom,wsa881x.yaml    | 66 +++++++++++++++++++---
 1 file changed, 58 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
index ac03672ebf6de1df862ce282f955ac91bdd9167d..a33e2754ec6159dbcaf5b6fcacf89eb2a6056899 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
@@ -12,15 +12,17 @@ maintainers:
 description: |
   WSA8810 is a class-D smart speaker amplifier and WSA8815
   is a high-output power class-D smart speaker amplifier.
-  Their primary operating mode uses a SoundWire digital audio
-  interface. This binding is for SoundWire interface.
-
-allOf:
-  - $ref: dai-common.yaml#
+  This family of amplifiers support two operating modes:
+  SoundWire digital audio interface which is a primary mode
+  and analog mode when device is configured via i2c only.
+  This binding describes both modes.
 
 properties:
   compatible:
-    const: sdw10217201000
+    enum:
+      - qcom,wsa8810
+      - qcom,wsa8815
+      - sdw10217201000
 
   reg:
     maxItems: 1
@@ -35,17 +37,51 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  clocks:
+    maxItems: 1
+
+  mclk-gpios:
+    description: GPIO spec for control signal to the clock gating circuit
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - powerdown-gpios
-  - "#thermal-sensor-cells"
-  - "#sound-dai-cells"
+  - '#thermal-sensor-cells'
+  - '#sound-dai-cells'
+
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,wsa8810
+              - qcom,wsa8815
+    then:
+      properties:
+        reg:
+          description:
+            In case of analog mode this should be I2C address of the digital
+            part of the device. The I2C address of analog part of an amplifier
+            is expected to be located at the fixed offset.
+          maxItems: 1
+          items:
+            minimum: 0x0e
+            maximum: 0x0f
+      required:
+        - clocks
+        - mclk-gpios
 
 unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/sound/qcom,q6afe.h>
+
     soundwire@c2d0000 {
         #address-cells = <2>;
         #size-cells = <0>;
@@ -68,4 +104,18 @@ examples:
         };
     };
 
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        amplifier@e {
+            compatible = "qcom,wsa8810";
+            reg = <0x0e>;
+            clocks = <&q6afecc LPASS_CLK_ID_MCLK_3 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+            powerdown-gpios = <&lpass_tlmm 16 GPIO_ACTIVE_LOW>;
+            mclk-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_HIGH>;
+            #sound-dai-cells = <0>;
+            #thermal-sensor-cells = <0>;
+       };
+    };
 ...

-- 
2.47.2

