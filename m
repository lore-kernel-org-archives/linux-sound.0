Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28727155726
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145144; cv=none; b=dXvsSXoGeZNhiFuXOB0xB9QJ/24Vkvc5X1zxXWjAEftjTpH3P4qoQAeOr6+PRJzvvucAvhYI19Z5vgE5bId3TvidmZHCyKEPZ626vjPt34M7oXnNn2NFx3WkmGzR2dukeNxI5rxEJkKRxEcTXnLz2BTMRbjaRNx3H3Tk2sMYilU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145144; c=relaxed/simple;
	bh=6oHNum0hhBW+oe0cBUvZo2IJ3vEGkAKxun4PkLEq7Zg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rmFjBI8/wLzSAsNusIoY2Cy1bA1c79KWJu6isojJ+qMURvJEeHvnZQIOkNi87Bg22QieTo1fB57u/NlzHakZUJxbPlVr+Y4Zj1O9PeO8dLch4mKTpTjGojtMIS6/n89aprNUwVvVZLQjB763NJ+ioyTUOSSd1jA7ABd4tkAR3ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nr+984kZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nr+984kZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145143; x=1745681143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6oHNum0hhBW+oe0cBUvZo2IJ3vEGkAKxun4PkLEq7Zg=;
  b=Nr+984kZ2CbYL1JnBtza8ViPTppbugmhyHdymQgyJFgV02FFiw+B2EQI
   Nv5gdkDmmLzkA4behtyBR1D6m2+YP/2tLr71Qeyqy3boztdWSAXEiKHoF
   e2SYIPJy/dXKhUl/mgNrrDAM3RtSDbgUwGpguIHhA8iA0hTDIS38KOhdG
   mZiD5o9ETJiXYOMs3Pxp1EFCP8Dd6tbL9FXZmdmbA9cjyBTuvGM9BZo2i
   BcCWMsGMJ+yrLInRlowY6TlUsPOD+YnERAw6uD6OqiIn5zD7+h9CqF41Q
   6tne9jyYb51HtR/syWnQxgfHTIvgAD0HJj0rZcvrUGFfpExVUAt97aKv7
   g==;
X-CSE-ConnectionGUID: hGWZz3g6TsKsYgVJ1L5H/A==
X-CSE-MsgGUID: wW7g7gUJRHGevJZK40u4Yw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291293"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291293"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:43 -0700
X-CSE-ConnectionGUID: 82yv9n9fSbmtkyhtBbkgUA==
X-CSE-MsgGUID: dYkibHiCQP60VvPzCt38xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259549"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 06/23] ASoC: Intel: bxt_da7219_max98357a: remove MAX98390 support
Date: Fri, 26 Apr 2024 10:25:12 -0500
Message-Id: <20240426152529.38345-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Remove MAX98390 support and use sof_da7219 machine driver instead for
existing cml boards with MAX98390 speaker amplifier.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig                |   6 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 109 +-----------------
 .../intel/common/soc-acpi-intel-cml-match.c   |   2 +-
 3 files changed, 6 insertions(+), 111 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index fd1f46fad5eb..cb3984b08d1f 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -301,7 +301,6 @@ config SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
 	tristate
 	select SND_SOC_DA7219
 	select SND_SOC_MAX98357A
-	select SND_SOC_MAX98390
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
 	select SND_SOC_INTEL_HDA_DSP_COMMON
@@ -313,14 +312,14 @@ config SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
 if SND_SOC_INTEL_APL
 
 config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
-	tristate "Broxton with DA7219 and MAX98357A/MAX98390 in I2S Mode"
+	tristate "Broxton with DA7219 and MAX98357A in I2S Mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
 	help
 	   This adds support for ASoC machine driver for Broxton-P platforms
-	   with DA7219 + MAX98357A/MAX98390 I2S audio codec.
+	   with DA7219 + MAX98357A I2S audio codec.
 	   Say Y or m if you have such a device. This is a recommended option.
 	   If unsure select "N".
 
@@ -587,6 +586,7 @@ config SND_SOC_INTEL_CML_LP_DA7219_MAX98357A_MACH
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
+	imply SND_SOC_INTEL_SOF_DA7219_MACH
 	help
 	   This adds support for ASoC machine driver for Cometlake platforms
 	   with DA7219 + MAX98357A I2S audio codec.
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index 3fe3f38c6cb6..9f167c828d1c 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -24,14 +24,9 @@
 
 #define BXT_DIALOG_CODEC_DAI	"da7219-hifi"
 #define BXT_MAXIM_CODEC_DAI	"HiFi"
