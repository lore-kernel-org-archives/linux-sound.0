Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9166136F418
	for <linux-sound@vger.kernel.org>; Wed, 28 Jan 2026 17:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769622527; cv=none; b=NmPYa2ZOwcPYQKfcBZR1K8/HoNtDzO6rIwlcJ0UkUNf86dN4p5uigGnTsJ1xfhqJ9nt6Kv6tVvDvLalAnjCgfrd1BDI9Q7bg99iJHVjapAixXslkHiCfIkzKJGFH9fQlJ8wFjbbAamZQwHiT/pOZEuWOCgUauJhKfRZ2UK22SN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769622527; c=relaxed/simple;
	bh=Rezf1MLSSUWSNbEQN28H3BG+O8J7SEbdS+FvGdcvoa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MfRMp4MyGBugbCDuluSwyltjAdZucxUlvAVkzL73EXJ/sNm8o5HtJPrUEn84KxRCausZHEGeQtK2EmugwHNPLTnkNMzNb0757tWPkiwr87AUIlkXCnoo4i9qsBsPXlgI9nNZN2OsAzVm7pqYVxzz2fruGaxwCNuMc1UMR7AecWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Inw5wSPt; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Inw5wSPt"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-40423dbe98bso44943fac.2
        for <linux-sound@vger.kernel.org>; Wed, 28 Jan 2026 09:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769622524; x=1770227324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4g1rdqkzBN7E4k3DRb93C6Pz1pOJ7VGgwv2jByOH00=;
        b=Inw5wSPtH4T4emWnh+/Mn/x8couqhdp69Q/XcKFTbF6J8GfDGZd9pMuiPKv8+XW35B
         w2FanNaQyfOBsOHz527rGHBL4LMdmZoyhheX+XcAW8sHIrDiIjVSCs/X7YvRV0q+8Tiz
         62fDKqFtTBpMYFem7R7QhmHTGYj0VWcumWtbj9j0OKYiucCRL5Z137FMOi3aAPigyouk
         AOeUPMAjhOCTRJnoZdgqvvcfWpBAXdR1AmjZoOSE5i0TaW3uFYyhVD9iUdOwiATvHzN1
         ITXIWk5DCWQCcDNptFsAakLwG+CEHV3SqWpQWxJbOBVv3Br1qlFeEvaW15W10PrhCFmV
         rxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769622524; x=1770227324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z4g1rdqkzBN7E4k3DRb93C6Pz1pOJ7VGgwv2jByOH00=;
        b=Ww/UzvXMyeovvYQcfGBlKaAQKll7aaqAsaBKFCpFO9RTpnIjM6jOEL4meY4k5OKDrF
         i1F9R5Q93W4WA4FuR6KCzYkARsALq4Qpp2TOAQ0l1MY2PN3BYkGg1JbIltjuuEd7PC4J
         REY0l3V/+Ccve2eUtOISZazFUIrg+bJZbg3tknxFVfgFSDiIIzvBTJ5aDAf1iynBUjb1
         CP4FdDGs8CmDbmIk0hIQe3diJlmgR76O9zCV+hJ51ZmZWudgPqxJVdWuvHR43cPsbrUu
         jUl/Yu3XtOaCWTxhUwCkg0/rg67AjxC2uX9TCf9t5n3DnzF6Uvfg/MKyEpOaDW61Fet3
         vU1g==
X-Gm-Message-State: AOJu0YwgfbIcOVXkNoOmW3eGgVSJDmdMVeg2N/2LwDGGXOcr0/u3NfZZ
	f7Zeu4Gvc10hETz/Etw+Jx1jz0tas7PHzucsmMkU8DwZgLLuzKh4dwFKDxjMng==
X-Gm-Gg: AZuq6aKR+2WxhRPh2BeFUXaXh0eCq+2cES4eYXurgeebOO2LyNU1y6pT1aAe3dnbQTH
	7rlErdiNhn0ZTXN7gZpdqVXfS5be+HmYe8F90Pz4TxYQ4XQg5SF0tmf14keK7Q+RHoIvsGpUh1/
	MjAoFEtURRXLP/B069Voyy702Jvgh33uqX+7hTAQRnh9oK5rKZuNkQ0lJI6IApo5dElACyQPRxD
	nBU+fbdEXec709FAsaMf98paFlc7/gyDSUyECEKHF6oB1vkFUPgdHrYMnSpYjz2K52WZ8//ojHq
	Bb9zDbUsXeqYI0CfJexx7Gz9S4AcLpfLoBBGBv25RkCuVUmOkB2BNeB3c4DvPd/Qiq5JGyCeRcr
	QelfF2h7zeWma//fvjM7s3ue0rLMlv4aLybVjPsDcdyqmhXui8vrVrydBWm4eX6PSgnI2p0Y6rj
	KUmh1vEfSZ
X-Received: by 2002:a05:6870:b01b:b0:3f6:1e56:aad7 with SMTP id 586e51a60fabf-4093fce5f4emr3436398fac.15.1769622522315;
        Wed, 28 Jan 2026 09:48:42 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-409575b0a89sm2187647fac.20.2026.01.28.09.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 09:48:41 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	wangweidong.a@awinic.com,
	tiwai@suse.com,
	perex@perex.cz,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V2 1/3] ASoC: dt-bindings: aw87390: Add Anbernic RG-DS Amplifier
Date: Wed, 28 Jan 2026 11:46:06 -0600
Message-ID: <20260128174608.1498-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128174608.1498-1-macroalpha82@gmail.com>
References: <20260128174608.1498-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add a binding for the Anbernic RG-DS Amplifier, which is an Awinic
aw87391 audio amplifier. This manufacturer did not provide firmware
so we have to use a list of init commands instead, requiring device
specific functionality rather than generic aw87391 functionality.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/sound/awinic,aw87390.yaml        | 34 ++++++++++++++++---
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw87390.yaml b/Documentation/devicetree/bindings/sound/awinic,aw87390.yaml
index ba9d8767c5d5..9c1baae767c4 100644
--- a/Documentation/devicetree/bindings/sound/awinic,aw87390.yaml
+++ b/Documentation/devicetree/bindings/sound/awinic,aw87390.yaml
@@ -15,12 +15,15 @@ description:
   sound quallity, which is a new high efficiency, low
   noise, constant large volume, 6th Smart K audio amplifier.
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   compatible:
-    const: awinic,aw87390
+    oneOf:
+      - enum:
+          - awinic,aw87390
+      - items:
+          - enum:
+              - anbernic,rgds-amp
+          - const: awinic,aw87391
 
   reg:
     maxItems: 1
@@ -40,10 +43,31 @@ required:
   - compatible
   - reg
   - "#sound-dai-cells"
-  - awinic,audio-channel
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - awinic,aw87390
+    then:
+      required:
+        - awinic,audio-channel
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - anbernic,rgds-amp
+    then:
+      properties:
+        vdd-supply: true
+
 examples:
   - |
     i2c {
-- 
2.43.0

