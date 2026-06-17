Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763573F5BC0
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692411; cv=none; b=r56ehQ6dX7s4A8bAjfVyw8ZGdPeQk3+j4q7vKJCsG68wuI2Vvzw3J374XkzSda1C724VOolXOWzB9NBeFfkKlMEZNdN36YQA7pyTmBT2BTZdHLJcdz1ubql5ETMomTEBmyIpc/BAg3M0NPPTNkJTmz589G74PblAQTFfCl3T8rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692411; c=relaxed/simple;
	bh=4HGyeH3q1nNn06K/SUZ+hB/bptaj2+qBs4d7eCvernQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9P8Ju8h2YUYCrSfmq0y60claLfMIRrfpWRFNRl+ojE1o+bbcl3O1WoeJaiditwh1mJEB2mzlJ0aHcm1XfsN4TZWcD5Fy1Q+ztxR35l6FqhXw7gAESgxeaNtTKa5SwbUvhgJ6vcEc/4muQ/8RcM2dMGNGvlBj3RLdOk5TOWZMZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDbOu8/j; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDbOu8/j"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30bcc877b4cso1620544eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692408; x=1782297208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPqL6V1iqK0+FGF4zW5M8iBT6jxKR4lxbeBDY9EaT9k=;
        b=tDbOu8/jsXYlUfvmWBSilumt3l/0QPShxpaksSpAfyueXEoMRx5R2tORPH2Yz5QTp4
         kCAV27CeZZIxUGsUq07aqs9FbVol8a2AKsBUZmh7WGI2AbJ4NmGFqawrtCVrxLmIzal5
         ijkXin2RHQRPNpaNxZcDO9mvEN+H31yOXAkHBDhhp492YVnO6qrxf5Z2nJWSNToQPa2e
         FJNP/lJ2QCstN3yWfVbihjvjsa0tCqPMGMX/XvVVSUx73It3aiM4TAvWYVbiPU/s0DdK
         rQ4IkYG1QHAaKnH2oXyYYx+VzunVgrWJwvhEInwRvYFy/QKQQfwhNs2emvpD+4BKXDrs
         7aTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692409; x=1782297209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VPqL6V1iqK0+FGF4zW5M8iBT6jxKR4lxbeBDY9EaT9k=;
        b=JpvAI1koptw416sFcQV3ukR9thKNs/ZKmwHujzRLjPdXz8k8q979SLddMKhkcI5IaG
         hhqxdKcXZfqjl+msxsv2ML1egipB9EuL6VozePmR++cyqxvN7AKh7LtMJ3etbcKeb8bE
         Nra6zy6WlUDd27zRkEnUaYEVFV1b5YE+QG8oR/naYfI5I6tfzs2jFq+mVyQCUaQNBX7V
         NDIUwlXddRmoSxWWqgWPYGbQeREjnwF2lwWY/PIBxAFN02fLxOiVrTGD1p5ZjBsiJBsO
         G8AfaTAVrmFQ07JelWJt1+5L+ubnkbA3Av2R1ss47gB7LbhmMsQ+9W3Uqijqg3vFLFeA
         zj1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8AyZK85R2l+lwCFDcYYqvRyakRqme2e1Awt+Cs9zfo3y8ng1BKawv5wV7uNEVF1JDqkaxr9IiEmOtzfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcr0QWk/frXeHrMovXNb7hbAV0V2fVTPDnoY52IIbW/FNZsj4b
	OUNY3x73fZ34ZbQugT6sDKmLUDjmal75JVQBDpsfyHzj+VZQliOcmYUD
X-Gm-Gg: AfdE7cm4XPM2uX9AY3z4VK3Qc2qHXS2f4lkVwY+xySYEalQFCOx2Ofrc9OQTz7w3iiF
	UGS0OEmBBDDopxgC2js+yIQPpaGP2v+m44NLa2rVGpRIkzTe9ZifUYl0lAxohLbjKGap8B9UmO/
	bGKSa5uC2FuPwGY6BvBRlsdFt8mi80/O3Vqx22MUDQedDXyYvArpaIRU9mx0kULqDtzLjCWViMD
	ErF0hNHciQCTb7ozVZZw/hLAHLaua6/hwylB8R80yNOZCXr6EjeTt6gqQirsihSdlDo6vAuIbI4
	3RDuDl3Nq7yxaK0oiS5yfcmgyesnhkgD8Po64tsKgW9i5MivQCkImdOvzsC/R8vxzZV8iRcTNUS
	4sZEfOQELQwcL3FUdN6bIL3gbcBFHueeObHmIKiBuOQcvVmaWDoatfAZE9Okd1ALzfKcDtX371I
	wxiYIzbkOPUGrh2kj1YFCpVKiyGxq2rBLyNqB8ekg1jQDkzNw=
