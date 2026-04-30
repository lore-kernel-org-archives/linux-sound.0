Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4728829B764;
	Thu, 30 Apr 2026 02:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777515896; cv=none; b=EFhAq0NPYmlzFEt3Ndh+OPoM9/th44ZI+iPq7h+Xip7QL7WEmbWhRZkqD5xT27asSebCqs15fA+nFehu3hwIqy7vbQGHpZmu05FCIBLmAeenxyXPZ3buZWtVn6GhpmeIVCkBGCzelB14Q4WyWZ5FHObao6o2FQtSkVjpfN+L7Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777515896; c=relaxed/simple;
	bh=wfCKSeLwH3NZDXYCpiWAto5KNoOjR+Aja8oWGr3EebM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mb257X4G120XHh5OlqNkzhFuSynS+fLgh02IMFQkQXE2n4+goblzPnBk862vlDJSaMNXPV95nbB6H9iMrWkeeka3phET5EnoUAzbz/tbUECqwAroDTrSIKXVqvJPdIDNER2CjX5bgcbwrcPPgy7HO4GZVSIjrS6K0EMa/DZvqxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=imhhZWYh; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="imhhZWYh"
X-UUID: be17d44c443b11f19a16598d5ca7f8ec-20260430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=F4bQdtWr1UGDHgb8P4Qhggd4tq+ItN7H3PA0UGpnJWI=;
	b=imhhZWYhUr/ldUpB5QfuZDIF8ICAo2zhXGGtOHAnSQIH60GdEjgunM3iwiyfZ060AD8Hvtpwai/ozyxQM/LGHyfjF88AGQmMHGkP0EYQkfgGzeI/sBCrs3l+r/lxBezf3rGNiB+mOboA2sUy/JFKV/WY3/dw8ZxX6Ei/VWeTsCI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:4ed0d31c-dfec-4fba-9632-c988ec0ae158,IP:0,U
	RL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:1006e444-8360-4d24-8500-9b9380fa4b0d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:11|97|99|83|106|1,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: be17d44c443b11f19a16598d5ca7f8ec-20260430
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <cyril.chao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1737602633; Thu, 30 Apr 2026 10:24:40 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 30 Apr 2026 10:24:39 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 30 Apr 2026 10:24:38 +0800
From: Cyril Chao <Cyril.Chao@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Cyril Chao <cyril.chao@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Darren Ye
	<darren.ye@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Cyril Chao <Cyril.Chao@mediatek.com>
Subject: [PATCH v9 07/10] ASoC: dt-bindings: mediatek,mt8196-afe: add audio AFE
Date: Thu, 30 Apr 2026 10:23:20 +0800
Message-ID: <20260430022417.32282-8-Cyril.Chao@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260430022417.32282-1-Cyril.Chao@mediatek.com>
References: <20260430022417.32282-1-Cyril.Chao@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Darren Ye <darren.ye@mediatek.com>

Add mt8196 audio AFE.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Cyril Chao <Cyril.Chao@mediatek.com>
---
 .../bindings/sound/mediatek,mt8196-afe.yaml   | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
new file mode 100644
index 000000000000..949f8622baf9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8196-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Audio Front End PCM controller for MT8196
+
+maintainers:
+  - Darren Ye <darren.ye@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8196-afe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: mux for audio intbus
+      - description: mux for audio engen1
+      - description: mux for audio engen2
+      - description: mux for audio h
+      - description: audio apll1 clock
+      - description: audio apll2 clock
+      - description: audio apll12 divide for i2sin0
+      - description: audio apll12 divide for i2sin1
+      - description: audio apll12 divide for fmi2s
+      - description: audio apll12 divide for tdmout mck
+      - description: audio apll12 divide for tdmout bck
+      - description: mux for adsp clock
+
+  clock-names:
+    items:
+      - const: top_aud_intbus
+      - const: top_aud_eng1
+      - const: top_aud_eng2
+      - const: top_aud_h
+      - const: apll1
+      - const: apll2
+      - const: apll12_div_i2sin0
+      - const: apll12_div_i2sin1
+      - const: apll12_div_fmi2s
+      - const: apll12_div_tdmout_m
+      - const: apll12_div_tdmout_b
+      - const: top_adsp
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - memory-region
+  - power-domains
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        afe@1a110000 {
+            compatible = "mediatek,mt8196-afe";
+            reg = <0 0x1a110000 0 0x9000>;
+            interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
+            memory-region = <&afe_dma_mem_reserved>;
+            power-domains = <&scpsys 14>; //MT8196_POWER_DOMAIN_AUDIO
+            pinctrl-names = "default";
+            pinctrl-0 = <&aud_pins_default>;
+            clocks = <&vlp_cksys_clk 40>, //CLK_VLP_CK_AUD_INTBUS_SEL
+                     <&vlp_cksys_clk 38>, //CLK_VLP_CK_AUD_ENGEN1_SEL
+                     <&vlp_cksys_clk 39>, //CLK_VLP_CK_AUD_ENGEN2_SEL
+                     <&vlp_cksys_clk 37>, //CLK_VLP_CK_AUDIO_H_SEL
+                     <&vlp_cksys_clk 0>, //CLK_VLP_CK_VLP_APLL1
+                     <&vlp_cksys_clk 1>, //CLK_VLP_CK_VLP_APLL2
+                     <&cksys_clk 80>, //CLK_CK_APLL12_CK_DIV_I2SIN0
+                     <&cksys_clk 81>, //CLK_CK_APLL12_CK_DIV_I2SIN1
+                     <&cksys_clk 92>, //CLK_CK_APLL12_CK_DIV_FMI2S
+                     <&cksys_clk 93>, //CLK_CK_APLL12_CK_DIV_TDMOUT_M
+                     <&cksys_clk 94>, //CLK_CK_APLL12_CK_DIV_TDMOUT_B
+                     <&cksys_clk 45>; //CLK_CK_ADSP_SEL
+            clock-names = "top_aud_intbus",
+                          "top_aud_eng1",
+                          "top_aud_eng2",
+                          "top_aud_h",
+                          "apll1",
+                          "apll2",
+                          "apll12_div_i2sin0",
+                          "apll12_div_i2sin1",
+                          "apll12_div_fmi2s",
+                          "apll12_div_tdmout_m",
+                          "apll12_div_tdmout_b",
+                          "top_adsp";
+        };
+    };
+
+...
-- 
2.45.2

