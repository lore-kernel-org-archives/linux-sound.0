Received: from MTA-07-3.privateemail.com (mta-07-3.privateemail.com [198.54.118.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC633DA7F8;
	Mon,  6 Jul 2026 19:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.118.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783365808; cv=none; b=l75jyVEUi+oNy+CJtXZjo+IbympdPYu/BS8lQSFtfVexTSWgkGdFgV+oZxrm83/USytKglzdcvx4Xmv52bm6sd5s9KXAvDh98sVm9TJgJ7DfFuK4Dx4e9SdcQ9JR+8wbORDqtDVdWCc9r9Cr0Do8SZlwE3QM/b9xNlAuBJOQK84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783365808; c=relaxed/simple;
	bh=KhrGPjXfFOUZ5cyABgP7HYqcKMyFP7ns8/QsuVEWDg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=apkqjJhZQRm7rmTfxnkIm6CTm7c6S7QiJsiU0wPy8dEFCgQCRMYn5a96yg/pDX40OkL6EIKbIntGECvFgMfcomaL4WAisHI7ayssCSRILxHFKgMDnS9kWh0iUXa2rSfzokva653wHeYjOtVegIY2v7NglvST+1RzR+Pmh6ZEt6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.118.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from mail.privateemail.com (unknown [87.215.145.39])
	by mta-07.privateemail.com (Postfix) with ESMTPA id 4gvDlw6mgBz3hhTH;
	Mon,  6 Jul 2026 15:23:07 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Mark Brown <broonie@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ASoC: dt-bindings: add the Qualcomm WCD9378 audio codec
Date: Mon,  6 Jul 2026 21:22:28 +0200
Message-ID: <20260706192229.144137-3-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm WCD9378 is a standalone audio codec IC found on SM7635
boards such as the Fairphone 6. Like the WCD937x/938x/939x codecs it
presents RX and TX SoundWire slave devices controlled by a common
parent node, so the parent binding references qcom,wcd93xx-common.yaml;
unlike those codecs it has three ADCs and three mic bias supplies
rather than four, hence qcom,micbias4-microvolt is rejected.

The slave devices enumerate with manufacturer ID 0x0217 and part ID
0x0110, hence the sdw20217011000 compatible. The TX slave carries five
device ports (ADC1, ADC2, ADC3, DMIC0/1 plus MBHC, DMIC2-5) and the RX
slave the usual five (HPH, CLSH, COMP, LO, DSD).

The -codec suffix in the parent compatible follows the existing
qcom,wcd93xx/pm4125 family compatibles and matches the compatible
shipped by production devicetrees for this chip.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
---
 .../bindings/sound/qcom,wcd9378-codec.yaml    |  76 +++++++++++
 .../bindings/sound/qcom,wcd9378-sdw.yaml      | 122 ++++++++++++++++++
 2 files changed, 198 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml
new file mode 100644
index 000000000000..32554541b279
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd9378-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCD9378 Audio Codec
+
+maintainers:
+  - Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
+
+description:
+  The Qualcomm WCD9378 is a standalone Hi-Fi audio codec IC with three
+  ADCs, three mic bias supplies, headphone/earpiece/line outputs and
+  MBHC. It has RX and TX SoundWire slave devices; the control registers
+  live in the SDCA control address space accessed through the TX slave.
+
+allOf:
+  - $ref: dai-common.yaml#
+  - $ref: qcom,wcd93xx-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,wcd9378-codec
+
+  qcom,micbias4-microvolt: false
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    audio-codec {
+        compatible = "qcom,wcd9378-codec";
+        reset-gpios = <&tlmm 162 GPIO_ACTIVE_LOW>;
+        vdd-buck-supply = <&vreg_l8b>;
+        vdd-rxtx-supply = <&vreg_l7b>;
+        vdd-io-supply = <&vreg_l7b>;
+        vdd-mic-bias-supply = <&vreg_bob>;
+        qcom,micbias1-microvolt = <1800000>;
+        qcom,micbias2-microvolt = <1800000>;
+        qcom,micbias3-microvolt = <1800000>;
+        qcom,rx-device = <&wcd9378_rx>;
+        qcom,tx-device = <&wcd9378_tx>;
+        #sound-dai-cells = <1>;
+    };
+
+    /* ... */
+
+    soundwire@3210000 {
+        reg = <0x03210000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378_rx: audio-codec@0,4 {
+            compatible = "sdw20217011000";
+            reg = <0 4>;
+            qcom,rx-port-mapping = <1 2 3 4 5>;
+        };
+    };
+
+    soundwire@33b0000 {
+        reg = <0x033b0000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378_tx: audio-codec@0,3 {
+            compatible = "sdw20217011000";
+            reg = <0 3>;
+            qcom,tx-port-mapping = <1 1 1 2 3>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
new file mode 100644
index 000000000000..a46938338f90
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoundWire Slave devices on WCD9378
+
+maintainers:
+  - Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
+
+description:
+  The Qualcomm WCD9378 codec has RX and TX SoundWire slave devices.
+  This binding is for the slave devices.
+
+properties:
+  compatible:
+    const: sdw20217011000
+
+  reg:
+    maxItems: 1
+
+  qcom,tx-port-mapping:
+    description: |
+      Specifies static port mapping between device and host tx ports.
+      In the order of the device port index, which is adc1_port,
+      adc2_port, adc3_port, dmic01_mbhc_port, dmic25_port.
+
+      WCD9378 TX Port 1 (ADC1)             <=> SWR master Port 1
+      WCD9378 TX Port 2 (ADC2)             <=> SWR master Port 1
+      WCD9378 TX Port 3 (ADC3)             <=> SWR master Port 1
+      WCD9378 TX Port 4 (DMIC0,1 & MBHC)   <=> SWR master Port 2
+      WCD9378 TX Port 5 (DMIC2,3,4,5)      <=> SWR master Port 3
+
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 5
+    maxItems: 5
+    items:
+      enum: [1, 2, 3, 4]
+
+  qcom,rx-port-mapping:
+    description: |
+      Specifies static port mapping between device and host rx ports.
+      In the order of the device port index, which is hph_port,
+      clsh_port, comp_port, lo_port, dsd_port.
+
+      WCD9378 RX Port 1 (HPH_L/R)   <=> SWR master Port 1
+      WCD9378 RX Port 2 (CLSH)      <=> SWR master Port 2
+      WCD9378 RX Port 3 (COMP_L/R)  <=> SWR master Port 3
+      WCD9378 RX Port 4 (LO)        <=> SWR master Port 4
+      WCD9378 RX Port 5 (DSD_L/R)   <=> SWR master Port 5
+
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 5
+    maxItems: 5
+    items:
+      enum: [1, 2, 3, 4, 5]
+
+  qcom,tx-channel-mapping:
+    description: |
+      Specifies static channel mapping between slave and master tx port
+      channels.
+      In the order of slave port channels, which is adc1, adc2, adc3,
+      dmic0, dmic1, mbhc, dmic2, dmic3, dmic4, dmic5.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 10
+    maxItems: 10
+    items:
+      enum:
+        - 1  # WCD9378_SWRM_CH1
+        - 2  # WCD9378_SWRM_CH2
+        - 3  # WCD9378_SWRM_CH3
+        - 4  # WCD9378_SWRM_CH4
+
+  qcom,rx-channel-mapping:
+    description: |
+      Specifies static channel mapping between slave and master rx port
+      channels.
+      In the order of slave port channels, which is hph_l, hph_r, clsh,
+      comp_l, comp_r, lo, dsd_l, dsd_r.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 8
+    maxItems: 8
+    items:
+      enum:
+        - 1  # WCD9378_SWRM_CH1
+        - 2  # WCD9378_SWRM_CH2
+        - 3  # WCD9378_SWRM_CH3
+        - 4  # WCD9378_SWRM_CH4
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
+        reg = <0x03210000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378_rx: audio-codec@0,4 {
+            compatible = "sdw20217011000";
+            reg = <0 4>;
+            qcom,rx-port-mapping = <1 2 3 4 5>;
+        };
+    };
+
+    soundwire@33b0000 {
+        reg = <0x033b0000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378_tx: audio-codec@0,3 {
+            compatible = "sdw20217011000";
+            reg = <0 3>;
+            qcom,tx-port-mapping = <1 1 1 2 3>;
+        };
+    };
+...
-- 
2.55.0

