Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67388477E4A
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692816; cv=none; b=Cy1CdgOlIgNd9F2SE4NWFl391uHqfXmdaFvEXDVmLa/KKRX4OsX608zddkrti9aUhtU/e2Cud5nGN/PeRFCVgIWDaqnrZu32Mc71bnwyhRDE8+8QJgvV/2YpHuxd3lK1eI7r5XIpTMXPPk07k7Wn/7w7ZZB3gE7fuo8FqJeMkrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692816; c=relaxed/simple;
	bh=HA70qQj+Tv7Z0n0QLohCr2gojqtmXaULBzIHTTYiHCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uovWQHqFbyfY0hX/RBEMeuLddlEK/41HcftGAxpmhjvE8D1giEGoGamq+LOqfhAURqrLoH5Y1tHsOB3T2JoTzUMMiHguiM04Zo+d9hm6iVXkgsrFON8ZazsQL4aAOFEU0Amem0uiHQhJsPgSFaeZM3MtWGggij+Ca4ph0asElME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fk286ZGQ; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fk286ZGQ"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-307d0405e07so8461948eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692815; x=1782297615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2Fk9ynsoms6SbafZDmk8Pz5BAewC5p9SQQnIzzSYps=;
        b=Fk286ZGQLxGlqkn35wgTPnG9zUPJAazag4QFXHWMWd7oJ7iTSPjTTSUbBV9bYRlcD4
         5DDVpiKtdobdowpUiXVfaF13H2vpdKaPnzYwEX9M4jf1uFN/WppcZcd7+pnLS1O/LUmP
         9MrUGkFq+01nodcSjcmheNe7tNn066ImYfPTDl5JPkTh9pZ72EL0OaBvrStIndtyOFbJ
         xTOwU9raHN3AVbOeTDopMlgPAWAeA5mTwbgY6CUEY1He0U1C51MJW47zx5KR8pytmWVT
         rrNMmz31irWBM6oNAQXLKJEzKflc0PiQfhvWgQuR5xqAbuTa/4S3B+s9bPptOOALoI3z
         Qzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692815; x=1782297615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C2Fk9ynsoms6SbafZDmk8Pz5BAewC5p9SQQnIzzSYps=;
        b=AEcrKwa61WZ4ZxHLnjV9p9oaxdDL5ZDzz1UpebRdo3ZYHowyBRi668pzoLueAQphou
         ve3Y7F1WPMe3fwDk7kU1tYQtoTInedlS4F3Ap9416JSqo9KrVdyBxOzSuiGXDZ+z/d9n
         YgPkjl5d33xdlPxZbgSNybY3a44m6gTbpzgkicteqJ8cREZxjtqatH678M8BqvTaUBZK
         1jPAHwfaaD2AIhb+llhBLGzLP1QnCcNhhE4nlbi232U7MRI+s8W/c0mk4oTru6xo27da
         SKRwa1A6+Gbxbj7l+fX3C2ykhhFsq3hVC2aC6kZC/xp6Lx+5aG3/34/DjjZZzlJosLZO
         QBJg==
X-Forwarded-Encrypted: i=1; AFNElJ/zktFPpf06bAdbCwqBz4QJa3LKWL6+paz653NT79TT2rkqn9jD67A+H/qfwZhyA5EtEid/o0Tv366BFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+TzCaHfbBN/6tJ2dltrx0YO6avXRPrLuZXmIwOAFH48D0FwlU
	gS7eDb/utefByD7hRjEiMJVCo/bsM+BAsQAKJV3I9Mrv/CeCFDoNGLm9
X-Gm-Gg: AfdE7cnEchIoaezOVc5mnS+XdjqgNyQP3efM3ln8EDXcXVHhCSmfknrMquOmgz2qNBv
	VZbbisKKLMC1ztBapSvqQJ5fiK3NXLKx/lo8GdkbDUg0m56JgVLQGplQ6LGmJY7f+nU5sVo3vwu
	AFNNb8nI5htrjSfO4gRdnidtsBLTx1XZEtooaVEOvgMsY//Rf1NejfMiwAJa7YqNmfHOAki2Mj7
	Cvxpnuf5cgF3YZVrvNHzzlFFpKUoFMa3Ch8II8z981Xp7MF+BBIzYec/auE7AKc7EeFM+5UsggM
	/jCgNnhqEsos9sVZWyeXrwg17oN/IFmDQZ5Np0SYRWIHLgIHQZV+aHdPquWW1jSB/25fIXk10Wx
	SZB7HRVFIhNx5O28a3qCuD9k9X+Hgq6Y+MPyp5LdE/2a6C46DYU5TmLupzmEe0IDJmvEAqL6DLs
	FMrlZT2Hju06Jg/DZbX4Ea3PpXHpPUaGRRKIr/oe/B6VSXFtE=
