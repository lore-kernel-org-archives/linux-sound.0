Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3181407CFB
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692467; cv=none; b=dGV62ZWdWIHeiDWXqyPWcygsUANKUSDPRaVW82Wl5P9hW4xU97jEhWIfTLJh5mij5g9CE0pyp711rD6Q0WLyw4W1dH4xXPq2P0N5ydKvBYUrF3Wy9E0RsP+PYtiNg6oFuXgOIo4J8yCK56NGxkMLUco7V5xLcfSD79Ypg+OZDZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692467; c=relaxed/simple;
	bh=2HAQewz7GVSe2X0cJjvksl64upthE47nlEwJEo7apms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mmhaAZMFy+gQQbHUcWscV6nlLqi46jMd8471Z8m/1VgEQs4qUt7M/01QM4KuuQUEToNK+sFiGMJK6pk+WJQ7F/evhlK3ocFUI4eXdPRTrbZW6GXlyxP472Vs5Hbba3y+z5MVouExQM8TPvjRZd/o5iR3GdyV6OGFHpmgJ5oIuIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7MDuzTY; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7MDuzTY"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1397ad67f5eso4677528c88.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692463; x=1782297263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nenqm4mvCL5hMwrHSmD1CNITB2tRCoDmulZoNjaZBcE=;
        b=F7MDuzTY6/RB08uWk3ENjzoOREqvgaF+biaeHcrT7grGf3xTgpwZYwWg4rv+acpqfF
         n9CHZscZwvud2ZRe9e+AhqLXImwL5guX+lbZCAeA9H+ya3spB6m778IFNDnQqVq9199e
         hJxEqFBpxjZ0SVbJigFZGbPWcUBl2hAK5LKMBNaBKEE1hvGtZ8ny8V5AJdBV++cfqHH5
         Dmwqsnhgb3NgEW3DwHUzb9tdsuTAywea2nq9T52tEEfJR05prG5uWKg2FkmvqM5XmIES
         wXYADNWJxk2RxtaeovyIo70b/niONSkPYyHOJhlgTr6ZjRjw8LeynuerarYDYeiQZauN
         A5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692463; x=1782297263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nenqm4mvCL5hMwrHSmD1CNITB2tRCoDmulZoNjaZBcE=;
        b=OLf82YsMeYP8yQhwPpxVb/ePsHlgEPAhY01ypMv92WaQ5d8JyvYUGiC/VoG/CZ2XuC
         CbOL6nmr2ZYKKj333OXmetCda16NswB7gt+tqiTgLaC6xhp+JB16IeswdUGOV1y8s7Is
         iw6z+/mi9pEYhLM+YRtZwrq3M9i5ipUYip15mvx+F9lfmoCpm0t5usUaqrN/sJmbUVVz
         Lj/RR2JQ58Jt5Llu14gQMflw67HKIBEOH8deTB2FUTr21uFNyxGsZ53q1JIwK7k/2dtU
         MJiaZm77zbQ6jUVPE5dM2l3PNEDRYp2YlIs/Nsurtjemq40fXnWlPdOI8T/VwStT4GX5
         oHUg==
X-Forwarded-Encrypted: i=1; AFNElJ8qqg78K0CErKJz9O8uHUKMMEcqOS4I0RoxYPhS2vSuhCRu5GDeTbmjluJQ+PI4TFjmDSuRAGZIkeCa4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOGX6D+ixX6B7HT5EyGvCodG7tvr+oJxLZqubCapXrNQKPJyKl
	SCKTalmV550LHtoErHPGtRJlv/yh73Lv36q3fPJx9e8DEbG22xXiV+8p
X-Gm-Gg: Acq92OEbQMgXcHLpJZIBI8OSdIKXKkwhZJOY1tp3KSfJTTac8vBNCPM3jFBqPg3NXHW
	G84WW+RZtbOTvJSfmst42NkPPGlY+BZEOtGqwSIKNMA810LaDoj1DtPItgUrHiIJWMee3kewfHh
	S+VKnFzIKQCyk/HQPQruaxp+kJF39SHQ8GTFAuIETaKI23F0WTFnEOc6yk5VwiYxakqIc6IWNb5
	mT+tVymbDRgq7Gxh9Vh6fkIeCOPqcmvG2ObgT3nMhHAZjFj5rAArptxo/oWDZhdpTW+xfjcYthd
	ZadNUszg+7Rt48d5HJc1rTeRbXXxflvZPtia/P/gcSls1x/XWC6tHP7CFiznbRXX6CPOxOlLe/I
	jcZ+7D758ekyQMO3LStSLqGLLGPCOPe+5kG+9gVhsbng9Ay89xq8fWcuSe3FSU9cZze6kbjLSKm
	f2BtYkbEng+e4V09Z/gGzneRwfUzdH85IhEonlChE3pi9HEF4=
