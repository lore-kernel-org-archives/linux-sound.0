Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62CD4279F5
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692834; cv=none; b=Y0vNGjinRpsRzBYe8OeVpgoxrPFGn53E2+Oz4+D5P+KW2/C+hGUiqFDJiPwoMXSOlQJuhWWyBUUQsXpFXgaNImg2xIAlBef8KP8CKZDSZy423xUrhgPgAdGBQP5Qiz0HYid3vgxh0V3iV+LB2jn1OUgd14COFBCQoZwXJr8uNVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692834; c=relaxed/simple;
	bh=9K7Wn9sctZkVTwUAOOJQWTkfDpWZPvgaq5hF1ovj7YM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9Z19nXCEJQ/WT5Brr1NJehdDwxtzP6/xdZ7oYYAA1Vwpp/Xrp7kTDu7ENlaTYPrE7oiUH3bmFpSArMLg3ITC2o+mxFmDqGw5WmNRvXF7xnWTWCjc+HYqaekAJYXz3UfYCYNltPMoj8w+MNnQ4wykNAKY8Laykg6d5tfVXblKiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqcP/MV6; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqcP/MV6"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-13810b63a1aso12458574c88.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692832; x=1782297632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqjTEpvOFZF2j3RKEWHFL7cl6NP9aT2PlVk1AtH2OzM=;
        b=KqcP/MV6kRgpfPHYpAquMJ5wEq+42MLsjUejpNentSjSsJyM1MtyJAvykXOGUN5E0t
         fri7sbFAfpZCOv4aJryEccTn7t1Wey8dHnFboYM3qf/9Sc0ZJrnD2Ua8j2jILgskTAXe
         tTW68eOmuN9PeyyX7d3sEknIpsh00iB2G5AT094kUWHP0bpUlA/kINGhxx7+JK4JBZp9
         f9eccvy06xJwNSqDNtR1Btkd7tQ2U6lXP6ptTqxO9ydKMEgmmOO9dOY4wgL9FSnTido1
         EAoraU8B2y5fubp48elthZkoEw18kopjBTFw9sJdn5le2Q+Ji0Qd1m3h6mLE3SWQn2Lz
         XtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692832; x=1782297632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oqjTEpvOFZF2j3RKEWHFL7cl6NP9aT2PlVk1AtH2OzM=;
        b=Rk8GNPpUQt8X1hzghC+ZR+9e0LCXhtIle0DJUMTNj+CvWC7OQY6grHqfBMhYu3U0qu
         lcLQAitfLBcYq3/4Kaeql1M7H32mKONWiqrGwr/QJWp/dOSys8XUYtSjn+GaKeExuF3Q
         Rv5IPbUYKIw8m3FAKBaL/k+DGq7ZXOTal3rXqDcyysNhjk6v1ZULIG9iQhjCPCZNJlCF
         1YTuD7rww/wY6tQOsSBk4Nhzp7fQioqEBpPz8BKS4xVXnUigTJBKFKjYG4vkvacf5eC4
         8DnTnjUALdq1G+CH5t0NurYJEXopd5SPXn09wjfoPoDrCNW4ynr9lv8ec1UCAqFjuQv8
         UM1w==
X-Forwarded-Encrypted: i=1; AFNElJ8p9DBm4NXOK4PCqZpXmHF296viJe03sKYU72Ncip4apQG/9gFgEWv3CIsWMVyrp6OvCRxuyI0VqgH+gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOTFFmP8Ysiep5kOz9abOrdomuFAgzBkvD+B0GXEu4RN9HORZZ
	vIx4qOx9IexRwS1yaILjEkWOLh3FDrKAGiDR42FanlqYn7PtEHzvf08d0rdIbw==
X-Gm-Gg: AfdE7clWLNi4lLeEW3Vb/6PZTUGN7fUn9ZfCRS5rmDiRczUaLzW+RyYGbocJlzjx+IL
	C/nEL7/7D0pzXeXEkRA+P+nFLgYqAxyOO6buiUmIuSqsyqpbEgDnl3uLrkGyGNgy8Kj2r0V/gIx
	RoSg4ejKOgjN0eNX0rXIWA0njg1itpK8PyVJD0ffsh2M7HiMLL7gJBD5ZgCY1cfsM6n5r2uYjLi
	dNQLnhAS6pbapjWBvCYzMMtjGLB+PBXMK90tJzbqm8TSHqV6ZrhBbSZlTdnMLJ84pvArdHvwtn/
	61xtP5ggCZlO3cVb+c+C8znq2x6ExrVEwGSo1oibP/4qficTMWmi2XzAJ9a85k/tvLLE04kRwVd
	nJNb2N6DECSI9p1CnjrhqsPzUBtjtR8iVc0LRwaEqPXHuB+14nqFiNJN0nGgIKWbBbXnXLaO3Af
	PNuYpelR5BSxr4CpbB8+XtGoBnoLNuQtCuSCyXuAcopurRrWGi61EuDEwqnQ==
