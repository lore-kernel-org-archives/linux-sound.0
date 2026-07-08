Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725E043F4CA
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515140; cv=none; b=I20gF/8P7t8gvKEfutqfM7WWDxp5O/qBE0zeglWw9xVnbGwPq1sPHZ469KkzKEqKJFn5v+45SZMRSjTsu9187Tuqj/tu6Cwl/8L2Z7uoh3ZTv8PSX19NeZJI+Uoy+9o9luf672SEluCQi4lhys0imN9yq/bKmhS2MBI0+FjyFco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515140; c=relaxed/simple;
	bh=ViT4SAYQfWPE+1atmk7kb6K9XAwGWWkC6cl6Dp13LeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r0SV8dZD4SXDFHh5SgxPasGRu+k0QvI3AeiCj8LqYpee6G5irqMijCA1qVAF1PUAMiEOsNBSnQW8AFzBar0+zopR0t57jEZ/cCV3G7Bd7ZQG35go4x8fuWVDqMWid88P2qSRUYVhrByZ2/iOJ56TeVr99ZZilrQs2O27oFYCp6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V69TookQ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V69TookQ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3804e42ad5fso634026a91.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515139; x=1784119939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GELCOb8jCO0gF2MBINNZBC9gUyxB3/zkC4nOSWvZgw0=;
        b=V69TookQym+qoGGgLM+07lYC07W0gAk1LC2eRE2LWksmZl+0mW9WGl18L49bPSk+AR
         Z24FAHmSKnZ+ymoZLqQjR5ggAnzYTVDi3BS3KlStjGQf24cSDPrAWkNNkh6zdoOOxiTA
         scNdBdRgL47NTbA3SMjuqk4dNYT6VwQesCAbgXG6i1PfnMOXzTE72EA/vbWep8+yR7Yx
         QQ5ux742eZZ4ryb/cI7vPIfWXSqvmhmz19X8aQ69VFgZThLOkkD53iTJ85hdR9HpbEdP
         TwogW3gltozD3Ta/lHKd9EkYevVELiWirWr7rDov58kOMFAl13iDKq4hY5Ora+VfSSlV
         d50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515139; x=1784119939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GELCOb8jCO0gF2MBINNZBC9gUyxB3/zkC4nOSWvZgw0=;
        b=kyx+urIRW1NiT2aX2vUnLATdzHM6jA+Xez3OGwJ7isnRlEzwDKiMQQ5raDrn2/gUd+
         5JOWN8Yyx1FtIsUbsyWoyYWGLBfyZcjycgFn8IQByU0qzvRFmH2hkKkQPNjTrKTncisg
         3s9OHCAUln3khPBdpWfOoPl58JN1Fftd1b6Ji4C+ofqV69eMP+Vq/4jpqOvCoXbXLSlL
         kDwreX2EPKiXzehTGeTnPmmDUvlyjS2hxzG53gR0XYNPPZYG6qSmOzc9SUZIkD8eg9xu
         yV4BwkZjw7n2xAo+pdQToYWftcD9DpNAK3NeodP42gcYdQ2hkBhygQ6ETogxVS40s9EQ
         wRMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHP5lmnihxCGenJyUpckbdUByqtd5tGPBck5u60xJxpFxvcgZR7N4O0PaT+FyJpspD3GXwYUw7SmeHmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvgVUWL2kHXApnBitOzHMXzudZQNSHKR9cdJ3t/9de1TDVqJxk
	PsXclV9WPJDOBbRn5aTexbtHEeJbgB15noDVK+uzFF5uFsCk4abbaXo2
X-Gm-Gg: AfdE7clhd88Ig9tP2xckbFOVzoVwEkf03vHlre4WM4kM273WUaulRGp47oL4yfSThKh
	h0z9VC6H3l7QfEMlibcGma7+cWS9c+lZ1UWbuqMNCT9DjRjW2F5rnNzRD0ES3623cNjKYnyBXo7
	C76N7XeC/9ZnYay8uUYvMxw+XOS8eO9qL6HT8GZ0+pEgPgtRA0q0VwgNF//tQQpMNtxVLXiDrsY
	AoGrqbpIZ6qv9lfx85+6EpXn+ztO7zlDUpdSxc6rWeo82IwVKya8TArp7ZBSbhPcZyL7WkiRTBw
	iG4fn8TV5NIpnaP0sRmgKCFEuM7239dqjpO3iAozGXZ7t1Ieaw8qNbdHz0Va8tRefjmJo+PgGiJ
	LFFWZtCzqG/czV1t+L6wuDfygavBCYKp8SbFPwJW8ksYWlBXFemyxH+6NAefQbhqzgyQp3Nuq1H
	OIfjzoLc8W0jbqJ9He7dUkuWNqCG7hX7kwEcPwMGYF2TTnR0Q=
X-Received: by 2002:a17:90b:6cb:b0:380:fead:448d with SMTP id 98e67ed59e1d1-3894053cf94mr2762730a91.13.1783515138729;
        Wed, 08 Jul 2026 05:52:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:52:18 -0700 (PDT)
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
Subject: [PATCH v4 14/24] ASoC: codecs: cs42l42: Use guard() cleanup helpers
Date: Wed,  8 Jul 2026 19:49:51 +0700
Message-ID: <20260708125002.202515-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
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

