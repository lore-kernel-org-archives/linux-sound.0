Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9E63D4123;
	Wed, 15 Apr 2026 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776266617; cv=none; b=d27HOso8s1ZkTAV08t4MgRYo9hKtdnG4sJpnvH7F3zsS3zLTY2sdP/Gf/NWHufKD7UNGMBCHPQo/9/YdGESKf9MS3oxMvbg0xvXNs6p4QCCHoYqKCQZHrLcX9leUub0chMAmxs3IaIVa5GIRN6otSu5WUsg0Mtp7KoTIX9d7q+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776266617; c=relaxed/simple;
	bh=1XgVvkQGSRvXWrJRGtWIepEf78wCmrzACX3EK+/YmdI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tw75mJHhZTNW0YHzurwLfDpk6k+PWhrbucXO+QKu32mWe7sL2tfarEpwQ5BHFTJM7oASfkhX72AW0Bkqa9FDHnB3fX9Ab2YIhAw00G1D+ZW1amw8j3Xag0ogXie+KDHbo1xXjATpDH+SC7C/SrNKU2ZsdH0NIC0wc5kjDpIAm/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wD25S-000000002dc-1Uez;
	Wed, 15 Apr 2026 15:23:30 +0000
Date: Wed, 15 Apr 2026 16:23:27 +0100
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
Subject: [PATCH 1/9] dt-bindings: sound: mt2701-afe-pcm: add HDMI audio path
 clocks
Message-ID: <50afd83a314cd20c715fb9b0d3bc85fb00f9a6eb.1776265610.git.daniel@makrotopia.org>
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

Document four additional optional clocks feeding the HDMI audio
output path on MT2701 and MT7623N: the HADDS2 PLL (root of the
HDMI audio clock tree), the HDMI audio and S/PDIF interface power
gates, and the audio APLL root gate. Older device trees that do
not wire these up remain valid via minItems.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../bindings/sound/mediatek,mt2701-audio.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml
index 45382c4d86aa3..9d4fc542cd72c 100644
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
-- 
2.53.0