X-Received: by 2002:a05:7300:f694:b0:304:8366:7456 with SMTP id 5a478bee46e88-30bc9cbd62dmr1978749eec.3.1781692831869;
        Wed, 17 Jun 2026 03:40:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:31 -0700 (PDT)
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
Subject: [PATCH 48/78] ASoC: codecs: rt711: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:05 +0700
Message-ID: <20260617103235.449609-49-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt711-sdca-sdw.c | 33 +++++++++++++++----------------
 sound/soc/codecs/rt711-sdca.c     |  7 ++-----
 sound/soc/codecs/rt711-sdw.c      | 23 +++++++++++----------
 sound/soc/codecs/rt711.c          | 19 ++++++++----------
 4 files changed, 37 insertions(+), 45 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index a8164fc3979a..3eb0b622a8ee 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -268,7 +268,7 @@ static int rt711_sdca_interrupt_callback(struct sdw_slave *slave,
 	 * scheme. We do want however to prevent new workqueues from being scheduled if
 	 * the disable_irq flag was set during system suspend.
 	 */
-	mutex_lock(&rt711->disable_irq_lock);
+	guard(mutex)(&rt711->disable_irq_lock);
 
 	ret = sdw_read_no_pm(rt711->slave, SDW_SCP_SDCA_INT1);
 	if (ret < 0)
@@ -332,12 +332,9 @@ static int rt711_sdca_interrupt_callback(struct sdw_slave *slave,
 		mod_delayed_work(system_power_efficient_wq,
 			&rt711->jack_detect_work, msecs_to_jiffies(30));
 
-	mutex_unlock(&rt711->disable_irq_lock);
-
 	return 0;
 
 io_error:
-	mutex_unlock(&rt711->disable_irq_lock);
 	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
 	return ret;
 }
@@ -416,13 +413,13 @@ static int rt711_sdca_dev_system_suspend(struct device *dev)
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
@@ -444,13 +441,15 @@ static int rt711_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt711->disable_irq_lock);
-		if (rt711->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt711->disable_irq = false;
+		scoped_guard(mutex, &rt711->disable_irq_lock) {
+			if (rt711->disable_irq == true) {
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
index 3a26c782d800..906746a5fe69 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -107,7 +107,7 @@ static int rt711_sdca_calibration(struct rt711_sdca_priv *rt711)
 	int chk_cnt = 100;
 	int ret = 0;
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 	dev = regmap_get_device(regmap);
 
 	regmap_read(rt711->regmap, RT711_RC_CAL_STATUS, &val);
@@ -178,7 +178,6 @@ static int rt711_sdca_calibration(struct rt711_sdca_priv *rt711)
 	rt711_sdca_index_write(rt711, RT711_VENDOR_REG,
 		RT711_DIGITAL_MISC_CTRL4, 0x201b);
 
-	mutex_unlock(&rt711->calibrate_mutex);
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
 }
@@ -450,7 +449,7 @@ static void rt711_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt711_sdca_jack_init(struct rt711_sdca_priv *rt711)
 {
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 
 	if (rt711->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -515,8 +514,6 @@ static void rt711_sdca_jack_init(struct rt711_sdca_priv *rt711)
 
 		dev_dbg(&rt711->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt711->calibrate_mutex);
 }
 
 static int rt711_sdca_set_jack_detect(struct snd_soc_component *component,
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index df3c43f2ab6b..9d5dff34de25 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -423,12 +423,11 @@ static int rt711_interrupt_callback(struct sdw_slave *slave,
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
@@ -510,11 +509,11 @@ static int rt711_dev_system_suspend(struct device *dev)
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
@@ -536,12 +535,12 @@ static int rt711_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt711->disable_irq_lock);
-		if (rt711->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
-			rt711->disable_irq = false;
+		scoped_guard(mutex, &rt711->disable_irq_lock) {
+			if (rt711->disable_irq == true) {
+				sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
+				rt711->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt711->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT711_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 5dbe9b67703e..5bc25663be09 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -89,7 +89,7 @@ static int rt711_calibration(struct rt711_priv *rt711)
 	struct regmap *regmap = rt711->regmap;
 	int ret = 0;
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 	regmap_write(rt711->regmap,
 		RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
 
@@ -128,7 +128,6 @@ static int rt711_calibration(struct rt711_priv *rt711)
 
 	regmap_write(rt711->regmap,
 		RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
-	mutex_unlock(&rt711->calibrate_mutex);
 
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
@@ -362,7 +361,7 @@ static void rt711_jack_init(struct rt711_priv *rt711)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(rt711->component);
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 	/* power on */
 	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt711->regmap,
@@ -450,7 +449,6 @@ static void rt711_jack_init(struct rt711_priv *rt711)
 	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt711->regmap,
 			RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
-	mutex_unlock(&rt711->calibrate_mutex);
 }
 
 static int rt711_set_jack_detect(struct snd_soc_component *component,
@@ -511,7 +509,7 @@ static int rt711_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 	unsigned int read_ll, read_rl;
 	int i;
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 
 	/* Can't use update bit function, so read the original value first */
 	addr_h = mc->reg;
@@ -599,7 +597,6 @@ static int rt711_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 		regmap_write(rt711->regmap,
 				RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 
-	mutex_unlock(&rt711->calibrate_mutex);
 	return 0;
 }
 
@@ -908,11 +905,11 @@ static int rt711_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		mutex_lock(&rt711->calibrate_mutex);
-		regmap_write(rt711->regmap,
-			RT711_SET_AUDIO_POWER_STATE,
-			AC_PWRST_D3);
-		mutex_unlock(&rt711->calibrate_mutex);
+		scoped_guard(mutex, &rt711->calibrate_mutex) {
+			regmap_write(rt711->regmap,
+				RT711_SET_AUDIO_POWER_STATE,
+				AC_PWRST_D3);
+		}
 		break;
 
 	default:
-- 
2.43.0

