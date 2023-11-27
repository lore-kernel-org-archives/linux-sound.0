Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZu09UNa"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A62EE138
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099357; x=1732635357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zyYJlFkKqB0EVboHd0HVXx2hTiGrmgC9jgqUPqfWYO4=;
  b=XZu09UNaLHv50GqDhIpelEQJo80m2YT+fl5wGxuNcNC/rBysVPZ/ZRT/
   DrjNxO7BCneTQkqhOyGg54ofhwqGZNVHHyNG8TYa3w+Os0d0IoXBQ4G5/
   l/66TYwY1FHnsSsm5UFcT8uZc72qtf3HltrR3MfXkf5FlyrLx+LeWRSib
   ysmq2znE2ul5MkKRtQ5H9TCC/EeT8dXyelJwxPmDkVufMtygmBQTfYEms
   JFCUyPAMlni9iJjwfSariiH+CRVjb0W2GqdwTYyDy2+wlp/gzJaIC4bmm
   Ukb+y/Xpym7A5byaiU1GgPz/rBE274gYBo9y8aj/SaevnIW+nXL+tx9jt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894693"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894693"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:27:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771957225"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771957225"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:27:34 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 27/27] ASoC: Intel: sof_rt5682: use common module for DAI link generation
Date: Mon, 27 Nov 2023 17:26:54 +0200
Message-ID: <20231127152654.28204-28-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Use intel_board module to generate DAI link array and update
num_links field in snd_soc_card structure.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 242 +++++++++-------------------
 1 file changed, 75 insertions(+), 167 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index d353ad758c60..cd50f26d1edb 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -563,52 +563,45 @@ static struct snd_soc_dai_link_component rt5650_components[] = {
 	}
 };
 
