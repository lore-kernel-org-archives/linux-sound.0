Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F27E22D7A9;
	Mon, 20 Apr 2026 01:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776647596; cv=none; b=XjZug2v0QHkINPIL8qAzKVA+4m/wpSL3tDsrSfAAsGndSo/9bQvYeQe5nYbEcqED/x0aay3fPtHWN0gtfLUWPAjykhXKvFHoS0jPmRRSrjjvNgulYDJn8RXjBgY8tdEooHJHwTe3gFgJJGJxqAB7ZMKJFj3Bs54IJSGc+FeT9Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776647596; c=relaxed/simple;
	bh=c++vziUSEo4eHpLRmyoLGCp+/woYtt4HPRhlZ5kUvv0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bd0+lfck5ms3LeFDM4zhIM1IlH/3We4N2+2eQi/ewGlFw1ljZx8W8Vg2Wyl51sL6C/uRT0U67OzB9TS7+BzM8wcVhfVeVstVqUFE7sPxN98BlICXTOufp9CsZr2pe4hPP3xbGllbcElle6kw/2NZ5DUy+B7dgZwbAbxCqmx9azY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wEdCG-000000002Vz-1Irw;
	Mon, 20 Apr 2026 01:13:08 +0000
Date: Mon, 20 Apr 2026 02:13:05 +0100
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
Subject: [PATCH v2 1/9] ASoC: dt-bindings: mt2701-afe-pcm: add HDMI audio
 path clocks
Message-ID: <69f0b69e49068695db4ba6164c0757ccdf9786fd.1776646435.git.daniel@makrotopia.org>
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

Document four additional optional clocks feeding the HDMI audio
output path on MT2701: the HADDS2 PLL (root of the HDMI audio
clock tree), the HDMI audio and S/PDIF interface power gates,
and the audio APLL root gate. Older device trees that do not
wire these up remain valid via minItems. MT7622 does not have
HDMI audio hardware, so its compatible is restricted to the
base set of 34 clocks.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2:
 * Restrict the four HDMI clocks to mediatek,mt2701-audio only
   using an allOf/if/then conditional; MT7622 is capped at 34
   clocks (Krzysztof Kozlowski)

 .../bindings/sound/mediatek,mt2701-audio.yaml | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml
index 45382c4d86aa3..871bf197650b5 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml
@@ -32,6 +32,7 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 34
     items:
       - description: audio infra sys clock
       - description: top audio mux 1
@@ -67,8 +68,13 @@ properties:
       - description: top audio a1 sys pd
       - description: top audio a2 sys pd
       - description: audio merge interface pd
+      - description: HADDS2 PLL 294 MHz (HDMI audio path root)
+      - description: HDMI audio interface pd
+      - description: S/PDIF interface pd
+      - description: audio APLL root pd
 
   clock-names:
+    minItems: 34
     items:
       - const: infra_sys_audio_clk
       - const: top_audio_mux1_sel
@@ -104,6 +110,10 @@ properties:
       - const: audio_a1sys_pd
       - const: audio_a2sys_pd
       - const: audio_mrgif_pd
+      - const: hadds2pll_294m
+      - const: audio_hdmi_pd
+      - const: audio_spdf_pd
+      - const: audio_apll_pd
 
 required:
   - compatible
@@ -114,3 +124,16 @@ required:
   - clock-names
 
 additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7622-audio
+    then:
+      properties:
+        clocks:
+          maxItems: 34
+        clock-names:
+          maxItems: 34
-- 
2.53.0
