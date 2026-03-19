Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABAF40DFCA
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 03:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773889762; cv=none; b=bpmYXKePhwtShvV6BPgZwxGfJV4bw2ZZDAno0y3bXde1yXeRprNZ5hDQjM70SDviA5YcULSaiPDyV7b74DOKztEZqtQ7TA0MrFbXfJg0B5LHFvoAicLkO/fmABXKhsMEviiCNgxw72IoYJYYhtFR7J72OSnLHs6HtRbqdUzn0ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773889762; c=relaxed/simple;
	bh=VKUZN6Dn+MNBZmbMp8LKYUzCDVr8JKHldS7jXtj9P/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xoa96GyX0xq3X6LNCwmXUHHV6FkIQED2D+tN3fW5CZUh/6DaJUk7wWUgoc3BnEAAwEMZb55YivzvESWFAMMc5drvsSTQ9ERgQHrJonUxYnrRSoKZVECK6qf2cnaMp2kbEUKYZ7ybgBg8UfxLpax2IzUlyhdSleMur8X2t4bpUBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQAwmkrd; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQAwmkrd"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-829759ca646so321412b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 20:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773889761; x=1774494561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zo4omf2aXz5d4OsApGKGaUmtbTmmR9r/c/VeF2cAJKU=;
        b=FQAwmkrduZah2X/tSiRaCntA3d+LEkZC30iLEzmMIW6YAUnqcXBbsh7lw1+Sb1VVQm
         cLYO1eOxhgrzObBChbv+GID+M8ThZ2otlZm2JFoBPFQr65yIgkCJsl9+c487KUdHUwNB
         nLp7mIqEXODDq6B7RpgjdylexMowTDMSxX8PgczTyRQeQDF7ecWKTV7NQ7X9D6ei80KI
         8HI/K74KnWGu/baq+KJFa95UOvrIA+WcqLUjGvspei3qM9bYX/M8yQudUWm/H6vmPOaa
         94/3I+fvra/cx1n835gffKd2SAx0WO3cqu7gVDcZUS6aTILI3yaXOWurtcnSIjZNW9DK
         NPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773889761; x=1774494561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zo4omf2aXz5d4OsApGKGaUmtbTmmR9r/c/VeF2cAJKU=;
        b=So5VhyEdLawSK1r4jypHn64RlXavXhdIt1LFXFgwSnQLn0uLmoDYzLOgl/qmldfYxS
         F9Oa7HyPLDmlaUAFarHpOrmYOk1FOFgUXURnCXajex7BQ5GKXVQvyowEyWDEs6WpAy3H
         Uqlcz1bp+/I6nl0ikKkgFS7C/nEH/iE4MP9aD2YXFkgxoTG+kryiqQ8veD24h1ixABwm
         wfKeFHgrgr/Yd8KaqWvGIN3KfRo3B/TAU0nqTaAuEMCkvzru5D+LNqadElAxtUg21Pp+
         sgw2GH0FVy20Rg0s6bOOU60oddlL5+eg+u6KHju/Mzy0DQkHYn4KuCEEJu5SKspVekjk
         cp1w==
X-Gm-Message-State: AOJu0YwfaHAjyz53CDS5smD37eQroexLrW0yVJHacl9pWER7+222jnGn
	fOZfjCvitBailiq+i+gdleU7S0LpWDfdCldKcxVxYLoplOQFnD11lBkd
X-Gm-Gg: ATEYQzy1+/iNp7qtHP2Ih6B65ro7U0Yt8CaItzAVGQQdeeAYPXkFvGb52vEZPLHKNWk
	rzoTZe+dyggE4gLBJT5lfVySQeNqpB5sAV6/XZ0GH2YHJE2BECBku1MDPwYkL9IgdA7AI1eCr9Z
	vvVqKEkkgoBA/1c0PjouIcSy0Rgd0G0phCLE6LBgh2m9YBBMTZK4oMTmirlOHq+7paWOqjEzARe
	dAe0Ohv+t3WG5ZXm2XPV/m4WZJtxZ8OpZFA1PorIeMKR2a+dtFgEQAdJoadEMKKPYV5L3uyUIJV
	/F43WMKdOKTBjatw3oTF48dME7XRPeLmf/x5jrqktry+Y5DjgeRU0W3icESX7ci404p4/Z6gCy/
	UYGK3AcjF2ZM6A7ZlaKtkYUknQYcztjXy/Y4mvSWuLS0O9LcL8xoRUpPZAw74r/hql0a/8rR5k0
	7h4QL93QH1iqX9/BZscyzQl/CV5BvM4r1RhtqB210x32fm5QPYtPkTzHVYlEasORkq2r6oQVAZ
X-Received: by 2002:a05:6a00:3395:b0:81f:5238:5560 with SMTP id d2e1a72fcca58-82a6ac8a7bbmr5037317b3a.13.1773889760886;
        Wed, 18 Mar 2026 20:09:20 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbb2802sm4248271b3a.31.2026.03.18.20.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 20:09:20 -0700 (PDT)
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
Date: Thu, 19 Mar 2026 08:38:26 +0530
Message-ID: <20260319030826.4792-1-chaitanya.msabnis@gmail.com>
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
index 000000000000..8b76e973312a
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

