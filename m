Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26322F7478
	for <linux-sound@vger.kernel.org>; Sun, 24 May 2026 18:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779647631; cv=none; b=tN4yiQG1sxkbkDmLw3NX0HLdvxItJky1fVFQlKlfCebAEEhQgtHZwNDUxb/ezbX3uMvowHjRiY0sTDinaoVCu+Rxr9q0XIN1eQs61NX2Juksjcrpwn+2CUijks1j7PGqxfwZ5ZNZvc87nZcxXHpurO+YFvedD7Kjl57xEUPS6Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779647631; c=relaxed/simple;
	bh=Inx39RswzGwdqMX/hghFGTuddRSJ5QXhing1KIVmMA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eDdqnU0TwB9tPcgpX8lqql2EzkbPe9hXlVIX18P+JU8TdjZaRTYsqVdVWHYVJIgdyhXv+Q+ZC170BwAnrXUtBCMaer12y56eSoZ0oZeiOA6HqiOP2W2OWGMCoP70oCbQb0yd5E3+PX6hMRcm8089muVWEDrPAv6V8Lge5WzF6zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oKqbXaRy; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oKqbXaRy"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-836ebdeb969so4046086b3a.3
        for <linux-sound@vger.kernel.org>; Sun, 24 May 2026 11:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779647629; x=1780252429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3/1bzDCKOLQOTkCi7bZI1uE7iLJxfhIL315WQnRlRww=;
        b=oKqbXaRyNO2fPBVEpldNgYX5vBTzCUuECQRzGBnOnJ2c25qhY8SZDBTUB4xR2t/s56
         ZWA8hiUUdE4zXlICwnOiwE5+5TvoFVAC3NPVaxb8fo8j0DRzhHQCxW6/z2zZoYinaN0y
         FM9mLRo6LND53uYpohHv3xTa0tC+6rtN5wvBX6f5nPWkpna5WqvWwsLe3ItO3bjFE6c+
         bff18D1/3+GWZx3v4hLhT4MZ9+i1B0nHZKn9n6zU0G1gTrVLihaOD1de7iVqYAQBFNiC
         XbQ24yatOBIPZfHWubRVTwHQ1C+EXwRiprcg6viSAXUxihb9TVcYwlxL7UqPFOBqL1fi
         Sywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779647629; x=1780252429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/1bzDCKOLQOTkCi7bZI1uE7iLJxfhIL315WQnRlRww=;
        b=EvXT4t7ttF3L7Hi8dUzcvh2KjxtES4jq4ndlNYu51L4APBcEqYztPZGJ9mTYcCZLqv
         1z4m8n2S3xK51AKHL9t18B8um8SkJ5Z6etxOyVyWmrJTcIaPvmnL8iQQ18ARjVyjJwsC
         AE+V3w22DqSr5YDnT1+Lim2JO5w2RbzlSpezag8PecIvyvD5Vjmae2Kt9et9377Lpsvm
         BKT9+5Oqqh6lwT6+lpmqCsPCKtCVgjrWNk4CjnckmqcHS4DSrIlmQBXId+hIbfxW03J5
         7mY9Xru51R4lSavytct6Wb7xr8r3SnzezTgF9vUcca138bV4E2W8pL8kBgYgRJCs9hds
         oWWQ==
X-Gm-Message-State: AOJu0YzRtvCSxfgsDymzCHqsVcxGvYsQgjTBm5pCP+Ad7+3DUFp8hQKP
	88p4Pj8yeakxI0pK4nos/uQeZ8Yx49u3mBZ0FFTHdT4mrp4/cMw412Oo
X-Gm-Gg: Acq92OENfHQMQIhnlm+RYlvN2QZ+nkK6LA0Vc5x7wGrVEWQ28hxB1EJSg5NnSQqI0vM
	/eyN8hAn8ksA1qB089UMn3S1q7hvOH3YbJHpO0mQfRFLzq4VfEpeRDts1mByfnKIiJHHC1POZeD
	sFeOlziyNLqr8cI2wf3XGJ1H13UozRur20XQrWmS8SEadCzbP73EtDiVN1eyVPDg7BtLJm1w3pF
	0P+EgfnAVOnfVgdQtDKpjvdF8CcBSQsL7Ts6tEzzLFmWL00VPmVvc8u0DjVjzubMdWd7WgsoIWC
	Rl/kIdvbZu9LYD4nKeaI6UPSw6u1SXDMgl3wskbxtLRM/BRnFoY0OxU5lRvCYFtGAnNq7m5kB8p
	Uk9iOwylNifKbTqbD1Pwz6lAfUbnlN3vTEi3A0SMMTORqCu8zWcwn3RlV3gDXw4ANG0uh+ZF3KE
	OKBhr6hvVlirbjXPqTkn0xQz0SkqjRFerCJJWz2ta2L0EB9cpiyHGVQT9wy8+JaCXDLIgvxLsjs
	ApU0g==
X-Received: by 2002:a05:6a00:2d8c:b0:838:9e25:f128 with SMTP id d2e1a72fcca58-8415f32f29dmr10904478b3a.26.1779647629021;
        Sun, 24 May 2026 11:33:49 -0700 (PDT)
Received: from Ubuntu.. ([49.37.169.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ffee25sm7339648b3a.58.2026.05.24.11.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 11:33:47 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: claudiu.beznea@tuxon.dev,
	andrei.simion@microchip.com,
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
Subject: [PATCH] ASoC: dt-bindings: sound: atmel_ac97c: Convert to DT schema
Date: Sun, 24 May 2026 18:33:37 +0000
Message-ID: <20260524183337.111657-1-manishbaing2789@gmail.com>
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
 .../sound/atmel,at91sam9263-ac97c.yaml        | 60 +++++++++++++++++++
 .../devicetree/bindings/sound/atmel_ac97c.txt | 20 -------
 2 files changed, 60 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel_ac97c.txt

diff --git a/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml b/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml
new file mode 100644
index 000000000000..870532927164
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml
@@ -0,0 +1,60 @@
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
+  - ac97-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    sound@fffa0000 {
+        compatible = "atmel,at91sam9263-ac97c";
+        reg = <0xfffa0000 0x4000>;
+        interrupts = <18 IRQ_TYPE_LEVEL_HIGH 5>;
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

