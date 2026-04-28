Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220CF2DEA6E;
	Tue, 28 Apr 2026 07:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777362485; cv=none; b=kMaF1uAnO5SPv8IEKsjtGrx7pcsLcKlw5nanGh7whwVHPsbKCJjj8iIQ4M9adDrCIBg6ivaf2PvP6HBQPlVeCt+fpzELF3X812aoIMVa9cwwA7lccCM9CwsUfWrOKO2Z7IoIx+y5j1s+m+SP4Y8Uxm9pdhcfB4SnWcZ7DhAG4nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777362485; c=relaxed/simple;
	bh=lLZAZuy4nZJDA0KHj1tae8m3E4BtbP47ASpZXHL9ryw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rHKZWAQTBHdoYiu2oXCBfC3PBji/xr+/6MIpJXLulIFpNnpRhqWGONTtbQcG/FoP44Vg2mUKQ2lZIkWTmYbijesC7ePCd3dwKecciJ3iXloFgQ9Z9s/yccnEkv3AipcPjnevYzzr9awf3tQUAz7Tn43ficyZhl5kqKHFvOrPtu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLwi0is2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLwi0is2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777362484; x=1808898484;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lLZAZuy4nZJDA0KHj1tae8m3E4BtbP47ASpZXHL9ryw=;
  b=JLwi0is2LcXIb5JOLtwvndmy4+50k8ohbd+sLHNruhF4w84mPQwbfTo7
   9uHOsntgVQ7hrAzbWNBJRu39U9fUpakFBxfl6DW5eNA7Pr6qMpJvltu+V
   PoGHhUEm7fHdasxd4xeKqtR6uXQ8Pc/0QncmKF47QTBlAp5yZL4y4g04z
   zleqmC3+58vCr0gc1Il8NHt6xoxVL5v+YlhLET9h2Ldf1nn9M9f3mhRJy
   +YbwCVFFTVUUMXTNJT1bOsSIpyYgRcNu5EMDV1acMBlAaeRm5D140PaAT
   eBGlbkl8nHKJDV2Yu5TVPUue3YhvCGyoHu0WCSK4wAhAO+RHxJ+FeOFNR
   w==;
X-CSE-ConnectionGUID: HNEF2JnLSr2ByQwv/k6TxQ==
X-CSE-MsgGUID: bciu/1b4TYy7XT+daDBnLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78247198"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="78247198"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 00:48:04 -0700
X-CSE-ConnectionGUID: Lz8doK4sS72Zdl8JB4OuCg==
X-CSE-MsgGUID: ZVYQvHPzSJ2pEMRI86aYZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="257408291"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 28 Apr 2026 00:48:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id DDCF495; Tue, 28 Apr 2026 09:47:59 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 1/1] ASoC: Intel: cht_bsw_rt5672: Drop unneeded NULL checks
Date: Tue, 28 Apr 2026 09:47:58 +0200
Message-ID: <20260428074758.3087437-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the commit 7735bce05a9c ("ASoC: Intel: boards: use devm_clk_get()
unconditionally") the driver assumes that mclk is always provided, hence
no need to check for it being NULL anymore.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/intel/boards/cht_bsw_rt5672.c | 56 +++++++++++--------------
 1 file changed, 24 insertions(+), 32 deletions(-)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index fd4cefd298d2..9f59bee88e6f 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -63,13 +63,11 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 	}
 
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
-		if (ctx->mclk) {
-			ret = clk_prepare_enable(ctx->mclk);
-			if (ret < 0) {
-				dev_err(card->dev,
-					"could not configure MCLK state: %d\n", ret);
-				return ret;
-			}
+		ret = clk_prepare_enable(ctx->mclk);
+		if (ret < 0) {
+			dev_err(card->dev,
+				"could not configure MCLK state: %d\n", ret);
+			return ret;
 		}
 
 		/* set codec PLL source to the 19.2MHz platform clock (MCLK) */
@@ -77,8 +75,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 				CHT_PLAT_CLK_3_HZ, 48000 * 512);
 		if (ret < 0) {
 			dev_err(card->dev, "can't set codec pll: %d\n", ret);
-			if (ctx->mclk)
-				clk_disable_unprepare(ctx->mclk);
+			clk_disable_unprepare(ctx->mclk);
 			return ret;
 		}
 
@@ -87,8 +84,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 			48000 * 512, SND_SOC_CLOCK_IN);
 		if (ret < 0) {
 			dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
-			if (ctx->mclk)
-				clk_disable_unprepare(ctx->mclk);
+			clk_disable_unprepare(ctx->mclk);
 			return ret;
 		}
 	} else {
@@ -104,8 +100,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 			return ret;
 		}
 
-		if (ctx->mclk)
-			clk_disable_unprepare(ctx->mclk);
+		clk_disable_unprepare(ctx->mclk);
 	}
 	return 0;
 }
@@ -244,28 +239,25 @@ static int cht_codec_init(struct snd_soc_pcm_runtime *runtime)
 	snd_jack_set_key(ctx->headset.jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
 
 	rt5670_set_jack_detect(component, &ctx->headset);
-	if (ctx->mclk) {
-		/*
-		 * The firmware might enable the clock at
-		 * boot (this information may or may not
-		 * be reflected in the enable clock register).
-		 * To change the rate we must disable the clock
-		 * first to cover these cases. Due to common
-		 * clock framework restrictions that do not allow
-		 * to disable a clock that has not been enabled,
-		 * we need to enable the clock first.
-		 */
-		ret = clk_prepare_enable(ctx->mclk);
-		if (!ret)
-			clk_disable_unprepare(ctx->mclk);
 
-		ret = clk_set_rate(ctx->mclk, CHT_PLAT_CLK_3_HZ);
+	/*
+	 * The firmware might enable the clock at boot (this information
+	 * may or may not be reflected in the enable clock register).
+	 * To change the rate we must disable the clock first to cover
+	 * these cases. Due to Common Clock Framework restrictions that
+	 * do not allow to disable a clock that has not been enabled, we
+	 * need to enable the clock first.
+	 */
+	ret = clk_prepare_enable(ctx->mclk);
+	if (!ret)
+		clk_disable_unprepare(ctx->mclk);
 
-		if (ret) {
-			dev_err(runtime->dev, "unable to set MCLK rate\n");
-			return ret;
-		}
+	ret = clk_set_rate(ctx->mclk, CHT_PLAT_CLK_3_HZ);
+	if (ret) {
+		dev_err(runtime->dev, "unable to set MCLK rate\n");
+		return ret;
 	}
+
 	return 0;
 }
 
-- 
2.50.1

