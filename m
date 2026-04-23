Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC93D36654C
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 04:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776918536; cv=none; b=DKTbGdj7WHjgTM0Iv0rZPSgtke5QacrDk+8BdDiMK1RCz9+7rl4BrT05Xv957ay1/Tr7pXRIJX7WU44dNiIEmfBrU7CmJDz4FVjXAOclgSId3PCM3+omN9weiBXHVqf2bM3dST6n3NK3hcUOeo4jInv4wFsyrZsE6TxALgUCWiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776918536; c=relaxed/simple;
	bh=MaVJxZC5N4/y1FpjaEauMKNmm2TOUxLoHybY7yZsvqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A0MuHi+ZkVNJtbuXcbsUdWAO2OCEXoJwlKK6t/G219F4kMzq0EMmi6pKOtsUKhWxpYL39/KObU6a/twzL3/dPEyhoVND/AlUSs//EOiXZqQSEClXeqFGFdVw0POyJEG4qj9/HzXhfVizr3RUSz+WGtzVONbrNHp8y3vx50rdeyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHIvxibC; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHIvxibC"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ab46931cf1so50280255ad.0
        for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 21:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776918534; x=1777523334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XjjUIS+FpVjGKchfRJSkovojenGlk/xbLLBCCHWtqGU=;
        b=ZHIvxibCLJKVkqyWasFZS2KYUq4by+DiBTUkSpAYpRvZSMJO+Hz3iQEtPn5/eZTYSo
         h6z2wPAHOpepZsJF+WjoGhmXzMAz8ksvJVWrSQM8acG40gOhzNojl2657okjzEljWS+o
         uBmvn5RctAgAb9teyJhXL7VfKKCuWYHrx5dLWrqgl1SZkM0mBxAjgdH3eRA1qecg7ds/
         krmyMWb8SwRqoejEQ6MNJcubcDdJTbWZfy3q1RAYwpM6MfDCXVhZ2fgiiaMMUxl5XxcW
         8u5E+Q2edREOhD/xlmNZxzjPBuqz4hTU9lrwLwuPthoh0qNiuaD8dWcEx9il+6j8xgJ7
         zjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776918534; x=1777523334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjjUIS+FpVjGKchfRJSkovojenGlk/xbLLBCCHWtqGU=;
        b=iJ5f05YBb4tXTSs6+oa54oz7WaTZ5czeWKH19nIQpGtc8I0yuchBr/Mr4nDoo2E4UR
         9LG93RAkl24eM87/NGsMlkWKDnao/zJqk529IrSANV/B0V/RXR0TxbUPxBTMFx3BF1WT
         RPF+5jJwwG0gj9Tw3/pWoC7ykWEUofaHRj2wjxrSGP02M/Ijjpsz+zQWDeCgNWorHgVB
         FCDuP9dsRV6VOFX5h7HZt5Bj1YFjlGzdRzeDg1BbjT6CoR0g5kNZScttgPg7LVruQjJW
         GZEqHSSJJmXTfPXbvOPXoK1wfojWTdFcUhIWSks2ABTKFxwrPohmOnK2xVPfM48l7AMX
         wo5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/dtAyXghflLVIj5Ji4+gDVE/GikdQwXQeWarWIrPUvJtHqZlni/98Ylca2Z11hF/wtgL7HiTB8g8dS2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7d1ZGGMfw4TQeMuIVVf12nTNPjGp1ZNoEKniTBW2xoFzUU3Xn
	FBzDJLNkDuxdaVCL9Y7kmq8QWRcMCIA0A1EHlgCNVNB5O9pR4/HnmYNe
X-Gm-Gg: AeBDieuWrDJAWjFGazbNkc1rPFUhFyJJaM7paWIKRqNDxsqeVcU7qsJx1UPCrbEPDlm
	smz/n4Kg666jUhfpn9PMFolYA/QTfcmeyUD+F+Dhngfy7HeJrtI2ftSMfuF6yVi7y9XB+RYU/Uw
	M5tQK6G/2KzF7lGA3UweJjJYOvZ6GjWkNZqX+tBLF2HtyraPW7myTj3LeQHC77fmKFN4pXAKTLU
	pvlWDQkA7p7NSG/l2ccYjWE09eHBVQG+Jfw8xHjHy3YNy9l+lctf1+UFdRQqnWGVj9sojU5bLko
	2SAUO1rDU7sLnMBhipR34frUs0qrAdzPdNm8Rf/2WsXq9QOvU4O9YQGh97pi0y0oqy+pcFHsAa1
	e/9/9Uw8Vwl0NTqKNkVEhuIj2s5Iow0Z21fi9u9Z6pkraKu7gLpQO3INlmEzfPj4Hj/kvOJaNKv
	NALZpoVeLDLUB/qUulOo183Qd2Pbkjed1QRZLpuNRQsqI+4S09XO5BxriTL3EFreyfX/Bx
X-Received: by 2002:a17:903:f8b:b0:2b4:6122:10f8 with SMTP id d9443c01a7336-2b5f9eb4a00mr190635855ad.21.1776918533945;
        Wed, 22 Apr 2026 21:28:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab4049bsm165723755ad.77.2026.04.22.21.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 21:28:53 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Joseph Chen <chenjh@rock-chips.com>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	David Rau <David.Rau.opensource@dm.renesas.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] dt-bindings: mfd: rockchip: drop redundant wakeup-source definitions
Date: Thu, 23 Apr 2026 11:28:30 +0700
Message-ID: <20260423042831.21114-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The 'wakeup-source' property already has its type defined in the core
schema. The Rockchip MFD bindings redundantly specify 'type: boolean'
and provide descriptions which only repeat the generic meaning of the
property. Drop these redundant definitions and descriptions to clean
up the binding files and rely on the core schema instead.
No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml | 5 +----
 Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml | 5 +----
 Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml | 5 +----
 Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml | 5 +----
 Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml | 5 +----
 5 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
index 7c71447200ba..8e394ab6879b 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
@@ -29,10 +29,7 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
-  wakeup-source:
-    type: boolean
-    description:
-      Device can be used as a wakeup source.
+  wakeup-source: true
 
   vcc1-supply:
     description:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
index da2391530c16..548ba1f30712 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
@@ -48,10 +48,7 @@ properties:
 
   system-power-controller: true
 
-  wakeup-source:
-    type: boolean
-    description:
-      Device can be used as a wakeup source.
+  wakeup-source: true
 
   vcc1-supply:
     description:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffac8fbf..40f8f23afad3 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -43,10 +43,7 @@ properties:
 
   system-power-controller: true
 
-  wakeup-source:
-    type: boolean
-    description:
-      Device can be used as a wakeup source.
+  wakeup-source: true
 
   vcc1-supply:
     description:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
index 2cb6d176a84c..b99aaff100fb 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
@@ -55,10 +55,7 @@ properties:
 
   system-power-controller: true
 
-  wakeup-source:
-    type: boolean
-    description:
-      Device can be used as a wakeup source.
+  wakeup-source: true
 
   vcc1-supply:
     description:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
index 90d944c27ba1..b7af774b1395 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
@@ -43,10 +43,7 @@ properties:
 
   system-power-controller: true
 
-  wakeup-source:
-    type: boolean
-    description:
-      Device can be used as a wakeup source.
+  wakeup-source: true
 
   vcc1-supply:
     description:
-- 
2.43.0

