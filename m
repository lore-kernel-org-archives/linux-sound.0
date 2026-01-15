Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EAE39B480;
	Thu, 15 Jan 2026 12:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768481820; cv=none; b=eGuS8aR2vDgh7xJMAL7IDleItfbi6UwO0cVQhXbazJeCGZ350Hzi0eT4XsmMvGOe9GoeTuGnZxGlvfTFOyPa8nAzCCQRnp7WdOFhMXnwiW44WKW5TbjaKwG19SeHM1na1BNVjn7U01qAYoa48qTR/vwlQYbZTm4nXf3VJE8BKPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768481820; c=relaxed/simple;
	bh=Q1TWR+L5EJCk8ltk3+o6+5a+NLRELXyTxRSjaigjumg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AyZ0BSISYoDl9DkfGIdDNvZCJEeCFDrfLiR9BQZ3uPlds/E2bZ2V3WLieutWQlAE8szZR3k2XtvN3CjwhxdV98S4WIrawrQhLeDkQFNEd+LaDURvdrLclbHpxGW3LWPAJr6Ir/1XdL/dcQedH2+VRadCFkhiYLgugRec8+qJrms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nnEAsli0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nnEAsli0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768481810;
	bh=Q1TWR+L5EJCk8ltk3+o6+5a+NLRELXyTxRSjaigjumg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nnEAsli0VXjwyu3dIi44q2cjh+ozeXVJXSovtksTn371xTbIBk8+o3sZXukA9tMNS
	 k98XLQhCWDGvFDhEAJ5VkbC0zAFOA39NkNIX/+01xwH+Tym4ZxneDvqFjOV4byTb1M
	 oac8gQnrepoDrDCiC48Xh6xTfBkF+0RtZ7/7rpwtA8VgibuTUlX3Y96IeZvWWRBZjh
	 CWiVt2g/xKXhkdYaeiQraUaZbJ9b3GAhonCeDtmb/l9Vu6bsgqLEXIPI9bxuYSIunm
	 OT8zDV4C3axJGIMNuLCjbUk5faXkJuSVXtVwwxG+KPswpiYbSzG8A5dhgzz4vNQ8ay
	 OZ5DKMLTiDX/g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 907AB17E13D3;
	Thu, 15 Jan 2026 13:56:49 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	julien.massot@collabora.com,
	eugen.hristev@linaro.org,
	jiaxin.yu@mediatek.com,
	shane.chien@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 3/4] dt-bindings: arm: mediatek: audsys: Support mt8192-audsys variant
Date: Thu, 15 Jan 2026 13:56:23 +0100
Message-ID: <20260115125624.73598-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the mediatek,mt8192-audsys compatible, which uses
a different audio controller (mt8192-afe-pcm) compared to mt8183
and mt2701.

This resolves a dtbs_check warning on all MT8192 devicetrees.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../arm/mediatek/mediatek,audsys.yaml         | 46 +++++++++++++------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
index f3a761cbd0fd..09a6c16e7e82 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
@@ -48,19 +48,39 @@ required:
   - compatible
   - '#clock-cells'
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: mediatek,mt8183-audiosys
-then:
-  properties:
-    audio-controller:
-      $ref: /schemas/sound/mediatek,mt8183-audio.yaml#
-else:
-  properties:
-    audio-controller:
-      $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
+allOf:
+ - if:
+     properties:
+       compatible:
+         contains:
+           enum:
+             - mediatek,mt2701-audsys
+             - mediatek,mt7622-audsys
+   then:
+     properties:
+       audio-controller:
+         $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
+
+ - if:
+     properties:
+       compatible:
+         contains:
+           const: mediatek,mt8183-audiosys
+   then:
+     properties:
+       audio-controller:
+         $ref: /schemas/sound/mediatek,mt8183-audio.yaml#
+
+ - if:
+     properties:
+       compatible:
+         contains:
+           const: mediatek,mt8192-audsys
+   then:
+     properties:
+       audio-controller:
+         $ref: /schemas/sound/mt8192-afe-pcm.yaml#
+
 
 additionalProperties: false
 
-- 
2.52.0

