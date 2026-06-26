Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D0F3D45DF
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454541; cv=none; b=fGKTbg6/UzuWIZGSu7FvFOYoQK9tPFwv2MSQw5X/ejbG5DICJtndf7tbJ6U7MJCSikxbgZkmA39obKdJWvde0bIqbatyvkvcoQx1rEL3ggQIhK1KRBf5fLRzT1j/Mhg0dTCBZzTTNSLVRSxhSsJ89mdTxZOujDQyFRWD0wGubgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454541; c=relaxed/simple;
	bh=cT9xGDqUyMmrwWd6UQHCUtPFwxrEinaHOVCQznucHX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WsDas68sFyZXkZ6TAN6bwfdAAoGpNBf/KB+iTBA6bsgvI8qSMchLUy7QcGWKPbe9xK/y9MnDWEumAMGqj8c9pSpwVk2DuTuSyEsj9LR0rMuGtdjXDdAhB+LcAiL0r9wyde7EGEXmGVfd5Dcibe36WFjkbG9pDQ+0myX3FTASZu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUORSirf; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUORSirf"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-37df416c45cso291846a91.2
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454539; x=1783059339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRPEnghfZxq61StH401AduhkEbIXz0HOJx6uokYCpQk=;
        b=kUORSirfsNpEe/zOkscoeQU1hxNt4np8Y5e33nKysrw0baK80N4AFPXnsYvYHpqM/0
         r4FRCJJuIOFE/RuCHm9+cLkvme6i9G+/ioUJXIu+QC+xzaccilR1L/tZuMnkVODyU7Lu
         tJfndlyedS11v6jXhHftu+xo6dUidws2T6T/vjbeH09CSkYDiY2nVEQuJ9zm85pK/Thn
         7rN2gmEYUgNS34gY6qnyCzC25/NsJoA/4oZfVgB0EHpuRNkwNVM0ASDUNznw2xlf4f4h
         DO3BJWpYNLWP7yNUes87v6PcqN9YUJM+AaacsnDb0rCguMLt4vTjIo+jNuJitqZqZ6oC
         N19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454539; x=1783059339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XRPEnghfZxq61StH401AduhkEbIXz0HOJx6uokYCpQk=;
        b=m0GsRZxwaiSm6b6Bce9wzis7Q+o5TOfaeL8vHWGI5ZUTJy74UoceJcqDE86Rg+ljME
         xJsDOgUGtFMuucH47f710iwT7xAnDcaxRW5FJt7Xe1JzkFqgfXyPT6wxUEMFoRqZ/V+j
         BoGsDjbiBB83QVmk/QbZYC6ce1PYObQwIB5gWlMbRcfcP4wP+GDDWXvOdDZxPLO+OcXz
         uqlAH9OjFWUUQpNZCtO5oHwiSdbNW/jMZAppzr5+x6Itlh/CQ63oE5Blmj8M7e0Q7cy+
         LKDOBSFBV5o2CZ0ELspmvYVtHkpfVxXC8IDMVZKkdRDSZbD3aHYDhDtgWnTwGbeDTrTg
         zDQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2W3YvGZ+XCiSw0tP2ww9aw+0h0+JcYAFZnN6FW7KaMwbFZEOV23SHHBAh/UaB+5soEr9QthZgofyNjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx272Ll0lNTDOB9kpj3Z0pdBL+sg+fwPqc2vSBoSIed2fTaG0RU
	3YrrOG0AReAaNgDlSPOEQw/EFTIJlhJhKYzBrF1zSxML4/YMMYdauLHI
X-Gm-Gg: AfdE7cml8SppdvAiM/SyyrVsZGqiu5W/wklLixplVTl6LuCfHZkhg//fuGR0rEuljsv
	JNeyK0XTMrJPh8SGpl+h9uwk+O7bR4RCaV2kb8mm2AglXz8HPtB9bajzv2LZER8evqdE8Xck2d8
	UHwCU67yXWwLAEI8QHr3eftV0jB/7tY/45UG1Ko7jtpIxEB8i0naGDjR7r0KFgc4exMRr27cuqp
	Ob8rQEjzEmSr3XZGNc69TxtvhjTSXRzQx5smYzta7HqP/E+F6y7v1no2nyFG4nntIUc2b7CD2Gt
	GwSmrlBDNo+1tN/DVHuLZyC4hQuRLubFOGr3nLOSN90pwqAZvnpheo4ak5xRsoDSd1mgJ85l1J+
	e6y4/gJBlC8Z/NTIGvRCV1r6VQku7CgJgHETduAchC4ZX29vKTKcntCvBD0+Oziz37Uog40stua
	DKii4YG+VlEiefuYA+GZTk28BRV2z/mi/OEfeNa3HFMVYo/ys=
