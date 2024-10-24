Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A973C1D3195;
	Thu, 24 Oct 2024 18:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729793090; cv=none; b=XX9K01myViAzqW+9rVpmaHiQ+eRWh9VLsgnk6cDRvoN9UokREeTmIsXsbeBx0gFQGsb2nkVlQF6S1L9cVwmZ/PMMEvthIVkpfh/hYvudidXRXl4ILH7uVKcgmq8yLLpA0+25rPvec6vHtJBw/5S76tCeSK0HLGtQqwGZuowT/IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729793090; c=relaxed/simple;
	bh=UUvsBdUGfSSU/kSjK234k4dPTiQ9P2UYe6HVxv5qs8s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GdCACnMT9xadeMOx4getC0/4LWb1jhkzO0PMzt+ih+zPGEJ+Xnt/C46PlJknrBTRFNAT0Xa5HcD+JSyu5/Zoh8mISPi6P1MOVAHfNDGjGDaC55nK/NQ5MpkFaw6KZ/J8cgNnrrOoGxmnTP5r9VMeK0OhliKjZuC5sm3i+PywgtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkYxyWGK; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkYxyWGK"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7ed9f1bcb6bso764919a12.1;
        Thu, 24 Oct 2024 11:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729793088; x=1730397888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=otnnjfo+UWzid12pRT8/cZV8/w3a2emTXWpbhB9Bt4Y=;
        b=kkYxyWGKIvTuXGR5xeBmIDaKuP4NneLriFUv8kuD6l3HOGCHLxTy30nGZL33ndiSM6
         7S/kCGR2GxQcibB3Goyae96RESREpqK5kkVNgw/2Hm/WAYe3wXk8jwHYxRkJ8TEX4hcj
         pDB+vF5Cg72bDpit+AK2M8h8EY6znjNMlKbWhuY5/dc3MTIMiqHxZ0tZQ1IwY/bHDhj4
         qRTe/R8VgegbY+M8wg9E4XXIup32JXqnTH0+A6tgjNgJeKF02c13z25kcdzIozjKUEBD
         YPIstpNyuOOsJq2ZjvR3opp8l1mUvkYaJKnacSTRpw2ef+dxc0xQeIhL5v+uAIHHSseO
         NhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729793088; x=1730397888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otnnjfo+UWzid12pRT8/cZV8/w3a2emTXWpbhB9Bt4Y=;
        b=jraAo2AScgaPzKnXHm6K4DwcKaztQDgW7WjIlNlPTq+G1OwAYvdBdvIfCpAWHRLDOH
         /SzrJ9z98LepJyNXB9A/ZSwNNh0asZQXI+HuM6iaLEnFfReGV0GLuOtnrEzWrdmysx7K
         euBGUu7BLNlcdA3R8ghOanZ2GkzbkRtHWi3Ml/larnerTf/te86oufZeMmL1GQJ5DBV0
         BCgbuAMPrlOh9X+FmYTxOE0/y6U6TNpuJIM2rJ6K4FBRNIvvvUA5qGSxsWdU3o5PYUye
         41HDKEblOCP8fDMdC+MYkQOmNUHHNZ/JHI3DZ6hXUWhdW6v6Rb+104dOYXpAk20J9MdD
         lUwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgSia4WsZCzY2HBrSSJN1WablpgXWoVqdryKcVMDxtMfxaFHy+OafEo0RnzNjhA3s8FBJdpGjGSoCQrMc=@vger.kernel.org, AJvYcCWqeMoCPFLr4pFQmStvsCQD+GfenKn767Hy/1D+ipozcFRL0QfQEO6W9b+9LomiLiPnOWlPfrNphkoJ@vger.kernel.org
X-Gm-Message-State: AOJu0YziJ8Ezl7tB+k95ZZc8FbwSj6/AWZhIxjjrWW+WCqbjKjtOYi+A
	AEsQgVck50gqCy7xnZeuHUcAA2niwaojJs0Zyx0BZtj7Jv46WmtE
X-Google-Smtp-Source: AGHT+IEub2+JtvqeXtaA7sT/CHywt1mAJG1Gr8DmLUILAmgC6hILD5sqLiu5VvrAB7MCT4dvlQPYdA==
X-Received: by 2002:a05:6a21:4d8b:b0:1d8:f679:ee03 with SMTP id adf61e73a8af0-1d989b359fbmr3222214637.27.1729793087826;
        Thu, 24 Oct 2024 11:04:47 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b160:3edf:6e5d:8d4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132fed9sm8256044b3a.61.2024.10.24.11.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 11:04:47 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shengjiu.wang@nxp.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ASoC: dt-bindings: fsl_spdif: Document imx6sl/sx compatible fallback
Date: Thu, 24 Oct 2024 15:04:41 -0300
Message-Id: <20241024180441.1456490-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

i.MX6SL and i.MX6SX SPDIF blocks are compatible with i.MX35.

Document 'fsl,imx35-spdif' as a fallback compatible for these two
chip variants.

This fixes the following dt-schema warnings:

compatible: ['fsl,imx6sl-spdif', 'fsl,imx35-spdif'] is too long
compatible: ['fsl,imx6sx-spdif', 'fsl,imx35-spdif'] is too long

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../devicetree/bindings/sound/fsl,spdif.yaml  | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,spdif.yaml b/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
index 204f361cea27..3bc18c3b084f 100644
--- a/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
@@ -16,16 +16,21 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - fsl,imx35-spdif
-      - fsl,vf610-spdif
-      - fsl,imx6sx-spdif
-      - fsl,imx8qm-spdif
-      - fsl,imx8qxp-spdif
-      - fsl,imx8mq-spdif
-      - fsl,imx8mm-spdif
-      - fsl,imx8mn-spdif
-      - fsl,imx8ulp-spdif
+    oneOf:
+      - const: fsl,imx35-spdif
+      - const: fsl,imx6sx-spdif
+      - const: fsl,imx8mm-spdif
+      - const: fsl,imx8mn-spdif
+      - const: fsl,imx8mq-spdif
+      - const: fsl,imx8qm-spdif
+      - const: fsl,imx8qxp-spdif
+      - const: fsl,imx8ulp-spdif
+      - const: fsl,vf610-spdif
+      - items:
+          - enum:
+              - fsl,imx6sl-spdif
+              - fsl,imx6sx-spdif
+          - const: fsl,imx35-spdif
 
   reg:
     maxItems: 1
-- 
2.34.1

