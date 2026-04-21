Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D444534EF17
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776786404; cv=none; b=b5rXIw15tUD5nTMB9/fyroRwzDgW8Uh2QZ2sDGufo1CA12etj6ep8RVVEBC5ilywqwCYIr2igDyOzG3NR7OxOpG6SSm7PADc47xke5Vnz+YUSbJzqAMQFIQnEEOHXIW+LWHXHVuq9O47TqBKaWNdrnr54tCOLDwDVvKHLjkCVFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776786404; c=relaxed/simple;
	bh=KePFdqtxhzIfGgpRbgVIP0PIcNTO7D89nGU8iW1dSUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BXyBe35aYSHJX9NphgsKLoPccIs7ojccj0RihSo86dGcTHsyIGpnxaELPLCVXEk21gBnjkgnMAmjKlF76HhwMcFuZ18flKUYu+DZ0gRidoTVCi2A13LPZEO5sL7QqJ6wgzMzbV3TkuLvmybV86RkMAimjQQHg434faTcLfmmpZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIpUZy0I; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIpUZy0I"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48374014a77so57020435e9.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776786398; x=1777391198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pm67qKOM3Exkx05WtLYkzfFidvA4Ig/U45KGlldfDxA=;
        b=HIpUZy0IYUP5lCQy7pxb1J0+f0HavkN8rIbhPtyxSRxmH51G6eY2uFwRUquZtGG8ad
         wy3sHcNvFMdfgblKKb4GfUnvMk9UoP1oXglPvu6PqLF1duOeYwf4/2IEOd8z8M36M+t9
         E7M/Sbyhvnvc5U+AHgQbAZBE/csgyDFUl43giKg6izGvmKJg7OvX9K9OU2Mu/GltX/v6
         rsBQZ3Ctq3TgQSx710mgw+rQ9ifI9dYK9w4WLKSp6VL0KGJFom1hT+i1QBEjrihMPhKf
         GJeUGHWQAQB/Rou9RdbIeqAAKW9S3S10IOU8/JR+/+0eSM9hOWWbqKl9Fv8qfWrs/d9y
         H5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776786398; x=1777391198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pm67qKOM3Exkx05WtLYkzfFidvA4Ig/U45KGlldfDxA=;
        b=I4Qs6Byt7N73aACSQOTtAVY323gw9xekh7b2pjx2pscNj5oSxxYNscrcvwOAzMunWk
         zNL+FrLKwBbdvvMMAE6QRw3GbAvMjl6jfckAEpIdPtIxDDuqiZgwJMEyLOD5cHYvkMHo
         AygAakPrU8fidXb5+yXt80yBbuQU6zfIVddyiz4LJW26jYv0OPZ/Ve2kXO13usTO4zQm
         6mSb8IvCeg+plssdhU8kOQD0iA3ZkLv89xeQc2EWaiR/dtV0bOPpIey476LEnP8OuJ/c
         gZYyD+aiuLAJbTcXAlsMgX6ZeveGD/gDuHqBMuH01e3oYRJJwvyjRv0jn8FLm0ojh9TS
         w3Qg==
X-Gm-Message-State: AOJu0YyMoJaWZsXiM0jyE1wqrdZvtMfeoExLLBItBeka0jAN2Ozeu7KK
	A/NFvG2SXtlHewrQUaA8rE/U8n3P5vLfz/gRlVM8W5eNq1eLQg/8C5dnS9QhT6M6
X-Gm-Gg: AeBDietjB7SZUoAQ8NQdMRjvobQzODyWJcx7pVMxUgDTuXgU3APOoPlldgZBGM/9AY7
	KoLbJ2kjMjy+wGBfXWErrI4VmeOtPcLGDfzKf5x9l5LRnubBJCZ32qnhzqgUQ2S1vu7IntCaog1
	UL2ULHnERt46C3fPTeE5Hna8lL5f+laqgWIbwQYtdGChVIpgU39jjN+gmIDNFJrDw57zrfzX694
	Jz5XwYfrqjY24HWWZp0HoMRP8UlkA0X73JzaxCy6KRJRwzmwHa7WvGsdbKCos1CnjV+yNwGHaQW
	WA5112UHo+wqh3ffWfo4caackenUbef+I1MYbBRHayU06qmRonQuWRA32Zezbp2DasVg/PVLPC5
	XC0hCegxHPyUxQN4XhdGH0RoRnJPQ2MBYvmKfhK2y9e6dQajsyttk3VM0ZNp1p/mPuRpbgAU0xy
	OkGMGT1CLZiNVtK2GE/j8zOZp50j+Xmg==
