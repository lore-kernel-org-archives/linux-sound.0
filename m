Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3DA37BE78;
	Tue, 24 Mar 2026 01:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317483; cv=none; b=RngsHfue+RGyTUNU92rs67WXjRLxkk9n3iYpkiHEPsJVMMnvscaWotUbAOX1iyxcfPnr6ounY5D9FSfp12Zlkno7getjKMOsErEhx6Jutom3Jq/gwZeyoJC64JDpJdeywQzg3Vtye53f3tW5ko1VF+CPfGqUySUOcJtRmClADBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317483; c=relaxed/simple;
	bh=5qVbxg1Wmr/mKjxhzOndnIFmz605wjX3zkHPAK1xWtw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aS9lS3gj3jNhtkFhB/Dwr+9UtrzPHnIzZFrGgolsMIkHb/ihur0r5pLkJdtqfoVhNLZnfdjkszWJPBg2s0jM4pr8sp85UgoCfUNCfLpNh6coaYpD3UljxFPSLtlz+LsvMuNrSzWbOJThnuPKScxHR6bHZhEr9//SfuUaSzr06ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hvehIPIy; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hvehIPIy"
X-UUID: dfe364d0272411f1a39cd589f645bc18-20260324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wFq7fPhJTnDY6rNObjlYeKvvJfO2sLy6Ge5fBKZStFc=;
	b=hvehIPIytmw8KTv3Dtgm6AW9l9QUvMsoTMnMzHCMMOR8Qz3l+C7euqtXdvFTxDAoeA0AhCbmmtt+NIzEEI85VXj+dbiPYPJj99E1ptKhzqmbC9pcWxvYTc+bv++oM08jZAVU8bhJJ9qtJ5z+z1eu6koYBUTvmCnbBZNmakRrH2s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:679a4497-4a10-4d0e-b008-cca353b527e5,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:f4f00817-aa6b-4b2e-be76-373ef1a42b04,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:11|97|99|83|106|1,File:130,RT:0,Bulk:nil,QS:nil,
	BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dfe364d0272411f1a39cd589f645bc18-20260324
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <cyril.chao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 346992216; Tue, 24 Mar 2026 09:57:55 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 24 Mar 2026 09:57:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 24 Mar 2026 09:57:53 +0800
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
Subject: [PATCH v8 09/10] ASoC: dt-bindings: mediatek,mt8196-nau8825: Add audio sound card
Date: Tue, 24 Mar 2026 09:56:50 +0800
Message-ID: <20260324015719.17543-10-Cyril.Chao@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260324015719.17543-1-Cyril.Chao@mediatek.com>
References: <20260324015719.17543-1-Cyril.Chao@mediatek.com>
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

Add soundcard bindings for the MT8196 SoC with the NAU8825 audio codec.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Cyril Chao <Cyril.Chao@mediatek.com>
---
 .../sound/mediatek,mt8196-nau8825.yaml        | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-nau8825.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8196-nau8825.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8196-nau8825.yaml
new file mode 100644
index 000000000000..83350faa1e29
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-nau8825.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8196-nau8825.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8196 ASoC sound card
+
+maintainers:
+  - Darren Ye <darren.ye@mediatek.com>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8196-nau8825-sound
+      - mediatek,mt8196-rt5682s-sound
+      - mediatek,mt8196-rt5650-sound
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8188 ASoC platform.
+
+patternProperties:
+  "^dai-link-[0-9]+$":
+    type: object
+    description:
+      Container for dai-link level properties and CODEC sub-nodes.
+
+    properties:
+      link-name:
+        description:
+          This property corresponds to the name of the BE dai-link to which
+          we are going to update parameters in this node.
+        items:
+          enum:
+            - TDM_DPTX_BE
+            - I2SOUT6_BE
+            - I2SIN6_BE
+            - I2SOUT4_BE
+            - I2SOUT3_BE
+
+      codec:
+        description: Holds subnode which indicates codec dai.
+        type: object
+        additionalProperties: false
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 2
+        required:
+          - sound-dai
+
+      dai-format:
+        description: audio format.
+        items:
+          enum:
+            - i2s
+            - right_j
+            - left_j
+            - dsp_a
+            - dsp_b
+
+      mediatek,clk-provider:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: Indicates dai-link clock master.
+        enum:
+          - cpu
+          - codec
+
+    additionalProperties: false
+
+    required:
+      - link-name
+
+required:
+  - compatible
+  - mediatek,platform
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8196-nau8825-sound";
+        model = "mt8196-nau8825";
+        mediatek,platform = <&afe>;
+        dai-link-0 {
+            link-name = "I2SOUT6_BE";
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
+            codec {
+                sound-dai = <&nau8825>;
+            };
+        };
+    };
+
+...
-- 
2.45.2

