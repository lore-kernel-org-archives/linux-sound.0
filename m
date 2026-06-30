Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BCE3E8688
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801521; cv=none; b=DpAdDAjUaeQ6jPOVVLKj8JFxPBJWNeGtxK19P9nLDoYJVSo2JqGhlef9EoSDExsChw6NFL2ZzH7p1yCX0eus9nCC7zGdo7s34NA0Zhx90PqaYb1wRcUrADaGEj3ATdr2qSNbB6NOC4CgktkKcixM90X8RGTWqJ9fZdCAIAQTyrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801521; c=relaxed/simple;
	bh=b6bXhDV0xAT62Sv/xuA4dAXzeoy8Q1sAavmTbjIAcBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y+6yh3RKCivuOoZK5SE0FcAjA0+x/lNzehhUnV9VCL7I3S4/i+6U0L1Hc/6kdM47xH+TFUQx+ckxsdYCFM0e2zVcmU2l2k24/AXN2s/rKn5k+GY2+xQnWSxaSKfPBU1OUz6Fhg/72hL5/zu+XeqRaLcO6nPxssBLSDXQ2OdS1FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tOrRRyGU; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tOrRRyGU"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8479f1a86ecso352312b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801512; x=1783406312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDRsvel3aOe6HXXq16gFA8Smd1MpsNxMXFE75/1K/lk=;
        b=tOrRRyGUQQk1oZ1vdgeuUIGdeIPOzHdAXilEspXahNGskoyT/ImbjZSNf9GVFVkkou
         CJwXSYfMGlZ8RJoAGQDkzrNylqf3ego3H9QYTcr3rudWEAdNmk27aMPlW9OxxkfGSRen
         lIi278Sb+nUeQLyuGGt1PG/f8TYoyMTmiz3EVcSVN0941X3/Gbk+6PRCYRKxFN5RgMif
         eMXCA1LkPczYQf8aWjUwwsSk997Qw86W3GsY8t/pb40kPAg2q7cx0ywTBBAYPPHzJqiq
         c+6yELV3xOwsilt5EwawH6WVzUpoV3FEEuPHL8KdeUfBvFhWrQiZjrdo9M7fVpfQ9Wbf
         +xXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801512; x=1783406312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oDRsvel3aOe6HXXq16gFA8Smd1MpsNxMXFE75/1K/lk=;
        b=eB6o8rsbW7dXjtC78O7dU/ALBXCQybt9f/7REYKhnEzgUOjr4OlE9MM7RmNfz+GsVh
         /Zmjuk7gxS4w0Frh+Er3o1pwq7f/trd1l2ozyjabh/Li6CEDuMg1u9/EcVcdnC87V7/T
         CiNMnLGZTlUPdamm5tgEuCD42PjHFRqqFg6P2XsgKGpJiEi0u1toSSl8VPV9lvF2sLQi
         nJWjITo7411hUULT6ejpILz34WusYXdFKDNxtAHFWNxBOkCJkkDqUKhJvnGZrqmZ6xJ4
         dEd5xDWJQ2fAIvBl7lO1MRcxqr69bo6srFEWYaRAsy1jtcWHRrZQJaxappwjuvKZikcY
         Zxew==
X-Forwarded-Encrypted: i=1; AHgh+Rqwmmku/GEwWJ2byUhWxKTwUs+xoflp2Ohw5lUjevZySCTI9U9Y7BmRSkSkp4UK3V8DjTL3ydmXFzlRgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiop8Ujul74u0pz4JAmFL45XBrnl0L1N0VkOgBCPvvJxlavR+Q
	Pht88POPnhbfjYFwJYJHluPup1dKaDH49rEDDksbOTuZGBLFTyQzd4yD
X-Gm-Gg: AfdE7cn4JjcyUsbypcKHhb6p4fZjuqletIga3pNVC+qoA1iiVMW3bjAUTK+Xh729z87
	RZpcbkVctGdp8XxXFFllL6aW8M6zlDtw7IZ3misJi80VxJGsheex1QYi/17G2Ies2Jsi8U0v/US
	CJ/t1SzsdIS0cITrHdCyXafTTCsxXkaCB8/nQDadhtEiMfRlMsUKOwuH4T5ry7yj3BMQ5YmR3e3
	gMDCOBqnADFKgmctETJIRp62DGbvK6eO8VBhCkS3YAkwKbRCie5XWXSRU3KWBbumZxem0kEg/GX
	lLOyNJG+bKrX5HphJmtMNPuNi9XO0ZuvhfbptWgZ1wp/jzJgaLivPQKJ/CyZYA7D2tSRfNnp6XF
	c+C3u4ASFEFFJON8QZfqWR7xuIq0cwaxK8bIiySoUabREZhfTHJ9Whq/Te1BUVpjWcP/V/l8P22
	H/m7rh6djdFgWcq6P8aDkCXKyyTaOOu2HicScmbHnOOVHCvXY1w32MozlFIg==
