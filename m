Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54F7148FE2
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145152; cv=none; b=lN4LT+/84DClHtJNtGBQJxOgocFKA/GA7cURQ8I6/U0ayni+c2U3Nlu/bY5IHDNrYqQKcZc13CYItoPj2oDkTVegs9ubDSvxW2dK9PZhsdTQFQ0T/v6hP8WGg+rkOWzX+qas8ZOiDQ+MneOWacxPFv3e0zHOFXO4H7c8UDmuOZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145152; c=relaxed/simple;
	bh=VAgCgLZEmIjB0JFQL5pu1SrjXkf9g15d+++Tsl+Inyc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fuv6Rsq5OG5qD/eXat8LHulHMDcXWk8H0Vl6oAD/c4RKqTCRIsbi57KHs9ckW57Thj4d6KRe0aqJhqp+dsmuY8nMzrNsi9x6oRF2xPclOHwkTY7u8AGE37kRI3dZPysetNKymZF/RsVY3DJFC58Skt/X1xVwJF+Olt1B8oh8toE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZ7E75ff; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZ7E75ff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145151; x=1745681151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VAgCgLZEmIjB0JFQL5pu1SrjXkf9g15d+++Tsl+Inyc=;
  b=JZ7E75ffJK33pCFQFh+f7V7UB7S+GPL4vubM/UjWddg7N5HGpjc2D6s8
   mm3yfws9tYRTm45H2dcJ8tUkl9Tz306CnPDCJAeZDL1ZNMfc+SIhPdhTU
   qVX9ElUIZbXKwjsVtlxf3uQeGigca5Ia+QnX/+r0U/0bWAIb36s2Ttb/J
   7+VC0Yee24wmj3CzR1Ak7lZfaTnAMsOjx+qHMLE2JulJJVw56iAhY2hNH
   QHOtTF9aAH8jRCk/ndltg7KD7cCZT5Poo5ZefADIl3kIJUdGf1wUyXxyl
   mM1MPzfhWXhL5BNC813KO8Zwn8R0BupfXf3KXWbI8Fu88baysqj0bR01m
   w==;
X-CSE-ConnectionGUID: CiSNvaLRTpOzFhnH4pd68Q==
X-CSE-MsgGUID: ClKd0kQUSoKpluqpq5RQlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291351"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291351"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:50 -0700
X-CSE-ConnectionGUID: mhi7Z60CR7WpTssahVEpZw==
X-CSE-MsgGUID: usdiyUIYT7ew0C2ebxJouw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259602"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 18/23] ASoC: Intel: sof-rt5682: remove SOF_RT5682_MCLK_BYTCHT_EN
Date: Fri, 26 Apr 2024 10:25:24 -0500
Message-Id: <20240426152529.38345-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

We don't need this quirk flag since 'is_legacy_cpu' will be true if
this is a BYT/CHT board.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 39 ++++++++++++++---------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 654c2428f625..4c6dfe632edf 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -30,7 +30,6 @@
 
 /* Driver-specific board quirks: from bit 0 to 7 */
 #define SOF_RT5682_MCLK_EN			BIT(0)
-#define SOF_RT5682_MCLK_BYTCHT_EN		BIT(1)
 
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
@@ -206,7 +205,7 @@ static int sof_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 			}
 		}
 
-		if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
+		if (ctx->rt5682.is_legacy_cpu) {
 			/*
 			 * The firmware might enable the clock at
 			 * boot (this information may or may not
@@ -279,7 +278,7 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 	int pll_id, pll_source, pll_in, pll_out, clk_id, ret;
 
 	if (ctx->rt5682.mclk_en) {
-		if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
+		if (ctx->rt5682.is_legacy_cpu) {
 			ret = clk_prepare_enable(ctx->rt5682.mclk);
 			if (ret < 0) {
 				dev_err(rtd->dev,
@@ -661,7 +660,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 		/* default quirk for legacy cpu */
 		sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
-				   SOF_RT5682_MCLK_BYTCHT_EN |
 				   SOF_SSP_PORT_CODEC(2);
 	}
 
@@ -728,26 +726,27 @@ static int sof_audio_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (sof_rt5682_quirk & SOF_RT5682_MCLK_EN)
+	if (sof_rt5682_quirk & SOF_RT5682_MCLK_EN) {
 		ctx->rt5682.mclk_en = true;
 
-	/* need to get main clock from pmc */
-	if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
-		ctx->rt5682.mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
-		if (IS_ERR(ctx->rt5682.mclk)) {
-			ret = PTR_ERR(ctx->rt5682.mclk);
+		/* need to get main clock from pmc */
+		if (ctx->rt5682.is_legacy_cpu) {
+			ctx->rt5682.mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
+			if (IS_ERR(ctx->rt5682.mclk)) {
+				ret = PTR_ERR(ctx->rt5682.mclk);
 
-			dev_err(&pdev->dev,
-				"Failed to get MCLK from pmc_plt_clk_3: %d\n",
-				ret);
-			return ret;
-		}
+				dev_err(&pdev->dev,
+					"Failed to get MCLK from pmc_plt_clk_3: %d\n",
+					ret);
+				return ret;
+			}
 
-		ret = clk_prepare_enable(ctx->rt5682.mclk);
-		if (ret < 0) {
-			dev_err(&pdev->dev,
-				"could not configure MCLK state");
-			return ret;
+			ret = clk_prepare_enable(ctx->rt5682.mclk);
+			if (ret < 0) {
+				dev_err(&pdev->dev,
+					"could not configure MCLK state");
+				return ret;
+			}
 		}
 	}
 
-- 
2.40.1

