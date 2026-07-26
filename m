Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455F13783D5
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 01:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785027937; cv=none; b=DbRun0odcA5Qy5xqAl2GYiOXdBkOGa0pLkks8ySKaiKMtDD8zWXalizRJBe/aPDVZKWDChgWF9gg8ruD0Xpwl3Asg1cXZShxq4cyIjoSLtmh5F47WJfxKGoHd2Bd/2tiykb1qSZCt1BfhnOtTzckUbbC75gQu32gNwPLBNdBBfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785027937; c=relaxed/simple;
	bh=wQswL92YdMFn8ZulUUTihCyTNpa+Q/8rMfGBFYHYS5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=biv4N6zmSGsdujKH5aI4H/EiVvLKD+K1/Ljb43ZaJwZbFVjfb4rHaevWVHVlk+k5dmlaSFmpXSQD4fM6aBdGwyhzyQ1+zHNObFa05kSkVTf21TK/ibApCBkwq+O9Ya6yEEUHzQvKaIqKwveHBRpQeqUjSR7r1v77bni4+nNHkQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9qSkWup; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9qSkWup"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1628598a91.1
        for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 18:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785027934; x=1785632734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2JMcbiz3lJV7nNiw5tKXLIzqknsNcYzziwuQV2S3I7M=;
        b=i9qSkWupnZSAeIHbeEtWYMKUxJoC6rSy+bNjUqg3Q6iPKAKfBdr/nqLUTUSJGriC6Z
         pn8CdBHrexvcrCkwTXNbqS1l2THERuvL56qqBSS3gsk8C/0XENFOgbKjsLrWXAjWIDR8
         nVLll2tF9duXotHhFcnL7mtGfPkl75fEOtuYpDQ8QztjCdIEK387Gq5T5qnrDyRVlqOe
         QVD17xk3E0pV9S1Zky0nhOR4A5EZJ/qMVvANNb0+fb2AJqsK9mDh5hGEhbXq4ECIn7pU
         HTKZwHyJ3etKqs3d3KmQZbBVv4gdzXqz6lm1GlYGUE2BOgKuK2+25UBSc/mG18gBtkRs
         h7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785027934; x=1785632734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2JMcbiz3lJV7nNiw5tKXLIzqknsNcYzziwuQV2S3I7M=;
        b=H+WJe7lNagrJ5KFPzIMuSy3gVXrqox35/10h6Fl9fWORZwUyYutKOPg0gY8Rf27fgK
         Z6fJ2NXn5Ns1JLt3VKP5Kydd2uOJiWtrjlMeTB/ElJSVs+Q0PEc6B5FgBAt7oIYTT/P7
         vxRBNy1H+s4sf7/MB12LifhqyO7YhiFPlFuzHAcMxB6+nFrsG9O/QcMOICvWAn4oV/q6
         v+QgNaVitkegoL7Dg6396Vem937daeSwCLH0bJa0R7oTQXMH5BGajx4v5TAlxFC81BZ5
         eEbiCEhZDbcm4klevx/+fhaX+rw9pX+Dh9owGTY4gh9mqKj0aK1pow4+riGcXlhSCbT9
         qC3w==
X-Forwarded-Encrypted: i=1; AHgh+RpuNBbMOteN8AnxPMgrQ/KhDIi3XdIvCUWmv0ZFS2mvcjtTAaARL0ElibQ8EVdUjPLxlcfxiK8PpUSDNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB6PdNYK6xZgXPQTy4Ur5uxi4XKFdGGaOYSBgczaNZPKXXLMbf
	lW3jCLzlNr/Ewr8qTIDB3F53Ps0Vm99+D7p4dD1Vp2zffDjBq1iE+RAA
X-Gm-Gg: AR+sD128jFN7nHJZADuvkP1enytdv9HaAWNga35G7GTfGVriLoNDMrSzehdLYSUZDxq
	/I+W9cfArKOm+fQhwz/QkIZ4onxWem0eSGWrhGzpKel80CHf70KaJZ/mCeBZEnPN4vOgC4EE5YF
	bbtgkUYGoxfbqrinbcDwU8ENeF3XTS2UnDxX93RvJTrjCtoSR4fGtVwh+7IfED3Ky97loSmPt8J
	lSjxpV+gBImigFr/VVf/Tl0wbOJwrGhCnP5DmAtQtFM8/I/M/MC0vLbsXY/NE6aNZU3naNgWp2B
	ijukOV6T/R9ZpdUgsEVsemHhGpIzbR3R4OlgPxWiwsPCoFkfywqrB2yfXno9u+PCZpH3tc1kMb+
	CrYd0RGlzLd8zyr2mgDou0GB/2q/TM4J+BmslJraIb+6vLeVY2iHeFj+3wuNdK59vHOIDvdfd4i
	wg+XWIGEvMUo5DtWezaNDRdIVECSCjTTCayOoICkoaPu8p5YffLoCOaY4jgYByElh4Zg==
X-Received: by 2002:a17:90b:1fcc:b0:38d:858c:834d with SMTP id 98e67ed59e1d1-38f2950d327mr3284051a91.17.1785027934248;
        Sat, 25 Jul 2026 18:05:34 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e2c2:1f24:32d5:9d51])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e0f4a039asm11821445c88.9.2026.07.25.18.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 18:05:33 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] ASoC: tlv320aic32x4: clean up driver code formatting and logging
Date: Sat, 25 Jul 2026 18:05:17 -0700
Message-ID: <20260726010519.117805-7-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260726010519.117805-1-dmitry.torokhov@gmail.com>
References: <20260726010519.117805-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up coding style, SPDX comments, logging calls, and macro definitions
across the tlv320aic32x4 driver files:

- Convert SPDX comment blocks to // style in bus and clk drivers.
- Replace printk(KERN_ERR/DEBUG ...) calls with dev_err/dev_dbg.
- Replace msleep(10) with usleep_range(10000, 20000) in the clock driver.
- Parenthesize parameters in AIC32X4_REG macro.
- Clean up double blank lines and null pointer checks.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/tlv320aic32x4-clk.c |  68 ++++---
 sound/soc/codecs/tlv320aic32x4-i2c.c |   5 +-
 sound/soc/codecs/tlv320aic32x4-spi.c |   5 +-
 sound/soc/codecs/tlv320aic32x4.c     | 270 +++++++++++++--------------
 sound/soc/codecs/tlv320aic32x4.h     |   3 +-
 5 files changed, 163 insertions(+), 188 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv320aic32x4-clk.c
