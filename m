Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3985D3DEAC2
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 22:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783635226; cv=none; b=e8peSobu/XT11sNjzxvSPF5O51Acmyes0R9e0jJa9t6ncI9xltbn4NmPsW7M0mZZqFSH56ZvR22Lvnh+274JWLm3FW7i8hRHelwTagEorAUV6wqQuOYwALqtbvRH2TAc8A7zFeKppoyE8R4K/My3aFMvBxnFXeYJFkuyDP1wNow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783635226; c=relaxed/simple;
	bh=C4ayAE9UL2Kf4OuNTPepG8l1D14PXJZwapmcgB7cAA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=plHoJyF32ot/LiWQlWPZmgptFzlUv8GmXrozilAiPd8AfzF4KDZgQJx3UE8GTjHt6OjCuQzKAC7OYhUyYjcvp3PwJoYZILz13zuIVffC9hMjigw1saobSztD+5YrvjGq8+O5ZJ3/dpCV35nrHnf8rVYOsaIGiycU5vk/MIkeT0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okYof8CQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okYof8CQ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-470174001a0so249101f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 15:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783635222; x=1784240022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGaJjpg4Uf6A0xkO/I1SgrYYhus1D3i3U8sND88Lz3k=;
        b=okYof8CQ+33sEXKxtRIX+6hfZXjGXlKW2J5xnaaXezTTA00KfOEa6VVDBe7YzZiBoi
         Vxfwrr/9VbwX+IaaJ/dAXLcHWNooUhE4G4Gdwk5acgD+B59aSLse/cX7h03CQBGy04qd
         /l+jBJ72yvJffGV6b2nTr4ynBDgRzD55oj1g/gOXMBxrpzBp2iEkKJowTMeRX3z8InE7
         KZqdmsiSwPlGLbT8a2vU50tM9mSM7/zZ2ho10J6NyKVlAf73NbwZNPwGqBi129OkPoDY
         lCMbv9+hZ/gm7EAcV4m+eHLqjWOdhah49v5Bf7rNPNXkJ1fhuebQPyyQi8cLcM+VPuby
         AeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783635222; x=1784240022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dGaJjpg4Uf6A0xkO/I1SgrYYhus1D3i3U8sND88Lz3k=;
        b=cuaqsW0q4BDug7f1dKk8n19LLNDQG5K2ZUPXHk/eRul3aQGpNNNXg/LrZBiQ92H6W6
         OUExkw3A/BLARsRqfmPjv3GraUIvX8MatGLb01YwOMmYDS7nP4gEjsGdN+gQ9xQMoj/V
         5CFOAwlJEIp3O79I/QLTnCHSEz9wkBjhyRJwYdTXcpmwbmxt9Ptpuninqu9Dh5UAzaB0
         BxKo/u7AY5wP3eYve1qm3gdGK08zGZpx0VMQrCwcZ3SNLlGsWY3Pm8LMblPzb5nyNlZ0
         gRpkAhPS49qh718jedPUCFg5QdAmnHdcWcFHPt6uoi1C/fJiFU/4IsiOUHipsdhA8035
         Q1ow==
X-Forwarded-Encrypted: i=1; AHgh+Rqb3zjM2/iIOUvpIY1gBjVzSXDGI+BZ/TxZRdvTVNtJPu/WR8y5NHnEFIIZT3HxxMubdD9pwbU7ZDSttQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxWPnEpF2AaiaObD78l7zT9P511yvVzj5r8wz1pbo3F8EqAVjg
	tMmBxCms5htgi9MjCXitKiBfb3Ok03RKxERev4T1qj2RudtvHeqgD4dQ
X-Gm-Gg: AfdE7ckNnyS5VX+neRovQfMzHY7F8n4b2cjTeMkAmjM1di+2gwjeDEAWy2Zm9KCsDLH
	I8GVUHuGLeUVy3O7bBgQPbpUrY2JSVb9toeczglpWPTs8rLohGD0CsJchVq4pC6dXu9wvzm9DBV
	vsrOlFgMR9/l/wTbRc/fmmJtAcl+bRGdgjZ9nOtlkoytEujCSREi27lmpV0jVH6ghY6ag+zy12p
	QGC4wLIYSz9PrcFvDLVzAUQx9W0mRSwNVvxC14Zi+8XnU3k/LANcdQt/FNtSej9LSkLs6wLlkvw
	gwFQOUV1Dpb6lqp6+8oAkwRHbtTTROoaB4de2jos29f8/F2/CYi1JUzuIqP2LNL3TYM9uu4ACHA
	WFSNQtwA+ynzySb1rvIPIqpsm3zH3BBRookdjLGtZYzUCZzr9b0VYVGbtP70nbqNUTt0mkjih2Y
	9+NEzsjdiojpnhfSCf69ADLES81brgcD17
