Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1F7346E43
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467485; cv=none; b=UKfTTHnrtZHiJSLWvl2FVWN3lZZEsUU8yU0VwIOC8CtjDfg38P4vKrpSeXQbZtYBGy9GiU5aKWK8oJkAH/0OJlry6cNx8q55FUGL6JD98PH9936hk14Z00tPfEmNcczqx3MmMGQJqkzI8NhjmTgTlUHnkP3W2ltmg+Upx8qDJnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467485; c=relaxed/simple;
	bh=hc/OudOAJizkuq/tPHPl3KLl2IsjBuawl6/ZkFlthW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gq4rrzZ3TZWT5cFCFynqzyUQIiMwAgLUY8GxCL2BXOhMr5WWrTOstDi82nBKei7yLmYI9n/FDN1M1JZet9n4FRioxQFDVs8u/avwAzkSK9WDbbGpQ1q7FVM2Tf5fSfmirAITh96Xg2P1irUQx2xZFwG+PxTIK9EW74ZfAvUM4sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHASdHWN; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHASdHWN"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso4472765ad.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467483; x=1786072283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yDs90EL5tDIcZCjfhXzWzxz6QJUAxk7BYmfEQH08RuU=;
        b=jHASdHWNiHrIbVoIiFl0wS3lVVssdAJUEo8Yd63tTSYdxltixcva21nUqNPrFihfdi
         ElyJk6ZeDlwNplX1FP130SlFzEdwvlnWbFiDqpzcwkduy7b1Svwdc8oUAOIYYb0sZr5l
         0eV2eUlA0VXHvuc67Df5rJPSmCd4+HzXSodNxAdjmNZ9B45HOGPp+0Rn5Pr6tvSzXJ2/
         mtYJais+/Z/lef9f/0OxFQBaRE27ciUwaMGI/1gUspmdEeyxskaBQ/DoqcACe8AEoyOp
         7MctMkv0RDeKa6BlyDSWtJwfemHTkngJeed94Q0mYvG4XqAoApTR4zwF8bqcDU5QD9rC
         irJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467483; x=1786072283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yDs90EL5tDIcZCjfhXzWzxz6QJUAxk7BYmfEQH08RuU=;
        b=TfdEp39ZJNt33e15H0GYWApJ4Qqf0E7JalFgbAzThZb1CjdItbwjRF2Bmt9iTOUZsU
         I+rgiW6zPrF/bnVrKjJvi5CCXozUigqe3TPOqCMkkkJdr5MhAJSl7SsQ5EJ/gXXZ0uqk
         +yiJHxF9qCeoERmEa0cUPx4XXoo1MeZSRlpNcKHu28ifOjZ9YR7ohjECrpHZkBeDh5pn
         Y98g+b7PJ82ijgonegd0kcV6Bi08o8/ZGeW0zy8DET2CxmI8wncdS4bAR5w63u/sI7i1
         U08STRpPKPaB3ZLh3gSXTAPU9KJpJ72cederxccxohNsW5CVybEtqAz0wrYSC/srxIBx
         GDiA==
X-Forwarded-Encrypted: i=1; AHgh+RoZkdL+s4Zy9dYnWmKPpL3cp90RwXyDSPErrnqmyuPsYCRI2tM82i5g4cz0HvSglTbXbA93uKdAiFCyGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+rBmlL3X7IMkupUH50i4RJjI8Q7msbb73qE2uu9VbPaIsY3xn
	/GXCO80hP5b4x7SaagfuQMgV5zNje+XEJ+9r9mNFM6r3TysRgwCKS8xj
X-Gm-Gg: AR+sD11zysoKxLq4LMxiyOKyNfwEWwOxk7MgDanXlofm3LTFKhGpq9G4I1uA3cUC6Vv
	mhsxwVxmhsVs7JO/1tduWaS+bkcQQ5LCm0bS9cYtt1H4QATM1Akxb7B45p/v3Tx5OAECNdxexvW
	ktSqdToL1gdpbgXENeyGuvBdHQzxABs96UjV3f19HmO8R7x4cgAZ4GhPq9Nv5DL3RmiWCwbYTtc
	loZhRDBfxWIJBtBiFZ08gH6NpjNsSqvWbAsTSkxCeJeKOaaW0WnncWTDREKX4HcVvRbviYb0ld+
	3+I5ueqEVXyCZVrG2DCvkxPIcnMvRTGbfV5A5U9AzAiflIlb7aVGmMa3uqS0gl4vNQPBQuLOASz
	pcVUZtw6FhVuhvbhDF51zgWxIIdJXi4dLsCVRcdFf9t9v3kyJe4ksNIN6ImaDz4H6eVUf+vgwfF
	rh4ffQenUEEkwxxf1BU26L6iV+TDzqEfAPBt2YiZqtYCO9fLZYCeYOuxOUr5CmkkI8CpVG+0ziX
	LoLufUnZmKaWePalr4L+dVcnuL/X/IBr0shXWsWS8fpGria3w+/0In94tUAMqwNih8OKBfF5Q9U
	uy6Rhz8Q4AhsBul7Rb3OO7/BuXg=
