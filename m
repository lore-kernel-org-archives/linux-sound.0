Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77471325707
	for <linux-sound@vger.kernel.org>; Sun,  1 Mar 2026 08:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772352385; cv=none; b=bDuADr2FF0QsqlIdUa0hxYeSzLwEUu6XzgT8pxgZaj1F4cKsDsfILmpnIhaP8/+6nKI4mE2pJLQupu5fF50a9749vsk4ZAh5XsTHOSw1mESPaWF+kpAUfDlHcr+ZdyWY0tE5n6yNNtoCE5QRvc3nuikRElZTX+FDHyzvhlZ6hy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772352385; c=relaxed/simple;
	bh=lwN3AXla5E+hMpOvc4cTc/hS2rvMFZBUZ7ENOshqDaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BZaV4igaU1cyEvf31/qzLio1DeX3hy6oJQLq5B+NBbs538cSYAn5r/NVuegvTm5dqZoFxxY00qaHkbbBABYZQ8qPI0DDQ5yReHFyBV/KBss9+HNrxT5DhuOnDwF3QGPpzbdtbf+tnOcqA4/qSUrPsHjYdgZM+B04KhgUf4lYlLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Of4jPXgl; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Of4jPXgl"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c6e2355739dso1366498a12.2
        for <linux-sound@vger.kernel.org>; Sun, 01 Mar 2026 00:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352384; x=1772957184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SejpEdn5w8C9URiM1Is7ely7u34ezEnpcYmkEzh4N/0=;
        b=Of4jPXglZ9UMySYQgG+KBUjZHUGQI0Q6wA4LQJODvjVvpsGqUsPVxg5ipjk50HfxPU
         Yy35ROpty9y8+hy0egSERcobI4aLjY3e5BR/LkochEqjSGQNf6P4YJkyQaebUsfVA2CV
         zpTIulggSr6vxr4vMCyEpV5k0nPY96N7bKNZwdUKuGWPBbwA3iroltUZHib0xXNvtayk
         YPu1jwjiGRppusLXU9Jlk5xArwvQZRtsjIaLaPrnaOC/09N7WtPemAXGGW7EEoaqj2HW
         VdzLSDJsvVbK/cKF7t4PAA242hImeh1HvqCe9smQDD4uzkB9v7/XFs8+p7/xUc6rtQhx
         rdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352384; x=1772957184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SejpEdn5w8C9URiM1Is7ely7u34ezEnpcYmkEzh4N/0=;
        b=E+PfjhuOCLRMj8G8Fpaq4xOyLjE+cJhE88G0g7k1fj7fZQ3hnFqcRxbkZUkr/xJxg+
         7exN7WWRaro3ZBxzuDc7LL4Cgn09n3GrZYzUMf5nwVN7KBsfVAFt+AtiPf6RTEevx1fA
         WWnCsJ99d24B7KbGpioyE6OTiqza3KYi8KCf3Bh74EIm7oKffTgKJmV28QdG13cIXffX
         J1b47ByIVdqburwbRNE+O/Pqxwo6GEYO8Jd2d9uwRSZputsKMZG+Hg30gK2okKGIvmAo
         t62XDvsbswJQbVWWUpkwqOoyIU7D1qD1MuGXVtgbQQ9BAcnM1NvlAbE6K/UozQF+iKh0
         2Ndw==
X-Gm-Message-State: AOJu0YymVcVt38tOa0HOpxxh9GDsVn211hmzG8xcpsF8y3k87HVn1UJj
	c3QLmEcS9fnByxXJQNmQ9391ZqRYzhYrSSX2uaUswlBMOAweT/IRdEyS
