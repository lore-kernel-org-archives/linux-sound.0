Received: from MTA-15-3.privateemail.com (MTA-15-3.privateemail.com [198.54.122.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B68182D6;
	Wed, 29 Jul 2026 00:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.122.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785283667; cv=none; b=m9+e2+sNOeFUxJboIrR7HELl3jf3JxwS+iVsQ6+gOr7KtRl3BPG2dJ/JTfhel+kdoyA3l2hyhFksZjN3KtbhFHTxDvUjwUVgmOONJA6ro3vEWAAb6RlV+DYLas9MTz7XRkdob1in5jpqCnn0pifIPJDg7hWzhxUzhYrqQmrVmGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785283667; c=relaxed/simple;
	bh=odOAOlSTn9Wd1AV0Wf1m40RudCLz+DrPuVaVyT/YmBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SWiw0ZLO6ITV4i/Dq6EJUQ85STuVS58F9coma41J9xQt6iuALKFlzyZlkv0U2lXixF9ZAR//0nDDXk1o74sd41Ur4xr46Cv13woaTuoWggfDomdT851za6WFoMmlkWmVTzrq7hfWLbye24XhHPQKvg42E62y8TbEz2Bgx5cCYeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.122.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from mail.privateemail.com (K8S-PROD-WORKER-09 [87.215.145.39])
	by mta-15.privateemail.com (Postfix) with ESMTPA id 4h8t1k0rzWz3hhTL;
	Tue, 28 Jul 2026 20:07:20 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Mark Brown <broonie@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Julian Braha <julianbraha@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: dt-bindings: add the Qualcomm WCD9378 audio codec
Date: Wed, 29 Jul 2026 02:06:48 +0200
Message-ID: <20260729000649.263426-2-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729000649.263426-1-jorijnvdgraaf@catcrafts.net>
References: <20260729000649.263426-1-jorijnvdgraaf@catcrafts.net>
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
parent node, so the parent binding references qcom,wcd93xx-common.yaml.
The WCD9378 has three ADCs and three mic bias supplies and thus no
qcom,micbias4-microvolt, which the common schema required: move that
requirement into the current users, keeping their status quo, and
reject the property here.

The slave devices enumerate with manufacturer ID 0x0217 and part ID
0x0110, hence the sdw20217011000 compatible. Compute platforms wire
the same chip as a single aggregated slave in SDCA mode, which owns
the codec resources itself and has no parent node. The slave binding
covers both presentations: qcom,compute-mode marks the aggregated
slave and gates the properties for the resources it owns,
qcom,control-device marks the slave owning the control register space
(the TX slave in mobile mode), and qcom,port-mapping carries the port
map of either kind of slave.

The -codec suffix in the parent compatible follows the existing
qcom,wcd93xx/pm4125 family compatibles and matches the compatible
shipped by production devicetrees for this chip.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
---
v2:
- squashed v1's separate qcom,wcd93xx-common patch into this one, as
  Krzysztof asked; no changes to that part.
- one slave binding for both chip presentations, as agreed in the
  review of Srinivas's SDCA class series (link in the cover letter);
  Srinivas added as binding maintainer. The aggregated SDCA-mode slave
  is marked qcom,compute-mode, which gates the properties for the
  resources it owns (supplies, reset GPIO, mic-bias voltages,
  #sound-dai-cells).
- the split qcom,{tx,rx}-port-mapping properties are replaced by a
  single qcom,port-mapping; with one name for both slaves, the new
  qcom,control-device flag marks the slave that owns the control
  register space. The mapping stays optional and loses the per-item
  enum, following qcom,wcd938x-sdw.yaml.
- qcom,{tx,rx}-channel-mapping dropped, answering Srinivas's v1
  question: the slave-side map is fixed in the driver and no board
  needs to remap the master side; they can return with a board that
  does.
- the codec binding's example drops the two slave-node examples
  duplicated from qcom,wcd9378-sdw.yaml, as Rob asked.
- qcom,port-mapping length pinned per mode (5 mobile / 8 SDCA)
  through the existing if/then block.

 .../bindings/sound/qcom,wcd9378-codec.yaml    |  54 ++++++
 .../bindings/sound/qcom,wcd9378-sdw.yaml      | 182 ++++++++++++++++++
 .../bindings/sound/qcom,wcd937x.yaml          |   1 +
 .../bindings/sound/qcom,wcd938x.yaml          |   1 +
 .../bindings/sound/qcom,wcd939x.yaml          |   1 +
 .../bindings/sound/qcom,wcd93xx-common.yaml   |   1 -
 6 files changed, 239 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml
new file mode 100644
index 000000000000..0b9d3394f77e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml
@@ -0,0 +1,54 @@
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
+  MBHC. This node describes the mobile presentation, where the codec
+  appears as two SoundWire slaves on separate masters and this node owns
+  the resources they share; the control registers live in the SDCA control
+  address space reached through the TX slave. In SDCA mode the codec is a
+  single aggregated slave with no node of its own, see
+  qcom,wcd9378-sdw.yaml.
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
+...
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
new file mode 100644
index 000000000000..3c8beae85e67
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
@@ -0,0 +1,182 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCD9378 SoundWire slave devices
+
+maintainers:
+  - Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+
+description:
+  The WCD9378 presents SoundWire slaves with device ID sdw20217011000 in two
+  ways. In mobile mode two slaves sit on separate masters, and a top-level
+  codec node owns the supplies, mic-bias voltages and reset GPIO. In SDCA
+  mode a single aggregated slave carries both control and data and owns
+  those resources itself, marked with qcom,compute-mode.
+
+properties:
+  compatible:
+    const: sdw20217011000
+
+  reg:
+    maxItems: 1
+
+  qcom,compute-mode:
+    description:
+      Marks the single aggregated slave that implements the codec in SDCA
+      mode. Absent in mobile mode. The presentation is fixed by fuses and
+      board wiring; it is not selectable by the OS.
+    type: boolean
+
+  qcom,control-device:
+    description:
+      Marks the slave that owns the codec control register space. In mobile
+      mode that is the TX slave; the RX slave carries data ports only.
+    type: boolean
+
+  qcom,port-mapping:
+    description:
+      Static mapping between slave and master ports, in the order of the
+      slave port index. Mobile mode uses five entries, SDCA mode eight for
+      the aggregated DP1..DP7 with index 0 unused.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 5
+    maxItems: 8
+
+  reset-gpios:
+    description: SDCA mode only. Releases the codec from reset.
+    maxItems: 1
+
+  vdd-buck-supply:
+    description: SDCA mode only. 1.8V analog buck supply.
+
+  vdd-rxtx-supply:
+    description: SDCA mode only. 1.8V RX/TX supply.
+
+  vdd-io-supply:
+    description: SDCA mode only. Digital I/O supply.
+
+  vdd-mic-bias-supply:
+    description: SDCA mode only. Mic-bias supply.
+
+  qcom,micbias1-microvolt:
+    description: SDCA mode only. MICB1 rail voltage.
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias2-microvolt:
+    description: SDCA mode only. MICB2 rail voltage.
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias3-microvolt:
+    description: SDCA mode only. MICB3 rail voltage.
+    minimum: 1800000
+    maximum: 2850000
+
+  '#sound-dai-cells':
+    description: SDCA mode only, where this node provides the DAIs.
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  # In mobile mode the top-level codec node owns the supplies, the reset
+  # GPIO and the mic-bias voltages, and provides the DAIs.
+  - if:
+      required:
+        - qcom,compute-mode
+    then:
+      properties:
+        qcom,port-mapping:
+          minItems: 8
+      required:
+        - vdd-buck-supply
+        - vdd-rxtx-supply
+        - vdd-io-supply
+        - vdd-mic-bias-supply
+        - qcom,micbias1-microvolt
+        - qcom,micbias2-microvolt
+        - qcom,micbias3-microvolt
+        - '#sound-dai-cells'
+    else:
+      properties:
+        qcom,port-mapping:
+          maxItems: 5
+        reset-gpios: false
+        vdd-buck-supply: false
+        vdd-rxtx-supply: false
+        vdd-io-supply: false
+        vdd-mic-bias-supply: false
+        qcom,micbias1-microvolt: false
+        qcom,micbias2-microvolt: false
+        qcom,micbias3-microvolt: false
+        '#sound-dai-cells': false
+
+additionalProperties: false
+
+examples:
+  # Mobile mode: two slaves on separate masters.
+  - |
+    soundwire@3210000 {
+        reg = <0x03210000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378_rx: audio-codec@0,4 {
+            compatible = "sdw20217011000";
+            reg = <0 4>;
+            qcom,port-mapping = <1 2 3 4 5>;
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
+            qcom,control-device;
+            qcom,port-mapping = <1 1 1 2 3>;
+        };
+    };
+
+  # SDCA mode: one aggregated slave owning the codec resources.
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    soundwire@7630000 {
+        reg = <0x07630000 0x10000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378_sdca: audio-codec@0,3 {
+            compatible = "sdw20217011000";
+            reg = <0 3>;
+
+            qcom,compute-mode;
+            qcom,control-device;
+            qcom,port-mapping = <2 2 3 4 5 6 7 8>;
+
+            reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+            vdd-buck-supply = <&vreg_l15b_1p8>;
+            vdd-rxtx-supply = <&vreg_l15b_1p8>;
+            vdd-io-supply = <&vreg_l18b_1p2>;
+            vdd-mic-bias-supply = <&vreg_bob1>;
+
+            qcom,micbias1-microvolt = <1800000>;
+            qcom,micbias2-microvolt = <2750000>;
+            qcom,micbias3-microvolt = <1800000>;
+
+            #sound-dai-cells = <1>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
index f94203798f24..c6dbfe341370 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
@@ -31,6 +31,7 @@ properties:
 required:
   - compatible
   - vdd-px-supply
+  - qcom,micbias4-microvolt
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
index ab1c6285dbf8..f74beb4169a5 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -35,6 +35,7 @@ properties:
 
 required:
   - compatible
+  - qcom,micbias4-microvolt
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
index 85283f94465d..a70d70a05355 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
@@ -50,6 +50,7 @@ properties:
 
 required:
   - compatible
+  - qcom,micbias4-microvolt
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
index f78ba148ad25..61e437378cfe 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
@@ -89,7 +89,6 @@ required:
   - qcom,micbias1-microvolt
   - qcom,micbias2-microvolt
   - qcom,micbias3-microvolt
-  - qcom,micbias4-microvolt
   - "#sound-dai-cells"
 
 additionalProperties: true
-- 
2.55.0

