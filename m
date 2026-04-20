Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE3C2494D8;
	Mon, 20 Apr 2026 01:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776647603; cv=none; b=RAnwxb2YDRo/aSdwOhu+kn1R77whIog1DrRK+QzaBpr/r8ACx6GBOvM/uA+MwFNfuBQheasRJCHVjLBLPYtIbXCo0KpnNGZ+SySqtQ82CiM+dVs49E5fLGs0CvH2knHTNGId6hQjSd6J5tsqtZQHCFtiaCnKuvjucGK0zHnsTDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776647603; c=relaxed/simple;
	bh=qM8S7mF3jI6kc+lzx3wSg5HiRfbtbZmcb5zYXNFQ3m4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHzgnHaNU9xh1z4QPLJrmUBZQPgfVVpZLvXddstgl+lL7cG+0WKPTf52fyKqWU7msS78tNb7/vIgsPRaMUhK97Wnz8MlAtdWpmGsJjreLEpmFWBknNzIvIPpVV3IJu9CLfzapl25CBBRbCL1evuTG/LsvvpEbjxc8KqTXSMQdds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wEdCO-000000002Wd-1Hpa;
	Mon, 20 Apr 2026 01:13:16 +0000
Date: Mon, 20 Apr 2026 02:13:13 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, Cyril Chao <Cyril.Chao@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/9] ASoC: dt-bindings: mediatek,mt2701-hdmi-audio: add
 MT2701 HDMI audio
Message-ID: <072c4db4a01ac125e9ee5e34f992cd169c78e117.1776646435.git.daniel@makrotopia.org>
References: <cover.1776646435.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776646435.git.daniel@makrotopia.org>

Describe the sound card node that routes the MT2701/MT7623N AFE
HDMI playback path to the on-chip HDMI transmitter. This is
separate from the AFE platform binding (mediatek,mt2701-audio)
because it represents board-level audio routing between the AFE
and the HDMI codec, not an additional IP block. MT7623N boards
carry the same IP and use the mt7623n- compatible as a fallback
to mt2701-.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2:
 * Fix subject prefix to use schema filename (Krzysztof Kozlowski)
 * Rewrite title and description to describe hardware, not driver
   (Krzysztof Kozlowski)
 * Clarify in commit message why this is a separate binding from
   mediatek,mt2701-audio (Krzysztof Kozlowski)

 .../sound/mediatek,mt2701-hdmi-audio.yaml     | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml
new file mode 100644
index 0000000000000..9d5a8166e51ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt2701-hdmi-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT2701/MT7623N HDMI audio output
+
+maintainers:
+  - Daniel Golle <daniel@makrotopia.org>
+
+description:
+  Sound card routing the MT2701/MT7623N Audio Front End HDMI
+  playback path to the on-chip HDMI transmitter. The AFE
+  provides the DMA memif and internal I2S engine; the HDMI
+  transmitter acts as the audio codec on the serialised link.
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,mt2701-hdmi-audio
+      - items:
+          - const: mediatek,mt7623n-hdmi-audio
+          - const: mediatek,mt2701-hdmi-audio
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle of the MT2701/MT7623N AFE platform node.
+
+  mediatek,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle of the HDMI transmitter acting as audio codec.
+
+required:
+  - compatible
+  - mediatek,platform
+  - mediatek,audio-codec
+
+additionalProperties: false
+
+examples:
+  - |
+    sound-hdmi {
+        compatible = "mediatek,mt7623n-hdmi-audio",
+                     "mediatek,mt2701-hdmi-audio";
+        mediatek,platform = <&afe>;
+        mediatek,audio-codec = <&hdmi0>;
+    };
-- 
2.53.0
