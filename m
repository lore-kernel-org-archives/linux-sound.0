Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57E13B7770
	for <linux-sound@vger.kernel.org>; Fri, 17 Jul 2026 23:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784331270; cv=none; b=nKysNeqgqL2OJh98RoBfk0oGkXO7UhuFQUHcbdJ1nnYpK3D3mAW6xEnjBKz6eQgwxiLC56Gn2ZP4U9gSFlA/I5hi+LauYwxwmWi6Nl4un9euSvADiGelkJDC3o7mq3o4aH+vIXBXeN60O1wXaumHM+YlgjWSG89GGzWHemNW+o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784331270; c=relaxed/simple;
	bh=8r4ur5c+M4MKxWf3A88efJzcEQV4sCnNJKViJ9NCfx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNvG/wm/F8vCp7XijNCMtO5B+0Z7XO5DlqTVksjLrrY8UMtQxg2jX1jpPzqXpZbFNeXCWWXBJXT5z+QpOFIEqYe9+qwpYM7ODObIP5zeNZ/i0QzT8n4P9Cwhdbd6/uVeIT+gJGu/mE7r+8GNHipAFgQzDubSl4y9eVLF8169vFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CA36uWdH; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CA36uWdH"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-697bd21fdc2so6120440a12.1
        for <linux-sound@vger.kernel.org>; Fri, 17 Jul 2026 16:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784331264; x=1784936064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lEUUtQt9WH85MGhtjYRMOaATFVjihA6iChw3RR4pFz4=;
        b=CA36uWdHhhtsdlEVoS/EfWBhBxiFPszBd08LqXlm7tHVDvs9ux71G0n8J7p0/8SIZv
         ne/donOe9dpqNwt1OExyxNtMov0Xd9N9rVKhtIvYrcqI1/mvOSQlhL3aBoHuTZ3XpS4p
         hul7II6GUMjZyw7WlJie422O9tslJN3qoQFB/cp5FULA/dvl1CJw5v0WBae16sOj2bwW
         Yu4mAR8fUI3p+URzIK/c/EhWf8mUDJULZWuGKQtk65SOEpgfW3Sfkb9znhXmLWA5EtD7
         mQPgXxxNtV3v8fXzI92BuwkoyJUA3PsEfgNCergEAj4MzsjYDg9Bwh8/mGgW31ixBEH4
         3I0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784331264; x=1784936064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lEUUtQt9WH85MGhtjYRMOaATFVjihA6iChw3RR4pFz4=;
        b=PD5y3ZQqB5mDu3+mR8b3eHOCGHwnQiStAj/v2WUNNA1ej5+YSUxzTUbzI8PaLSZuag
         g6+D4fp+5DvuVYLy7uq4iaVns4xyj7klEr/vMAoZHnt3jfx/BiEHaXbukEYQff2vZPIA
         yOcWk2z+2x06+e12KmRNcjQaACKbeFXZ1lw2fpISk8P1QYZ3Us4Y2aSsUsLQYwsW34Z4
         W3z5b8RWNxg4ZjRiVKEuI2LTHJrbyur9Nmgte1SFJ9fnWdoDf4GyhoMlPaKMJ8iUN/9z
         7v9j9x71mrbBsN7Nw6DPFtEqvhzgTrRzbx+ZiuAVsDOKNelux03x/As0gJI13Y5K6xVL
         WL3A==
X-Forwarded-Encrypted: i=1; AHgh+Rr1nyYHpxa5v8nxH/HN0UjHY9EKYiLh8+ekWhsX01LReLJlWU60G8JOsesc8vS4waEnqfQhMym5/9+Y1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8QEO5BQnEOJq++P2bpSFiuDXbf7lwjVhzBmpTpwvqhbyz4nfr
	wHZBMtR6a6SK1MqkfIzE2m6En3hiXXK2KBhVuc22El8Nwj6Q9wkh17r+
X-Gm-Gg: AfdE7cmbeNNwqTM0ee4iKXM+kUAsIm8yh5xvqh3rZ39qZ6CascqxJPAEnhQXZD1OlMf
	t7ibr9lAWDxYUbghP+ZIcaTB7fLlz1Awa0qpF9F1vm6fFsZkqzRtkivOgCaokU5drsjfsO+2RJk
	45wrjxqw3aT4MPzB10QyPwqxGkrjgr7j9yX3vp/l2+iRo2YczNIa5cpmbGnv3gFSQr7u9F51NnG
	uN2rL4J4IEXYPfUh/+ckLwSKnBVZjaDmtkPEJkkYI/La070dqwMXqZwxDTIevmgO4KPPewRiZ/Y
	0j0Aj55oaOJH1P8HYOuEBjzJ+Mq1Q7iEjZtL3MVYyUOmoSSi7F/yV40opj2YKQ98I/JF0zZwmFV
	x0W7kS0PRZa4xWmSa+5LCwkElemFXUuuwkLblUvBmhM0sd8ia63BJvhph2BxfHyf/XCGBHVIO38
	kZQJ1NIwlPePG0A4iJezw=
X-Received: by 2002:a05:6402:44ca:b0:698:562f:1020 with SMTP id 4fb4d7f45d1cf-69e6528abb3mr1712722a12.18.1784331263728;
        Fri, 17 Jul 2026 16:34:23 -0700 (PDT)
