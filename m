Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C68B1A0BDE
	for <linux-sound@vger.kernel.org>; Thu, 12 Sep 2024 12:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726142605; cv=none; b=PfZ3O5FKpLEpxX2lcDAjczFEhiwS+H8ov3yL1TwKZr2nj2lxaDvgywSwgnY9/nJ2ibN1GcD+YS/zCkMTWuvnAqSAdxug79zJjrqB3/Swdvgjd0kyXt1lciWRIzI0gDixrzFkLSHt5MjBMcOBnjrENxLPLvdLZ+FH0oADF+nXc/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726142605; c=relaxed/simple;
	bh=i/vSHoNMZnw+mH7af6xFtH7GzAKW2VccRUgH3IU/usQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u05Mp1s4640d8He6z77idUWNHUXhpHiP9dNoPeX5LywlCQjeIhopVDWTt8un8s3zl9DHaM2JZsdPU4Cp32MpciE0MNtqwprPN1xsHZhFgoMabkakFD2W28oFHmQPFkf124Ux4vBdcgM9iqZJ7yz0rIRxT53GTxVaG2i1C6Eos8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+GA1FR+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+GA1FR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726142604; x=1757678604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i/vSHoNMZnw+mH7af6xFtH7GzAKW2VccRUgH3IU/usQ=;
  b=Y+GA1FR+Qruu5+EkFZyiQopMvLDJTfHExE5/YuO+VwJXftciMqD/Z7Rp
   eHSPaIq7iQXNHlvTWL0iFrwEzXl1tdzDGZdNsYzPyObVgBIMX7DENZheh
   /ySWRcRHBsEZZXnGAOwztSDm6YyKgHhlLxbeayupB/LNtoN2gmaIy/8eE
   jeN/bf872jMFfS3o5EnOnLVshkqTYhJ6LEwy2vTjo5Fh82ehw12uZjJM1
   SOMSiIyKeTHDI1X+xYpRqyHU9z5FbBer0Yb3G/oYZE7Kz2F9TC+PQ5ZZc
   gQZ+a5spySwjUtBFhoCGDUFQU2S2T/LI9xqVKFqnCkSSI6NX6zrugJDGu
   A==;
X-CSE-ConnectionGUID: TP1p2O1xTmeRIOuRpFqf8A==
X-CSE-MsgGUID: 4LzFNwshQeyvoqlYVGSdDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24812770"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="24812770"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:03:24 -0700
X-CSE-ConnectionGUID: 4NrLj1MFS3uaangsoN/GAw==
X-CSE-MsgGUID: 71ReAwK7RzKej/68fae3og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="68459157"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.14])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:03:21 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/7] ASoC: Intel: skl_hda_dsp_generic: use common module for DAI links
Date: Thu, 12 Sep 2024 20:03:03 +0800
Message-ID: <20240912120308.134762-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912120308.134762-1-yung-chuan.liao@linux.intel.com>
References: <20240912120308.134762-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Use intel_board module to create DAI link array for Intel iDisp HDMI,
HDA external codec, DMIC01, DMIC16K, and BT audio offload DAI BE links.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig               |   1 +
 sound/soc/intel/boards/Makefile              |   2 +-
 sound/soc/intel/boards/skl_hda_dsp_common.c  | 156 ------------
 sound/soc/intel/boards/skl_hda_dsp_common.h  |  38 ---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 252 +++++--------------
 5 files changed, 70 insertions(+), 379 deletions(-)
 delete mode 100644 sound/soc/intel/boards/skl_hda_dsp_common.c
 delete mode 100644 sound/soc/intel/boards/skl_hda_dsp_common.h

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 793a9170513a..cc10ae58b0c7 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -306,6 +306,7 @@ config SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH
 	tristate "Skylake+ with HDA Codecs"
 	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_INTEL_HDA_DSP_COMMON