X-Received: by 2002:a05:7301:5f8b:b0:2ce:25be:c8e8 with SMTP id 5a478bee46e88-30bca0ab35amr1737019eec.17.1781692814574;
        Wed, 17 Jun 2026 03:40:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:14 -0700 (PDT)
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
Subject: [PATCH 46/78] ASoC: codecs: rt5682: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:03 +0700
Message-ID: <20260617103235.449609-47-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5682-sdw.c | 23 +++++++++++------------
 sound/soc/codecs/rt5682.c     |  4 +---
 sound/soc/codecs/rt5682s.c    | 16 ++++------------
 3 files changed, 16 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index ec2a35a0cacd..2b23c84cf203 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -660,12 +660,11 @@ static int rt5682_interrupt_callback(struct sdw_slave *slave,
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
@@ -736,11 +735,11 @@ static int rt5682_dev_system_suspend(struct device *dev)
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
@@ -760,12 +759,12 @@ static int rt5682_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt5682->disable_irq_lock);
-		if (rt5682->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
-			rt5682->disable_irq = false;
+		scoped_guard(mutex, &rt5682->disable_irq_lock) {
+			if (rt5682->disable_irq == true) {
+				sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
+				rt5682->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt5682->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT5682_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 4b82e07d3b2c..7a7dd99777c7 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -3125,7 +3125,7 @@ void rt5682_calibrate(struct rt5682_priv *rt5682)
 {
 	int value, count;
 
-	mutex_lock(&rt5682->calibrate_mutex);
+	guard(mutex)(&rt5682->calibrate_mutex);
 
 	rt5682_reset(rt5682);
 	regmap_write(rt5682->regmap, RT5682_I2C_CTRL, 0x000f);
@@ -3175,8 +3175,6 @@ void rt5682_calibrate(struct rt5682_priv *rt5682)
 		regmap_write(rt5682->regmap, RT5682_CALIB_ADC_CTRL, 0x2005);
 	regmap_write(rt5682->regmap, RT5682_STO1_ADC_MIXER, 0xc0c4);
 	regmap_write(rt5682->regmap, RT5682_CAL_REC, 0x0c0c);
-
-	mutex_unlock(&rt5682->calibrate_mutex);
 }
 EXPORT_SYMBOL_GPL(rt5682_calibrate);
 
diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 3624067950c0..4510f59f68fb 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -648,7 +648,7 @@ static void rt5682s_sar_power_mode(struct snd_soc_component *component, int mode
 {
 	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5682s->sar_mutex);
+	guard(mutex)(&rt5682s->sar_mutex);
 
 	switch (mode) {
 	case SAR_PWR_SAVING:
@@ -695,8 +695,6 @@ static void rt5682s_sar_power_mode(struct snd_soc_component *component, int mode
 		dev_err(component->dev, "Invalid SAR Power mode: %d\n", mode);
 		break;
 	}
-
-	mutex_unlock(&rt5682s->sar_mutex);
 }
 
 static void rt5682s_enable_push_button_irq(struct snd_soc_component *component)
@@ -2534,7 +2532,7 @@ static int rt5682s_wclk_prepare(struct clk_hw *hw)
 	if (!rt5682s_clk_check(rt5682s))
 		return -EINVAL;
 
-	mutex_lock(&rt5682s->wclk_mutex);
+	guard(mutex)(&rt5682s->wclk_mutex);
 
 	snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_1,
 		RT5682S_PWR_VREF2 | RT5682S_PWR_FV2 | RT5682S_PWR_MB,
@@ -2556,8 +2554,6 @@ static int rt5682s_wclk_prepare(struct clk_hw *hw)
 
 	rt5682s->wclk_enabled = 1;
 
-	mutex_unlock(&rt5682s->wclk_mutex);
-
 	return 0;
 }
 
@@ -2570,7 +2566,7 @@ static void rt5682s_wclk_unprepare(struct clk_hw *hw)
 	if (!rt5682s_clk_check(rt5682s))
 		return;
 
-	mutex_lock(&rt5682s->wclk_mutex);
+	guard(mutex)(&rt5682s->wclk_mutex);
 
 	if (!rt5682s->jack_type)
 		snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_1,
@@ -2585,8 +2581,6 @@ static void rt5682s_wclk_unprepare(struct clk_hw *hw)
 	rt5682s_set_pllb_power(rt5682s, 0);
 
 	rt5682s->wclk_enabled = 0;
-
-	mutex_unlock(&rt5682s->wclk_mutex);
 }
 
 static unsigned long rt5682s_wclk_recalc_rate(struct clk_hw *hw,
@@ -2997,7 +2991,7 @@ static void rt5682s_calibrate(struct rt5682s_priv *rt5682s)
 {
 	unsigned int count, value;
 
-	mutex_lock(&rt5682s->calibrate_mutex);
+	guard(mutex)(&rt5682s->calibrate_mutex);
 
 	regmap_write(rt5682s->regmap, RT5682S_PWR_ANLG_1, 0xaa80);
 	usleep_range(15000, 20000);
@@ -3034,8 +3028,6 @@ static void rt5682s_calibrate(struct rt5682s_priv *rt5682s)
 	regmap_write(rt5682s->regmap, RT5682S_PWR_DIG_1, 0x00c0);
 	regmap_write(rt5682s->regmap, RT5682S_PWR_ANLG_1, 0x0800);
 	regmap_write(rt5682s->regmap, RT5682S_GLB_CLK, 0x0000);
-
-	mutex_unlock(&rt5682s->calibrate_mutex);
 }
 
 static const struct regmap_config rt5682s_regmap = {
-- 
2.43.0

