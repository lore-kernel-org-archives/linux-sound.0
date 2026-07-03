Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4FC331A57
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058140; cv=none; b=JA5nwcxA5OlT0AakcmqegwtLFniq0+dX6KjFL86mmlrx1MmfsNJcO8jL75yELYiBTWdW3Q6fp3Udxo1YScImu4tB36T4QDcGVpL2cP2ENli3lFg/mfYcPPBba/Ite67jYoX4bv2EGxA0+t4xheuIX8FzJBre7n6UTFPGvLsv/3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058140; c=relaxed/simple;
	bh=Ndi9ztERcV2E6wj0ZiAD9dw8sa3JKmHNL2DXlielBW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dt0Iz1Tles8mLQWvxMVC4bSsOUY17ZzpVs4PKdtighx1fZnXJULJmnRrtM14Cy9fdzXWM7QUcQKpDLfVJzy8ab/pH93p9k3ueOc8CsW2+i/mq6MQeFgf3ZqgyR3/NQlJ5AuXo8oGAA6f2gO1iWNgbA7pa83yRfnAehyHwvcnxs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZqPoV/6; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZqPoV/6"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-847a483e344so167652b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058137; x=1783662937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0jFp0C/egZc6BQS29FRHENTjPyX9Az93enk7WCGwgo=;
        b=FZqPoV/6GQrd8kTOlTHlKCVNXfxgcMwp4/ck4qmOJ5lbnoNK3rhA2BL/4igVPMYHHD
         5lLEiXUeH+myr4OAC6NwRyR/0X4t8uHeKcDnO0hrhWA0z3djrb5oSEEwCUx+3he5X3RC
         M0yIjvTWoU6WEDa/yK4TPKz/3GGmQdEsXKC5WH3Ec/9HUMqhqB1CWOVo0TZaXXkK0Pc7
         BVz7t88cOpiQp4z5N82UvR92NFtFR8T7oYhXvgEi8KpWXx6vOeeI876oXRU2GXfsVjpy
         1c4xH1H/Bt1t5AcAU9iQR4rTZQVO56xpfzWXULLQ2YH9Gi/x2MtgDoRQyKkLEwR/MVOL
         szLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058137; x=1783662937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j0jFp0C/egZc6BQS29FRHENTjPyX9Az93enk7WCGwgo=;
        b=TlfhfG7OyyoaFXxQyBWXyuW91QMlzTmWV0cK+d4W21DnbfyEzMMNWCFtVLcirw7QQv
         MoIPe53c329dc46dlBUeJKbjEhg/4rMxzyMi5GnjwCbS2wyRPwKrFOCetZL6r4s+ZOmr
         g3UStai424EBe4ZiBtdrRVZPQmsdiPOib4qUsfn8rtK+XsuTHC41MF3spffp6Jyrqh0D
         1ZluudwYOLb6s9KPMJMX0TtPpiudQDXLd2ntbekcxJLInpgP+XhTWlbm6x6ijy10Kb57
         /RGfxJjbZ9CdwCH+HDujQPkMFKU5Zd8cBEE2jY29965RvAPkXFbqTPQKmzOZ0MfbI/FZ
         kn1Q==
X-Forwarded-Encrypted: i=1; AFNElJ88avTzmkF8ydj5dmu+UQ2LS7oxYqITTCPzSvWTRHgu/ztn0IOpfBRrYPY6c16dIhSrZhrjlgSXkFzwiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2H2gapb7e6HR6krViwElc44aaDK0ePEW+Yw1vEmn+ZDsS1ckR
	7ahkPRYHhTsWNS/DJ1i8QTFoSv1RCoPbZIuJgV/BSMyn1j4ifb714jq5
X-Gm-Gg: AfdE7cmNWDOEjGO92hDIROQh0rByoVPmH1mXu5TLPTl74jqhhiwqbYOusfOKJsOKqpT
	vy0L3G0LY85Ru3NvnPScZ1aYyAUKOEJDNbJKLmiYPxZmrnUaR/e3ock2zjzf6l/BBSY4EKKdJTP
	/P/lkHucGqx1EP3Z0IU1tE8Tetz6cCEO7cznb/SHka9rut1grXqsEJr6inGhIzdYCy5as06HCEK
	/mJ6V9JPALtamgK+VJ1WKQ2LZxcaTs6icBW2yffYnp4/IvlyWzLqJ/D+shPzJLkBl93wpdlUgRe
	C6PotmDVWEGWrPv90VpXVXiajl1mXum9es0OzInYjvpVoze+/NYygEgCeBL5iqqbDVHrLIiYu16
	QcM6dI6fFQZaGlhiKYrgyJCddjn4VPQrVw/7d0/gOwMTdn0ynyIbIEI4pIT+Ra945FbUe/1vPVx
	WkR0SuB+062IA98mk0L/jgKguASK7/z1Tk/iqa29hGJ1Z5NzE=
