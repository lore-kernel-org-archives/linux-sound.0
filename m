Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854E63AD522
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 18:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781549920; cv=none; b=p6OvHvHO9ChqYyZ8bIscyhjUn5BPx6uWClJ1DwWe1yw87XQSSlUlZagRHnq5GREsA9PKNcFGbUmjR44bljHf2vM5b5rODDRljwLBy7d3PxWACjb14yN25KFWQs/krGOWltjXKADebBYzMFYm3Vb/aqYZwDemaQkUkXqAfa8VTaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781549920; c=relaxed/simple;
	bh=EaEtrAuuWPfEzmI/2UshlVTym4jvWovUmV87OOxEDek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lj1fnx44YOJLUGcuQnDSPTh0Nw7lKCivNDxqs1EomwBLXFci9PbZw5Fhoxx2Sp0r+FywnuZ248RpYyUrWh4seGdy0wLIUs7XJD7jZSGij8Pfpot7I/5ks7f8o4MMurEtc1Uj+cYNinOYyCt4p2vjii6dELCmG4VDuzMnAjc7KFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgIKydkB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgIKydkB"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45eeea039ebso2098024f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 11:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781549917; x=1782154717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CefDNXp0t/3lemxoY4i19YgqNhdG6IWYc6pzOXdnlDY=;
        b=HgIKydkBb7IC171ueyrecOr1g7WSf+GOKh0Do2NyeSIV5ir4/xMixS/k2qMiw/evnc
         MOZdZXETYqLFAMHFLTToaOCgMQuUMTC9bHb6poLS2a74pHGk2AbTo3KpD+5QUNxkXGi3
         g3IKDjLkppvg5p00oiLqRtn/zzBSlwL30ww7VKmMhuc9vEdeeI1aUNlqycqwiJRRau//
         gdEpu9HJ2hvis/RlWYu9mCFm2cdPoFzO2HVxFuZIyBkOp/UTV1T7ijh2iN5xFT9jubKY
         OsN0mufrG0n683mPOanL8tTZQTl9e6qvpX8lNGC5IsPdXQEoK3B2+rKg2+9wig6791+R
         3GdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781549917; x=1782154717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CefDNXp0t/3lemxoY4i19YgqNhdG6IWYc6pzOXdnlDY=;
        b=ZWuC1gM/QIQjTfz0OwsFOZqDm6CuXBfIVv0J+oBhytpvzaQPiqnvrg7zffCEkujhHR
         lZox0kx44SkHt9YGqnoUQPF8M44nZaK5WbzGHZO76rLOGnaO1NfwlRZwlGFtkPPBYey8
         9grgkI8MUbQeuzdkdDYJEpxgxklKZXUP/u+0/wBkxNouAVW6Xb9m8ZohvZBXkYjYKvLJ
         uyKwk8F4B6pNT4nqOlKk4Aawk9thGs59jaeIFq2JkYmTSn+bLFe7DSagxqH5MwviZvi9
         m2DyKhyCvFLficrkNc/AKbHxrP0aWTXATPx6ABaVzo6iULcSU+KDaoHgx3pg0Uof/qBC
         aRSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Mm78ibra3NYwiwOIUCiCk4u8Rur042bJ4o/+pc9QA4yGEFVTfhxiR+hIoqNrmwW944KGoEyCE/ta9sg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2A6p34HriPIFmMPSu/9V7VDaEjNlsiz6MIyb2wQAexngi52Xs
	avg9YBwRleovQb6jSw9hr3aN6739NbHs2uVscW1xeWN0zfCiOYVJVwhk
X-Gm-Gg: Acq92OEXFgf6cyEBHKqWlhz+8USnnKFTDW9dPJjDfnOkMoCGdNyjICf2gjEDerjWGVn
	/sD+4gxvxJY3hi7ecnBGvdtj9cHGzTml1PJKGCAw7x8JivAOo4uwxXb4xLUoQ4+RissFLFj4PRS
	E8hLpAgGp/gqpPELvqdnF+/xoPSwHhB9tFvbFitJ0TJKNRJGt8ajgv5F0XEDTtOK8lXzeMlH2OX
	kmPPeuIxp4c0ACjwvAWQDqFuB6jmjHvWidywzTZ4ucQ7Z58kIILRm61PPrRsvqrz9WDRG2J79fn
	DXvLaSwkRu4xkI3xphxUfE5ye+y/GhiXnqLysPfQwOod4vym20zQ5Armd2R6gYnKUYCUj/0kLrQ
	ggD6P8TKmyeO9E139IkqP99d8sdWObOauJJyypzIliggs1IccVkMIfve8M2h4z9egbZA8/ULpaI
	W1ML86PP8IVOmvqjp9
X-Received: by 2002:a05:6000:2384:b0:43f:e990:2f5d with SMTP id ffacd0b85a97d-46077f2db06mr17081462f8f.35.1781549916699;
        Mon, 15 Jun 2026 11:58:36 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d28sm38040538f8f.20.2026.06.15.11.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 11:58:36 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4] ASoC: dt-bindings: mtk-btcvsd-snd: Convert to DT Schema
Date: Mon, 15 Jun 2026 20:57:50 +0200
Message-ID: <20260615185810.11804-1-l.scorcia@gmail.com>
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
Changes in v4:
- Removed minItems, maxItems properties from reg node
- Removed the reg-names property
- Adjusted the example

Changes in v3 [3]:
Sorry about the spam. A second round of dt_binding_check + dtbs_check
led me to additional improvements:
- Use reg-names in place of a non-informative description property
- Simplify the reg property in the example

Changes in v2 [2]:
- Fixed issues from make dt_binding_check
- Set myself as maintainer for the binding

Initial version [1].

[1] https://lore.kernel.org/20260420204514.1640995-1-l.scorcia@gmail.com/
[2] https://lore.kernel.org/20260421154619.227039-1-l.scorcia@gmail.com/
[3] https://lore.kernel.org/linux-mediatek/20260421193858.347258-1-l.scorcia@gmail.com/

 .../sound/mediatek,mtk-btcvsd-snd.yaml        | 59 +++++++++++++++++++
 .../bindings/sound/mtk-btcvsd-snd.txt         | 24 --------
 2 files changed, 59 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
new file mode 100644
index 000000000000..1b7451655476
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mtk-btcvsd-snd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek ALSA BT SCO CVSD/MSBC
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
+      - description: PKV region
+      - description: SRAM_BANK2 region
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

