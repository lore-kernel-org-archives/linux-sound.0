Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D59C7081A;
	Sat,  4 Apr 2026 03:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775273847; cv=none; b=RS+3eE6rHYOVmPGMVd6iv00H37oBbe8QdLpe9JctI5kc20zliPpVT+DV2ojoTFza1jGG7gijnC0eNjekClkseuCZ6OyTtTznnq+YIRX+7RtyHYKtSnzUKbboAkwEZyHmrDKzLopoPchEpA2X6IP5AX3XkjKneNkLQ4tvppZ7MZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775273847; c=relaxed/simple;
	bh=1tvXRwS09ZzJjjEs9WtCpWXms+pEPfd/SuI9LiFjs+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ohsuh4TvRtub3bD/MpnrhWdRKI4Ur/6CEqH2doytoNfx1dWfe9IJywJ4j7CussEkpVK6s6gBwGK8+bp+hVRHc61nlHBnLfjPl9P4aUCnpcORe5Tt3QUz5jvuRhtwZe1xm1At6H5OHEz7pVOl4HSgzCP9Ijg+6PqECfLSsCVBJ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=jCgXOhBN; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="jCgXOhBN"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D46E011311A;
	Sat,  4 Apr 2026 05:37:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775273836; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=hiJCmR5ixpPNTGgaozyisC5HNhSbpDiqeh2G6vMXj7A=;
	b=jCgXOhBNYiH4/nUDxj4fzSnRZ17ACaH7FlNyXluP/eQPdh1lqqeEAIUS+Q6fov64YuKkAD
	7aDBkOFrytRfUHZBwy+V4TjlhBrgntusfXSfQ9pnnk89aKHuAfnq0XQZRTIFEcyONglTVs
	U+1HT0P0sqrrCcKqHlQA1OlPsHA8mTfyZj2jBtRxM85eFlXDg+eo3FdXUhgSYW+KHVBfDf
	0X1QpDxJEnLDOKvBD2ibzJhjelNEl7q9Lo3FykcEHg4y6BzTS2jol9umdRY4a0Xb0/ULQO
	g4c1u3HPeNMvRBu176t/ZiewmDWPPByvOmX4G7YlS2gHQIde+k+6WIF7yCpWhA==
From: Marek Vasut <marex@nabladev.com>
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Lu <kevin-lu@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: ti,tas2552: Add sound-dai-cells
Date: Sat,  4 Apr 2026 05:36:56 +0200
Message-ID: <20260404033709.340026-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add missing sound-sai-cells for this codec into schema.
At the same time, drop trailing spaces from description.

Fixes: 506e0825a4c9 ("ASoC: dt-bindings: Convert ti,tas2552 to DT schema")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Baojun Xu <baojun.xu@ti.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Lu <kevin-lu@ti.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org
---
 Documentation/devicetree/bindings/sound/ti,tas2552.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2552.yaml b/Documentation/devicetree/bindings/sound/ti,tas2552.yaml
index 10369aa5f0a86..7c7a9e624b898 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas2552.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2552.yaml
@@ -12,8 +12,8 @@ maintainers:
   - Baojun Xu <baojun.xu@ti.com>
 
 description: >
-  The TAS2552 can receive its reference clock via MCLK, BCLK, IVCLKIN pin or 
-  use the internal 1.8MHz. This CLKIN is used by the PLL. In addition to PLL, 
+  The TAS2552 can receive its reference clock via MCLK, BCLK, IVCLKIN pin or
+  use the internal 1.8MHz. This CLKIN is used by the PLL. In addition to PLL,
   the PDM reference clock is also selectable: PLL, IVCLKIN, BCLK or MCLK.
 
   For system integration the dt-bindings/sound/tas2552.h header file provides
@@ -34,6 +34,9 @@ properties:
     maxItems: 1
     description: gpio pin to enable/disable the device
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
@@ -54,6 +57,7 @@ examples:
         audio-codec@41 {
             compatible = "ti,tas2552";
             reg = <0x41>;
+            #sound-dai-cells = <0>;
             vbat-supply = <&reg_vbat>;
             iovdd-supply = <&reg_iovdd>;
             avdd-supply = <&reg_avdd>;
-- 
2.53.0

