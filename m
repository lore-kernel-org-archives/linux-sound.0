Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZgZ45XV5"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E3F1A3
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099323; x=1732635323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F6gSzd2J6qy3sSmOASe8nGnCre5wS91ThSgi8oMSfWU=;
  b=ZgZ45XV5SuEfzOpV0sUPzSVUciZhJfTaOS5P5jClpP2MN30YjTa/7myG
   8//CHOKp353Z5XBhJreEfxIy2tiydlWWxTqnO0WH2PilX6uhQZP3NHXtg
   sXJGD8eUdmifn++UR+SYCjJooKKMxMzPkPAGGetGm14K7kXyVqzbZrNQ4
   Tpa8UVPlMkmifduyPykid3UpDIKeQKHW0lxyIblvcVJm+OQ5jBPrfgmaG
   lT5dStS7V9nvv5nl5X3m2ZMTBCENrLOeaULq8GLv4Eojb26tMw0xuo8Fe
   pjfHMOwDXKTfkpdEDvjz2RiXDPGY1cQjtJnOn2LkY1+nzZD0Z66rlEkx7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894466"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894466"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956550"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771956550"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:44 -0800
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
Subject: [PATCH 09/27] ASoC: Intel: sof_rt5682: use common module for codec link
Date: Mon, 27 Nov 2023 17:26:36 +0200
Message-ID: <20231127152654.28204-10-peter.ujfalusi@linux.intel.com>
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
 sound/soc/intel/boards/sof_rt5682.c | 38 ++++++++---------------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 9723479f43da..8adc82892e2c 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -591,13 +591,12 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 		goto devm_err;
 
 	/* codec SSP */
-	links[id].name = devm_kasprintf(dev, GFP_KERNEL,
-					"SSP%d-Codec", ssp_codec);
-	if (!links[id].name)
-		goto devm_err;
-
-	links[id].id = id;
+	ret = sof_intel_board_set_codec_link(dev, &links[id], id, codec_type,
+					     ssp_codec);
+	if (ret)
+		return NULL;
 
+	/* codec-specific fields */
 	switch (codec_type) {
 	case CODEC_RT5650:
 		links[id].codecs = &rt5650_components[0];
@@ -616,23 +615,11 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 		return NULL;
 	}
 
-	links[id].platforms = platform_component;
-	links[id].num_platforms = ARRAY_SIZE(platform_component);
 	links[id].init = sof_rt5682_codec_init;
 	links[id].exit = sof_rt5682_codec_exit;
 	links[id].ops = &sof_rt5682_ops;
-	links[id].dpcm_playback = 1;
-	links[id].dpcm_capture = 1;
-	links[id].no_pcm = 1;
-	links[id].cpus = &cpus[id];
-	links[id].num_cpus = 1;
-	if (is_legacy_cpu) {
-		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							  "ssp%d-port",
-							  ssp_codec);
-		if (!links[id].cpus->dai_name)
-			goto devm_err;
-	} else {
+
+	if (!is_legacy_cpu) {
 		/*
 		 * Currently, On SKL+ platforms MCLK will be turned off in sof
 		 * runtime suspended, and it will go into runtime suspended
@@ -643,11 +630,6 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 		 * It can be removed once we can control MCLK by driver.
 		 */
 		links[id].ignore_pmdown_time = 1;
-		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							  "SSP%d Pin",
-							  ssp_codec);
-		if (!links[id].cpus->dai_name)
-			goto devm_err;
 	}
 	id++;
 
@@ -819,7 +801,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int ret, ssp_amp, ssp_codec;
+	int ret, ssp_amp;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -888,7 +870,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	ssp_amp = (sof_rt5682_quirk & SOF_RT5682_SSP_AMP_MASK) >>
 			SOF_RT5682_SSP_AMP_SHIFT;
 
-	ssp_codec = sof_rt5682_quirk & SOF_RT5682_SSP_CODEC_MASK;
+	ctx->ssp_codec = sof_rt5682_quirk & SOF_RT5682_SSP_CODEC_MASK;
 
 	/* compute number of dai links */
 	sof_audio_card_rt5682.num_links = 1 + ctx->dmic_be_num + ctx->hdmi_num;
@@ -905,7 +887,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 					SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT);
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->codec_type,
-					      ctx->amp_type, ssp_codec, ssp_amp,
+					      ctx->amp_type, ctx->ssp_codec, ssp_amp,
 					      ctx->dmic_be_num, ctx->hdmi_num,
 					      ctx->hdmi.idisp_codec,
 					      ctx->rt5682.is_legacy_cpu);
-- 
2.43.0