X-Received: by 2002:a17:903:244a:b0:2cf:9347:f445 with SMTP id d9443c01a7336-2d046d6bb18mr4526915ad.10.1785467483014;
        Thu, 30 Jul 2026 20:11:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:11:21 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	u.kleine-koenig@baylibre.com,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 11/26] ASoC: codecs: wcd-mbhc: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:33 +0700
Message-ID: <20260731030648.8706-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731030648.8706-1-phucduc.bui@gmail.com>
References: <20260731030648.8706-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd-mbhc-v2.c | 140 ++++++++++++++++-----------------
 1 file changed, 66 insertions(+), 74 deletions(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index bb0c8478a8eb..1b7d481e5132 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
@@ -419,9 +420,8 @@ static void wcd_cancel_hs_detect_plug(struct wcd_mbhc *mbhc,
 				      struct work_struct *work)
 {
 	mbhc->hs_detect_work_stop = true;
-	mutex_unlock(&mbhc->lock);
+	guard(mutex)(&mbhc->lock);
 	cancel_work_sync(work);
-	mutex_lock(&mbhc->lock);
 }
 
 static void wcd_mbhc_cancel_pending_work(struct wcd_mbhc *mbhc)
@@ -458,7 +458,7 @@ static void wcd_mbhc_find_plug_and_report(struct wcd_mbhc *mbhc,
 	if (mbhc->current_plug == plug_type)
 		return;
 
-	mutex_lock(&mbhc->lock);
+	guard(mutex)(&mbhc->lock);
 
 	switch (plug_type) {
 	case MBHC_PLUG_TYPE_HEADPHONE:
@@ -481,7 +481,6 @@ static void wcd_mbhc_find_plug_and_report(struct wcd_mbhc *mbhc,
 		     mbhc->current_plug, plug_type);
 		break;
 	}
-	mutex_unlock(&mbhc->lock);
 }
 
 static void wcd_schedule_hs_detect_plug(struct wcd_mbhc *mbhc,
@@ -673,29 +672,28 @@ static irqreturn_t wcd_mbhc_btn_press_handler(int irq, void *data)
 	int mask;
 	unsigned long msec_val;
 
-	mutex_lock(&mbhc->lock);
+	guard(mutex)(&mbhc->lock);
 	wcd_cancel_btn_work(mbhc);
 	mbhc->is_btn_press = true;
 	msec_val = jiffies_to_msecs(jiffies - mbhc->jiffies_atreport);
 
 	/* Too short, ignore button press */
 	if (msec_val < MBHC_BUTTON_PRESS_THRESHOLD_MIN)
-		goto done;
+		return IRQ_HANDLED;
 
 	/* If switch interrupt already kicked in, ignore button press */
 	if (mbhc->in_swch_irq_handler)
-		goto done;
+		return IRQ_HANDLED;
 
 	/* Plug isn't headset, ignore button press */
 	if (mbhc->current_plug != MBHC_PLUG_TYPE_HEADSET)
-		goto done;
+		return IRQ_HANDLED;
 
 	mask = wcd_mbhc_get_button_mask(mbhc);
 	mbhc->buttons_pressed |= mask;
 	if (schedule_delayed_work(&mbhc->mbhc_btn_dwork, msecs_to_jiffies(400)) == 0)
 		WARN(1, "Button pressed twice without release event\n");
-done:
-	mutex_unlock(&mbhc->lock);
+
 	return IRQ_HANDLED;
 }
 
@@ -704,14 +702,14 @@ static irqreturn_t wcd_mbhc_btn_release_handler(int irq, void *data)
 	struct wcd_mbhc *mbhc = data;
 	int ret;
 
-	mutex_lock(&mbhc->lock);
+	guard(mutex)(&mbhc->lock);
 	if (mbhc->is_btn_press)
 		mbhc->is_btn_press = false;
 	else /* fake btn press */
-		goto exit;
+		return IRQ_HANDLED;
 
 	if (!(mbhc->buttons_pressed & WCD_MBHC_JACK_BUTTON_MASK))
-		goto exit;
+		return IRQ_HANDLED;
 
 	ret = wcd_cancel_btn_work(mbhc);
 	if (ret == 0) { /* Reporting long button release event */
@@ -725,8 +723,6 @@ static irqreturn_t wcd_mbhc_btn_release_handler(int irq, void *data)
 		}
 	}
 	mbhc->buttons_pressed &= ~WCD_MBHC_JACK_BUTTON_MASK;
