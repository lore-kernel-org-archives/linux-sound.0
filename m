Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVVhH4NT"
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F2FBD4B;
	Wed,  6 Dec 2023 03:31:01 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d0481b68ebso11771315ad.0;
        Wed, 06 Dec 2023 03:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701862260; x=1702467060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SB3nqslBIX6M2uGGT/Yi34KGuFU1UIll1snis+QvolU=;
        b=eVVhH4NTYt0I6ZnkW1YOuIwL8fk3eCKGRWOpiSZ5QTshcpjAX8/gwPIj4nqAoIc/G0
         xG2RZ4/++wuKsMsbFGjs/z6VpUs1NeX4FNI03w0HOQsFQ3U/JnsOH7FEFpFBhN0OsEDH
         gHvtq07nVY+NyYHHj4Zsmzz3B5jRxKC3uaW3NPhq9Wy2yHyweiQT8pTIOXkHT4mI1PyM
         H/YxHTIkhFhPld6Hmd7xP/dN7dRMYxHFR3Lt/LSy+ca6ueQ8tb4zADg7XfSNBJ0dzqTP
         n2dsKhQoVhe5l+BOEY/ZU1PIlOrYUowFInlXvv3nJn4ZiwAijDMK7gZDhVecGmJmiDEk
         ZATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701862260; x=1702467060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SB3nqslBIX6M2uGGT/Yi34KGuFU1UIll1snis+QvolU=;
        b=urbRUjAHEX2btrEaUCHMvywE6JgtT9dM3PvoEvki1ng1VyqBDOnJ4aHMbcrkeivrQy
         gnBiCSjPmpt///I7O9yDz/L97l2MNIdMcBNat1ypnZbuMR2GyiPCgnsuUo9Qy+2ENM2S
         qGgi+uDkU65/V8rCUOXU8TT+FVmqe1GMh91rIsqNuYEpY6Q7vAUZWOJ96fJreGTWiI34
         rhlkiyGkbee5+5aFqCuvNhgh0HK5dTMgY9FppvcBTWNqUlh0Eboy5SLB48sJ+YhsxmVv
         RcMdZ6BkdVkDZZzIkGz9IzXxJ0PUqWlhXX0AOwpqnxTpwmdVi00quFKSIRkorz4CcC0L
         qPsQ==
X-Gm-Message-State: AOJu0YzGTIZsAV/5sbvLnnBNP/+3HkF2e4gTkDUwUl/1oeMcDhe6GdLJ
	07aYi8bbZwjFiTl71U2LRZ8=
X-Google-Smtp-Source: AGHT+IGXN+TtiY0zy2TdM6xCTrjhO8gfMXNvQgcpTGTRIMeLI3U74Qx7E1MhD6+crdYsk6t/ZgcLPA==
X-Received: by 2002:a17:902:d509:b0:1d0:61a0:9844 with SMTP id b9-20020a170902d50900b001d061a09844mr1337038plg.4.1701862260625;
        Wed, 06 Dec 2023 03:31:00 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:6764:e124:5ffc:3f5])
        by smtp.gmail.com with ESMTPSA id jw12-20020a170903278c00b001d076c2e336sm7853261plb.100.2023.12.06.03.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 03:31:00 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	viorel.suman@nxp.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] ASoC: dt-bindings: fsl,xcvr: Adjust the number of interrupts
Date: Wed,  6 Dec 2023 08:30:47 -0300
Message-Id: <20231206113047.2240055-1-festevam@gmail.com>
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
Changes since v1:
- Add missing else to limit the number of irqs for the other variants. (Krzysztof)

 .../devicetree/bindings/sound/fsl,xcvr.yaml   | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
index 799b362ba498..0eb0c1ba8710 100644
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
@@ -78,6 +81,23 @@ required:
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
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

