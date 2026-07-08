Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F6C348C5E
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515057; cv=none; b=IxSC38ywjJMT9CVPxdqZGsgZvfNksTEsun89Gq0EfIsH1gEX1rFcBjErgdx+wJwPh8LnNuAoBMCtEm+IgUmyMe41FzCAel3IMKj3T/hortdruD50ctQXjGiZTGyGUhIVqNduVRi+2vmixFGjd9RZlGMwepTxUXt6HA9+a48wPVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515057; c=relaxed/simple;
	bh=NLNJ9p8QjUYwBmyR9RSKdZ9PzqrvOLlKrVQIcV9VZ0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TCJjNlsrtLfG83zb0mo7tUSOU99ikZzPgJvHaGth8iaFZRroRzMVTq8rTqRRxxfjBGBZtnjyCc7egZ5DejVSQ2o5EFPbQpU74k/WJ9WF2boxFV33OTmEDpvR173FzPM8/bpiFSK656v879BC+jeGYF7sV4aimrJQFOpBtcKRhmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1JRuoAc; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1JRuoAc"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38511175ad3so492607a91.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515055; x=1784119855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPhJ/orWytTpfq3BLT+Hf12jldViQ+Hp0ohV62p2F+A=;
        b=V1JRuoAcosG3hEZwVkiZi2z0kXE5N6f4ABptH6wkowtzVaITpMXV+/j4iiaHl8AhXe
         JZ5laoXtjydpDqIuXCnAbzuFIrV9mlbEYkP/037QdmUGX0fUuCRBguo86dayENqM8XiP
         fL/xKizF/2F+YaEFsHZzzVy7uRTXE8Yyz1j7AReECNZVH3Qy70ClfT0+Nwr8Zy+/Ec20
         JN2WTfiWMB2CeMAh8+QErU0ccMPXpYUuX9qWQSXZqyJSGHfCUq9vQYD44ahWc7UHKaFh
         OH/JZkk0hoV441LqAvu1MHxEdLCBUZPBCBHbAn7oYAq5QKyl5acanzcCa/cr1UeliCJU
         7fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515055; x=1784119855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPhJ/orWytTpfq3BLT+Hf12jldViQ+Hp0ohV62p2F+A=;
        b=I9Ly4ZEh8rpsAuQv/zz6HSfyOpdPO7Aqf1xI7A/wI1tzG7fRsmWDCReO7NcQgNuhvE
         FmGg2fNsMYx1tcV3JbLAA8MozavSJ1Z2nUFRfZDfrANJyAEkHqfYzanBJLdC9GmGIkBD
         J5bj459zrvIcLSnrANZ00mC+qW77+17Dfh5Q5z+PAPtGBeIUWCyP060xGyD4UNIVguEj
         voOAuuglE49X75wvK/Mi6yBiyGw7C9thsZt/gJiWxvLioAmRybT8C0VV/h/MyBH/1aCA
         mZduPcH/YcMx1KlJt2c8mdUpf5vXR2fTRoNKJsnBGR2iVLTeOEMz1/EnndLlvUelFi7S
         C4LA==
X-Forwarded-Encrypted: i=1; AHgh+RpID94MsHcHOQQbEowUSLsvH9uCqhMq3U0xAayvYUfaVn9VqSCqbpyEVxKy+EbA9yeF8/G3xghepKr+zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCVZS7vkkgr1J2LyjMrJhzRrcfdIU2QI/ZpteepfjGbttzbQxd
	5jVsVCLfANEUrSCuP05kOzZm9MExyWzpzRCGw0AzfJH70L37WHMFcx00
X-Gm-Gg: AfdE7ck6Urfgc5iCGk37wjRyrPTobPmUS7eJ+qLg7VfN0xXr/lU86Jx7NEzeyTUOlQC
	QOqTyeOTo4kzDqrlVQqkt7nGr/sSWCgyar068tfJjl8Ow987mQn8ExcJY7+U61G8LHE+W7j6N2q
	u+wUo2u3+Vb8+XsTHEuNU/KKrt5jCKnq6rXFiwsRgq0XYwbv2guY3o9P17opbOhBYjqvL6ImMTI
	7OAdSbkDQvr5D6gU2iRVbuNBXbvqALIn5nvwu8WHBgkBneBmcHvABbIibn7liEKlj7Jl+JQP0wy
	WAhpZjYY8AIL8xcxJ2O6HtrVtbv4fWTCfmOYrgV3PJJv52jRZkevbB2jtptf+L9IxLRs39SThBV
	Z2Za3bhpTZfNAibRhF1MF8toay6QwLenwDGa8/j+4G+mMq1cVYlwisWSRr8vsF9XZpGh6w+0xcN
	fPMyUsBqW079alEdf9v4ilpRbBm+QElE2SMs0ya9qBa3JMwoQ=
