Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E2040B37A
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 12:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822359; cv=none; b=TU/QVijkIDtxosR72eTfat5KhZhidnkBEumidbtwqsSLew5jELrDM9Sv0oT9xpeEkHz1uRmDauIyHKLZs5af2/pE6l61kxFKGEzNfnV0UuRSKYAcQlQ+oVHWmLAdXJlFrCnhlg417ohWVlOwjog+nQS+hZwcYbA+MhzEOWOhWMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822359; c=relaxed/simple;
	bh=MNkEHF1K+iSiSHsu+j1fMDOj0kaqSS1YWFTmTLk7bYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WHflp2Byw0iy/5AbZO/Yryuf0KKDiDYuwQYkTgCR5PEJ4BuzKbsZ/kBpHiePm34RbfkNjnfkA2tZApdtBRuyIDLJEgEuqCeBqy5rI69oRuhGh0l40KCsp/ihVE5GWEUZ8tW95BwfJKoCFLedpnTmqamZoUxNUOYkYR0212GSO4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=szyj6qQA; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="szyj6qQA"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30cac93dfd7so488869eec.1
        for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 05:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782822356; x=1783427156; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HoueKVt/m40/D2H33OtCJWHdjBpF+s3HAkwMmHaIX8Q=;
        b=szyj6qQAkpFhOJ6BojCRukpJgUTamor8HrpkrJfw9asdHWEAkpKvJ1R1hZqYjUsCBK
         E3XNwBJTVOZvtGMcS6d9AJkOcE5CdwOL3AHTelA2jLE0VMeDjcnSthOfrhiQnZEwjCt6
         ioi3pgLSgEIZjvAgS1uRsEsq2Ki5RvO8sQTf3Z1KMER41SGisoe5R9iKZaAZjMTkqMdk
         dsI27P99aQ2wcHgI+QwdedIehidipvZ/hxCm1pZQFL7YN6cYCgQPXeInUGV/YXguihKP
         yPBKi0Qt4YyJ3Qw1qK/7RALZdRYh12FLt/CKkBJZxnLzakOezGvBfzKtJM4EtyF9ggwv
         xN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822356; x=1783427156;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HoueKVt/m40/D2H33OtCJWHdjBpF+s3HAkwMmHaIX8Q=;
        b=Pbe/AVI5M/ACOqLKQgRUZix6XU4Yc1Hbii0u4Q2sSgtY2Whl6xIxXSpR5UgQ/BDRQ3
         G0T26mOl4HyxB9JiOM+i5GYKp7XYvdUWd4u+MUjUZHn5HNXX8QOANnSPqIE0uZnohgL2
         G6uxHAPYXTTxV9iKJurwH+RHxEe+KdX0IIHi13I4eDU0lkYa9CN8ysmdEfGLK8mQMzr7
         /qsnIrnUVk2uYTaoqCRP+mtK9oH02z2VI9eQ3XC1IGLOyTKqBkF0SjixVGuxgZLyt2Fl
         NuK0q4KxnYNDaSZsX0FOd8QtXHGc8jJ1z8XWdDMzc3FXEuDjXWzfQOuRWHw0zTyaJ3Uy
         oUcA==
X-Gm-Message-State: AOJu0YyjMrWqrGiJV+pKnzjBBnZBYI3ZlnPaEHOL1zOz2PuPIn8E+fk3
	kytHOuWhWeea8fEDN2ROH8oNt8zwmfrkpgn34GVXQuT4O8fDwslMsePc
X-Gm-Gg: AfdE7ck16LPaQSUVmAB9mAYOYFUn4F8tvQA00FpaRyaPHabyxuUqrMNJpYaQAHmB8Jo
	HRjexRSrwb8oO0YIDvIlWlld62x2idedqnjJgC8vLH66Yh70VDNyPU+5778/eplXT/EZHqgZpnK
	R/DeJG40W9kD+mjfKHNHDtm1c5qzngV9+93KvBxtBYz5fKPDZ+cG0bnq56fpSNv83IyaGiNOBcM
	XksCB0l9kDHzTd5VdCRkdNKWElJ1f05DCpeMBAQbXhtPFLCgvVtzeq5F28vbFaYNaSN2osOGSLT
	I1zMz0z5Xh4o0qM1JE7M7/mwZjtWwJdfIVNOKtSArxcQQ9ds6v0M6ugkNtYwAh9e+utNd5vN0fT
	vLa5Ajq+BEQkbHoNnCW5wuncK3ycwLJzTgWJbocEAkX1mShV+TVZ6hf/UJtNYFRJ1o38o9r89B7
	F3sFD23D9bI6NvtUhpS/Y8iDHpx1f2tfNcKJU=
