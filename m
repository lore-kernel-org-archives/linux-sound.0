Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C6030C159
	for <linux-sound@vger.kernel.org>; Sun, 24 May 2026 19:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652409; cv=none; b=k7873IiyURHESkhBTYcJ50hVAbzenkjX+pAAgfYVPJSt2HAhfCepz/HIPh6e9Axm3SSFDefEQbOkpDYaEIR5qK1pPLMd0Y+1IazNeCWhkkz52DKNdDK3m4arE+FujrDhPjoL6XoCkWUIVsV01btFFBLDuDa4Tm1JdZPe+RtL+EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652409; c=relaxed/simple;
	bh=7jRjmR7byF90I5z6f0XKYOOsZQ2tNGR1X41E9TzoQMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VX0nuEI94pG1bX9PXJj5Z9HcPXINldyKpLBkmVHfGH6pwu5wof3v+YFGpEmGHnoovvOisXuhQD+tPAkIUEFnQ9EwRrqIwWN2cQC41bDiNd/OFk+4BSra6ggnPeHzaeNmkzPDllT9hciBi6lO+fXWRTLqNKg4v2Q7JakXOMYTlL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hp7zOXwn; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hp7zOXwn"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-369002b26f4so5053604a91.3
        for <linux-sound@vger.kernel.org>; Sun, 24 May 2026 12:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779652408; x=1780257208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ETDhX6hQeHZ88Twc2vJV86bPqeNnna3Es2w6c/Lk7tM=;
        b=Hp7zOXwnOOpcIrbOO+pfwvtVYXZtTpaLrb0Tezy2o4nFV3d0EXHytMFFJCl51cTFXi
         rodi31U1kBpFAsjU7DZPM9xehjhIHfTGlNuL+xETsyDZuPS6LUsQARPGSiJjaSE9fOFo
         cDpZXq1W8g7bpqWrYzXmLMcheAC4DMCCAb05ezkaFbmUgZpLuJcQoNAPh71iDwiOD2J9
         ZHKqrcUjSb0vAwFW6QdYQbVZmxwcsai2hi+H7q+7fMwMyPEjKBZHj4t/sdOkTwL1YANx
         hGauJIyNorWHwlt8JSA4d1aGkXj4zC4hJYfSixM2yqH4rn2etqwVfAaTR5U4ZgHs5gpm
         RHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652408; x=1780257208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETDhX6hQeHZ88Twc2vJV86bPqeNnna3Es2w6c/Lk7tM=;
        b=ifIPJ2Vl5zGGIQNQOk4AU6xVPMcB3+uGpN6mEq2jkECBD9iE7qX+B9trEO1tRUV/m7
         STf4Zl8CUjx+yPpVrwCf2c850zfXQEQdNOAg8B7nmOu91xbcJ6k8fqb0RB8HL25eyJVv
         uoUbGR03sHFeJwMQyHjlE7NEXCkfhHbPu3FaiK5azRDLXqgwMryx2TFG9Ua3RMrVTsQk
         HHDWhMo0BHcRRRdhZPWgvINEFyD4GF8ctTSpctRJdXIHXWJRwhx+yjUn1yqHfyzDa1H9
         7LRfeozwudtIZ7iFk5g70vbKyY3tzj+lgU38kytl+qGNJBpVo0AgjyC1y84NuoLOViDG
         lkPA==
X-Gm-Message-State: AOJu0YwCIEw1OVryXisgYzOGtwpuVjNwlAGeYqRy3p76iIVk5DSzyrds
	5z37ym+DwTvrCXhe183Qim5mG7Iv/a9sDgj6u8eMaSvO1ByR0rD52rlz