-#define MAX98390_DEV0_NAME	"i2c-MX98390:00"
-#define MAX98390_DEV1_NAME	"i2c-MX98390:01"
 #define DUAL_CHANNEL		2
 #define QUAD_CHANNEL		4
 
-#define SPKAMP_MAX98357A	1
-#define SPKAMP_MAX98390	2
-
 static struct snd_soc_jack broxton_headset;
 static struct snd_soc_jack broxton_hdmi[3];
 
@@ -44,7 +39,6 @@ struct bxt_hdmi_pcm {
 struct bxt_card_private {
 	struct list_head hdmi_pcm_list;
 	bool common_hdmi_codec_drv;
-	int spkamp;
 };
 
 enum {
@@ -91,17 +85,9 @@ static const struct snd_kcontrol_new broxton_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 	SOC_DAPM_PIN_SWITCH("Line Out"),
-};
-
-static const struct snd_kcontrol_new max98357a_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Spk"),
 };
 
-static const struct snd_kcontrol_new max98390_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Left Spk"),
-	SOC_DAPM_PIN_SWITCH("Right Spk"),
-};
-
 static const struct snd_soc_dapm_widget broxton_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
@@ -112,17 +98,9 @@ static const struct snd_soc_dapm_widget broxton_widgets[] = {
 	SND_SOC_DAPM_SPK("HDMI3", NULL),
 	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
 			platform_clock_control,	SND_SOC_DAPM_POST_PMD|SND_SOC_DAPM_PRE_PMU),
-};
-
-static const struct snd_soc_dapm_widget max98357a_widgets[] = {
 	SND_SOC_DAPM_SPK("Spk", NULL),
 };
 
