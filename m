Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825773328E5
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 06:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761807289; cv=none; b=NGOnaKURe/Hiku/4il2lmTf4sLkQWfxL+7xI2ogo4GBdWqfIoCs6rIvCrazdcxghlySj/evrmYjpXNsWV9Uh9IzAmiMz5fWzlKjcPo0T3JxFPE9oeukihK/oyBxl+ydSGoNVxfPXkM6h7wMwD33puhZWJwWSxKk/k2a0OV+KHUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761807289; c=relaxed/simple;
	bh=pmx0nurs79ki1NBxGeHHN/YIRDeLb81Jwt8NJP8HfBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M2x4GnYnE+vEmyjeieOVxUDMLGMezD9FqaAnKVPheFFcNZyPkLYjZYONk+3G4C5bwB3iTR62Sl8kB/tuN8hTI4j6Zh5msr/SSALrh6jvVohyWH/4R9rM5wsHuhBujYj0wWLUPYZWVLJ+c177Wit2ai/X3SjiKhFFkUR6RMFPhts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iC8Yfu1m; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iC8Yfu1m"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-33bdd2b3b77so128199a91.2
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 23:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761807287; x=1762412087; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hGlotEttnjbIACeN7dXLLDJ30vr8ASlUwkVHw6j0GwQ=;
        b=iC8Yfu1mH5JJEbIL3xnkZWeG+4KSn7ZesiOv40EV1mVj2EpFkdhW11zwAk4LalDO90
         cDRbaFXCYVJcrv0Mdt9Vlu0WtJAw7cyIxbS4dFaRKe68g5ZdpTuHiHrn+Oz5iDiL4q1D
         NPb9GJovUNMoXdu+BSqGKKbmlRxAx0/IR3k1vKsGiX88Ju3oBbMMnxDO1hYaM3uR/xXj
         /rKaC3ZAwWFf6QFHXKw4l6hh5JR6tyG6S4GQhDFr1O103Vh5J43d9tsGELqhyiz+nbWA
         oWhQ/pj3RLpDw8svjAkHefr3TLt1U14BZJ6BdvL3TC/r87cUbQnMhniLtDpKpFD9M5Gn
         XglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761807287; x=1762412087;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGlotEttnjbIACeN7dXLLDJ30vr8ASlUwkVHw6j0GwQ=;
        b=clHdX2+n1KrSA18ibr3ztFOFrvsfCd1jFFX/A3WQZ7Uy1ZhYP1sXpI7IlEmH7wRFrO
         OFqVNrtHV6NVsyoMTazNUahThVSmqnUiBV1xe9TXs+FoSSGeurJajjyx7Jo1F84ch0Lo
         rFCHth5xKGLymcYNwEMAC+JV61s8ZbiVCsbrtaP1XslQISyqpcX/wflsxIV+Rva3/9M8
         6ZGUM7JCw1k9yA1RKshCfX86+u5t4TkAP5IG+V7J6G2IW6J9tNGmp92iBbchnjsyOByf
         f9y0UEX4lXXE4nxxhu2Ceg1+Cd/DPIE0vB+tAMAyFaIbdEpcaQyJ6h2Y9JUpqf/n4ZtT
         SLQQ==
X-Gm-Message-State: AOJu0YxaxgyOpsHgBV6hyGNIJl0n9O8d/qZ2AfCICNEBvIASG/s4iu7O
	lcm9xjuAkIXGRQvdJ4N/AsH+SsxkzhFN1sdlxMnnZNdE06rY7Eqenfmu
X-Gm-Gg: ASbGncvQVC55dJ6ABIUgGoSm1UPTlRZefBR/WqefkukDOfiEr7zzhBbtC8CQOj/Kbal
	au7VLZOZSF8CFNlUoIJn6oF7FCYqDE3kQQCN8L0+TNllMc5Juk1mhI/u9siDPOgtsB61dcEt/04
	zKdt6bm989guHmudTvrlvR03ELA93nPogAk0hNLeyUhh11ab5pWahL/+oUxNapOlzW9rf2Y+bpY
	4sVrUs7+ouWG/zvQkIUTTotgMg5cnq/1O4PWoCSgUDQFHWFOT3XH5nl4qHPXdqW/NSEPtyOjU7D
	DBSTo6XkSn4iuZ5QSculVqIkvJHxR+9RRn4XjdVQ2TTbHJiwqu0QHHz6f0hDIDMv/S2jjqMN0Dm
	+5JM8LiKgna7t/Mw1QlA2Ops+HQJtGqmzJXbGZd14HDM9jAE1c1G6HHVcAazVDIAmUbqzJvLe3r
	rtL1DqSfNvllWxP0BKftdory9fi48CSOL7qvXQSIIUe6itEpObLD+VAZDi1m+BqEo=
