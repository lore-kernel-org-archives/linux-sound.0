Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB512382285
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 18:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774550302; cv=none; b=otm8MIosyGqywxO6TozxmBgHXfgtG1w/+EZD3HtIKTXT1Lfcg6JhEUHuCsyWuGu3zbhqb78Vco+qwMB9GD6R9cAXOmLO3FIbiGQuDa9aRVgxT8IbUL3vpNr45GlLZ8hXpFj3fzNaGBusOGpnBNhVHg5y48lkW/eejIzRhof3Ppw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774550302; c=relaxed/simple;
	bh=aB4CNW0exvmw3n8TwyU2vVZfOExsUbeZNUie+PL3Vh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dfcTcdNN89ac1GUjTmU8NbnClOVRlAWNkJxKZWBTFmP1K1ByqLVAQuo9Zc3lxcuaKqkCUWrEwzuH2kb4u5QSgkXSivvgozB66/NN+rLj3p4UrfkfIvlMgihuSDtO11QA3tLiyzUvh/o9F6rtwOyailASse0gSIbui5xbT3C58nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQnF4Gnc; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQnF4Gnc"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82ae378fff8so903508b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 11:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774550300; x=1775155100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7oiN7Yy7Qxs4sWHwlcPw/bXT9Anfd8Nbb6kyzbKKQkA=;
        b=jQnF4GncqRfyKG9KM/ZsEqpCRpSpOoVARrbQegzhMua5jh2ylFG/mPMFv38fIydUKD
         JHNMeev9peIdOrdFSsuBv3cxKNuBSts5FU2p+5STihbbCDSE4qYsvsWmvdBTQTlLbtBa
         nhwYuvHahxuHvyHF/p6Ox35+9irPtCi4vs58/xZZQN7Ngzna06iIBVWH9y6VLEi3Mdjj
         /SePz0CK2vRR50ynUblmxAXxP0dGlcxPxKoxOR0XBTknwMzBkrQyiGrWXq00kAl0G5BG
         zLXjl4+1Sn26unZ8t2m9bPf0bj167zI/e/jLAiuxjMc6BmA0ltbVogIdkxryttihN8j4
         g0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774550300; x=1775155100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oiN7Yy7Qxs4sWHwlcPw/bXT9Anfd8Nbb6kyzbKKQkA=;
        b=aXC2p6it7jyyT2OFI7l86cx3OB+R/ZzJ5D+ZJEyqEFg3mO8VGCSBfqljMh+k7jDVxD
         QgZ1kKbBid+owRP85tTWLKvWzOZJEmKtshPjkE78jqf0CGV5BrWHzFbLl+I5BzgPXqv6
         GXNonwXnoK1/Fm71EI1LWwrZo76zK7jqmhBW/kkRiTecTMR8xN2cIF933bx+CsHp+Zk+
         8kFlAG8oX3lhY23eHIckmg/yDnCNxLw/sP1JYD+5JqJNKQwsRWvwd4ItYUkqWOUhkP0d
         zU9mCBRsVdBU4eRw+RlURo1Q2539G6kO8cSnJ+pGzjrSNUrbGFGmwUcojHvbeFNlpE47
         VQhw==
X-Forwarded-Encrypted: i=1; AJvYcCW2ot/LRR6wsSMP/HHNuodFwIrHIdiVqGCII9SLns61EW8gtcQiFjpzbpLfI7ezF6O6J38g7ds8RhMABA==@vger.kernel.org
X-Gm-Message-State: AOJu0YycGAHd0Mr/MIBi9WEfzHWzsnnXxtSuyW4I1NOjrpKL1iQhD5xD
	OhYUkv3RM/tVT9XuvF4EQn/e4RcserO2ENhe/SEERnszvZv67OhH7jQO