-static struct snd_soc_dai_link *
-sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
-			  enum sof_ssp_codec amp_type, int ssp_codec,
-			  int ssp_amp, int dmic_be_num, int hdmi_num,
-			  bool idisp_codec, bool is_legacy_cpu)
+static int
+sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
+			  struct sof_card_private *ctx)
 {
-	struct snd_soc_dai_link *links;
-	int i;
-	int id = 0;
 	int ret;
 
-	links = devm_kcalloc(dev, sof_audio_card_rt5682.num_links,
-			    sizeof(struct snd_soc_dai_link), GFP_KERNEL);
-	if (!links)
-		goto devm_err;
-
-	/* codec SSP */
-	ret = sof_intel_board_set_codec_link(dev, &links[id], id, codec_type,
-					     ssp_codec);
+	ret = sof_intel_board_set_dai_link(dev, card, ctx);
 	if (ret)
-		return NULL;
+		return ret;
+
+	if (!ctx->codec_link) {
+		dev_err(dev, "codec link not available");
+		return -EINVAL;
+	}
 
-	/* codec-specific fields */
-	switch (codec_type) {
+	/* codec-specific fields for headphone codec */
+	switch (ctx->codec_type) {
 	case CODEC_RT5650:
-		links[id].codecs = &rt5650_components[0];
-		links[id].num_codecs = 1;
+		ctx->codec_link->codecs = &rt5650_components[0];
+		ctx->codec_link->num_codecs = 1;
 		break;
 	case CODEC_RT5682:
-		links[id].codecs = rt5682_component;
-		links[id].num_codecs = ARRAY_SIZE(rt5682_component);
+		ctx->codec_link->codecs = rt5682_component;
+		ctx->codec_link->num_codecs = ARRAY_SIZE(rt5682_component);
 		break;
 	case CODEC_RT5682S:
-		links[id].codecs = rt5682s_component;
-		links[id].num_codecs = ARRAY_SIZE(rt5682s_component);
+		ctx->codec_link->codecs = rt5682s_component;
+		ctx->codec_link->num_codecs = ARRAY_SIZE(rt5682s_component);
 		break;
 	default:
-		dev_err(dev, "invalid codec type %d\n", codec_type);
-		return NULL;
+		dev_err(dev, "invalid codec type %d\n", ctx->codec_type);
+		return -EINVAL;
 	}
 
-	links[id].init = sof_rt5682_codec_init;
-	links[id].exit = sof_rt5682_codec_exit;
-	links[id].ops = &sof_rt5682_ops;
+	ctx->codec_link->init = sof_rt5682_codec_init;
+	ctx->codec_link->exit = sof_rt5682_codec_exit;
+	ctx->codec_link->ops = &sof_rt5682_ops;
 
-	if (!is_legacy_cpu) {
+	if (!ctx->rt5682.is_legacy_cpu) {
 		/*
 		 * Currently, On SKL+ platforms MCLK will be turned off in sof
 		 * runtime suspended, and it will go into runtime suspended
@@ -618,130 +611,64 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 		 * avoid the noise.
 		 * It can be removed once we can control MCLK by driver.
 		 */
-		links[id].ignore_pmdown_time = 1;
+		ctx->codec_link->ignore_pmdown_time = 1;
 	}
-	id++;
 
-	/* dmic */
-	if (dmic_be_num > 0) {
-		/* at least we have dmic01 */
-		ret = sof_intel_board_set_dmic_link(dev, &links[id], id,
-						    SOF_DMIC_01);
-		if (ret)
-			return NULL;
-
-		id++;
-	}
+	if (ctx->amp_type == CODEC_NONE)
+		return 0;
 
-	if (dmic_be_num > 1) {
-		/* set up 2 BE links at most */
-		ret = sof_intel_board_set_dmic_link(dev, &links[id], id,
-						    SOF_DMIC_16K);
-		if (ret)
-			return NULL;
-
-		id++;
-	}
-
-	/* HDMI */
-	for (i = 1; i <= hdmi_num; i++) {
-		ret = sof_intel_board_set_intel_hdmi_link(dev, &links[id], id,
-							  i, idisp_codec);
-		if (ret)
-			return NULL;
-
-		id++;
-	}
-
-	/* speaker amp */
-	if (amp_type != CODEC_NONE) {
-		ret = sof_intel_board_set_ssp_amp_link(dev, &links[id], id,
-						       amp_type, ssp_amp);
-		if (ret)
-			return NULL;
-
-		/* codec-specific fields */
-		switch (amp_type) {
-		case CODEC_MAX98357A:
-			max_98357a_dai_link(&links[id]);
-			break;
-		case CODEC_MAX98360A:
-			max_98360a_dai_link(&links[id]);
-			break;
-		case CODEC_MAX98373:
-			links[id].codecs = max_98373_components;
-			links[id].num_codecs = ARRAY_SIZE(max_98373_components);
-			links[id].init = max_98373_spk_codec_init;
-			links[id].ops = &max_98373_ops;
-			break;
-		case CODEC_MAX98390:
-			max_98390_dai_link(dev, &links[id]);
-			break;
-		case CODEC_RT1011:
-			sof_rt1011_dai_link(&links[id]);
-			break;
-		case CODEC_RT1015:
-			sof_rt1015_dai_link(&links[id]);
-			break;
-		case CODEC_RT1015P:
-			sof_rt1015p_dai_link(&links[id]);
-			break;
-		case CODEC_RT1019P:
-			sof_rt1019p_dai_link(&links[id]);
-			break;
-		case CODEC_RT5650:
-			/* use AIF2 to support speaker pipeline */
-			links[id].codecs = &rt5650_components[1];
-			links[id].num_codecs = 1;
-			links[id].init = rt5650_spk_init;
-			links[id].ops = &sof_rt5682_ops;
-			break;
-		default:
-			dev_err(dev, "invalid amp type %d\n", amp_type);
-			return NULL;
-		}
-
-		id++;
-	}
-
-	/* BT audio offload */
-	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
-		int port = (sof_rt5682_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
-				SOF_BT_OFFLOAD_SSP_SHIFT;
-
-		ret = sof_intel_board_set_bt_link(dev, &links[id], id, port);
-		if (ret)
-			return NULL;
-
-		id++;
+	if (!ctx->amp_link) {
+		dev_err(dev, "amp link not available");
+		return -EINVAL;
 	}
 
-	/* HDMI-In SSP */
-	if (sof_rt5682_quirk & SOF_SSP_HDMI_CAPTURE_PRESENT_MASK) {
-		unsigned long hdmi_in_ssp = (sof_rt5682_quirk &
-				SOF_SSP_HDMI_CAPTURE_PRESENT_MASK) >>
-				SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT;
-		int port = 0;
-
-		for_each_set_bit(port, &hdmi_in_ssp, 32) {
-			ret = sof_intel_board_set_hdmi_in_link(dev, &links[id],
-							       id, port);
-			if (ret)
-				return NULL;
-
-			id++;
-		}
+	/* codec-specific fields for speaker amplifier */
+	switch (ctx->amp_type) {
+	case CODEC_MAX98357A:
+		max_98357a_dai_link(ctx->amp_link);
+		break;
+	case CODEC_MAX98360A:
+		max_98360a_dai_link(ctx->amp_link);
+		break;
+	case CODEC_MAX98373:
+		ctx->amp_link->codecs = max_98373_components;
+		ctx->amp_link->num_codecs = ARRAY_SIZE(max_98373_components);
+		ctx->amp_link->init = max_98373_spk_codec_init;
+		ctx->amp_link->ops = &max_98373_ops;
+		break;
+	case CODEC_MAX98390:
+		max_98390_dai_link(dev, ctx->amp_link);
+		break;
+	case CODEC_RT1011:
+		sof_rt1011_dai_link(ctx->amp_link);
+		break;
+	case CODEC_RT1015:
+		sof_rt1015_dai_link(ctx->amp_link);
+		break;
+	case CODEC_RT1015P:
+		sof_rt1015p_dai_link(ctx->amp_link);
+		break;
+	case CODEC_RT1019P:
+		sof_rt1019p_dai_link(ctx->amp_link);
+		break;
+	case CODEC_RT5650:
+		/* use AIF2 to support speaker pipeline */
+		ctx->amp_link->codecs = &rt5650_components[1];
+		ctx->amp_link->num_codecs = 1;
+		ctx->amp_link->init = rt5650_spk_init;
+		ctx->amp_link->ops = &sof_rt5682_ops;
+		break;
+	default:
+		dev_err(dev, "invalid amp type %d\n", ctx->amp_type);
+		return -EINVAL;
 	}
 
-	return links;
-devm_err:
-	return NULL;
+	return 0;
 }
 
 static int sof_audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
-	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
 	int ret;
 
@@ -821,32 +748,13 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	ctx->ssp_codec = sof_rt5682_quirk & SOF_RT5682_SSP_CODEC_MASK;
 
-	/* compute number of dai links */
-	sof_audio_card_rt5682.num_links = 1 + ctx->dmic_be_num + ctx->hdmi_num;
-
-	if (ctx->amp_type != CODEC_NONE)
-		sof_audio_card_rt5682.num_links++;
-
-	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
+	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
 		ctx->bt_offload_present = true;
-		sof_audio_card_rt5682.num_links++;
-	}
 
-	if (sof_rt5682_quirk & SOF_SSP_HDMI_CAPTURE_PRESENT_MASK)
-		sof_audio_card_rt5682.num_links +=
-			hweight32((sof_rt5682_quirk & SOF_SSP_HDMI_CAPTURE_PRESENT_MASK) >>
-					SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT);
-
-	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->codec_type,
-					      ctx->amp_type, ctx->ssp_codec,
-					      ctx->ssp_amp, ctx->dmic_be_num,
-					      ctx->hdmi_num,
-					      ctx->hdmi.idisp_codec,
-					      ctx->rt5682.is_legacy_cpu);
-	if (!dai_links)
-		return -ENOMEM;
-
-	sof_audio_card_rt5682.dai_link = dai_links;
+	/* update dai_link */
+	ret = sof_card_dai_links_create(&pdev->dev, &sof_audio_card_rt5682, ctx);
+	if (ret)
+		return ret;
 
 	/* update codec_conf */
 	switch (ctx->amp_type) {
-- 
2.43.0

