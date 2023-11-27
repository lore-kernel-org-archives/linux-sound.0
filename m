Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OP1z5SG0"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5A6189
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099327; x=1732635327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cUCdwnqvq+rKGvZnTNh7cotebEBqefzwJ9UySshL8ZQ=;
  b=OP1z5SG03/V+CHHRUF9rm0CtTxkvke/6JVKN6T+QCFaZSLR196l9tKnN
   FhJM0VezFZI3dgRSmXhjGys9fML0R07FLX8gx1tSYy6d2rZYYld9QloAE
   uYLNHIyazmzqz7mKgeLeYqnW0igmQ9wUbLqNSBAtxZRyJKzwT+XrmYCIy
   +kPSKNup+p5zJY+df005Hlm+VYmXaGExxwy8SoTCEeT+P9creol/P07x3
   QReLqgP48nfqC5b1tbqX9paT+XnH+5UGwRHBz2xv2+OgYSCPkYDK7MyP6
   bvDfe121ylMprOa4FEYDvb05Cw5MyYRdOLqsLME/d15WYervId/aLnDfP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894488"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894488"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956652"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771956652"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:50 -0800
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
Subject: [PATCH 11/27] ASoC: Intel: sof_cs42l42: use common module for amp link
Date: Mon, 27 Nov 2023 17:26:38 +0200
Message-ID: <20231127152654.28204-12-peter.ujfalusi@linux.intel.com>
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

Use intel_board module for speaker amplifier DAI link initialization.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c | 98 +++++++++-------------------
 1 file changed, 32 insertions(+), 66 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 30e78c20ce6e..a8252079d696 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -189,62 +189,6 @@ static struct snd_soc_dai_link_component cs42l42_component[] = {
 	}
 };
 
-static int create_spk_amp_dai_links(struct device *dev,
-				    struct snd_soc_dai_link *links,
-				    struct snd_soc_dai_link_component *cpus,
-				    int *id, enum sof_ssp_codec amp_type,
-				    int ssp_amp)
-{
-	int ret = 0;
-
-	/* speaker amp */
-	if (amp_type == CODEC_NONE)
-		return 0;
-
-	links[*id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec",
-					 ssp_amp);
-	if (!links[*id].name) {
-		ret = -ENOMEM;
-		goto devm_err;
-	}
-
-	links[*id].id = *id;
-
-	switch (amp_type) {
-	case CODEC_MAX98357A:
-		max_98357a_dai_link(&links[*id]);
-		break;
-	case CODEC_MAX98360A:
-		max_98360a_dai_link(&links[*id]);
-		break;
-	default:
-		dev_err(dev, "invalid amp type %d\n", amp_type);
-		return -EINVAL;
-	}
-
-	links[*id].platforms = platform_component;
-	links[*id].num_platforms = ARRAY_SIZE(platform_component);
-	links[*id].dpcm_playback = 1;
-	/* firmware-generated echo reference */
-	links[*id].dpcm_capture = 1;
-
-	links[*id].no_pcm = 1;
-	links[*id].cpus = &cpus[*id];
-	links[*id].num_cpus = 1;
-
-	links[*id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-						   "SSP%d Pin", ssp_amp);
-	if (!links[*id].cpus->dai_name) {
-		ret = -ENOMEM;
-		goto devm_err;
-	}
-
-	(*id)++;
-
-devm_err:
-	return ret;
-}
-
 static int create_bt_offload_dai_links(struct device *dev,
 				       struct snd_soc_dai_link *links,
 				       struct snd_soc_dai_link_component *cpus,
@@ -330,12 +274,33 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			id++;
 			break;
 		case LINK_SPK:
-			ret = create_spk_amp_dai_links(dev, links, cpus, &id,
-						       amp_type, ssp_amp);
-			if (ret < 0) {
-				dev_err(dev, "fail to create spk amp dai links, ret %d\n",
-					ret);
-				goto devm_err;
+			if (amp_type != CODEC_NONE) {
+				ret = sof_intel_board_set_ssp_amp_link(dev,
+								       &links[id],
+								       id,
+								       amp_type,
+								       ssp_amp);
+				if (ret) {
+					dev_err(dev, "fail to create spk amp dai links, ret %d\n",
+						ret);
+					goto devm_err;
+				}
+
+				/* codec-specific fields */
+				switch (amp_type) {
+				case CODEC_MAX98357A:
+					max_98357a_dai_link(&links[id]);
+					break;
+				case CODEC_MAX98360A:
+					max_98360a_dai_link(&links[id]);
+					break;
+				default:
+					dev_err(dev, "invalid amp type %d\n",
+						amp_type);
+					goto devm_err;
+				}
+
+				id++;
 			}
 			break;
 		case LINK_DMIC:
@@ -412,7 +377,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int ret, ssp_bt, ssp_amp;
+	int ret, ssp_bt;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -444,7 +409,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	ssp_bt = (sof_cs42l42_quirk & SOF_CS42L42_SSP_BT_MASK) >>
 			SOF_CS42L42_SSP_BT_SHIFT;
 
-	ssp_amp = (sof_cs42l42_quirk & SOF_CS42L42_SSP_AMP_MASK) >>
+	ctx->ssp_amp = (sof_cs42l42_quirk & SOF_CS42L42_SSP_AMP_MASK) >>
 			SOF_CS42L42_SSP_AMP_SHIFT;
 
 	ctx->ssp_codec = sof_cs42l42_quirk & SOF_CS42L42_SSP_CODEC_MASK;
@@ -458,8 +423,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 		sof_audio_card_cs42l42.num_links++;
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
-					      ctx->ssp_codec, ssp_amp, ssp_bt,
-					      ctx->dmic_be_num, ctx->hdmi_num,
+					      ctx->ssp_codec, ctx->ssp_amp,
+					      ssp_bt, ctx->dmic_be_num,
+					      ctx->hdmi_num,
 					      ctx->hdmi.idisp_codec);
 	if (!dai_links)
 		return -ENOMEM;
-- 
2.43.0

