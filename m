Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6DB35E94E
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058204; cv=none; b=aQBWIV65uTcIJ06nH2ERt+ylnQ9ZYh0QZNOAy75FObgF5U/dLVNHbA2lr+83Tkd4VzaWU3Lvorf1MjxRaYgFT2TaRG2Gi9PZHVLV6CcYoav0EP4r1tu1d6yPFQbfWqOmGQHZCq3JAi4VGDr/v+xgelm3kq2ham+GmHS89NH7IpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058204; c=relaxed/simple;
	bh=N9XefsmTuQIhsLuj0jk+mCnfDsoYJd7P0bPTXStmv98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKefDa3Xrss99K0kjvr1A+A+xALpfDjAebv0BWtVjaKh85HSae3zeHK/rSubWKV/abHB/2+iDW6NPulpzlyHgpHphv8EO4cRKFXZYvGJJyvh2DFDpuaOayLIqIMnuZMScWP9avYeqoYSmv+fBftRuT+Nv5Gdi2tPEBlSb8yzlnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eooggavy; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eooggavy"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84780c95e2eso122070b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058202; x=1783663002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqrKE+7pLzjB2G6upCJC8acTEqQcl0iRkvkciw/YIaE=;
        b=eooggavyLORKSEkbYltt/xOrfLEHx4VV97ha4ESJnNQMD0QWHYiMaAYB47mkO0xuDv
         LKY3wsh1BwFImNOXBsktg/UD4nVEvCULEYWHjvOW8LMNURNSBGT5I1xw0MX8jTbRLT14
         AuF1cygy3S6D+wRZvlDexiAYr3wobpShqTKBngUPL/iMMJGtAuuwslb5P+Kq+4SvpBPG
         pCNjDWkn+sbQAF4YzSnhFvWyrEnyDkCOqwZCE4q554pRNUdAiPrabwL6ZdbFTmj0IK37
         3fVYTniz8kmzUb+dSP3BPq5DZg98exAJseq8CC/N2DAqYq35lkDqzaAvsHlydEIhpApA
         0BWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058202; x=1783663002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IqrKE+7pLzjB2G6upCJC8acTEqQcl0iRkvkciw/YIaE=;
        b=lrs2cXGjnSPRDjKt7CS3seBekwPLpXWOjN7vAwRMYRa5p9qU88SvmFj+DTjivrx3jV
         eTBt/NN6h+I3N6UVvWHYFbJj9cxVCRRFuXlTyAiMjF3L0UoAxiYhqd2x553jUgaAgxw4
         xCyorjdIZ6uFHKgE1duKIvHlquxY5vC9KsyRFvlGpChO4nx4AcPDRZkwVbBVv9Ty9IQU
         rMnz8ig2jWE2ZcGCmN42D1s4NSWE3jfNyUdQ3mG0NcxUglE/96KTDtEKKGCOgH8do/Up
         W58ZK83x+p6cpu34f1cdrjbfqaNC3aMgLL9TgkLWtdYptM8GJWWC8dZQpg4Y5QHn63wK
         3tCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpW8eYMiBXBEra/EQxf7USnbeZMnnJxUAt5oJqBpu784I7qqJnV7Pk1M5usoae4mkt58r4BCM3JKoo0eA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoc1ODtozU05ADeUY1ZagObdom3XvU1FAlVMFMMeh8Vq/5mcQo
	N0T35VHAdjEiP3atDKiXVFSW5F9CnhaCR7CJqq/EUDAyBWWCryFCeV7X
X-Gm-Gg: AfdE7ck3KIxM15fNfh1BZ/CoY5pQK5AYpf0wjPaEBlmf7YWipvQpcV5vke3MpX+PTMC
	J4J8k2jfqevX4YcZ48Qc8FOLLpGWkfLtHxBF/npILk5UvydCrbWiUCYmY8LKJMxsywlE0Yu21pc
	E8PmEIWIUxfSKNtnrNR8AQRLIIgBwiTZa1edS5sHCsYz0HCKnB1PFL8EPFWDPMvI0aOYGc1cTKP
	xUjkH5VAhya60LwVMH3Dpa2jDwnbOOqfo2H6ywYgjWDOGg2O5/CeA73hfaERbppqi/oAJcTyEcl
	c6LXH8ZXy7YfMuSE174JFSZezbf4ltuWkBA6KeOyy7WXQxQBV4EXy2Gqw9gZne0nsWQseewEglo
	BmwoVXEuaTuWQugXNSEapXm3EobHZgtvHcsXedqdflXr7KSvZx2cOpsvVcFQyd/ztYGShXJyn63
	B92bA0jIXjtG80wLga5eALHrvA4NOwSwnk+FkxHKwFT3Hr4Bw=
