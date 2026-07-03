Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1574350298
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058196; cv=none; b=KMKW5UIjKtVEQdz+MZNWAnXd1BS1iYC/c13VRaSaykL2qQgPjlzyMPTjrovt7XZHYe5EXsKWMA+s03HlP+GAaor7umKD/RM3oOLEUW34bunYSZAnwuT3EOYM7nQhAHQ80JxXKlGi58/C0MVGY9soSkG7l5JAKDjI4jPdZT4J5+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058196; c=relaxed/simple;
	bh=ayaHX4mMdnxls4En1EwNkX3g8301f4JtBOFZVawpn0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AxD6Osb/AgvRpvz7GDk2N0HEQvX8w5r5s2TAT+GkoRxUAZoWof3y+mtspJaZHAq7502fOIJBJABGNLSb3JqDpgkybToM3DboyapLDNh0zJ54uCEVoEM7EfUnLJW7l2PSr2KBXQfwU6k5xC/HKzPLPXATCnnmY1rlnpPjQCd14+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htQueo2L; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htQueo2L"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-847a483e344so168185b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058194; x=1783662994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZxOc8ItyVRPfzczN4UVB02dx1NcDBwODm4rRtT7paI=;
        b=htQueo2LL5kWoLYQE8XnRUwpxJOolcCHZCkG2k8vmS/YN54UUTgVTIq+2goA/VcM3f
         q2u+tUgwfrDzOAEjOscqjECwTS5TGiToalhOikFezlA5M68GiIwa+fO2iMS3yzwul5h1
         7/GfrT5vLZuIhsjyOvV1NVfk16kaAlZnj894BCV03gZ+Qs8tRDUqhG31VugXErd/dwFC
         VNihEV3SDpQ3f2YOE1p2V1NosAuYy2wCl18dYbBCH1UYqK8k+I4ojbACVsciZeaPR1hM
         jsFbaQhpD4KsTRMgV78QdXtVViZWz7c4MkogqdovI7ng5LR5xKs1MVvuVVfoq4mijiMn
         Bzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058194; x=1783662994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nZxOc8ItyVRPfzczN4UVB02dx1NcDBwODm4rRtT7paI=;
        b=k2sP/XCsaO6CwxbCG7oyIor8AyuEL2s6tKk7IfCVozAKfUFYw3yaxju1pKRdT7E1Yb
         6uAbEba0Mj9GTcpS4+9+er58qH6Q/y4EWe7lDsW4Ez+fYfT7F5rRahx7eam0nXDP1ZZa
         d5UkUyDe37zMK51TAba+lPir4k89wJubMqBObKHblUDUIdfpXxo6LmkytzqfCNnZZ5P6
         FA0KikidJAGAdommLpDfQ0YdN1DOqIx7gW8HDaTK1Z1N/vU2AkA97Z8GSXwD0Z+A3gg1
         NtmPBvC3SNHv/RCWInvJFULeV05jGqAp6THaEa3cZiaUF3KuxH424NEIwbijyzk3NfUF
         Fq7A==
X-Forwarded-Encrypted: i=1; AHgh+Rr+LOBQtA+Sk5mZoFU9PU5zH9EdYaUKfZ7pSbS9q28QBH2LJFSCnnSTOM7cqo2bGdY4hqdTYoRhm2P7HA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8zuERRzUe5IMoTvJRsdF1PZ/G63V8Yv9L8fCEpw3RL5rQvVBN
	QHHlK8qLoUVzNLphuirgKWFCC9WFtZ61BbRXVDorflnOXHZnIN+aHwdf
X-Gm-Gg: AfdE7cl/8nqjXy+lkv0T7N5rBDczgtfhTz02STUZY6T8WeVvN4BfYDjalRs1/OOOwYg
	i8Wi2ZrLJpC1ItL1w8zlV0GphtMU9nekliMcTjXYoUHODb0TG3tJoeD82HpfVVJ3SHeDX1EqjqZ
	zO5uJw2z8Cqavg0ms1xEK/3F8igr2fSANB239TnE6qIjEjODQW9gcZOZ2LH1Y91zBmTtsi6Mk9M
	BrzoEPizkUFtJoEuM/O5MWkUAxflYmZW+rzoVLjAx0AAnm9HgFDpZqa3Q8g/zmCFQQrgfnTd2+P
	J4KMseQM+SJhmJcKOZ9z+fSV+cc+GpN96ImwrHHb1nIuTnWzYhI6gNDHMDlmoAnopSHKHpHuMQJ
	+WQYqZeiCLyLtcqP8jiNXAHNa8aqmXzl9IgagMYZJSd/4Ex8zY+K7SuOXGL2rcaxhiKdCD030B0
	skGHeKeqJuGv4MzctX8M9q5OoF3kYhqDw8V4aBjQfBCmmDXMM=
X-Received: by 2002:aa7:88ca:0:b0:847:97b2:2263 with SMTP id d2e1a72fcca58-847e1882eb3mr2694237b3a.22.1783058193968;
        Thu, 02 Jul 2026 22:56:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:56:33 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 14/24] ASoC: codecs: cs42l42: Use guard() cleanup helpers
Date: Fri,  3 Jul 2026 12:53:45 +0700
Message-ID: <20260703055355.244898-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
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

