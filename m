Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D468454764
	for <linux-sound@vger.kernel.org>; Tue, 21 Jan 2025 23:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737500960; cv=none; b=rY9troW0fZwiMWKHcCSA9WuucPa1RHk3XEB4SpqCedS6IRSqOLic38eHiUnQlm/wlIbObGOR7RMsmdk2XYWDKRyJ4pQlNcNl2KIJjN9pcuPWgGRiYgbX6VJmFOHHqQJksie2BtWHwE/Utf3EzTtGnA8R7OXIEE049/axt3L4NBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737500960; c=relaxed/simple;
	bh=uRgLzjGuP5701SCsYa4IL1YZpVVCPW/ly9CYy3/ujrU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F8awg0vv+l5Vg3+IQFZJpwzZ88/ww1qrtkjs6htl0iVM7FzF6RkV0fCx9QU+vguFQnRjfZJwNXYazLzjD/LLm3lTFg0PohsfxFjnrtPByaHw+wPmBrvM6fif3owqAAeNtFJMlA3bQqOWmYVXKaDAiJE6C+M8i8euepzU+ZbdhAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKs+ysOH; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKs+ysOH"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa69107179cso1182823866b.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Jan 2025 15:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737500957; x=1738105757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vev1pC9vuA0i3dNfqBOjPoP12Hp5hWqqYf2CQ9+47ho=;
        b=jKs+ysOHEnKT7K8InKufW0LTwyVJoiVXhCb6ApfgAElnnbaiSNLJ/QMGf7q4nYolTY
         3p5nfvI2Kz234uOeVXoaKeUwzKRbauP3Nj9nNwSwkMGVQh8i3qrq8uptPE+jRBf93mTT
         HT5lN5HpRz9wRoU0tUHAa66AL+AVOAkVxZJzOQOudz0vcyKToLaOFVSl7LQfBYQMRp8M
         fgf9a4+ZCj9/ZsqHexAhkhX1UE6XFI17bHLNvsh3IWPbdyW7npW7IDIQfNjHVVHZyoje
         xexYn2paDj5JFBYHHdUC8573dv/xcV3vPlA3vjJ06FG75wg4MIbHa+TW/2wI+3hTDDxf
         EhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737500957; x=1738105757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vev1pC9vuA0i3dNfqBOjPoP12Hp5hWqqYf2CQ9+47ho=;
        b=kyFVecpJ0PdY7daJQvzGKGsMJXDoYA0SZhljxVXjCrPd6jte5m7aXugMsvKtwA7XS0
         J+x8fVTa5RoTDxp3msHr4oZLKgg/0utfWhGmpfz46IezUtz0PSB6hYEitNe83pMdJ7D9
         1E2k9ufkqFZpi+jJIct7xLEGhZMz06ycSLWRCtbwKn7RC3AgSg4V8cNWBns1Qv7oR5mC
         f0458Qw20n3wdRr0rCss9NAke0KARje5KCRtnInzWxnIbk4RRgGEvLTRcZ322OkbHMnK
         RV/MMS6ukYtWCWBX4MnVCcC7jHqq46D0aGrmbmGSTweHma+zabB4zTi1xc9VocTVbSDA
         1I4g==
X-Forwarded-Encrypted: i=1; AJvYcCV4DweBhohkccWQuLITu/zX3LKAcFpsGfUmgqdeZR+shMnehlCBfPxWVCVaSszsAd6XoWzn4sWXjwohAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpM6s4LfotwUrVqI4ztzK3bgqgGIfBHQqpPFSYQmjoj+vLtwgY
	7/nbVtedQArgvHipkCzcQJ5BLRCwpG0V1v/SDQjmhN70FDhQHhfyBUzF5Wjk
X-Gm-Gg: ASbGncur/13K4znsWdGMh+g6lPaDKtSP1VUFutHn9vHpbG80g/cuAKoNM9KMR9PZXLx
	VT5ln6ZZHrzVLNOdJwkifbcI2hoyMQcNVdxRgfaGFLtkW0bOF4wVxzlHtFS9gydfG1LF2eUViV8
	GzGZb79xBZoEFzZO0Nnf4MviPR7kkddLpKnJ3nnnTKMqSi9ajWgC7bkkUBqBRH/4cnZC2L6jVk8
	eK08d1XCUytE8Sm8Kif8bvU6GaupIvok3MR5LTtcXNXcFuhq8kGIqMLFr1yncYbHyKBIbrXe1Lo
	A5KintFUmA==
X-Google-Smtp-Source: AGHT+IEpFA6qEYfhGZN5FAW0M36NVLco9JwqZoYIzjyF3M0oz056WxKaZrdMKRmzZ/+/Lgo8G6YHuA==
X-Received: by 2002:a17:907:930b:b0:aab:c78c:a705 with SMTP id a640c23a62f3a-ab38b3d4253mr1820312666b.52.1737500956807;
        Tue, 21 Jan 2025 15:09:16 -0800 (PST)