Received: from unknown.tail46804.ts.net ([2a02:b027:11:f86c:39a3:6436:dcc2:e48a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fef2477sm1429231a12.7.2026.07.17.16.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 16:34:23 -0700 (PDT)
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
	"Wang, Sen" <sen@ti.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: sound: add Texas Instruments TAS2557
Date: Sat, 18 Jul 2026 01:33:59 +0200
Message-ID: <20260717233402.414326-2-morf3089@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717233402.414326-1-morf3089@gmail.com>
References: <20260717233402.414326-1-morf3089@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the TAS2557 mono Class-D smart amplifier with an integrated
DSP for speaker protection. The device is controlled over I2C and
receives audio over I2S/TDM (ASI). One node can describe either a
single mono device or, via a two-entry `reg`, a stereo pair sharing
one bus: the physical device at each `reg` index applies that half
(DEV_A/DEV_B) of a stereo-tuned firmware image, so no separate
channel-selection property is needed -- device order in `reg` is
the only configuration required, matching the convention already
used by ti,tas2781.yaml/ti,tas2563.yaml for the same TI firmware
toolchain. `ti,imon-slot-nos`/`ti,vmon-slot-nos` follow the same
per-index convention for the TDM sense-data slots. `reg` is capped
at two entries because the uCDSP firmware container only defines
mono or two-device (DEV_A/DEV_B) types -- there is no third slot to
extend into regardless of DT shape.

The on-chip DSP boots from a firmware image generated per speaker
design with the TI PurePath Console tuning tools; the optional
firmware-name property selects a board-specific image, shared by
every device in the group.

Addresses review from Krzysztof Kozlowski, who questioned a
per-node channel-selection property (an earlier ti,channel/
ti,audio-channel design) on the grounds that it doesn't scale and
isn't how other multi-device TI amplifiers in-tree solve the same
problem.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
Changes in v3:
- single-node reg-array model (up to two devices), matching
  ti,tas2781.yaml; drop ti,channel, derive DEV_A/DEV_B from reg order
- rename ti,imon-slot-no/ti,vmon-slot-no to the plural
  ti,imon-slot-nos/ti,vmon-slot-nos arrays; firmware-name maxItems: 1

Changes in v2:
- add the four mandatory supplies to "required" (Wang Sen)

 .../devicetree/bindings/sound/ti,tas2557.yaml | 174 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 175 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2557.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2557.yaml b/Documentation/devicetree/bindings/sound/ti,tas2557.yaml
new file mode 100644
index 000000000000..648ba605e0f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,tas2557.yaml
@@ -0,0 +1,174 @@
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
+  A single node describes either one physical TAS2557, or up to two of
+  them sharing one ASI bus and one reset/IRQ pair, using the same
+  reg-array convention as
+  Documentation/devicetree/bindings/sound/ti,tas2781.yaml. When two
+  devices are listed, `reg` carries both I2C addresses and the
+  physical device at each index is implicitly assigned one half of a
+  stereo-tuned firmware image: the device at index 0 is DEV_A and the
+  device at index 1 is DEV_B. No explicit channel-selection property
+  exists or is needed -- the order of addresses in `reg` is the only
+  configuration required. `ti,imon-slot-nos` and `ti,vmon-slot-nos`
+  follow the same indexing: the item at array index N sets the TDM TX
+  slot used by the device at the Nth `reg` entry.
+
+  The uCDSP firmware format defines only the DEV_A and DEV_B device
+  types, so `reg` (and the two TDM slot properties) cannot list more
+  than two entries, regardless of how many physical speakers the board
+  has.
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
+    minItems: 1
+    maxItems: 2
+    description:
+      I2C address of each physical device sharing this node. One
+      entry configures a single mono TAS2557. Two entries configure a
+      device pair; the device at index 0 is DEV_A and the device at
+      index 1 is DEV_B.
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
+  ti,imon-slot-nos:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 2
+    items:
+      minimum: 0
+      maximum: 7
+    description:
+      TDM TX time slot(s) for current-sense data, one entry per `reg`
+      entry. The item at array index N configures the device at the
+      Nth `reg` entry.
+
+  ti,vmon-slot-nos:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 2
+    items:
+      minimum: 0
+      maximum: 7
+    description:
+      TDM TX time slot(s) for voltage-sense data, one entry per `reg`
+      entry. The item at array index N configures the device at the
+      Nth `reg` entry.
+
+  firmware-name:
+    maxItems: 1
+    description: |
+      Name of the DSP firmware image to load. Defaults to a name
+      derived from the silicon revision. A device pair shares one
+      image; each device's half of it is selected by its `reg` index,
+      not by this property.
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+  - vbat-supply
+  - iovdd-supply
+  - avdd-supply
+  - dvdd-supply
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
+            ti,imon-slot-nos = <0>;
+            ti,vmon-slot-nos = <2>;
+        };
+    };
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
+            reg = <0x4c>, <0x4d>;
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
+            ti,imon-slot-nos = <0 1>;
+            ti,vmon-slot-nos = <2 3>;
+            firmware-name = "tas2557-stereo.bin";
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 806bd2d80d15..44ece19d669f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26679,6 +26679,7 @@ M:	Sen Wang <sen@ti.com>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/ti,tas2552.yaml
+F:	Documentation/devicetree/bindings/sound/ti,tas2557.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas2562.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas2770.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
-- 
2.55.0