+	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_DMIC
 	# SND_SOC_HDAC_HDA is already selected
 	help
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 9b24de731332..fcd517d6c279 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -21,7 +21,7 @@ snd-soc-sof_cs42l42-y := sof_cs42l42.o
 snd-soc-sof_es8336-y := sof_es8336.o
 snd-soc-sof_nau8825-y := sof_nau8825.o
 snd-soc-sof_da7219-y := sof_da7219.o
-snd-soc-skl_hda_dsp-y := skl_hda_dsp_generic.o skl_hda_dsp_common.o
+snd-soc-skl_hda_dsp-y := skl_hda_dsp_generic.o
 snd-soc-ehl-rt5660-y := ehl_rt5660.o
 snd-soc-sof-ssp-amp-y := sof_ssp_amp.o
 snd-soc-sof-sdw-y += sof_sdw.o				\
diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
deleted file mode 100644
index 5019bdfa5b45..000000000000
--- a/sound/soc/intel/boards/skl_hda_dsp_common.c
+++ /dev/null
@@ -1,156 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-// Copyright(c) 2015-18 Intel Corporation.
-
-/*
- * Common functions used in different Intel machine drivers
- */
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <sound/core.h>
-#include <sound/jack.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-#include "skl_hda_dsp_common.h"
-
-#include <sound/hda_codec.h>
-#include "../../codecs/hdac_hda.h"
-
-#define NAME_SIZE	32
-
-int skl_hda_hdmi_add_pcm(struct snd_soc_card *card, int device)
-{
-	struct skl_hda_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *dai;
-	char dai_name[NAME_SIZE];
-
-	snprintf(dai_name, sizeof(dai_name), "intel-hdmi-hifi%d",
-		 ctx->dai_index);
-	dai = snd_soc_card_get_codec_dai(card, dai_name);
-	if (!dai)
-		return -EINVAL;
-
-	ctx->hdmi.hdmi_comp = dai->component;
-
-	return 0;
-}
-
-SND_SOC_DAILINK_DEF(idisp1_cpu,
-	DAILINK_COMP_ARRAY(COMP_CPU("iDisp1 Pin")));
-SND_SOC_DAILINK_DEF(idisp1_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi1")));
-
-SND_SOC_DAILINK_DEF(idisp2_cpu,
-	DAILINK_COMP_ARRAY(COMP_CPU("iDisp2 Pin")));
-SND_SOC_DAILINK_DEF(idisp2_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi2")));
-
-SND_SOC_DAILINK_DEF(idisp3_cpu,
-	DAILINK_COMP_ARRAY(COMP_CPU("iDisp3 Pin")));
-SND_SOC_DAILINK_DEF(idisp3_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi3")));
-
-SND_SOC_DAILINK_DEF(analog_cpu,
-	DAILINK_COMP_ARRAY(COMP_CPU("Analog CPU DAI")));
-SND_SOC_DAILINK_DEF(analog_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D0", "Analog Codec DAI")));
-
-SND_SOC_DAILINK_DEF(digital_cpu,
-	DAILINK_COMP_ARRAY(COMP_CPU("Digital CPU DAI")));
-SND_SOC_DAILINK_DEF(digital_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D0", "Digital Codec DAI")));
-
-SND_SOC_DAILINK_DEF(dmic_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
-
-SND_SOC_DAILINK_DEF(dmic_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
-
-SND_SOC_DAILINK_DEF(dmic16k,
-	DAILINK_COMP_ARRAY(COMP_CPU("DMIC16k Pin")));
-
-SND_SOC_DAILINK_DEF(bt_offload_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU(""))); /* initialized in driver probe function */
-SND_SOC_DAILINK_DEF(dummy,
-	DAILINK_COMP_ARRAY(COMP_DUMMY()));
-
-SND_SOC_DAILINK_DEF(platform,
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("0000:00:1f.3")));
-
-/* skl_hda_digital audio interface glue - connects codec <--> CPU */
-struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS] = {
-	/* Back End DAI links */
-	{
-		.name = "iDisp1",
-		.id = 1,
-		.dpcm_playback = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp1_cpu, idisp1_codec, platform),
-	},
-	{
-		.name = "iDisp2",
-		.id = 2,
-		.dpcm_playback = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp2_cpu, idisp2_codec, platform),
-	},
-	{
-		.name = "iDisp3",
-		.id = 3,
-		.dpcm_playback = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp3_cpu, idisp3_codec, platform),
-	},
-	{
-		.name = "Analog Playback and Capture",
-		.id = 4,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(analog_cpu, analog_codec, platform),
-	},
-	{
-		.name = "Digital Playback and Capture",
-		.id = 5,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(digital_cpu, digital_codec, platform),
-	},
-	{
-		.name = "dmic01",
-		.id = 6,
-		.dpcm_capture = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
-	},
-	{
-		.name = "dmic16k",
-		.id = 7,
-		.dpcm_capture = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(dmic16k, dmic_codec, platform),
-	},
-	{
-		.name = NULL, /* initialized in driver probe function */
-		.id = 8,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(bt_offload_pin, dummy, platform),
-	},
-};
-
-int skl_hda_hdmi_jack_init(struct snd_soc_card *card)
-{
-	struct skl_hda_private *ctx = snd_soc_card_get_drvdata(card);
-
-	/* HDMI disabled, do not create controls */
-	if (!ctx->hdmi.idisp_codec)
-		return 0;
-
-	if (!ctx->hdmi.hdmi_comp)
-		return -EINVAL;
-
-	return hda_dsp_hdmi_build_controls(card, ctx->hdmi.hdmi_comp);
-}
diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.h b/sound/soc/intel/boards/skl_hda_dsp_common.h
deleted file mode 100644
index 40ffbccb2fe0..000000000000
--- a/sound/soc/intel/boards/skl_hda_dsp_common.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright(c) 2015-18 Intel Corporation.
- */
-
-/*
- * This file defines data structures used in Machine Driver for Intel
- * platforms with HDA Codecs.
- */
-
-#ifndef __SKL_HDA_DSP_COMMON_H
-#define __SKL_HDA_DSP_COMMON_H
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <sound/core.h>
-#include <sound/jack.h>
-#include <sound/hda_codec.h>
-#include "../../codecs/hdac_hda.h"
-#include "hda_dsp_common.h"
-#include "sof_hdmi_common.h"
-
-#define HDA_DSP_MAX_BE_DAI_LINKS 8
-
-struct skl_hda_private {
-	struct snd_soc_card card;
-	struct sof_hdmi_private hdmi;
-	int pcm_count;
-	int dai_index;
-	const char *platform_name;
-	bool bt_offload_present;
-	int ssp_bt;
-};
-
-extern struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS];
-int skl_hda_hdmi_jack_init(struct snd_soc_card *card);
-int skl_hda_hdmi_add_pcm(struct snd_soc_card *card, int device);
-
-#endif /* __SOUND_SOC_HDA_DSP_COMMON_H */
diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 8e104874d58c..9edd6d985cf1 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -8,178 +8,23 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <sound/core.h>
+#include <sound/hda_codec.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
-#include "skl_hda_dsp_common.h"
-
-static const struct snd_soc_dapm_widget skl_hda_widgets[] = {
-	SND_SOC_DAPM_HP("Analog Out", NULL),
-	SND_SOC_DAPM_MIC("Analog In", NULL),
-	SND_SOC_DAPM_HP("Alt Analog Out", NULL),
-	SND_SOC_DAPM_MIC("Alt Analog In", NULL),
-	SND_SOC_DAPM_SPK("Digital Out", NULL),
-	SND_SOC_DAPM_MIC("Digital In", NULL),
-	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
-};
-
-static const struct snd_soc_dapm_route skl_hda_map[] = {
-	{ "hifi3", NULL, "iDisp3 Tx"},
-	{ "iDisp3 Tx", NULL, "iDisp3_out"},
-	{ "hifi2", NULL, "iDisp2 Tx"},
-	{ "iDisp2 Tx", NULL, "iDisp2_out"},
-	{ "hifi1", NULL, "iDisp1 Tx"},
-	{ "iDisp1 Tx", NULL, "iDisp1_out"},
-
-	{ "Analog Out", NULL, "Codec Output Pin1" },
-	{ "Digital Out", NULL, "Codec Output Pin2" },
-	{ "Alt Analog Out", NULL, "Codec Output Pin3" },
-
-	{ "Codec Input Pin1", NULL, "Analog In" },
-	{ "Codec Input Pin2", NULL, "Digital In" },
-	{ "Codec Input Pin3", NULL, "Alt Analog In" },
-
-	/* digital mics */
-	{"DMic", NULL, "SoC DMIC"},
-
-	/* CODEC BE connections */
-	{ "Analog Codec Playback", NULL, "Analog CPU Playback" },
-	{ "Analog CPU Playback", NULL, "codec0_out" },
-	{ "Digital Codec Playback", NULL, "Digital CPU Playback" },
-	{ "Digital CPU Playback", NULL, "codec1_out" },
-	{ "Alt Analog Codec Playback", NULL, "Alt Analog CPU Playback" },
-	{ "Alt Analog CPU Playback", NULL, "codec2_out" },
-
-	{ "codec0_in", NULL, "Analog CPU Capture" },
-	{ "Analog CPU Capture", NULL, "Analog Codec Capture" },
-	{ "codec1_in", NULL, "Digital CPU Capture" },
-	{ "Digital CPU Capture", NULL, "Digital Codec Capture" },
-	{ "codec2_in", NULL, "Alt Analog CPU Capture" },
-	{ "Alt Analog CPU Capture", NULL, "Alt Analog Codec Capture" },
-};
+#include "../../codecs/hdac_hda.h"
+#include "../../sof/intel/hda.h"
+#include "sof_board_helpers.h"
 
 static int skl_hda_card_late_probe(struct snd_soc_card *card)
 {
-	return skl_hda_hdmi_jack_init(card);
+	return sof_intel_board_card_late_probe(card);
 }
 
