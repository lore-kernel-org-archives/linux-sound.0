Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D0D160880
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838584; cv=none; b=PgrHDJUA3WzGu+fT5DccCnCHUjPW+upZo0iXhuujJ5DAb0YztIXCjzKrGxjq5gY6DUs5ataaEUHfJtJj+/RA9GuwKeqyG8eM6agB6Zx+QbL6AfvhW+rwq/ghSGZF/eJ+ielVjff69Bo2EP4nEV50bGsGMLcJClQBaT5tUA0MjLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838584; c=relaxed/simple;
	bh=lw+prEpe7Ix+5pRhOT5340vUgwTIFSCUbquZ/PYAjDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POZRxijX83F0vAUFuMnxegP9/ZBVClG5Wj1cko3nXHZ2WLz70Ls6B/XXnIdx97LmKPYPo4z4IOu1/2zJbHhRgm7RT6zeEf800fTjlz5yq6VIa4XIowZZE3f0oDvt6i790mT3Ypg6ezcq9Qbin9beMI2QhmPxBcNS2pM3WpeaI/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c2+1xVsz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c2+1xVsz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838583; x=1748374583;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lw+prEpe7Ix+5pRhOT5340vUgwTIFSCUbquZ/PYAjDI=;
  b=c2+1xVszT0lufQYdTctQkyZcmBTYefbOL85PQWBBoFFHFPUe8q0RoUtu
   aDLsdn/WbdrEb0XSrs90MVu1qn76VEfGZtBvbCg0o07IocB3RNdALewSC
   hf0JvNT5+M0NXlIk8Zs+JCA5NYzq4yKfgZ49RKzGqe3+WhN1GFlRnfXBA
   NlMQh8yUae87UUwhTb3Yv/mvlWYv7hWLi5haOeS1Y2Cy9xDK77SdS4QAP
   I1M8JeRJPqSw3TnMkY9L8aWY1ParbrFvSZ8dyrmwPOR0PY3uzGiJBKKfs
   DD6olQkGZKbAazdWJ+oCE8zTWQ/UA00QQuQYMpA+RMR7ZH3lUoRWPl6AU
   g==;
X-CSE-ConnectionGUID: fRTYDUhmR32HGNtFuQNB9g==
X-CSE-MsgGUID: hZ2KZQI7QCiGIgPCMofvRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339399"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13339399"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:22 -0700
X-CSE-ConnectionGUID: jY6XLPGMRjWg04bM6vQt4w==
X-CSE-MsgGUID: qTBBpu8UQb+QOmigmDFwIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58029798"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 17/18] ASoC: Intel: sof_da7219: remove local max98373 ops
Date: Mon, 27 May 2024 14:35:51 -0500
Message-ID: <20240527193552.165567-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Since maxim-module could detect tdm slot number in runtime, we could
remove local ops and use maxim-module to handle max98373.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.h |  2 -
 sound/soc/intel/boards/sof_da7219.c        | 44 ----------------------
 2 files changed, 46 deletions(-)

diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index dfcc2c5c25cc..faba847bb7c9 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -86,12 +86,10 @@ enum {
 /*
  * sof_da7219_private: private data for da7219 machine driver
  *
- * @is_jsl_board: true for JSL boards
  * @mclk_en: true for mclk pin is connected
  * @pll_bypass: true for PLL bypass mode
  */
 struct sof_da7219_private {
-	bool is_jsl_board;
 	bool mclk_en;
 	bool pll_bypass;
 };
diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 886771e9b9d6..0e3c352a1672 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -178,40 +178,6 @@ static void da7219_codec_exit(struct snd_soc_pcm_runtime *rtd)
 	snd_soc_component_set_jack(component, NULL, NULL);
 }
 
-static int max98373_hw_params(struct snd_pcm_substream *substream,
-			      struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *runtime = snd_soc_substream_to_rtd(substream);
-	int ret, j;
-
-	for (j = 0; j < runtime->dai_link->num_codecs; j++) {
-		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, j);
-
-		if (!strcmp(codec_dai->component->name, MAX_98373_DEV0_NAME)) {
-			/* vmon_slot_no = 0 imon_slot_no = 1 for TX slots */
-			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x3, 3, 4, 16);
-			if (ret < 0) {
-				dev_err(runtime->dev, "DEV0 TDM slot err:%d\n", ret);
-				return ret;
-			}
-		}
-		if (!strcmp(codec_dai->component->name, MAX_98373_DEV1_NAME)) {
-			/* vmon_slot_no = 2 imon_slot_no = 3 for TX slots */
-			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0xC, 3, 4, 16);
-			if (ret < 0) {
-				dev_err(runtime->dev, "DEV1 TDM slot err:%d\n", ret);
-				return ret;
-			}
-		}
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops max98373_ops = {
-	.hw_params = max98373_hw_params,
-};
-
 static int card_late_probe(struct snd_soc_card *card)
 {
 	return sof_intel_board_card_late_probe(card);
@@ -276,14 +242,6 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 		break;
 	case CODEC_MAX98373:
 		max_98373_dai_link(dev, ctx->amp_link);
-
-		if (ctx->da7219.is_jsl_board) {
-			ctx->amp_link->ops = &max98373_ops; /* use local ops */
-		} else {
-			/* TBD: implement the amp for later platform */
-			dev_err(dev, "max98373 not support yet\n");
-			return -EINVAL;
-		}
 		break;
 	case CODEC_MAX98390:
 		max_98390_dai_link(dev, ctx->amp_link);
@@ -388,8 +346,6 @@ static int audio_probe(struct platform_device *pdev)
 			break;
 		}
 	} else if (board_quirk & SOF_DA7219_JSL_BOARD) {
-		ctx->da7219.is_jsl_board = true;
-
 		/* overwrite the DAI link order for JSL boards */
 		ctx->link_order_overwrite = JSL_LINK_ORDER;
 
-- 
2.43.0