X-Received: by 2002:a05:7301:100b:b0:2f1:6252:f8fe with SMTP id 5a478bee46e88-30bc9991ecbmr1870511eec.3.1781692408546;
        Wed, 17 Jun 2026 03:33:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 03/78] ASoC: codecs: arizona-jack: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:20 +0700
Message-ID: <20260617103235.449609-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/arizona-jack.c | 194 +++++++++++++++-----------------
 1 file changed, 92 insertions(+), 102 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index a9063bac2752..fc09b31943a6 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -528,12 +528,11 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 	int ret, reading, state, report;
 	bool mic = false;
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 
 	/* If we got a spurious IRQ for some reason then ignore it */
 	if (!info->hpdet_active) {
 		dev_warn(arizona->dev, "Spurious HPDET IRQ\n");
-		mutex_unlock(&info->lock);
 		return IRQ_NONE;
 	}
 
@@ -546,7 +545,7 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 
 	ret = arizona_hpdet_read(info);
 	if (ret == -EAGAIN)
-		goto out;
+		return IRQ_HANDLED;
 	else if (ret < 0)
 		goto done;
 	reading = ret;
@@ -559,7 +558,7 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 
 	ret = arizona_hpdet_do_id(info, &reading, &mic);
 	if (ret == -EAGAIN)
-		goto out;
+		return IRQ_HANDLED;
 	else if (ret < 0)
 		goto done;
 
@@ -596,9 +595,6 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 	if (state)
 		info->hpdet_done = true;
 
-out:
-	mutex_unlock(&info->lock);
-
 	return IRQ_HANDLED;
 }
 
@@ -707,15 +703,13 @@ static void arizona_micd_timeout_work(struct work_struct *work)
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
@@ -921,12 +915,11 @@ static void arizona_micd_detect(struct work_struct *work)
 
 	cancel_delayed_work_sync(&info->micd_timeout_work);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 
 	/* If the cable was removed while measuring ignore the result */
 	if (!(info->jack->status & SND_JACK_MECHANICAL)) {
 		dev_dbg(arizona->dev, "Ignoring MICDET for removed cable\n");
-		mutex_unlock(&info->lock);
 		return;
 	}
 
@@ -936,7 +929,6 @@ static void arizona_micd_detect(struct work_struct *work)
 		arizona_button_reading(info);
 
 	pm_runtime_mark_last_busy(arizona->dev);
-	mutex_unlock(&info->lock);
 }
 
 static irqreturn_t arizona_micdet(int irq, void *data)
@@ -948,10 +940,10 @@ static irqreturn_t arizona_micdet(int irq, void *data)
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
@@ -969,9 +961,8 @@ static void arizona_hpdet_work(struct work_struct *work)
 						struct arizona_priv,
 						hpdet_work.work);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 	arizona_start_hpdet_acc_id(info);
-	mutex_unlock(&info->lock);
 }
 
 static int arizona_hpdet_wait(struct arizona_priv *info)
@@ -1013,6 +1004,7 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 	struct arizona *arizona = info->arizona;
 	unsigned int val, present, mask;
 	bool cancelled_hp, cancelled_mic;
+	irqreturn_t ret_irq = IRQ_HANDLED;
 	int ret, i;
 
 	cancelled_hp = cancel_delayed_work_sync(&info->hpdet_work);
@@ -1020,110 +1012,108 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 
 	pm_runtime_get_sync(arizona->dev);
 
