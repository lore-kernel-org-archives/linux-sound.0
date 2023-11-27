Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hU3yd2ck"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 836829B
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099351; x=1732635351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SOnk6ihrh+pfMoZ1m7lDiOTUxVZO5qLcx7QmL0ACqBo=;
  b=hU3yd2ckwuJvwCNuHTBb8mkwMAvBC+0XRoyadsSYaEM14LxP2laxdlV3
   LdhZThHpidOgi5MKa6qoQ/Vixao1DYbN1kzvHQk/QwXCqbGgoNgv4kZ6f
   ONWzQMl2NPBiPwDUGR1F2iM8zkjXS6xtqvvllXDbI04cvYn6eCj+a+WuQ
   bNkaFvn28V1Ly9A9Ota5b6MVWcMVXUkExXYQmaYJqUdGkF9ZW4wJyKqBz
   GFO1dmO9TMGATacm7SNXMVCYRapm1J92xCd3+6FV2mlYIz/BtGXTkQgrB
   /BWikzCZpjtetFEBliAq94z/JY5R5QTaqNnvYxWT58enyGO87dxlVHy/M
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894654"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894654"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:27:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771957110"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771957110"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:27:23 -0800
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
Subject: [PATCH 23/27] ASoC: Intel: sof_rt5682: use common module for HDMI-In link
Date: Mon, 27 Nov 2023 17:26:50 +0200
Message-ID: <20231127152654.28204-24-peter.ujfalusi@linux.intel.com>
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

Use intel_board module for HDMI-In DAI link initialization.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Balamurugan C <balamurugan.c@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 37 +++++++----------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 22dd85129a51..d353ad758c60 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -463,13 +463,6 @@ static struct snd_soc_ops sof_rt5682_ops = {
 	.hw_params = sof_rt5682_hw_params,
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
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
@@ -576,18 +569,14 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 			  int ssp_amp, int dmic_be_num, int hdmi_num,
 			  bool idisp_codec, bool is_legacy_cpu)
 {
-	struct snd_soc_dai_link_component *cpus;
 	struct snd_soc_dai_link *links;
 	int i;
 	int id = 0;
 	int ret;
-	int hdmi_id_offset = 0;
 
 	links = devm_kcalloc(dev, sof_audio_card_rt5682.num_links,
 			    sizeof(struct snd_soc_dai_link), GFP_KERNEL);
-	cpus = devm_kcalloc(dev, sof_audio_card_rt5682.num_links,
-			    sizeof(struct snd_soc_dai_link_component), GFP_KERNEL);
-	if (!links || !cpus)
+	if (!links)
 		goto devm_err;
 
 	/* codec SSP */
@@ -735,22 +724,11 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 		int port = 0;
 
 		for_each_set_bit(port, &hdmi_in_ssp, 32) {
-			links[id].cpus = &cpus[id];
-			links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-								  "SSP%d Pin", port);
-			if (!links[id].cpus->dai_name)
-				return NULL;
-			links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-HDMI", port);
-			if (!links[id].name)
+			ret = sof_intel_board_set_hdmi_in_link(dev, &links[id],
+							       id, port);
+			if (ret)
 				return NULL;
-			links[id].id = id + hdmi_id_offset;
-			links[id].codecs = &snd_soc_dummy_dlc;
-			links[id].num_codecs = 1;
-			links[id].platforms = platform_component;
-			links[id].num_platforms = ARRAY_SIZE(platform_component);
-			links[id].dpcm_capture = 1;
-			links[id].no_pcm = 1;
-			links[id].num_cpus = 1;
+
 			id++;
 		}
 	}
@@ -831,7 +809,10 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "sof_rt5682_quirk = %lx\n", sof_rt5682_quirk);
 
-	/* port number of peripherals attached to ssp interface */
+	/* port number/mask of peripherals attached to ssp interface */
+	ctx->ssp_mask_hdmi_in = (sof_rt5682_quirk & SOF_SSP_HDMI_CAPTURE_PRESENT_MASK) >>
+			SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT;
+
 	ctx->ssp_bt = (sof_rt5682_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
 			SOF_BT_OFFLOAD_SSP_SHIFT;
 
-- 
2.43.0

