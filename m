Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAcUV8Gf"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44DA319D
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099329; x=1732635329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RVDtpOggfIS7WzvfIL6DjjHWp2zJcFKyBU5rJtasFfI=;
  b=HAcUV8Gf8QcfdGQpGPCFsmrWiXMFPstMCH6hsEKLdvWgD1MBOQz0LfhJ
   Uhsj2XsHnbSv/FqY6TGKmC5BjgRySmWV3HopGWFXSuYb/GKWXPysLINPF
   BBiL3Zq71vv1D/ni5H4av2wyfXa0Ejw0jiXkAR2W+FRhYostD4V7kU8gu
   yQk8mEnq19V/qe0O9vXOMBextSszXcW16uSuRe6EGyKLjen2mQwog6KGo
   44je3g5hNbvvT4VYaTrXqnT23sbCA9jZDtdwHSy9OI8W+i1jW+fWgWsUT
   ztjttfCmRijb9lamBgbAVhGf1bZf1fXvGZghB+nS0wPDkMwtWOF42GGe5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894518"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894518"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:27:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956775"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771956775"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:58 -0800
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
Subject: [PATCH 14/27] ASoC: Intel: sof_ssp_amp: use common module for amp link
Date: Mon, 27 Nov 2023 17:26:41 +0200
Message-ID: <20231127152654.28204-15-peter.ujfalusi@linux.intel.com>
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
 sound/soc/intel/boards/sof_ssp_amp.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 22f37cf3a2ad..8e478d1cc875 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -154,12 +154,13 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 
 	/* codec SSP */
 	if (amp_type != CODEC_NONE) {
-		links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_codec);
-		if (!links[id].name)
+		be_id = fixed_be ? SPK_BE_ID : id;
+		ret = sof_intel_board_set_ssp_amp_link(dev, &links[id], be_id,
+						       amp_type, ssp_codec);
+		if (ret)
 			return NULL;
 
-		links[id].id = fixed_be ? SPK_BE_ID : id;
-
+		/* codec-specific fields */
 		switch (amp_type) {
 		case CODEC_CS35L41:
 			cs35l41_set_dai_link(&links[id]);
@@ -172,18 +173,6 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			return NULL;
 		}
 
-		links[id].platforms = platform_component;
-		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].dpcm_playback = 1;
-		/* feedback from amplifier or firmware-generated echo reference */
-		links[id].dpcm_capture = 1;
-		links[id].no_pcm = 1;
-		links[id].cpus = &cpus[id];
-		links[id].num_cpus = 1;
-		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_codec);
-		if (!links[id].cpus->dai_name)
-			return NULL;
-
 		id++;
 	}
 
@@ -256,7 +245,7 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int ret, ssp_codec;
+	int ret;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -272,7 +261,7 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	else
 		ctx->dmic_be_num = 0;
 
-	ssp_codec = sof_ssp_amp_quirk & SOF_AMPLIFIER_SSP_MASK;
+	ctx->ssp_amp = sof_ssp_amp_quirk & SOF_AMPLIFIER_SSP_MASK;
 
 	/* set number of dai links */
 	sof_ssp_amp_card.num_links = ctx->dmic_be_num;
@@ -303,7 +292,7 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 		sof_ssp_amp_card.num_links++;
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
-					      ssp_codec, ctx->dmic_be_num,
+					      ctx->ssp_amp, ctx->dmic_be_num,
 					      ctx->hdmi_num,
 					      ctx->hdmi.idisp_codec);
 	if (!dai_links)
-- 
2.43.0

