Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954C9224B05;
	Sun,  5 Apr 2026 23:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775432720; cv=none; b=tejMW6tTtVhkBEkimKSNgD4AkWmntpSEbuh0y1fBZD8yqfitvCufkieKrCGjRiLD/sfBvsf91wOnxs96LH0WFN1DxrbSRqlxOUKppiTh65vj3TM+VTCNvByCm0sTevOwOvaEJzLA5WTlkppRL7A3hlu1VHJvmHW8lo+ZVLv8AGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775432720; c=relaxed/simple;
	bh=dR5gGmLlm04j6mL/1zDGDOkPVSrIAHCOQ6TsiyOJnAY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m+XIEMweV/S1H5guPhnHawwR4motkRg9myJruWQWtQWT7JEvBCFinDo7fvznGS5FtSI9nzxvDFN1YRSuxnAIBVdpoD3j2LFKv1jj1qfp6aQGlqhgrUNRjJgMgGv+/DyvXRO9IY7tda4g0P0llx5IcYjEXpAZcSn5up/88KdBUjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=LcNDIM3H; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="LcNDIM3H"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3023310691F;
	Mon,  6 Apr 2026 01:45:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775432708; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=RUTS7upNpLkTBiHL9ns+U6Df2SUgQJVHGQwhcxcvFRY=;
	b=LcNDIM3HPQuciGulhzK+KLe9COYslDtIr+t8yNKEK7nFacsdGS9b91hbQGta4FKR4H81f5
	UuktUcxpKjG2VpeeK9Fniv4liduD9O8JcTmzRJ7TuUQ3oe6BDCQlX9HI3U+TIBnQtDqk/l
	WaiOKyeCF5Vj82N1Zuc/8t4uRVlDJo4lj389pZV5vjz73P4PZxiIkMvs7JnPMJxWYjMYeX
	DxCFGswKJ2wGMBZcWhtKz8vEaY2ofATT9Z58uWJ+jNwIsmB/LhJSjfZiMFSkvbe4lquyIp
	r/LEhw6L3WS/dtogxYFhCBIkMmDSK4R5VOnlZD2WnqcSwRrvK8Qg0ldXP17msg==
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
Subject: [PATCH v2] ASoC: dt-bindings: ti,tas2552: Add sound-dai-cells
Date: Mon,  6 Apr 2026 01:44:35 +0200
Message-ID: <20260405234502.154227-1-marex@nabladev.com>
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
V2: Add missing ref to dai-common and unevaluatedProperties
---
 .../devicetree/bindings/sound/ti,tas2552.yaml       | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2552.yaml b/Documentation/devicetree/bindings/sound/ti,tas2552.yaml
index 10369aa5f0a86..85e3ebd2acd84 100644
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
@@ -41,7 +44,10 @@ required:
   - iovdd-supply
   - avdd-supply
 
-additionalProperties: false
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -54,6 +60,7 @@ examples:
         audio-codec@41 {
             compatible = "ti,tas2552";
             reg = <0x41>;
+            #sound-dai-cells = <0>;
             vbat-supply = <&reg_vbat>;
             iovdd-supply = <&reg_iovdd>;
             avdd-supply = <&reg_avdd>;
-- 
2.53.0