index 5c0a76a4a106..deed61650e09 100644
--- a/sound/soc/codecs/tlv320aic32x4-clk.c
+++ b/sound/soc/codecs/tlv320aic32x4-clk.c
@@ -1,5 +1,5 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
+// SPDX-License-Identifier: GPL-2.0
+/*
  * Clock Tree for the Texas Instruments TLV320AIC32x4
  *
  * Copyright 2019 Annaliese McDermond
@@ -9,6 +9,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
+#include <linux/delay.h>
 #include <linux/regmap.h>
 #include <linux/device.h>
 
@@ -57,7 +58,7 @@ static void clk_aic32x4_pll_unprepare(struct clk_hw *hw)
 	struct clk_aic32x4 *pll = to_clk_aic32x4(hw);
 
 	regmap_update_bits(pll->regmap, AIC32X4_PLLPR,
-				AIC32X4_PLLEN, 0);
+			   AIC32X4_PLLEN, 0);
 }
 
 static int clk_aic32x4_pll_is_prepared(struct clk_hw *hw)
@@ -75,7 +76,7 @@ static int clk_aic32x4_pll_is_prepared(struct clk_hw *hw)
 }
 
 static int clk_aic32x4_pll_get_muldiv(struct clk_aic32x4 *pll,
-			struct clk_aic32x4_pll_muldiv *settings)
+				      struct clk_aic32x4_pll_muldiv *settings)
 {
 	/*	Change to use regmap_bulk_read? */
 	unsigned int val;
@@ -106,19 +107,19 @@ static int clk_aic32x4_pll_get_muldiv(struct clk_aic32x4 *pll,
 }
 
 static int clk_aic32x4_pll_set_muldiv(struct clk_aic32x4 *pll,
-			struct clk_aic32x4_pll_muldiv *settings)
+				      struct clk_aic32x4_pll_muldiv *settings)
 {
 	int ret;
 	/*	Change to use regmap_bulk_write for some if not all? */
 
 	ret = regmap_update_bits(pll->regmap, AIC32X4_PLLPR,
-				AIC32X4_PLL_R_MASK, settings->r);
+				 AIC32X4_PLL_R_MASK, settings->r);
 	if (ret < 0)
 		return ret;
 
 	ret = regmap_update_bits(pll->regmap, AIC32X4_PLLPR,
-				AIC32X4_PLL_P_MASK,
-				settings->p << AIC32X4_PLL_P_SHIFT);
+				 AIC32X4_PLL_P_MASK,
+				 settings->p << AIC32X4_PLL_P_SHIFT);
 	if (ret < 0)
 		return ret;
 
@@ -136,23 +137,21 @@ static int clk_aic32x4_pll_set_muldiv(struct clk_aic32x4 *pll,
 	return 0;
 }
 
-static unsigned long clk_aic32x4_pll_calc_rate(
-			struct clk_aic32x4_pll_muldiv *settings,
-			unsigned long parent_rate)
+static unsigned long clk_aic32x4_pll_calc_rate(struct clk_aic32x4_pll_muldiv *settings,
+					       unsigned long parent_rate)
 {
 	u64 rate;
 	/*
 	 * We scale j by 10000 to account for the decimal part of P and divide
 	 * it back out later.
 	 */
-	rate = (u64) parent_rate * settings->r *
-				((settings->j * 10000) + settings->d);
+	rate = (u64)parent_rate * settings->r * ((settings->j * 10000) + settings->d);
 
-	return (unsigned long) DIV_ROUND_UP_ULL(rate, settings->p * 10000);
+	return (unsigned long)DIV_ROUND_UP_ULL(rate, settings->p * 10000);
 }
 
 static int clk_aic32x4_pll_calc_muldiv(struct clk_aic32x4_pll_muldiv *settings,
-			unsigned long rate, unsigned long parent_rate)
+				       unsigned long rate, unsigned long parent_rate)
 {
 	u64 multiplier;
 
@@ -165,14 +164,14 @@ static int clk_aic32x4_pll_calc_muldiv(struct clk_aic32x4_pll_muldiv *settings,
 	 * of the multiplier.	This is because we can't do floating point
 	 * math in the kernel.
 	 */
-	multiplier = (u64) rate * settings->p * 10000;
+	multiplier = (u64)rate * settings->p * 10000;
 	do_div(multiplier, parent_rate);
 
 	/*
 	 * J can't be over 64, so R can scale this.
 	 * R can't be greater than 4.
 	 */
-	settings->r = ((u32) multiplier / 640000) + 1;
+	settings->r = ((u32)multiplier / 640000) + 1;
 	if (settings->r > 4)
 		return -1;
 	do_div(multiplier, settings->r);
@@ -184,14 +183,14 @@ static int clk_aic32x4_pll_calc_muldiv(struct clk_aic32x4_pll_muldiv *settings,
 		return -1;
 
 	/* Figure out the integer part, J, and the fractional part, D. */
-	settings->j = (u32) multiplier / 10000;
-	settings->d = (u32) multiplier % 10000;
+	settings->j = (u32)multiplier / 10000;
+	settings->d = (u32)multiplier % 10000;
 
 	return 0;
 }
 
 static unsigned long clk_aic32x4_pll_recalc_rate(struct clk_hw *hw,
-			unsigned long parent_rate)
+						 unsigned long parent_rate)
 {
 	struct clk_aic32x4 *pll = to_clk_aic32x4(hw);
 	struct clk_aic32x4_pll_muldiv settings;
@@ -220,8 +219,8 @@ static int clk_aic32x4_pll_determine_rate(struct clk_hw *hw,
 }
 
 static int clk_aic32x4_pll_set_rate(struct clk_hw *hw,
-			unsigned long rate,
-			unsigned long parent_rate)
+				    unsigned long rate,
+				    unsigned long parent_rate)
 {
 	struct clk_aic32x4 *pll = to_clk_aic32x4(hw);
 	struct clk_aic32x4_pll_muldiv settings;
@@ -236,7 +235,7 @@ static int clk_aic32x4_pll_set_rate(struct clk_hw *hw,
 		return ret;
 
 	/* 10ms is the delay to wait before the clocks are stable */
-	msleep(10);
+	usleep_range(10000, 20000);
 
 	return 0;
 }
@@ -261,7 +260,6 @@ static u8 clk_aic32x4_pll_get_parent(struct clk_hw *hw)
 	return (val & AIC32X4_PLL_CLKIN_MASK) >> AIC32X4_PLL_CLKIN_SHIFT;
 }
 
-
 static const struct clk_ops aic32x4_pll_ops = {
 	.prepare = clk_aic32x4_pll_prepare,
 	.unprepare = clk_aic32x4_pll_unprepare,
@@ -311,11 +309,11 @@ static void clk_aic32x4_div_unprepare(struct clk_hw *hw)
 	struct clk_aic32x4 *div = to_clk_aic32x4(hw);
 
 	regmap_update_bits(div->regmap, div->reg,
-			AIC32X4_DIVEN, 0);
+			   AIC32X4_DIVEN, 0);
 }
 
 static int clk_aic32x4_div_set_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long parent_rate)
