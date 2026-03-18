Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA70E360753
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 18:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773857658; cv=none; b=U/RVBUbDUqEXWzkW+OfAmZAQmPqzMv+eLctOGNrUduR4KnudDdhWWyEiuuVQQdudsI5/WgqbIiyL6j4Lk8QYbWRhrATWiRCp968jJTQ04j2teRRc9vY8MfmdF15Bd5enSaqveYgvfH71aS/LtEebeDSpR7qNvijU2KNCSQQCAv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773857658; c=relaxed/simple;
	bh=igC4GtGcZsVAZDSM5+M30pXkTVcmavnjQO89/dgMWsM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C6DD6zSmRm6NzcZGo2e77KCCknx/zjWPMjvdo77AdxrJVSz0sOoLjSk87PxQUQhZq4IRnuuh64ssUqAk5v+hfuqoLt7s1ZGbk70rYijeUDepumnksuU5/8o6SIrbQ2FBrJCypfe/l9Y+oiz8vKjM5OU31Bthnd5Zfw/mi8lcH4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9VzqLKX; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9VzqLKX"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2aaed195901so416905ad.0
        for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 11:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773857656; x=1774462456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7pQsVn9jrlP82x/zoMf5r2Nw6PzXMQncCNeTmBbiDt4=;
        b=P9VzqLKX0YqDtLZkBRPD0IRK+h6KqqeYbBNeBMGA8E/snLVNCVWXfjqK8PhYE4k1JN
         2cc5oe1L/u6Salxrfgf7tXMyvJoCP7E1xLrlaiubhIf2vWfqVvNf3r2EdFFEeLN6gybH
         iT6juVFplHz8MGiUYFy5EQeyCRvpVzxkX2FpqK6Pl8Oq7aVYcPlfDn2996CkT842PAav
         YLKWc5ue33MidAner8D0NbUNWeSU4znIACUeEefVNJr383ux5o32yhzdRwRQUyBiA9ze
         hXj/lCwH1UsieoWCLehFBNMZewTcGuqNn0OOhYR3V6uVo0o5WNeZcAuuo9f1BVh78YI3
         XG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773857656; x=1774462456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pQsVn9jrlP82x/zoMf5r2Nw6PzXMQncCNeTmBbiDt4=;
        b=VebTyf2MH9Gf/06ES4KFZt2A7FXQhxxIrx9sZHExMoi9pMpmwp11ZowVlH3Pgi8daB
         bcFQ7tXb1M3vfhSra31lSiCJAgF33dlsbGbTO2/UNWppE/purt7nrFZVcdy1KL5LhDdc
         lOg+yV8QWtymGQQjZfuAz/8H+CcPlK/gNNa7VinQt5wSnk5IM7kxp2KqwZLs/6m+9X3A
         i3LgMplUeuWoV9565tFokmFys/7jj9uS6FLPQLoMdmLkIBVhPmhVqrgbsCGQnSU3aet+
         +vYv+zZ4Gr5qmmuTrUEi7Jv+BQioxiw1X1oq2saE/4mL8eDLOKxdqmNbg89e2GOGpjjH
         tZVw==
X-Gm-Message-State: AOJu0YwI6vIsZon/uohtliNnumKie0MjXYCy2R7efoGVL6+UsujDISle
	vX1zfwCmbIwGcR+sfd5grX2t6dnQxdnkRTDDQ0ztQCjrmhC1ObcqcGZl
X-Gm-Gg: ATEYQzwMtezuZhPWJIhtwemh7jzUL39D5XiOTYAEKxy9Yj6vi/qlT1dwTj2KrZp9CAB
	5dybAKQmn5agMCLXUuyU7NKv2mXAoKQfdgN79m5AMWEa33XLslCW4boF8DyiB1iscfkSHyHgogI
	B/6Bw//LHD8YyNJhNPEiVBkPz0Mf99Kiz+arK7OqURmmvXHNx+vnTMlopfkEgVEh7iMafFcW9JU
	H6me7PABIDlxaDuxQ4m6WNGWjrFb0CIO9k0cwvgOXPnrR/3z9yrjYsRPw+4S8BAqdWcnpsIHMET
	oQvUMJlUi07hy7sqSUBNqGmwwSqhJf0u3b+nRCyXKhrseYGSQ3inM5MYaQi77w6q5hqlSbReMFP
	mt+4C28sbJVfx4SxweSod3y0pWnG/ANoP0dtK+vBIBfFLpAOFuGjznlrnjiHUXDE2FZrF/ZVm9z
	W96+//Qv1NJdSk1RP+zJmIbhRsSBNcWAnDfIGLLomOFOggc3tkcJArgJdMpJE18vVRRKWVpwYV
X-Received: by 2002:a17:903:b8f:b0:29f:301a:f6cf with SMTP id d9443c01a7336-2b06e4073ecmr43361215ad.35.1773857656176;
        Wed, 18 Mar 2026 11:14:16 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e41927bsm44617185ad.10.2026.03.18.11.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 11:14:15 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: sound: Convert Hisilicon hi6210 I2S to dt-schema
Date: Wed, 18 Mar 2026 23:43:03 +0530
Message-ID: <20260318181303.5262-1-chaitanya.msabnis@gmail.com>
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
 .../bindings/sound/hisilicon,hi6210-i2s.yaml  | 77 +++++++++++++++++++
 2 files changed, 77 insertions(+), 42 deletions(-)
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
index 000000000000..ba740ebfc2f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.yaml
@@ -0,0 +1,77 @@
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
+additionalProperties: false
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