X-Received: by 2002:a05:7022:ec6:b0:139:7e9f:7d13 with SMTP id a92af1059eb24-1398f6d4fb0mr1739410c88.24.1781692462892;
        Wed, 17 Jun 2026 03:34:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:22 -0700 (PDT)
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
Subject: [PATCH 09/78] ASoC: codecs: aw88395: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:26 +0700
Message-ID: <20260617103235.449609-10-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88395/aw88395.c        | 23 ++++++-------
 sound/soc/codecs/aw88395/aw88395_device.c | 39 ++++++++---------------
 2 files changed, 22 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index ee0e8bd8c54c..891450c5c1d0 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -51,9 +51,8 @@ static void aw88395_startup_work(struct work_struct *work)
 	struct aw88395 *aw88395 =
 		container_of(work, struct aw88395, start_work.work);
 
-	mutex_lock(&aw88395->lock);
+	guard(mutex)(&aw88395->lock);
 	aw88395_start_pa(aw88395);
-	mutex_unlock(&aw88395->lock);
 }
 
 static void aw88395_start(struct aw88395 *aw88395, bool sync_start)
@@ -224,11 +223,10 @@ static int aw88395_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88395->lock);
+	guard(mutex)(&aw88395->lock);
 	ret = aw88395_dev_set_profile_index(aw88395->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret < 0) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88395->lock);
 		return 0;
 	}
 
@@ -237,8 +235,6 @@ static int aw88395_profile_set(struct snd_kcontrol *kcontrol,
 		aw88395_start(aw88395, AW88395_SYNC_START);
 	}
 
-	mutex_unlock(&aw88395->lock);
-
 	return 1;
 }
 
@@ -366,7 +362,7 @@ static int aw88395_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88395 *aw88395 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88395->lock);
+	guard(mutex)(&aw88395->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88395_start(aw88395, AW88395_ASYNC_START);
@@ -377,7 +373,6 @@ static int aw88395_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88395->lock);
 
 	return 0;
 }
@@ -495,12 +490,12 @@ static int aw88395_request_firmware_file(struct aw88395 *aw88395)
 
 	dev_dbg(aw88395->aw_pa->dev, "%s : bin load success\n", __func__);
 
-	mutex_lock(&aw88395->lock);
-	/* aw device init */
-	ret = aw88395_dev_init(aw88395->aw_pa, aw88395->aw_cfg);
-	if (ret < 0)
-		dev_err(aw88395->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88395->lock);
+	scoped_guard(mutex, &aw88395->lock) {
+		/* aw device init */
+		ret = aw88395_dev_init(aw88395->aw_pa, aw88395->aw_cfg);
+		if (ret < 0)
+			dev_err(aw88395->aw_pa->dev, "dev init failed");
+	}
 
 	return ret;
 }