X-Received: by 2002:a05:6a00:909f:b0:845:dedd:89c6 with SMTP id d2e1a72fcca58-8479eed5f5dmr2029752b3a.18.1782801511771;
        Mon, 29 Jun 2026 23:38:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:38:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 24/27] ASoC: codecs: rt711: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:46 +0700
Message-ID: <20260630063449.503996-25-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt711-sdca-sdw.c | 30 ++++++++++----------
 sound/soc/codecs/rt711-sdca.c     |  8 ++----
 sound/soc/codecs/rt711-sdw.c      | 24 ++++++++--------
 sound/soc/codecs/rt711.c          | 46 +++++++++++++++----------------
 4 files changed, 53 insertions(+), 55 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index 461315844ba9..c8dfdec65e61 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
@@ -331,7 +332,6 @@ static int rt711_sdca_interrupt_callback(struct sdw_slave *slave,
 	if (status->sdca_cascade && !rt711->disable_irq)
 		mod_delayed_work(system_power_efficient_wq,
 			&rt711->jack_detect_work, msecs_to_jiffies(30));
-
 	mutex_unlock(&rt711->disable_irq_lock);
 
 	return 0;
@@ -416,13 +416,13 @@ static int rt711_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt711_sdca->disable_irq_lock);
-	rt711_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt711_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt711_sdca->disable_irq_lock) {
+		rt711_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -444,13 +444,15 @@ static int rt711_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt711->disable_irq_lock);
-		if (rt711->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt711->disable_irq = false;
+		scoped_guard(mutex, &rt711->disable_irq_lock) {
+			if (rt711->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt711->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt711->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT711_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 3a26c782d800..e93ad34fb545 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -107,7 +108,7 @@ static int rt711_sdca_calibration(struct rt711_sdca_priv *rt711)
 	int chk_cnt = 100;
 	int ret = 0;
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 	dev = regmap_get_device(regmap);
 
 	regmap_read(rt711->regmap, RT711_RC_CAL_STATUS, &val);
@@ -178,7 +179,6 @@ static int rt711_sdca_calibration(struct rt711_sdca_priv *rt711)
 	rt711_sdca_index_write(rt711, RT711_VENDOR_REG,
 		RT711_DIGITAL_MISC_CTRL4, 0x201b);
 
-	mutex_unlock(&rt711->calibrate_mutex);
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
 }
@@ -450,7 +450,7 @@ static void rt711_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt711_sdca_jack_init(struct rt711_sdca_priv *rt711)
 {
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 
 	if (rt711->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -515,8 +515,6 @@ static void rt711_sdca_jack_init(struct rt711_sdca_priv *rt711)
 
 		dev_dbg(&rt711->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt711->calibrate_mutex);
 }
 
 static int rt711_sdca_set_jack_detect(struct snd_soc_component *component,
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index df3c43f2ab6b..71a9a8761ab5 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
@@ -423,12 +424,11 @@ static int rt711_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt711->disable_irq_lock);
+	guard(mutex)(&rt711->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt711->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt711->jack_detect_work, msecs_to_jiffies(250));
 	}
-	mutex_unlock(&rt711->disable_irq_lock);
 
 	return 0;
 }
@@ -510,11 +510,11 @@ static int rt711_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt711->disable_irq_lock);
-	rt711->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt711->disable_irq_lock);
+	scoped_guard(mutex, &rt711->disable_irq_lock) {
+		rt711->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
@@ -536,12 +536,12 @@ static int rt711_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt711->disable_irq_lock);
-		if (rt711->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
-			rt711->disable_irq = false;
+		scoped_guard(mutex, &rt711->disable_irq_lock) {
+			if (rt711->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
+				rt711->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt711->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT711_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 5dbe9b67703e..5bdca5330ca4 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -89,9 +90,9 @@ static int rt711_calibration(struct rt711_priv *rt711)
 	struct regmap *regmap = rt711->regmap;
 	int ret = 0;
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 	regmap_write(rt711->regmap,
-		RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
+		     RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
 
 	dev = regmap_get_device(regmap);
 
@@ -101,12 +102,12 @@ static int rt711_calibration(struct rt711_priv *rt711)
 
 	/* trigger */
 	rt711_index_update_bits(regmap, RT711_VENDOR_CALI,
-		RT711_DAC_DC_CALI_CTL1, RT711_DAC_DC_CALI_TRIGGER,
-		RT711_DAC_DC_CALI_TRIGGER);
+				RT711_DAC_DC_CALI_CTL1, RT711_DAC_DC_CALI_TRIGGER,
+				RT711_DAC_DC_CALI_TRIGGER);
 
 	/* wait for calibration process */
 	rt711_index_read(regmap, RT711_VENDOR_CALI,
-		RT711_DAC_DC_CALI_CTL1, &val);
+			 RT711_DAC_DC_CALI_CTL1, &val);
 
 	while (val & RT711_DAC_DC_CALI_TRIGGER) {
 		if (loop >= 500) {
@@ -119,16 +120,15 @@ static int rt711_calibration(struct rt711_priv *rt711)
 
 		usleep_range(10000, 11000);
 		rt711_index_read(regmap, RT711_VENDOR_CALI,
-			RT711_DAC_DC_CALI_CTL1, &val);
+				 RT711_DAC_DC_CALI_CTL1, &val);
 	}
 
 	/* depop mode */
 	rt711_index_update_bits(regmap, RT711_VENDOR_REG,
-		RT711_FSM_CTL, 0xf, RT711_DEPOP_CTL);
+				RT711_FSM_CTL, 0xf, RT711_DEPOP_CTL);
 
 	regmap_write(rt711->regmap,
-		RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
-	mutex_unlock(&rt711->calibrate_mutex);
+		     RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
@@ -362,24 +362,24 @@ static void rt711_jack_init(struct rt711_priv *rt711)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(rt711->component);
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 	/* power on */
 	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt711->regmap,
-			RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
+			     RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
 
 	if (rt711->hs_jack) {
 		/* unsolicited response & IRQ control */
 		regmap_write(rt711->regmap,
-			RT711_SET_MIC2_UNSOLICITED_ENABLE, 0x82);
+			     RT711_SET_MIC2_UNSOLICITED_ENABLE, 0x82);
 		regmap_write(rt711->regmap,
-			RT711_SET_HP_UNSOLICITED_ENABLE, 0x81);
+			     RT711_SET_HP_UNSOLICITED_ENABLE, 0x81);
 		regmap_write(rt711->regmap,
-			RT711_SET_INLINE_UNSOLICITED_ENABLE, 0x83);
+			     RT711_SET_INLINE_UNSOLICITED_ENABLE, 0x83);
 		rt711_index_write(rt711->regmap, RT711_VENDOR_REG,
-			0x10, 0x2420);
+				  0x10, 0x2420);
 		rt711_index_write(rt711->regmap, RT711_VENDOR_REG,
-			0x19, 0x2e11);
+				  0x19, 0x2e11);
 
 		switch (rt711->jd_src) {
 		case RT711_JD1:
@@ -450,7 +450,6 @@ static void rt711_jack_init(struct rt711_priv *rt711)
 	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt711->regmap,
 			RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
-	mutex_unlock(&rt711->calibrate_mutex);
 }
 
 static int rt711_set_jack_detect(struct snd_soc_component *component,
@@ -511,7 +510,7 @@ static int rt711_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 	unsigned int read_ll, read_rl;
 	int i;
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 
 	/* Can't use update bit function, so read the original value first */
 	addr_h = mc->reg;
@@ -599,7 +598,6 @@ static int rt711_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 		regmap_write(rt711->regmap,
 				RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 
-	mutex_unlock(&rt711->calibrate_mutex);
 	return 0;
 }
 
@@ -908,11 +906,11 @@ static int rt711_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		mutex_lock(&rt711->calibrate_mutex);
-		regmap_write(rt711->regmap,
-			RT711_SET_AUDIO_POWER_STATE,
-			AC_PWRST_D3);
-		mutex_unlock(&rt711->calibrate_mutex);
+		scoped_guard(mutex, &rt711->calibrate_mutex) {
+			regmap_write(rt711->regmap,
+				     RT711_SET_AUDIO_POWER_STATE,
+				     AC_PWRST_D3);
+		}
 		break;
 
 	default:
-- 
2.43.0