-static int
-skl_hda_add_dai_link(struct snd_soc_card *card, struct snd_soc_dai_link *link)
-{
-	struct skl_hda_private *ctx = snd_soc_card_get_drvdata(card);
-	int ret = 0;
-
-	dev_dbg(card->dev, "dai link name - %s\n", link->name);
-	link->platforms->name = ctx->platform_name;
-	link->nonatomic = 1;
-
-	if (!ctx->hdmi.idisp_codec)
-		return 0;
-
-	if (strstr(link->name, "HDMI")) {
-		ret = skl_hda_hdmi_add_pcm(card, ctx->pcm_count);
-
-		if (ret < 0)
-			return ret;
-
-		ctx->dai_index++;
-	}
-
-	ctx->pcm_count++;
-	return ret;
-}
-
-#define IDISP_DAI_COUNT		3
-#define HDAC_DAI_COUNT		2
-#define DMIC_DAI_COUNT		2
-#define BT_DAI_COUNT		1
-
-/* there are two routes per iDisp output */
-#define IDISP_ROUTE_COUNT	(IDISP_DAI_COUNT * 2)
-
 #define HDA_CODEC_AUTOSUSPEND_DELAY_MS 1000
 
-static int skl_hda_fill_card_info(struct device *dev, struct snd_soc_card *card,
-				  struct snd_soc_acpi_mach_params *mach_params)
-{
-	struct skl_hda_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai_link *dai_link;
-	struct snd_soc_dai_link *bt_link;
-	u32 codec_count, codec_mask;
-	int i, num_links, num_route;
-
-	codec_mask = mach_params->codec_mask;
-	codec_count = hweight_long(codec_mask);
-
-	if (!codec_count || codec_count > 2 ||
-	    (codec_count == 2 && !ctx->hdmi.idisp_codec))
-		return -EINVAL;
-
-	if (codec_mask == IDISP_CODEC_MASK) {
-		/* topology with iDisp as the only HDA codec */
-		num_links = IDISP_DAI_COUNT + DMIC_DAI_COUNT + BT_DAI_COUNT;
-		num_route = IDISP_ROUTE_COUNT;
-
-		/*
-		 * rearrange the dai link array and make the
-		 * dmic dai links follow idsp dai links for only
-		 * num_links of dai links need to be registered
-		 * to ASoC.
-		 */
-		for (i = 0; i < (DMIC_DAI_COUNT + BT_DAI_COUNT); i++) {
-			skl_hda_be_dai_links[IDISP_DAI_COUNT + i] =
-				skl_hda_be_dai_links[IDISP_DAI_COUNT +
-					HDAC_DAI_COUNT + i];
-		}
-	} else {
-		/* topology with external and iDisp HDA codecs */
-		num_links = ARRAY_SIZE(skl_hda_be_dai_links);
-		num_route = ARRAY_SIZE(skl_hda_map);
-		card->dapm_widgets = skl_hda_widgets;
-		card->num_dapm_widgets = ARRAY_SIZE(skl_hda_widgets);
-		if (!ctx->hdmi.idisp_codec) {
-			card->dapm_routes = &skl_hda_map[IDISP_ROUTE_COUNT];
-			num_route -= IDISP_ROUTE_COUNT;
-			for (i = 0; i < IDISP_DAI_COUNT; i++) {
-				skl_hda_be_dai_links[i].codecs = &snd_soc_dummy_dlc;
-				skl_hda_be_dai_links[i].num_codecs = 1;
-			}
-		}
-	}
-
-	if (!ctx->bt_offload_present) {
-		/* remove last link since bt audio offload is not supported */
-		num_links -= BT_DAI_COUNT;
-	} else {
-		if (codec_mask == IDISP_CODEC_MASK)
-			bt_link = &skl_hda_be_dai_links[IDISP_DAI_COUNT + DMIC_DAI_COUNT];
-		else
-			bt_link = &skl_hda_be_dai_links[IDISP_DAI_COUNT + HDAC_DAI_COUNT + DMIC_DAI_COUNT];
-
-		/* complete the link name and dai name with SSP port number */
-		bt_link->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT",
-					       ctx->ssp_bt);
-		if (!bt_link->name)
-			return -ENOMEM;
-
-		bt_link->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							 "SSP%d Pin",
-							 ctx->ssp_bt);
-		if (!bt_link->cpus->dai_name)
-			return -ENOMEM;
-	}
-
-	card->num_links = num_links;
-	card->num_dapm_routes = num_route;
-
-	for_each_card_prelinks(card, i, dai_link)
-		dai_link->platforms->name = mach_params->platform;
-
-	return 0;
-}
-
 static void skl_set_hda_codec_autosuspend_delay(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
@@ -203,48 +48,80 @@ static void skl_set_hda_codec_autosuspend_delay(struct snd_soc_card *card)
 	}
 }
 