+				    unsigned long parent_rate)
 {
 	struct clk_aic32x4 *div = to_clk_aic32x4(hw);
 	u8 divisor;
@@ -342,7 +340,7 @@ static int clk_aic32x4_div_determine_rate(struct clk_hw *hw,
 }
 
 static unsigned long clk_aic32x4_div_recalc_rate(struct clk_hw *hw,
-						unsigned long parent_rate)
+						 unsigned long parent_rate)
 {
 	struct clk_aic32x4 *div = to_clk_aic32x4(hw);
 	unsigned int val;
@@ -399,7 +397,7 @@ static struct aic32x4_clkdesc aic32x4_clkdesc_array[] = {
 	{
 		.name = "pll",
 		.parent_names =
-			(const char* []) { "mclk", "bclk", "gpio", "din" },
+			(const char *[]) { "mclk", "bclk", "gpio", "din" },
 		.num_parents = 4,
 		.ops = &aic32x4_pll_ops,
 		.reg = 0,
@@ -414,28 +412,28 @@ static struct aic32x4_clkdesc aic32x4_clkdesc_array[] = {
 	},
 	{
 		.name = "ndac",
-		.parent_names = (const char * []) { "codec_clkin" },
+		.parent_names = (const char *[]) { "codec_clkin" },
 		.num_parents = 1,
 		.ops = &aic32x4_div_ops,
 		.reg = AIC32X4_NDAC,
 	},
 	{
 		.name = "mdac",
-		.parent_names = (const char * []) { "ndac" },
+		.parent_names = (const char *[]) { "ndac" },
 		.num_parents = 1,
 		.ops = &aic32x4_div_ops,
 		.reg = AIC32X4_MDAC,
 	},
 	{
 		.name = "nadc",
-		.parent_names = (const char * []) { "codec_clkin" },
+		.parent_names = (const char *[]) { "codec_clkin" },
 		.num_parents = 1,
 		.ops = &aic32x4_div_ops,
 		.reg = AIC32X4_NADC,
 	},
 	{
 		.name = "madc",
-		.parent_names = (const char * []) { "nadc" },
+		.parent_names = (const char *[]) { "nadc" },
 		.num_parents = 1,
 		.ops = &aic32x4_div_ops,
 		.reg = AIC32X4_MADC,
@@ -451,7 +449,7 @@ static struct aic32x4_clkdesc aic32x4_clkdesc_array[] = {
 };
 
 static struct clk *aic32x4_register_clk(struct device *dev,
-			struct aic32x4_clkdesc *desc)
+					struct aic32x4_clkdesc *desc)
 {
 	struct clk_init_data init;
 	struct clk_aic32x4 *priv;
@@ -464,8 +462,8 @@ static struct clk *aic32x4_register_clk(struct device *dev,
 	init.flags = 0;
 
 	priv = devm_kzalloc(dev, sizeof(struct clk_aic32x4), GFP_KERNEL);
-	if (priv == NULL)
-		return (struct clk *) -ENOMEM;
+	if (!priv)
+		return ERR_PTR(-ENOMEM);
 
 	priv->dev = dev;
 	priv->hw.init = &init;
diff --git a/sound/soc/codecs/tlv320aic32x4-i2c.c b/sound/soc/codecs/tlv320aic32x4-i2c.c
index e031eaaa2f7f..cbbb8ff3ee38 100644
--- a/sound/soc/codecs/tlv320aic32x4-i2c.c
+++ b/sound/soc/codecs/tlv320aic32x4-i2c.c
@@ -1,11 +1,10 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
+// SPDX-License-Identifier: GPL-2.0
+/*
  * Copyright 2011-2019 NW Digital Radio
  *
  * Author: Annaliese McDermond <nh6z@nh6z.net>
  *
  * Based on sound/soc/codecs/wm8974 and TI driver for kernel 2.6.27.
- *
  */
 
 #include <linux/i2c.h>
diff --git a/sound/soc/codecs/tlv320aic32x4-spi.c b/sound/soc/codecs/tlv320aic32x4-spi.c
index 4f842260e325..cb615b2e4f02 100644
--- a/sound/soc/codecs/tlv320aic32x4-spi.c
+++ b/sound/soc/codecs/tlv320aic32x4-spi.c
@@ -1,11 +1,10 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
+// SPDX-License-Identifier: GPL-2.0
+/*
  * Copyright 2011-2019 NW Digital Radio
  *
  * Author: Annaliese McDermond <nh6z@nh6z.net>
  *
  * Based on sound/soc/codecs/wm8974 and TI driver for kernel 2.6.27.
- *
  */
 
 #include <linux/spi/spi.h>
diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 8d3f2d5c6128..9e0e4aa2b09c 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -1,7 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * linux/sound/soc/codecs/tlv320aic32x4.c
- *
  * Copyright 2011 Vista Silicon S.L.
  *
  * Author: Javier Martin <javier.martin@vista-silicon.com>
@@ -75,7 +73,7 @@ static int aic32x4_reset_adc(struct snd_soc_dapm_widget *w,
 };
 
 static int mic_bias_event(struct snd_soc_dapm_widget *w,
-	struct snd_kcontrol *kcontrol, int event)
+			  struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 
@@ -83,25 +81,23 @@ static int mic_bias_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMU:
 		/* Change Mic Bias Registor */
 		snd_soc_component_update_bits(component, AIC32X4_MICBIAS,
-				AIC32x4_MICBIAS_MASK,
-				AIC32X4_MICBIAS_LDOIN |
-				AIC32X4_MICBIAS_2075V);
-		printk(KERN_DEBUG "%s: Mic Bias will be turned ON\n", __func__);
+					      AIC32x4_MICBIAS_MASK,
+					      AIC32X4_MICBIAS_LDOIN |
+							AIC32X4_MICBIAS_2075V);
+		dev_dbg(component->dev, "Mic Bias will be turned ON\n");
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		snd_soc_component_update_bits(component, AIC32X4_MICBIAS,
-				AIC32x4_MICBIAS_MASK, 0);
-		printk(KERN_DEBUG "%s: Mic Bias will be turned OFF\n",
-				__func__);
+					      AIC32x4_MICBIAS_MASK, 0);
+		dev_dbg(component->dev, "Mic Bias will be turned OFF\n");
 		break;
 	}
 
 	return 0;
 }
 
-
 static int aic32x4_get_mfp1_gpio(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
+				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	u8 val;
@@ -114,7 +110,7 @@ static int aic32x4_get_mfp1_gpio(struct snd_kcontrol *kcontrol,
 };
 
 static int aic32x4_set_mfp2_gpio(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
+				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	u8 val;
@@ -123,8 +119,7 @@ static int aic32x4_set_mfp2_gpio(struct snd_kcontrol *kcontrol,
 	val = snd_soc_component_read(component, AIC32X4_DOUTCTL);
 	gpio_check = (val & AIC32X4_MFP_GPIO_ENABLED);
 	if (gpio_check != AIC32X4_MFP_GPIO_ENABLED) {
-		printk(KERN_ERR "%s: MFP2 is not configure as a GPIO output\n",
-			__func__);
+		dev_err(component->dev, "MFP2 is not configure as a GPIO output\n");
 		return -EINVAL;
 	}
 
@@ -142,7 +137,7 @@ static int aic32x4_set_mfp2_gpio(struct snd_kcontrol *kcontrol,
 };
 
 static int aic32x4_get_mfp3_gpio(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
+				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	u8 val;
@@ -155,7 +150,7 @@ static int aic32x4_get_mfp3_gpio(struct snd_kcontrol *kcontrol,
 };
 
 static int aic32x4_set_mfp4_gpio(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
+				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	u8 val;
@@ -164,8 +159,7 @@ static int aic32x4_set_mfp4_gpio(struct snd_kcontrol *kcontrol,
 	val = snd_soc_component_read(component, AIC32X4_MISOCTL);
 	gpio_check = (val & AIC32X4_MFP_GPIO_ENABLED);
 	if (gpio_check != AIC32X4_MFP_GPIO_ENABLED) {
-		printk(KERN_ERR "%s: MFP4 is not configure as a GPIO output\n",
-			__func__);
+		dev_err(component->dev, "MFP4 is not configure as a GPIO output\n");
 		return -EINVAL;
 	}
 
@@ -183,7 +177,7 @@ static int aic32x4_set_mfp4_gpio(struct snd_kcontrol *kcontrol,
 };
 
 static int aic32x4_get_mfp5_gpio(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
+				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	u8 val;
@@ -195,7 +189,7 @@ static int aic32x4_get_mfp5_gpio(struct snd_kcontrol *kcontrol,
 };
 
 static int aic32x4_set_mfp5_gpio(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
+				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	u8 val;
@@ -204,8 +198,7 @@ static int aic32x4_set_mfp5_gpio(struct snd_kcontrol *kcontrol,
 	val = snd_soc_component_read(component, AIC32X4_GPIOCTL);
 	gpio_check = (val & AIC32X4_MFP5_GPIO_OUTPUT);
 	if (gpio_check != AIC32X4_MFP5_GPIO_OUTPUT) {
-		printk(KERN_ERR "%s: MFP5 is not configure as a GPIO output\n",
-			__func__);
+		dev_err(component->dev, "MFP5 is not configure as a GPIO output\n");
 		return -EINVAL;
 	}
 
@@ -276,53 +269,42 @@ static SOC_ENUM_SINGLE_DECL(r_ptm_enum, AIC32X4_RPLAYBACK, 2, ptm_text);
 
 static const struct snd_kcontrol_new aic32x4_snd_controls[] = {
 	SOC_DOUBLE_R_S_TLV("PCM Playback Volume", AIC32X4_LDACVOL,
-			AIC32X4_RDACVOL, 0, -0x7f, 0x30, 7, 0, tlv_pcm),
+			   AIC32X4_RDACVOL, 0, -0x7f, 0x30, 7, 0, tlv_pcm),
 	SOC_ENUM("DAC Left Playback PowerTune Switch", l_ptm_enum),
 	SOC_ENUM("DAC Right Playback PowerTune Switch", r_ptm_enum),
 	SOC_DOUBLE_R_S_TLV("HP Driver Gain Volume", AIC32X4_HPLGAIN,
-			AIC32X4_HPRGAIN, 0, -0x6, 0x1d, 5, 0,
-			tlv_driver_gain),
+			   AIC32X4_HPRGAIN, 0, -0x6, 0x1d, 5, 0, tlv_driver_gain),
 	SOC_DOUBLE_R_S_TLV("LO Driver Gain Volume", AIC32X4_LOLGAIN,
-			AIC32X4_LORGAIN, 0, -0x6, 0x1d, 5, 0,
-			tlv_driver_gain),
+			   AIC32X4_LORGAIN, 0, -0x6, 0x1d, 5, 0, tlv_driver_gain),
 	SOC_DOUBLE_R("HP DAC Playback Switch", AIC32X4_HPLGAIN,
-			AIC32X4_HPRGAIN, 6, 0x01, 1),
+		     AIC32X4_HPRGAIN, 6, 0x01, 1),
 	SOC_DOUBLE_R("LO DAC Playback Switch", AIC32X4_LOLGAIN,
-			AIC32X4_LORGAIN, 6, 0x01, 1),
+		     AIC32X4_LORGAIN, 6, 0x01, 1),
 	SOC_ENUM("LO Playback Common Mode Switch", lo_cm_enum),
 	SOC_DOUBLE_R("Mic PGA Switch", AIC32X4_LMICPGAVOL,
-			AIC32X4_RMICPGAVOL, 7, 0x01, 1),
+		     AIC32X4_RMICPGAVOL, 7, 0x01, 1),
 
 	SOC_SINGLE("ADCFGA Left Mute Switch", AIC32X4_ADCFGA, 7, 1, 0),
 	SOC_SINGLE("ADCFGA Right Mute Switch", AIC32X4_ADCFGA, 3, 1, 0),
 
 	SOC_DOUBLE_R_S_TLV("ADC Level Volume", AIC32X4_LADCVOL,
-			AIC32X4_RADCVOL, 0, -0x18, 0x28, 6, 0, tlv_adc_vol),
+			   AIC32X4_RADCVOL, 0, -0x18, 0x28, 6, 0, tlv_adc_vol),
 	SOC_DOUBLE_R_TLV("PGA Level Volume", AIC32X4_LMICPGAVOL,
-			AIC32X4_RMICPGAVOL, 0, 0x5f, 0, tlv_step_0_5),
+			 AIC32X4_RMICPGAVOL, 0, 0x5f, 0, tlv_step_0_5),
 
 	SOC_SINGLE("Auto-mute Switch", AIC32X4_DACMUTE, 4, 7, 0),
 
 	SOC_SINGLE("AGC Left Switch", AIC32X4_LAGC1, 7, 1, 0),
 	SOC_SINGLE("AGC Right Switch", AIC32X4_RAGC1, 7, 1, 0),
-	SOC_DOUBLE_R("AGC Target Level", AIC32X4_LAGC1, AIC32X4_RAGC1,
-			4, 0x07, 0),
-	SOC_DOUBLE_R("AGC Gain Hysteresis", AIC32X4_LAGC1, AIC32X4_RAGC1,
-			0, 0x03, 0),
-	SOC_DOUBLE_R("AGC Hysteresis", AIC32X4_LAGC2, AIC32X4_RAGC2,
-			6, 0x03, 0),
-	SOC_DOUBLE_R("AGC Noise Threshold", AIC32X4_LAGC2, AIC32X4_RAGC2,
-			1, 0x1F, 0),
-	SOC_DOUBLE_R("AGC Max PGA", AIC32X4_LAGC3, AIC32X4_RAGC3,
-			0, 0x7F, 0),
-	SOC_DOUBLE_R("AGC Attack Time", AIC32X4_LAGC4, AIC32X4_RAGC4,
-			3, 0x1F, 0),
-	SOC_DOUBLE_R("AGC Decay Time", AIC32X4_LAGC5, AIC32X4_RAGC5,
-			3, 0x1F, 0),
-	SOC_DOUBLE_R("AGC Noise Debounce", AIC32X4_LAGC6, AIC32X4_RAGC6,
-			0, 0x1F, 0),
-	SOC_DOUBLE_R("AGC Signal Debounce", AIC32X4_LAGC7, AIC32X4_RAGC7,
-			0, 0x0F, 0),
+	SOC_DOUBLE_R("AGC Target Level", AIC32X4_LAGC1, AIC32X4_RAGC1, 4, 0x07, 0),
+	SOC_DOUBLE_R("AGC Gain Hysteresis", AIC32X4_LAGC1, AIC32X4_RAGC1, 0, 0x03, 0),
+	SOC_DOUBLE_R("AGC Hysteresis", AIC32X4_LAGC2, AIC32X4_RAGC2, 6, 0x03, 0),
+	SOC_DOUBLE_R("AGC Noise Threshold", AIC32X4_LAGC2, AIC32X4_RAGC2, 1, 0x1F, 0),
+	SOC_DOUBLE_R("AGC Max PGA", AIC32X4_LAGC3, AIC32X4_RAGC3, 0, 0x7F, 0),
+	SOC_DOUBLE_R("AGC Attack Time", AIC32X4_LAGC4, AIC32X4_RAGC4, 3, 0x1F, 0),
+	SOC_DOUBLE_R("AGC Decay Time", AIC32X4_LAGC5, AIC32X4_RAGC5, 3, 0x1F, 0),
+	SOC_DOUBLE_R("AGC Noise Debounce", AIC32X4_LAGC6, AIC32X4_RAGC6, 0, 0x1F, 0),
+	SOC_DOUBLE_R("AGC Signal Debounce", AIC32X4_LAGC7, AIC32X4_RAGC7, 0, 0x0F, 0),
 };
 
 static const struct snd_kcontrol_new hpl_output_mixer_controls[] = {
@@ -360,21 +342,27 @@ static SOC_ENUM_SINGLE_DECL(in3r_lpga_n_enum, AIC32X4_LMICPGANIN, 2, resistor_te
 static const struct snd_kcontrol_new in1l_to_lmixer_controls[] = {
 	SOC_DAPM_ENUM("IN1_L L+ Switch", in1l_lpga_p_enum),
 };
+
 static const struct snd_kcontrol_new in2l_to_lmixer_controls[] = {
 	SOC_DAPM_ENUM("IN2_L L+ Switch", in2l_lpga_p_enum),
 };
+
 static const struct snd_kcontrol_new in3l_to_lmixer_controls[] = {
 	SOC_DAPM_ENUM("IN3_L L+ Switch", in3l_lpga_p_enum),
 };
+
 static const struct snd_kcontrol_new in1r_to_lmixer_controls[] = {
 	SOC_DAPM_ENUM("IN1_R L+ Switch", in1r_lpga_p_enum),
 };
+
 static const struct snd_kcontrol_new cml_to_lmixer_controls[] = {
 	SOC_DAPM_ENUM("CM_L L- Switch", cml_lpga_n_enum),
 };
+
 static const struct snd_kcontrol_new in2r_to_lmixer_controls[] = {
 	SOC_DAPM_ENUM("IN2_R L- Switch", in2r_lpga_n_enum),
 };
+
 static const struct snd_kcontrol_new in3r_to_lmixer_controls[] = {
 	SOC_DAPM_ENUM("IN3_R L- Switch", in3r_lpga_n_enum),
 };
@@ -391,21 +379,27 @@ static SOC_ENUM_SINGLE_DECL(in3l_rpga_n_enum, AIC32X4_RMICPGANIN, 2, resistor_te
 static const struct snd_kcontrol_new in1r_to_rmixer_controls[] = {
 	SOC_DAPM_ENUM("IN1_R R+ Switch", in1r_rpga_p_enum),
 };
+
 static const struct snd_kcontrol_new in2r_to_rmixer_controls[] = {
 	SOC_DAPM_ENUM("IN2_R R+ Switch", in2r_rpga_p_enum),
 };
+
 static const struct snd_kcontrol_new in3r_to_rmixer_controls[] = {
 	SOC_DAPM_ENUM("IN3_R R+ Switch", in3r_rpga_p_enum),
 };
+
 static const struct snd_kcontrol_new in2l_to_rmixer_controls[] = {
 	SOC_DAPM_ENUM("IN2_L R+ Switch", in2l_rpga_p_enum),
 };
+
 static const struct snd_kcontrol_new cmr_to_rmixer_controls[] = {
 	SOC_DAPM_ENUM("CM_R R- Switch", cmr_rpga_n_enum),
 };
+
 static const struct snd_kcontrol_new in1l_to_rmixer_controls[] = {
 	SOC_DAPM_ENUM("IN1_L R- Switch", in1l_rpga_n_enum),
 };
+
 static const struct snd_kcontrol_new in3l_to_rmixer_controls[] = {
 	SOC_DAPM_ENUM("IN3_L R- Switch", in3l_rpga_n_enum),
 };
@@ -434,38 +428,38 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 
 	SND_SOC_DAPM_ADC("Right ADC", "Right Capture", AIC32X4_ADCSETUP, 6, 0),
 	SND_SOC_DAPM_MUX("IN1_R to Right Mixer Positive Resistor", SND_SOC_NOPM, 0, 0,
-			in1r_to_rmixer_controls),
+			 in1r_to_rmixer_controls),
 	SND_SOC_DAPM_MUX("IN2_R to Right Mixer Positive Resistor", SND_SOC_NOPM, 0, 0,
-			in2r_to_rmixer_controls),
+			 in2r_to_rmixer_controls),
 	SND_SOC_DAPM_MUX("IN3_R to Right Mixer Positive Resistor", SND_SOC_NOPM, 0, 0,
-			in3r_to_rmixer_controls),
+			 in3r_to_rmixer_controls),
 	SND_SOC_DAPM_MUX("IN2_L to Right Mixer Positive Resistor", SND_SOC_NOPM, 0, 0,
-			in2l_to_rmixer_controls),
+			 in2l_to_rmixer_controls),
 	SND_SOC_DAPM_MUX("CM_R to Right Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
-			cmr_to_rmixer_controls),
+			 cmr_to_rmixer_controls),
 	SND_SOC_DAPM_MUX("IN1_L to Right Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
-			in1l_to_rmixer_controls),
+			 in1l_to_rmixer_controls),
 	SND_SOC_DAPM_MUX("IN3_L to Right Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
-			in3l_to_rmixer_controls),
+			 in3l_to_rmixer_controls),
 
 	SND_SOC_DAPM_ADC("Left ADC", "Left Capture", AIC32X4_ADCSETUP, 7, 0),
 	SND_SOC_DAPM_MUX("IN1_L to Left Mixer Positive Resistor", SND_SOC_NOPM, 0, 0,
-			in1l_to_lmixer_controls),
+			 in1l_to_lmixer_controls),
 	SND_SOC_DAPM_MUX("IN2_L to Left Mixer Positive Resistor", SND_SOC_NOPM, 0, 0,
-			in2l_to_lmixer_controls),
+			 in2l_to_lmixer_controls),
 	SND_SOC_DAPM_MUX("IN3_L to Left Mixer Positive Resistor", SND_SOC_NOPM, 0, 0,
-			in3l_to_lmixer_controls),
+			 in3l_to_lmixer_controls),
 	SND_SOC_DAPM_MUX("IN1_R to Left Mixer Positive Resistor", SND_SOC_NOPM, 0, 0,
-			in1r_to_lmixer_controls),
+			 in1r_to_lmixer_controls),
 	SND_SOC_DAPM_MUX("CM_L to Left Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
-			cml_to_lmixer_controls),
+			 cml_to_lmixer_controls),
 	SND_SOC_DAPM_MUX("IN2_R to Left Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
-			in2r_to_lmixer_controls),
+			 in2r_to_lmixer_controls),
 	SND_SOC_DAPM_MUX("IN3_R to Left Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
-			in3r_to_lmixer_controls),
+			 in3r_to_lmixer_controls),
 
 	SND_SOC_DAPM_SUPPLY("Mic Bias", AIC32X4_MICBIAS, 6, 0, mic_bias_event,
-			SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 
 	SND_SOC_DAPM_POST("ADC Reset", aic32x4_reset_adc),
 
@@ -624,7 +618,7 @@ static int aic32x4_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
-		printk(KERN_ERR "aic32x4: invalid clock provider\n");
+		dev_err(component->dev, "invalid clock provider\n");
 		return -EINVAL;
 	}
 