X-Received: by 2002:a05:6a00:bb05:b0:83e:f228:b112 with SMTP id d2e1a72fcca58-847c5141b3cmr7950079b3a.34.1783058202202;
        Thu, 02 Jul 2026 22:56:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:56:41 -0700 (PDT)
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
Subject: [PATCH v2 15/24] ASoC: codecs: cs42l43: Use guard() and PM runtime scope helpers
Date: Fri,  3 Jul 2026 12:53:46 +0700
Message-ID: <20260703055355.244898-16-phucduc.bui@gmail.com>
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

Convert mutex locking to guard(mutex) and replace explicit runtime
PM handling with runtime PM scope helpers.
This simplifies the control flow by removing explicit cleanup paths
and unnecessary 'goto' labels.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 Switched to a helper function to avoid code duplication, 
 while keeping the guard() conversion since it eliminates 12 goto labels.


 sound/soc/codecs/cs42l43-jack.c | 120 ++++++++++++++------------------
 sound/soc/codecs/cs42l43.c      |  16 ++---
 2 files changed, 58 insertions(+), 78 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 934666295ee3..bbb9a03efcaf 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 
 #include <linux/build_bug.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -67,6 +68,21 @@ static int cs42l43_find_index(struct cs42l43_codec *priv, const char * const pro
 	return -EINVAL;
 }
 
+static void cs42l43_apply_accdet_config(struct cs42l43_codec *priv,
+					unsigned int autocontrol,
+					unsigned int pdncntl)
+{
+	struct cs42l43 *cs42l43 = priv->core;
+
+	regmap_update_bits(cs42l43->regmap, CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
+			   CS42L43_JACKDET_MODE_MASK | CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK |
+			   CS42L43_HSBIAS_SENSE_TRIP_MASK, autocontrol);
+	regmap_update_bits(cs42l43->regmap, CS42L43_PDNCNTL,
+			   CS42L43_RING_SENSE_EN_MASK, pdncntl);
+
+	dev_dbg(priv->dev, "Successfully configured accessory detect\n");
+}
+
 int cs42l43_set_jack(struct snd_soc_component *component,
 		     struct snd_soc_jack *jack, void *d)
 {
@@ -80,31 +96,34 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 
 	dev_dbg(priv->dev, "Configure accessory detect\n");
 
-	ret = pm_runtime_resume_and_get(priv->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(priv->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret) {
 		dev_err(priv->dev, "Failed to resume for jack config: %d\n", ret);
 		return ret;
 	}
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 
 	priv->jack_hp = jack;
 
-	if (!jack)
-		goto done;
+	if (!jack) {
+		cs42l43_apply_accdet_config(priv, autocontrol, pdncntl);
+		return 0;
+	}
 
 	ret = device_property_count_u32(cs42l43->dev, "cirrus,buttons-ohms");
 	if (ret != -EINVAL) {
 		if (ret < 0) {
 			dev_err(priv->dev, "Property cirrus,buttons-ohms malformed: %d\n",
 				ret);
-			goto error;
+			return ret;
 		}
 
 		if (ret > CS42L43_N_BUTTONS) {
 			ret = -EINVAL;
 			dev_err(priv->dev, "Property cirrus,buttons-ohms too many entries\n");
-			goto error;
+			return ret;
 		}
 
 		ret = device_property_read_u32_array(cs42l43->dev, "cirrus,buttons-ohms",
@@ -112,7 +131,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 		if (ret < 0) {
 			dev_err(priv->dev, "Property cirrus,button-ohms malformed: %d\n",
 				ret);
-			goto error;
+			return ret;
 		}
 	} else {
 		priv->buttons[0] = 70;
@@ -124,7 +143,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 	ret = cs42l43_find_index(priv, "cirrus,detect-us", 50000, &priv->detect_us,
 				 cs42l43_accdet_us, ARRAY_SIZE(cs42l43_accdet_us));
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	hs2 |= ret << CS42L43_AUTO_HSDET_TIME_SHIFT;
 
@@ -134,7 +153,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 				 &priv->bias_ramp_ms, cs42l43_accdet_ramp_ms,
 				 ARRAY_SIZE(cs42l43_accdet_ramp_ms));
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	hs2 |= ret << CS42L43_HSBIAS_RAMP_SHIFT;
 
@@ -142,7 +161,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 				 &priv->bias_sense_ua, cs42l43_accdet_bias_sense,
 				 ARRAY_SIZE(cs42l43_accdet_bias_sense));
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	if (priv->bias_sense_ua)
 		autocontrol |= ret << CS42L43_HSBIAS_SENSE_TRIP_SHIFT;
@@ -154,7 +173,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 				       &priv->tip_debounce_ms);
 	if (ret < 0 && ret != -EINVAL) {
 		dev_err(priv->dev, "Property cirrus,tip-debounce-ms malformed: %d\n", ret);
-		goto error;
+		return ret;
 	}
 
 	/* This tip sense invert is set normally, as TIPSENSE_INV already inverted */
@@ -170,7 +189,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 				 &priv->tip_fall_db_ms, cs42l43_accdet_db_ms,
 				 ARRAY_SIZE(cs42l43_accdet_db_ms));
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	tip_deb |= ret << CS42L43_TIPSENSE_FALLING_DB_TIME_SHIFT;
 
