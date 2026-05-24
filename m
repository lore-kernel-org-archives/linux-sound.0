Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A6279DCA
	for <linux-sound@vger.kernel.org>; Sun, 24 May 2026 16:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779638532; cv=none; b=YyBoY35R+/TjGFvSVRoJeEs/3Yi+h3ilw/5tmEOvakqtLm/8tD3/inHQ+cSSbxmAhETRTwvmQA2LKt08Rx2ezqeVngt+I+1+gCdAWwUCwdFM46QpZf4cylDbpvMmTqYK1e4JyU/KMiJA9CHesFQemd0NvJ79seUufnCt0GocDgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779638532; c=relaxed/simple;
	bh=/2FowBmTffQSv3oYiUq4wpxtR5RlTC/ynBBcs2MAq7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pOXkPOlRjdwjKwihE/fUegllVXkRrsDzPQPJFLgCUIayopWycFImpzuf8sQElf9DB4iO39GEV1ewJ3U2ztbfpZAOAAaYQebjzWlIqeyZMoIyH32VukO/o20kQMwPL1xOQrTb4CuZRy5r1ySLYksPj/KJ89P5t2PrdI1oUUUwh6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IREI6N8g; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IREI6N8g"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-83975e992e1so3464004b3a.2
        for <linux-sound@vger.kernel.org>; Sun, 24 May 2026 09:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779638529; x=1780243329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o9VbgS0e1D8hUKDDSe/YNkcF3i1Zf23UEsIw2M9+xHI=;
        b=IREI6N8gMrmxKQ0AxJM2yz4R+2fMipRgkdeaFqgRiLQBVAdXqg4u8PJbr9L1c2kBho
         chHY6+vw8j/e3rYWijmBVuioUQ9Ofl0U+lc7ZKwYoeBT7y4lQ9+7er5cpYDAcqNZWDq1
         Iu0gZVPJ34xm/D8s3873oFeS/h2csujJgzbSTC2Vjq5gEqSTsTkurIHHXGNnuJFqsiF+
         lFFjagDWGV1j+4sPPCIzW5fHecMcJkt+dMdQF2MOGM0L+WeHjcS4IOVsWio/uFb5qFPC
         CJWD31sUkauNZtmaPSYjvO0Oc0b5sSgMyD2LZVXz9joy1R2FKGV3mNfur2ypfx0iT53j
         Uobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779638529; x=1780243329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9VbgS0e1D8hUKDDSe/YNkcF3i1Zf23UEsIw2M9+xHI=;
        b=WZwniaIcumZYmFlGKmoZjf5/UJZuqknpntUkLp1GySIp2ibnRKWDyK9HrmY2I77Fy6
         udwL529RdUruqbarGyySMFjf7FcyDRuHKXBO3DejQ9xQ1ZM2DbdSBLjE8HvUZ13Mp/T0
         mUBu0i3LmVz+yG+BHrBKGmTTPRTFAddC+ZCV2ugVzA2dklfiCP9ciYmqYJZWPEm9BQ7h
         gdTt5MGgh+3SmHiNQi+6nEXWjAjIepHC2mhUMeifZQm4CM+HCsvD6Jh80Dd+pphCepSb
         EYTAg2qt1BIZCQ38axIDgycd80YO9T1nSUhQieqcj1J6Zv4i1WgQpVhKhTLF+AP/Aa+k
         E/6g==
X-Gm-Message-State: AOJu0YyChsF+RV9s0FVkLGtx88jGCTS7gfQ7Z73nwGeWHSjHDN6SkTFW
	9PNOE2ddHKocJH+e3JG4wgLPxw1nOE8LtJMLEqvBlKLrJzA6MgQswwHY
