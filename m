Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD7A381B0D
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 20:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776717937; cv=none; b=p30GsUfOdTVpSl1wNYpJML7icIh1QQ1wqaW/SCfKRpwQoJOmHmz7Hc9fMzllWo4sEea7uU4FKdQxPXITVzoMUEvA1y+hQDIFd1Jx//FcqpM1onRnHJs+rFrZtbZO8sw0QII/MGKYCPHeZ5/yp+IATZfsDFMcEgRT8i3dvEKRAjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776717937; c=relaxed/simple;
	bh=vZOvZ46pt7uJy3xGvIw66QB7EkGKjD412n9UrrKxX3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TBOUd4ZIBom8wPvCaaGWDqHvoMdAVH3NqvezVanA730HrqpotXUkGQal/93B5+qtjo4BzRUGW+r2pyft0BLZJYdMDr/yxeyLM4c/rakoemVrHvhL8U1kCHedqIUV8uFYOKWgtcN1I0SMdMyhzpJRJ8qSWKx4Y+rbR8hQxeMnmOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huJUy+T3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huJUy+T3"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so30970725e9.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 13:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776717934; x=1777322734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NFxnKBIb4rP9HCGv24zgq2DmExS0pP68iWUHvrzRj3k=;
        b=huJUy+T3EpARDIkHJo9jKcVq2vxtP+fLKqLc81ziGkvcB71yz1VrvhHlGid8R2KKk0
         8eNqFiJLh6MllzNBFx09Frnqzs4zpIsHimpvFxumxvqf1dsqt42HArTs2AmRZ0LG2Ge5
         RNdv+2zMFEqfvmYdJVr28bctDA8/F7NgryJWKuCoQxQrWObN5rnw6gml8+xR9p3/Vzd/
         WPYNEbjh1te+Gk0GESsUtMMd7JLwUyveXXHBC/tidxFnFt2SUFCZabzjSRttkGcIcQaA
         t5AR4f2+xxx/RvmPauksLNyqcCYXk9hUH4CRY3ZfLTtLkYuN/1lrid4aXOEYMswnba93
         93uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776717934; x=1777322734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFxnKBIb4rP9HCGv24zgq2DmExS0pP68iWUHvrzRj3k=;
        b=oRFIvjONssqBpGk2R5XfAuk8Aw/hDVmV5PJzydyzPepXXkSoKPlu33TRMiW1HpJMjE
         N/K1eswAk2HdZ2B3uCjDBbmPHhNVbd5WqLWxlvNAR+pYL9yX1yaRsew7l97EmblNIGaA
         w2l1183LhAXA6NApTI10Tm8pM9yBgTmA4UFHhmc+/00B+wKnIyC68CdfmmswGTp25qlE
         LsRBUB0X7CtKjxAKTwD0pMq8P7IctZLMUlyAAIwItM9OQPk1RbNsOUXiltl+Q99C4VjA
         n0LBP9rkj1g+uY01I8hw2Sgcc7EUPwdQPnpQQHkIGvYbXLR5YMcz1tRTlx7k77oD93aF
         Ga3A==
X-Gm-Message-State: AOJu0Yz0nvYLFn+FveSNrhFP6OV6N+2l09IKdR0NxRi/9qtCkIMM9SfZ
	ppq0kNmXf87W6u3Niom4VfwGexdSzdS6njkzR1KKQfv5hIoEn2zTKmRFPqYGfhrK
X-Gm-Gg: AeBDievPf3bOlS+JVUkafOoCo9JwDuXnA3E9w85Z2qGhlidlZEmSjIyzyo2wg3tlGAu
	VZDQtRgKCd1wzBzGqhaoButIXQ/EMmBFIGL3rQ8h0i8hwnNzlTCHSoDkbt7kWPs0/9c50ComMga
	umBMv/AwT/IIATMMNKeH467JHKQykLW0caCllsfVYjzRolCPjFES+tbiigVQzNo/lywH0972t5v
	9lO5vtpVAkN/9v5eEQUA7E1Cg7x7zycMO9DfeGHS+fmyb8/OgnQx4kAZD1mW7WmCA7j0/b7PEFj
	2ARueTsS9BN7MngCYah5HF21B4WcFeLr7skgcBvcd9+a9l0z244hhpCAGd7NF3QLLwBcOlK2aar
	gyuAH8xcxcdOJG80mC91aktvuLQyaf0EJOuqdiwa1Lpzm+cHFELOnEQuyJKJBQEeMWYbv437GRf
	0Kb6YczyTeZ90u3Nv88GVa3ZA1KyjrPg==
X-Received: by 2002:a05:600c:8115:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-488fb77d7d3mr176918155e9.21.1776717933714;
        Mon, 20 Apr 2026 13:45:33 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891c320084sm170344535e9.2.2026.04.20.13.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 13:45:33 -0700 (PDT)
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
Subject: [PATCH] ASoC: dt-bindings: mediatek: Convert mtk-btcvsd-snd to DT Schema
Date: Mon, 20 Apr 2026 21:44:30 +0100
Message-ID: <20260420204514.1640995-1-l.scorcia@gmail.com>
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
 .../sound/mediatek,mtk-btcvsd-snd.yaml        | 54 +++++++++++++++++++
 .../bindings/sound/mtk-btcvsd-snd.txt         | 24 ---------
 2 files changed, 54 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
new file mode 100644
index 000000000000..f423e3a02997
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mtk-btcvsd-snd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek ALSA BT SCO CVSD/MSBC Driver
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
+    description: Array of register offsets and masks
+    $ref: /schemas/types.yaml#/definitions/uint32-array
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
+    mtk-btcvsd-snd@18000000 {
+      compatible = "mediatek,mtk-btcvsd-snd";
+      reg = <0 0x18000000 0 0x1000>,
+            <0 0x18080000 0 0x8000>;
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

