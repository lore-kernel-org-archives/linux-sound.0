Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A701EA73;
	Mon, 28 Oct 2024 02:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730081281; cv=none; b=YfTLRVT/w5x7IgbEP39PNSELVpK0Sujh5SZRHqed7En41Ua5PCZR1CTaW0NMbL3mVEDmTDWB2RXSZjB/IxJUdU9s3xuIAEP/A9BF+CARHMOGOzEfYI5ozyBRT+V/s20pwei2GrFHopUFzJQj+EuUHqJjFYXQ2khNKTiZL7l+A0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730081281; c=relaxed/simple;
	bh=DDzcKEwVvpSnUSWxmUWS620xmgFnXRbRZhpaQkLfqUY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VPQ6Zsbj/SX8G0zERIgtlgaVX5l7vTO6Mmqbi5AkK7SpG81b3xfMCgtEQTJ9qr6/D7R1FVieHOVoVsFxhNKOyOer7CdznbscDcbAB0zSaPSxGSXdn0OckI01wlsXxuRrQ0zrb6Lmj1rJt2OAOdybTogEH8yQS071NIPxMkrWf+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/ROTBZN; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/ROTBZN"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e5a62031aso2704219b3a.1;
        Sun, 27 Oct 2024 19:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730081279; x=1730686079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tW061ObRfZIWi7DR9Xc1M5Q9grYUYarkg71hQPlzY9w=;
        b=O/ROTBZNo/l+431Gqd8dmN+1926M0B7KLUcwxZBNTK18dtSSkE6vlhKtxA3XUYVmqo
         thPOncZW6fizesFzkn5036r0JVta3MH/reoVYX1TM4TDn5AHkizDjP0WTV5KT/aUaQrY
         jcLfQ73aIUqg+av3Ek7GgI1B/cbBCPHMCpwp25odTywxTprrDcB54g6U7TNEgr1i8t+b
         dfkuDBeUW51ggx/tdxBTD0Eg+tJxLKJMzaG9vbIB1B9bkX6NdLuCZU6ZL8RcHcC0NOTh
         BCEXDUFtuJm1XRZU93hToq8ArdkyV0F2FueMOHktcxtLfAd7Gs58mHlFSpsFjT7FDvMQ
         H7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730081279; x=1730686079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tW061ObRfZIWi7DR9Xc1M5Q9grYUYarkg71hQPlzY9w=;
        b=gaWoSthcf6MrNFPO7tI4syotrmtGziAW5q6E1Cku/i6mQ13GSR7fG2qot8Mra1fYaK
         d4ttwkM8MrGN0yvP6UZhltD+kspJOTViC3ODR4PHmAL0qvS3ngCTffD2nHQ+PtiVLwj9
         3Irb4flqUebQWKmpX3tlO0rh++k/bnKcSW4IGpPEkKqxwo79KVYJ56NLCNV0yztllKcY
         jHNd2vDzVdAkPZZWwIb7QaKnXLh+PZethj9fd4gzxbucoEQt5AnzGs6b6adV0V2Dp1qE
         3R5JpVL+43x6uPyz2Hhx5D+Ti1U41tUlXdLdJXTSaiVtu29fpGlHYvGpi7RBmJ6eVrw3
         sueQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaTehDDNYx9sFl2nF5ko6uyJ/MwbLvq9/+hotsXwWX/5GFvPO4v99UVstHKNv1DTIBeN9+rFEmyVwO@vger.kernel.org, AJvYcCVy2RpUxwwDbtE34Zy4BVxDWAMd+VFcFZeWGlFIvP6cf4geMhGHNYlblG/62yKUAlCiOx1xwt4owvnAHeM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHw8qQzIYd5Gi57+ZyLZdZ/Pdtdy4T+VrwaBWlsX+SYKQUiDbi
	cwHfxobWtaGBK80VlEeyllYL4kSHAFuFycKGdkhLE51VygYcMDLa
X-Google-Smtp-Source: AGHT+IGaUq80uvaE9YNO3O0HDRZJUuV8KshQyYfqu4ZpY5sgRdAZupK8syvvTreJsG9IWzUBeR8pPQ==
X-Received: by 2002:a05:6a00:3d55:b0:71e:3b8f:92e with SMTP id d2e1a72fcca58-72062f4bdc7mr10306306b3a.3.1730081279090;
        Sun, 27 Oct 2024 19:07:59 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:374e:7a0d:309f:9643])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720579356f1sm4633227b3a.79.2024.10.27.19.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 19:07:58 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shengjiu.wang@nxp.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] ASoC: dt-bindings: fsl_spdif: Document imx6sl/sx compatible fallback
Date: Sun, 27 Oct 2024 23:07:49 -0300
Message-Id: <20241028020749.36972-1-festevam@gmail.com>
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
Changes since v1:
- Keep the entries as one enum. (Rob)

 .../devicetree/bindings/sound/fsl,spdif.yaml  | 27 ++++++++++++-------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,spdif.yaml b/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
index 204f361cea27..5654e9f61aba 100644
--- a/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
@@ -16,16 +16,23 @@ description: |
 
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
+      - items:
+          - enum:
+              - fsl,imx35-spdif
+              - fsl,imx6sx-spdif
+              - fsl,imx8mm-spdif
+              - fsl,imx8mn-spdif
+              - fsl,imx8mq-spdif
+              - fsl,imx8qm-spdif
+              - fsl,imx8qxp-spdif
+              - fsl,imx8ulp-spdif
+              - fsl,vf610-spdif
+      - items:
+          - enum:
+              - fsl,imx6sl-spdif
+              - fsl,imx6sx-spdif
+          - const: fsl,imx35-spdif
 
   reg:
     maxItems: 1
-- 
2.34.1

