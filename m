Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B542FF657
	for <linux-sound@vger.kernel.org>; Thu, 14 Aug 2025 00:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755130507; cv=none; b=tGG4HAKCWnM9gGFyjdwVfJkdTBItG4/XS4TW9b6GGtrI2IBmYvWwEQUETbwVTvXXO9umBQrSRj5NjS9f7HAtZrJHFJAfKn5vJBeiE1LcYHP/CahIGdnqU+08YDX3NljadHoondl/rwQDrsyj/myCL0aDL2JTOgb9/js41pmU0fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755130507; c=relaxed/simple;
	bh=8b57RSND6zLGcJ2xdoPxrrIGPdOukx3jz3vznV2UfaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QmrGtOxWkOWxM2PFA6le8qaeoK2t8nCjrcnNXRb4tWZhat/csi1lsP8P61swrFzdHuxQAJdr/5XWPggg9m0pZQs3YaeRP4PZ0k/dk3BuBDFEukqibJFVg17l7Cc8A9rTqPpcZXk5qYSPIyYN5DhvDYr0tlYgLWHC/nNf6Zlpz4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WoGlq2LN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WoGlq2LN"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so1515715e9.1
        for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 17:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755130503; x=1755735303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94oemMdf8kRPRCbucse05hwVcBk5HVDz51Q84sY6sJE=;
        b=WoGlq2LNcUxoisn9STfohTyBink6EpB7nRd5vU6nJDp0ZZ7u1VSMWcjBg/h9EAFm+l
         Zgrnltk0tTEh7bJMun8/XLKi801ZIhacaWuWV2ZtuShT0J+kAxKAjbPJ/dJtC5wW1CJy
         b4aCG9TQxfOctb5ChQqqxE6Kp1+EZS6db9qjAyS+hMDHwSYofhnT3Iu/a5IGmi4o4XP7
         ClDEATK5tRa8G3F5uONhNA/6SSnx9TtyhQMe/2C3Swl+vlQkPi5Ol3EDL7ZaZhkcSU0m
         W6LMeAiOjTORfYZJ+bp4HFK5QOKzjgSzFAs6l3A4TYH1RagY97TfAaXZVlhmka/O8HVU
         IwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755130503; x=1755735303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=94oemMdf8kRPRCbucse05hwVcBk5HVDz51Q84sY6sJE=;
        b=X6VzOV09dnZ8YcICL+Rpjh7pKttqVLb6ooX026+NYJ1B53AxHajWJtXDK1zGy7xbiI
         UQwu1x5sdFwSuMNQ7AaqevoeYn/i7XdHOwqhUdImCQUNVA0VmCIbdskWz4964DOF5KkD
         sa6gqCd+ya6uz0eT51PwrM/1H4nhO1L+IyHygJFKrpXwE9FaQOpfP/Myrlb1f7jseQDh
         1CQBA7Meeh6dYaE0t4L/dwdqqh4nqGKcZ8pdSn3lb9tibJnAdjIYC8TUhUaNNeJrjKLZ
         UfaKkp6agpaVUm+XYqBnIuyiJdpIW7Xnxa+mgkUfOPJfGS6o2fb3jWeatEJpmtirAMmk
         T1+A==
X-Forwarded-Encrypted: i=1; AJvYcCW0nfdmwdHYBjS26xHqpwGRflhcPGHaFfXK0VpBS/+PHn+vQHHWKxc224OXmRM00gPODnoGIDbe6Ql+ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTer/dDvAdrLcafozRnWn9FjaGuEg1bsOHE+YExNcVgT0BYxNE
	pf+RzAJWXFdK6QtPIkArVNFBaYGZna5HwfTU/+EUgxhj2QBoSyFhfObsjesi9uS02g4=