@@ -178,7 +197,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 				 &priv->tip_rise_db_ms, cs42l43_accdet_db_ms,
 				 ARRAY_SIZE(cs42l43_accdet_db_ms));
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	tip_deb |= ret << CS42L43_TIPSENSE_RISING_DB_TIME_SHIFT;
 
@@ -199,7 +218,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 					 NULL, cs42l43_accdet_db_ms,
 					 ARRAY_SIZE(cs42l43_accdet_db_ms));
 		if (ret < 0)
-			goto error;
+			return ret;
 
 		ring_deb |= ret << CS42L43_RINGSENSE_FALLING_DB_TIME_SHIFT;
 
@@ -207,7 +226,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 					 NULL, cs42l43_accdet_db_ms,
 					 ARRAY_SIZE(cs42l43_accdet_db_ms));
 		if (ret < 0)
-			goto error;
+			return ret;
 
 		ring_deb |= ret << CS42L43_RINGSENSE_RISING_DB_TIME_SHIFT;
 		pdncntl |= CS42L43_RING_SENSE_EN_MASK;
@@ -228,23 +247,9 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 			   CS42L43_HSBIAS_RAMP_MASK | CS42L43_HSDET_MODE_MASK |
 			   CS42L43_AUTO_HSDET_TIME_MASK, hs2);
 
-done:
-	ret = 0;
-
-	regmap_update_bits(cs42l43->regmap, CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
-			   CS42L43_JACKDET_MODE_MASK | CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK |
-			   CS42L43_HSBIAS_SENSE_TRIP_MASK, autocontrol);
-	regmap_update_bits(cs42l43->regmap, CS42L43_PDNCNTL,
-			   CS42L43_RING_SENSE_EN_MASK, pdncntl);
-
-	dev_dbg(priv->dev, "Successfully configured accessory detect\n");
-
-error:
-	mutex_unlock(&priv->jack_lock);
-
-	pm_runtime_put_autosuspend(priv->dev);
+	cs42l43_apply_accdet_config(priv, autocontrol, pdncntl);
 
-	return ret;
+	return 0;
 }
 
 static void cs42l43_start_hs_bias(struct cs42l43_codec *priv, bool type_detect)
@@ -374,17 +379,18 @@ irqreturn_t cs42l43_button_press(int irq, void *data)
 	unsigned int val = 0;
 	int i, ret;
 
-	ret = pm_runtime_resume_and_get(priv->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(priv->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret) {
 		dev_err(priv->dev, "Failed to resume for button press: %d\n", ret);
 		return iret;
 	}
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 
 	if (!priv->button_detect_running) {
 		dev_dbg(priv->dev, "Spurious button press IRQ\n");
-		goto error;
+		return iret;
 	}
 
 	// Wait for 2 full cycles of comb filter to ensure good reading
@@ -395,12 +401,12 @@ irqreturn_t cs42l43_button_press(int irq, void *data)
 	/* Bail if jack removed, the button is irrelevant and likely invalid */
 	if (!cs42l43_jack_present(priv)) {
 		dev_dbg(priv->dev, "Button ignored due to removal\n");
-		goto error;
+		return iret;
 	}
 
 	if (val & CS42L43_HSBIAS_CLAMP_STS_MASK) {
 		dev_dbg(priv->dev, "Button ignored due to bias sense\n");
-		goto error;
+		return iret;
 	}
 
 	val = (val & CS42L43_HSDET_DC_STS_MASK) >> CS42L43_HSDET_DC_STS_SHIFT;
@@ -423,14 +429,7 @@ irqreturn_t cs42l43_button_press(int irq, void *data)
 
 	snd_soc_jack_report(priv->jack_hp, buttons, CS42L43_JACK_BUTTONS);
 
-	iret = IRQ_HANDLED;
-
-error:
-	mutex_unlock(&priv->jack_lock);
-
-	pm_runtime_put_autosuspend(priv->dev);
-
-	return iret;
+	return IRQ_HANDLED;
 }
 
 irqreturn_t cs42l43_button_release(int irq, void *data)