+#define IDISP_HDMI_BE_ID	1
+#define HDA_BE_ID		4
+#define DMIC01_BE_ID		6
+#define DMIC16K_BE_ID		7
+#define BT_OFFLOAD_BE_ID	8
+
+#define HDA_LINK_ORDER	SOF_LINK_ORDER(SOF_LINK_IDISP_HDMI,  \
+				       SOF_LINK_HDA,        \
+				       SOF_LINK_DMIC01,     \
+				       SOF_LINK_DMIC16K,    \
+				       SOF_LINK_BT_OFFLOAD, \
+				       SOF_LINK_NONE,       \
+				       SOF_LINK_NONE)
+
+#define HDA_LINK_IDS	SOF_LINK_ORDER(IDISP_HDMI_BE_ID,  \
+				       HDA_BE_ID,        \
+				       DMIC01_BE_ID,     \
+				       DMIC16K_BE_ID,    \
+				       BT_OFFLOAD_BE_ID, \
+				       0,                \
+				       0)
+
+static unsigned long
+skl_hda_get_board_quirk(struct snd_soc_acpi_mach_params *mach_params)
+{
+	unsigned long board_quirk = 0;
+	int ssp_bt;
+
+	if (hweight_long(mach_params->bt_link_mask) == 1) {
+		ssp_bt = fls(mach_params->bt_link_mask) - 1;
+		board_quirk |= SOF_SSP_PORT_BT_OFFLOAD(ssp_bt) |
+				SOF_BT_OFFLOAD_PRESENT;
+	}
+
+	return board_quirk;
+}
+
 static int skl_hda_audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
