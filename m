Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918C038E8BA
	for <linux-sound@vger.kernel.org>; Sun, 24 May 2026 12:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779626071; cv=none; b=SSToeKevZFTWWhjlbuRLXEcHz0Uk/mIEpv9rihqzXNZREluV7+vvqvFBZpSXlDN43kHoYmcP4G6Y+PSV/Jufhql5GeZVled3i4xL6N6CLoTbg5PfhcORFZNzURWxvVCHmm6oruQqyhv8Fla9MQYw/t3Puu6ViIv+qwK+ji/o5oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779626071; c=relaxed/simple;
	bh=583KH+DCxPQ/knkRR9QEOGjJuOjydKdrPkk8dL6UTUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZdXE+J/ZsyftWNqbjeeIU7dGBmNZbPzX+KpFrUJfWqCC9c1D9mToSPdIHqh05sLhJ/HhIDF3ewq/ObZoFphdDKf6kVkYQvoUnqcWH7UUS1dwBGMePv9EnI3DAKIAbvnemX3byjF8tIpHefq0T1eKxesJ40oZHhEBCR6bS7tGF5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=by+KhC5E; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="by+KhC5E"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-841882f8f4bso227350b3a.0
        for <linux-sound@vger.kernel.org>; Sun, 24 May 2026 05:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779626070; x=1780230870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=viQH8T8avmF+llB67Wz4hsS8DneqALZYYyFNV5J0o5s=;
        b=by+KhC5EaCTmBv3F/2INfAGLkONnLLEsq/rL7DyXAFsDyB2Y/hS0kmSXXT6vhdJ2VW
         3gwaLlhsjKO31ziJwD+RF7R+tYDlfcd6kCEkSJc1GvbGP9P1H0PLOwim7w9NY2vxq88G
         9H7VADbhpjeCcDKVsnRuXTjVzSdf2f+h5eGTW6LMPDbmFTBlhYGGIVnEKjasMveKHKmA
         9I1Ob88E+H8FpEupCOAiHHsWia0jVRzJpCwF72jPOhFC8wp3p/pv4MZFywgHhRb1plXr
         RWEduBJ8HW8jzRWZjGaYrXBdl6U4jcLsXXWyUNNH52g1JVk0HSlMNV8Ko78X/Dp2gwz6
         aLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779626070; x=1780230870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viQH8T8avmF+llB67Wz4hsS8DneqALZYYyFNV5J0o5s=;
        b=fiPaDv5Qml8GT+W8akwOZVWsdFhPrvJ5jiJaxwfzbga8dNMXHMFnQUjbyTrWl33QmI
         Fc0qYI+ytrrqw2wnch5bl0hOs3hhcz5twe9YaGy1xAeUZn41fZXOQv7a+S6+XCbY9QCe
         HpaZo5GJTLFIji/EiYeprWQmwDbhaeywlCu2/bK/6fQLG+G3lg8eN0Xg6g42/sWydF7t
         Od34M9t3WAeePXORCYGRzpPGa1Q4aJNK1qo72lJW9iCH5DIeEGUgipm3UK+Vp9Y0J009
         UiVj7rvLISQ12bFfVGHyxTwZR4GsieHuC34Vf3B9WZHCgiqVexwJt0vLZZUZZqLA7U1o
         AQeA==
X-Gm-Message-State: AOJu0Yy3dhW+AEFK7Xiw+VRYpeyOfaSf6im0SCt81dbvbkZ0mPWDue2x
	QjmwR3HDfiCoIDqpOJPtp3g7jw84J1hSBZQG4/oS9Ctrnnpax0BoKHV7
X-Gm-Gg: Acq92OG8e9ZitrQKa7vWneqobPHz39ltPd2qsSRljzS/e+P9Ew+xo+sz7VfWovI56E+
	V0jQnJuC9+LA6CLRBZfuBVqAaH/EY2pdJWiVpl4omS4u2ztZ4ybcidW9yjn7b7GYsER2qLNLT7Z
	2UXPVBgH1xFiCGGR3gBtt3d0h7M41zcrMhIULSS+OKRwJB+FhBTxM8aau1bXitKJlFf2IlTMNx1
	IAT62Ci/R12wDZw7KFgCuCKaallz3wCtpind05lHcGtFk8XCRrtueBu7PQlQrFv+u9mdWNNTvEU
	myCwVKw/NXsZ5sNSQUgxlG0zahm3OdVO1Pg4Oh9LeYHxm31f0gsA2UVrdx2Ux3vBE6SFysni2rZ
	aG/MH/PzAn59BMlpvg4pPunfT7VisCF27PInJaAmMY1f0w35rRryF2vp5K9akHPHSwU9mXusv/I
	tIty12PQYqYmFDNJEwpvdIBY8jokPC8nJHHpHC9sppuQIIa6TFyLWiHPvuz2LRaqQhiH8=
X-Received: by 2002:a05:6a00:1907:b0:83e:6fde:54d3 with SMTP id d2e1a72fcca58-8415f7010d4mr9922617b3a.50.1779626069700;
        Sun, 24 May 2026 05:34:29 -0700 (PDT)
Received: from Ubuntu.. ([49.37.169.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164b1b3d2sm7648811b3a.26.2026.05.24.05.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 05:34:29 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peron.clem@gmail.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [PATCH] ASoC: dt-bindings: sound: asahi-kasei,ak4118: Convert DT schema
Date: Sun, 24 May 2026 12:33:30 +0000
Message-ID: <20260524123415.108301-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the Asahi Kasei AK4118 S/PDIF transceiver bindings from
text format to YAML schema.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 .../devicetree/bindings/sound/ak4118.txt      | 22 -------
 .../bindings/sound/asahi-kasei,ak4118.yaml    | 57 +++++++++++++++++++
 2 files changed, 57 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ak4118.txt
 create mode 100644 Documentation/devicetree/bindings/sound/asahi-kasei,ak4118.yaml

diff --git a/Documentation/devicetree/bindings/sound/ak4118.txt b/Documentation/devicetree/bindings/sound/ak4118.txt
deleted file mode 100644
index 6e11a2f7404c..000000000000
--- a/Documentation/devicetree/bindings/sound/ak4118.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-AK4118 S/PDIF transceiver
-
-This device supports I2C mode.
-
-Required properties:
-
-- compatible : "asahi-kasei,ak4118"
-- reg : The I2C address of the device for I2C
-- reset-gpios: A GPIO specifier for the reset pin
-- irq-gpios: A GPIO specifier for the IRQ pin
-
-Example:
-
-&i2c {
-	ak4118: ak4118@13 {
-		#sound-dai-cells = <0>;
-		compatible = "asahi-kasei,ak4118";
-		reg = <0x13>;
-		reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>
-		irq-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4118.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4118.yaml
new file mode 100644
index 000000000000..54cee45ac051
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4118.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/asahi-kasei,ak4118.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Asahi Kasei AK4118 Digital Audio Transceiver
+
+maintainers:
+  - Clément Péron <peron.clem@gmail.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: asahi-kasei,ak4118
+
+  reg:
+    maxItems: 1
+    description: I2C address of the device
+
+  "#sound-dai-cells":
+    const: 0
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO used for the Reset pin
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@13 {
+            compatible = "asahi-kasei,ak4118";
+            reg = <0x13>;
+            #sound-dai-cells = <0>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <0 IRQ_TYPE_EDGE_RISING>;
+            reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
+        };
+    };
-- 
2.43.0

