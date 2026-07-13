Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D25407CCA
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 12:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783946849; cv=none; b=YIe9JJJJyTHsuU+UlHSsS/eOVqZ6d9aIKDUsdM6C2vJFqvEjORP4NutIzzFAghQdddFS4PybsfdD+S3zHtiNvBLM5TKx1zh5wat7omPq/vgSgnfKOEsICwoVOUJQmBTIEdFqABa7S1dP7WjI5CnrfCLECRKLKJvcZ6boXrcF7LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783946849; c=relaxed/simple;
	bh=0hUWPgChDdRqm6oNHr3kxUnu54j+aYaSO5M1ndyvYW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Q7dqB6ZNw/E0GlfEz7GHOhGvwpbvK5dYNNyvFZB1lTs6t4PXE3d8eV5RanIEvwzHMFqlgdtfKRfsp7WzewagUMpLfQ4bPjxHPaJ5GnDHxgqzyF5IP85TftaiSR6q/oES/pLJqYxNgKFucCqhAssJ0IPTCxOFqt1LOvY8Queo9xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJ3IZV1c; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJ3IZV1c"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cac39b729dso7514845ad.3
        for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 05:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783946846; x=1784551646; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z/yv6k2xKNRuiIcoHapp/ylsCggQpdNHdZ6/qndZDtw=;
        b=iJ3IZV1ccErxh6MEnvcVI4gwkhv9zXZb4Fug15SIP1ct2T4Rt0DdP3/ua5V6zuGXG5
         rWKb6nkOSM1sWnLQCCKL5N1hAcNLfv3p61HJpOpVUv/ZyPd5VvCGhiU+ukR4uJj8iU0O
         5bwW7ykaLgkhNSIrJNes/py+/Bo3r8bpTPaXOhYC7yfIaDiyE/Wa0FMZg5FrqtSgWZ0N
         Y10e+IrbM46btd7v3ahO3MbrTqsSs0KnSjxyXLFSiGCdqLc7FvTlmdTnllpPTvAi1Lkz
         ztshgxzJqI3Y6343A41RU76unBM9TkCqB8GmmB/eu8K0JSpdZ8ugwIFaH4EtSTTYpYkt
         nK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783946846; x=1784551646;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=z/yv6k2xKNRuiIcoHapp/ylsCggQpdNHdZ6/qndZDtw=;
        b=KPmCsAkkgo3UA/DM0Uq3dop5qVjqjtSPdCc6b+6Nnvfjw3LPyuxD9+GMZBNRNQAnzX
         Os3ilcnAb/KeJ3XupGkDGfv29ZQ/NBwyg1oYcDfQVUNyqTV4YrAWr9p3BjIKlp11uXBZ
         2ho60apZhywx+I8bRSc6AZ7v+nZOPyb1N9rr2+4D2WYrqbV+qfJgdEphD3HbaRhx957O
         2vbUv1nzLRQKA7wDSsb7RAvdER0jt77olii7neSXbo7d3JnGtpiiV/2lXs/RdTs6YBz1
         h91h95fA2BVXO1LQLWQWBFD0812NyIZ222bn8yCL3tfxo0ky4VdqR3uVDi/BSjX6QKV4
         EcYg==
X-Gm-Message-State: AOJu0YxmhPe6JcTqK53X41vNqr73RaMKwZO+vaibEjSWQRodok9gy9M2
	EQSAsvyY5Tr52L2TJNaIQk8iPkGx/589O7sptTNg3GtwQdD9ERUuYu6P
