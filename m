Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686E9382295
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 05:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401181; cv=none; b=Ww/+kfvbZM2Xe4KwvtWN25RoIh+bDJlE5KPr8PnUwZe6EwOMOZGu44RFrec3MY1C4RacyyZan5ukd/RG9lcWNaUG8765LFAcai/oRbXEmxppTgqfV45RW+ZJB25/jON/TEGHa9+TsoK1z5agvIUNrS+T8Ke1YIwr0UCnZCuF7jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401181; c=relaxed/simple;
	bh=ViT4SAYQfWPE+1atmk7kb6K9XAwGWWkC6cl6Dp13LeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jz581Jgo8j1uCUQW5yMbNvaWPMd6Y35HHX3tWrG/+WEEu/02ydzTXQX1g5h6WHzmboIXpj9XRz41q7TDY2nFoL9CanUVa9j/lNk6SgjQFLWW4lwwPdWNEIzf3GtFxjLrJdCmGtnEhwWnQZ4/GGAbvTCKiZraeB8dhf1qwu2eF5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTh6jEKq; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTh6jEKq"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so214473b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 22:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401179; x=1784005979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GELCOb8jCO0gF2MBINNZBC9gUyxB3/zkC4nOSWvZgw0=;
        b=hTh6jEKq24lLA5VPjQ7vVwSxvV6+QKrDagiPciPXsuYHeeyAHN6wnTnbVrJeVqGdK3
         yvQxrbLTBn/FJzQ8LiAe+Z3MW/+12MynrwJO0XbHtLwZm9ufFp7sIKFzq0mnAXx3DKDm
         k9zmiBuR6TsgsXzYPvHgkJLXg3AyH809r6Ic/D9py9EnCki4VAPJJlsYULiIU9c5FXZa
         0rmKU5LTmD67wl9D8DLYyWB8IuWQmMxcTUB4FpxEO1J/q+jqyrX7nIpApDEpbIJPgf8U
         pR9byvVCt+GzCETYjPUQiYlUdAzAmWpOhnqlUdRLVz+ddfCMXfaJdRgvWHpMgoKVyE24
         soIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401179; x=1784005979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GELCOb8jCO0gF2MBINNZBC9gUyxB3/zkC4nOSWvZgw0=;
        b=prS2/hqtUFU1/qwltKV9CtVmFyMXyGzZkeYftkHva0hu5g5Pk57UONClPy2ZH/LszM
         5vkFhSA38u3DJBg/84qB98WvKETnxhgEO5g9RGtHSwnhXwNISbiE99zShD4Pz/luoO4d
         qwOCkYVIfL/IogJB5cBIrxdum5xsG84XtOiMwrGVuOpMCDNIliQM0ooPN3sZCa8uTjP+
         +dvV/2vAfQDEK9NHK0yO/LHNfiLPnRsfHTkTHnRtunsLHdG+ICgb/Gqg/J51Y2LarBal
         ajXRgfE2NdyYWvDERsjFh9SXtm2LszzYsIEBApn6YYuHBypGDRMGPwRP/f1rMEAUGmvc
         nEXw==
X-Forwarded-Encrypted: i=1; AHgh+RozKkJ0a7UZeGGD7bx8DFRm7PE3zJ8/rrA1lITl5nuboeN1mhUck5K3uGBo/olgsscIgipq3irTK+WDUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2rnRX5GTMa922vCLDUVuaODrA57bSyZqjuAMXqotxznHzK4te
	SAPu8jre8GJdRhJJzPfd2nhG+oOp03p2ldGLoNNYcxUkfujzcbzaoCdm
X-Gm-Gg: AfdE7cn8ri/v99rx8/pzTvmkD+hNTTgejN1CgCEqzDTS4Zzbbr8er15LR/aDwFT5Ijg
	sPd6bMAuaM993io/R/uAc09SRr/kkQsQCs0PfTXqWoBDDy4r0HCx0IU1rdw3BfPPuZP4EULPjWZ
	oSLz7SQh4Zp6Zxxj7EylbiOh2XOnSOpfxt4+BaTstexH6QDj+0VPqNXo6PcYvxJUAgC0ZKhwVll
	9UWyxGGQtDOu3IsOxtNlCjmRi4IlNx/4NjwjPD5xuWNxjW3v36tFqQ1YsUJ0rumG/IBdRxqAnIm
	T0oJYfx2DV92p80D/X24nDWMhJPN68ZWC3NH72Ijl8fwIF6HYxDtw2TjYAm+OH1gekvPz8AAef6
	4QFm7gKB5lh055jOqFLgoEMytpHCjdQ0OMWzAjeYdbffmGiYjwVS6FgGvRlIzwSJ4IdzSCbstkw
	ZUYov87Sm0X/1fuNcNPX2qhmlJOAXXfiEzesH8Bn/A9T7tRY4=
X-Received: by 2002:a05:6a00:3409:b0:842:4982:825 with SMTP id d2e1a72fcca58-8482f2be228mr1260249b3a.1.1783401178285;
        Mon, 06 Jul 2026 22:12:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:12:58 -0700 (PDT)
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
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 14/24] ASoC: codecs: cs42l42: Use guard() cleanup helpers
Date: Tue,  7 Jul 2026 12:09:56 +0700
Message-ID: <20260707051006.20058-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707051006.20058-1-phucduc.bui@gmail.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
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

