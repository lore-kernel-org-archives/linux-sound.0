Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B263E4C66
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801503; cv=none; b=g+gZGdZOfo/bPc667wpRdrQs//wrkqxKfIj9DVv8Nc0jymguJp5g4NibwZSpSXrqLwgUOshHUx7Glb0WFW0ppKTx+Ir8ja2NZr1Xv0c9GmMI6Ic1jtbiYfGpCLCPyR20/MT5qdldmGW0do/gBZGP3glvmWYVq2ib0FPR867IiAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801503; c=relaxed/simple;
	bh=3PzW41r3lCqq7WloY+qVpfi9ylriJQnkL1vsBK8sQMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Na000AmM8SWDp8SaQz7EtvzD6LZNdPDQwFoOeHN33faGanrxpmTzt/6wjah/wZd5nlZXvN7l8wvFY+IQUH4c6N9VwVs6SPTOk5dSs84eTi3+9N/blc0Vklu/p195r5LrK3Ou6px8JMF4h93dUYc2GoOVzwpz16knu+Jd0xE13no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=piTcwy5U; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="piTcwy5U"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-845c92bc464so2461972b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801495; x=1783406295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5I542Atg1yY1laQM/jnE851nD9DT4YIfrvz5OV73CCc=;
        b=piTcwy5UhK5q67EpzDV9q5LDAsypnZ7KVN8pecLV0SxPgT53C3VrgfLD51CbK/38IM
         Fg4O5RVGE71SYZgyNe+ugojykk13ccPN508Kasm5403ulyVI6JoSU5+I1rsXIVEsHAni
         iKbqmWEZacHHa8cYwwLmg746qjx10lMS5MQMiYtO4y5QgMPUMymkCcwNogbxfLnZ7zPj
         YGViaqDC4rfrsw7Az9m55oQ5usa8zWwJRw11D7xduSOY0dbvI+FXmsRYIbbh99fZMVnr
         ZSgBNhx3ZNvmW4ui8tCon4mQz+BLxhX+HZjcNxNriBJhqDu6q9FmgfOA6vxQ0m5ocyRn
         zIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801495; x=1783406295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5I542Atg1yY1laQM/jnE851nD9DT4YIfrvz5OV73CCc=;
        b=HP/PDAqx74NbbA9W7a+kUuSsu8G1Sz4D1iJXqERJqPA65EvXMp7BazEXrOOBGUrEhk
         51fJBRMYD9F2bOAD8kwYGK9WRXPdatIFRo79lyTs2TklGwojex9x3Y833FYQg7XaMQ9v
         pSLOv/Q365UmIVgyVaxlp3hfm+OYQCw/cJhQiW4KIwfqovQpU00s+tK+Ipzg0yVehzF8
         MRs8cIK8xEqWsRR/0nxJMumbYNVCR/WYCZTcwAvjV51GFkYlj3AAYol34lS8eXdZTdii
         xmBPmwNgvGgmiLAz4N+rrSvnZJWlg5fJB4HK+A7SHfnLNJWkUp0S2rzKUE6pa1+uf8dZ
         ZdXg==
X-Forwarded-Encrypted: i=1; AFNElJ//cYwl8fsEXJ7f4vq6F6toWL/WyvLH8R8bjvfos7O9eWI/uF3rOgGNuVlMvxNdt6hYH0Ylbw3odA2sOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbaMERVW1SDy4iSx73PXWXeU5XW+mnY3Smgu6cFr46zjZEVh8A
	9DIejvLSXDErzoEF0Y6TYe3wKquqZVeXPGksYgFYbdeAmU06BKVTTXJb
X-Gm-Gg: AfdE7cne8RNCazhwZLWkWycj8UgaJVGm+t/EfUosUljbkseB3jSXbZ6acuRCZggYxbe
	pxb0lzrOS6j8Z5jWtFJZ9fNEAypt0jpHQ1+Q2NQT/4+6D8EXSox5SE3h/k6PPWbr4gYMcOlobHp
	3IBfJCFVzsdAcxsViU6TUBwIuETmgcBw6sOQfH6S3XmtdNytsyhRbQrfDP/BuWpOEUnPlmT0ly4
	NaeHobJFLF/NmvUaMkX8ClvfnCX7mrI8wfp+zxoTaOjC+SCBnMiQe6kRwF3d/IKozqeTBaKNyRN
	D4EqB7BtIJI/ZEaJJtRYj2wnag3/fQm+n0C962NM3fNhaMWYHbyM0iZ03n+EOa9oe4wEBeqx3r3
	h9XIgqnuImmCrbunmXZ+2prbnt3X5hwALoWJMZstLoxL7SyL8oI23ckfS9TzVhMo1acZTDHJfOu
	1CdQAYWqudIC/FnpFZwPEwcXywYnZr0o8s0VYkNNq9sQuM4Rw=
X-Received: by 2002:a05:6a00:2191:b0:847:8dec:1427 with SMTP id d2e1a72fcca58-8479eed0d97mr1690509b3a.8.1782801495183;
        Mon, 29 Jun 2026 23:38:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:38:14 -0700 (PDT)
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
Subject: [PATCH 22/27] ASoC: codecs: rt5682: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:44 +0700
Message-ID: <20260630063449.503996-23-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5682-sdw.c | 24 ++++++++++++------------
 sound/soc/codecs/rt5682.c     |  5 ++---
 sound/soc/codecs/rt5682s.c    | 17 +++++------------
 3 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index dec8c2147d68..e7dc4f722fc1 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -6,6 +6,7 @@
 // Author: Oder Chiou <oder_chiou@realtek.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -660,12 +661,11 @@ static int rt5682_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt5682->disable_irq_lock);
