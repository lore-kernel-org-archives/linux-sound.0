Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41CD3EFFB3
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145420; cv=none; b=E0LgqRs5G2sFMa1YaLVEm6rTYlYvGKmnwDvd/NsFECSsBl4HINRcFO3uhWP8zTma1PddAQb2ADIgkEG5xInZANGtQFF4JuAMGzmEVTg2cI9k3ZELfuwmpJG1VE0DQdDj80LCZiIyLW20i2oO2zoLUg15adbLPVJs8W9cZOucbHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145420; c=relaxed/simple;
	bh=hc/OudOAJizkuq/tPHPl3KLl2IsjBuawl6/ZkFlthW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OYuXq1DULU+e13zWnHcyjtDtHEozAM+F2A2AFjOFBLXFs1cbuPWlnp1B5HlNSo+LWOpWyguZ8bNuTCHCBwPejB3XHwo33QRGtO5WI5G+vg6ZakHdsRL9Y6ic8YvvIO0lW69914SLwjw31Dzc2BmoLl8kFKRo9lGqRiX/r1/CfaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pbMkN91B; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pbMkN91B"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-845c92bc464so1863381b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145417; x=1785750217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yDs90EL5tDIcZCjfhXzWzxz6QJUAxk7BYmfEQH08RuU=;
        b=pbMkN91Bevh83xziocBjNkdoJkirpTaYu81DQ73t8HMPRohjaztBqZb0D1sznH0bBn
         fJ35WjLEORwVkmN9NLIicppjbhO3fAi3a+sqGVltl886RjoWt5/0+zeLYSes1qxm3+mb
         RbzFjVQwyiNxZJv6zUy41xM3LoqzsTJqtI0ASA+J3oskv7SFNKD+fF0vygHa826D70nq
         TILDK6X1OrW1yhWd9CLUOk47oYfWkNq1l4MayE7GM2SnquqkYdbTPrqw8E3Batmoyw1X
         N4tbnch7EyAvau8sXj/62R9Mhor4bfvAyhB5SXVaD667l+Rab64y8pmtXmBwM6OrFL7w
         Q2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145417; x=1785750217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yDs90EL5tDIcZCjfhXzWzxz6QJUAxk7BYmfEQH08RuU=;
        b=BVB/OESP4S75jfEYs954+EorWdkDKTfxMQgv7vG4UxU70TYpsBPt6eh+ZYZvZrSkEU
         rnrT//aCOP8rnjJqlHhlhk8NJjohwsKY3zva78neTpZMofwtyRcGLxFRlogzJ/K+Ei4p
         VJUGVHFEe6l87GXVZWTtboda1K4icTG6Eb8xK+x5d+qwLacOiyRytHjy37RvGfIXrVZV
         5LAZ6b0kDlJKKJ93vwk3BM0YJIgM4tSNlyJgjTglsg2p+bRKrjshTd8VJi2E5igyI7FD
         xyYiqmeBW+vcHKSSbLOwM5hn+BPwp/49c4U0bi/KpcYXELhF26N+LE92MH1nmN4xkWwV
         FZuQ==
X-Forwarded-Encrypted: i=1; AHgh+RpuP2ef0UJ0nWWO/QBNcWLaccioA5xAfSxPBYT8A8PeYzo+vk+X/0dRRDcmoSixPhBYJ7dn7dRW6Fyubw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx1Vu3fisdObO8gNasnOwb2oaAUOgORiLgVNguVrbbqke6r+vb
	LA28rG9niSO9fEdUYVVbIgVXOcMj45PHUECEb3maTej4EJoLMpiJNQ9i
X-Gm-Gg: AR+sD12R85AeCMkr0PQ7T+nBee8QrbvQLchE3Zq+ODmGAdERXyjJCa4r8Ng4COhmXFj
	SrnwGk/h/S9h4MDHe0sVd/jyYd7OH4ZxHyQo+yZz16RZmA07GCYhRgGh6+F20fUGf++y7wlFSu5
	0VaYn7shJnazEsdYi88WHOd7tYqooypIoGoMtWhOpE1t3oOzu1lMlx7fp6PSliOKGHqb7AUHv2g
	2ep5i0C3LXO8kH6LXoIflXAK+Pqzi06dcF7JQ2fOIyCPuHBddfErGpbK06Y6cZbRFqGW53LCJ+M
	rUXYaq4RPDy5ttAwDupoDKfF1aaSpTd0IONuvKZLWKS9WMi9FLyoCkR3yE0SHKp7R1jTN2VV8OH
	dkSvbZMGue9LK/KfdrKdgWuh6AXhw1QJzAdPEjwwvAOS8h2oFf+GJGnKz6/sdSxmkfBitpGs1aq
	AFOcC44aqFfiRz6rkwxIN9AKq4I/N4sm26oizP3PEUitHnuCnPNpbMlZuiTFUs9wWMnRa7Bt3SS
	MJXvGN8mKlKtK3wXBjhRA==
X-Received: by 2002:a05:6a00:94f3:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-84e5942c1ccmr6047722b3a.12.1785145417078;
        Mon, 27 Jul 2026 02:43:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:43:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>
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
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 11/26] ASoC: codecs: wcd-mbhc: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:31 +0700
Message-ID: <20260727094046.23001-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727094046.23001-1-phucduc.bui@gmail.com>
References: <20260727094046.23001-1-phucduc.bui@gmail.com>
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

