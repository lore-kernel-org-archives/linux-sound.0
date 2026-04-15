Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629553D8919;
	Wed, 15 Apr 2026 15:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776266625; cv=none; b=QgyaSS07hGfI4MMOoJIocOGkpszxKd06RkA42O2acvTGMI3z58Bd1FR9eiwuJOKII9krk5GxEnKFYoAEmLfQ0+FJ5kL3XagZfsRkgB8BURqwSZ8AAY50SZrjBUsgKql1MaFUtBPuR3p5VgFusmSxdYd3oT2spc+zciwOt/uXeq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776266625; c=relaxed/simple;
	bh=RsQmyos+jQGiGSypHqS1V8C9NTnJjjxQ998V/vk1VhA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrPStPgrsEv0kkRpE0gzhnXn8EedK0gr47fSGf6vyAVI8lRnNmyJk1nAyVF+Gefa2HYX9HGMG0EzrKOj6RdFDTrvNghFm71SIvFLMy+rzTG57dnVb7DqEDpGTpET8vAsg2uy8KDv1d3LExZDMmNYRahg3fF0wsdIuuQQpZPit78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wD25a-000000002e3-1YDv;
	Wed, 15 Apr 2026 15:23:38 +0000
Date: Wed, 15 Apr 2026 16:23:35 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/9] dt-bindings: sound: add mediatek,mt2701-hdmi-audio
 machine binding
Message-ID: <1fe31edbdf045f87f4cfa7ae6fa53196e8b67b96.1776265610.git.daniel@makrotopia.org>
References: <cover.1776265610.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776265610.git.daniel@makrotopia.org>

Describe the ASoC machine compatible used to wire the MT2701/MT7623N
AFE HDMI playback path to the on-chip HDMI transmitter acting as the
generic HDMI audio codec. MT7623N boards carry the same IP and use
the mt7623n- compatible as a fallback to mt2701-.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../sound/mediatek,mt2701-hdmi-audio.yaml     | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml
new file mode 100644
index 0000000000000..d08aee447b471
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt2701-hdmi-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT2701 HDMI audio machine driver
+
+maintainers:
+  - Daniel Golle <daniel@makrotopia.org>
+
+description:
+  ASoC machine driver binding the MT2701 AFE HDMI playback path to
+  the on-chip HDMI transmitter via the generic HDMI audio codec.
+  The same HDMI audio IP is present on MT7623N.
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
