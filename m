Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9384A1DFC;
	Thu, 17 Sep 2026 22:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685473; cv=none; b=bNgZ0aEjDwO9l7mTn332tHRXawfOjkZHk/SRjlvuOwhxR1tefFeUBJ5F5SM+xa5damkD/8jnln7jhOo7X8QHj5kHgbdNrR+2jJGs4EQ1K2rXl0hZmfvYGi8+JdnuLsD6Cz+QjzhTWguVvYqdCkhI5hdMJpV7unz1ShYhQZbj0Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685473; c=relaxed/simple;
	bh=rc4aSdck8y1cuy7LnaHIeiru+EFoJkBpxAJ1bUDKLXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZZwMYZ9g/30IP0ksXvzfzBmyHQZ91/uGrXzqAdqBbGXcyUb3R0b9prVHYnihJI03/+4Y3HOX6S838rHTSqWmr8KXF1+kY2ddJoTC/bFfAlyx0cVQ78ieqlkukrD9zyakH201KfFtCmfM8v8GrPKeTjoKesX/Cg4q2rug7fMF2ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fih/yhNo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fih/yhNo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654F01F00893;
	Thu, 17 Sep 2026 22:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789685471;
	bh=RdP46N218G4Ov87ZvfFO7Mff3cjbmB3CwJT6fe/Pkp8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Fih/yhNoWu/qm260/OTRXLGshdywh+M+SwXO5Y19QL94CVgp2x14T8XuRzbvnDHZ1
	 SHYjENSDi2MCXT+ThEGpBMjUAe25+OQu0V74yFiatISUNAiHZ9dX3HnkFxynKxxLXs
	 PZsIt+QiluU+cybx0ngEadoDCjbGvalyOe0tDEuU3L3/IRTXHZcVkdPNVQeKIBobU9
	 jZqCIz6+fCssPe/P75ixg0gI4OuBxgDxnj4Kbkt06OUuHAFMkXxyi9NWkd0jdi1k/R
	 O5aeWp7G/Gw8GX6+sI6LJTiVd8ehvoF45QaL0txyuMiDHYGRjjeVNGaLRSvBBlmhr4
	 f8XxWQD9LmfDA==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 00:50:59 +0200
Subject: [PATCH v2 1/9] ASoC: dt-bindings: sound: Prepare Ux500 audio graph
 links
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-ux500-simple-sound-v2-1-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
In-Reply-To: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Audio graph card drivers parse TDM slot data and continuous clock
selection from endpoint nodes. The audio graph endpoint schema describes
slot count and width directly but does not cover sparse slot masks or
continuous clocking. Reference the common TDM slot schema so TX and RX
masks are documented, and add the continuous-clock flag.

Replace the incomplete Ux500 MSP text binding with a DT schema that
describes the clocks, reset, DMA channels and power supply consumed by
the driver. Define the MSP as a zero-cell sound DAI provider and allow
it to expose an audio graph port.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../bindings/sound/audio-graph-port.yaml           | 10 +--
 .../bindings/sound/stericsson,ux500-msp-i2s.yaml   | 96 ++++++++++++++++++++++
 .../devicetree/bindings/sound/ux500-msp.txt        | 42 ----------
 3 files changed, 100 insertions(+), 48 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index d1cbfc5edd3a..565d723d0398 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -39,6 +39,7 @@ definitions:
     allOf:
       - $ref: /schemas/graph.yaml#/$defs/endpoint-base
       - $ref: /schemas/sound/dai-params.yaml#
+      - $ref: /schemas/sound/tdm-slot.yaml#
     properties:
       mclk-fs:
         $ref: simple-card.yaml#/definitions/mclk-fs
@@ -48,6 +49,9 @@ definitions:
       bitclock-inversion:
         description: dai-link uses bit clock inversion
         $ref: /schemas/types.yaml#/definitions/flag
+      continuous-clock:
+        description: dai-link bit clock runs continuously rather than gated
+        $ref: /schemas/types.yaml#/definitions/flag
       frame-master:
         description: Indicates dai-link frame master.
         oneOf:
@@ -82,12 +86,6 @@ definitions:
             - msb
             - lsb
 
-      dai-tdm-slot-num:
-        description: Number of slots in use.
-        $ref: /schemas/types.yaml#/definitions/uint32
-      dai-tdm-slot-width:
-        description: Width in bits for each slot.
-        $ref: /schemas/types.yaml#/definitions/uint32
       dai-tdm-slot-width-map:
         description: Mapping of sample widths to slot widths. For hardware
           that cannot support a fixed slot width or a slot width always
diff --git a/Documentation/devicetree/bindings/sound/stericsson,ux500-msp-i2s.yaml b/Documentation/devicetree/bindings/sound/stericsson,ux500-msp-i2s.yaml
new file mode 100644
index 000000000000..bdfcd5376cfe
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/stericsson,ux500-msp-i2s.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/stericsson,ux500-msp-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST-Ericsson Ux500 Multichannel Serial Port
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description:
+  The Ux500 Multichannel Serial Port (MSP) is a synchronous serial audio
+  interface supporting I2S and PCM/TDM protocols. Data is transferred to and
+  from memory using the Ux500 DMA controller.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: stericsson,ux500-msp-i2s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  v-ape-supply:
+    description: Analog power engine supply
+
+  dmas:
+    minItems: 1
+    maxItems: 2
+
+  dma-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum: [ rx, tx ]
+
+  clocks:
+    items:
+      - description: MSP functional clock
+      - description: MSP APB bus clock
+
+  clock-names:
+    items:
+      - const: msp
+      - const: apb_pclk
+
+  resets:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - v-ape-supply
+  - dmas
+  - dma-names
+  - clocks
+  - clock-names
+  - resets
+  - '#sound-dai-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/stericsson,db8500-prcc-reset.h>
+
+    msp@80123000 {
+        compatible = "stericsson,ux500-msp-i2s";
+        reg = <0x80123000 0x1000>;
+        interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+        v-ape-supply = <&db8500_vape_reg>;
+        dmas = <&dma 31 0 0x12>, <&dma 31 0 0x10>;
+        dma-names = "rx", "tx";
+        clocks = <&prcc_kclk 1 3>, <&prcc_pclk 1 3>;
+        clock-names = "msp", "apb_pclk";
+        resets = <&prcc_reset DB8500_PRCC_1 DB8500_PRCC_1_RESET_MSP0>;
+        #sound-dai-cells = <0>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/ux500-msp.txt b/Documentation/devicetree/bindings/sound/ux500-msp.txt
deleted file mode 100644
index 7dd1b96160f5..000000000000
--- a/Documentation/devicetree/bindings/sound/ux500-msp.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-* ux500 MSP (CPU-side Digital Audio Interface)
-
-Required properties:
- - compatible       :"stericsson,ux500-msp-i2s"
- - reg              : Physical base address and length of the device's registers.
-
-Optional properties:
- - interrupts       : The interrupt output from the device.
- - <name>-supply    : Phandle to the regulator <name> supply
-
-Example:
-
-	sound {
-		compatible = "stericsson,snd-soc-mop500";
-
-		stericsson,platform-pcm-dma = <&pcm>;
-		stericsson,cpu-dai = <&msp1 &msp3>;
-		stericsson,audio-codec = <&codec>;
-	};
-
-	pcm: ux500-pcm {
-		compatible = "stericsson,ux500-pcm";
-	};
-
-	msp1: msp@80124000 {
-		compatible = "stericsson,ux500-msp-i2s";
-		reg = <0x80124000 0x1000>;
-		interrupts = <0 62 0x4>;
-		v-ape-supply = <&db8500_vape_reg>;
-	};
-
-	msp3: msp@80125000 {
-		compatible = "stericsson,ux500-msp-i2s";
-		reg = <0x80125000 0x1000>;
-		interrupts = <0 62 0x4>;
-		v-ape-supply = <&db8500_vape_reg>;
-	};
-
-	codec: ab8500-codec {
-		compatible = "stericsson,ab8500-codec";
-		stericsson,earpeice-cmv = <950>; /* Units in mV. */
-	};

-- 
2.55.0