X-Received: by 2002:a05:6a00:2e1d:b0:847:888f:9b0f with SMTP id d2e1a72fcca58-847e1806579mr2739982b3a.15.1783058137375;
        Thu, 02 Jul 2026 22:55:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:55:37 -0700 (PDT)
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
Subject: [PATCH v2 09/24] ASoC: codecs: aw88395: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:40 +0700
Message-ID: <20260703055355.244898-10-phucduc.bui@gmail.com>
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/aw88395/aw88395.c        | 24 ++++++--------
 sound/soc/codecs/aw88395/aw88395_device.c | 40 ++++++++---------------
 2 files changed, 24 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index ee0e8bd8c54c..e9ff2c79ac15 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -8,6 +8,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
@@ -51,9 +52,8 @@ static void aw88395_startup_work(struct work_struct *work)
 	struct aw88395 *aw88395 =
 		container_of(work, struct aw88395, start_work.work);
 
-	mutex_lock(&aw88395->lock);
+	guard(mutex)(&aw88395->lock);
 	aw88395_start_pa(aw88395);
-	mutex_unlock(&aw88395->lock);
 }
 
 static void aw88395_start(struct aw88395 *aw88395, bool sync_start)
@@ -224,11 +224,10 @@ static int aw88395_profile_set(struct snd_kcontrol *kcontrol,
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
 
@@ -237,8 +236,6 @@ static int aw88395_profile_set(struct snd_kcontrol *kcontrol,
 		aw88395_start(aw88395, AW88395_SYNC_START);
 	}
 
-	mutex_unlock(&aw88395->lock);
-
 	return 1;
 }
 
@@ -366,7 +363,7 @@ static int aw88395_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88395 *aw88395 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88395->lock);
+	guard(mutex)(&aw88395->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88395_start(aw88395, AW88395_ASYNC_START);
@@ -377,7 +374,6 @@ static int aw88395_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88395->lock);
 
 	return 0;
 }
@@ -495,12 +491,12 @@ static int aw88395_request_firmware_file(struct aw88395 *aw88395)
 
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
index 79c3135a4110..12d42d27560d 100644
--- a/sound/soc/codecs/aw88395/aw88395_device.c
+++ b/sound/soc/codecs/aw88395/aw88395_device.c
@@ -8,6 +8,7 @@
 // Author: Ben Yi <yijiangtao@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/i2c.h>
 #include <linux/minmax.h>
@@ -70,7 +71,7 @@ int aw_dev_dsp_write(struct aw_device *aw_dev,
 	u32 reg_value;
 	int ret;
 
-	mutex_lock(&aw_dev->dsp_lock);
+	guard(mutex)(&aw_dev->dsp_lock);
 	switch (data_type) {
 	case AW_DSP_16_DATA:
 		ret = aw_dev_dsp_write_16bit(aw_dev, dsp_addr, dsp_data);
@@ -93,7 +94,6 @@ int aw_dev_dsp_write(struct aw_device *aw_dev,
 	/* clear dsp chip select state*/
 	if (regmap_read(aw_dev->regmap, AW88395_ID_REG, &reg_value))
 		dev_err(aw_dev->dev, "%s fail to clear chip state. Err=%d\n", __func__, ret);
-	mutex_unlock(&aw_dev->dsp_lock);
 
 	return ret;
 }
@@ -156,7 +156,7 @@ int aw_dev_dsp_read(struct aw_device *aw_dev,
 	u32 reg_value;
 	int ret;
 
-	mutex_lock(&aw_dev->dsp_lock);
+	guard(mutex)(&aw_dev->dsp_lock);
 	switch (data_type) {
 	case AW_DSP_16_DATA:
 		ret = aw_dev_dsp_read_16bit(aw_dev, dsp_addr, dsp_data);
@@ -179,7 +179,6 @@ int aw_dev_dsp_read(struct aw_device *aw_dev,
 	/* clear dsp chip select state*/
 	if (regmap_read(aw_dev->regmap, AW88395_ID_REG, &reg_value))
 		dev_err(aw_dev->dev, "%s fail to clear chip state. Err=%d\n", __func__, ret);
-	mutex_unlock(&aw_dev->dsp_lock);
 
 	return ret;
 }
@@ -1110,42 +1109,36 @@ static int aw_dev_dsp_update_container(struct aw_device *aw_dev,
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
@@ -1231,14 +1224,14 @@ static int aw_dev_check_sram(struct aw_device *aw_dev)
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
@@ -1247,7 +1240,7 @@ static int aw_dev_check_sram(struct aw_device *aw_dev)
 	if (reg_val != AW88395_DSP_EVEN_NUM_BIT_TEST) {
 		dev_err(aw_dev->dev, "check reg 0x40 even bit failed, read[0x%x] != write[0x%x]",
 				reg_val, AW88395_DSP_EVEN_NUM_BIT_TEST);
-		goto error;
+		return -EPERM;
 	}
 
 	/* check dsp_fw_base_addr */
@@ -1256,7 +1249,7 @@ static int aw_dev_check_sram(struct aw_device *aw_dev)
 	if (reg_val != AW88395_DSP_EVEN_NUM_BIT_TEST) {
 		dev_err(aw_dev->dev, "check dsp fw addr failed, read[0x%x] != write[0x%x]",
 						reg_val, AW88395_DSP_EVEN_NUM_BIT_TEST);
-		goto error;
+		return -EPERM;
 	}
 
 	/* check dsp_cfg_base_addr */
@@ -1265,15 +1258,10 @@ static int aw_dev_check_sram(struct aw_device *aw_dev)
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