X-Received: by 2002:a17:90b:2682:b0:37c:774c:77ba with SMTP id 98e67ed59e1d1-389416e7fe2mr2805094a91.21.1783515055229;
        Wed, 08 Jul 2026 05:50:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:50:54 -0700 (PDT)
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
Subject: [PATCH v4 03/24] ASoC: codecs: arizona-jack: Use guard() cleanup helpers
Date: Wed,  8 Jul 2026 19:49:40 +0700
Message-ID: <20260708125002.202515-4-phucduc.bui@gmail.com>
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

Changes in v2:
 Reworked the code to use an if/else structure, 
 avoiding code duplication after removing the goto label.
Changes in v3: 
 Remove unnecessary blank lines.

 sound/soc/codecs/arizona-jack.c | 117 +++++++++++++++-----------------
 1 file changed, 53 insertions(+), 64 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index a9063bac2752..819d080b1188 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -5,6 +5,7 @@
  *  Copyright (C) 2012-2014 Wolfson Microelectronics plc
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -707,15 +708,13 @@ static void arizona_micd_timeout_work(struct work_struct *work)
 						struct arizona_priv,
 						micd_timeout_work.work);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 
 	dev_dbg(info->arizona->dev, "MICD timed out, reporting HP\n");
 
 	info->detecting = false;
 
 	arizona_identify_headphone(info);
-
-	mutex_unlock(&info->lock);
 }
 
 static int arizona_micd_adc_read(struct arizona_priv *info)
@@ -921,12 +920,11 @@ static void arizona_micd_detect(struct work_struct *work)
 
 	cancel_delayed_work_sync(&info->micd_timeout_work);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 
 	/* If the cable was removed while measuring ignore the result */
 	if (!(info->jack->status & SND_JACK_MECHANICAL)) {
 		dev_dbg(arizona->dev, "Ignoring MICDET for removed cable\n");
-		mutex_unlock(&info->lock);
 		return;
 	}
 
@@ -936,7 +934,6 @@ static void arizona_micd_detect(struct work_struct *work)
 		arizona_button_reading(info);
 
 	pm_runtime_mark_last_busy(arizona->dev);
-	mutex_unlock(&info->lock);
 }
 
 static irqreturn_t arizona_micdet(int irq, void *data)
@@ -948,10 +945,10 @@ static irqreturn_t arizona_micdet(int irq, void *data)
 	cancel_delayed_work_sync(&info->micd_detect_work);
 	cancel_delayed_work_sync(&info->micd_timeout_work);
 
-	mutex_lock(&info->lock);
-	if (!info->detecting)
-		debounce = 0;
-	mutex_unlock(&info->lock);
+	scoped_guard(mutex, &info->lock) {
+		if (!info->detecting)
+			debounce = 0;
+	}
 
 	if (debounce)
 		queue_delayed_work(system_power_efficient_wq,
@@ -969,9 +966,8 @@ static void arizona_hpdet_work(struct work_struct *work)
 						struct arizona_priv,
 						hpdet_work.work);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 	arizona_start_hpdet_acc_id(info);
-	mutex_unlock(&info->lock);
 }
 
 static int arizona_hpdet_wait(struct arizona_priv *info)
@@ -1018,9 +1014,9 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 	cancelled_hp = cancel_delayed_work_sync(&info->hpdet_work);
 	cancelled_mic = cancel_delayed_work_sync(&info->micd_timeout_work);
 
-	pm_runtime_get_sync(arizona->dev);
+	guard(pm_runtime_active_auto)(arizona->dev);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 
 	if (info->micd_clamp) {
 		mask = ARIZONA_MICD_CLAMP_STS;
@@ -1036,8 +1032,6 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 	ret = regmap_read(arizona->regmap, ARIZONA_AOD_IRQ_RAW_STATUS, &val);
 	if (ret) {
 		dev_err(arizona->dev, "Failed to read jackdet status: %d\n", ret);
-		mutex_unlock(&info->lock);
-		pm_runtime_put_autosuspend(arizona->dev);
 		return IRQ_NONE;
 	}
 
@@ -1056,62 +1050,61 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 					   &info->micd_timeout_work,
 					   msecs_to_jiffies(micd_timeout));
 		}
