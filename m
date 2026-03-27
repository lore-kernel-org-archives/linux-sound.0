Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF493DBD4D
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 09:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603349; cv=none; b=nsaDtuAWZtvbE1twfwmk0s3YC22VC5PN5pVnMQkj1lsw4xFcF2poetr9bXqXSxcuwVEu4p2sXrfiv0kRBXnIgG474vGDgJVra9DBZ7VrLEXQa2aGQ8BIkKreDldzOj0zFd4UP97gvImtyE39RuFsvzUGYPgMUo+ppi+6NvMTLAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603349; c=relaxed/simple;
	bh=77ziGXDJHCVtyxYDOLAAtXsexr+EvNb/qjtKrFRyQuE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rrvKH+ue0m4SKMvhm4FeiAaC8y/OEwVkzQfQfEN3bC1THTlF916PwCmLwXB6RwmdyU6Vleh1Ae9tmURuP6n1PFrgeGeO8O5fryfCm/JnwuANnckWOWRADvkKCrpddvkbVdXT0WTnTjJw5j1aoiC3MsJ1WFjV1YLDeagqeNcNwlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esYyOkWZ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esYyOkWZ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ab39b111b9so8531885ad.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 02:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774603343; x=1775208143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TKrsFAgsd9tGqXibhrnXaG9cuXcQbnK4a4OD2FtF8S0=;
        b=esYyOkWZdofvtU/E2Lx2kqBe4weEKdMt0bIzzUvgsbyjXFR6zEwBBd6ewBXf7C33/c
         Ie+biSvTlXzsXZ9E6t+6R29A18aZTiqX2k2D2ebf+eStG2CiGkNzJIAP7nBinKrLp8Ya
         iNVZi93Y0HT3VmwcA8KDhoANzFGN009D90LRCkz+jb2O1ZZJ2YFRbO5uli2Q84dw37dA
         9n+rqYpUqEubJBG2e9FCrqnsTxMAzI9GsiUpDmXaq+gujE7kaw5IjOaWhHRQKwDiz2x6
         nzpAMbMcOGuuY+Bj5SbsWpLO0kKtMKYQ6A2M6vK/FKptOrTMEtvk1QWsfBikguLEQEdz
         u+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774603343; x=1775208143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKrsFAgsd9tGqXibhrnXaG9cuXcQbnK4a4OD2FtF8S0=;
        b=DJDdvaDRnFHebDOtBO3IlWFWcQ0MpYw1KhfFskDehgaT0vip2uSbClla2dvpTG4IYy
         F1T4RpPz7njY5bR2IZlljEy8XUS16NP1+Q8PlNAq0SkHZdWO2AEHZRJ7Hf3RF8GbiRGJ
         fZhjWNu9NkEOalu+GbhlpY/Mtw+2W5TCjifcCnJeBfXeLbrU8kf4Tp5ItbJBcUrcWCec
         +oYW4iFBGvO4yXL0hmAM4EP1r2mZXmerrF2P+VPxu51QtWB314P4QiyP/SEbKsvKlgP1
         LJYc2zuzF+eCn6shXZkVgqxBjycUJGDaGKfpRjES+YZ/0e4oUmns8u0B8hp3Uti/hW4S
         1KcQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9OBl+DRF1NkWIjBDniQSqbIkAxlxZvaWj+FToaPHPSTEcPR84RHeGUgrYnH0/JkgdD0Q1XljxGye+Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKuq+iB+sm5/YT4pNbrne6kW0GGVmeC12/dofP4kjLFgsPZS5/
	5l2CjlLOb2c2DysSZMYKEFjKFVBESpWiZcghVJZ6gUUwOlYqU233QVM/
X-Gm-Gg: ATEYQzxxn2FDBoSr19RgmmxtyqWCeL28kbc+UnSRjPQS0nQKl+1BVvoxLGPbcCgcjiw
	ewxgypHqiItbKHA1TZemMuwQlV+xCzXWBsjsnbz6I2fLI118cWmpozdniwl0KKUDIPlcOkFfNNq
	mpDdK0vVmMidjVvpxDnpG+1DpOkPmQBmQSwbxp+ypVEwsmM6HKWekRN4uZfso60pebdlt/mlQiO
	kW4zjaqsiPQJRy/oSmgWtUxwW5HNgYS5rfeShDPJVk0jQNDWKlsTaH6mpOxFrGy8ld+vJh9r8O3
	13ym501xJ5YPBZn514nyB4eyNU9V0bFOoJ/bywT60rzH8O1iOhhMa8HEUeHLC/9QgLH+NQMeXn0
	aWf5/9vMjY+y1URN043B5inOHCJwdDXqwYYinJGxz+L3KijY74iSHYV3UxeKDf6hkAnRDLdwBsy
	VZwn/DIrMZppi7OLnddRcgOHGS7/vjbkMu52p3iFpTkE81q8C/TK3fHclonL4VoWIcgmabZYfV
X-Received: by 2002:a17:902:ecd0:b0:2b0:606b:6fd3 with SMTP id d9443c01a7336-2b0cdc1026fmr20438765ad.5.1774603343419;
        Fri, 27 Mar 2026 02:22:23 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc68914bsm57749095ad.0.2026.03.27.02.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:22:22 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: john.stultz@linaro.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Subject: [PATCH v3] ASoC: dt-bindings: hisilicon: Convert hi6210 I2S to dt-schema
Date: Fri, 27 Mar 2026 14:51:06 +0530
Message-ID: <20260327092106.4233-1-chaitanya.msabnis@gmail.com>
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

During the conversion, the order of the dma-names properties in the
example was corrected to "tx", "rx" to match the official property
description, resolving a contradiction in the original text binding.

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
index 000000000000..5171f984630b
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
+  - John Stultz <john.stultz@linaro.org>
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
+      - const: tx
+      - const: rx
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
+        dmas = <&dma0 14>, <&dma0 15>;
+        dma-names = "tx", "rx";
+        hisilicon,sysctrl-syscon = <&sys_ctrl>;
+        #sound-dai-cells = <1>;
+    };
-- 
2.43.0

