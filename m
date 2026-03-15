Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357DD37BE84
	for <linux-sound@vger.kernel.org>; Sun, 15 Mar 2026 21:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773611697; cv=none; b=PPxAfaikanlBHU0dRswo+1kCJ5uIZTs0LTXn1eQdhEUEgVHj2WSrN/jXKVflfDgcMslnhqB3BiCyjrN8KQkzlSCa6UtMC2VIuDwj6HHiU9BzDUgNy0/rWhaUsh0WpGJ2lBs65VPOK/zLTZx4y7PtNmacKLjUZlXlzoPd1WcD3hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773611697; c=relaxed/simple;
	bh=ZHyFZQHqWgam1NdfpOD11Poa3CjAieCq6kZVddSJ+8A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=If+3SnghIEO+XH+pfs7Zm1wooHb79LqV7tw8nd6QId8tYI2UDvJ/jxaoG7iyEHMk/lif6a907CqQT255la7qI2NqA3S6DOjWxF2k/DKq3Nh70Ghp/iDLatIMyUx7A5OwBalG4oknoGXrL+5Xin4oZNGLsar6x2a3wvDL3/qTH2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k06V33/7; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k06V33/7"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82a072db915so3334079b3a.2
        for <linux-sound@vger.kernel.org>; Sun, 15 Mar 2026 14:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773611696; x=1774216496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r1/aL+GcrcXe4rkRjHz6Qdgy5d873vnDywLVzNx1zBs=;
        b=k06V33/7CHwvSPwlT03eNcysWnq2+pZMw0VortYlR/8/X+pjNX51YMBxSXlzFo2Qev
         FiDKqIPSie+MX+K6roA/yQT4RgrzXe9wixJdt0qsadywFOEK0PkV3SR5wKq7fk98XC1n
         mhSXJ0bprs5wFa6W8JMLAByLWeNfZWO3x+Ojvyfe173XTFviqFDxYDDMblRQH0Mavs9R
         ayTRsuq+7bHwXunBj14/sfJKg389TkQPx4fSScJo04CsqiSdPmnf0Y8x1+rwlL2CFUC9
         ro1kclq43fHjDZjSzwFVP+MvLdM2fuWE7J2r2jEbxMQ5lE1gzpkZ+VB274HG5DZGxNd0
         9lOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773611696; x=1774216496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1/aL+GcrcXe4rkRjHz6Qdgy5d873vnDywLVzNx1zBs=;
        b=IhgV4bHvaEyYpbTNvGvPz/CY/3ogmERYszuVsQ8z17vgZ6MEG3266ilOD8fHEg247f
         cW2m4mqCRJ3YSA3kaTKjGCW9Bb9SsJ1pg3e+RSI2weSTYhPVQYgL8KK6ZzHPmgDuaiSg
         ImoScpbgv7hMKTyc+i1nZTmy3v8zAc9rSh2oy8UwmgkHZutyIp3I9RsGuAuaeikWgu3U
         oVx7OyZzj6mStQOw6ovW4G8ZklmEytlCFyDxUmNatBRIT1Wdtl69XslVpW34SgiSaB80
         R6nVN7OmGTV1bQbnCG6rOTAwvfORalrDInOcpjY84hVCpLJ6MEycHWYhpC06RQQW9m0V
         9RDg==
X-Forwarded-Encrypted: i=1; AJvYcCWjK2Lh7zXpuBeYypbD/1JH3HOtA1A15OigKdgf7a9MqUKor3N1mi5qAjMG3aI4s93qVnOKBJv9RWA52A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/1UmDucKJVeAOVoUlYQvi2LY9ZS25P0DXqeIMxMwJhGM371w1
	75M7aSCFoEQJONG4KiymGDawvAhNEwysGL3qUHPZf+Jhrdyfhe4JgVGCCTZ5IHrY
