Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C453B7B76
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 13:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773839265; cv=none; b=VTymYKB2yCK682dO4EZPyLmH1+ebI243KzXAbbgezY1jBU6H7n1qej1US7j4Ln72flf+rgo4H+NULBTP1n/3laZuEDLcQLkHb1RA1cGy/kjPbpwKo6iuNzw1wbXZWy41FeSSK0khhNSBS5S6i21qqkY/pr/fzdz2C4gXReSktZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773839265; c=relaxed/simple;
	bh=LfmrTgf/ojK7DT+NypOmSIL+kXWQlCzoNSxMkoXMuNc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=LX9oBiOSM743VSPkhKHZJkaPHX2GM3skhWUFiuAzEw0CPXBtCElDbChpEzPrNFp80Ef/VqSq18HK0F/5FMcLRZ8WPL9g9fpG2JGAf/QzL5yPVgFz8VvZ1jvQgbiIVGQlrhS9p+Yq3PAerLZZrDeW6O5zBi0/DTBVSYbAUBD+vyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNdJbf1E; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNdJbf1E"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35b95a7444bso2503067a91.1
        for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 06:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773839263; x=1774444063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sm0CcoDen686zb2q6eiuQx7mweJvAGSwVDuf2RW0DNs=;
        b=FNdJbf1E6strr40En/TPLv/ZGVls7OKTDSyAFC8ptjgsyMfCKklz9LmP+RFf1vyQQe
         ip84iElpM4i/IPfUhMxavJro30RDwVL4y4WbjHNiCGZAAN3gpYRjg2EyrjBI36iV0y1j
         Yy+GAcGI7rpLaeVlJTyu02+bYi/YPEQxmr1GsY9YPn9IXljt06WL+cL8SUeKTB5MSMOQ
         hENo/qBVaRRGtlPTVqukrM14hW1ZEQMJXJ1jMqswFH4GSCxW6PadP8Y6atf02VkNQIGG
         8Dxb2xsy8TZ9K0pLL8frTUGRzO3FkUSDIYAFEuP5pdSUeE8MJ70kFCozlr+7xoatPUBB
         Vg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773839263; x=1774444063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sm0CcoDen686zb2q6eiuQx7mweJvAGSwVDuf2RW0DNs=;
        b=hB34EjG58sL9Rx073VD2BwcNk99AXRMKBe9xLArnUGhw4EHipNSVfEzHp84NrDDggO
         cihS0YfT3WIc+ts4vjBhai1ZDHu3oq8rAgBszcphzQGSaaafp6Zyf15i3NFAMAWok3Mx
         TunxeP2eiRL2vVujA9p6ZNYMlVKMY7VnMe8yxERhyruBsuy54FIF54Q2r/J+872MAHvB
         hpi36p29fu/gEe8+ACMcRxyK+ZEaMKtPDAo0yCzAwHZmaPWhOkxm83cG297IiOt/poQm
         rIpio2oPAFXEM32EzPl3Po6zhlK/EDa2aVVmPnTZTclsKdsKCbWZRkFi1uQpGC5nRybj
         p6Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVjONhPrOXTkUkaUoVbX/jaaVZVPfW6gm7yt/J9MWJOc8IOzoMCrDKWz2Afb27uZ0d26J+LwptlcjwV1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ+DYo6H70jlq/2lwkr1yrNfR+X6l/B71KBU5uQzJRBuiAJKfV
	oaEYfrGzbAppcLaIIvmKByOiyZ9VaEUKTGn3LMgxm1WmujA5ajHwosmh
X-Gm-Gg: ATEYQzxmW6AtdY5QaCbBCf33bugohaDq25vfjfrRU+FnVzl5kfA4Kl36E/L2XY13y1e
	DynzHTXIOg0uYEKXRCfrnlrzMUvZ/yV5OhIcdEnjtSM42wrKXhi8Z7ua6COtIy5iuj+GrkttTij
	4pRnKMJHg+UXWmY8WZpG4kCOwVWoB8DiRZ+GMRdyy3vW559v2OAAhMTU0oC9W7r1tcvgDifnOss
	6QkOCHYvLSoy4grupA7IrFvw9P3MwDeHuoCvEB3gQvhBIzARcd4djLxrBT4ToRJVgtpgzqaD/K9
	ebKDevewyUIuCQLkG88DSEpgom7UBW5NY1B/RPLXdVfwprsFtAc9vnoYqjd42ew7kugjRdSUxii
	ooHUzfjZJGaPTQ2F0VA4Lh+Lu52L4t9ZJl350ApKRRSX6Z7RQiaTVI/HquFWyge65fXbRrR/B4o
	5h6Grbb6PnB8wMR6cyC1TLFP2d3W0khLKaeZ9YMKAWwvns1IwjewdnGlUsaBXXsfx8ksXQC4BfQ
	Mko9d0bl8ehPMmnL8aYmDYNOSFDn4kWuwYcmQ7B
X-Received: by 2002:a17:90b:17cd:b0:35b:96bb:47b9 with SMTP id 98e67ed59e1d1-35bb9efae60mr2420291a91.19.1773839263179;
        Wed, 18 Mar 2026 06:07:43 -0700 (PDT)
Received: from lorddaniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2401:4900:881f:243e:f3ca:95c3:4873:c02b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcda60sm6205760a91.14.2026.03.18.06.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:07:42 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: lars@metafoo.de,
	nuno.sa@analog.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] ASoC: dt-bindings: adi,ssm2305: Convert to DT schema
Date: Wed, 18 Mar 2026 18:37:33 +0530
Message-Id: <20260318130733.52477-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the SSM2305 speaker amplifier binding from text format to
DT schema to enable dtbs_check validation.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- Fix Signed-off-by placement
- Replace "YAML schema" with "DT schema" in commit body
- Add missing Reviewed-by tag

Changes in v2:
- Fix subject prefix to ASoC: dt-bindings:

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

