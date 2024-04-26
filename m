Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1403915686F
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145149; cv=none; b=BbvHiq+vABFaXZ0O8ITQRWjm+mqe8oMQbRYVCZCWHrFwvWxJXCrl575okuHm2AJkBYz44jtXUFrA58lJEt0M2+K5/d6yPr5Ip1f2kGSoGfnMHs3SJlE0ysmkH2/dDB8jc3N6hoIN9JHh0RmyCYTEU1BEAOPQ5e3N71ZiFRO3deQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145149; c=relaxed/simple;
	bh=EGWzmge88Dt6b6FeIkhkTvyXxuxkbPfnR9TrZnhRxa8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PLPgfAIXI+TGInZhMV9DcAu8Zkrd6me+Jjc3wKvxZ3VCISOMeeKtcoaLCjkqbdvAvUqB/jOrCiJwqsEtqitXF972n5Y56kyN2LO/FGL+FEElIeOpPDWWed3Jc/LJdP7PwX2EBObs677ImDy3LpPxvOZeFBjrwCHrvFSOb618las=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msl5N7dp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msl5N7dp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145148; x=1745681148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EGWzmge88Dt6b6FeIkhkTvyXxuxkbPfnR9TrZnhRxa8=;
  b=msl5N7dpj5eqOvlCscsnDy/WdQtOV/Nx4+czQnA7JhTLUgd0dj+hR4hE
   WlHAUkgBznPnpI9QqySHvqrJAJ8WTilCN3XFbG27J4+JLXGpd766MR5no
   M44oux8WYQ57YqIa4AiV6vupBX1yEi0Agif1wKa3SLE3s3OgldGX4p4gh
   U/De6+kEgDKNX1nCCYp6c8TeMbNzK105+qwqReBXSe3HmjrhAngX87EZk
   6dEOQBj7jqEHOHkcPI0prz12S6hqqOxDdvVjSbAfkXCIkjIpWWr5+ta/M
   qfchjqPQF38UWCO3GXNOgLHMrgRILwKIeBfWMlbARPkeuIh+HD9+m6UpH
   g==;
X-CSE-ConnectionGUID: nC9L/YjRQh+NeIuBI2Y6Fw==
X-CSE-MsgGUID: a6g2NVoRS6mROzOCM90k4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291332"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291332"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:48 -0700
X-CSE-ConnectionGUID: CEsELYaVR2aggWHN2ZH3Yg==
X-CSE-MsgGUID: JLsWVBG+S2SuA1XpuIIlog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259587"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 14/23] ASoC: Intel: sof_rt5682: add glk_rt5682_def for glk boards
Date: Fri, 26 Apr 2024 10:25:20 -0500
Message-Id: <20240426152529.38345-15-pierre-louis.bossart@linux.intel.com>
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

Add the board config glk_rt5682_def to rt5682 machine driver for all
glk boards using default SSP port allocation (headphone codec on SSP2,
speaker amplifiers on SSP1).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 48 +++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 1e70ce469650..80ecf31c936a 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -635,6 +635,14 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 	return 0;
 }
 
+#define GLK_LINK_ORDER	SOF_LINK_ORDER(SOF_LINK_AMP,         \
+					SOF_LINK_CODEC,      \
+					SOF_LINK_DMIC01,     \
+					SOF_LINK_IDISP_HDMI, \
+					SOF_LINK_NONE,       \
+					SOF_LINK_NONE,       \
+					SOF_LINK_NONE)
+
 static int sof_audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
@@ -676,24 +684,34 @@ static int sof_audio_probe(struct platform_device *pdev)
 			ctx->amp_type = CODEC_RT5650;
 	}
 
-	if (ctx->amp_type == CODEC_RT1011 && soc_intel_is_cml()) {
-		/* backward-compatible with existing cml devices */
-		card_name = devm_kstrdup(&pdev->dev, "cml_rt1011_rt5682",
-					 GFP_KERNEL);
-		if (!card_name)
-			return -ENOMEM;
-
-		sof_audio_card_rt5682.name = card_name;
-	}
+	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
+		ctx->hdmi.idisp_codec = true;
 
 	if (is_legacy_cpu) {
 		ctx->rt5682.is_legacy_cpu = true;
 		ctx->dmic_be_num = 0;
 		/* HDMI is not supported by SOF on Baytrail/CherryTrail */
 		ctx->hdmi_num = 0;
-	} else {
-		if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
-			ctx->hdmi.idisp_codec = true;
+	} else if (soc_intel_is_glk()) {
+		/* dmic16k not support */
+		ctx->dmic_be_num = 1;
+
+		/* overwrite the DAI link order for GLK boards */
+		ctx->link_order_overwrite = GLK_LINK_ORDER;
+	} else if (soc_intel_is_cml()) {
+		/* backward-compatible with existing devices */
+		switch (ctx->amp_type) {
+		case CODEC_RT1011:
+			card_name = devm_kstrdup(&pdev->dev, "cml_rt1011_rt5682",
+						 GFP_KERNEL);
+			if (!card_name)
+				return -ENOMEM;
+
+			sof_audio_card_rt5682.name = card_name;
+			break;
+		default:
+			break;
+		}
 	}
 
 	/* need to get main clock from pmc */
@@ -768,6 +786,12 @@ static const struct platform_device_id board_ids[] = {
 	{
 		.name = "sof_rt5682",
 	},
+	{
+		.name = "glk_rt5682_def",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_SSP_PORT_CODEC(2) |
+					SOF_SSP_PORT_AMP(1)),
+	},
 	{
 		.name = "cml_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-- 
2.40.1

