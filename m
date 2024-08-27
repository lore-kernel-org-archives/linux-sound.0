Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CDB1BCA1A
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 12:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761974; cv=none; b=Qc8d3JjaaCHFAQxvVsuJ1KgRwl2uRrLqyULK6qjJ73hTSsvzDQasN3XgIqtFmp02JsYyj386idKDd/fWoE9fLZgkJXKGCXQ8IxOjzXGw9her25L8BHTYUGWDefpDlCfelJ1wKY6mwFwxiq3uw8DKBjsgC15MdgIE/tw1J0UGDSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761974; c=relaxed/simple;
	bh=EX9HX0gv6nW7PHCmwnHtkTIRS7HVRSkeFAqkJsRhKIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pi69t491sEBfgBHzeOqcGRyAW1yG0KTvZkcjw6+RIR+89dhTMd4aGWe0Bk2TRPh/hFFWl2SkKi/2cBkruOCxAvsbXQdyVq2NODNFNfB8/VvfMqtIQ/SOKNfy8zKk76wpSQ57U6hUoxs/tecfhhWMYP9eXK/rDs832n3RhGs7wdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ienqbIsr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ienqbIsr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724761973; x=1756297973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EX9HX0gv6nW7PHCmwnHtkTIRS7HVRSkeFAqkJsRhKIQ=;
  b=ienqbIsrGKduBZlzeFS6hIQgov/gF4/Go3+X21hyKBGZZLW2FuEgxoih
   UdttyPLZ6g16QHUULG/jN8ZW5qqyB6AArsxrvdSGmcRD6YE320BnubZA0
   xHaoWcFnh73BCxanoVFIRmxt7NSnJ18zLJkuQaxB54YHFzgPMER4/X6mc
   3bBXTKpjQTMkSudizTRcs4TXQsopy/M8W7F4IWmtjdlXHrAibJuajxQSu
   VNMorEiQVl62c1ETZnrm/Td4cn+jSvX07M3fcS/x2eWAMcpMPlJRKdLfT
   C1CwUwVyjenjQnY/cJfMpnMuo/EbAGrqoItBQ7SYmXY2fNDASU7bsTavh
   Q==;
X-CSE-ConnectionGUID: Mrz8Vg7MRjW97lZGbhQ2Ow==
X-CSE-MsgGUID: PXFUilfTQ2qA8gUPWKGlyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13235513"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="13235513"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:52 -0700
X-CSE-ConnectionGUID: uOEfNp/aQfSD8uDw329uww==
X-CSE-MsgGUID: Psrfl/pSS1S4HrZ/OX59qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="62676799"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:50 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 09/17] ASoC: Intel: skl_hda_dsp_generic: support BT audio offload
Date: Tue, 27 Aug 2024 20:32:07 +0800
Message-ID: <20240827123215.258859-10-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
References: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add BT offload BE link to dai link array if the BT offload link mask
is valid (only one bit set).

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_common.c  | 13 +++++++
 sound/soc/intel/boards/skl_hda_dsp_common.h  |  4 ++-
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 37 +++++++++++++++++---
 3 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
index e9cefa4ae56d..5eb63f4df241 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
@@ -75,6 +75,11 @@ SND_SOC_DAILINK_DEF(dmic_codec,
 SND_SOC_DAILINK_DEF(dmic16k,
 	DAILINK_COMP_ARRAY(COMP_CPU("DMIC16k Pin")));
 
+SND_SOC_DAILINK_DEF(bt_offload_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU(""))); /* initialized in driver probe function */
+SND_SOC_DAILINK_DEF(dummy,
+	DAILINK_COMP_ARRAY(COMP_DUMMY()));
+
 SND_SOC_DAILINK_DEF(platform,
 	DAILINK_COMP_ARRAY(COMP_PLATFORM("0000:00:1f.3")));
 
@@ -132,6 +137,14 @@ struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS] = {
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic16k, dmic_codec, platform),
 	},
+	{
+		.name = NULL, /* initialized in driver probe function */
+		.id = 8,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(bt_offload_pin, dummy, platform),
+	},
 };
 
 int skl_hda_hdmi_jack_init(struct snd_soc_card *card)
diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.h b/sound/soc/intel/boards/skl_hda_dsp_common.h
index 19b814dee4ad..9d714f747dca 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.h
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.h
@@ -18,7 +18,7 @@
 #include "../../codecs/hdac_hda.h"
 #include "hda_dsp_common.h"
 