@@ -651,19 +645,20 @@ static int aic32x4_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 				AIC32X4_IFACE1_DATATYPE_SHIFT);
 		break;
 	default:
-		printk(KERN_ERR "aic32x4: invalid DAI interface format\n");
+		dev_err(component->dev, "invalid DAI interface format\n");
 		return -EINVAL;
 	}
 
 	aic32x4->fmt = fmt;
 
 	snd_soc_component_update_bits(component, AIC32X4_IFACE1,
-				AIC32X4_IFACE1_DATATYPE_MASK |
-				AIC32X4_IFACE1_MASTER_MASK, iface_reg_1);
+				      AIC32X4_IFACE1_DATATYPE_MASK |
+						AIC32X4_IFACE1_MASTER_MASK,
+				      iface_reg_1);
 	snd_soc_component_update_bits(component, AIC32X4_IFACE2,
-				AIC32X4_DATA_OFFSET_MASK, iface_reg_2);
+				      AIC32X4_DATA_OFFSET_MASK, iface_reg_2);
 	snd_soc_component_update_bits(component, AIC32X4_IFACE3,
-				AIC32X4_BCLKINV_MASK, iface_reg_3);
+				      AIC32X4_BCLKINV_MASK, iface_reg_3);
 
 	return 0;
 }