diff --git a/sound/soc/codecs/aw88395/aw88395_device.c b/sound/soc/codecs/aw88395/aw88395_device.c
index 79c3135a4110..a3aa43def4ba 100644
--- a/sound/soc/codecs/aw88395/aw88395_device.c
+++ b/sound/soc/codecs/aw88395/aw88395_device.c
@@ -70,7 +70,7 @@ int aw_dev_dsp_write(struct aw_device *aw_dev,
 	u32 reg_value;
 	int ret;
 
-	mutex_lock(&aw_dev->dsp_lock);
+	guard(mutex)(&aw_dev->dsp_lock);
 	switch (data_type) {
 	case AW_DSP_16_DATA:
 		ret = aw_dev_dsp_write_16bit(aw_dev, dsp_addr, dsp_data);
@@ -93,7 +93,6 @@ int aw_dev_dsp_write(struct aw_device *aw_dev,
 	/* clear dsp chip select state*/
 	if (regmap_read(aw_dev->regmap, AW88395_ID_REG, &reg_value))
 		dev_err(aw_dev->dev, "%s fail to clear chip state. Err=%d\n", __func__, ret);
-	mutex_unlock(&aw_dev->dsp_lock);
 
 	return ret;
 }
@@ -156,7 +155,7 @@ int aw_dev_dsp_read(struct aw_device *aw_dev,
 	u32 reg_value;
 	int ret;
 
-	mutex_lock(&aw_dev->dsp_lock);
+	guard(mutex)(&aw_dev->dsp_lock);
 	switch (data_type) {
 	case AW_DSP_16_DATA:
 		ret = aw_dev_dsp_read_16bit(aw_dev, dsp_addr, dsp_data);
@@ -179,7 +178,6 @@ int aw_dev_dsp_read(struct aw_device *aw_dev,
 	/* clear dsp chip select state*/
 	if (regmap_read(aw_dev->regmap, AW88395_ID_REG, &reg_value))
 		dev_err(aw_dev->dev, "%s fail to clear chip state. Err=%d\n", __func__, ret);
-	mutex_unlock(&aw_dev->dsp_lock);
 
 	return ret;
 }
@@ -1110,42 +1108,36 @@ static int aw_dev_dsp_update_container(struct aw_device *aw_dev,
 #ifdef AW88395_DSP_I2C_WRITES
 	u32 tmp_len;
 
-	mutex_lock(&aw_dev->dsp_lock);
+	guard(mutex)(&aw_dev->dsp_lock);
 	ret = regmap_write(aw_dev->regmap, AW88395_DSPMADD_REG, base);
 	if (ret)
-		goto error_operation;
+		return ret;
 
 	for (i = 0; i < len; i += AW88395_MAX_RAM_WRITE_BYTE_SIZE) {
 		tmp_len = min(len - i, AW88395_MAX_RAM_WRITE_BYTE_SIZE);
 		ret = regmap_raw_write(aw_dev->regmap, AW88395_DSPMDAT_REG,
 					&data[i], tmp_len);
 		if (ret)
-			goto error_operation;
+			return ret;
 	}
-	mutex_unlock(&aw_dev->dsp_lock);
 #else
 	__be16 reg_val;
 
-	mutex_lock(&aw_dev->dsp_lock);
+	guard(mutex)(&aw_dev->dsp_lock);
 	/* i2c write */
 	ret = regmap_write(aw_dev->regmap, AW88395_DSPMADD_REG, base);
 	if (ret)
-		goto error_operation;
+		return ret;
 	for (i = 0; i < len; i += 2) {
 		reg_val = cpu_to_be16p((u16 *)(data + i));
 		ret = regmap_write(aw_dev->regmap, AW88395_DSPMDAT_REG,
 					(u16)reg_val);
 		if (ret)
-			goto error_operation;
+			return ret;
 	}
-	mutex_unlock(&aw_dev->dsp_lock);
 #endif
 
 	return 0;
-
-error_operation:
-	mutex_unlock(&aw_dev->dsp_lock);
-	return ret;
 }
 
 static int aw_dev_dsp_update_fw(struct aw_device *aw_dev,
@@ -1231,14 +1223,14 @@ static int aw_dev_check_sram(struct aw_device *aw_dev)
 {
 	unsigned int reg_val;
 
-	mutex_lock(&aw_dev->dsp_lock);
+	guard(mutex)(&aw_dev->dsp_lock);
 	/* check the odd bits of reg 0x40 */
 	regmap_write(aw_dev->regmap, AW88395_DSPMADD_REG, AW88395_DSP_ODD_NUM_BIT_TEST);
 	regmap_read(aw_dev->regmap, AW88395_DSPMADD_REG, &reg_val);
 	if (reg_val != AW88395_DSP_ODD_NUM_BIT_TEST) {
 		dev_err(aw_dev->dev, "check reg 0x40 odd bit failed, read[0x%x] != write[0x%x]",
 				reg_val, AW88395_DSP_ODD_NUM_BIT_TEST);
-		goto error;
+		return -EPERM;
 	}
 
 	/* check the even bits of reg 0x40 */
@@ -1247,7 +1239,7 @@ static int aw_dev_check_sram(struct aw_device *aw_dev)
 	if (reg_val != AW88395_DSP_EVEN_NUM_BIT_TEST) {
 		dev_err(aw_dev->dev, "check reg 0x40 even bit failed, read[0x%x] != write[0x%x]",
 				reg_val, AW88395_DSP_EVEN_NUM_BIT_TEST);
-		goto error;
+		return -EPERM;
 	}
 
 	/* check dsp_fw_base_addr */
@@ -1256,7 +1248,7 @@ static int aw_dev_check_sram(struct aw_device *aw_dev)
 	if (reg_val != AW88395_DSP_EVEN_NUM_BIT_TEST) {
 		dev_err(aw_dev->dev, "check dsp fw addr failed, read[0x%x] != write[0x%x]",
 						reg_val, AW88395_DSP_EVEN_NUM_BIT_TEST);
-		goto error;
+		return -EPERM;
 	}
 
 	/* check dsp_cfg_base_addr */
@@ -1265,15 +1257,10 @@ static int aw_dev_check_sram(struct aw_device *aw_dev)
 	if (reg_val != AW88395_DSP_ODD_NUM_BIT_TEST) {
 		dev_err(aw_dev->dev, "check dsp cfg failed, read[0x%x] != write[0x%x]",
 						reg_val, AW88395_DSP_ODD_NUM_BIT_TEST);
-		goto error;
+		return -EPERM;
 	}
-	mutex_unlock(&aw_dev->dsp_lock);
 
 	return 0;
-
-error:
-	mutex_unlock(&aw_dev->dsp_lock);
-	return -EPERM;
 }
 
 int aw88395_dev_fw_update(struct aw_device *aw_dev, bool up_dsp_fw_en, bool force_up_en)
-- 
2.43.0

