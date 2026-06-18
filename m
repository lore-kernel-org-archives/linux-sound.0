Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0EE386C10
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781022; cv=none; b=Z0m9gUT+RDWJBvfSlCaiEXoC5yOgICpEYPb8MBlEMlStuDVbwSjjPtOj1xHpCMwWKaT/LyeWQo7A8xVaZgYQv1X7eLz3B9mdoJD1TcWqrmTVUFN9kN8kJRukRxReqGTeCZhJbWiOtwPXT8oQ5PiNzBDnyLa8l0bdA/+6D+Z3PCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781022; c=relaxed/simple;
	bh=8buMC4ZD9JZFNnEFGS/4j6mdWskmC/d/IQI+0wOvt4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E427l7+N0ONrCcUTOcO+CoOVPwFxYuelllhzzPxquREQk49car0AOg2QSFnWWJgwnRXGNtgaeEJwrsowufSoo5OHzkfoH8dogQ0+ZlKHeVKDzjqvACZLEAppsfHsYpNCsGDjL6R/SZTB8oXtuPjgo5iifOK6VfRux7qj62KWQLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZmftjfe; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZmftjfe"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c6afcc99a5so3580655ad.0
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781021; x=1782385821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OY5fb/Dq+8t+PbF847YNuNR+1WYPM7PZhbf7meKQVc=;
        b=nZmftjfePDSEEt6YvZeBQvd1i0RyS4ReYGifcdFr9IXtpWg8KTTSz5LpR/NXOvYW/w
         0j78qQT5b/liiJS2dWzCTM3PUxO758gSpKk4iaI5XeZUZ5yAeYjrX5/BXu1JvjAt7z5q
         0UeX2CwJiZ44gnjCIGOpuMDY4t13ObUK0iBS1r4qG9mp4Jlzx7YwHiN8uL8/b7k76CZ6
         OZeYwBsWeXY4JeXs1O74dyGD//KeZoEy7vmtlOD9k25Hs1g/FenILsFWvg/x7V0y/ImL
         OxDsKLTypjtwVMlmDHRUqxhduetrWqcKkINKTZUegXlX3FiQlkOV7id+7k+dIWPn6T+6
         Kpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781021; x=1782385821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4OY5fb/Dq+8t+PbF847YNuNR+1WYPM7PZhbf7meKQVc=;
        b=QO/RMHOM7KEuayJAK89RrX2BxeRDAuCeaYTqaW1tYU7yDbp2Pr42m/cBcymipJLJDA
         ujyiQczgEbao4q2U8X+t6upijHQLcTMlSQQgy7BI4Oi8MD6bMg9Z3CN/SoQ1+0Wpvnmz
         aLQ/om7KLxc7+ASwHf0rOgGPaJIUc+vRsJRxzdbdrHvKyhcVHqbrmgvJFsNTy+YvjBJ4
         YpcUY6Y96VXPekKCN3oStFxf5ZLJYU7EFc52obAm9ueKm1IVyl/97Re6m/nUYGh2eFuv
         F/yHkNT27rP0QdhJ0q2uAkylB1cIgj7p1V7MpwVTww6plQ8aaQE9Kn8sJ2hGe/GW+WaZ
         S4yQ==
X-Forwarded-Encrypted: i=1; AFNElJ+EZnIbqz0kg4rsfcSymg+lQNJSEdCVZe1H6B/gE06chOSIJ/uADqQRgS0BVelVwk+yGeWyIiJ0fSglAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD267ONDpiXDKZCTyXRPou1lhD2hsogeZppm4r+HUOhZZ1PrPo
	ZowOF6Rf5mexKTSvjby9MtUUpbj8EDfUR+SvqunN7XQo+fzOqkyi5BN0
X-Gm-Gg: AfdE7ckhmgEfgZc5ubmHFSb0HJyEjqkpX15wiZ2J5VPXkG2gxlDQORXpnuQiiAEpAXv
	svQVECpDRJYcut/JzUKXOf5QOvIisCZA1hNpZ+HL/AQUXLDagPQT0olDl/8ffyaxp3P63kO3IN7
	rlWiyhoxV2UIzpdIbFBYte4r/v2bJP5iik/v2duj32SwVtkHt4ICduaQ6hh+GGvckjvARjM8Awa
	ZQH2uOZG8MBucOCj81BhSyODKw9ColvIS9g2OGFQXwO2eZ1JpqobmnhK6xSYBLbW3jWusjWtz+J
	dXTa2io5E3BAjoMSusdhVuQGXxEzJ9gz9dRaJYoaB33yd/5PeB56YZWkwurBGR75oLarpb91tXQ
	/l20xcATc3u4lvNtvw9kY8YHPRJl/dOiwE2VB8AjG78wBrFluDJVZkmlq/1hjY48vFnl2yCXup6
	CGFRNdu1rAnMaPbsU+0yAwmlW55zuVvDYDNO1dxiG/Fy506Zo=
X-Received: by 2002:a17:903:19ee:b0:2c6:c9e0:2c17 with SMTP id d9443c01a7336-2c6de3f353emr31079685ad.8.1781781020504;
        Thu, 18 Jun 2026 04:10:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:20 -0700 (PDT)
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
Subject: [PATCH 67/78] ASoC: codecs: wcd939x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:16 +0700
Message-ID: <20260618110827.232983-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd939x.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 010d12466722..922b6a0423a6 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -1923,7 +1923,6 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 	unsigned int micb_reg, cur_vout_ctl, micb_en;
 	int req_vout_ctl;
-	int ret = 0;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1941,7 +1940,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd939x->micb_lock);
+	guard(mutex)(&wcd939x->micb_lock);
 
 	/*
 	 * If requested micbias voltage is same as current micbias
@@ -1957,15 +1956,11 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD939X_MICB_VOUT_CTL);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = req_vout_ctl;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return req_vout_ctl;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	dev_dbg(component->dev, "%s: micb_num: %d, cur_mv: %d, req_mv: %d, micb_en: %d\n",
 		__func__, micb_num, WCD_VOUT_CTL_TO_MICB(cur_vout_ctl),
@@ -1990,9 +1985,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		usleep_range(2000, 2100);
 	}
 
-exit:
-	mutex_unlock(&wcd939x->micb_lock);
-	return ret;
+	return 0;
 }
 
 static int wcd939x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

