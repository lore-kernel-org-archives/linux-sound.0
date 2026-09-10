Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B86A49E157;
	Thu, 10 Sep 2026 23:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789081435; cv=none; b=ja47TUUr51lyJyk1xCb33CMV83M41DZJydyK/7Wx2CA9IRL3JaafgiCnSFZ+myUxCQmA+zspSGS6fSD2C141eQxC2a4T2G9o5weZ+lZn4FXU4OYNhUj45JK7JG2wBQ5ucts46BDsRsE0zDtbp8B90erTo6Bkm28+mGjuIpmYLL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789081435; c=relaxed/simple;
	bh=E3hEA6CGwtxB/vL7u9Zan+2NVqnMlS5J9TUTyOTP2QM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ge8kRCTtDEjp6TMIxtCj0fhR7lhDwBCNUEuC08qLtRKBoZsxpZQjYw2Bojbwo0WGEjxyWo0/lJm+7iq42gAHX5EAF3ZRBPELHUhDXgGCrt9QEbVdYOgHUmmC7rnESSdRYstToshwjbwALV31XnfWXjyJiZJaeBiXNrFhRAuawE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3CUGc0T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3CUGc0T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9401F00893;
	Thu, 10 Sep 2026 23:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789081433;
	bh=P4ci7XtS+beb0xJU6R2KH75I06VEUaoI4q7vvBMxyDc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=e3CUGc0Tzn2IOllvhlPxPUdP9GhmKZ/2aNG2Qc2ZunyQluuc3eGsSvTaP45cGa3+M
	 yGhkywT09K+NRbKhmX6+x+04+saSkPiyK7YjU/4Pkyk/qBwsFWIbKKnlI512+ej8pv
	 ojXn0fyF57Mz9juDX9KX5greoGn/V/oDXvDhY6V8arn7qhbKrOV3y7LSGF5AmUqoTX
	 fg3zNWd4pC4UpQjsIal5FLgKWJ91OFptb1UTVoBqTaSQQrqayYB6gltWtZrfpPIDBy
	 31ITqUY9uQyZvvM8uCADhm1shU609Ok6zr9OadP9Q3Oyita6WoxQ/cTrHQolIlc9sk
	 HDNU6frSMDYVA==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 11 Sep 2026 01:03:44 +0200
Subject: [PATCH 1/9] ASoC: dt-bindings: ux500: Convert MSP binding to DT
 schema
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ux500-simple-sound-v1-1-6771ac714e82@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
In-Reply-To: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Replace the incomplete text binding with a DT schema that describes
the clocks, reset, DMA channels and power supply consumed by the
driver. Define the MSP as a zero-cell sound DAI provider so generic
sound cards can reference it.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../bindings/sound/stericsson,ux500-msp-i2s.yaml   | 92 ++++++++++++++++++++++
 .../devicetree/bindings/sound/ux500-msp.txt        | 42 ----------
 2 files changed, 92 insertions(+), 42 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/stericsson,ux500-msp-i2s.yaml b/Documentation/devicetree/bindings/sound/stericsson,ux500-msp-i2s.yaml
new file mode 100644
index 000000000000..0f623a3fb614
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/stericsson,ux500-msp-i2s.yaml
@@ -0,0 +1,92 @@
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

