Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BB642F6E2
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 23:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577654; cv=none; b=jdaVQVFN/de9CJz20knIa2AU04hxhPAlfZ/OfE0/xKHU4P0Z5x+vHXJB+wA9bWUCdzl4XjjJomKtUvnI4ucZVYKpeBoa+x1NqWMmr4qxTAF5AOUCwrQJX20xU/8UaLeb2y4KA8mwCTC8dmTfOrcgwuZbSZmcckXM5rBEKPWyPCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577654; c=relaxed/simple;
	bh=w/lCd6qn3Hrwin2/vnUaZ/GRD/83ygGyKQqz4MLsBzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WebndNkqVHPY6v+BsUa7SXjS2uwdM/9zbS+ZDlMsHFm6X0f2HarN7JQHQT3X0Gv9GT0gHWQ913DQRKoQ9yG3El4v5jCkIlcIINN0gid2QLfpxElMlhLb0umlYciYAhIHBxJy6CToDD5ejVLpd0vO7ropsk8nL/74/oXmJZl439E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKkv/NKm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKkv/NKm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf420670bbso3533385ad.1
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 16:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786577652; x=1787182452; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=82QII3KyVeRLbaNgl494ewZidWlIsFgxntjdTI9bZc0=;
        b=PKkv/NKmLGGiGMxdzAEyU6d0/cOkju5zNnInlXCscjSom3Hq8jlKHLjta5l/1bJExu
         djPV2HIMqUCbkbWnHSxXoZt3ugryLApO+Qp6ar6xEf1ijYtr8Ys4hDrXa/o4Zfi+BRub
         F1VmMMl8QOOYPmAQ0D5cZV2MWkhUvQ3JYeWMqbNWOKAVSlaOq5+40BGWhL3/d0SUK9Wl
         1rQ7zjfcLedbGR0ZR67IMxdZsiINbXiVh1miAH13XTK0//KSGb/3iDr33uzkypykDOuP
         6HhKrxuJqRb9/6kgklPfiqzA1zfDRniouL6Vh3UnoLqFlpaSnD1/Dcja81KNbtBNMn84
         9wLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577652; x=1787182452;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=82QII3KyVeRLbaNgl494ewZidWlIsFgxntjdTI9bZc0=;
        b=lvIvdJPSYzi9nS8fNacK4ZP6vFLfPl0iB09MOX2pdUUt3e5zbZK564DZDxJZRMKEdW
         7LsDV6QZSrO5LFYdGdfowCAaVq3QnmJrAmcKZGuhP5fa+5Xwecx2+kenNyn7NhRsg4bn
         2f3q21rji/yJFmN8WKpwB40pWbfpDXvaNQSTQzluKQxSPhH3scWc3GVP2ZrLbwFVhNTv
         7i2emL1NZiFisxZi+h7huhpUoNTMbLk3PtxLGZvf3h6PiOzhn2pJqe9T+BriX40QIGh6
         4bpA0v9T1i6nSWBDjxuwVpJ6YhwpH2NL3cUOgjCrGP+uuW10iEgQci9tLnvS4cC/9L1l
         RuQw==
X-Gm-Message-State: AOJu0YyUaksJOCKjLAtEhHBMNYEte8oMpiuBjYK1NU1xSbc5rQ7MvpOZ
	RxqUvt7kqL6NBV99ipYWzA/zg7JnEjwJIkEGDvcVHwHBYlROZoO1hNfI
X-Gm-Gg: AR+sD1093tb3/ry1LSSjdhipYlEjm99DXi1TRQJxekL2j4kMjtsS97792DVt50ehdKd
	qKN6116IRO2oLx9OlJcdNYKGcZdyyYcR6gqMZvhUWVKlpZu8zPCP1bQK7G+g2+rDEMzdTx2AVE6
	+XZjHDv6siG4Pz2Wolb7JqTRu9gf6bll68Iun5G3vk7XxgE1DQoCDa5aQI6Y1wPzHxfWsg974Av
	CWviz/ELkqGEKz17zVP1fa75G1xYN8Wlh20r1Uwtel82MA8pldraTQwE15GeDvMxj+ZPVqHJdC0
	cKgVdxhe3b0EsROJuEesV1MIT9Q9rlJbQ0s+6CMTHNwNWGg5swvHJzQRjRceQD/edCK2Dlpmr78
	0aWfxCVQvuLjiAeQqdSKDPDvuib8yRHAlpoqNfQP3dcWUFTy2F10lKAObI/+auRf+QySofxBhlF
	La2Qvb8BRxncftxm+Vx504wgPDUROQ3seOrw0zAzwbrAv9ChfkTmSUF7bj9b6laTgSjQmsxw==
