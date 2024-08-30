Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AE9166F0D;
	Fri, 30 Aug 2024 20:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725050319; cv=none; b=e7SbwfB+/Zf0G3E3w/tOLOTW7CGZCncKUWB1lMDUHQQWBcSt8RcLIdfEGxZSJQ+4NBSFYhvq3wSbsT8yqLnbxgX+wurNWfOoykhD3u0MIw+0vX8Nf25QjoA9yY6NMcw4xX7/zGhaEQUMsMNPm+oJE0qUmEffDpIjpE1Ygbn/1Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725050319; c=relaxed/simple;
	bh=8BB2ufA+ylkkkmFozby1+CKWPfzBX92egLTtQrFhEy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=de0qysk8+9Jc2DEbCj2++YSUMOuFJIiC1kFdiOzK1ZClfv4mgfSLVIpHnbRFozAXYuGktakeAtKkFlybm4i5k47Y9P/doyu2ZlMu9fhRqmsor0i9RNSVQhpnkaZzCIlpvr+dbWAFQ6Ln8pQFYkq4ZYiREKuANcs7wYWLlauMOmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=SwHgq+kp; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="SwHgq+kp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VC7uW2jsMg3kt3gjJ1vEywpnvPfD/SXYNyfLRKzT+Og=; b=SwHgq+kpTqUByPY+FNnjPCwfpe
	n7NnN0G1bwg5kjtA/H8jyE9OFwvsLGHdvvL+J8xFIaVe5Y5BhWS8l79NJy5mVPtWmMtGWOXs2xSDN
	JguDzXlUgRxA6gX0SieSHb9ktarPUbQgMSiC8HGWIsmzZsGO8AoWqmPVSVcuLrFFpzMGynM+zt1E8
	n20oENcOFXWLRrc/wbtrf07Mf/cTTjyj1yaLgA6R7c9/TNaJGsfljAOPrZXAPJPwOQOCILsZqXTmx
	aLCPScL8cQBW3dPj6oVUsPUcrcPvUqKCWzj5jtR5mLZKeoThfaXFt0p+6ywC757Vq4nfK1nZDG2X1
	G700jrWg==;
Received: from i5e861921.versanet.de ([94.134.25.33] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sk8OA-0006ey-4U; Fri, 30 Aug 2024 22:38:34 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	marcin.juszkiewicz@linaro.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 1/3] ASoC: dt-bindings: realtek,rt5616: document mclk clock
Date: Fri, 30 Aug 2024 22:38:17 +0200
Message-ID: <20240830203819.1972536-2-heiko@sntech.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240830203819.1972536-1-heiko@sntech.de>
References: <20240830203819.1972536-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both devicetrees and driver implementation already use the specified mclk
in the field, so at least document the clock too, similarly to other
Realtek codec.

This has the nice additional effect of getting rid of dtbscheck warning.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../devicetree/bindings/sound/realtek,rt5616.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5616.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5616.yaml
index 248320804e5f..754111f2e70a 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5616.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5616.yaml
@@ -30,6 +30,14 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: Master clock to the CODEC
+
+  clock-names:
+    items:
+      - const: mclk
+
 required:
   - compatible
   - reg
-- 
2.43.0

