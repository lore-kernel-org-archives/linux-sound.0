Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356592F5A02
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 05:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761715404; cv=none; b=A5XlwILF2llm7MAuxguPy1vwhAuetMSAvwj59VGReGTONzETdMACbPTU5gUwSnNolg2gzsl3DGyx58pC226f6M2MBPYcZ8D+E/yA8H0pBxr+lfCQQN0+71GNZope6ULcjslzdzOkEK2AZnNbVmCHkkVqEfzoeT8azOWYFINTaHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761715404; c=relaxed/simple;
	bh=MVV4fn2U9kldtqYBjWGUoCfEKkSN8LPsc75pCGRRe34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FG4DoOZHHrKW8YYfESAjhLmeCW80aF+4fD9dTTJFsBdNuyWmsHriFGYif0iKlr5CkcCzvOyUWXCgiG/tuZZnkNTjgtdTGB7b1ein/SwaZq7aXIpxMJQcfEfu6Pa/9HVavQfVZ57Mc53LwLXMGal/6trqRn8otvUIiv5DRxqUgHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GC/QrFDj; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GC/QrFDj"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-290a38a2fe4so6329865ad.0
        for <linux-sound@vger.kernel.org>; Tue, 28 Oct 2025 22:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761715402; x=1762320202; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vsPKJDbsU1HLDhh7a3z0A0GhLekMgmfq9Z2ctQNja8o=;
        b=GC/QrFDjzTQefo+2XMGdE/1zagpDaZDNeeH7zCtE+aX97yhhU3ZcsVQF44ltH8XgfQ
         qtrNDGshfOGm4rSJYSfRRXaw9pWk/SBX6qBBmP1T2RIfw0T5EIKyghqBn4WK90y5VOpj
         BAWWB+Rb0TxTttfeoub4aYm/z0gTcXYy/Rj01x8zQFedSxJgdouYIyQ8dEQs/p5QAe/a
         addg/nJ5hkz/LY5pyI2Fqq8pahfP5sjt8NPYr8XMy+H4NwdGXa01ZVVRbVm/wsXeQwgy
         hpPFZ2ZkHwi2a1NhoskQqZJcfQ0sjcF8cxYaInE/FZlp1qC1OzZ5lX0PP6TvlxIhPW9j
         b1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761715402; x=1762320202;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsPKJDbsU1HLDhh7a3z0A0GhLekMgmfq9Z2ctQNja8o=;
        b=scRSbO38WH6GlI/ce8Ir4DAH3cKSTm731iK8dlKbSRTT43lOMQYWV5A7A/N2gP4aZP
         ivbYFmZl3W1Dt6dSjIo3uEMqwrLCc19CmtaLVl0g3JQSxDN7NaeZA9ZaZMCbmKSN5j2v
         6+oUPMFtMKf+1ahnLghLTNgZdBl3yjWNVhqtV0jBhqeGUYmxuFsCFXdaGOpGXy70GmDy
         4P7WBe/hGaOHASpdVx8ZWeRFPUHNpymdM/mniCpRNs0YDPmwZzsDXK3hO+1sHhVybmk1
         jeINflyfHSFy0wRaLC+TWXwJEWt8CVcbUeuVmUYJcqSfXfh0Tmx0xP69wArHwPrQe+D0
         0T4Q==
X-Gm-Message-State: AOJu0YyDLaBwt5bFQCKf23jEyyWyUfOe2gY7kNo33N2riH32l6h/4XIJ
	rBMM4rOq15Pog1hqCvIBZLM0tHX/PSlYc/jBcwllmABR8JJIdvMmkoRz
X-Gm-Gg: ASbGnctO8B2ezi8XVhafx+SLWFPTzCvySB0MBtVcbYc5HdE6w+b9CC94sA9vyMQqOdI
	YsEjiWBILX8YojBKc96h8MujRuSAejCyEqiP2g6hJYlTM2d75t1rYzmF7EZShL5SLiNwrsEXFCp
	3ibzYPtG9WdOMu3rfYmSYA/1yYFSYDklG/0rCQCd9PAsg7Nd7bYZjk0ilxocWA152TCkoeHuhQt
	nJznRHAKErsXmhp2tybEfBOKSsSK468Ex7x0VR7wl9Qf9aT9Tr0FC5z/xHrRxabftiOhcGFk2HC
	Izx3yNOQWgSu1tDR0Wb+pdF/ZthThFIjpaoz5isU1wnYI5gmBepwPGTsCF132whDiG3+ChlQwIk
	7TqIvfaX53hOE39Sh9o21RKAUIoWtq5xBIUgJB/uc5f1Xd6i/Znobl93LgbZ30bT7VYofK9ra2L
	HkfO4gIojGYEVmDJyZBqGoPZDPXo59qA91XIY3ICwNzUyMhFNZMEDs
X-Google-Smtp-Source: AGHT+IFPBXAWHtWxVsH6BOk7hvQzebVLwsPZzDMBXOrqfB/oOU+pnQqSXpGyG55Woj+zHUIo1/Vq5Q==
X-Received: by 2002:a17:902:ea05:b0:290:af0d:9381 with SMTP id d9443c01a7336-294deec2ed0mr11818285ad.7.1761715402314;
        Tue, 28 Oct 2025 22:23:22 -0700 (PDT)
