Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIkz+CaP"
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19576C0;
	Tue,  5 Dec 2023 12:20:37 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-58962bf3f89so598389a12.0;
        Tue, 05 Dec 2023 12:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701807636; x=1702412436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2tnYVxQxjMVdUGvGWY8HcxZ9BC3RDmK9/eWXBbbiyKU=;
        b=CIkz+CaP8vtMu35NzfzgGWwdocP366NE8QBjvpkyCxi8rfpO426tuj8DFgr7dNom69
         As9gJYv09ma507LkAwc1bW/A/f9Vw6TBmiOX1LEjhFpP88ay3gGXXvU7MNgWkHEEZ4fp
         gC/EMDmu1fVlNIPk8TafqQ+xIDymvT0K7nVoCmgHiOU9H6x+zDuHeyRGSHtUhk1VtXE6
         ilCVCE7uuznoLbYrHaC6Nb80+GXxmG+XLRz0DxqA24os4iGxqJzL3o3dpCaq3xPpu1CN
         FkxekADEO3x67plUyVHNvo3gdjv9WF8y4X9SQ0loXhmoIyfEhfsn1wou52jk9HVd2SRR
         iygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701807636; x=1702412436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tnYVxQxjMVdUGvGWY8HcxZ9BC3RDmK9/eWXBbbiyKU=;
        b=pfpvBLQ5Y8DC32SiwMuin+X402anQzh/cbah/R3bRhX0bL/hXCDwqtVnZXO6BfuWt7
         spxhBIGlKVBe2uAk5tK4VCYnhABmdgObZEnzg5IwUxPPaLytBubMR01+y9lLyCoMuCL2
         SEG1+yPiN6bgcVJ87+UFk0zNrqovvx8L9+eIONTxqmJaeCsVbTneoQRKrHVFLokk4f6d
         o73wIC9gNxinLH/hgzIlkxpW8AXWZm7mSO022zubKxGqX9z4BqPN+gttv1DqeWFCUOjq
         WnHNkEogsKXp45DhESx7x6RC+jSlcvBWRQa4jCfWIP2E7AsdlCdCJfnLUuGoDzIg5Kvb
         HDVQ==
X-Gm-Message-State: AOJu0YwKJGfaqbcFcZYttA2UtDguM1Ci9YJikHdo/zjtyduszWGw6ykr
	HuYCOq90jX7q/Usqe7I0QfLpzsQueH8=
X-Google-Smtp-Source: AGHT+IE5Lr5w2gcXALhYkjKWQQzglsVnxPhtbtpOey2mxGIA97g36+juso0v3LRfJ2nd0qq1lSS9Rg==
X-Received: by 2002:a05:6a20:e10f:b0:18b:1b76:d70f with SMTP id kr15-20020a056a20e10f00b0018b1b76d70fmr50802744pzb.2.1701807636476;
        Tue, 05 Dec 2023 12:20:36 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:52c5:3315:40:a897])
        by smtp.gmail.com with ESMTPSA id a34-20020a630b62000000b005b9083b81f0sm9624375pgl.36.2023.12.05.12.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 12:20:36 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	viorel.suman@nxp.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ASoC: dt-bindings: fsl,xcvr: Adjust the number of interrupts
Date: Tue,  5 Dec 2023 17:20:15 -0300
Message-Id: <20231205202015.2118980-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Unlike i.MX8MP, i.MX93 has two XCVR interrupts.

Describe the two interrupts for the i.MX93 to fix the following
dt-schema warning:

imx93-11x11-evk.dtb: xcvr@42680000: interrupts: [[0, 203, 4], [0, 204, 4]] is too long
	from schema $id: http://devicetree.org/schemas/sound/fsl,xcvr.yaml#

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../devicetree/bindings/sound/fsl,xcvr.yaml    | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
index 799b362ba498..2db69a953afa 100644
--- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
@@ -38,7 +38,10 @@ properties:
       - const: txfifo
 
   interrupts:
-    maxItems: 1
+    items:
+      - description: WAKEUPMIX Audio XCVR Interrupt 1
+      - description: WAKEUPMIX Audio XCVR Interrupt 2
+    minItems: 1
 
   clocks:
     items:
@@ -78,6 +81,19 @@ required:
   - dma-names
   - resets
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx93-xcvr
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+          maxItems: 2
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