-#define HDA_DSP_MAX_BE_DAI_LINKS 7
+#define HDA_DSP_MAX_BE_DAI_LINKS 8
 
 struct skl_hda_hdmi_pcm {
 	struct list_head head;
@@ -35,6 +35,8 @@ struct skl_hda_private {
 	const char *platform_name;
 	bool common_hdmi_codec_drv;
 	bool idisp_codec;
+	bool bt_offload_present;
+	int ssp_bt;
 };
 
 extern struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS];
diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 88d91c0280bb..927c73bef065 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -95,6 +95,7 @@ skl_hda_add_dai_link(struct snd_soc_card *card, struct snd_soc_dai_link *link)
 #define IDISP_DAI_COUNT		3
 #define HDAC_DAI_COUNT		2
 #define DMIC_DAI_COUNT		2
+#define BT_DAI_COUNT		1
 
 /* there are two routes per iDisp output */
 #define IDISP_ROUTE_COUNT	(IDISP_DAI_COUNT * 2)
@@ -102,11 +103,12 @@ skl_hda_add_dai_link(struct snd_soc_card *card, struct snd_soc_dai_link *link)
 
 #define HDA_CODEC_AUTOSUSPEND_DELAY_MS 1000
 
-static int skl_hda_fill_card_info(struct snd_soc_card *card,
+static int skl_hda_fill_card_info(struct device *dev, struct snd_soc_card *card,
 				  struct snd_soc_acpi_mach_params *mach_params)
 {
 	struct skl_hda_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link *dai_link;
+	struct snd_soc_dai_link *bt_link;
 	u32 codec_count, codec_mask;
 	int i, num_links, num_route;
 
@@ -120,7 +122,7 @@ static int skl_hda_fill_card_info(struct snd_soc_card *card,
 
 	if (codec_mask == IDISP_CODEC_MASK) {
 		/* topology with iDisp as the only HDA codec */
-		num_links = IDISP_DAI_COUNT + DMIC_DAI_COUNT;
+		num_links = IDISP_DAI_COUNT + DMIC_DAI_COUNT + BT_DAI_COUNT;
 		num_route = IDISP_ROUTE_COUNT;
 
 		/*
@@ -129,7 +131,7 @@ static int skl_hda_fill_card_info(struct snd_soc_card *card,
 		 * num_links of dai links need to be registered
 		 * to ASoC.
 		 */
-		for (i = 0; i < DMIC_DAI_COUNT; i++) {
+		for (i = 0; i < (DMIC_DAI_COUNT + BT_DAI_COUNT); i++) {
 			skl_hda_be_dai_links[IDISP_DAI_COUNT + i] =
 				skl_hda_be_dai_links[IDISP_DAI_COUNT +
 					HDAC_DAI_COUNT + i];
@@ -150,6 +152,28 @@ static int skl_hda_fill_card_info(struct snd_soc_card *card,
 		}
 	}
 
+	if (!ctx->bt_offload_present) {
+		/* remove last link since bt audio offload is not supported */
+		num_links -= BT_DAI_COUNT;
+	} else {
+		if (codec_mask == IDISP_CODEC_MASK)
+			bt_link = &skl_hda_be_dai_links[IDISP_DAI_COUNT + DMIC_DAI_COUNT];
+		else
+			bt_link = &skl_hda_be_dai_links[IDISP_DAI_COUNT + HDAC_DAI_COUNT + DMIC_DAI_COUNT];
+
+		/* complete the link name and dai name with SSP port number */
+		bt_link->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT",
+					       ctx->ssp_bt);
+		if (!bt_link->name)
+			return -ENOMEM;
+
+		bt_link->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							 "SSP%d Pin",
+							 ctx->ssp_bt);
+		if (!bt_link->cpus->dai_name)
+			return -ENOMEM;
+	}
+
 	card->num_links = num_links;
 	card->num_dapm_routes = num_route;
 
@@ -213,7 +237,12 @@ static int skl_hda_audio_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(card, ctx);
 
-	ret = skl_hda_fill_card_info(card, &mach->mach_params);
+	if (hweight_long(mach->mach_params.bt_link_mask) == 1) {
+		ctx->bt_offload_present = true;
+		ctx->ssp_bt = fls(mach->mach_params.bt_link_mask) - 1;
+	}
+
+	ret = skl_hda_fill_card_info(&pdev->dev, card, &mach->mach_params);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Unsupported HDAudio/iDisp configuration found\n");
 		return ret;
-- 
2.43.0