Received: from [127.0.1.1] ([2406:7400:10c:6625:afa3:1ffa:3262:fea9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e41697sm135526985ad.98.2025.10.28.22.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 22:23:21 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
Date: Wed, 29 Oct 2025 10:53:04 +0530
Subject: [PATCH v3] dt_bindings: sound: ti,pcm186x: convert to dtschema
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-dtbs-v3-1-3cc162221c22@gmail.com>
X-B4-Tracking: v=1; b=H4sIALekAWkC/12MQQ6CMBBFr0JmbQ0zAwiuvIdxUUqBSQRMSxoN4
 e4W4oK4fD//vQW8dWI9XJMFnA3iZRoj8CkB0+uxs0qayEAp5ZgSqmauvWLN2BZVZbICIV5fzrb
 y3jP3R+Re/Dy5z14NuK1/gYAKVVaxQa0p59rcukHL82ymAbZAoKNU/CSKkmm4viBrKkt7lNZ1/
 QJfhABfzQAAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
 david.hunter.linux@gmail.com, khalid@kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 Ranganath V N <vnranganath.20@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761715398; l=3848;
 i=vnranganath.20@gmail.com; s=20250816; h=from:subject:message-id;
 bh=MVV4fn2U9kldtqYBjWGUoCfEKkSN8LPsc75pCGRRe34=;
 b=1ls32d42eEBD+XkDNskmfxIMVqWl1ESc2Gf9poGBFGwsENkGraiUn6GcqjlYtdXsIxiDLAvqj
 03+OT+JCrjyDq3Vhx3BRE9kqVVqeoBuM518WDawPW8BNtayh46nVJXv
X-Developer-Key: i=vnranganath.20@gmail.com; a=ed25519;
 pk=7mxHFYWOcIJ5Ls8etzgLkcB0M8/hxmOh8pH6Mce5Z1A=

convert the Texas Instruments PCM186x Universal audio ADC bindings
to DT schema.

Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
---
Convert the Texas Instruments PCM186x audio ADC bindings to DT schema.
---
Changes in v3:
- Unicode FEFF character was present in the begining of the file,
- Removed unicode character.
- Link to v2: https://lore.kernel.org/r/20251026-dtbs-v2-1-cd3b713a288e@gmail.com

Changes in v2:
- Fixes as per the reviews suggested for the v1.
- Link to v1: https://lore.kernel.org/r/20251021-dtbs-v1-1-493c1aa253bc@gmail.com
---
 .../devicetree/bindings/sound/pcm186x.txt          | 42 ---------------
 .../devicetree/bindings/sound/ti,pcm186x.yaml      | 61 ++++++++++++++++++++++
 2 files changed, 61 insertions(+), 42 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/pcm186x.txt b/Documentation/devicetree/bindings/sound/pcm186x.txt
deleted file mode 100644
index 1087f4855980..000000000000
--- a/Documentation/devicetree/bindings/sound/pcm186x.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Texas Instruments PCM186x Universal Audio ADC
-
-These devices support both I2C and SPI (configured with pin strapping
-on the board).
-
-Required properties:
-
- - compatible : "ti,pcm1862",
-                "ti,pcm1863",
-                "ti,pcm1864",
-                "ti,pcm1865"
-
- - reg : The I2C address of the device for I2C, the chip select
-         number for SPI.
-
- - avdd-supply: Analog core power supply (3.3v)
- - dvdd-supply: Digital core power supply
- - iovdd-supply: Digital IO power supply
-        See regulator/regulator.txt for more information
-
-CODEC input pins:
- * VINL1
- * VINR1
- * VINL2
- * VINR2
- * VINL3
- * VINR3
- * VINL4
- * VINR4
-
-The pins can be used in referring sound node's audio-routing property.
-
-Example:
-
-	pcm186x: audio-codec@4a {
-		compatible = "ti,pcm1865";
-		reg = <0x4a>;
-
-		avdd-supply = <&reg_3v3_analog>;
-		dvdd-supply = <&reg_3v3>;
-		iovdd-supply = <&reg_1v8>;
-	};
diff --git a/Documentation/devicetree/bindings/sound/ti,pcm186x.yaml b/Documentation/devicetree/bindings/sound/ti,pcm186x.yaml
new file mode 100644
index 000000000000..72a3e1dde0fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,pcm186x.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,pcm186x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments PCM186x Universal Audio ADC
+
+maintainers:
+  - Ranganath V N <vnranganath.20@gmail.com>
+
+description:
+  The Texas Instruments PCM186x family are multi-channel audio ADCs
+  that support both I2C and SPI control interfaces, selected by
+  pin strapping. These devices include on-chip programmable gain
+  amplifiers and support differential or single-ended analog inputs.
+
+properties:
+  compatible:
+    enum:
+      - ti,pcm1862
+      - ti,pcm1863
+      - ti,pcm1864
+      - ti,pcm1865
+
+  reg:
+    maxItems: 1
+
+  avdd-supply: true
+
+  dvdd-supply: true
+
+  iovdd-supply: true
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+  - dvdd-supply
+  - iovdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@4a {
+            compatible = "ti,pcm1865";
+            reg = <0x4a>;
+
+            avdd-supply = <&reg_3v3_analog>;
+            dvdd-supply = <&reg_3v3>;
+            iovdd-supply = <&reg_1v8>;
+        };
+    };

---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251021-dtbs-3a31f699c461

Best regards,
-- 
Ranganath V N <vnranganath.20@gmail.com>