@@ -439,13 +438,14 @@ irqreturn_t cs42l43_button_release(int irq, void *data)
 	irqreturn_t iret = IRQ_NONE;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(priv->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(priv->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret) {
 		dev_err(priv->dev, "Failed to resume for button release: %d\n", ret);
 		return iret;
 	}
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 
 	if (priv->button_detect_running) {
 		dev_dbg(priv->dev, "Button release IRQ\n");
@@ -457,10 +457,6 @@ irqreturn_t cs42l43_button_release(int irq, void *data)
 		dev_dbg(priv->dev, "Spurious button release IRQ\n");
 	}
 
-	mutex_unlock(&priv->jack_lock);
-
-	pm_runtime_put_autosuspend(priv->dev);
-
 	return iret;
 }
 
@@ -471,13 +467,14 @@ void cs42l43_bias_sense_timeout(struct work_struct *work)
 	struct cs42l43 *cs42l43 = priv->core;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(priv->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(priv->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret) {
 		dev_err(priv->dev, "Failed to resume for bias sense: %d\n", ret);
 		return;
 	}
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 
 	if (cs42l43_jack_present(priv) && priv->button_detect_running) {
 		dev_dbg(priv->dev, "Bias sense timeout out, restore bias\n");
@@ -490,10 +487,6 @@ void cs42l43_bias_sense_timeout(struct work_struct *work)
 				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK,
 				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK);
 	}
-
-	mutex_unlock(&priv->jack_lock);
-
-	pm_runtime_put_autosuspend(priv->dev);
 }
 
 static const struct reg_sequence cs42l43_3pole_patch[] = {
@@ -895,9 +888,8 @@ int cs42l43_jack_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 	ucontrol->value.integer.value[0] = priv->jack_override;
-	mutex_unlock(&priv->jack_lock);
 
 	return 0;
 }
@@ -913,17 +905,13 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 	if (override >= e->items)
 		return -EINVAL;
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 
-	if (!cs42l43_jack_present(priv)) {
-		mutex_unlock(&priv->jack_lock);
+	if (!cs42l43_jack_present(priv))
 		return -EBUSY;
-	}
 
-	if (override == priv->jack_override) {
-		mutex_unlock(&priv->jack_lock);
+	if (override == priv->jack_override)
 		return 0;
-	}
 
 	priv->jack_override = override;
 
@@ -983,7 +971,5 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 				    cs42l43_jack_override_modes[override].report);
 	}
 
-	mutex_unlock(&priv->jack_lock);
-
 	return 1;
 }
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index f0d6ff0b2976..68ec56f18b60 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -8,6 +8,7 @@
 #include <linux/bitops.h>
 #include <linux/bits.h>
 #include <linux/build_bug.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -1208,14 +1209,12 @@ static void cs42l43_spk_vu_sync(struct cs42l43_codec *priv)
 {
 	struct cs42l43 *cs42l43 = priv->core;
 
-	mutex_lock(&priv->spk_vu_lock);
+	guard(mutex)(&priv->spk_vu_lock);
 
 	regmap_update_bits(cs42l43->regmap, CS42L43_INTP_VOLUME_CTRL1,
 			   CS42L43_AMP1_2_VU_MASK, CS42L43_AMP1_2_VU_MASK);
 	regmap_update_bits(cs42l43->regmap, CS42L43_INTP_VOLUME_CTRL1,
 			   CS42L43_AMP1_2_VU_MASK, 0);
-
-	mutex_unlock(&priv->spk_vu_lock);
 }
 
 static int cs42l43_shutter_get(struct cs42l43_codec *priv, unsigned int shift)
@@ -1602,7 +1601,7 @@ static int cs42l43_pll_ev(struct snd_soc_dapm_widget *w,
 	struct cs42l43 *cs42l43 = priv->core;
 	int ret;
 
-	mutex_lock(&cs42l43->pll_lock);
+	guard(mutex)(&cs42l43->pll_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1627,8 +1626,6 @@ static int cs42l43_pll_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&cs42l43->pll_lock);
-
 	return ret;
 }
 
@@ -2566,13 +2563,10 @@ static int cs42l43_set_sysclk(struct snd_soc_component *component, int clk_id,
 {
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 	struct cs42l43 *cs42l43 = priv->core;
-	int ret;
 
-	mutex_lock(&cs42l43->pll_lock);
-	ret = cs42l43_set_pll(priv, src, freq);
-	mutex_unlock(&cs42l43->pll_lock);
+	guard(mutex)(&cs42l43->pll_lock);
 
-	return ret;
+	return cs42l43_set_pll(priv, src, freq);
 }
 
 static int cs42l43_component_probe(struct snd_soc_component *component)
-- 
2.43.0