-	struct skl_hda_private *ctx;
+	struct sof_card_private *ctx;
 	struct snd_soc_card *card;
+	unsigned long board_quirk = skl_hda_get_board_quirk(&mach->mach_params);
 	int ret;
 
-	dev_dbg(&pdev->dev, "entry\n");
-
-	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
+	card = devm_kzalloc(&pdev->dev, sizeof(struct snd_soc_card), GFP_KERNEL);
+	if (!card)
 		return -ENOMEM;
 
-	card = &ctx->card;
 	card->name = "hda-dsp";
 	card->owner = THIS_MODULE;
-	card->dai_link = skl_hda_be_dai_links;
-	card->dapm_widgets = skl_hda_widgets;
-	card->dapm_routes = skl_hda_map;
-	card->add_dai_link = skl_hda_add_dai_link;
 	card->fully_routed = true;
 	card->late_probe = skl_hda_card_late_probe;
 
-	snd_soc_card_set_drvdata(card, ctx);
+	dev_dbg(&pdev->dev, "board_quirk = %lx\n", board_quirk);
+
+	/* initialize ctx with board quirk */
+	ctx = sof_intel_board_get_ctx(&pdev->dev, board_quirk);
+	if (!ctx)
+		return -ENOMEM;
+
+	if (HDA_EXT_CODEC(mach->mach_params.codec_mask))
+		ctx->hda_codec_present = true;
 
 	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 		ctx->hdmi.idisp_codec = true;
 
