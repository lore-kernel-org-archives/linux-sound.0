Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iDFNPpTn"
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC8CD10E4
	for <linux-sound@vger.kernel.org>; Fri,  1 Dec 2023 07:09:03 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50bc743c7f7so3060354e87.3
        for <linux-sound@vger.kernel.org>; Fri, 01 Dec 2023 07:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701443342; x=1702048142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XsLuiRUcl36nuEUQhIDR6/wMADjrm/yz4rDk8pYcHg=;
        b=iDFNPpTnzFYKQDdkC1u0/NuetXfAcQexHeT2Pv1yEB8NUhq+uCuieBiiRQDL7+1HVL
         uiijVVpHZL+9Vzt76sqPDo08JfMOiTIyLVFtXn2L8REMOmLbfjawg2JU4WJBZ2qtUeuR
         +Y5RHvLHYUZusQlr+CjInv0cdBjfllVwTHhWsOG0aIA7Bpo45OBS8NfQSG5tWuSzvxsQ
         oOxbYyqnUxQV2NLehYrHF5HR8yxClATWjR1IXv8dkghgf8UVuZ82GuK7N7+kbF6T1Pjy
         A6l1OA+bViVAJ9gg0M2ET5bUFIqgkVrL4d4ROlXJDKHBm16mvesLS0kFGSCyOtNFjdKu
         dWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701443342; x=1702048142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XsLuiRUcl36nuEUQhIDR6/wMADjrm/yz4rDk8pYcHg=;
        b=DpTs5Hd17RwnAn9llvDT/v+rJYszf7Yq7wmy2tSaopt93mGbcgRvT1Oo44tVzgFNLA
         AfXCtcA393/5wx316GwE67OGUR92gX8ynjBb5G+us7zVeArmvra8teIFN0+FC9XZXpI1
         PZ5xW/oeNS+dqZOFo5k5+bDdZbVFN4NfpLTSLtk21iqmPJsZhJVon9cWboB/WJMYFwp4
         43pr5TOFJ2ShspVjIw4AZ7arIWsFV/hGs2aI+if38I1jFKMRi2nGvwfFgxdMRO41p5/F
         007sPzTz/ge042pzDQ+d8hVPDQJC+x7Qhb/BW7CJwjZj5mfIHzx64BTKfCxkC453XRVc
         zH9Q==
X-Gm-Message-State: AOJu0YxggYIdkzVrCqFVJd5uGe6vHPn1LpFfWhIyYBKkXXiD4tXRgymV
	EfqZc165TzNhzMcIJI6N+nZnOQ==
X-Google-Smtp-Source: AGHT+IEwFSqRwLE0S6z19fYJUigSGSe/Lu9/AOWHA4ZBfp800Zqya6nMl0xRFRT+G2toL+v80OukIA==
X-Received: by 2002:a05:6512:15a4:b0:50b:bd9c:8b0 with SMTP id bp36-20020a05651215a400b0050bbd9c08b0mr910702lfb.19.1701443341914;
        Fri, 01 Dec 2023 07:09:01 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id fs20-20020a05600c3f9400b0040b5517ae31sm8569539wmb.6.2023.12.01.07.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:09:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 01 Dec 2023 16:08:55 +0100
Subject: [PATCH v2 2/5] ASoC: dt-bindings: document WCD939x Audio Codec
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-topic-sm8650-upstream-wcd939x-codec-v2-2-94ed814b25aa@linaro.org>
References: <20231201-topic-sm8650-upstream-wcd939x-codec-v2-0-94ed814b25aa@linaro.org>
In-Reply-To: <20231201-topic-sm8650-upstream-wcd939x-codec-v2-0-94ed814b25aa@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6444;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=mWJwSaSVD3XgzAsTKQAIK+4sHRaSB/e8uBoCOrJJHRY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlafcI+CFIkmDxQv6JZxNpc6BcOs7M809vJRw7TPfG
 /EvKkRCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWn3CAAKCRB33NvayMhJ0UVaD/
 sHUXq/75jcU9Ng/rmV7whQfVTtgNB2acYdQtrZ8iBTn0wGGknC0tDN3aqCLnZ2zRBfNaLdgE8dBmDI
 O/39aGdQyi6x+pqYLwt/lFitMMq/+bf7e9F3/aVicanNTR4ysPZwDsrSKdsNYTEzlZlYW+BVsSjXbQ
 ync93+UUsFxHwFsTjVV0tZ95rfbvb6LAMTueaOKN8IQRmMgmVp8bEY/sTjwBjf6o/KhR4GvU7B+Xc2
 8eF6JtANnWXhkeoXrR++ZLAPZWveKSuN7mTS4Rh6ksfzvPOhgla6zY6HiBxBHhxagNVUc6N4uxxMOp
 Sl4r79yy4ftpBXE/Dts8kJYp3OV9sZUaZeVANieeexsC63PT8Qlt0dRwO//h46RT288rnuavTj8kU6
 eIwYIKwNWQwARBOy/ib1CMbCRoHu2SH36XVJtrd3L0CX7/gVHsJ7H3KptN7YiDPt/HNNOpBhe5t/Qq
 wG9cpgYaU24zaLxFkRNU2o5nSNxhxseYSkW7Rh0xeVa/wZlsPdd9Av2cstubywxF6HOQ0HSLsskuOb
 xuoArFp0xGyFB/gWbXB7pMhjVSdjBsCXTGnsfjQZUIIdrrW7REjJKz7Y4OjQ8QF7Yfzz76UUmCKgw2
 DTPDmPA1ny4AKWIRuf4iIqK7xVbNECeC6fpSLPXp/9Iisn+OkYdhe9kyvQMA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Qualcomm WCD9390/WCD9395 Audio Codec and the
