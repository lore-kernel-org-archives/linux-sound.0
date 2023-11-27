Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjnALKY7"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC92C138
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099338; x=1732635338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2/PlK81RDS/YXT5w7vXXLMG5XVn5aYXtHWj/zVHQOHE=;
  b=WjnALKY7DTeFvudMvcRdUatEJUsJSIgPGAVpZkiPB1KlR/eCJ2vJmHU8
   L47cDHwGGedJrdGi3lCvTM49oWm49lhS38XNfaptj25GE1NjmO5wZgZYC
   uaBlSrv3wAFIbFEI0q/qhFWBqI/4hyc06+u72+EuW8uqDLCnHV3oq7IA2
   bUX9hbb6CQEfrSExnmdY2OvESQ+IlXin61kV7b61fZzLe1Ie3Su8i631q
   gBpDkTb45sdPjVT0zZPijGUXIHSqFKtuXG9xDndGvPILJYZiMy7Vnvv/3
   2UWnRfbuUR51dmPBvc5EY9NJPOgOFI797EsuROg7oErO2GF3CLnb1u4N8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894600"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894600"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:27:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956957"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771956957"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:27:12 -0800
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
Subject: [PATCH 19/27] ASoC: Intel: sof_rt5682: use common module for BT offload link
Date: Mon, 27 Nov 2023 17:26:46 +0200
Message-ID: <20231127152654.28204-20-peter.ujfalusi@linux.intel.com>
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
 sound/soc/intel/boards/sof_rt5682.c | 30 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 777d1db5c6ad..22dd85129a51 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -720,23 +720,11 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 		int port = (sof_rt5682_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
 				SOF_BT_OFFLOAD_SSP_SHIFT;
 
-		links[id].id = id;
-		links[id].cpus = &cpus[id];
-		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							  "SSP%d Pin", port);
-		if (!links[id].cpus->dai_name)
-			goto devm_err;
-		links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
-		if (!links[id].name)
-			goto devm_err;
-		links[id].codecs = &snd_soc_dummy_dlc;
-		links[id].num_codecs = 1;
-		links[id].platforms = platform_component;
-		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].dpcm_playback = 1;
-		links[id].dpcm_capture = 1;
-		links[id].no_pcm = 1;
-		links[id].num_cpus = 1;
+		ret = sof_intel_board_set_bt_link(dev, &links[id], id, port);
+		if (ret)
+			return NULL;
+
+		id++;
 	}
 
 	/* HDMI-In SSP */
@@ -843,6 +831,10 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "sof_rt5682_quirk = %lx\n", sof_rt5682_quirk);
 
+	/* port number of peripherals attached to ssp interface */
+	ctx->ssp_bt = (sof_rt5682_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
+			SOF_BT_OFFLOAD_SSP_SHIFT;
+
 	ctx->ssp_amp = (sof_rt5682_quirk & SOF_RT5682_SSP_AMP_MASK) >>
 			SOF_RT5682_SSP_AMP_SHIFT;
 
@@ -854,8 +846,10 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (ctx->amp_type != CODEC_NONE)
 		sof_audio_card_rt5682.num_links++;
 
-	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
+	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
+		ctx->bt_offload_present = true;
 		sof_audio_card_rt5682.num_links++;
+	}
 
 	if (sof_rt5682_quirk & SOF_SSP_HDMI_CAPTURE_PRESENT_MASK)
 		sof_audio_card_rt5682.num_links +=
-- 
2.43.0

