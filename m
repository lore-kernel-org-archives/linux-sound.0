Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92353D45FA
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454579; cv=none; b=APu2fQuJnMec4PNtUiclna5tvv6q+zuMTSgc00Ajp2+wTXyuCYvtZWPnHyIQ76Hu+nDi4iXiwnZxeqkesbp9x516sMkhx6b6AeBYJLAC55m2d/7MEbG4am3AKCMPZrhyrmNTzWnQmSVJ9jzqc6WLtV9dSD4X/IiFUI0qBph3uRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454579; c=relaxed/simple;
	bh=qdA4B3AKe8bxpcbruMbAhMcQrORASeDOpn/sYn+G5uM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=caCCbjCs5duHm/Oggk+9YTb3nxBhQTFX+Z/Rp4hzZ+PxMP/PiR7sg3tEl36QrCXLuYE2h2ENJkkerDHLd4rbrY/GIBOjMwEzVuSx0M1lXT4KbshthIZjcSIkcsLn3IiOqB+StEiYXsRpEsd5t5XbDxioEN0JsOQYnLAsQEKo5W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiUjMVJp; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiUjMVJp"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-37deb2d3a82so397842a91.1
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454576; x=1783059376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbPQ5ClieacCrQpT+0BcEXWXh5nAuhJ3UgaZWwx688k=;
        b=XiUjMVJpEWhbPIqWlvDeBCpPaFlZ26l1fvrwIY15jCcOUJQB3bpKEpXn+W2Tv67BrJ
         URTJLSFxvh8EmrzCrhohcprafJvIEXdur0bBmWGCsTlWYSfIYJ4uWiXd97ohex0RtzOx
         TuJrjynMEXzwhQKoCtWn521HfGpSs2aymMGehxUlKLZ8Uwrt23ZsApAHJUKKHex1yON8
         VXbK9NISQV13Kf0VKN2pMxK0Nif8hywqBMD1iYGJRVpHTatxlsr4QQoiFYKa33B28uyp
         qk7qgVnrsI0lgy1D2l/3Qa2iRpEcPPhrqZ/t1EwikLPew0PpORoz2gnMrjMiNZ1K3Nud
         RWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454576; x=1783059376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AbPQ5ClieacCrQpT+0BcEXWXh5nAuhJ3UgaZWwx688k=;
        b=D1tLo0O8WI2Y3Q0yyM47LfO+CjC6HflWQVgI5noa4HQrWiwaTWfv3jLZHctQWMpUOC
         UWJXFp2u0JqbMIgSy7TJjWzBTA5oIsWHqqoHVLbT5OPiV2QfQdPVyvUDFg8LbODTxXkA
         lv95vtlp7+TP0wDEHyF3DNSKRuGG+UKcV430eV2WxKhEhnZG7GiWpVhb9ZWpI8toSB8r
         +PR/jjKXeSZMWQUsKvLvFrdx/Qbo1HmTKC4bxOy4LY57R4YGYjjBc9CaVJJsG+B4GPfX
         nIpPYQeg+TM2AzXymnxTYexBbw258rgeyvGaU4KMIlscoZKXpnL7/rXiA4sS4dyGPsER
         ykWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7Xz2+e23GKnBYWb8GcuYKX1Omx3uuJltgfZbt88XhM7kNhXCGjv4sz93/Eq3iTHUnyqpe8ePiXSZDIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4UOo+SAKMlFaC48uKSobx98L92Ta3xxw451PGMeZQmPBr4KOG
	v+xOTLaQgvhDlSklOp/WaqDCtiRGZrzEBkSXnHYwQXyddhnRg0vZY3Cg
X-Gm-Gg: AfdE7cka3Px5GkclX2vJmPQUXowc6t0j11NEKNoeNT4ewRlsFCEjBzbbLgkC0XzrkzF
	Q5oL4lNAZA27GSPb5thKJZLoiNB37HEcFlo+fVUBPkwuweM34akh6Iumtabj0QAp6x9Dl3/fsmp
	zlj7ROvASg+NsLOJ/6t0yLwy9SudZfcmdpTBSqejlRQlmH6LxDKeMCNVuNVtX3GaNHMIuItVY59
	ADOrHYHmJe+2wNGPL6GYyjgjqAI+08aJ20YixaGDlZmcwJRuwHj15RLYM8raCpNPxWv7nkxWXrF
	3t5T0r6mG8MQqrcBDwkV058uayZUjpYPzNmwlSqjCDrs2qUrcVBgfTNqx1wCac3c6VEP0nPIJ6C
	cI3DK0hZs4KXwS5DY6XLTaJvTYzbNHQygCMX2DgRO2HwK9jZIdm/a3R7y06vE6w/lBWejwWVOtQ
	LumbKmH2caa2jvZxqIAhlF/s6NJleXBr2nvqEs1SUV0usPNqs=
X-Received: by 2002:a17:90b:5843:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-37dfa1ce3ebmr5512195a91.9.1782454576103;
        Thu, 25 Jun 2026 23:16:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 21/24] ASoC: codecs: cs47l90: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:26 +0700
Message-ID: <20260626061329.23264-22-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l90.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 77e8aabb241a..6ce603bfd500 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -2423,9 +2424,8 @@ static int cs47l90_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2456,9 +2456,8 @@ static void cs47l90_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l90->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L90_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l90->core.adsp[i], component);
-- 
2.43.0

