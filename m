Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A7A3164C7
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 03:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773890500; cv=none; b=rEUwKYcPYW8o4Phe/c4lcmbsRrNRY7/h4HpouqWjroPBh5CO7wY8RN1tAH4hpVGIdrDQOq+W91zG6eB4OdihipXH5iFPwX8JI7PWzfz0EEf1dRsy7CZ0WzAIPt/7o3cZjgGps3K0Y7P3/VZJAuzP4mPmRlyAW0zB/dLZhYkPQVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773890500; c=relaxed/simple;
	bh=0Xwx8Y096fqNvdOg2Gqi/hyW5QeXgAUGtliYvN6cR4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cvyvb4FHVwkcCY4wy7mMdvnNNbQfYR8yhJM50xbu04rmiMLKlfgLC33wlA07kNeRpH9KK84BwFUgFVz0jjGVTL7j+FBPI+ycQWc3C1MneW6redlgCPxrz3ycUevuRkM0FwdReGwcE3IqstWoXxyBj5DgEU31h/aRRXvSq8tQ7Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gw7Xi9rK; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gw7Xi9rK"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-829b2019b39so338765b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 20:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773890499; x=1774495299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8/cJpgB2sqSWH7gwL6KE740g8AgYk5DfM8eUCnEJbI0=;
        b=gw7Xi9rKjYNqiAZT4YkbMHLyfWcuj4KV0N4A8Z/AErh4fdZnU7+2feOakOTTsZN9W+
         FL+RV2PlvSbqdJvSysL4egp1ALtRkAJcmKY9gBKRzXWNozZCxRetA7l7mQCzvYsxqApM
         aCMS4UBPpxY3Eoet+Ivfe0TSqanYKGmMNFDuaj/LTFnV/3IFgrFfOdTFOPDTvQ5a0ogd
         MVpGeQsd1826fPbi6NIm6C+j0aTi0eSaYgv97b/Ms5ubjaWnJjcICcH+rQJ9Wz3OKddv
         klftPiweeivrzaWAKdDtnQqjs/K4CbQ9mf6sb/5oZE13BgJwi6rXR5iA9MnczY/M0zT/
         PCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773890499; x=1774495299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/cJpgB2sqSWH7gwL6KE740g8AgYk5DfM8eUCnEJbI0=;
        b=APuWPdfwGyqS1Oxd5uqotoY0HLenacNObwHVlXF6DtOi8vlJF1PGL93nAFmVz634V3
         Le8EtR/vJCv8Xwlg0MyLAt4Pw9wgTCSLFgfmoctMXgopvH/VZObGx/Rdycgk08C26J6e
         6tssnOcA9sXuOGICOjnTTRkquKqRRaqCtZv+SAQhEvOLyJ088TWQ18g2YX4+HghfqQns
         504yGwEdMZWmM6OjdpSAf4l/haHUZR0/lU+vWxXHwmZnZz6NuOJmZINsS+gL5OvORdHE
         RSj7KDugj1XsHtTlU0HuKW1Yo+HbqV56SjOUpIdORd0IIeUP7BxNahvgNpMPzXM9WZ0z
         uOUA==
X-Gm-Message-State: AOJu0YyysxGVLkRPX0WQ2gfq70TeS17aPT05zjMc6a1vNMo28V7eg9MM
	FUTMHEkLJ8iFVq9SsP35836OluMXYkaeszz8c1L/F+WVDltB/z2t6MId
X-Gm-Gg: ATEYQzz64Im1UTGUWGL1ITYIKnMG4NNUERnCyAzr/0W5Nh7W2doqSJuVDTrIKK5IeDn
	OiHM2Rbtywlg1OKDq+Mb6PXgLqgTCSajXglN8HRGd3i36cjvafgp66vQymvgGTX8B0lEBGSjQBy
	gLdcFq6WCV9u+kwYBBBPDqfsyBhEuE+oopFPsyUuZPDCRZ2Cj5TSGN8A2AiBk/Njd/reZ4PGx/K
	oNC5OQx+pt5nw4N5YJ93UyFLDxuHZBZ2wTWiXySyfKiJgSw+EFCGRuWbM36Q1VmOQEuMTG0Jyiw
	cz37IkbUBx2TgFt6iKNMWO0EocAxPU/IaJn3a8GrjGHLo2AwNfMZHq7EiR04G/rDh63rTN/3nZp
	meogLRQc4R/APLpLFfE6CsgOrz144olFDpROQKpHUAkges0KmQb4z+4WM5TVVQ8k3HPaUUBWvSQ
	A6rSym8+3g0pjoOIwEbRvY9Pmko/cmHwZF8TIRd6D6WLAVaJbq5wHF7MWFPIv9KdoTCvZOKdBN
