Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0F435FF75
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074880; cv=none; b=hDppCuwHGEQ4iaPwHCu6rGAbWRiH9K9tWpCto1dxzUJOyPBfEvkH7M0kR2pamfo8mdIkaZc0LvXLaXMOQrEJ2YlmdUaMysHEi90AjxD2Trw0B6qz82zkzivq+0LOvF0A6bgeedY06PF4OZRYM3wUXhllafQWTEp0ovR1KwTjgJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074880; c=relaxed/simple;
	bh=r3lJLyo4pwKES9BKycKLT/FzReE1LAodZaW0RGMG4wM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sygcQcZpTuxhmSI8mZVM1liYroWpq+gR75FWIzqrYs1fCZhqfe6Z+M0ksAAwo4ShT4C9pg5KRlCj3Wvn7aoAU47njf2Od+mbTHD8aUCP6yq5VLNq2sNcySQNGWyDhoI7CuqUxYfLt5TeRkeU7G/BOF43Q2+/T+Ya59nwAQBHPQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sXMbh7Xk; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXMbh7Xk"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82f0fc82c76so1045334b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074877; x=1776679677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkTJde6ErisNFz71GX/g+WRnRx4lnEoOHW1gq8vDPR4=;
        b=sXMbh7Xku6gnotaijSj5fqL7mkcQeJyGJQzAczF/sOI+mJ/WUFEd9PHllggbZl/xvj
         neWcTmvuK98tpb45QyjupXNi94b6yGOq51QRxAc6oCbJJVYW7Z9yLOWcY11MVI722SxN
         Lid7iaM71hWjAmz+NlB576hRrYl/hSxKwd2I7+12W8ba/EtmqeX1zBgC9e/qMrwxVStt
         ZL5GAG5m+nagL1buW9D6Kt+wcRdKvEHIfqg8Z/mZ2dv63iR18LeEHXYSKj4ZA/HBPRL8
         myah57R0WCb/FjQRUnFZGM1N+UAy+3G1LM5NxfGTQwsQr6BdqzJ5msVv8f5idNW8EcUF
         JTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074877; x=1776679677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MkTJde6ErisNFz71GX/g+WRnRx4lnEoOHW1gq8vDPR4=;
        b=U/qM9d9HRhxFzXf9YlysocMEwmGZm6n+B26OKUb3zUSo9nyxzJ7Od7YTZaTZ0caxqn
         cRDDI9fQtbZjNj8aK48/ds8pWlx9CacL7O0upyGym0+zmg08ulyIhnY7VdD4S1oPSPSB
         4tOFkY5vrTdjsAz+Ea6L34VsXjrhgk1K1cGZjqQTJsfS7aYRl9al47uUAgrgHP38sqgW
         lcHbzEPIUEE13NRlE8PNg8NHJHM0tM2lxi9i4D6PfmeGQS5FTenr6P9AdNs6AYswxjOM
         WKOE772SJCSzfpbBB4RVFF1m4hIo1Jd5SeB2AoHRtaMq+edYq6peop9n1nc8P6vchqzV
         JPKA==
X-Forwarded-Encrypted: i=1; AFNElJ9i5dCVxhK0WlasMORmMTaDurVNY/w1f2Nt/g29fbTI1gUY0iTe/XxkTeQORPSiixBI5p8BlBSdeedi2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCUrUSbiiMLO8Om+BnE4j2nwmIwfFAlDHHRfm6biSL+UBp/br4
	sI1qd1vgdMYjS25ScLw+0LRxmsLB64O0wXQVJCmIb/rAeFap46BvB+FJ
X-Gm-Gg: AeBDietyeMeOHBG0wz87uG0/PvVtRgxQnUtkw7mMlBMks1PPsywn297ONFSY+EuMxCm
	mpK5/5k+nbiraGhWjsv4Ysk8i2giujqMBb2QQhs9lKiSSXZZ8ATh62T3b5IDgCRN1hLVJlZ/wJ6
	fiPF7MoL1puanX6/ZfjcDUaPz48CMvPmRX97ewWDzT5Za/JmGbv5rOHMX++DZL5T+aGsLSLH5Pk
	7hZmfo/teQBNDLBx8aVOvIMnJXIRZQwkd70Cv+tgpv2/TJ4emZIH7LkahNq+nVuxmX3s5QJP3Ne
	XvKJ3q/OViVem0mV1ve9vrmPG4Ii/4gXREqjl9suJNGUrDUlyfUfBAJgTS3dqSqgYJcaP5ognX/
	+GuBFbQita6uCv+kNPNLMO8N3m0dLFDMK2agQs6r04heoUVMa/gcN52XuUFa4i7lT7Xxz5wswjw
	wBBEgNYIhG9M4gUEAmVjEV4DHfzky5izXX5Ss+YTIQSPtHbYkc3Lj6nKOllQ==