-exit:
-	mutex_unlock(&mbhc->lock);
 
 	return IRQ_HANDLED;
 }
@@ -768,62 +764,60 @@ static int wcd_mbhc_initialise(struct wcd_mbhc *mbhc)
 		return ret;
 	}
 
-	mutex_lock(&mbhc->lock);
-
-	if (mbhc->cfg->typec_analog_mux)
-		mbhc->swap_thr = GND_MIC_USBC_SWAP_THRESHOLD;
-	else
-		mbhc->swap_thr = GND_MIC_SWAP_THRESHOLD;
-
-	/* setup HS detection */
-	if (mbhc->mbhc_cb->hph_pull_up_control_v2)
-		mbhc->mbhc_cb->hph_pull_up_control_v2(component,
-				mbhc->cfg->typec_analog_mux ?
-					HS_PULLUP_I_OFF : HS_PULLUP_I_DEFAULT);
-	else if (mbhc->mbhc_cb->hph_pull_up_control)
-		mbhc->mbhc_cb->hph_pull_up_control(component,
-				mbhc->cfg->typec_analog_mux ?
-					I_OFF : I_DEFAULT);
-	else
-		wcd_mbhc_write_field(mbhc, WCD_MBHC_HS_L_DET_PULL_UP_CTRL,
-				mbhc->cfg->typec_analog_mux ? 0 : 3);
-
-	wcd_mbhc_write_field(mbhc, WCD_MBHC_HPHL_PLUG_TYPE, mbhc->cfg->hphl_swh);
-	wcd_mbhc_write_field(mbhc, WCD_MBHC_GND_PLUG_TYPE, mbhc->cfg->gnd_swh);
-	wcd_mbhc_write_field(mbhc, WCD_MBHC_SW_HPH_LP_100K_TO_GND, 1);
-	if (mbhc->cfg->gnd_det_en && mbhc->mbhc_cb->mbhc_gnd_det_ctrl)
-		mbhc->mbhc_cb->mbhc_gnd_det_ctrl(component, true);
-	wcd_mbhc_write_field(mbhc, WCD_MBHC_HS_L_DET_PULL_UP_COMP_CTRL, 1);
-
-	/* Plug detect is triggered manually if analog goes through USBCC */
-	if (mbhc->cfg->typec_analog_mux)
-		wcd_mbhc_write_field(mbhc, WCD_MBHC_L_DET_EN, 0);
-	else
-		wcd_mbhc_write_field(mbhc, WCD_MBHC_L_DET_EN, 1);
-
-	if (mbhc->cfg->typec_analog_mux)
-		/* Insertion debounce set to 48ms */
-		wcd_mbhc_write_field(mbhc, WCD_MBHC_INSREM_DBNC, 4);
-	else
-		/* Insertion debounce set to 96ms */
-		wcd_mbhc_write_field(mbhc, WCD_MBHC_INSREM_DBNC, 6);
+	scoped_guard(mutex, &mbhc->lock) {
+		if (mbhc->cfg->typec_analog_mux)
+			mbhc->swap_thr = GND_MIC_USBC_SWAP_THRESHOLD;
+		else
+			mbhc->swap_thr = GND_MIC_SWAP_THRESHOLD;
+
+		/* setup HS detection */
+		if (mbhc->mbhc_cb->hph_pull_up_control_v2)
+			mbhc->mbhc_cb->hph_pull_up_control_v2(component,
+					mbhc->cfg->typec_analog_mux ?
+						HS_PULLUP_I_OFF : HS_PULLUP_I_DEFAULT);
+		else if (mbhc->mbhc_cb->hph_pull_up_control)
+			mbhc->mbhc_cb->hph_pull_up_control(component,
+					mbhc->cfg->typec_analog_mux ?
+						I_OFF : I_DEFAULT);
+		else
+			wcd_mbhc_write_field(mbhc, WCD_MBHC_HS_L_DET_PULL_UP_CTRL,
+					     mbhc->cfg->typec_analog_mux ? 0 : 3);
+
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_HPHL_PLUG_TYPE, mbhc->cfg->hphl_swh);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_GND_PLUG_TYPE, mbhc->cfg->gnd_swh);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_SW_HPH_LP_100K_TO_GND, 1);
+		if (mbhc->cfg->gnd_det_en && mbhc->mbhc_cb->mbhc_gnd_det_ctrl)
+			mbhc->mbhc_cb->mbhc_gnd_det_ctrl(component, true);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_HS_L_DET_PULL_UP_COMP_CTRL, 1);
+
+		/* Plug detect is triggered manually if analog goes through USBCC */
+		if (mbhc->cfg->typec_analog_mux)
+			wcd_mbhc_write_field(mbhc, WCD_MBHC_L_DET_EN, 0);
+		else
+			wcd_mbhc_write_field(mbhc, WCD_MBHC_L_DET_EN, 1);
 