X-Gm-Gg: ASbGncuZW4Mw2Vi5QTcNuMyCELXUc96l0JW+uzgq5jDDzFVpf/RRNMVU0DGoQdL38V5
	7Pnd1/voOyWiRGpibSbHFMOqfqkLPzk5fK9psgexHSJm5HqZaDyvAO059YJDo8/BxDFGziH9iLU
	7sg4wV6Nh8Oy1dVVjL91xAtfdqLE59SMH+2avdtDh8UBZG77c2W7IrdY9FiRenQjwd2aJNIMlkQ
	8PPh5Qh0XeD5D/6yBvZ2Th4CQZoXMP909gs8AiCskmldgQD7BZG4uTYuRKBw/V7Isz0YQbXc7xd
	LzZX2UmgtCfl1bItXEOcRrCCjsu9Y52Q0kUmcCUmb6NAt4OQ3mDygF1eBgSGDXkiwbmAmH+YPdJ
	qjbic54h4g4vV/mOU/8Eg8zmJZmfR
X-Google-Smtp-Source: AGHT+IEyju8MtQdpkKfvUujMX9S0qd/VeQDV2Y6JMwKekGC5z/zKQOMq+8ujQFLyCxemmWg7v4FG0w==
X-Received: by 2002:a05:600c:4f49:b0:459:d5d1:d602 with SMTP id 5b1f17b1804b1-45a1b614215mr5655265e9.3.1755130502819;
        Wed, 13 Aug 2025 17:15:02 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:7f3a:5ab2:26aa:831f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a540e1esm18449065e9.28.2025.08.13.17.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 17:15:02 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 14 Aug 2025 01:14:47 +0100
Subject: [PATCH v3 1/3] dt-bindings: sound: add bindings for pm4125 audio
 codec
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-pm4125_audio_codec_v1-v3-1-31a6ea0b368b@linaro.org>
References: <20250814-pm4125_audio_codec_v1-v3-0-31a6ea0b368b@linaro.org>
In-Reply-To: <20250814-pm4125_audio_codec_v1-v3-0-31a6ea0b368b@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 christophe.jaillet@wanadoo.fr, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

The audio codec IC is found on Qualcomm PM4125/PM2250 PMIC.
It has TX and RX soundwire slave devices hence two files are added.

While at this, also add qcom,pm4125-codec compatible to pattern properties
in mfd qcom,spmi-pmic schema so the devicetree for this audio block of
PMIC can be validated properly.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   7 +-
 .../bindings/sound/qcom,pm4125-codec.yaml          | 134 +++++++++++++++++++++
 .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |  79 ++++++++++++
 3 files changed, 219 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1e9ceb2187e988ce7c9514ff6dc2c..068f495645f6e849bd98b226c958ad67ba521dd5 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -137,7 +137,12 @@ patternProperties:
 
   "^audio-codec@[0-9a-f]+$":
     type: object
