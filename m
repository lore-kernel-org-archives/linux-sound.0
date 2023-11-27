Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3sV+GBy"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9CC1191
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099328; x=1732635328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WHhqRCSfZknG+c8UuUKN6dsdF8Pg6hNrzndoyN4KBys=;
  b=M3sV+GBywOhREVTPFyslUTLX6+zmjnJBkL529QQVj3Q++y/eolRHVaKm
   M+CROHNfYrTkXmg8PL8RZJvK47B7JYZ2lFlP0Khdbt3wcX3gDO+Xjppgt
   GbeT8lKOPPrxWRrnlx+sSNzpdeI9Ms+7h7IL1GYkJ8mNB6lQTG8F0aTgR
   m6ezgD0GQTD/iQxk2DX8Oe20gd1rmmkMd9aiFPw8tpMVOBJdetyVR5e+A
   61s9Y8BXvUnGBqymZlwExRR6iNtxMvUd+/FwG2gvekrIkjZfi54yolYoc
   C7r0ZvPdh1IP50uLrCBffUq1zbuggupvfcIaE7saQRMDCA7x9xHdsrGpD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894507"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894507"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956728"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771956728"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:55 -0800
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
Subject: [PATCH 13/27] ASoC: Intel: sof_rt5682: use common module for amp link
Date: Mon, 27 Nov 2023 17:26:40 +0200
Message-ID: <20231127152654.28204-14-peter.ujfalusi@linux.intel.com>
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
 sound/soc/intel/boards/sof_rt5682.c | 43 +++++++----------------------
 1 file changed, 10 insertions(+), 33 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 8adc82892e2c..777d1db5c6ad 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -666,13 +666,12 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 
 	/* speaker amp */
 	if (amp_type != CODEC_NONE) {
-		links[id].name = devm_kasprintf(dev, GFP_KERNEL,
-						"SSP%d-Codec", ssp_amp);
-		if (!links[id].name)
-			goto devm_err;
-
-		links[id].id = id;
+		ret = sof_intel_board_set_ssp_amp_link(dev, &links[id], id,
+						       amp_type, ssp_amp);
+		if (ret)
+			return NULL;
 
+		/* codec-specific fields */
 		switch (amp_type) {
 		case CODEC_MAX98357A:
 			max_98357a_dai_link(&links[id]);
@@ -713,29 +712,6 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 			return NULL;
 		}
 
-		links[id].platforms = platform_component;
-		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].dpcm_playback = 1;
-		/* feedback stream or firmware-generated echo reference */
-		links[id].dpcm_capture = 1;
-
-		links[id].no_pcm = 1;
-		links[id].cpus = &cpus[id];
-		links[id].num_cpus = 1;
-		if (is_legacy_cpu) {
-			links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-								  "ssp%d-port",
-								  ssp_amp);
-			if (!links[id].cpus->dai_name)
-				goto devm_err;
-
-		} else {
-			links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-								  "SSP%d Pin",
-								  ssp_amp);
-			if (!links[id].cpus->dai_name)
-				goto devm_err;
-		}
 		id++;
 	}
 
@@ -801,7 +777,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int ret, ssp_amp;
+	int ret;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -867,7 +843,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "sof_rt5682_quirk = %lx\n", sof_rt5682_quirk);
 
-	ssp_amp = (sof_rt5682_quirk & SOF_RT5682_SSP_AMP_MASK) >>
+	ctx->ssp_amp = (sof_rt5682_quirk & SOF_RT5682_SSP_AMP_MASK) >>
 			SOF_RT5682_SSP_AMP_SHIFT;
 
 	ctx->ssp_codec = sof_rt5682_quirk & SOF_RT5682_SSP_CODEC_MASK;
@@ -887,8 +863,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 					SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT);
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->codec_type,
-					      ctx->amp_type, ctx->ssp_codec, ssp_amp,
-					      ctx->dmic_be_num, ctx->hdmi_num,
+					      ctx->amp_type, ctx->ssp_codec,
+					      ctx->ssp_amp, ctx->dmic_be_num,
+					      ctx->hdmi_num,
 					      ctx->hdmi.idisp_codec,
 					      ctx->rt5682.is_legacy_cpu);
 	if (!dai_links)
-- 
2.43.0

