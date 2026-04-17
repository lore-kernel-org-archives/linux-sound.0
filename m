Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2D03BADA7
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 11:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776423879; cv=none; b=JmgNVkgusivcDRv+wIf1cmpahonGxBjFX/kcmfeq5bW4/KP0B2EXNu3bapAz9Kr7qHNiBzCLF0TeOKftY1CIrs58Hg4b8jzu+Z4lv4Fvm2jyoUpyQBL2o4oT7HTaR26ASG6PEaIZnNe1xAmCqT071y8rhnlywTz8CdQr09JWi2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776423879; c=relaxed/simple;
	bh=hRt6bnj6JmwIsk2Q7eHHKPQ3L38fkyslxwE5kAHtrQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QuiqeWj+00OTKx1gwn90vk/Nb4lSBjdzYTjn5Ado8h5rnEwM0emtbT7rddWSge0QK7zI+QBiqdae4SZ9OW1YaMz8cuibiMBFyu/NwbEhGFMLuJHq8WnLeZd1JiNkAc9yHeUiY/daS62G4xMH0Q6qjnG3V4uE0yAM5hdP0NY3Avk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIcA/5Ef; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIcA/5Ef"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c76cce85bd9so219660a12.1
        for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 04:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776423876; x=1777028676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XM9OAm7LxW6dUYuM9tCumZEGq0uUmwkPB3O9AymjDmU=;
        b=FIcA/5EfjfMCuR1gI9Y1+Fin3GHV2osEX1muWKWlQh6q5Z+jVI/W243gWeKyUWvQn6
         pU+p+WF9TlrMcLoZ/PnvKsT1xbXKjhyeTlAy+QPjrQLslLna+3GQraLOMyyzSHkJq3KE
         N528MPduNyNHldu0cwV1HkaLQPlq7aii36PUkBJBu3zzQ7KfwlE3FJ5M70pW2IsYAJaA
         sxOBuOKOb3x2PnF5gy5nkikT3gpFFRZ8278leglE1jvK1WW0a0WV3ug5ygwkBa68Jqr4
         LqOO5v3RJ8WtsgmeTtOt755tgKgNTmxjD74zBBuPkZ1N+GV8V4sCNdcGFnSUyy8g+dxW
         IJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776423876; x=1777028676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XM9OAm7LxW6dUYuM9tCumZEGq0uUmwkPB3O9AymjDmU=;
        b=WIiiEMepO89FyD/my0TqqpCD/bg6OMgUXODWR4r1zz2oWx4hQOqRer9LRWVgEojmVq
         YBP7vdE0f4rp4C5LiCwjXFbCyE6S8ZFU+eIbEJr3GEiWOjwH92sR1sLRxFl+ed5iFsSS
         01u5xGi+CuC9tmTPvw2XXCGTwfHTZf0bDvAQiU+4y4G0P6sDOjgIQ89xTOs+RQdG9b6T
         BCGKqCho14bLDp7LK+vJr+huk4eHxVade+tcKdDnIzTVDprvS1uK+FC69UlNNeeI1iFL
         Sj9cNYFHYsiFOWxvYZ8Q4fYha2wdPuQtPPtL+fIJmCoF8wEnENq9HtD92hUWViuY20vV
         VOrg==
X-Gm-Message-State: AOJu0Yw7nXpyRRgYjD6xkFxCgjyJgN9YhSlLp8iNX1HD7nAFDjnisQnT
	f6E3AjhViiaNkpuB0HD2fmwV30OgYIKNdoG+lLR4AFJa4ityFL9TFV3K
X-Gm-Gg: AeBDieubBbPf2Fy70h7GgfA6EB3BK0YRkvjWT8HLGMT9vbnznm22r3gLd+OZTd7pfnv
	sn12S8PbDyMChKk8cfsav/ZqU0jt/Fx8jPMmGtm8DjW8J4dwnI++hB9J3Wc0Q/37ymJAaaFpDfd
	ya503zbGxKzyPFo6GQuDlrJcnJsY5tm0/iuypPJOQXFvnrU+PrmiaRczVaKCNl/WF10WY9J8RWb
	uBKEfxzbe5VtwSl0TSGNWTkyNPVUNOPF6IuBUI/EIa06F0TX2PVMRgG5IM6M8UHSkDpsIeU/Lh5
	4KfP/UyDoszku15eQrIOBoKWCPEK7yTyCjLqmTcM6USBHG5j601BfQsrMKnxuJnblfYOFep7814
	Ho4OIXAUchirHmygklniM9ynuFQEUh++QJlzZ+hZ8FLS24XLcSIjpHpLD6ejiOPIN1SxDG6Vrkj
	ne9Vb7Eb0jfGeEG+RT5qLUT0PHMkp6hsydl1O7vp7LBpipTr/uQH3vIk9Y6kPzFa8QBLcIZJbnv
	WECGJsMWTY=
X-Received: by 2002:a17:90b:5865:b0:35d:b00a:3c54 with SMTP id 98e67ed59e1d1-3614049447emr2541018a91.22.1776423875925;
        Fri, 17 Apr 2026 04:04:35 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410bafa9sm1758409a91.15.2026.04.17.04.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:04:35 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: Max Filippov <jcmvbkbc@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Subject: [PATCH v2] ASoC: dt-bindings: cdns: Convert xtfpga I2S to dt-schema
Date: Fri, 17 Apr 2026 16:34:10 +0530
Message-ID: <20260417110410.4482-1-chaitanya.msabnis@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the xtfpga I2S controller plain-text binding
documentation to standard dt-schema (YAML).

The hardware requires exactly one memory region, one interrupt line,
and one phandle to the master clock. Verified these constraints against
the driver source in sound/soc/xtensa/xtfpga-i2s.c.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
---
 .../bindings/sound/cdns,xtfpga-i2s.txt        | 18 -------
 .../bindings/sound/cdns,xtfpga-i2s.yaml       | 48 +++++++++++++++++++
 2 files changed, 48 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
deleted file mode 100644
index 860fc0da39c0..000000000000
--- a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Bindings for I2S controller built into xtfpga Xtensa bitstreams.
-
-Required properties:
-- compatible: shall be "cdns,xtfpga-i2s".
-- reg: memory region (address and length) with device registers.
-- interrupts: interrupt for the device.
-- clocks: phandle to the clk used as master clock. I2S bus clock
-  is derived from it.
-
-Examples:
-
-	i2s0: xtfpga-i2s@d080000 {
-		#sound-dai-cells = <0>;
-		compatible = "cdns,xtfpga-i2s";
-		reg = <0x0d080000 0x40>;
-		interrupts = <2 1>;
-		clocks = <&cdce706 4>;
-	};
diff --git a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml
new file mode 100644
index 000000000000..9617acef3f0c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cdns,xtfpga-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2S controller built into xtfpga Xtensa bitstreams
+
+maintainers:
+  - Max Filippov <jcmvbkbc@gmail.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: cdns,xtfpga-i2s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: phandle to the clk used as master clock. I2S bus clock is derived from it.
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2s@d080000 {
+        compatible = "cdns,xtfpga-i2s";
+        reg = <0x0d080000 0x40>;
+        interrupts = <2 1>;
+        clocks = <&cdce706 4>;
+        #sound-dai-cells = <0>;
+    };
-- 
2.43.0

