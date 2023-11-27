Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDIspfvK"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 528BF18E
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099322; x=1732635322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3rR6n5ZNQYPIBtRxO9jzEWLu3tZf1nJtXrYJQ6Dzpp8=;
  b=VDIspfvK0NhN6APxeA9P7oNtjzEzqG8DYv+zUgA9X8HjJJlgIfGz+zSB
   H9x4NvXqz7/lQAs1lavo9fMst+wyTPo1Zq6jofSTEudWQ27PBpBx29o4s
   rG7agyDP//4eCZTTErSf/quXx4ZMcPJP163VwGIxui48nIdZWj5ecFkjG
   yyszVLL3rQes5cYcvxI3cRDS+ExCv5EqGAm3Qa8G/yjIov261Up2NrriL
   hRAiJTCl9yPbdE55kt0R5D30RwPB2fawoewaakAHKO8XRW9NhD4PMcrII
   6oG2IeEjpdfPb6X/20yr7zgb9dhU4i2soiof6JM8m8H0pI7Q3s77Mp4dQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894436"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894436"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956455"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771956455"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:38 -0800
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
Subject: [PATCH 07/27] ASoC: Intel: sof_cs42l42: use common module for codec link
Date: Mon, 27 Nov 2023 17:26:34 +0200
Message-ID: <20231127152654.28204-8-peter.ujfalusi@linux.intel.com>
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

Use intel_board module for headphone codec DAI link initialization.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c | 60 ++++++++--------------------
 1 file changed, 16 insertions(+), 44 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 1f760fc4cab2..30e78c20ce6e 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -245,45 +245,6 @@ static int create_spk_amp_dai_links(struct device *dev,
 	return ret;
 }
 
-static int create_hp_codec_dai_links(struct device *dev,
-				     struct snd_soc_dai_link *links,
-				     struct snd_soc_dai_link_component *cpus,
-				     int *id, int ssp_codec)
-{
-	/* codec SSP */
-	links[*id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec",
-					 ssp_codec);
-	if (!links[*id].name)
-		goto devm_err;
-
-	links[*id].id = *id;
-	links[*id].codecs = cs42l42_component;
-	links[*id].num_codecs = ARRAY_SIZE(cs42l42_component);
-	links[*id].platforms = platform_component;
-	links[*id].num_platforms = ARRAY_SIZE(platform_component);
-	links[*id].init = sof_cs42l42_init;
-	links[*id].exit = sof_cs42l42_exit;
-	links[*id].ops = &sof_cs42l42_ops;
-	links[*id].dpcm_playback = 1;
-	links[*id].dpcm_capture = 1;
-	links[*id].no_pcm = 1;
-	links[*id].cpus = &cpus[*id];
-	links[*id].num_cpus = 1;
-
-	links[*id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-						   "SSP%d Pin",
-						   ssp_codec);
-	if (!links[*id].cpus->dai_name)
-		goto devm_err;
-
-	(*id)++;
-
-	return 0;
-
-devm_err:
-	return -ENOMEM;
-}
-
 static int create_bt_offload_dai_links(struct device *dev,
 				       struct snd_soc_dai_link *links,
 				       struct snd_soc_dai_link_component *cpus,
@@ -350,12 +311,23 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 
 		switch (link_type) {
 		case LINK_HP:
-			ret = create_hp_codec_dai_links(dev, links, cpus, &id, ssp_codec);
-			if (ret < 0) {
+			ret = sof_intel_board_set_codec_link(dev, &links[id], id,
+							     CODEC_CS42L42,
+							     ssp_codec);
+			if (ret) {
 				dev_err(dev, "fail to create hp codec dai links, ret %d\n",
 					ret);
 				goto devm_err;
 			}
+
+			/* codec-specific fields */
+			links[id].codecs = cs42l42_component;
+			links[id].num_codecs = ARRAY_SIZE(cs42l42_component);
+			links[id].init = sof_cs42l42_init;
+			links[id].exit = sof_cs42l42_exit;
+			links[id].ops = &sof_cs42l42_ops;
+
+			id++;
 			break;
 		case LINK_SPK:
 			ret = create_spk_amp_dai_links(dev, links, cpus, &id,
@@ -440,7 +412,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int ret, ssp_bt, ssp_amp, ssp_codec;
+	int ret, ssp_bt, ssp_amp;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -475,7 +447,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	ssp_amp = (sof_cs42l42_quirk & SOF_CS42L42_SSP_AMP_MASK) >>
 			SOF_CS42L42_SSP_AMP_SHIFT;
 
-	ssp_codec = sof_cs42l42_quirk & SOF_CS42L42_SSP_CODEC_MASK;
+	ctx->ssp_codec = sof_cs42l42_quirk & SOF_CS42L42_SSP_CODEC_MASK;
 
 	/* compute number of dai links */
 	sof_audio_card_cs42l42.num_links = 1 + ctx->dmic_be_num + ctx->hdmi_num;
@@ -486,7 +458,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 		sof_audio_card_cs42l42.num_links++;
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
-					      ssp_codec, ssp_amp, ssp_bt,
+					      ctx->ssp_codec, ssp_amp, ssp_bt,
 					      ctx->dmic_be_num, ctx->hdmi_num,
 					      ctx->hdmi.idisp_codec);
 	if (!dai_links)
-- 
2.43.0