X-Gm-Gg: Acq92OHtZNMllGu0azZTkAYaE1HSo16jwOnKuReUQZHQVlwIA5svM1BgkB99YIgiaxG
	LId/7TTcBLoj29ryYvR4vi2ypNW+ZghJJg41XGOjurryAtZl20WsM3Gsrbp/LGxx1SdNmOB59oJ
	Eu3Yv8mNTlcFSB1oWv+pdkYo3LJwYxlDYUfS7FGKCJwCCdzaToWB1n3WGONNHkOPI/qwqo3/yb9
	YPtXe+2lUnoYOBGL2e7LhTXllNrLcUBJuLfjQwC95FoCj5NOLuVnbA6Pv1iCjmCyOeN0tTeRK8N
	3Q9IetODcym+S4IGPkkv31mh+SwTRoJBED26Z3n77RcjcYXawEca8BSwHVs6MK6lN3W6t8fKg55
	z6s8lfXU/FyL/WeC8srKtFMhXBWidaWixGX2ovV/Y5LFmeyhw2E5GzUCFUr1Nq/C6EfKdOKUXAZ
	UTM+afFIo73Dz3JKdLgUH8Svag94d7+Cz6AXB1fcD2RM8Stl7TDHGKQ+NBTUYjfFDSW4qAfttrf
	IAbIg==
X-Received: by 2002:a17:90b:2585:b0:366:3ac:f730 with SMTP id 98e67ed59e1d1-36a6788e0abmr10580647a91.25.1779652407646;
        Sun, 24 May 2026 12:53:27 -0700 (PDT)
Received: from Ubuntu.. ([49.37.169.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6d86daddsm3584575a91.11.2026.05.24.12.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:53:27 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: claudiu.beznea@tuxon.dev,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [PATCH v2] ASoC: dt-bindings: sound: atmel_ac97c: Convert to DT schema
Date: Sun, 24 May 2026 19:53:18 +0000
Message-ID: <20260524195318.112398-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Atmel AC97 controller binding from text
format to YAML schema.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
Changes in v2:
- Added undocumented 'clocks' and 'clock-names' properties which are
  unconditionally required by the driver.
- Removed 'ac97-gpios' from the required list, as the driver treats
  it as optional, fixing validation for existing dtsi files.
 
 .../sound/atmel,at91sam9263-ac97c.yaml        | 70 +++++++++++++++++++
 .../devicetree/bindings/sound/atmel_ac97c.txt | 20 ------
 2 files changed, 70 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel_ac97c.txt

diff --git a/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml b/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml
new file mode 100644
index 000000000000..5f4ebe81bf90
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/atmel,at91sam9263-ac97c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel AC97 Controller
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: atmel,at91sam9263-ac97c
+
+  reg:
+    maxItems: 1
+    description: Address and length of the register set for the device.
+
+  interrupts:
+    maxItems: 1
+    description: Should contain the AC97 interrupt.
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: ac97_clk
+
+  ac97-gpios:
+    minItems: 3
+    maxItems: 4
+    description: |
+      AC97 link GPIOs- sync, sdata_out, reset, and optional sdata_in.
+      The driver primarily uses the reset pin.
+
+  pinctrl-0: true
+
+  pinctrl-names:
+    const: default
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/clock/at91.h>
+
+    sound@fffa0000 {
+        compatible = "atmel,at91sam9263-ac97c";
+        reg = <0xfffa0000 0x4000>;
+        interrupts = <18 IRQ_TYPE_LEVEL_HIGH 5>;
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
+        clock-names = "ac97_clk";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_ac97>;
+        ac97-gpios = <&pioB 0 0>, <&pioB 2 0>, <&pioC 29 GPIO_ACTIVE_LOW>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/atmel_ac97c.txt b/Documentation/devicetree/bindings/sound/atmel_ac97c.txt
deleted file mode 100644
index b151bd902ce3..000000000000
--- a/Documentation/devicetree/bindings/sound/atmel_ac97c.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-* Atmel AC97 controller
-
-Required properties:
-  - compatible: "atmel,at91sam9263-ac97c"
-  - reg: Address and length of the register set for the device
-  - interrupts: Should contain AC97 interrupt
-  - ac97-gpios: Please refer to soc-ac97link.txt, only ac97-reset is used
-Optional properties:
-  - pinctrl-names, pinctrl-0: Please refer to pinctrl-bindings.txt
-
-Example:
-sound@fffa0000 {
-       compatible = "atmel,at91sam9263-ac97c";
-       pinctrl-names = "default";
-       pinctrl-0 = <&pinctrl_ac97>;
-       reg = <0xfffa0000 0x4000>;
-       interrupts = <18 IRQ_TYPE_LEVEL_HIGH 5>;
-
-       ac97-gpios = <&pioB 0 0 &pioB 2 0 &pioC 29 GPIO_ACTIVE_LOW>;
-};
-- 
2.43.0