-    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+    oneOf:
+      - $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+      - properties:
+          compatible:
+            contains:
+              const: qcom,pm4125-codec
 
   "^battery@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6e2f103be1d32479ebe3420e06d1ebedaf3bc379
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,pm4125-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PM4125 Audio Codec
+
+maintainers:
+  - Alexey Klimov <alexey.klimov@linaro.org>
+
+description:
+  The audio codec IC found on Qualcomm PM4125/PM2250 PMIC.
+  It has RX and TX Soundwire slave devices.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,pm4125-codec
+
+  reg:
+    description:
+      Specifies the SPMI base address for the audio codec peripherals. The
+      address space contains reset register needed to power-on the codec.
+    maxItems: 1
+
+  reg-names:
+    maxItems: 1
+
+  vdd-io-supply:
+    description: A reference to the 1.8V I/O supply
+
+  vdd-cp-supply:
+    description: A reference to the charge pump I/O supply
+
+  vdd-mic-bias-supply:
+    description: A reference to the 3.3V mic bias supply
+
+  vdd-pa-vpos-supply:
+    description: A reference to the PA VPOS supply
+
+  qcom,tx-device:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: A reference to Soundwire tx device phandle
+
+  qcom,rx-device:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: A reference to Soundwire rx device phandle
+
+  qcom,micbias1-microvolt:
+    description: micbias1 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias2-microvolt:
+    description: micbias2 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias3-microvolt:
+    description: micbias3 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,mbhc-buttons-vthreshold-microvolt:
+    description:
+      Array of 8 Voltage threshold values corresponding to headset
+      button0 - button7
+    minItems: 8
+    maxItems: 8
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - vdd-io-supply
+  - vdd-cp-supply
+  - vdd-mic-bias-supply
+  - vdd-pa-vpos-supply
+  - qcom,tx-device
+  - qcom,rx-device
+  - qcom,micbias1-microvolt
+  - qcom,micbias2-microvolt
+  - qcom,micbias3-microvolt
+  - '#sound-dai-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi {
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        pmic {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            audio-codec@f000 {
+                compatible = "qcom,pm4125-codec";
+                reg = <0xf000>;
+                vdd-io-supply = <&pm4125_l15>;
+                vdd-cp-supply = <&pm4125_s4>;
+                vdd-pa-vpos-supply = <&pm4125_s4>;
+                vdd-mic-bias-supply = <&pm4125_l22>;
+                qcom,micbias1-microvolt = <1800000>;
+                qcom,micbias2-microvolt = <1800000>;
+                qcom,micbias3-microvolt = <1800000>;
+                qcom,rx-device = <&pm4125_rx>;
+                qcom,tx-device = <&pm4125_tx>;
+                #sound-dai-cells = <1>;
+            };
+        };
+    };
+
+    /* ... */
+
+    soundwire@a610000 {
+        reg = <0x0a610000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        pm4125_rx: audio-codec@0,4 {
+            compatible = "sdw20217010c00";
+            reg = <0 4>;
+            qcom,rx-port-mapping = <1 3>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..23624f32ac305838da7b472ef25995197d42f2b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,pm4125-sdw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoundWire Slave devices on PM4125/PM2250 PMIC audio codec.
+
+maintainers:
+  - Alexey Klimov <alexey.klimov@linaro.org>
+
+description:
+  The audio codec IC found on Qualcomm PM4125/PM2250 PMICs.
+  It has RX and TX Soundwire slave devices.
+
+properties:
+  compatible:
+    const: sdw20217010c00
+
+  reg:
+    maxItems: 1
+
+  qcom,tx-port-mapping:
+    description: |
+      Specifies static port mapping between device and host tx ports.
+      In the order of the device port index which are adc1_port, adc23_port,
+      dmic03_mbhc_port, dmic46_port.
+      Supports maximum 2 tx soundwire ports.
+
+      PM4125 TX Port 1 (ADC1,2 & DMIC0 & MBHC)    <=> SWR0 Port 1
+      PM4125 TX Port 2 (ADC1 & DMIC0,1,2 & MBHC)  <=> SWR0 Port 2
+
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    items:
+      enum: [1, 2, 3, 4]
+
+  qcom,rx-port-mapping:
+    description: |
+      Specifies static port mapping between device and host rx ports.
+      In the order of device port index which are hph_port, clsh_port,
+      comp_port, lo_port, dsd port.
+      Supports maximum 2 rx soundwire ports.
+
+      PM4125 RX Port 1 (HPH_L/R)       <==>    SWR1 Port 1 (HPH_L/R)
+      PM4125 RX Port 2 (COMP_L/R)      <==>    SWR1 Port 3 (COMP_L/R)
+
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    items:
+      enum: [1, 2, 3, 4, 5]
+
+required:
+  - compatible
+  - reg
+
+oneOf:
+  - required:
+      - qcom,tx-port-mapping
+  - required:
+      - qcom,rx-port-mapping
+
+additionalProperties: false
+
+examples:
+  - |
+    soundwire@a610000 {
+        reg = <0x0a610000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        pm4125_rx: codec@0,1 {
+            compatible = "sdw20217010c00";
+            reg = <0 1>;
+            qcom,rx-port-mapping = <1 3>;
+        };
+    };
+...

-- 
2.47.2