+	guard(mutex)(&rt5682->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt5682->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt5682->jack_detect_work, msecs_to_jiffies(rt5682->irq_work_delay_time));
 	}
-	mutex_unlock(&rt5682->disable_irq_lock);
 
 	return 0;
 }
@@ -736,11 +736,11 @@ static int rt5682_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt5682->disable_irq_lock);
-	rt5682->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt5682->disable_irq_lock);
+	scoped_guard(mutex, &rt5682->disable_irq_lock) {
+		rt5682->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
@@ -760,12 +760,12 @@ static int rt5682_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt5682->disable_irq_lock);
-		if (rt5682->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
-			rt5682->disable_irq = false;
+		scoped_guard(mutex, &rt5682->disable_irq_lock) {
+			if (rt5682->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
+				rt5682->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt5682->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT5682_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 4b82e07d3b2c..6f7e68c20d13 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -6,6 +6,7 @@
 // Author: Bard Liao <bardliao@realtek.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -3125,7 +3126,7 @@ void rt5682_calibrate(struct rt5682_priv *rt5682)
 {
 	int value, count;
 
-	mutex_lock(&rt5682->calibrate_mutex);
+	guard(mutex)(&rt5682->calibrate_mutex);
 
 	rt5682_reset(rt5682);
 	regmap_write(rt5682->regmap, RT5682_I2C_CTRL, 0x000f);
@@ -3175,8 +3176,6 @@ void rt5682_calibrate(struct rt5682_priv *rt5682)
 		regmap_write(rt5682->regmap, RT5682_CALIB_ADC_CTRL, 0x2005);
 	regmap_write(rt5682->regmap, RT5682_STO1_ADC_MIXER, 0xc0c4);
 	regmap_write(rt5682->regmap, RT5682_CAL_REC, 0x0c0c);
-
-	mutex_unlock(&rt5682->calibrate_mutex);
 }
 EXPORT_SYMBOL_GPL(rt5682_calibrate);
 
diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 3624067950c0..34997cfb465b 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -6,6 +6,7 @@
 // Author: Derek Fang <derek.fang@realtek.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -648,7 +649,7 @@ static void rt5682s_sar_power_mode(struct snd_soc_component *component, int mode
 {
 	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5682s->sar_mutex);
+	guard(mutex)(&rt5682s->sar_mutex);
 
 	switch (mode) {
 	case SAR_PWR_SAVING:
@@ -695,8 +696,6 @@ static void rt5682s_sar_power_mode(struct snd_soc_component *component, int mode
 		dev_err(component->dev, "Invalid SAR Power mode: %d\n", mode);
 		break;
 	}
-
-	mutex_unlock(&rt5682s->sar_mutex);
 }
 
 static void rt5682s_enable_push_button_irq(struct snd_soc_component *component)
@@ -2534,7 +2533,7 @@ static int rt5682s_wclk_prepare(struct clk_hw *hw)
 	if (!rt5682s_clk_check(rt5682s))
 		return -EINVAL;
 
-	mutex_lock(&rt5682s->wclk_mutex);
+	guard(mutex)(&rt5682s->wclk_mutex);
 
 	snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_1,
 		RT5682S_PWR_VREF2 | RT5682S_PWR_FV2 | RT5682S_PWR_MB,
@@ -2556,8 +2555,6 @@ static int rt5682s_wclk_prepare(struct clk_hw *hw)
 
 	rt5682s->wclk_enabled = 1;
 
-	mutex_unlock(&rt5682s->wclk_mutex);
-
 	return 0;
 }
 
@@ -2570,7 +2567,7 @@ static void rt5682s_wclk_unprepare(struct clk_hw *hw)
 	if (!rt5682s_clk_check(rt5682s))
 		return;
 
-	mutex_lock(&rt5682s->wclk_mutex);
+	guard(mutex)(&rt5682s->wclk_mutex);
 
 	if (!rt5682s->jack_type)
 		snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_1,
@@ -2585,8 +2582,6 @@ static void rt5682s_wclk_unprepare(struct clk_hw *hw)
 	rt5682s_set_pllb_power(rt5682s, 0);
 
 	rt5682s->wclk_enabled = 0;
-
-	mutex_unlock(&rt5682s->wclk_mutex);
 }
 
 static unsigned long rt5682s_wclk_recalc_rate(struct clk_hw *hw,
@@ -2997,7 +2992,7 @@ static void rt5682s_calibrate(struct rt5682s_priv *rt5682s)
 {
 	unsigned int count, value;
 
-	mutex_lock(&rt5682s->calibrate_mutex);
+	guard(mutex)(&rt5682s->calibrate_mutex);
 
 	regmap_write(rt5682s->regmap, RT5682S_PWR_ANLG_1, 0xaa80);
 	usleep_range(15000, 20000);
@@ -3034,8 +3029,6 @@ static void rt5682s_calibrate(struct rt5682s_priv *rt5682s)
 	regmap_write(rt5682s->regmap, RT5682S_PWR_DIG_1, 0x00c0);
 	regmap_write(rt5682s->regmap, RT5682S_PWR_ANLG_1, 0x0800);
 	regmap_write(rt5682s->regmap, RT5682S_GLB_CLK, 0x0000);
-
-	mutex_unlock(&rt5682s->calibrate_mutex);
 }
 
 static const struct regmap_config rt5682s_regmap = {
-- 
2.43.0