@@ -676,14 +671,13 @@ static int aic32x4_set_aosr(struct snd_soc_component *component, u8 aosr)
 static int aic32x4_set_dosr(struct snd_soc_component *component, u16 dosr)
 {
 	snd_soc_component_write(component, AIC32X4_DOSRMSB, dosr >> 8);
-	snd_soc_component_write(component, AIC32X4_DOSRLSB,
-		      (dosr & 0xff));
+	snd_soc_component_write(component, AIC32X4_DOSRLSB, dosr & 0xff);
 
 	return 0;
 }
 
 static int aic32x4_set_processing_blocks(struct snd_soc_component *component,
-						u8 r_block, u8 p_block)
+					 u8 r_block, u8 p_block)
 {
 	struct aic32x4_priv *aic32x4 = snd_soc_component_get_drvdata(component);
 
@@ -794,50 +788,39 @@ static int aic32x4_setup_clocks(struct snd_soc_component *component,
 					(min_mdac * dosr * sample_rate);
 			for (mdac = min_mdac; mdac <= 128; ++mdac) {
 				for (ndac = max_ndac; ndac > 0; --ndac) {
-					dac_clock_rate = ndac * mdac * dosr *
-							sample_rate;
-					if (dac_clock_rate == adc_clock_rate) {
-						if (clk_round_rate(clocks[0].clk, dac_clock_rate) == 0)
-							continue;
-
-						clk_set_rate(clocks[0].clk,
-							dac_clock_rate);
-
-						clk_set_rate(clocks[1].clk,
-							sample_rate * aosr *
-							madc);
-						clk_set_rate(clocks[2].clk,
-							sample_rate * aosr);
-						aic32x4_set_aosr(component,
-							aosr);
-
-						clk_set_rate(clocks[3].clk,
-							sample_rate * dosr *
-							mdac);
-						clk_set_rate(clocks[4].clk,
-							sample_rate * dosr);
-						aic32x4_set_dosr(component,
-							dosr);
-
-						clk_set_rate(clocks[5].clk,
-							sample_rate * channels *
-							bit_depth);
-
-						return 0;
-					}
+					dac_clock_rate = ndac * mdac * dosr * sample_rate;
+					if (dac_clock_rate != adc_clock_rate)
+						continue;
+
+					if (clk_round_rate(clocks[0].clk, dac_clock_rate) == 0)
+						continue;
+
+					clk_set_rate(clocks[0].clk, dac_clock_rate);
+
+					clk_set_rate(clocks[1].clk, sample_rate * aosr * madc);
+					clk_set_rate(clocks[2].clk, sample_rate * aosr);
+					aic32x4_set_aosr(component, aosr);
+
+					clk_set_rate(clocks[3].clk, sample_rate * dosr * mdac);
+					clk_set_rate(clocks[4].clk, sample_rate * dosr);
+					aic32x4_set_dosr(component, dosr);
+
+					clk_set_rate(clocks[5].clk,
+						     sample_rate * channels * bit_depth);
+
+					return 0;
 				}
 			}
 		}
 	}
 