X-Gm-Gg: ATEYQzy0xCOb1QTH6jLjm0f+RwOMFrXIPQJ8gW4ayc2RxnKJd9ojdFkUyudYG7CDv2G
	/t5ul1ZOUHY9PnL8hVa6gNVtrtyMkzy4bjEUGw4dlCTjC8k0JJjpvbi3ZoBxGhGKQg6XuN/1cvM
	Gu0pQIkjmWYjYbhi1R0vajXGMxPAdMimxoOxEgeZ80dB/5+6JTomCT0zaYfDKVTXqVsC2RF20gs
	CcogxNwn863iYJ3HnAYc29CdzoJZ31NNMReMHhFiN1L4ltHSNTsfqwyr6sbsEfZUb44T2j3SQUv
	saQEsiAa73MncrQaTWFgirdyeHoLUgJDX53akueCcvHBmV/DiYsBfTkmJbdf6et2boUBBKg7yKf
	bp6vaV1MfkmtvkvVt8Mt3H3UFnlcwlRYZHz4GB/0xaUmosqv0RDXO7PN5tzgWARAj3FVyp4fJYS
	j9wHhOagFbdaEHKUj977nL0lUhMGly7hsof2KhxJnw49khRqGH7TUc6Ps9EGKJDLkLRLtoHbvo4
	tKD9oJBHcgxetI9lMkKgUYZJJslhIe/Sm1c
X-Received: by 2002:a05:6a00:a04:b0:81f:994f:cb with SMTP id d2e1a72fcca58-82a19716f8fmr10117321b3a.24.1773611695607;
        Sun, 15 Mar 2026 14:54:55 -0700 (PDT)
Received: from lorddaniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:962:a48e:8021:2c05])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07244071sm11782298b3a.6.2026.03.15.14.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 14:54:55 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: sound: adi,ssm2305: Convert to DT schema
Date: Mon, 16 Mar 2026 03:24:47 +0530
Message-Id: <20260315215447.276886-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the SSM2305 speaker amplifier binding from text format to
YAML schema to enable dtbs_check validation.

Remove the legacy text binding.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
 .../devicetree/bindings/sound/adi,ssm2305.txt | 14 ------
 .../bindings/sound/adi,ssm2305.yaml           | 46 +++++++++++++++++++
 2 files changed, 46 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/adi,ssm2305.txt
 create mode 100644 Documentation/devicetree/bindings/sound/adi,ssm2305.yaml

diff --git a/Documentation/devicetree/bindings/sound/adi,ssm2305.txt b/Documentation/devicetree/bindings/sound/adi,ssm2305.txt
deleted file mode 100644
index a9c9d83c8a30..000000000000
--- a/Documentation/devicetree/bindings/sound/adi,ssm2305.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Analog Devices SSM2305 Speaker Amplifier
-========================================
-
-Required properties:
-  - compatible : "adi,ssm2305"
-  - shutdown-gpios : The gpio connected to the shutdown pin.
-                     The gpio signal is ACTIVE_LOW.
-
-Example:
-
-ssm2305: analog-amplifier {
-	compatible = "adi,ssm2305";
-	shutdown-gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
-};
diff --git a/Documentation/devicetree/bindings/sound/adi,ssm2305.yaml b/Documentation/devicetree/bindings/sound/adi,ssm2305.yaml
new file mode 100644
index 000000000000..b841da2dc284
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/adi,ssm2305.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/adi,ssm2305.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices SSM2305 Class-D Speaker Amplifier
+
+maintainers:
+  - Lars-Peter Clausen <lars@metafoo.de>
+
+description:
+  The SSM2305 is a filterless, high efficiency, mono 2.8 W Class-D
+  audio amplifier with a micropower shutdown mode controlled via a
+  dedicated active-low GPIO pin.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: adi,ssm2305
+
+  shutdown-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the shutdown pin (SD) of the SSM2305.
+      The pin is active-low; asserting it puts the device into
+      micropower shutdown mode.
+
+required:
+  - compatible
+  - shutdown-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    analog-amplifier {
+        compatible = "adi,ssm2305";
+        shutdown-gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
+    };
+
+...
-- 
2.34.1

