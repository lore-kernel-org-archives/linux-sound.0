Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C654142123E
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 17:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784740627; cv=none; b=W28uVSL+IEdxSyLjK0yda39MELo68IhMv3g2UX6YVAmVkG1rY205EbEtPvluZUJ6q+Bl5UKBCNadVp3oeSBXoJng4enMLJOh4OREkWmlmgrDPby6jtDLYKYw/Wpgg/kvg/VBZzedC1TozeSs4sQSQMkbFw5KymQ4rQrzIgTpro0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784740627; c=relaxed/simple;
	bh=mYZUJor6/T6trj8IHE26Q4et79EcziTm7R1sunOS/9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XPGJDf6s0QzTrDbPCbsfRuL1lFCcOyNSlcJaKIc/nB2+kRl4oWHbAaOi6L6HzmP2AdSIoLa+ltlfbt0WYuqACfMWJ9C5ioKT6P9d13R+1zYK4ZPYiiiN4Gcq3KvnUXlfDAUGSxDEfyN63lOgUTnJJFCQvb4p5o8pdHMpknwfmYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APrdh2bJ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APrdh2bJ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47df43bfb07so3569977f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 10:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784740624; x=1785345424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wdGkR8Ij2hIXDFqcob6FpIhEFRpXT8BWO4ggBDHHFPU=;
        b=APrdh2bJu7YboykJoabOFU6V/vVWBFIbTjojKOd+GeqiTPXE4w2DUpwtH0kWA1rjj6
         uLFOK4x/yP5wvYaiRUkFww5r7/kti3aWM28ucCTETx3gqQnQnEAZHPhkP767wRVIIHwa
         WF0BW3WSXktJqMG2EbhcJoZppXMa+FGdjuJpUtIoJ5VfO2sw8EpA8W895MX/iraOhRXh
         Vcn2H6nZchRidpyDvOPX2TB/JD877tujiZnuXASD0u+TLd/Z1cFrwhrhPlx5N8a6CWbH
         POuAvr4Di14g6p2HDvQltm6LVCOZcyznXlzIlCmKRwAO8kp4OWlxFYkKeu8om6ES1kX/
         JAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784740624; x=1785345424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wdGkR8Ij2hIXDFqcob6FpIhEFRpXT8BWO4ggBDHHFPU=;
        b=TS4kLXkdr7GnW4N9bU2h8rfWWs2Sy0MYC8cC2X6J0q18dbG0WoGcNaGhXyZxEwNLJf
         Eea5LvmFh61jwhlxRP13ZiCvHBta5j2YZZ3VUueTw2qHmevzlS1zBDNnc+NxkKQoN5wt
         VsAH28TasarVGv4/QdvV2p96hSMqIClnnC2altXpgJZakPvNmHLQgZ/MgMHMFaJZQtHC
         pZA8fjYVbIP35wMJilV9QZXZl/JesFNMgcH2Wbqp2lCP4Vq4hGfucMrE9r6v8YGgveiw
         cbwO690dPcR7i+FdOOjS0IfZpcPzDAgwyImxo4XVpni2IKxvBPKkSSUJSITd3KRh+rSV
         7T7A==
X-Forwarded-Encrypted: i=1; AHgh+Roz63+DP3RtLCiQCUjN9O7sTkEpqY1GPoTm1DjrPp0RompTgex9JlSpV7QjPxFABNtEQNiPohySz4I8Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo4u/gyxI8nwo25He7on8FHGblYb5AUiIBLgGhg0HxxTmVrmjy
	P6mHeKOQuPV9tQb7vt2JQ++olwoO4SdKiZTUrLZw9/mDXpCx7Z4YI49/
X-Gm-Gg: AR+sD10On1E5GNI+q/v5/a7+gJ2894nTxbeidfIT4OS1xUHfRXvp7KGTY3ZFwZY1rDE
	BOmXFloxm7bTkDFkHzosw2c6TUPVTyPvMmh28hxAzRK1zWL1kj+q3Wr05zabplXqtqt2wqWUo05
	rEK+BvU9oafZBxxSJbBWIhuA0akZnlWgFFZMNhiSlEFlXxkxdDkg4Wz3JFsBwVACibJZR/Sa/6s
	j68aXsMY2UbTBAanupHCt6XQPdiSo4214fDzQwGz7tPoDfcAjsOtihhWPuda60I9e5Rd1L4DZ+t
	XjyVx7UoIzwBOKL07ilLx19C7B4UxXK7PKFBbIXtKHoZJPdYuVxCrHjU/w4hFRgKDEO0A4GFLTc
	Wa53IhDb5y+m+x/A2WLjJtthEy8Bi+SvOcn+qOSGZesJnqJp8apiAzOH+rxVnx7Jtmwzqp7+3jd
	TNvNNWyr+9Q5IyqS8zfI34wZ6kVPpE9w2z6pCQMzI9fhQX
X-Received: by 2002:a05:6000:5c6:b0:47d:fc44:f4b6 with SMTP id ffacd0b85a97d-47f62305747mr29702353f8f.20.1784740623759;
        Wed, 22 Jul 2026 10:17:03 -0700 (PDT)