Received: from CYBER-ABAKUS.kucica ([87.116.134.57])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab384c613d9sm812563166b.31.2025.01.21.15.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 15:09:14 -0800 (PST)
From: Nikola Jelic <nikola.jelic83@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	linux-sound@vger.kernel.org
Cc: rwalton@cmlmicro.com
Subject: [PATCH 1/2] sound: dt-bindings: cmx655d
Date: Wed, 22 Jan 2025 00:09:02 +0100
Message-ID: <20250121230903.89808-1-nikola.jelic83@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nikola Jelic <nikola.jelic83@gmail.com>
---
 .../bindings/sound/cml,cmx655d.yaml           | 79 +++++++++++++++++++
 .../devicetree/bindings/sound/cmx655.txt      | 59 ++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 3 files changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cml,cmx655d.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/cmx655.txt

diff --git a/Documentation/devicetree/bindings/sound/cml,cmx655d.yaml b/Documentation/devicetree/bindings/sound/cml,cmx655d.yaml
new file mode 100644
index 000000000000..ea2cdce80ea3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cml,cmx655d.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cml,cmx655d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CML Micro CMX655D codec
+
+maintainers:
+  - Richard Walton <rwalton@cmlmicro.com>
+  - Nikola Jelic <nikola.jelic83@gmail.com>
+
+description: |
+  The CMX655D is an ultra-low power voice codec.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - cml,cmx655d
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  reset-gpios:
+    description: GPIO used for codec reset, negative logic
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    maxItems: 1
+
+  pinctrl-names:
+    maxItems: 1
+
+  pinctr-0:
+    maxItems: 1
+
+  cmx655,classd-oc-reset-attempts:
+    description: Maximum number of times to reset CMX655 class-D
+      following a overcurrent event.
+      Default = 5, >10000 = disable limit.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 5
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        status = "okay";
+        codec: cmx655 {
+            reg = <0x54>;
+            #sound-dai-cells = <0>;
+            compatible = "cml,cmx655d";
+            reset-gpios = <&gpio 24 1>;
+            interrupt-parent = <&gpio>;
+            interrupts = <25 0x2>;
+            interrupt-names = "irq";
+            pinctrl-names = "default";
+            pinctrl-0 = <&ev6550DHAT_pins>;
+            cmx655,classd-oc-reset-attempts = <5>;
+        };
+
+    };
+...
diff --git a/Documentation/devicetree/bindings/sound/cmx655.txt b/Documentation/devicetree/bindings/sound/cmx655.txt
new file mode 100644
index 000000000000..28550c871934
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cmx655.txt
@@ -0,0 +1,59 @@
+CMX655 audio CODEC
+
+Required properties: 
+    - compatible : "cml,cmx655d"
+
+    - reg : the I2C address of the device for I2C.
+
+Optional properties:
+    - cmx655,classd-oc-reset-attempts: Maximum number of times to reset CMX655
+                        class-D following a overcurrent event.
+                        default = 5, >10000 = disable limit.
+    - reset-gpios : a GPIO spec for the reset pin. If specified, it will be
+    deasserted before communication to the codec starts.
+    - interrupt-parent: used to specify the controller for the interrupt
+    - interrupts: arguments given to interrupt controller
+        see devicetree/bindings/interrupt-controller/interrupts.txt for 
+            more details on interrupt-parent and interrupts
+    - interrupt-names: Used by i2c driver to specify interrupt's use.
+        see devicetree/bindings/i2c/i2c.txt
+        and devicetree/bindings/resource-names.txt
+            for more details.
+    - pinctrl-names: see devicetree/bindings/pinctrl/pinctrl-bindings.txt
+    - pinctrl-0: see devicetree/bindings/pinctrl/pinctrl-bindings.txt
+
+Example:
+
+fragment@1 { 
+    target = <&i2c>;                   
+    __overlay__ {                      
+        #address-cells = <1>;          
+        #size-cells = <0>;             
+        status = "okay";               
+        codec: cmx655 {                
+            reg = <0x54>;              
+            #sound-dai-cells = <0>;    
+            compatible = "cml,cmx655D"; 
+            reset-gpios = <&gpio 24 1>;
+            interrupt-parent = <&gpio>;
+            interrupts = <25 0x2>; /* falling edge */
+            interrupt-names = "irq";
+            pinctrl-names = "default";
+            pinctrl-0 = <&ev6550DHAT_pins>;
+            cmx655,classd-oc-reset-attempts = <5>;
+        };
+    };
+};
+fragment@2 {
+    target = <&gpio>;
+    __overlay__ {
+        ev6550DHAT_pins: cmx655_pins {
+            // Pins resetN, IRQn
+            brcm,pins = <24 25>;
+            // Out, In
+            brcm,function = <1 0>; 
+            // No pull, pull up
+            brcm,pull = <0 2>; 
+        };
+    };
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5079ca6ce1d1..c471a4b905cf 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -308,6 +308,8 @@ patternProperties:
     description: Carl Cloos Schweisstechnik GmbH.
   "^cloudengines,.*":
     description: Cloud Engines, Inc.
+  "^cml,.*":
+    description: CML Micro, Ltd.
   "^cnm,.*":
     description: Chips&Media, Inc.
   "^cnxt,.*":
-- 
2.45.2