-	dev_err(component->dev,
-		"Could not set clocks to support sample rate.\n");
+	dev_err(component->dev, "Could not set clocks to support sample rate.\n");
 	return -EINVAL;
 }
 
 static int aic32x4_hw_params(struct snd_pcm_substream *substream,
-				 struct snd_pcm_hw_params *params,
-				 struct snd_soc_dai *dai)
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
 	struct aic32x4_priv *aic32x4 = snd_soc_component_get_drvdata(component);
@@ -850,24 +833,20 @@ static int aic32x4_hw_params(struct snd_pcm_substream *substream,
 
 	switch (params_physical_width(params)) {
 	case 16:
-		iface1_reg |= (AIC32X4_WORD_LEN_16BITS <<
-				   AIC32X4_IFACE1_DATALEN_SHIFT);
+		iface1_reg |= (AIC32X4_WORD_LEN_16BITS << AIC32X4_IFACE1_DATALEN_SHIFT);
 		break;
 	case 20:
-		iface1_reg |= (AIC32X4_WORD_LEN_20BITS <<
-				   AIC32X4_IFACE1_DATALEN_SHIFT);
+		iface1_reg |= (AIC32X4_WORD_LEN_20BITS << AIC32X4_IFACE1_DATALEN_SHIFT);
 		break;
 	case 24:
-		iface1_reg |= (AIC32X4_WORD_LEN_24BITS <<
-				   AIC32X4_IFACE1_DATALEN_SHIFT);
+		iface1_reg |= (AIC32X4_WORD_LEN_24BITS << AIC32X4_IFACE1_DATALEN_SHIFT);
 		break;
 	case 32:
-		iface1_reg |= (AIC32X4_WORD_LEN_32BITS <<
-				   AIC32X4_IFACE1_DATALEN_SHIFT);
+		iface1_reg |= (AIC32X4_WORD_LEN_32BITS << AIC32X4_IFACE1_DATALEN_SHIFT);
 		break;
 	}
 	snd_soc_component_update_bits(component, AIC32X4_IFACE1,
-				AIC32X4_IFACE1_DATALEN_MASK, iface1_reg);
+				      AIC32X4_IFACE1_DATALEN_MASK, iface1_reg);
 
 	if (params_channels(params) == 1) {
 		dacsetup_reg = AIC32X4_RDAC2LCHN | AIC32X4_LDAC2LCHN;
@@ -878,7 +857,7 @@ static int aic32x4_hw_params(struct snd_pcm_substream *substream,
 			dacsetup_reg = AIC32X4_LDAC2LCHN | AIC32X4_RDAC2RCHN;
 	}
 	snd_soc_component_update_bits(component, AIC32X4_DACSETUP,
-				AIC32X4_DAC_CHAN_MASK, dacsetup_reg);
+				      AIC32X4_DAC_CHAN_MASK, dacsetup_reg);
 
 	return 0;
 }