Received: from localhost.localdomain ([86.126.27.145])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm7593170f8f.18.2026.07.22.10.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:17:03 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH] dt-bindings: sound: Convert TI OMAP2+ McBSP to DT schema
Date: Wed, 22 Jul 2026 17:16:54 +0000
Message-ID: <20260722171654.298557-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments OMAP2+ McBSP (Multi-Channel Buffered
Serial Port) bindings to DT schema.

During the conversion, the following updates were made:
- Documented the 'clocks', 'clock-names', 'dmas', 'dma-names',
  '#sound-dai-cells' and 'port' properties, which are used by the
  boards but were missing from the old text binding.
- Added 'dma' to the 'reg-names' enum, which the boards use alongside
  'mpu' and 'sidetone'.
- Changed 'ti,hwmods' to a string array of up to two entries, as some
  boards pass both the base and sidetone hwmods.
- Made 'ti,hwmods' optional to resolve dtbs_check warnings. Modern OMAP
  platforms no longer provide this property, while older platforms still
  use it.
- Made 'ti,buffer-size' optional, as it only applies to OMAP2430 and
  newer SoCs.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/sound/omap-mcbsp.txt  |  36 -------
 .../bindings/sound/ti,omap2-mcbsp.yaml        | 101 ++++++++++++++++++
 2 files changed, 101 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/omap-mcbsp.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,omap2-mcbsp.yaml

diff --git a/Documentation/devicetree/bindings/sound/omap-mcbsp.txt b/Documentation/devicetree/bindings/sound/omap-mcbsp.txt
deleted file mode 100644
index ae8bf703ce7a..000000000000
--- a/Documentation/devicetree/bindings/sound/omap-mcbsp.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-* Texas Instruments OMAP2+ McBSP module
-
-Required properties:
-- compatible: "ti,omap2420-mcbsp" for McBSP on OMAP2420
-	      "ti,omap2430-mcbsp" for McBSP on OMAP2430
-	      "ti,omap3-mcbsp" for McBSP on OMAP3
-	      "ti,omap4-mcbsp" for McBSP on OMAP4 and newer SoC
-- reg: Register location and size, for OMAP4+ as an array:
-       <MPU access base address, size>,
-       <L3 interconnect address, size>;
-- reg-names: Array of strings associated with the address space
-- interrupts: Interrupt numbers for the McBSP port, as an array in case the
-	      McBSP IP have more interrupt lines:
-	<OCP compliant irq>,
-	<TX irq>,
-	<RX irq>;
-- interrupt-names: Array of strings associated with the interrupt numbers
-- ti,buffer-size: Size of the FIFO on the port (OMAP2430 and newer SoC)
-- ti,hwmods: Name of the hwmod associated to the McBSP port
-
-Example:
-
-mcbsp2: mcbsp@49022000 {
-	compatible = "ti,omap3-mcbsp";
-	reg = <0x49022000 0xff>,
-	      <0x49028000 0xff>;
-	reg-names = "mpu", "sidetone";
-	interrupts = <0 17 0x4>, /* OCP compliant interrupt */
-		     <0 62 0x4>, /* TX interrupt */
-		     <0 63 0x4>, /* RX interrupt */
-		     <0 4 0x4>;  /* Sidetone */
-	interrupt-names = "common", "tx", "rx", "sidetone";
-	interrupt-parent = <&intc>;
-	ti,buffer-size = <1280>;
-	ti,hwmods = "mcbsp2";
-};
diff --git a/Documentation/devicetree/bindings/sound/ti,omap2-mcbsp.yaml b/Documentation/devicetree/bindings/sound/ti,omap2-mcbsp.yaml
new file mode 100644
index 000000000000..17cd66460620
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,omap2-mcbsp.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,omap2-mcbsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments OMAP2+ McBSP
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,omap2420-mcbsp
+      - ti,omap2430-mcbsp
+      - ti,omap3-mcbsp
+      - ti,omap4-mcbsp
+
+  reg:
+    minItems: 1
+    maxItems: 2
+    description: |
+      Register location and size. For OMAP4+ it may be an array containing:
+      - MPU access base address
+      - L3 interconnect address (or sidetone)
+
+  reg-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum: [mpu, sidetone, dma]
+
+  interrupts:
+    minItems: 1
+    maxItems: 4
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 4
+    items:
+      enum: [common, tx, rx, sidetone]
+
+  ti,buffer-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Size of the FIFO on the port (OMAP2430 and newer SoCs).
+
+  ti,hwmods:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    minItems: 1
+    maxItems: 2
+    description: Name of the hwmod(s) associated with the McBSP port.
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+
+  dmas:
+    minItems: 1
+    maxItems: 2
+
+  dma-names:
+    minItems: 1
+    maxItems: 2
+
+  "#sound-dai-cells":
+    const: 0
+
+  port:
+    $ref: /schemas/sound/audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    mcbsp@49022000 {
+        compatible = "ti,omap3-mcbsp";
+        reg = <0x49022000 0xff>,
+              <0x49028000 0xff>;
+        reg-names = "mpu", "sidetone";
+        interrupts = <0 17 0x4>, /* OCP compliant */
+                     <0 62 0x4>, /* TX */
+                     <0 63 0x4>, /* RX */
+                     <0 4 0x4>;  /* Sidetone */
+        interrupt-names = "common", "tx", "rx", "sidetone";
+        interrupt-parent = <&intc>;
+        ti,buffer-size = <1280>;
+        ti,hwmods = "mcbsp2";
+    };

-- 
2.43.0