X-Received: by 2002:a17:90b:3852:b0:373:c536:6fc2 with SMTP id 98e67ed59e1d1-37dfa20ee7fmr4985522a91.22.1782454539140;
        Thu, 25 Jun 2026 23:15:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:15:38 -0700 (PDT)
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
Subject: [PATCH 14/24] ASoC: codecs: cs42l42: Use guard() cleanup helpers
Date: Fri, 26 Jun 2026 13:13:19 +0700
Message-ID: <20260626061329.23264-15-phucduc.bui@gmail.com>
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

Clean up the code using guard() helpers for mutex locking
and PM runtime management.
No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs42l42.c | 54 +++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 2652a639a79a..fadf68860601 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -9,6 +9,7 @@
  * Author: Michael White <michael.white@cirrus.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/types.h>
@@ -565,7 +566,7 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 
 	/* Prevent race with interrupt handler */
-	mutex_lock(&cs42l42->irq_lock);
+	guard(mutex)(&cs42l42->irq_lock);
 	cs42l42->jack = jk;
 
 	if (jk) {
@@ -581,7 +582,6 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
 			break;
 		}
 	}
-	mutex_unlock(&cs42l42->irq_lock);
 
 	return 0;
 }
@@ -1668,13 +1668,10 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	unsigned int current_button_status;
 	unsigned int i;
 
-	pm_runtime_get_sync(cs42l42->dev);
-	mutex_lock(&cs42l42->irq_lock);
-	if (cs42l42->suspended || !cs42l42->init_done) {
-		mutex_unlock(&cs42l42->irq_lock);
-		pm_runtime_put_autosuspend(cs42l42->dev);
+	guard(pm_runtime_active_auto)(cs42l42->dev);
+	guard(mutex)(&cs42l42->irq_lock);
+	if (cs42l42->suspended || !cs42l42->init_done)
 		return IRQ_NONE;
-	}
 
 	/* Read sticky registers to clear interurpt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
@@ -1774,9 +1771,6 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 		}
 	}
 
-	mutex_unlock(&cs42l42->irq_lock);
-	pm_runtime_put_autosuspend(cs42l42->dev);
-
 	return IRQ_HANDLED;
 }
 EXPORT_SYMBOL_NS_GPL(cs42l42_irq_thread, "SND_SOC_CS42L42_CORE");
@@ -2163,22 +2157,22 @@ int cs42l42_suspend(struct device *dev)
 	 * future interrupts. This ensures a safe disable if the interrupt
 	 * is shared.
 	 */
-	mutex_lock(&cs42l42->irq_lock);
-	cs42l42->suspended = true;
+	scoped_guard(mutex, &cs42l42->irq_lock) {
+		cs42l42->suspended = true;
 
-	/* Save register values that will be overwritten by shutdown sequence */
-	for (i = 0; i < ARRAY_SIZE(cs42l42_shutdown_seq); ++i) {
-		regmap_read(cs42l42->regmap, cs42l42_shutdown_seq[i].reg, &reg);
-		save_regs[i] = (u8)reg;
-	}
+		/* Save register values that will be overwritten by shutdown sequence */
+		for (i = 0; i < ARRAY_SIZE(cs42l42_shutdown_seq); ++i) {
+			regmap_read(cs42l42->regmap, cs42l42_shutdown_seq[i].reg, &reg);
+			save_regs[i] = (u8)reg;
+		}
 
-	/* Shutdown codec */
-	regmap_multi_reg_write(cs42l42->regmap,
-			       cs42l42_shutdown_seq,
-			       ARRAY_SIZE(cs42l42_shutdown_seq));
+		/* Shutdown codec */
+		regmap_multi_reg_write(cs42l42->regmap,
+				       cs42l42_shutdown_seq,
+				       ARRAY_SIZE(cs42l42_shutdown_seq));
 
-	/* All interrupt sources are now disabled */
-	mutex_unlock(&cs42l42->irq_lock);
+		/* All interrupt sources are now disabled */
+	}
 
 	/* Wait for power-down complete */
 	msleep(CS42L42_PDN_DONE_TIME_MS);
@@ -2250,13 +2244,13 @@ void cs42l42_resume_restore(struct device *dev)
 	regcache_cache_only(cs42l42->regmap, false);
 	regcache_mark_dirty(cs42l42->regmap);
 
-	mutex_lock(&cs42l42->irq_lock);
-	/* Sync LATCH_TO_VP first so the VP domain registers sync correctly */
-	regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
-	regcache_sync(cs42l42->regmap);
+	scoped_guard(mutex, &cs42l42->irq_lock) {
+		/* Sync LATCH_TO_VP first so the VP domain registers sync correctly */
+		regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
+		regcache_sync(cs42l42->regmap);
 
-	cs42l42->suspended = false;
-	mutex_unlock(&cs42l42->irq_lock);
+		cs42l42->suspended = false;
+	}
 
 	dev_dbg(dev, "System resumed\n");
 }
-- 
2.43.0

