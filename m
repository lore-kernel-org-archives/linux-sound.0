Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B69D4C6F11
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 10:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629756; cv=none; b=L5fLZ0C4/Zk6YmJWTxbBgNO0hjTEn0GdhlikmamYHv/ZNOPol8kaD3AD/1Ef6opFe1jICkjMa9E/PEr37WIdQPLMYF8hW0ewp4S61LnKDHcdKCHUtUyrQg/lpnccTXCpe7ez4NxuMA1z/CJ4elzAF8OTDPh7HDrQ7kfk/KJif9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629756; c=relaxed/simple;
	bh=0HoS8QVPDkGqO7CysXmjtYOGMj5wvDPkMohirElqvTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JgbsBMWzNCDBsVMRsN2wyUS0IbfxZe8iKND4NMK9Qv9uRkhfSsJpzYh3TUoANsSQVs5zjkFVBglTTFXV8McMv7qx0K0fn6BfPAJE/AcBEVOrnK8ZsPUNXTzNfDDnTXIwTmCypUuxdziKZdgkh6VuBINjE93Zqi5SN6rGz0oGRG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlmupHvI; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlmupHvI"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cad8076b01so133743855ad.2
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 03:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629754; x=1785234554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mvzr5WqUP+xfZMOQpcHFjM6syFUqmR7b1PQz8S5tijE=;
        b=SlmupHvIqDtjv+/nbNZnVqvYXs4ZNLYtqE6twlDprujlCnsuaI3G2Ui0pK0P3nsayw
         RURRYbhQzz3qvQtUDylfeD8Z3G3KhiknEnFN1xj/DHiNTaUI1Lz2SMup+H3yaMgnohCW
         iRNUiGdusD41E4vcGpxbCYjs+7O/oGPrco54s0kb9q1guWkSdWbMw7KO6QjHWTrf67ZX
         QOMXsaIUfHZrWFBbE5GUqujA3awLMgRAS3pCcufBEoIKMHIaG6ukAOwDXkUsE8SrssPI
         AGamdrEIEvLMhuU0sLeaZbRxscz7NSbjlH8oitlIgyeUMkQYy7hcYRTZCR0tTeer166j
         vKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629754; x=1785234554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mvzr5WqUP+xfZMOQpcHFjM6syFUqmR7b1PQz8S5tijE=;
        b=HmkriWa6T1SzBk+vzNmfhntApqc/q1VdKP998gjfGahcQ3MHe21J42CIgxmgdWqQNQ
         f3vnAdA89ND5wWZqpRrzbGAZpuNIaI9vEdaqG0dDfvPxMeF6SrY1sAJQMy2TChIUKbjF
         g+MluWrbzEG1SxV24lFqo1M3VWyxeCgkx3hFPIA1nY236OOlt27tXMgkFycRW24riV6T
         xXWsubtJ1zroF/lnr/EPxyaU/XxN4/mK66xsiklur0jdP197L2oVl9Sl1OGPe/55DmT6
         WJhEfWfyzKw+kpg1fguwtHir68bSCPCLHlroHbbD2JxoijONo3kheGJw31oBAdM+eW/u
         F+ag==
X-Forwarded-Encrypted: i=1; AHgh+Rq+ZmqfNkhvHdHxTlkSw7VyXHQDZ+bHtNxFJndVbeKa0aUe8oZTpE8xZ6ejB72ECnC4pQIdgrR2G6bSqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRaBAmaLXvPDSfPbXq6jBitjSucHUrBNDqupcUan4Novg3B/8c
	0fvondPOmyNhLAXJLeHSPEhe3fjT3k+5M+G2+6RltBvDdEG+h0MIQ8KT
X-Gm-Gg: AR+sD122xA0pK3ot0aUNQ9Ag3jIOHl8x41EUYuw2mCA6YXkQSKQFkGOn13adv3rD9mR
	vKmlCvOcXNnSEeDCqyR7UliLE+37QunsGbFKy15e08octE/fXzmwYQt6qaPMtozCNyIyl8uI2VQ
	R7rfyGU6WZVWCh43UmcAsP44tbu5SkvmQ3Cp3RA8KVaz88IH1K3BCSEYOlglcUWPxZquFqpmUKt
	uUZUYTcZ84HhparVlyMjbSGU7+9b505+rcGUCnTH929OaY7q9mKYFuk/Tr/AnBP8yMuiZNUXChc
	HCBk4jcfuqmjr7aVtlnie/D/j2F1K0mq06xfICjmfg8Rmk/pipAlcJKfJS9zlRQINyZS7YHhDwK
	c9czl8mNPW847WdBM3KLKPg1StGpTNI0I8YsiUm//qnXCOxw4i45rZZHOyvhYTqTTdz924Y475x
	KDgaQ8tvOc31MVUEjYrEM2dWG8M3osUsrcdAWM
X-Received: by 2002:a17:903:988:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2cf34821a87mr207396435ad.10.1784629754494;
        Tue, 21 Jul 2026 03:29:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:29:14 -0700 (PDT)
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
Subject: [PATCH v4 22/29] ASoC: codecs: rt5682: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:53 +0700
Message-ID: <20260721102600.523199-23-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
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
index e49ec28b6103..23c7d2a9dbee 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -6,6 +6,7 @@
 // Author: Oder Chiou <oder_chiou@realtek.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -670,12 +671,11 @@ static int rt5682_interrupt_callback(struct sdw_slave *slave,
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
@@ -746,11 +746,11 @@ static int rt5682_dev_system_suspend(struct device *dev)
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
@@ -770,12 +770,12 @@ static int rt5682_dev_resume(struct device *dev)
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

