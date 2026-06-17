Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EF844E043
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692544; cv=none; b=i5W6CyDuKMBVz28NLjDhlZJXA2Xa1HbkSMD7rgvl8bvdkuaWWkYLClyCmh0v+hUwcDpDc3nAGpJRUv2KrWgZhilq5I7BZa6SWJdN4j+nAgydLVKhfu5mZmnPpQ8t0NQqecIQdaWgPvO2oyxinCzgtZL3wRmgfvl9Ds/K4B8wxUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692544; c=relaxed/simple;
	bh=FvCY6IHEvGanI+XwNJYJXJPRA6+zOndXmAvYxeKo0xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hs0CC04rt03LnC7sZEtspYj2BlDlcip3t6LtMdQTMHL7W+OEKmdkMFh9ObxAKyHMMZKgmefLsp34CpJwrC906Nib7x1nPSt36MA7bEtF1X9iDK1p0fLQOgWEJGpZW/HxV+MEJZFBZK7YemOAfT+9Ei/P7cwCYpvma7+HoL/2s1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CextnTQJ; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CextnTQJ"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-304d8362a58so601378eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692538; x=1782297338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8VWF2SeEtHF667M6jhaZnBwcldxW4ZuQhlBOZBeK1Y=;
        b=CextnTQJmemHuOXg3DNx+beYzx/sVRS1SEGmfBJsjnCLrFziqeFOJwCxJdpOMoEOfY
         FU/4U2bxjXbezM7avrKM5zeIaDv3IMZIHQT2mjoUGI8wLwrQqhJYvrtnljyKBRJMmnzG
         G4HP4Ax1cWQP0rEEZgW4Eu+Xl07wH45FpB7ilgvTU0OsVKhVifbHGJ3QQ1oDGewqhZvP
         K8jesq9uwt1X3NZ+39MV0Dau6Vr5vjqGEsYUfXXKOYtwO0Qk1MOPi3EtNY3EI/rtl0yC
         R/h5x+tlaqxYd/lO1TxgpN9knDqZbBt1AoHoKam5sED8m1kaX3WWFMsteWPEI7xRSJ6h
         Xkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692538; x=1782297338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y8VWF2SeEtHF667M6jhaZnBwcldxW4ZuQhlBOZBeK1Y=;
        b=cEzUCT+nSFYH2uymHay9jZZfO5XWYCXvd6GCDITOBMldlc2whLGUtUzggGdIBx3oY3
         zST6rLWvbWoculD9/NRuclGPKzFfJ4cxek8vqChh5Gy3Bp2guKCI7o7Lo9qh5Y0QroRl
         /jH4+4wH8+4JDuIB4tjGXUKe+jxZhc5yV9Z7pZptTbf2P6VSA4eOZfRpg6L6f2c0mgg5
         kLDdeVaDrc+vk1qFIhjO0t226CjrP7CU9ZOxagKqFD4LTyVtW6H9Y+pbafJzbLB+Ebua
         xk10hL48zHsN0+rTh84Z3G0RA2f/d6ngY+XgQsmpsjipRK+pgaY2QcVmzmTED+lLu98Y
         VAXg==
X-Forwarded-Encrypted: i=1; AFNElJ+Bj9jXuj1Z2/4Ia0zz/LGyFnZQZbY702Q3SD36ihPKFK7RYBso5F5SVe5m1wgZMYr0dURjJpDtx/AL9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkf6t1qKOMs5xUxufOE6VV+H9iK6TQCOicOkfyPmpx9mi3qPBO
	+tAnIERWzY3Tzhdy6EOZcMUUYw1tiDRwASg+IwaN9rZZG9tJcA5R3BA9
X-Gm-Gg: AfdE7cn32+WhO8LjiqKWjrBH5H+JfBR4MDbyk/dvpmDxQgS06hkPZ+VIJ1b5C43bRcK
	uuoX/nMLIpZPyD6AaN5Amg76J9WAypklkxa6QjYbESZsxxzI+YBWvrYjU4Rhd7tfFf1hFeu0DwR
	JjArOnaOX5Y6BA2OH6Z/Sevd2BCsdRQLn8as6MvyBTUMlqMvniRH9fisRWDrhPZnmQRHqQ8we1O
	qyvOuF4fXTj5hP4erzIwzg+LygQLD+z/kL75zM+g2qFWLcnV7MX3CzPYnhh12VtxmqWWqW31+uM
	MuMqa2ySQ5URvPlzQujF4lpZi64wmwC1qanocC4RZ76hrKjqzokzbOJJ9IRdfNXTH7UglR3m4zS
	qGdwNV7Zb7sdSKc4u8XUOfOsgV1liXoZCsCfSyV8+0PF5Pb8Sx0Xphx6Hq5SeF2X5wMeyH6GsAt
	IVDFPMdKBvgDlFLtdcbcKpK9XSTgqpX5Sy1IMM2Gw7hCnZIdE=