X-Google-Smtp-Source: AGHT+IG9OA3qsogtmkvIU4R1MP2hkyCeHbgqs/ev0H2tjRcnChJLoNlY+IE3QTZqZp/Mb2SCb/FtDQ==
X-Received: by 2002:a17:90b:384d:b0:33d:ad3d:1a6f with SMTP id 98e67ed59e1d1-3403a3058a4mr3408683a91.8.1761807286514;
        Wed, 29 Oct 2025 23:54:46 -0700 (PDT)
Received: from [127.0.1.1] ([2406:7400:10c:5702:ef45:c60f:9d38:fa84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340509894c9sm1379138a91.7.2025.10.29.23.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 23:54:46 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
Date: Thu, 30 Oct 2025 12:24:30 +0530
Subject: [PATCH v4] Asoc: dt_bindings: ti,pcm186x: convert to dtschema
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-dtbs-v4-1-3fff32221119@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKYLA2kC/13MQQqDMBCF4atI1k1xZjTVrnqP0kUcowaqlkRCi
 3j3RnEhLt8w3z8Lb5w1XtyTWTgTrLfjEEd2SQR3emiNtHXcAlPMIUWQ9VR5SZqgUWXJmQIRXz/
 ONPa7ZZ6vuDvrp9H9tmqA9XoKBJAgs5IYtMacKn60vbbvK4+9WAMBj0jtCCPimqobkMaiMGdER
 1TuiCIiZlCICIx4RMuy/AH2DN07AgEAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
 david.hunter.linux@gmail.com, khalid@kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 Ranganath V N <vnranganath.20@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761807282; l=4119;
 i=vnranganath.20@gmail.com; s=20250816; h=from:subject:message-id;
 bh=pmx0nurs79ki1NBxGeHHN/YIRDeLb81Jwt8NJP8HfBc=;
 b=5inaXHj5dX/tUKwdXhQ3ZDbt889TpyNXOeWQEWHjGVrGHqCJjqvkW6aWeO8aYy8ykJVpoEdiG
 idXfkURS9RvDPhSgAZ+0UUoHPvc0BHT9sFV7AUgjnZkGosHQkzXFhu9
X-Developer-Key: i=vnranganath.20@gmail.com; a=ed25519;
 pk=7mxHFYWOcIJ5Ls8etzgLkcB0M8/hxmOh8pH6Mce5Z1A=

convert the Texas Instruments PCM186x Universal audio ADC bindings
to DT schema.

Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
---
Convert the Texas Instruments PCM186x audio ADC bindings to DT schema.
---
Changes in v4:
- Corrected subject dt_bindings:sound to Asoc: dt_bindings:
- Corrected the filename to match one of the compitables in the file 
- ti,pcm186x.yaml to ti,pcm1862.yaml
- Link to v3: https://lore.kernel.org/r/20251029-dtbs-v3-1-3cc162221c22@gmail.com

Changes in v3:
- Unicode FEFF character was present in the begining of the file,
- Removed unicode character.
- Link to v2: https://lore.kernel.org/r/20251026-dtbs-v2-1-cd3b713a288e@gmail.com

Changes in v2:
- Fixes as per the reviews suggested for the v1.
- Link to v1: https://lore.kernel.org/r/20251021-dtbs-v1-1-493c1aa253bc@gmail.com
---
 .../devicetree/bindings/sound/pcm186x.txt          | 42 ---------------
 .../devicetree/bindings/sound/ti,pcm1862.yaml      | 61 ++++++++++++++++++++++
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
diff --git a/Documentation/devicetree/bindings/sound/ti,pcm1862.yaml b/Documentation/devicetree/bindings/sound/ti,pcm1862.yaml
new file mode 100644
index 000000000000..72a3e1dde0fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,pcm1862.yaml
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