X-Gm-Gg: ATEYQzx5s3Dfpo5NhINUmNiiB17v+vUtqFvv3rCvrwVgys9PayM0YRpRph/Umk6/xrN
	PQpmLtfw4fXS93MVHJ8ThTR/FgGFD2uV9FIJTMb7Abf1veWRBa2ML6napSoCbwqcb43phtJRP6X
	m0RynIGqLRl5RCyuBXHCJrKGE8AeYzkQxyGV3sILJGD0loON5GY8AqVZ7BPBMUMyZS1deh5wqxZ
	DgdSdgYMzl9gLu1gbzWQYiwWoqnjIrL8+TTLZtCFj23VKNf3HNPbxcocvzuIgLflqIG34Y+b+Li
	uZuQEQ4PRkCdBpaeWHbRpBmOTwBxUvTYbyh5Z5N7Cc1tLzYx33Q26/e+Wv3ussUM+aPe/j5LqLb
	IAloR+YLh5WdWOvinpi78MAQldTzM3tbItbFMJjwo+WDK2hHOey3v5XMhEv3yrvBwHxhZgEQ45s
	WyZ0/CO8u+t8EpokvtmllePfiACuAxkiReesfTNUOI1WWFepKZFcM1p1AoB1cxuDEzrGcpMbbSG
	12JgBfzt29+jbAGOLIKocaK4ml+ecv5uo2l8RYR0wb3W/oRmeQTHF+I1UUbMuDiC2cW27Hq9E3W
X-Received: by 2002:a17:90b:5408:b0:341:134:a962 with SMTP id 98e67ed59e1d1-35965ccab15mr6135772a91.28.1772352383697;
        Sun, 01 Mar 2026 00:06:23 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:23 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:21 +1000
Subject: [PATCH v3 2/7] ASoC: dt-bindings: update tdm-slot.txt references
 to tdm-slot.yaml
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-2-c6ac5351489a@gmail.com>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
In-Reply-To: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2590;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=lwN3AXla5E+hMpOvc4cTc/hS2rvMFZBUZ7ENOshqDaA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6cHMG3JNUtnOnhEU8P3mFxZpKZOq9r+mHi5Zf112
 n8W7lrVMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOrtJQz/LDoPXY//4G2ZqVPwOXFFua35oXjbRTty8nIZnjV5Ltrkw/CbjWWO294
 VAcvlGK7uLd4ovun4uwWP3tfumPhD8feCpi8T2AE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Ensure that all references to tdm-slot.txt have been updated to
tdm-slot.yaml, and are schema-compliant.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/imx-audio-card.yaml   |  9 +++------
 .../bindings/sound/simple-card.yaml      | 14 ++------------
 2 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index 3c75c8c78987..5424d4f16f52 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -24,6 +24,7 @@ patternProperties:
       cpu/codec dais.
 
     type: object
+    $ref: tdm-slot.yaml#
 
     properties:
       link-name:
@@ -38,13 +39,9 @@ patternProperties:
             - i2s
             - dsp_b
 
-      dai-tdm-slot-num:
-        description: see tdm-slot.txt.
-        $ref: /schemas/types.yaml#/definitions/uint32
+      dai-tdm-slot-num: true
 
-      dai-tdm-slot-width:
-        description: see tdm-slot.txt.
-        $ref: /schemas/types.yaml#/definitions/uint32
+      dai-tdm-slot-width: true
 
       playback-only:
         description: link is used only for playback
diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 533d0a1da56e..a14716b2732f 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -27,14 +27,6 @@ definitions:
     description: dai-link uses bit clock inversion
     $ref: /schemas/types.yaml#/definitions/flag
 
-  dai-tdm-slot-num:
-    description: see tdm-slot.txt.
-    $ref: /schemas/types.yaml#/definitions/uint32
-
-  dai-tdm-slot-width:
-    description: see tdm-slot.txt.
-    $ref: /schemas/types.yaml#/definitions/uint32
-
   system-clock-frequency:
     description: |
       If a clock is specified and a multiplication factor is given with
@@ -115,6 +107,8 @@ definitions:
 
   dai:
     type: object
+    $ref: tdm-slot.yaml#
+
     properties:
       sound-dai:
         maxItems: 1
@@ -133,10 +127,6 @@ definitions:
       bitclock-master:
         $ref: /schemas/types.yaml#/definitions/flag
 
-      dai-tdm-slot-num:
-        $ref: "#/definitions/dai-tdm-slot-num"
-      dai-tdm-slot-width:
-        $ref: "#/definitions/dai-tdm-slot-width"
       clocks:
         maxItems: 1
       system-clock-frequency:

-- 
2.53.0

