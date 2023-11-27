Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRKWnTFI"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED78F18B
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099327; x=1732635327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dqkn7V49CrgFPmU3JyRNAS/8rJSeEqCXZL6k949YguE=;
  b=MRKWnTFIu5qv8WDBPBvgo7NQw+4dHXqYV07fnqlyZtKDB0nDwKuePh2x
   eqhO/RCwLmydb2syKaUUmQFBV/At8c7IvHXZJjie3Eqw0OEGI4lRVP914
   G5SHfpVLup2WiN3/sVL4S/O+gurSoTfazp6vQRRsttnd6QJB55rzDn4us
   av3x5l/DPvW4t55S5iq/nB4WUjj5oAwlV69PVqZXoefH+d1daGsPIyFTe
   Zv4sG/mLgVmoxLyhp7SfZ7rgS8Sp9Kwvezlj0mN1A6bOhc3/FijfQcpZy
   xHKmlfygwow8RjvXC3VFuW4cu4BCDfMURfIsV+/eCugSYhN9Nnn4J533A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894498"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894498"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956692"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771956692"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:52 -0800
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
Subject: [PATCH 12/27] ASoC: Intel: sof_nau8825: use common module for amp link
Date: Mon, 27 Nov 2023 17:26:39 +0200
Message-ID: <20231127152654.28204-13-peter.ujfalusi@linux.intel.com>
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
 sound/soc/intel/boards/sof_nau8825.c | 31 +++++++---------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 3aeed23c8d0d..cc2a11b3de97 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -273,13 +273,12 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 
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
 		case CODEC_MAX98360A:
 			max_98360a_dai_link(&links[id]);
@@ -304,20 +303,6 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
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
-		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							  "SSP%d Pin",
-							  ssp_amp);
-		if (!links[id].cpus->dai_name)
-			goto devm_err;
 		id++;
 	}
 
@@ -355,7 +340,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int ret, ssp_amp;
+	int ret;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -380,7 +365,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 		ctx->hdmi.idisp_codec = true;
 
-	ssp_amp = (sof_nau8825_quirk & SOF_NAU8825_SSP_AMP_MASK) >>
+	ctx->ssp_amp = (sof_nau8825_quirk & SOF_NAU8825_SSP_AMP_MASK) >>
 			SOF_NAU8825_SSP_AMP_SHIFT;
 
 	ctx->ssp_codec = sof_nau8825_quirk & SOF_NAU8825_SSP_CODEC_MASK;
@@ -395,7 +380,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 		sof_audio_card_nau8825.num_links++;
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
-					      ctx->ssp_codec, ssp_amp,
+					      ctx->ssp_codec, ctx->ssp_amp,
 					      ctx->dmic_be_num, ctx->hdmi_num,
 					      ctx->hdmi.idisp_codec);
 	if (!dai_links)
-- 
2.43.0