+	} else {
+		info->last_jackdet = val;
 
-		goto out;
-	}
-	info->last_jackdet = val;
+		if (info->last_jackdet == present) {
+			dev_dbg(arizona->dev, "Detected jack\n");
+			snd_soc_jack_report(info->jack, SND_JACK_MECHANICAL, SND_JACK_MECHANICAL);
 
-	if (info->last_jackdet == present) {
-		dev_dbg(arizona->dev, "Detected jack\n");
-		snd_soc_jack_report(info->jack, SND_JACK_MECHANICAL, SND_JACK_MECHANICAL);
+			info->detecting = true;
+			info->mic = false;
+			info->jack_flips = 0;
 
-		info->detecting = true;
-		info->mic = false;
-		info->jack_flips = 0;
+			if (!arizona->pdata.hpdet_acc_id) {
+				arizona_start_mic(info);
+			} else {
+				queue_delayed_work(system_power_efficient_wq,
+						   &info->hpdet_work,
+						   msecs_to_jiffies(HPDET_DEBOUNCE));
+			}
 
-		if (!arizona->pdata.hpdet_acc_id) {
-			arizona_start_mic(info);
+			if (info->micd_clamp || !arizona->pdata.jd_invert)
+				regmap_update_bits(arizona->regmap,
+						   ARIZONA_JACK_DETECT_DEBOUNCE,
+						   ARIZONA_MICD_CLAMP_DB |
+						   ARIZONA_JD1_DB, 0);
 		} else {
-			queue_delayed_work(system_power_efficient_wq,
-					   &info->hpdet_work,
-					   msecs_to_jiffies(HPDET_DEBOUNCE));
-		}
+			dev_dbg(arizona->dev, "Detected jack removal\n");
 
-		if (info->micd_clamp || !arizona->pdata.jd_invert)
-			regmap_update_bits(arizona->regmap,
-					   ARIZONA_JACK_DETECT_DEBOUNCE,
-					   ARIZONA_MICD_CLAMP_DB |
-					   ARIZONA_JD1_DB, 0);
-	} else {
-		dev_dbg(arizona->dev, "Detected jack removal\n");
-
-		arizona_stop_mic(info);
+			arizona_stop_mic(info);
 
-		info->num_hpdet_res = 0;
-		for (i = 0; i < ARRAY_SIZE(info->hpdet_res); i++)
-			info->hpdet_res[i] = 0;
-		info->mic = false;
-		info->hpdet_done = false;
-		info->hpdet_retried = false;
+			info->num_hpdet_res = 0;
+			for (i = 0; i < ARRAY_SIZE(info->hpdet_res); i++)
+				info->hpdet_res[i] = 0;
+			info->mic = false;
+			info->hpdet_done = false;
+			info->hpdet_retried = false;
 
-		snd_soc_jack_report(info->jack, 0, ARIZONA_JACK_MASK | info->micd_button_mask);
+			snd_soc_jack_report(info->jack, 0,
+					    ARIZONA_JACK_MASK | info->micd_button_mask);
 
-		/*
-		 * If the jack was removed during a headphone detection we
-		 * need to wait for the headphone detection to finish, as
-		 * it can not be aborted. We don't want to be able to start
-		 * a new headphone detection from a fresh insert until this
-		 * one is finished.
-		 */
-		arizona_hpdet_wait(info);
+			/*
+			 * If the jack was removed during a headphone detection we
+			 * need to wait for the headphone detection to finish, as
+			 * it can not be aborted. We don't want to be able to start
+			 * a new headphone detection from a fresh insert until this
+			 * one is finished.
+			 */
+			arizona_hpdet_wait(info);
 
-		regmap_update_bits(arizona->regmap,
-				   ARIZONA_JACK_DETECT_DEBOUNCE,
-				   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB,
-				   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB);
+			regmap_update_bits(arizona->regmap,
+					   ARIZONA_JACK_DETECT_DEBOUNCE,
+					   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB,
+					   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB);
+		}
 	}
 
-out:
 	/* Clear trig_sts to make sure DCVDD is not forced up */
 	regmap_write(arizona->regmap, ARIZONA_AOD_WKUP_AND_TRIG,
 		     ARIZONA_MICD_CLAMP_FALL_TRIG_STS |
@@ -1119,10 +1112,6 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 		     ARIZONA_JD1_FALL_TRIG_STS |
 		     ARIZONA_JD1_RISE_TRIG_STS);
 
-	mutex_unlock(&info->lock);
-
-	pm_runtime_put_autosuspend(arizona->dev);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.43.0

