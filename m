Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CDD3914EF
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 12:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774614035; cv=none; b=uFFkjWyyj7Vw6roIGaOEZ6izQTLsXoxLSfjeX/aGoTVqlWO0L+z975KEWomK8XqUeqVuYWl607Cu/Ty57ByQ+mRmaIayv5a2BynYHl+xgdmmxTqoeEmNzVJWHrbDaZmPNkh8o6JQCBZWtaw6uD5/Xzb2JWqBSJSlx5uoqT7IcSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774614035; c=relaxed/simple;
	bh=s5NOF5eMOnJyYCSE4Z/REtqAiJgd4OvH9dfIy16bDv0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sbado6SbsNnMsUtt7BTJbSh0GUVY2j0DMmhbysUr2Sjy9yESxHJyueSM2dmE688UB3I1vEdJroFlUSdW95kamDQXCdpEIAuRU+ST8b/5cGuV7anNPIMfd4+hSkRpvHuEyjxy9sPpYsQpkhUTic0X8XNXSQsy6iYCQ0APJ0xqzeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8yiShL3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8yiShL3"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a8fba3f769so8668265ad.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 05:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774614031; x=1775218831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q0xqJLu4fqarUjM0mYZbn2i25aKKF+eB1PFrbYNA0Ak=;
        b=S8yiShL33nUprTaTkDVG17QTj9nnzBdqKZCzR5PHsqNGHL7x4dBR+E0A3VZPECdZo9
         JUsRO+TMELJ534ceWph+fIU9GjsxgDRPF8PVrKQCCDfDdoK6vUfiImcbA4ae9I8Sx4Gm
         AJxnzZsRrrlgpUNryjKl7OQG2omTjyPBWZ8cSia8trn3ilVln62jp09M42rfz80HsY8D
         y9yInSnVl9CmjT5eX/KuzQ4/a6W6R9COTEcO6J6WvEw4gTF+Ib0+r6BcYhUHBPs9o1Lw
         gxgyQP2imU6ocA/mij7NdzSUdyr+DJDyApLTNmgFhb0ufNP/OcARcsrZOqGG+en+ROFU
         7Nkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774614031; x=1775218831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0xqJLu4fqarUjM0mYZbn2i25aKKF+eB1PFrbYNA0Ak=;
        b=iB4yEHdc0IBlIMKcZGgPEOelntKC6dccbAhwHMRl5Inu4JQ6+535a3ueHZCfBH2xqr
         F5vHIQsBNUAwymFae/F0xh4NicdYp7YSSd6UU31FOCCaiCI646UE8gEi95N/kE4gkGc5
         VgPNxLTIqV/cCuyCkKTdhXTIRVniUeFKPdMpDmCBwKUCfXQr6VB41O3Pu/olpwGM2bjs
         5jVWTeOP4yWftbNscKXb8LvhKvePO4cbufURVmBP7BxbH6awzOWFhvS5DYz5K4HlR8Lk
         cma5iXSUdwn5VzHrKv0eqNInNn5rEd+FAYnjR+ZX6xHKJzecB0WXvoQ2LZL5WhHtCHUF
         kBQA==
X-Forwarded-Encrypted: i=1; AJvYcCXl3t7ptj3ZdFpIlRlcH7a1mI9txG01ku3oZt6Pzi4fpUPUT8whW01nPmYFer3P0m4f6oskZfMMrUhIKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyU4xtcd0buyb/mng19v4yLwMzt0cR2cAwapXhn/zVJZQB6p47c
	VFJplOxTJXzBSrvGdwan+bgxEbXh9Bg8VGzmOhO4vJtli9aXjyn1+Arf
X-Gm-Gg: ATEYQzzzoDSWUtxkf+HgiyAePIms1NLGuaYhOBC5JfiAO2515qutrWk4pQ8PDk6bkJ/
	8yVwshmKWw0Ly6uC6zwI6pA3q4i0svorMfaTSEuEMq1SHe29dwiYQ98DwknrPsWXwIMZTDtxKPY
	4N/lB15NBe7+n8jwZB0HAG+gLJGyeSf8HmGXOk7bLcoa9Vq8VJ9SWFOSumesnpB+yKjhTXUru8y
	d0mpXgPwX9elEERWfvQXF19agEH1DIJDO9mC9le2eBrLRyNcCNqmaTA/GwCDQzZRFBMq3FF5CJ6
	Y5w1sDyqLXZyDCXmJejAvjQavYDZu5boBMwBk+8APG8kEfijloTXN5sbiiLtiP7SW+ILZaJq4ti
	Ya6leSKimOA8no1JWue/mfQguE0rfHFBt8310p11eqJI25jmMVAY1k98XSiSUopPsXhks8US6T4
	YY1L0Dg6plnQlC4TAtuO/XVKl18OELdk+oFpp4
X-Received: by 2002:a17:903:285:b0:2b0:51f6:d468 with SMTP id d9443c01a7336-2b0cdc22e12mr29126895ad.17.1774614031351;
        Fri, 27 Mar 2026 05:20:31 -0700 (PDT)
Received: from padmashree.. ([2401:4900:62fa:f2a3:309a:44f:430e:edf0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7a9deesm57230505ad.28.2026.03.27.05.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:20:30 -0700 (PDT)
From: Padmashree S S <padmashreess2006@gmail.com>
To: k.marinushkin@gmail.com,
	lgirdwood@gmail.com
Cc: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Padmashree S S <padmashreess2006@gmail.com>
Subject: [PATCH v3] dt-bindings: sound: Convert pcm3060 to DT Schema
Date: Fri, 27 Mar 2026 17:49:18 +0530
Message-ID: <20260327121919.603768-1-padmashreess2006@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert pcm3060 to DT Schema

Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
---
 .../devicetree/bindings/sound/pcm3060.txt     | 23 ----------
 .../devicetree/bindings/sound/pcm3060.yaml    | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/pcm3060.txt
 create mode 100644 Documentation/devicetree/bindings/sound/pcm3060.yaml

diff --git a/Documentation/devicetree/bindings/sound/pcm3060.txt b/Documentation/devicetree/bindings/sound/pcm3060.txt
deleted file mode 100644
index 97de66932d44..000000000000
--- a/Documentation/devicetree/bindings/sound/pcm3060.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-PCM3060 audio CODEC
-
-This driver supports both I2C and SPI.
-
-Required properties:
-
-- compatible: "ti,pcm3060"
-
-- reg : the I2C address of the device for I2C, the chip select
-        number for SPI.
-
-Optional properties:
-
-- ti,out-single-ended: "true" if output is single-ended;
-                       "false" or not specified if output is differential.
-
-Examples:
-
-	pcm3060: pcm3060@46 {
-		 compatible = "ti,pcm3060";
-		 reg = <0x46>;
-		 ti,out-single-ended = "true";
-	};
diff --git a/Documentation/devicetree/bindings/sound/pcm3060.yaml b/Documentation/devicetree/bindings/sound/pcm3060.yaml
new file mode 100644
index 000000000000..2d920a70bced
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/pcm3060.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/pcm3060.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PCM3060 audio CODEC
+
+maintainers:
+  - Kirill Marinushkin <k.marinushkin@gmail.com>
+
+properties:
+  compatible:
+    const: ti,pcm3060
+
+  reg:
+    maxItems: 1
+
+  ti,out-single-ended:
+    type: boolean
+    description: |
+      If present, the output is single-ended.
+      If absent, the output is differential.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pcm3060: audio-codec@46 {
+        compatible = "ti,pcm3060";
+        reg = <0x46>;
+        ti,out-single-ended;
+      };
+    };
-- 
2.43.0

