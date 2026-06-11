Received: from r3-212.sinamail.sina.com.cn (r3-212.sinamail.sina.com.cn [202.108.3.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D89127FB0E
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 03:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781147920; cv=none; b=h75elH5P9KtDwvUcMWMZiJIObfd8kIAQJ2R57H1UnsX0YmsLbT+daJh62UHWrQWCEOJnKX5DVNgoeEK5SNpXlBbwBzsJXCa6+yyT8Irw/NIkMnwb5PrUFer5KDFwaESn7FA0GdxxzfWzC7Wam4gIiQFXpAmN1BVTWOiP0489NDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781147920; c=relaxed/simple;
	bh=c+f6U8XEyBC10/jWORygtaM+DQvtua4vwr2nXSwCPPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Mg0kN1umhP8B1j4NO5b/fkPGBtWzp86ujVSqTJ5MCJm1xVapHVt2EfYD4TUWDx94wpC+kTYB4UugowcpTEp4n8zd8MAzAFpvv+kh3g0msf7SaWvMULIlVEzGUMEBrEJ1jrFDfIR6R1N27pQb19NTURMEMI0wNn9wPxpPKJEtcSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A2A29030000377C; Thu, 11 Jun 2026 11:18:29 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 3655F794940D48ADA11F620B00CCFE15
X-SMAIL-UIID: 3655F794940D48ADA11F620B00CCFE15-20260611-111829
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v1 1/7] ASoC: dt-bindings: ES8389: Add members about HPF and clock
Date: Thu, 11 Jun 2026 11:18:18 +0800
Message-Id: <20260611031824.4628-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260611031824.4628-1-zhangyi@everest-semi.com>
References: <20260611031824.4628-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Add members related to HPF and mclk_source
The value of HPF is not dB, it is just the value of registers
And add HPF settings to the example

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 .../bindings/sound/everest,es8389.yaml        | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8389.yaml b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
index 75ce0bc48..be92014c0 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8389.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
@@ -38,6 +38,27 @@ properties:
     description:
       Interface power supply.
 
+  everest,mclk-from-sclk:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Indicates that SCLK is used as the internal clock.
+
+  everest,hpfl:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      the HPF value of ADCL.
+    minimum: 0x00
+    maximum: 0x0f
+    default: 0x0a
+
+  everest,hpfr:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      the HPF value of ADCR.
+    minimum: 0x00
+    maximum: 0x0f
+    default: 0x0a
+
 required:
   - compatible
   - reg
@@ -58,5 +79,7 @@ examples:
         #sound-dai-cells = <0>;
         vddd-supply = <&vdd3v3>;
         vdda-supply = <&vdd3v3>;
+        everest,hpfl = [0a];
+        everest,hpfr = [0a];
       };
     };
-- 
2.17.1

