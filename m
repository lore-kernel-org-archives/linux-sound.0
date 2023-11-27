Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUpp43JG"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 168629B
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099337; x=1732635337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x9AM+WgyoYgtP2zjlWzEH6ser07NVYV1gIcDXcrtdII=;
  b=LUpp43JGrdpAo9bTNuxcjHW24QFD9afmTCP7XHJTuuecQuMWdF+fd4I8
   Y1X4GRM724tkMH1Tn38DCo95JaYBhCtl1Ic/QdWk6BCO0bDtrc3Y/sYV+
   ESgVWmDdTEPFH5F/xJtlqeICgkhvsy0w8YYrgGDwQxPNiCwNDvMoTQYDR
   RzzR8te9WTMjfpQwdW1SgJWmFWVkr4OYD17GUzv4Q/gkNElzVOY997jYG
   21tNYp00PpsNx7yST438UNbZuk9Tu2FhAfDrnWzFblt8byjgcCnLKWcnY
   sqY33a7KTfQXMkMT/f78hL7DKfTDGuXqpm8K8u6SEzN6BZBnz9eOjtkkt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894578"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894578"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:27:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956870"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771956870"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:27:06 -0800
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
Subject: [PATCH 17/27] ASoC: Intel: sof_cs42l42: use common module for BT offload link
Date: Mon, 27 Nov 2023 17:26:44 +0200
Message-ID: <20231127152654.28204-18-peter.ujfalusi@linux.intel.com>
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

Use intel_board module for BT offload DAI link initialization.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c | 79 +++++++---------------------
 1 file changed, 19 insertions(+), 60 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index a8252079d696..c2442bf8ced0 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -138,13 +138,6 @@ static const struct snd_soc_ops sof_cs42l42_ops = {
 	.hw_params = sof_cs42l42_hw_params,
 };
 
-static struct snd_soc_dai_link_component platform_component[] = {
-	{
-		/* name might be overridden during probe */
-		.name = "0000:00:1f.3"
-	}
-};
-
 static int sof_card_late_probe(struct snd_soc_card *card)
 {
 	return sof_intel_board_card_late_probe(card);
@@ -189,52 +182,11 @@ static struct snd_soc_dai_link_component cs42l42_component[] = {
 	}
 };
 
-static int create_bt_offload_dai_links(struct device *dev,
-				       struct snd_soc_dai_link *links,
-				       struct snd_soc_dai_link_component *cpus,
-				       int *id, int ssp_bt)
-{
-	/* bt offload */
-	if (!(sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT))
-		return 0;
-
-	links[*id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT",
-					 ssp_bt);
-	if (!links[*id].name)
-		goto devm_err;
-
-	links[*id].id = *id;
-	links[*id].codecs = &snd_soc_dummy_dlc;
-	links[*id].num_codecs = 1;
-	links[*id].platforms = platform_component;
-	links[*id].num_platforms = ARRAY_SIZE(platform_component);
-
-	links[*id].dpcm_playback = 1;
-	links[*id].dpcm_capture = 1;
-	links[*id].no_pcm = 1;
-	links[*id].cpus = &cpus[*id];
-	links[*id].num_cpus = 1;
-
-	links[*id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-						   "SSP%d Pin",
-						   ssp_bt);
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
 static struct snd_soc_dai_link *
 sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			  int ssp_codec, int ssp_amp, int ssp_bt,
 			  int dmic_be_num, int hdmi_num, bool idisp_codec)
 {
-	struct snd_soc_dai_link_component *cpus;
 	struct snd_soc_dai_link *links;
 	int ret;
 	int id = 0;
@@ -243,9 +195,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 
 	links = devm_kcalloc(dev, sof_audio_card_cs42l42.num_links,
 			    sizeof(struct snd_soc_dai_link), GFP_KERNEL);
-	cpus = devm_kcalloc(dev, sof_audio_card_cs42l42.num_links,
-			    sizeof(struct snd_soc_dai_link_component), GFP_KERNEL);
-	if (!links || !cpus)
+	if (!links)
 		goto devm_err;
 
 	link_seq = (sof_cs42l42_quirk & SOF_CS42L42_DAILINK_MASK) >> SOF_CS42L42_DAILINK_SHIFT;
@@ -350,11 +300,17 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			}
 			break;
 		case LINK_BT:
-			ret = create_bt_offload_dai_links(dev, links, cpus, &id, ssp_bt);
-			if (ret < 0) {
-				dev_err(dev, "fail to create bt offload dai links, ret %d\n",
-					ret);
-				goto devm_err;
+			if (sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT) {
+				ret = sof_intel_board_set_bt_link(dev,
+								  &links[id], id,
+								  ssp_bt);
+				if (ret) {
+					dev_err(dev, "fail to create bt offload dai links, ret %d\n",
+						ret);
+					goto devm_err;
+				}
+
+				id++;
 			}
 			break;
 		case LINK_NONE:
@@ -377,7 +333,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int ret, ssp_bt;
+	int ret;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -406,7 +362,8 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "sof_cs42l42_quirk = %lx\n", sof_cs42l42_quirk);
 
-	ssp_bt = (sof_cs42l42_quirk & SOF_CS42L42_SSP_BT_MASK) >>
+	/* port number of peripherals attached to ssp interface */
+	ctx->ssp_bt = (sof_cs42l42_quirk & SOF_CS42L42_SSP_BT_MASK) >>
 			SOF_CS42L42_SSP_BT_SHIFT;
 
 	ctx->ssp_amp = (sof_cs42l42_quirk & SOF_CS42L42_SSP_AMP_MASK) >>
@@ -419,12 +376,14 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	if (ctx->amp_type != CODEC_NONE)
 		sof_audio_card_cs42l42.num_links++;
-	if (sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT)
+	if (sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT) {
+		ctx->bt_offload_present = true;
 		sof_audio_card_cs42l42.num_links++;
+	}
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
 					      ctx->ssp_codec, ctx->ssp_amp,
-					      ssp_bt, ctx->dmic_be_num,
+					      ctx->ssp_bt, ctx->dmic_be_num,
 					      ctx->hdmi_num,
 					      ctx->hdmi.idisp_codec);
 	if (!dai_links)
-- 
2.43.0