-	/* Button Debounce set to 16ms */
-	wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_DBNC, 2);
+		if (mbhc->cfg->typec_analog_mux)
+			/* Insertion debounce set to 48ms */
+			wcd_mbhc_write_field(mbhc, WCD_MBHC_INSREM_DBNC, 4);
+		else
+			/* Insertion debounce set to 96ms */
+			wcd_mbhc_write_field(mbhc, WCD_MBHC_INSREM_DBNC, 6);
 
-	/* enable bias */
-	mbhc->mbhc_cb->mbhc_bias(component, true);
-	/* enable MBHC clock */
-	if (mbhc->mbhc_cb->clk_setup)
-		mbhc->mbhc_cb->clk_setup(component,
-				mbhc->cfg->typec_analog_mux ? false : true);
+		/* Button Debounce set to 16ms */
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_DBNC, 2);
 
-	/* program HS_VREF value */
-	wcd_program_hs_vref(mbhc);
+		/* enable bias */
+		mbhc->mbhc_cb->mbhc_bias(component, true);
+		/* enable MBHC clock */
+		if (mbhc->mbhc_cb->clk_setup)
+			mbhc->mbhc_cb->clk_setup(component,
+					mbhc->cfg->typec_analog_mux ? false : true);
 
-	wcd_program_btn_threshold(mbhc, false);
+		/* program HS_VREF value */
+		wcd_program_hs_vref(mbhc);
 
-	mutex_unlock(&mbhc->lock);
+		wcd_program_btn_threshold(mbhc, false);
+	}
 
 	pm_runtime_put_autosuspend(component->dev);
 
@@ -1327,7 +1321,7 @@ static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int irq, void *data)
 	unsigned long timeout;
 	int adc_threshold, output_mv, retry = 0;
 
-	mutex_lock(&mbhc->lock);
+	guard(mutex)(&mbhc->lock);
 	timeout = jiffies + msecs_to_jiffies(WCD_FAKE_REMOVAL_MIN_PERIOD_MS);
 	adc_threshold = wcd_mbhc_adc_get_hs_thres(mbhc);
 
@@ -1342,7 +1336,7 @@ static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int irq, void *data)
 
 		/* Check for fake removal */
 		if ((output_mv <= adc_threshold) && retry > FAKE_REM_RETRY_ATTEMPTS)
-			goto exit;
+			return IRQ_HANDLED;
 	} while (!time_after(jiffies, timeout));
 
 	/*
@@ -1359,8 +1353,6 @@ static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int irq, void *data)
 	wcd_mbhc_elec_hs_report_unplug(mbhc);
 	wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_ISRC_CTL, 0);
 
-exit:
-	mutex_unlock(&mbhc->lock);
 	return IRQ_HANDLED;
 }
 
@@ -1622,10 +1614,10 @@ void wcd_mbhc_deinit(struct wcd_mbhc *mbhc)
 	free_irq(mbhc->intr_ids->mbhc_btn_press_intr, mbhc);
 	free_irq(mbhc->intr_ids->mbhc_sw_intr, mbhc);
 
-	mutex_lock(&mbhc->lock);
-	wcd_cancel_hs_detect_plug(mbhc,	&mbhc->correct_plug_swch);
-	cancel_work_sync(&mbhc->mbhc_plug_detect_work);
-	mutex_unlock(&mbhc->lock);
+	scoped_guard(mutex, &mbhc->lock) {
+		wcd_cancel_hs_detect_plug(mbhc, &mbhc->correct_plug_swch);
+		cancel_work_sync(&mbhc->mbhc_plug_detect_work);
+	}
 
 	kfree(mbhc);
 }
-- 
2.43.0