-static const struct snd_soc_dapm_widget max98390_widgets[] = {
-	SND_SOC_DAPM_SPK("Left Spk", NULL),
-	SND_SOC_DAPM_SPK("Right Spk", NULL),
-};
-
 static const struct snd_soc_dapm_route audio_map[] = {
 	/* HP jack connectors - unknown if we have jack detection */
 	{"Headphone Jack", NULL, "HPL"},
@@ -153,19 +131,11 @@ static const struct snd_soc_dapm_route audio_map[] = {
 	{ "Headphone Jack", NULL, "Platform Clock" },
 	{ "Headset Mic", NULL, "Platform Clock" },
 	{ "Line Out", NULL, "Platform Clock" },
-};
 
-static const struct snd_soc_dapm_route max98357a_routes[] = {
 	/* speaker */
 	{"Spk", NULL, "Speaker"},
 };
 
-static const struct snd_soc_dapm_route max98390_routes[] = {
-	/* Speaker */
-	{"Left Spk", NULL, "Left BE_OUT"},
-	{"Right Spk", NULL, "Right BE_OUT"},
-};
-
 static const struct snd_soc_dapm_route broxton_map[] = {
 	{"HiFi Playback", NULL, "ssp5 Tx"},
 	{"ssp5 Tx", NULL, "codec0_out"},
@@ -453,10 +423,6 @@ SND_SOC_DAILINK_DEF(ssp5_pin,
 SND_SOC_DAILINK_DEF(ssp5_codec,
 	DAILINK_COMP_ARRAY(COMP_CODEC("MX98357A:00",
 				      BXT_MAXIM_CODEC_DAI)));
-SND_SOC_DAILINK_DEF(max98390_codec,
-	DAILINK_COMP_ARRAY(
-	/* Left */	COMP_CODEC(MAX98390_DEV0_NAME, "max98390-aif1"),
-	/* Right */	COMP_CODEC(MAX98390_DEV1_NAME, "max98390-aif1")));
 
 SND_SOC_DAILINK_DEF(ssp1_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
@@ -654,69 +620,15 @@ static struct snd_soc_dai_link broxton_dais[] = {
 	},
 };
 
-static struct snd_soc_codec_conf max98390_codec_confs[] = {
-	{
-		.dlc = COMP_CODEC_CONF(MAX98390_DEV0_NAME),
-		.name_prefix = "Left",
-	},
-	{
-		.dlc = COMP_CODEC_CONF(MAX98390_DEV1_NAME),
-		.name_prefix = "Right",
-	},
-};
-
 #define NAME_SIZE	32
 static int bxt_card_late_probe(struct snd_soc_card *card)
 {
 	struct bxt_card_private *ctx = snd_soc_card_get_drvdata(card);
 	struct bxt_hdmi_pcm *pcm;
 	struct snd_soc_component *component = NULL;
-	const struct snd_kcontrol_new *controls;
-	const struct snd_soc_dapm_widget *widgets;
-	const struct snd_soc_dapm_route *routes;
-	int num_controls, num_widgets, num_routes, err, i = 0;
+	int err, i = 0;
 	char jack_name[NAME_SIZE];
 
-	switch (ctx->spkamp) {
-	case SPKAMP_MAX98357A:
-		controls = max98357a_controls;
-		num_controls = ARRAY_SIZE(max98357a_controls);
-		widgets = max98357a_widgets;
-		num_widgets = ARRAY_SIZE(max98357a_widgets);
-		routes = max98357a_routes;
-		num_routes = ARRAY_SIZE(max98357a_routes);
-		break;
-	case SPKAMP_MAX98390:
-		controls = max98390_controls;
-		num_controls = ARRAY_SIZE(max98390_controls);
-		widgets = max98390_widgets;
-		num_widgets = ARRAY_SIZE(max98390_widgets);
-		routes = max98390_routes;
-		num_routes = ARRAY_SIZE(max98390_routes);
-		break;
-	default:
-		dev_err(card->dev, "Invalid speaker amplifier %d\n", ctx->spkamp);
-		return -EINVAL;
-	}
-
-	err = snd_soc_dapm_new_controls(&card->dapm, widgets, num_widgets);
-	if (err) {
-		dev_err(card->dev, "Fail to new widgets\n");
-		return err;
-	}
-
-	err = snd_soc_add_card_controls(card, controls, num_controls);
-	if (err) {
-		dev_err(card->dev, "Fail to add controls\n");
-		return err;
-	}
-
-	err = snd_soc_dapm_add_routes(&card->dapm, routes, num_routes);
-	if (err) {
-		dev_err(card->dev, "Fail to add routes\n");
-		return err;
-	}
-
 	if (soc_intel_is_glk())
 		snd_soc_dapm_add_routes(&card->dapm, gemini_map,
 					ARRAY_SIZE(gemini_map));
@@ -785,11 +697,6 @@ static int broxton_audio_probe(struct platform_device *pdev)
 
 	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
 
-	if (acpi_dev_present("MX98390", NULL, -1))
-		ctx->spkamp = SPKAMP_MAX98390;
-	else
-		ctx->spkamp = SPKAMP_MAX98357A;
-
 	broxton_audio_card.dev = &pdev->dev;
 	snd_soc_card_set_drvdata(&broxton_audio_card, ctx);
 	if (soc_intel_is_glk()) {
@@ -817,13 +724,7 @@ static int broxton_audio_probe(struct platform_device *pdev)
 	} else if (soc_intel_is_cml()) {
 		unsigned int i;
 
-		if (ctx->spkamp == SPKAMP_MAX98390) {
-			broxton_audio_card.name = "cml_max98390_da7219";
-
-			broxton_audio_card.codec_conf = max98390_codec_confs;
-			broxton_audio_card.num_configs = ARRAY_SIZE(max98390_codec_confs);
-		} else
-			broxton_audio_card.name = "cmlda7219max";
+		broxton_audio_card.name = "cmlda7219max";
 
 		for (i = 0; i < ARRAY_SIZE(broxton_dais); i++) {
 			if (!broxton_dais[i].codecs->dai_name)
@@ -834,12 +735,6 @@ static int broxton_audio_probe(struct platform_device *pdev)
 					BXT_MAXIM_CODEC_DAI)) {
 				broxton_dais[i].name = "SSP1-Codec";
 				broxton_dais[i].cpus->dai_name = "SSP1 Pin";
-
-				if (ctx->spkamp == SPKAMP_MAX98390) {
-					broxton_dais[i].codecs = max98390_codec;
-					broxton_dais[i].num_codecs = ARRAY_SIZE(max98390_codec);
-					broxton_dais[i].dpcm_capture = 1;
-				}
 			}
 			/* DIALOG_CODEC is connected to SSP0 */
 			else if (!strcmp(broxton_dais[i].codecs->dai_name,
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index 160bfa0e5ef5..4217dbb716dc 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -75,7 +75,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
 	},
 	{
 		.id = "DLGS7219",
-		.drv_name = "cml_da7219_mx98357a",
+		.drv_name = "cml_da7219_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &max98390_spk_codecs,
 		.sof_tplg_filename = "sof-cml-da7219-max98390.tplg",
-- 
2.40.1