X-Gm-Gg: ATEYQzyLw/5+LT6SWL4ZkR3ciHwOo7OO+6u8Xaaz40qqbRYiAN7qSKIiQzazLWtugcu
	0w48LEATxZ7ELj1xTjBYPoFfdNAy1Ho2GohNs/9QJnKyqGMwaHLm19v8rZUwbYKia0xr13B+GRC
	OZVDmtJOIR5kT2l8rYOILZ/yk1uRFI9dNmpiAhcZT7Asm6e1N0vfu8Z6VOF8OyvNGqQhUFyF100
	9u27k5XSonBlwAp1aZnE104fAFzFcghW8/T7hDmilAT+14Pcjy6SET1aLxLkmxXo/FtcDGYCpwU
	yO9SwJHP0Tj/IVMpgKEVJshRuUgIDFAQrIPHVYPe/hnAttt4KnnlWP+901TSI3hMViBZ+zKB7B+
	WmA1p2096ex4hgYXQZ0pjOvV5AxsIEVCHoatOUkIJvIPw1ulc6aVaqh8+TUgwTB1FaOxPbs8h3F
	C3iz5sBtllv+ENJZf/jGZE8Wd8KNJhjt/nc+4+df3pjb61rD61
X-Received: by 2002:a05:6a00:3e1c:b0:82a:6ef8:cb43 with SMTP id d2e1a72fcca58-82c6ded85d7mr8921857b3a.19.1774550299986;
        Thu, 26 Mar 2026 11:38:19 -0700 (PDT)
Received: from padmashree.. ([2401:4900:94ef:3410:58df:a970:79c4:10c7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d390a4csm4211314b3a.31.2026.03.26.11.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:38:19 -0700 (PDT)
From: Padmashree S S <padmashreess2006@gmail.com>
To: k.marinushkin@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Padmashree S S <padmashreess2006@gmail.com>
Subject: [PATCH v2] dt-bindings: sound: Convert pcm3060 to DT schema
Date: Fri, 27 Mar 2026 00:07:47 +0530
Message-ID: <20260326183747.528754-1-padmashreess2006@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
---
 .../devicetree/bindings/sound/pcm3060.txt     | 23 ----------
 .../devicetree/bindings/sound/pcm3060.yaml    | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/pcm3060.txt
 create mode 100644 Documentation/devicetree/bindings/sound/pcm3060.yaml

diff --git a/Documentation/devicetree/bindings/sound/pcm3060.txt b/Documentation/devicetree/bindings/sound/pcm3060.txt
deleted file mode 100644
index 97de66932d44..000000000000
--- a/Documentation/devicetree/bindings/sound/pcm3060.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-PCM3060 audio CODEC
-
-This driver supports both I2C and SPI.
-
-Required properties:
-
-- compatible: "ti,pcm3060"
-
-- reg : the I2C address of the device for I2C, the chip select
-        number for SPI.
-
-Optional properties:
-
-- ti,out-single-ended: "true" if output is single-ended;
-                       "false" or not specified if output is differential.
-
-Examples:
-
-	pcm3060: pcm3060@46 {
-		 compatible = "ti,pcm3060";
-		 reg = <0x46>;
-		 ti,out-single-ended = "true";
-	};
diff --git a/Documentation/devicetree/bindings/sound/pcm3060.yaml b/Documentation/devicetree/bindings/sound/pcm3060.yaml
new file mode 100644
index 000000000000..ceb6f044b196
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/pcm3060.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/pcm3060.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PCM3060 audio CODEC
+
+maintainers:
+  - Kirill Marinushkin <k.marinushkin@gmail.com>
+
+properties:
+  compatible:
+    const: ti,pcm3060
+
+  reg:
+    maxItems: 1
+    description: |
+      The I2C address of the device
+      or SPI chip select number.
+
+  ti,out-single-ended:
+    type: boolean
+    description: |
+      If present, the output is single-ended.
+      If absent, the output is differential.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pcm3060: audio-codec@46 {
+        compatible = "ti,pcm3060";
+        reg = <0x46>;
+        ti,out-single-ended;
+      };
+    };
-- 
2.43.0