X-Received: by 2002:a05:6000:1a8b:b0:470:2fb1:3dca with SMTP id ffacd0b85a97d-47df07ec8d2mr11730313f8f.30.1783635222528;
        Thu, 09 Jul 2026 15:13:42 -0700 (PDT)
Received: from unknown.tail46804.ts.net ([2a02:b023:8011:c993:4bf6:23f5:d942:9d70])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f2465ae8bsm869008f8f.36.2026.07.09.15.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 15:13:42 -0700 (PDT)
From: Gianluca Boiano <morf3089@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: sound: add Texas Instruments TAS2557
Date: Fri, 10 Jul 2026 00:13:28 +0200
Message-ID: <20260709221331.989109-2-morf3089@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709221331.989109-1-morf3089@gmail.com>
References: <20260709221331.989109-1-morf3089@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the TAS2557 mono Class-D smart amplifier with an integrated
DSP for speaker protection. The device is controlled over I2C and
receives audio over I2S/TDM (ASI). It can drive a single mono speaker
or, as two devices, a stereo pair; in that case the ti,channel
property selects the audio slot each device reproduces and the
per-device tuning it applies.

The on-chip DSP boots from a firmware image generated per speaker
design with the TI PurePath Console tuning tools; the optional
firmware-name property selects a board-specific image.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 .../devicetree/bindings/sound/ti,tas2557.yaml | 123 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2557.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2557.yaml b/Documentation/devicetree/bindings/sound/ti,tas2557.yaml
new file mode 100644
index 000000000000..b1d1183c4a79
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,tas2557.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Gianluca Boiano <morf3089@gmail.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,tas2557.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TAS2557 Mono Smart Amplifier
+
+maintainers:
+  - Gianluca Boiano <morf3089@gmail.com>
+
+description: |
+  The TAS2557 is a mono, digital-input Class-D amplifier with an
+  integrated DSP for speaker protection. Audio is carried over I2S/TDM
+  (ASI). The on-chip DSP boots from a firmware image that is generated
+  for a specific speaker design using the TI PurePath Console tuning
+  tools.
+
+  Stereo playback is built from two devices, each reproducing one audio
+  slot selected through the ti,channel property and applying the
+  matching per-device tuning contained in a stereo-tuned firmware
+  image.
+
+  Datasheet: https://www.ti.com/lit/gpn/tas2557
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: ti,tas2557
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the active-low RESET pin.
+
+  interrupts:
+    maxItems: 1
+    description: Fault interrupt output (INT).
+
+  vbat-supply:
+    description: Battery/boost input supply (VBAT), 2.9 V to 5.5 V.
+
+  iovdd-supply:
+    description: Digital I/O supply, 1.62 V to 3.6 V.
+
+  avdd-supply:
+    description: Analog supply, 1.65 V to 1.95 V.
+
+  dvdd-supply:
+    description: Digital core supply, 1.65 V to 1.95 V.
+
+  ti,imon-slot-no:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: TDM TX time slot for current-sense data.
+    default: 0
+    minimum: 0
+    maximum: 7
+
+  ti,vmon-slot-no:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: TDM TX time slot for voltage-sense data.
+    default: 2
+    minimum: 0
+    maximum: 7
+
+  ti,channel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Audio slot of the stereo stream reproduced by this device (0 =
+      left, 1 = right). With stereo firmware this also selects which
+      per-device tuning set is applied.
+    enum: [0, 1]
+    default: 0
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      Name of the DSP firmware image to load. Defaults to a name
+      derived from the silicon revision. Stereo systems typically use
+      a stereo-tuned image shared by both devices.
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
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
+        audio-codec@4c {
+            compatible = "ti,tas2557";
+            reg = <0x4c>;
+            #sound-dai-cells = <0>;
+            reset-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&tlmm>;
+            interrupts = <73 IRQ_TYPE_LEVEL_HIGH>;
+
+            vbat-supply = <&vph_pwr>;
+            iovdd-supply = <&vreg_l6b_1p8>;
+            avdd-supply = <&vreg_l6b_1p8>;
+            dvdd-supply = <&vreg_l6b_1p8>;
+
+            ti,imon-slot-no = <0>;
+            ti,vmon-slot-no = <2>;
+            ti,channel = <0>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..8a824da3979e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26677,6 +26677,7 @@ M:	Sen Wang <sen@ti.com>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/ti,tas2552.yaml
+F:	Documentation/devicetree/bindings/sound/ti,tas2557.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas2562.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas2770.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
-- 
2.55.0