Soundwire devices than can be found on Qualcomm SM8650 based platforms.

The Qualcomm WCD9390/WCD9395 Audio Codec communicates
with the host SoC over 2 Soundwire links to provide:
- 4 ADC inputs for up to 5 Analog Microphones
- 4 DMIC inputs for up to 8 Digital Microphones
- 4 Microphone BIAS
- Stereo Headphone output
- Mono EAR output
- MBHC engine for Headset Detection

The WCD9390/WCD9395 IC has separate I2C subsystem for USB-C
DP Altmode/Audio Accessory mode Mux which is not documented
here but requires port/endpoint graph and properties to handle
Altmode/Audio Accessory switch and orientation.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/sound/qcom,wcd939x-sdw.yaml           | 69 ++++++++++++++++
 .../devicetree/bindings/sound/qcom,wcd939x.yaml    | 96 ++++++++++++++++++++++
 2 files changed, 165 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd939x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd939x-sdw.yaml
new file mode 100644
index 000000000000..67ed7701b5d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd939x-sdw.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd939x-sdw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoundWire devices on WCD9390/WCD9395
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm WCD9390/WCD9395 Codec is a standalone Hi-Fi audio codec IC.
+  It has RX and TX Soundwire devices. This bindings is for the devices.
+
+properties:
+  compatible:
+    const: sdw20217010e00
+
+  reg:
+    maxItems: 1
+
+  qcom,tx-port-mapping:
+    description: |
+      Specifies static port mapping between device and host tx ports.
+      In the order of the device port index.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+
+  qcom,rx-port-mapping:
+    description: |
+      Specifies static port mapping between device and host rx ports.
+      In the order of device port index.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 6
+    maxItems: 6
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soundwire@3210000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x03210000 0x2000>;
+        wcd938x_rx: codec@0,4 {
+            compatible = "sdw20217010e00";
+            reg = <0 4>;
+            qcom,rx-port-mapping = <1 2 3 4 5 6>;
+        };
+    };
+
+    soundwire@3230000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x03230000 0x2000>;
+        wcd938x_tx: codec@0,3 {
+            compatible = "sdw20217010e00";
+            reg = <0 3>;
+            qcom,tx-port-mapping = <2 3 4 5>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
new file mode 100644
index 000000000000..6e76f6a8634f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd939x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCD9380/WCD9385 Audio Codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm WCD9390/WCD9395 Codec is a standalone Hi-Fi audio codec IC.
+  It has RX and TX Soundwire devices.
+  The WCD9390/WCD9395 IC has a functionally separate USB-C Mux subsystem
+  accessible over an I2C interface.
+  The Audio Headphone and Microphone data path between the Codec and the USB-C Mux
+  subsystems are external to the IC, thus requiring DT port-endpoint graph description
+  to handle USB-C altmode & orientation switching for Audio Accessory Mode.
+
+allOf:
+  - $ref: dai-common.yaml#
+  - $ref: qcom,wcd93xx-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,wcd9390-codec
+      - items:
+          - const: qcom,wcd9395-codec
+          - const: qcom,wcd9390-codec
+
+  mode-switch:
+    description: Flag the port as possible handler of altmode switching
+    type: boolean
+
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the WCD939x Codec node to USB MUX subsystems for the
+      purpose of handling altmode muxing and orientation switching to detect and
+      enable Audio Accessory Mode.
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    codec {
+        compatible = "qcom,wcd9390-codec";
+        reset-gpios = <&tlmm 32 IRQ_TYPE_NONE>;
+        #sound-dai-cells = <1>;
+        qcom,tx-device = <&wcd939x_tx>;
+        qcom,rx-device = <&wcd939x_rx>;
+        qcom,micbias1-microvolt = <1800000>;
+        qcom,micbias2-microvolt = <1800000>;
+        qcom,micbias3-microvolt = <1800000>;
+        qcom,micbias4-microvolt = <1800000>;
+        qcom,hphl-jack-type-normally-closed;
+        qcom,ground-jack-type-normally-closed;
+        qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
+        qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+    };
+
+    /* ... */
+
+    soundwire@3210000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x03210000 0x2000>;
+        wcd939x_rx: codec@0,4 {
+            compatible = "sdw20217010e00";
+            reg = <0 4>;
+            qcom,rx-port-mapping = <1 2 3 4 5 6>;
+        };
+    };
+
+    soundwire@3230000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x03230000 0x2000>;
+        wcd938x_tx: codec@0,3 {
+            compatible = "sdw20217010e00";
+            reg = <0 3>;
+            qcom,tx-port-mapping = <2 3 4 5>;
+        };
+    };
+
+...

-- 
2.34.1