X-Received: by 2002:a05:6a00:2183:b0:827:2995:3b99 with SMTP id d2e1a72fcca58-82a6ae6d829mr4566201b3a.31.1773890498744;
        Wed, 18 Mar 2026 20:21:38 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b52e67csm4058785b3a.2.2026.03.18.20.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 20:21:38 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Subject: [PATCH v2] ASoC: dt-bindings: hisilicon: Convert hi6210 I2S to dt-schema
Date: Thu, 19 Mar 2026 08:51:12 +0530
Message-ID: <20260319032112.5251-1-chaitanya.msabnis@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Hisilicon hi6210 I2S controller hardware binding from
legacy plain text to modern YAML dt-schema format.

Signed-off-by: Chaitanya Sabnis  <chaitanya.msabnis@gmail.com>
---
 .../bindings/sound/hisilicon,hi6210-i2s.txt   | 42 ----------
 .../bindings/sound/hisilicon,hi6210-i2s.yaml  | 80 +++++++++++++++++++
 2 files changed, 80 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.txt b/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.txt
deleted file mode 100644
index 7a296784eb37..000000000000
--- a/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-* Hisilicon 6210 i2s controller
-
-Required properties:
-
-- compatible: should be one of the following:
-   - "hisilicon,hi6210-i2s"
-- reg: physical base address of the i2s controller unit and length of
-   memory mapped region.
-- interrupts: should contain the i2s interrupt.
-- clocks: a list of phandle + clock-specifier pairs, one for each entry
-  in clock-names.
-- clock-names: should contain following:
-   - "dacodec"
-   - "i2s-base"
-- dmas: DMA specifiers for tx dma. See the DMA client binding,
-  Documentation/devicetree/bindings/dma/dma.txt
-- dma-names: should be "tx" and "rx"
-- hisilicon,sysctrl-syscon: phandle to sysctrl syscon
-- #sound-dai-cells: Should be set to 1 (for multi-dai)
-   - The dai cell indexes reference the following interfaces:
-       0: S2 interface
-       (Currently that is the only one available, but more may be
-        supported in the future)
-
-Example for the hi6210 i2s controller:
-
-i2s0: i2s@f7118000{
-	compatible = "hisilicon,hi6210-i2s";
-	reg = <0x0 0xf7118000 0x0 0x8000>; /* i2s unit */
-	interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>; /* 155 "DigACodec_intr"-32 */
-	clocks = <&sys_ctrl HI6220_DACODEC_PCLK>,
-		 <&sys_ctrl HI6220_BBPPLL0_DIV>;
-	clock-names = "dacodec", "i2s-base";
-	dmas = <&dma0 15 &dma0 14>;
-	dma-names = "rx", "tx";
-	hisilicon,sysctrl-syscon = <&sys_ctrl>;
-	#sound-dai-cells = <1>;
-};
-
-Then when referencing the i2s controller:
-	sound-dai = <&i2s0 0>; /* index 0 => S2 interface */
-
diff --git a/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.yaml b/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.yaml
new file mode 100644
index 000000000000..827ae1fbb8ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/hisilicon,hi6210-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon hi6210 I2S controller
+
+maintainers:
+  - Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: hisilicon,hi6210-i2s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: dacodec
+      - const: i2s-base
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+  hisilicon,sysctrl-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to sysctrl syscon
+
+  "#sound-dai-cells":
+    const: 1
+    description: |
+      The dai cell indexes reference the following interfaces:
+        0: S2 interface
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+  - hisilicon,sysctrl-syscon
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/hi6220-clock.h>
+
+    i2s@f7118000 {
+        compatible = "hisilicon,hi6210-i2s";
+        reg = <0xf7118000 0x8000>;
+        interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&sys_ctrl HI6220_DACODEC_PCLK>,
+                 <&sys_ctrl HI6220_BBPPLL0_DIV>;
+        clock-names = "dacodec", "i2s-base";
+        dmas = <&dma0 15>, <&dma0 14>;
+        dma-names = "rx", "tx";
+        hisilicon,sysctrl-syscon = <&sys_ctrl>;
+        #sound-dai-cells = <1>;
+    };
-- 
2.43.0

