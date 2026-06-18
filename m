Received: from smtp153-140.sina.com.cn (smtp153-140.sina.com.cn [61.135.153.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5298A39AD33
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 08:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781771378; cv=none; b=Cn1DypHYfaogv+CzZZORSol0F8fMSsWGxFFlvxy4BRC26CPS3MxwHFpbsgN3pLC7IwdKixjws1kygafGh2e89VOFG8j09UQnh2zZw0NXGkXATn9WyOCDnrgrglG/XT9BC9C+NBk7ibiLD0oc+uhi3FaWmtDeHiKyq6j7iiJAfQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781771378; c=relaxed/simple;
	bh=SXlR9+pQ3c5kEsvu7d/n/oF80wFlhAN+RC4JAmRTUpA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=NaC0IO9mVyATE3sv3ra6tQ5O4cGDIZ6rjm/I/lUMbtBgxEEWvIiFW9Nao3OcyGi4iocJFqct6Jp3J8DIpfbnB89xiOepdnrf7TD/kKZO3prmQ3ldeB+HaEVxkIcT0Cdtkv919LyrWVrwvZGY0b97AXNGSmAR7/9XAGzdnm13Ego=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6A33AC4300004CAE; Thu, 18 Jun 2026 16:28:53 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: EC3586B3FB904EE09CAFBF76D4DE8AB8
X-SMAIL-UIID: EC3586B3FB904EE09CAFBF76D4DE8AB8-20260618-162853
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v2 1/7] ASoC: dt-bindings: ES8389: Add members about HPF and clock
Date: Thu, 18 Jun 2026 16:28:36 +0800
Message-Id: <20260618082842.2778-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260618082842.2778-1-zhangyi@everest-semi.com>
References: <20260618082842.2778-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Add members related to HPF and mclk_source

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 .../bindings/sound/everest,es8389.yaml           | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8389.yaml b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
index 7db84cf11..88fbce7b0 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8389.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
@@ -42,6 +42,21 @@ properties:
     description:
       Interface power supply.
 
+  everest,mclk-src:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      Indicates that SCLK is used as the internal clock.
+    minimum: 0
+    maximum: 0x01
+    default: 0x00
+
+  everest,hpf-frq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The frequency of HPF in Hz.
+    maximum: 1020
+    default: 16
+
 required:
   - compatible
   - reg
@@ -62,5 +77,6 @@ examples:
         #sound-dai-cells = <0>;
         vddd-supply = <&vdd3v3>;
         vdda-supply = <&vdd3v3>;
+        everest,hpf-frq = <16>;
       };
     };
-- 
2.17.1