X-Received: by 2002:a05:600c:4ec6:b0:489:1f98:71e3 with SMTP id 5b1f17b1804b1-4891f987487mr114165495e9.28.1776786397946;
        Tue, 21 Apr 2026 08:46:37 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891c318636sm174759655e9.7.2026.04.21.08.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:46:37 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] ASoC: dt-bindings: mediatek: Convert mtk-btcvsd-snd to DT Schema
Date: Tue, 21 Apr 2026 16:46:07 +0100
Message-ID: <20260421154619.227039-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the mtk-btcvsd-snd.txt DT binding to DT Schema format.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
Changes in v2:
- Fixed issues from make dt_binding_check
- Set myself as maintainer for the binding

 .../sound/mediatek,mtk-btcvsd-snd.yaml        | 60 +++++++++++++++++++
 .../bindings/sound/mtk-btcvsd-snd.txt         | 24 --------
 2 files changed, 60 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
new file mode 100644
index 000000000000..1ec50c7611df
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mtk-btcvsd-snd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek ALSA BT SCO CVSD/MSBC Driver
+
+maintainers:
+  - Luca Leonardo Scorcia <l.scorcia@gmail.com>
+
+properties:
+  compatible:
+    const: mediatek,mtk-btcvsd-snd
+
+  reg:
+    items:
+      - description: Register location and size of PKV
+      - description: Register location and size of SRAM_BANK2
+
+  interrupts:
+    items:
+      - description: BT-SCO interrupt
+
+  mediatek,infracfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the infracfg controller
+
+  mediatek,offset:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Array of register offsets and masks
+    items:
+      - description: infra_misc_offset
+      - description: infra_conn_bt_cvsd_mask
+      - description: cvsd_mcu_read_offset
+      - description: cvsd_mcu_write_offset
+      - description: cvsd_packet_indicator_offset
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - mediatek,infracfg
+  - mediatek,offset
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mtk-btcvsd-snd@18000000 {
+      compatible = "mediatek,mtk-btcvsd-snd";
+      reg = <0x18000000 0x1000>,
+            <0x18080000 0x8000>;
+      interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_LOW>;
+      mediatek,infracfg = <&infrasys>;
+      mediatek,offset = <0xf00 0x800 0xfd0 0xfd4 0xfd8>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt b/Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt
deleted file mode 100644
index 679e44839b48..000000000000
--- a/Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Mediatek ALSA BT SCO CVSD/MSBC Driver
-
-Required properties:
-- compatible = "mediatek,mtk-btcvsd-snd";
-- reg: register location and size of PKV and SRAM_BANK2
-- interrupts: should contain BTSCO interrupt
-- mediatek,infracfg: the phandles of INFRASYS
-- mediatek,offset: Array contains of register offset and mask
-    infra_misc_offset,
-    infra_conn_bt_cvsd_mask,
-    cvsd_mcu_read_offset,
-    cvsd_mcu_write_offset,
-    cvsd_packet_indicator_offset
-
-Example:
-
-	mtk-btcvsd-snd@18000000 {
-		compatible = "mediatek,mtk-btcvsd-snd";
-		reg=<0 0x18000000 0 0x1000>,
-		    <0 0x18080000 0 0x8000>;
-		interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_LOW>;
-		mediatek,infracfg = <&infrasys>;
-		mediatek,offset = <0xf00 0x800 0xfd0 0xfd4 0xfd8>;
-	};
-- 
2.43.0