@@ -888,7 +867,7 @@ static int aic32x4_mute(struct snd_soc_dai *dai, int mute, int direction)
 	struct snd_soc_component *component = dai->component;
 
 	snd_soc_component_update_bits(component, AIC32X4_DACMUTE,
-				AIC32X4_MUTEON, mute ? AIC32X4_MUTEON : 0);
+				      AIC32X4_MUTEON, mute ? AIC32X4_MUTEON : 0);
 
 	return 0;
 }
@@ -1004,7 +983,7 @@ static int aic32x4_component_probe(struct snd_soc_component *component)
 	/* Power platform configuration */
 	if (aic32x4->power_cfg & AIC32X4_PWR_MICBIAS_2075_LDOIN) {
 		snd_soc_component_write(component, AIC32X4_MICBIAS,
-				AIC32X4_MICBIAS_LDOIN | AIC32X4_MICBIAS_2075V);
+					AIC32X4_MICBIAS_LDOIN | AIC32X4_MICBIAS_2075V);
 	}
 	if (aic32x4->power_cfg & AIC32X4_PWR_AVDD_DVDD_WEAK_DISABLE)
 		snd_soc_component_write(component, AIC32X4_PWRCFG, AIC32X4_AVDDWEAKDISABLE);
@@ -1023,16 +1002,16 @@ static int aic32x4_component_probe(struct snd_soc_component *component)
 	/* Mic PGA routing */
 	if (aic32x4->micpga_routing & AIC32X4_MICPGA_ROUTE_LMIC_IN2R_10K)
 		snd_soc_component_write(component, AIC32X4_LMICPGANIN,
-				AIC32X4_LMICPGANIN_IN2R_10K);
+					AIC32X4_LMICPGANIN_IN2R_10K);
 	else
 		snd_soc_component_write(component, AIC32X4_LMICPGANIN,
-				AIC32X4_LMICPGANIN_CM1L_10K);
+					AIC32X4_LMICPGANIN_CM1L_10K);
 	if (aic32x4->micpga_routing & AIC32X4_MICPGA_ROUTE_RMIC_IN1L_10K)
 		snd_soc_component_write(component, AIC32X4_RMICPGANIN,
-				AIC32X4_RMICPGANIN_IN1L_10K);
+					AIC32X4_RMICPGANIN_IN1L_10K);
 	else
 		snd_soc_component_write(component, AIC32X4_RMICPGANIN,
-				AIC32X4_RMICPGANIN_CM1R_10K);
+					AIC32X4_RMICPGANIN_CM1R_10K);
 
 	/*
 	 * Workaround: for an unknown reason, the ADC needs to be powered up
@@ -1040,8 +1019,8 @@ static int aic32x4_component_probe(struct snd_soc_component *component)
 	 * a HW BUG or some kind of behavior not documented in the datasheet.
 	 */
 	tmp_reg = snd_soc_component_read(component, AIC32X4_ADCSETUP);
