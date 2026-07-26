Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965CE33CEA5
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 05:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045163; cv=none; b=U2dXaqB9UY3Ux3lnJ5vHb7AKf/5sQK7313SA4joXgSdSV+Pxdlg342CR+mOCVU7/KZiHGi/mFwEeeujXAqid+kjZUE93em2aGO0cAEiIR87shD6JhVjCZdcFwEABVf74bx3E1Pwh926xKANE4nyEFNggaowfMfLQs4rL0Ng2TE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045163; c=relaxed/simple;
	bh=REoCkpjZG6EGkwi3/NcgXDxk3dKaXNO/giFq0Nnxt98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C5lLgs1H/f7K2p8LfMHBscGspGxfMvpZKCvyXc+jPXLdrRMpb3AlCn04HdbI2fgk9MxVvwl7bPYvmf4B+ah8uwBnM2MHBkYU31hTrXJlGBa4ydlDbmyo/ualwwQGjbklehx7FuAupBePROgkPUZKlHiqZpwgdbQf4GPLZhYD6mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJThtp4H; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJThtp4H"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1716327a91.1
        for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 22:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785045162; x=1785649962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m1fXiu6dhRaWyJR5HnGju+ApcgNO/yV2Ni3ZdqRUJ+o=;
        b=LJThtp4HthDk69kI6+4TRoE/HzktsW7urAYabvxIXFaP1xTGJCf0CC/8869h3Q9iXu
         /f9OaQX+H++bIwHoVmCRbVr3S5grYgZUdXeXWUSBiFgud3atMKCgqlQn5GVLZUe428wV
         h6KmSD4oyIziN0FrYE1SocYhI6UNqvqqO5HlztxXFbs+69Wq3+qq5F8+VqJaCukB9bNG
         N8yp+l+pMEByC6yp/TF0cb/jLXdo5kda2PBOWCRoiIoLcSzmH+b9y6+F/CRCqGk2qRnI
         MoBjB9kCT+4gklyra9qlQiwsbKqkauW+sVKQN4wZx7yzAs4DGtdvcUSHJ5DLjFtIg++V
         QMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045162; x=1785649962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1fXiu6dhRaWyJR5HnGju+ApcgNO/yV2Ni3ZdqRUJ+o=;
        b=IfjqpFkg4NGAxevRJGtcSBcEtB0NVoHNVKUTVBhFnqyOj+ap5/qAiUd1D+UVNj0ktY
         w715WN2xyPneY2wnHePLMbZlio0SiMk3o0SEjIm9zzmeb2W2pnfCBKLHVadKGfstkegg
         CLAWy06Zlau8EBopq//i8LWbpPiQWKpKM/yZSDWngAuSzWTfOZEIO5mwOAGDsRIkSuy2
         xl8HpBGpP1Z8RPxDRXPvK2QtJV5I5TOHuf1xUXVdkpaBnUZi6CwGKWN3iEqAP9d15RYN
         SGNVmJVBABDXWIKs2eKZid4L8hlvphVsBBLMBTRtkTanaFf1eMSVtk/D6cc3OM/n/M/V
         F2HQ==
X-Gm-Message-State: AOJu0YzPuWg25wVw8srdxOWhcqiZavOtjZ6dY37FIoV2pZhHKq3gbYYa
	s2BRiEK1mPoJS355nX5q2d/qJ9yMn1RojidxR9WTXBy7foZqf8arivm0
X-Gm-Gg: AR+sD13dMnSAUhVz2IrH9Ckrl29y7gES5vFY7Hh9nUrOObZd2Rzxgsf4i2p9KSOr/eb
	MRAt0kgEDWiXXqPC12m6/bgE8Ykc8Lo6N5kc8SvETIJ7goslMMiHa9V66CEzo0oVOnQc5Gus6UL
	Mo+51YemomRIsa7/E2B8mRrQt7VF69B7v/zSsdU+7g0mpAF80YX8mzHjaKCBe2ZurMyU0Ha6iKp
	E4RNKLc1Uh2nxRapJp0/PGogv4ln2dQqpU5BreGau8NsQw96TmMvO3eBzNk/rslVSq1W5bafcUt
	n7FuhurGzIrKBf1+Y2SnhemNugeRpWnRAc+kU2HD85DrRZgzGdoM7MACVbwqp9yoqCDonUipWO+
	4QXSOnvXn/4uT5AiN5q4A22msI30wMMedB33ypruCJ1pPY33+gs1NbjYhs/iZXaG38KaDfWI9xR
	zx4MgjjT1XnWCFaUHU2+UB8Rt1O03c7DBq7k5hqs0zlw==
X-Received: by 2002:a17:90b:3e4c:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-38f2952ae80mr4111975a91.19.1785045161885;
        Sat, 25 Jul 2026 22:52:41 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f292d2eafsm1418969a91.8.2026.07.25.22.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:52:41 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jack Yu <jack.yu@realtek.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: fix spelling errors
Date: Sun, 26 Jul 2026 11:22:27 +0530
Message-ID: <20260726055227.18123-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling errors reported by codespell:

  susbsytem -> subsystem (amlogic,axg-sound-card, amlogic,gx-sound-card)
  vlaue     -> value     (realtek,rt1015)
  spped     -> speed     (st,sta32x)

No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml       | 2 +-
 .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml        | 2 +-
 Documentation/devicetree/bindings/sound/realtek,rt1015.yaml     | 2 +-
 Documentation/devicetree/bindings/sound/st,sta32x.txt           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
index 4f13e8ab50b2..177db900d4a0 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
@@ -30,7 +30,7 @@ properties:
     minItems: 1
     maxItems: 3
     description:
-      Base PLL clocks of audio susbsytem, used to configure base clock
+      Base PLL clocks of audio subsystem, used to configure base clock
       frequencies for different audio use-cases.
 
 patternProperties:
diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index 413b47778181..6fdf605ad59c 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -31,7 +31,7 @@ properties:
     minItems: 1
     maxItems: 3
     description:
-      Base PLL clocks of audio susbsytem, used to configure base clock
+      Base PLL clocks of audio subsystem, used to configure base clock
       frequencies for different audio use-cases.
 
 patternProperties:
diff --git a/Documentation/devicetree/bindings/sound/realtek,rt1015.yaml b/Documentation/devicetree/bindings/sound/realtek,rt1015.yaml
index 880196081a60..3c44ebf93a44 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt1015.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt1015.yaml
@@ -19,7 +19,7 @@ properties:
 
   realtek,power-up-delay-ms:
     description: Set a delay time for flush work to be completed,
-      this vlaue is adjustable depending on platform.
+      this value is adjustable depending on platform.
     maxItems: 1
 
 required:
diff --git a/Documentation/devicetree/bindings/sound/st,sta32x.txt b/Documentation/devicetree/bindings/sound/st,sta32x.txt
index 52265fb757c5..266b6fc9f009 100644
--- a/Documentation/devicetree/bindings/sound/st,sta32x.txt
+++ b/Documentation/devicetree/bindings/sound/st,sta32x.txt
@@ -73,7 +73,7 @@ Optional properties:
 
   -  st,odd-pwm-speed-mode:
 	If present, PWM speed mode run on odd speed mode (341.3 kHz) on all
-	channels. If not present, normal PWM spped mode (384 kHz) will be used.
+	channels. If not present, normal PWM speed mode (384 kHz) will be used.
 
   -  st,invalid-input-detect-mute:
 	If present, automatic invalid input detect mute is enabled.
-- 
2.43.0

