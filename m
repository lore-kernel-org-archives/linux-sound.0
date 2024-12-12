Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23551154430
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 00:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733964472; cv=none; b=tEw9U6UwcXfgq8S3RLQFZITxQYDIcb8rUpRKgJakJHyHh7bsLnP7geCBFgaaTAZZCpYxPOqxFvHM4YN1+a6b78AG+0s/6O7vLtMFbFYYr3QEFTixDnZWSNcqlOU13Cw3h+34CCWvYhqqAD98hQhmBNl9fg80LHnTcBKPyKXSKGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733964472; c=relaxed/simple;
	bh=KxG2H3oHtPjIV+VhCiilLtiyhUfg1u1AKb3+JTgTrMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iU6LI+e8SdyFocopftbqSKRX51lv3MVqijE/bDJiCm582IYMrlXJantFbupgCKft5PuRvygEV3nUUICXgyeP5cVQbT3m99SkvIYB1ntZ5la4knUokYWMcSuJilVEWdZ9hNAsAkFraSt1NYzRpzQY+BWI+fdC57yCNru8lwOM/iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=By/vuAI/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="By/vuAI/"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434f30ba149so317055e9.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Dec 2024 16:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733964468; x=1734569268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFHKgaQUdzL/Q4nPVhlEMPI+GbJNKf55IgIGl/KzjWA=;
        b=By/vuAI/JvC4AssI7Y9TfppP+xN1c6D/OGqMvREbxE0HTIW3VGzWPXsfqybXwY0qhg
         V/mP7eODc10OJUo9zpNNoUl+44rKbSupxUO0Ku67HwGWo21Q2yPMmc3LONPoagnQsU5k
         NETlIEIWABQ6X3O1JwQ8SnpOKeIZBk/SoV9RL/3MwCf8oJD2YQgW1mGJcM3rMCaEdEVt
         4l5Qm663xU1pQGy9H/Cp0yht5efyziuKcO98Y7UFtFrvTYmekfGF/c4XkyHU8tdux3r6
         qmelpG04gYHlYq4EwHKliksPGGa4sT2xj6/GF3Mng3UNDbe53Zd1p6OtCTzBkARiD9NI
         uMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733964468; x=1734569268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFHKgaQUdzL/Q4nPVhlEMPI+GbJNKf55IgIGl/KzjWA=;
        b=BEXI+jFY/ZBxXjt20/hIK46GrexmzBiJx4lKYT5A0V+Qgu93DXlIHXymZUVgYPPd8V
         SQ84lrd11b3NyWUTARzN+NR1kZQ6mPJp09jur1uY4Pl9MvpnkmCbaN565Nbe/HIMUDVh
         1CRRwJdsX4fa7cHmGVQmJSWD3suP9MvORY9soPp9Lu/eNW2HjKmkhgS80LFPhIpzXcYQ
         aQ3faI/qSg/wxjJrfKYvb1Gecj9AmytFUuiBhaAtkNTB5jNLkoG2PBuleeRL4Kgow7ri
         mo9ujXR90/kiKcnPJHezyZy8rBUYYCA91tNFe99nf3T/QGQ8oGFhDtuDxaxNHOiy0Cf6
         7Llw==
X-Forwarded-Encrypted: i=1; AJvYcCXObWI9crmwlTDd6293pWBHGquNB3ljHyBfX6OD5EfJPy7ZsIdq3QtZVMo7+5RQDovokII7LdjvID+9Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YweXb4fhqIHn1T4+6AxcbSeRBXIyspyNBKLz3PcHrgtRXjPG4Po
	V3B4Er2yMW3IYVExjO4jpYqQmbLOprFDzwfYnss9YU2pA0D+wnrrULKUpzz07wA=
X-Gm-Gg: ASbGncvVcpkZjRKpWwSQx3drkAp7Eqx9h34QypRec17OCi0kHaIfOXEukb7B5Hdrwcr
	AJdXSKAESrSSA4E1Wz3tHDPGRaHnt0PhxnV1LjBymE4+KUXUySc4V1d/Kc0wuQeVehyCf9ffdf5
	n9uKydOyrY1mwDpC3ylGCy/ZWZBEZy4f93GfeZZhxYIQMnQ28WX6bD5P69SJ4u7lW6N8vzWISHj
	6eSIDZK2QF9pfqwLZlI9ighwew9hiHkrSjegYXoO+ag9vNvcjSHRPN8zWbjVcZk5hkDV6Mw
X-Google-Smtp-Source: AGHT+IGqJQuuqk4Vhp5TZjFSvgTAdQ/xv2AVt/O10VN20Uow3Ku4n2wjK3uOgIBOBh22buJzPhpm7A==
X-Received: by 2002:a05:6000:1a85:b0:385:e1a8:e2a1 with SMTP id ffacd0b85a97d-3864ce86758mr3868050f8f.3.1733964468442;
        Wed, 11 Dec 2024 16:47:48 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4ef4sm2459660f8f.39.2024.12.11.16.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 16:47:47 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/14] ASoC: dt-bindings: qcom,wsa881x: extend description to analog mode
Date: Thu, 12 Dec 2024 00:47:22 +0000
Message-ID: <20241212004727.2903846-10-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212004727.2903846-1-alexey.klimov@linaro.org>
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WSA881X also supports analog mode when device is configured via i2c
only. Document it, add properties, new compatibles and example.

While at this, also adjust quotes.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/sound/qcom,wsa881x.yaml          | 75 +++++++++++++++++--
 1 file changed, 67 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
index ac03672ebf6d..e482d9dc0de2 100644
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
@@ -35,17 +37,60 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  clocks:
+    maxItems: 1
+
+  mclk-gpios:
+    description: GPIO spec for mclk
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
+            const: qcom,wsa8815
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
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,wsa8810
+            const: qcom,wsa8815
+    then:
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
@@ -68,4 +113,18 @@ examples:
         };
     };
 
+    i2c0 {
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
2.45.2