-	snd_soc_component_write(component, AIC32X4_ADCSETUP, tmp_reg |
-				AIC32X4_LADC_EN | AIC32X4_RADC_EN);
+	snd_soc_component_write(component, AIC32X4_ADCSETUP,
+				tmp_reg | AIC32X4_LADC_EN | AIC32X4_RADC_EN);
 	snd_soc_component_write(component, AIC32X4_ADCSETUP, tmp_reg);
 
 	/*
@@ -1084,13 +1063,13 @@ static const struct snd_kcontrol_new aic32x4_tas2505_snd_controls[] = {
 	SOC_ENUM("DAC Playback PowerTune Switch", l_ptm_enum),
 
 	SOC_SINGLE_TLV("HP Driver Gain Volume",
-			AIC32X4_HPLGAIN, 0, 0x74, 1, tlv_tas_driver_gain),
+		       AIC32X4_HPLGAIN, 0, 0x74, 1, tlv_tas_driver_gain),
 	SOC_SINGLE("HP DAC Playback Switch", AIC32X4_HPLGAIN, 6, 1, 1),
 
 	SOC_SINGLE_TLV("Speaker Driver Playback Volume",
-			TAS2505_SPKVOL1, 0, 0x74, 1, tlv_tas_driver_gain),
+		       TAS2505_SPKVOL1, 0, 0x74, 1, tlv_tas_driver_gain),
 	SOC_SINGLE_TLV("Speaker Amplifier Playback Volume",
-			TAS2505_SPKVOL2, 4, 5, 0, tlv_amp_vol),
+		       TAS2505_SPKVOL2, 4, 5, 0, tlv_amp_vol),
 
 	SOC_SINGLE("Auto-mute Switch", AIC32X4_DACMUTE, 4, 7, 0),
 };
@@ -1126,11 +1105,12 @@ static const struct snd_soc_dapm_route aic32x4_tas2505_dapm_routes[] = {
 static struct snd_soc_dai_driver aic32x4_tas2505_dai = {
 	.name = "tas2505-hifi",
 	.playback = {
-			 .stream_name = "Playback",
-			 .channels_min = 1,
-			 .channels_max = 2,
-			 .rates = SNDRV_PCM_RATE_8000_96000,
-			 .formats = AIC32X4_FORMATS,},
+		 .stream_name = "Playback",
+		 .channels_min = 1,
+		 .channels_max = 2,
+		 .rates = SNDRV_PCM_RATE_8000_96000,
+		 .formats = AIC32X4_FORMATS,
+	},
 	.ops = &aic32x4_ops,
 	.symmetric_rate = 1,
 };
@@ -1173,7 +1153,7 @@ static int aic32x4_tas2505_component_probe(struct snd_soc_component *component)
 	snd_soc_component_write(component, AIC32X4_CMMODE, tmp_reg);
 
 	/*
-	 * Enable the fast charging feature and ensure the needed 40ms ellapsed
+	 * Enable the fast charging feature and ensure the needed 40ms elapsed
 	 * before using the analog circuits.
 	 */
 	snd_soc_component_write(component, TAS2505_REFPOWERUP,
@@ -1199,8 +1179,7 @@ static const struct snd_soc_component_driver soc_component_dev_aic32x4_tas2505 =
 	.endianness		= 1,
 };
 
-static int aic32x4_parse_dt(struct aic32x4_priv *aic32x4,
-		struct device_node *np)
+static int aic32x4_parse_dt(struct aic32x4_priv *aic32x4, struct device_node *np)
 {
 	int ret;
 
@@ -1243,7 +1222,7 @@ static void aic32x4_disable_regulators(struct aic32x4_priv *aic32x4)
 }
 
 static int aic32x4_setup_regulators(struct device *dev,
-		struct aic32x4_priv *aic32x4)
+				    struct aic32x4_priv *aic32x4)
 {
 	int ret = 0;
 
@@ -1333,9 +1312,8 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap,
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	aic32x4 = devm_kzalloc(dev, sizeof(struct aic32x4_priv),
-				   GFP_KERNEL);
-	if (aic32x4 == NULL)
+	aic32x4 = devm_kzalloc(dev, sizeof(struct aic32x4_priv), GFP_KERNEL);
+	if (!aic32x4)
 		return -ENOMEM;
 
 	aic32x4->dev = dev;
@@ -1379,11 +1357,13 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap,
 	switch (aic32x4->type) {
 	case AIC32X4_TYPE_TAS2505:
 		ret = devm_snd_soc_register_component(dev,
-			&soc_component_dev_aic32x4_tas2505, &aic32x4_tas2505_dai, 1);
+						      &soc_component_dev_aic32x4_tas2505,
+						      &aic32x4_tas2505_dai, 1);
 		break;
 	default:
 		ret = devm_snd_soc_register_component(dev,
-			&soc_component_dev_aic32x4, &aic32x4_dai, 1);
+						      &soc_component_dev_aic32x4,
+						      &aic32x4_dai, 1);
 	}
 
 	if (ret) {
diff --git a/sound/soc/codecs/tlv320aic32x4.h b/sound/soc/codecs/tlv320aic32x4.h
index 95d010af3d5a..cfab6f8ce5ac 100644
--- a/sound/soc/codecs/tlv320aic32x4.h
+++ b/sound/soc/codecs/tlv320aic32x4.h
@@ -3,7 +3,6 @@
  * tlv320aic32x4.h
  */
 
-
 #ifndef _TLV320AIC32X4_H
 #define _TLV320AIC32X4_H
 
@@ -24,7 +23,7 @@ int aic32x4_register_clocks(struct device *dev, const char *mclk_name);
 
 /* tlv320aic32x4 register space (in decimal to match datasheet) */
 
-#define AIC32X4_REG(page, reg)	((page * 128) + reg)
+#define AIC32X4_REG(page, reg)	(((page) * 128) + (reg))
 
 #define	AIC32X4_PSEL		AIC32X4_REG(0, 0)
 
-- 
2.55.0.229.g6434b31f56-goog