X-Received: by 2002:a05:7300:c88:b0:30c:ab96:7305 with SMTP id 5a478bee46e88-30eea0bbfa2mr1240210eec.21.1782822355886;
        Tue, 30 Jun 2026 05:25:55 -0700 (PDT)
Received: from Black-Pearl.localdomain ([49.207.62.174])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-30ee2ffdbfesm8042375eec.11.2026.06.30.05.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 05:25:55 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Tue, 30 Jun 2026 12:25:49 +0000
Subject: [PATCH] ASoC: dt-bindings: ti,omap4-dmic: Convert TI OMAP4+ DMIC
 binding to YAML
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-ti-dmic-v1-1-9e4400230266@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMy1Q2oC/yXMQQqAIBCF4avErBO0oLKrRIu0sSbIQi0C6e5ZL
 T/434vg0RF6aLMIDk/ytNkEkWeg58FOyGhMhoIXFa9KzgKxcSXNuEQjRG1kUytI9e7Q0PU9df1
 vf6gFdXjncN8PTdKsDGsAAAA=
X-Change-ID: 20260630-ti-dmic-09ef117f987b
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2

Convert the ti,omap4-dmic text binding to DT schema format for
validation with dt_binding_check and dtbs_check.
Changes during conversion:
- dtbs_check flagged reg-names, dmas, and dma-names as undocumented
  on all four in-tree omap5 boards using this compatible (cm-t54,
  igep0050, sbc-t54, uevm)
- Add these as required properties to reflect actual hardware usage,
  since the original text binding was incomplete
- Drop ti,hwmods from required, as it is a legacy property tied to
  the OMAP hwmod framework and is not mandatory for DT schema
  validation going forward
- Update the example to exercise all newly documented properties so
  the schema validates cleanly against real board DTS files

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../devicetree/bindings/sound/omap-dmic.txt        | 20 -------
 .../devicetree/bindings/sound/ti,omap4-dmic.yaml   | 68 ++++++++++++++++++++++
 2 files changed, 68 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/omap-dmic.txt b/Documentation/devicetree/bindings/sound/omap-dmic.txt
deleted file mode 100644
index 418e30e72e89..000000000000
--- a/Documentation/devicetree/bindings/sound/omap-dmic.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-* Texas Instruments OMAP4+ Digital Microphone Module
-
-Required properties:
-- compatible: "ti,omap4-dmic"
-- reg: Register location and size as an array:
-       <MPU access base address, size>,
-       <L3 interconnect address, size>;
-- interrupts: Interrupt number for DMIC
-- ti,hwmods: Name of the hwmod associated with OMAP dmic IP
-
-Example:
-
-dmic: dmic@4012e000 {
-	compatible = "ti,omap4-dmic";
-	reg = <0x4012e000 0x7f>, /* MPU private access */
-	      <0x4902e000 0x7f>; /* L3 Interconnect */
-	interrupts = <0 114 0x4>;
-	interrupt-parent = <&gic>;
-	ti,hwmods = "dmic";
-};
diff --git a/Documentation/devicetree/bindings/sound/ti,omap4-dmic.yaml b/Documentation/devicetree/bindings/sound/ti,omap4-dmic.yaml
new file mode 100644
index 000000000000..4719ac48238e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,omap4-dmic.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,omap4-dmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments OMAP4+ Digital Microphone Module
+
+maintainers:
+  - Peter Ujfalusi <peter.ujfalusi@ti.com>
+
+description:
+  The OMAP4+ Digital Microphone (DMIC) controller captures audio from
+  up to three stereo digital microphone pairs over an I2S-like
+  interface and transfers the resulting PCM data to memory via DMA.
+  The controller exposes two register regions, one for MPU-private
+  control and status access and one for the L3 interconnect side
+  used for data transfer, and is found on OMAP4, OMAP5 and DRA7xx
+  family SoCs.
+
+properties:
+  compatible:
+    const: ti,omap4-dmic
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: mpu
+      - const: dma
+
+  interrupts:
+    maxItems: 1
+
+  ti,hwmods:
+    description: Name of the hwmod associated with OMAP DMIC IP.
+    const: dmic
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: up_link
+
+required:
+  - reg
+  - compatible
+  - reg-names
+  - interrupts
+  - dmas
+  - dma-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    dmic@4012e000 {
+        compatible = "ti,omap4-dmic";
+        reg = <0x4012e000 0x7f>, /* MPU private access */
+              <0x4902e000 0x7f>; /* L3 Interconnect */
+        reg-names = "mpu", "dma";
+        interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&sdma 67>;
+        dma-names = "up_link";
+        ti,hwmods = "dmic";
+    };

---
base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
change-id: 20260630-ti-dmic-09ef117f987b

Best regards,
--  
Charan Pedumuru <charan.pedumuru@gmail.com>