-	mutex_lock(&info->lock);
-
-	if (info->micd_clamp) {
-		mask = ARIZONA_MICD_CLAMP_STS;
-		present = 0;
-	} else {
-		mask = ARIZONA_JD1_STS;
-		if (arizona->pdata.jd_invert)
+	scoped_guard(mutex, &info->lock) {
+		if (info->micd_clamp) {
+			mask = ARIZONA_MICD_CLAMP_STS;
 			present = 0;
-		else
-			present = ARIZONA_JD1_STS;
-	}
+		} else {
+			mask = ARIZONA_JD1_STS;
+			if (arizona->pdata.jd_invert)
+				present = 0;
+			else
+				present = ARIZONA_JD1_STS;
+		}
 
-	ret = regmap_read(arizona->regmap, ARIZONA_AOD_IRQ_RAW_STATUS, &val);
-	if (ret) {
-		dev_err(arizona->dev, "Failed to read jackdet status: %d\n", ret);
-		mutex_unlock(&info->lock);
-		pm_runtime_put_autosuspend(arizona->dev);
-		return IRQ_NONE;
-	}
+		ret = regmap_read(arizona->regmap, ARIZONA_AOD_IRQ_RAW_STATUS, &val);
+		if (ret) {
+			dev_err(arizona->dev, "Failed to read jackdet status: %d\n", ret);
+			ret_irq = IRQ_NONE;
+			break;
+		}
 
-	val &= mask;
-	if (val == info->last_jackdet) {
-		dev_dbg(arizona->dev, "Suppressing duplicate JACKDET\n");
-		if (cancelled_hp)
-			queue_delayed_work(system_power_efficient_wq,
-					   &info->hpdet_work,
-					   msecs_to_jiffies(HPDET_DEBOUNCE));
+		val &= mask;
+		if (val == info->last_jackdet) {
+			dev_dbg(arizona->dev, "Suppressing duplicate JACKDET\n");
+			if (cancelled_hp)
+				queue_delayed_work(system_power_efficient_wq,
+						   &info->hpdet_work,
+						   msecs_to_jiffies(HPDET_DEBOUNCE));
 
-		if (cancelled_mic) {
-			int micd_timeout = arizona->pdata.micd_timeout;
+			if (cancelled_mic) {
+				int micd_timeout = arizona->pdata.micd_timeout;
 
-			queue_delayed_work(system_power_efficient_wq,
-					   &info->micd_timeout_work,
-					   msecs_to_jiffies(micd_timeout));
+				queue_delayed_work(system_power_efficient_wq,
+						   &info->micd_timeout_work,
+						   msecs_to_jiffies(micd_timeout));
+			}
+
+			goto out;
 		}
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
+			arizona_stop_mic(info);
 
-		arizona_stop_mic(info);
+			info->num_hpdet_res = 0;
+			for (i = 0; i < ARRAY_SIZE(info->hpdet_res); i++)
+				info->hpdet_res[i] = 0;
+			info->mic = false;
+			info->hpdet_done = false;
+			info->hpdet_retried = false;
 
-		info->num_hpdet_res = 0;
-		for (i = 0; i < ARRAY_SIZE(info->hpdet_res); i++)
-			info->hpdet_res[i] = 0;
-		info->mic = false;
-		info->hpdet_done = false;
-		info->hpdet_retried = false;
-
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
-	}
+			regmap_update_bits(arizona->regmap,
+					   ARIZONA_JACK_DETECT_DEBOUNCE,
+					   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB,
+					   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB);
+		}
 
 out:
-	/* Clear trig_sts to make sure DCVDD is not forced up */
-	regmap_write(arizona->regmap, ARIZONA_AOD_WKUP_AND_TRIG,
-		     ARIZONA_MICD_CLAMP_FALL_TRIG_STS |
-		     ARIZONA_MICD_CLAMP_RISE_TRIG_STS |
-		     ARIZONA_JD1_FALL_TRIG_STS |
-		     ARIZONA_JD1_RISE_TRIG_STS);
-
-	mutex_unlock(&info->lock);
+		/* Clear trig_sts to make sure DCVDD is not forced up */
+		regmap_write(arizona->regmap, ARIZONA_AOD_WKUP_AND_TRIG,
+			     ARIZONA_MICD_CLAMP_FALL_TRIG_STS |
+			     ARIZONA_MICD_CLAMP_RISE_TRIG_STS |
+			     ARIZONA_JD1_FALL_TRIG_STS |
+			     ARIZONA_JD1_RISE_TRIG_STS);
+	}
 
 	pm_runtime_put_autosuspend(arizona->dev);
 
-	return IRQ_HANDLED;
+	return ret_irq;
 }
 
 /* Map a level onto a slot in the register bank */
-- 
2.43.0