X-Gm-Gg: AfdE7cnvn+bqTsfbJzKhkmaoYgnvMlq4WZLY7AWNbaSrueACtt97gH4s286A+eYq1Xy
	FOrOyMXBleYZ0W1NzjLhznYVB88cJRU4nzYQDcGySMrXYDcNYZOBPLl+vk3by1BkOHD664UwFrr
	LzJdB1PoruBBAgQN3YwArYd+eQUpTyj/jykD0KcKQmfDJbupC0v3UJRR2MGq4QE1R00DYTrMsQn
	vr2QjHjKOdZTF32IwE0XgkNbd7R3Rg+YS8b4HseWzVAWpDryfnx9c3Bk7RP0+2IzmlhoMH0bkNk
	/TJfUkZUruVuKw2aqFgSYvA2HeGWwpNpPtV88PO49nhNpmxk6Py0vcxRlCqWKNKO/SwQ41L81gH
	SLrkGDFVK5Y+Qj/ttnQqEfw6XMnQyCibYPceZ4Ux33UnmDfAq1ibphKccJHKNIvW6O0VWBCqjww
	j5mkbqpkFeNa6/dkv8LFq2ow==
X-Received: by 2002:a17:90b:224a:b0:38d:f0a7:85f9 with SMTP id 98e67ed59e1d1-38df0a786cbmr3219382a91.0.1783946845915;
        Mon, 13 Jul 2026 05:47:25 -0700 (PDT)
Received: from [192.168.1.2] ([2401:4900:881f:4446:b692:9244:2734:87f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ae6cd9sm74901304eec.31.2026.07.13.05.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:47:25 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 13 Jul 2026 18:17:11 +0530
Subject: [PATCH] ASoC: dt-bindings: ti,omap4-dmic: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ti-omap4-dmic-v1-1-3cc6e13decec@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgMaaiheRRykRs1gK62IUHp3i
 +Mb/s+QJKokGJsMUR5NGnxF3zbgjsXvgrpWA3XEHRPhrRjO5TK4nuqQ2VhnWSzTALW5omz6/r9
 pLuUDliHJRF8AAAA=
X-Change-ID: 20260622-ti-omap4-dmic-6648c86e8625
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783946841; l=3152;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=0hUWPgChDdRqm6oNHr3kxUnu54j+aYaSO5M1ndyvYW8=;
 b=yEaAPm5zBg48bJCDHS8iLC6MWZfYw1cQ7W8YDmhU2xaDH2NN+TgX+pVTXjHOz4gjHYzzTxXSS
 WXGhorThiW3Dh6brTYOjEcjR/SOwO++WTmUn99oMl+I/k5GZ5oOfaxp
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI OMAP4+ dmic bindings from txt to DT schema.

Following changes are introduced during converson:
  - Drop ti,hwmods property as it is not needed since the sysc
    conversion no existing DTS uses it.
  - Add dma, dma-names, reg-names properties to match the DTS.
  - Update example node to match existing DTS.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/sound/omap-dmic.txt        | 20 --------
 .../devicetree/bindings/sound/ti,omap4-dmic.yaml   | 58 ++++++++++++++++++++++
 2 files changed, 58 insertions(+), 20 deletions(-)

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
index 000000000000..773b9bf2f1c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,omap4-dmic.yaml
@@ -0,0 +1,58 @@
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
+properties:
+  compatible:
+    const: ti,omap4-dmic
+
+  reg:
+    items:
+      - description: MPU access base address
+      - description: L3 interconnect address
+
+  reg-names:
+    items:
+      - const: mpu
+      - const: dma
+
+  interrupts:
+    maxItems: 1
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    items:
+      - const: up_link
+
+required:
+  - compatible
+  - reg
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
+
+    dmic@0 {
+      compatible = "ti,omap4-dmic";
+      reg = <0x0 0x7f>, /* MPU private access */
+            <0x4902e000 0x7f>; /* L3 Interconnect */
+      reg-names = "mpu", "dma";
+      interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+      dmas = <&sdma 67>;
+      dma-names = "up_link";
+    };

---
base-commit: ef0c9f75a19532d7675384708fc8621e10850104
change-id: 20260622-ti-omap4-dmic-6648c86e8625

Best regards,
-- 
Bhargav