X-Received: by 2002:a17:902:fc46:b0:2cf:9e90:8be with SMTP id d9443c01a7336-2d37efb393emr12908425ad.4.1786577651676;
        Wed, 12 Aug 2026 16:34:11 -0700 (PDT)
Received: from [10.219.45.252] ([2409:40c2:504e:6b:b46f:70e9:d340:f24c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebcb697fcsm796068eec.8.2026.08.12.16.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:34:11 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 13 Aug 2026 05:03:54 +0530
Subject: [PATCH] ASoC: dt-bindings: tse850: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-ti-axtensia-v1-1-768a1089fd5f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Nj3ZJM3cSKktS84sxEXVPLZAuLJNM0gzRDcyWgjoKi1LTMCrBp0bG
 1tQD5nbBpXQAAAA==
X-Change-ID: 20260813-ti-axtensia-59c88b5f0f17
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andrei Simion <andrei.simion@microchip.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@lysator.liu.se>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786577640; l=7180;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=w/lCd6qn3Hrwin2/vnUaZ/GRD/83ygGyKQqz4MLsBzM=;
 b=PKPV3dZDD1Z4tcxL7fjXXNmqWj1tY/x98aXY/bW29LOwsvV094cdQkf1WAMEbrVmaUDqVVe1f
 AciDpIawfl5DRpmzpze1ZOjZ9rOhLTDctuuVZMw8P6Y6uFABYKYeAI1
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Axentia TSE-850 audio complex from text to DT schema. No
funcational changes.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../bindings/sound/axentia,tse850-pcm5142.txt      |  92 ------------------
 .../bindings/sound/axentia,tse850-pcm5142.yaml     | 104 +++++++++++++++++++++
 2 files changed, 104 insertions(+), 92 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.txt b/Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.txt
deleted file mode 100644
index b6cc5f6f78c2..000000000000
--- a/Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.txt
+++ /dev/null
@@ -1,92 +0,0 @@
-Devicetree bindings for the Axentia TSE-850 audio complex
-
-Required properties:
-  - compatible: "axentia,tse850-pcm5142"
-  - axentia,cpu-dai: The phandle of the cpu dai.
-  - axentia,audio-codec: The phandle of the PCM5142 codec.
-  - axentia,add-gpios: gpio specifier that controls the mixer.
-  - axentia,loop1-gpios: gpio specifier that controls loop relays on channel 1.
-  - axentia,loop2-gpios: gpio specifier that controls loop relays on channel 2.
-  - axentia,ana-supply: Regulator that supplies the output amplifier. Must
-    support voltages in the 2V - 20V range, in 1V steps.
-
-The schematics explaining the gpios are as follows:
-
-               loop1 relays
-   IN1 +---o  +------------+  o---+ OUT1
-            \                /
-             +              +
-             |   /          |
-             +--o  +--.     |
-             |  add   |     |
-             |        V     |
-             |      .---.   |
-   DAC +----------->|Sum|---+
-             |      '---'   |
-             |              |
-             +              +
-
-   IN2 +---o--+------------+--o---+ OUT2
-               loop2 relays
-
-The 'loop1' gpio pin controls two relays, which are either in loop position,
-meaning that input and output are directly connected, or they are in mixer
-position, meaning that the signal is passed through the 'Sum' mixer. Similarly
-for 'loop2'.
-
-In the above, the 'loop1' relays are inactive, thus feeding IN1 to the mixer
-(if 'add' is active) and feeding the mixer output to OUT1. The 'loop2' relays
-are active, short-cutting the TSE-850 from channel 2. IN1, IN2, OUT1 and OUT2
-are TSE-850 connectors and DAC is the PCB name of the (filtered) output from
-the PCM5142 codec.
-
-Example:
-
-	&ssc0 {
-		#sound-dai-cells = <0>;
-
-	};
-
-	&i2c {
-		codec: pcm5142@4c {
-			compatible = "ti,pcm5142";
-
-			reg = <0x4c>;
-
-			AVDD-supply = <&reg_3v3>;
-			DVDD-supply = <&reg_3v3>;
-			CPVDD-supply = <&reg_3v3>;
-
-			clocks = <&sck>;
-
-			pll-in = <3>;
-			pll-out = <6>;
-		};
-	};
-
-	ana: ana-reg {
-		compatible = "pwm-regulator";
-
-		regulator-name = "ANA";
-
-		pwms = <&pwm0 2 1000 PWM_POLARITY_INVERTED>;
-		pwm-dutycycle-unit = <1000>;
-		pwm-dutycycle-range = <100 1000>;
-
-		regulator-min-microvolt = <2000000>;
-		regulator-max-microvolt = <20000000>;
-		regulator-ramp-delay = <1000>;
-	};
-
-	sound {
-		compatible = "axentia,tse850-pcm5142";
-
-		axentia,cpu-dai = <&ssc0>;
-		axentia,audio-codec = <&codec>;
-
-		axentia,add-gpios = <&pioA 8 GPIO_ACTIVE_LOW>;
-		axentia,loop1-gpios = <&pioA 10 GPIO_ACTIVE_LOW>;
-		axentia,loop2-gpios = <&pioA 11 GPIO_ACTIVE_LOW>;
-
-		axentia,ana-supply = <&ana>;
-	};
diff --git a/Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.yaml b/Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.yaml
new file mode 100644
index 000000000000..0ab4b697d28e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/axentia,tse850-pcm5142.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axentia TSE-850 audio complex
+
+maintainers:
+  - Peter Rosin <peda@axentia.se>
+
+description: |
+  The TSE-850 is an FM Transmitter Station Equipment, designed to generate
+  baseband signals for FM, mainly the DARC subcarrier, but other signals
+  are also possible.
+
+  The schematics explaining the gpios are as follows::
+
+                 loop1 relays
+     IN1 +---o  +------------+  o---+ OUT1
+              \                /
+               +              +
+               |   /          |
+               +--o  +--.     |
+               |  add   |     |
+               |        V     |
+               |      .---.   |
+     DAC +----------->|Sum|---+
+               |      '---'   |
+               |              |
+               +              +
+     IN2 +---o--+------------+--o---+ OUT2
+                 loop2 relays
+
+  The 'loop1' gpio pin controls two relays, which are either in loop
+  position, meaning that input and output are directly connected, or
+  they are in mixer position, meaning that the signal is passed through
+  the 'Sum' mixer. Similarly for 'loop2'.
+
+  In the above, the 'loop1' relays are inactive, thus feeding IN1 to the
+  mixer (if 'add' is active) and feeding the mixer output to OUT1. The
+  'loop2' relays are active, short-cutting the TSE-850 from channel 2.
+  IN1, IN2, OUT1 and OUT2 are TSE-850 connectors and DAC is the PCB name
+  of the (filtered) output from the PCM5142 codec.
+
+properties:
+  compatible:
+    const: axentia,tse850-pcm5142
+
+  axentia,cpu-dai:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the cpu dai.
+
+  axentia,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the PCM5142 codec.
+
+  axentia,add-gpios:
+    maxItems: 1
+    description:
+      gpio specifier that controls the mixer.
+
+  axentia,loop1-gpios:
+    maxItems: 1
+    description:
+      gpio specifier that controls loop relays on channel 1.
+
+  axentia,loop2-gpios:
+    maxItems: 1
+    description:
+      gpio specifier that controls loop relays on channel 2.
+
+  axentia,ana-supply:
+    description:
+      Regulator that supplies the output amplifier. Must support voltages in
+      the 2V - 20V range, in 1V steps.
+
+required:
+  - compatible
+  - axentia,cpu-dai
+  - axentia,audio-codec
+  - axentia,add-gpios
+  - axentia,loop1-gpios
+  - axentia,loop2-gpios
+  - axentia,ana-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/pwm/pwm.h>
+
+    sound {
+        compatible = "axentia,tse850-pcm5142";
+        axentia,cpu-dai = <&ssc0>;
+        axentia,audio-codec = <&codec>;
+        axentia,add-gpios = <&pioA 8 GPIO_ACTIVE_LOW>;
+        axentia,loop1-gpios = <&pioA 10 GPIO_ACTIVE_LOW>;
+        axentia,loop2-gpios = <&pioA 11 GPIO_ACTIVE_LOW>;
+        axentia,ana-supply = <&regulator_ana>;
+    };

---
base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
change-id: 20260813-ti-axtensia-59c88b5f0f17

Best regards,
-- 
Bhargav