-	if (hweight_long(mach->mach_params.bt_link_mask) == 1) {
-		ctx->bt_offload_present = true;
-		ctx->ssp_bt = fls(mach->mach_params.bt_link_mask) - 1;
-	}
+	ctx->link_order_overwrite = HDA_LINK_ORDER;
+	ctx->link_id_overwrite = HDA_LINK_IDS;
 
-	ret = skl_hda_fill_card_info(&pdev->dev, card, &mach->mach_params);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Unsupported HDAudio/iDisp configuration found\n");
+	/* update dai_link */
+	ret = sof_intel_board_set_dai_link(&pdev->dev, card, ctx);
+	if (ret)
 		return ret;
-	}
-
-	ctx->pcm_count = card->num_links;
-	ctx->dai_index = 1; /* hdmi codec dai name starts from index 1 */
-	ctx->platform_name = mach->mach_params.platform;
 
 	card->dev = &pdev->dev;
 	if (!snd_soc_acpi_sof_parent(&pdev->dev))
@@ -258,6 +135,13 @@ static int skl_hda_audio_probe(struct platform_device *pdev)
 			return -ENOMEM;
 	}
 
+	ret = snd_soc_fixup_dai_links_platform_name(card,
+						    mach->mach_params.platform);
+	if (ret)
+		return ret;
+
+	snd_soc_card_set_drvdata(card, ctx);
+
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (!ret)
 		skl_set_hda_codec_autosuspend_delay(card);
@@ -280,4 +164,4 @@ MODULE_DESCRIPTION("SKL/KBL/BXT/APL HDA Generic Machine driver");
 MODULE_AUTHOR("Rakesh Ughreja <rakesh.a.ughreja@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:skl_hda_dsp_generic");
-MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
-- 
2.43.0