X-Received: by 2002:a05:7300:6420:b0:304:bd90:b88f with SMTP id 5a478bee46e88-30bcf5ff5abmr1289238eec.9.1781692538389;
        Wed, 17 Jun 2026 03:35:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:38 -0700 (PDT)
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
Subject: [PATCH 17/78] ASoC: codecs: cs43130: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:34 +0700
Message-ID: <20260617103235.449609-18-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs43130.c | 96 +++++++++++++++++++-------------------
 1 file changed, 47 insertions(+), 49 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index e7b06f962790..5e7472e9e107 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -818,26 +818,26 @@ static int cs43130_dsd_hw_params(struct snd_pcm_substream *substream,
 	unsigned int required_clk;
 	u8 dsd_speed;
 
-	mutex_lock(&cs43130->clk_mutex);
-	if (!cs43130->clk_req) {
-		/* no DAI is currently using clk */
-		if (!(CS43130_MCLK_22M % params_rate(params)))
-			required_clk = CS43130_MCLK_22M;
-		else
-			required_clk = CS43130_MCLK_24M;
+	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (!cs43130->clk_req) {
+			/* no DAI is currently using clk */
+			if (!(CS43130_MCLK_22M % params_rate(params)))
+				required_clk = CS43130_MCLK_22M;
+			else
+				required_clk = CS43130_MCLK_24M;
+
+			cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
+			if (cs43130->pll_bypass)
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
+			else
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		}
 
-		cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
-		if (cs43130->pll_bypass)
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
-		else
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		cs43130->clk_req++;
+		if (cs43130->clk_req == 2)
+			cs43130_pcm_dsd_mix(true, cs43130->regmap);
 	}
 
-	cs43130->clk_req++;
-	if (cs43130->clk_req == 2)
-		cs43130_pcm_dsd_mix(true, cs43130->regmap);
-	mutex_unlock(&cs43130->clk_mutex);
-
 	switch (params_rate(params)) {
 	case 176400:
 		dsd_speed = 0;
@@ -881,26 +881,26 @@ static int cs43130_hw_params(struct snd_pcm_substream *substream,
 	unsigned int required_clk;
 	u8 dsd_speed;
 
-	mutex_lock(&cs43130->clk_mutex);
-	if (!cs43130->clk_req) {
-		/* no DAI is currently using clk */
-		if (!(CS43130_MCLK_22M % params_rate(params)))
-			required_clk = CS43130_MCLK_22M;
-		else
-			required_clk = CS43130_MCLK_24M;
+	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (!cs43130->clk_req) {
+			/* no DAI is currently using clk */
+			if (!(CS43130_MCLK_22M % params_rate(params)))
+				required_clk = CS43130_MCLK_22M;
+			else
+				required_clk = CS43130_MCLK_24M;
+
+			cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
+			if (cs43130->pll_bypass)
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
+			else
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		}
 
-		cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
-		if (cs43130->pll_bypass)
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
-		else
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		cs43130->clk_req++;
+		if (cs43130->clk_req == 2)
+			cs43130_pcm_dsd_mix(true, cs43130->regmap);
 	}
 
-	cs43130->clk_req++;
-	if (cs43130->clk_req == 2)
-		cs43130_pcm_dsd_mix(true, cs43130->regmap);
-	mutex_unlock(&cs43130->clk_mutex);
-
 	switch (dai->id) {
 	case CS43130_ASP_DOP_DAI:
 	case CS43130_XSP_DOP_DAI:
@@ -988,14 +988,13 @@ static int cs43130_hw_free(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&cs43130->clk_mutex);
+	guard(mutex)(&cs43130->clk_mutex);
 	cs43130->clk_req--;
 	if (!cs43130->clk_req) {
 		/* no DAI is currently using clk */
 		cs43130_change_clksrc(component, CS43130_MCLK_SRC_RCO);
 		cs43130_pcm_dsd_mix(false, cs43130->regmap);
 	}
-	mutex_unlock(&cs43130->clk_mutex);
 
 	return 0;
 }
@@ -2132,18 +2131,18 @@ static void cs43130_imp_meas(struct work_struct *wk)
 
 	cs43130->hpload_done = false;
 
-	mutex_lock(&cs43130->clk_mutex);
-	if (!cs43130->clk_req) {
-		/* clk not in use */
-		cs43130_set_pll(component, 0, 0, cs43130->mclk, CS43130_MCLK_22M);
-		if (cs43130->pll_bypass)
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
-		else
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
-	}
+	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (!cs43130->clk_req) {
+			/* clk not in use */
+			cs43130_set_pll(component, 0, 0, cs43130->mclk, CS43130_MCLK_22M);
+			if (cs43130->pll_bypass)
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
+			else
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		}
 
-	cs43130->clk_req++;
-	mutex_unlock(&cs43130->clk_mutex);
+		cs43130->clk_req++;
+	}
 
 	regmap_read(cs43130->regmap, CS43130_INT_STATUS_4, &reg);
 
@@ -2215,12 +2214,11 @@ static void cs43130_imp_meas(struct work_struct *wk)
 	regmap_multi_reg_write(cs43130->regmap, hp_cln_seq,
 			       ARRAY_SIZE(hp_cln_seq));
 
-	mutex_lock(&cs43130->clk_mutex);
+	guard(mutex)(&cs43130->clk_mutex);
 	cs43130->clk_req--;
 	/* clk not in use */
 	if (!cs43130->clk_req)
 		cs43130_change_clksrc(component, CS43130_MCLK_SRC_RCO);
-	mutex_unlock(&cs43130->clk_mutex);
 }
 
 static irqreturn_t cs43130_irq_thread(int irq, void *data)
-- 
2.43.0