X-Received: by 2002:a05:6a00:84c:b0:82f:4cc9:186d with SMTP id d2e1a72fcca58-82f4cc936a7mr445459b3a.46.1776074876725;
        Mon, 13 Apr 2026 03:07:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a8f7sm10232140b3a.56.2026.04.13.03.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:07:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for multiple clocks
Date: Mon, 13 Apr 2026 17:07:00 +0700
Message-ID: <20260413100700.30995-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413100700.30995-1-phucduc.bui@gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The FSI on r8a7740 requires the SPU bus/bridge clock to be enabled before
accessing its registers. Without this clock, any register access leads to
a system hang as the FSI block sits behind the SPU bus.
Update the binding to support a flexible positional clock list to properly
describe the hardware clock tree, including:
  - SPU bus/bridge clock (spu) for register access.
  - CPG DIV6 clocks (icka/b) as functional clock parents.
  - FSI internal dividers (diva/b) for audio clock generation.
  - External clock inputs (xcka/b) provided by the board.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Rename FSI module clock to "own" to match driver.
 - Add "spu", "icka/b", "diva/b", "xcka/b" clock names.
 - Use YAML anchors to constrain clock-names properly.
 - Add "if" rule to require "spu" clock for r8a7740.
 - Update example with full clock configuration.
 - Clean up schema by moving allOf location.

 .../bindings/sound/renesas,fsi.yaml           | 61 +++++++++++++++++--
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
index df91991699a7..d0ae54f3d321 100644
--- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
@@ -9,9 +9,6 @@ title: Renesas FIFO-buffered Serial Interface (FSI)
 maintainers:
   - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   $nodename:
     pattern: "^sound@.*"
@@ -38,7 +35,36 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    description: |
+      Clock driving the FSI Controller. The first clock must be
+      the module clock ("own").
+    minItems: 1
+    maxItems: 8
+
+  clock-names:
+    description: |
+      Names of clocks corresponding to entries in "clocks":
+      - "own": Main FSI module clock (must be first and always present)
+      - "spu": SPU bus/bridge clock. On R8A7740, this clock must be
+        enabled to allow register access as the FSI block is connected
+        behind the SPU bus.
+      - "icka" / "ickb": CPG DIV6 functional clocks for FSI port A/B
+      - "diva"/"divb": Internal FSI dividers for port A/B used for
+        audio clock generation
+      - "xcka"/"xckb": External clock inputs for FSI port A/B
+        provided by the board
+    minItems: 1
+    items:
+      - const: own
+      - &fsi_all_clks
+        enum: [spu, icka, ickb, diva, divb, xcka, xckb]
+      - &fsi_no_spu_clks
+        enum: [icka, ickb, diva, divb, xcka, xckb]
+      - *fsi_no_spu_clks
+      - *fsi_no_spu_clks
+      - *fsi_no_spu_clks
+      - *fsi_no_spu_clks
+      - *fsi_no_spu_clks
 
   power-domains:
     maxItems: 1
@@ -69,6 +95,27 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,fsi2-r8a7740
+    then:
+      properties:
+        clock-names:
+          minItems: 2
+          items:
+            - const: own
+            - const: spu
+            - *fsi_no_spu_clks
+            - *fsi_no_spu_clks
+            - *fsi_no_spu_clks
+            - *fsi_no_spu_clks
+            - *fsi_no_spu_clks
+            - *fsi_no_spu_clks
+
 examples:
   - |
     #include <dt-bindings/clock/r8a7740-clock.h>
@@ -77,7 +124,11 @@ examples:
             compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
             reg = <0xfe1f0000 0x400>;
             interrupts = <GIC_SPI 9 0x4>;
-            clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+            clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
+                     <&fsia_clk>, <&fsib_clk>, <&fsidiva_clk>,
+                     <&fsidivb_clk>,<&fsiack_clk>,<&fsibck_clk>;
+            clock-names = "own", "spu", "icka", "ickb",
+                          "diva", "divb", "xcka", "xckb";
             power-domains = <&pd_a4mp>;
 
             #sound-dai-cells = <1>;
-- 
2.43.0