X-Gm-Gg: Acq92OEqCmz1uK7pqouE3EyzcAPO07XbdH8cmALi2Kx1tgunTfGM4Pz9CLShYrKzAjQ
	gz6aGmvuFyPd0rDUpVs6/mzyT4XJsC2DjmjUTL9CE/SJD7MZEvAn7N8qg+fiM31l4f9ot65kDot
	ihl+AHUR5/AF1JWDC2TKc0HnQch++BbTFGK49cvDPsIciEzxN2Reb96t0PhWIAZgwPUnN1laae3
	J3JK6kHUS4Sso0v+tl6DMlx0SY6TKO3pJuu3CzAwi/g0DTvEB9EI8oGqLNVmP5NE6ipXIeLCMYq
	V5jD3yW4h19mzJhmbTLC0kYI/kEBgjj9oxAMXAN5K37nljiCKPU8s/nfogBDtH7oidbcZprqfIs
	8YGLoq6H6cmp7dLHpysv7QZC7DPFSnDD/XHw4HG4VlyGLHX9zM59GndSgXxnmk/K2LNuOL9loKk
	C6M4rVrn0NVd3om3wR+O/n5R48AbDeCd8+zAPk/gD1PUXzqvSolETn27DnRt4X/8vjv+A=
X-Received: by 2002:a05:6a00:138c:b0:83a:a55f:c3f9 with SMTP id d2e1a72fcca58-8415f376933mr10139833b3a.20.1779638529093;
        Sun, 24 May 2026 09:02:09 -0700 (PDT)
Received: from Ubuntu.. ([49.37.169.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea09a9sm8128372b3a.31.2026.05.24.09.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 09:02:07 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	zonque@gmail.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [PATCH] ASoC: dt-bindings: sound: asahi-kasei,ak5386: Convert DT schema
Date: Sun, 24 May 2026 16:01:58 +0000
Message-ID: <20260524160158.109983-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Asahi Kasei AK5386 ADC binding from text format
to YAML schema.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 .../devicetree/bindings/sound/ak5386.txt      | 23 ----------
 .../bindings/sound/asahi-kasei,ak5386.yaml    | 44 +++++++++++++++++++
 2 files changed, 44 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ak5386.txt
 create mode 100644 Documentation/devicetree/bindings/sound/asahi-kasei,ak5386.yaml

diff --git a/Documentation/devicetree/bindings/sound/ak5386.txt b/Documentation/devicetree/bindings/sound/ak5386.txt
deleted file mode 100644
index ec3df3abba0c..000000000000
--- a/Documentation/devicetree/bindings/sound/ak5386.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-AK5386 Single-ended 24-Bit 192kHz delta-sigma ADC
-
-This device has no control interface.
-
-Required properties:
-
-  - compatible : "asahi-kasei,ak5386"
-
-Optional properties:
-
-  - reset-gpio : a GPIO spec for the reset/power down pin.
-		 If specified, it will be deasserted at probe time.
-  - va-supply : a regulator spec, providing 5.0V
-  - vd-supply : a regulator spec, providing 3.3V
-
-Example:
-
-spdif: ak5386@0 {
-	compatible = "asahi-kasei,ak5386";
-	reset-gpio = <&gpio0 23>;
-	va-supply = <&vdd_5v0_reg>;
-	vd-supply = <&vdd_3v3_reg>;
-};
diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak5386.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak5386.yaml
new file mode 100644
index 000000000000..df896f3a5e08
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak5386.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/asahi-kasei,ak5386.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Asahi Kasei AK5386 ADC
+
+maintainers:
+  - Daniel Mack <zonque@gmail.com>
+
+description:
+  The Asahi Kasei AK5386 is a single-ended 24-Bit 192kHz delta-sigma
+  analog-to-digital converter (ADC).This device has no control interface.
+
+properties:
+  compatible:
+    const: asahi-kasei,ak5386
+
+  reset-gpios:
+    maxItems: 1
+    description: A GPIO spec for the reset/power down pin.
+
+  va-supply:
+    description: Power supply for the analog section.
+
+  vd-supply:
+    description: Power supply for the digital section.
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    adc {
+        compatible = "asahi-kasei,ak5386";
+        reset-gpios = <&gpio0 23 GPIO_ACTIVE_LOW>;
+        va-supply = <&vdd_5v0_reg>;
+        vd-supply = <&vdd_3v3_reg>;
+    };
-- 
2.43.0

