Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TV+l3E95"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB409B
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099339; x=1732635339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/aZ5dxakQtq/x5Qt5/UYeLdfsoMev4N846nYiIvN8pQ=;
  b=TV+l3E95RtgYw4xrT75RU8Z/0304ZEMp8oe5DnughSwRNgjOGCOAcV45
   B6DrvjaVifBsr4+cUxPkanSRyJGSanA6KHxUuxdiU70chHv0Xqw2DTACX
   iIgcBoiz7/QR9Kiv/bPNwlrI+FGV1UkH+P+Bfo+QI4HOnJeZvI38XCxIR
   FVzm67506FxD9PTUc/cc72CRKjWSiWZSPDbE+Cy8/u6hwTzbqS+UprOwo
   X3Q2rBgr/AuPsu6pZnWqvwBiQpaXLfqnacAThftYrS/C3U9SS5zSRWoWT
   qn0JxRnUk8BIrGb5NkWpdqyFyXJVhzbSdbYJf+uPT1N2YHoCmU4GiMqXz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894617"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894617"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:27:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771957000"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771957000"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:27:15 -0800
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
Subject: [PATCH 20/27] ASoC: Intel: sof_ssp_amp: use common module for BT offload link
Date: Mon, 27 Nov 2023 17:26:47 +0200
Message-ID: <20231127152654.28204-21-peter.ujfalusi@linux.intel.com>
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
 sound/soc/intel/boards/sof_ssp_amp.c | 31 ++++++++++------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index c463bc698c10..72505f6a6501 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -215,29 +215,14 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 		int port = (sof_ssp_amp_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
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
 		id++;
 	}
 
 	return links;
-devm_err:
-	return NULL;
 }
 
 static int sof_ssp_amp_probe(struct platform_device *pdev)
@@ -261,6 +246,10 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	else
 		ctx->dmic_be_num = 0;
 
+	/* port number of peripherals attached to ssp interface */
+	ctx->ssp_bt = (sof_ssp_amp_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
+			SOF_BT_OFFLOAD_SSP_SHIFT;
+
 	ctx->ssp_amp = sof_ssp_amp_quirk & SOF_AMPLIFIER_SSP_MASK;
 
 	/* set number of dai links */
@@ -288,8 +277,10 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 		ctx->hdmi_num = 0;
 	}
 
-	if (sof_ssp_amp_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
+	if (sof_ssp_amp_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
+		ctx->bt_offload_present = true;
 		sof_ssp_amp_card.num_links++;
+	}
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
 					      ctx->ssp_amp, ctx->dmic_be_num,
-- 
2.43.0

