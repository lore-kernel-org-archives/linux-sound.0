Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0711FBA
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272476; cv=none; b=Xx1gwT4LIaU5bskMWJbgib3TqgxvSSnW1LmF0+V3BWnXYiM0Rdu5e8zvIaf8Xx3kPUkTzGq++HKX+UBenpWpsIAyUuXi7pVOuFtvDSqCttdog61bbQEv+56OElOgNAUYe4Tm4U+AsrsJXjexOAbMxXgJwqI4VvTviLOjSqofCVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272476; c=relaxed/simple;
	bh=HFIS8DSM4gtpwh5ikvDkDU0pysFv6IRju/aU5bRKTQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KlS0CQDRysEqZxSWMS5noGicwOR1kiB+x6ujZLfFaofTWJnKc3Dhz8D80+ZwTy5+K4UBXTve0rqhVmcVD1j/omaUR0hkonl/oz+YwNX5NUX36SbzSFUP0B8zY7KoIz9G8jp2dAN5XZUVfzwYQPfSlVFdIZ1U3UZyYj7WRuTBlC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Afh+/XJM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Afh+/XJM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272475; x=1746808475;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HFIS8DSM4gtpwh5ikvDkDU0pysFv6IRju/aU5bRKTQQ=;
  b=Afh+/XJMpgcQYxQO+vUIKUDVb3o/kfYnQK7vha7sBIDAS0nibbODmeDD
   Cp70SeSg7qz4PUNCpxJLDuwsWYt7hbCnkV5qIeBCFyd+DHMwoeCZBlge2
   iILsPPBswrDDw34U74G6C4C0z9txerSzC8SCpRJc4oZ3SX0Hhq7u9BFPo
   Fk0vd+bZ9sQ/3eh5KVcK5LkwBpr8rAey1aUBbkPO5mcoVOqafl9jurUDG
   Evu3uy8zhs2Yrx57uWZYu673hH8087Es28VQx/1yos9DZFXVgZ3gSlGkb
   +Vz5+RMBixLdTWJcsxzFB1+78CZwxte88kFHOPDfyAzSYjDxnMeHbbFnP
   g==;
X-CSE-ConnectionGUID: iCKrrzD2TWyspeRup+xRPA==
X-CSE-MsgGUID: Db0SAH1GRfyHX48ttJTi9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017604"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15017604"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:33 -0700
X-CSE-ConnectionGUID: zImrGnULSY2xMlqGC2x2ug==
X-CSE-MsgGUID: DLgolRc3RY+oU0lI0mma4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="33761040"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 14/18] ASoC: Intel: sof_sdw: use generic name for controls/widgets
Date: Thu,  9 May 2024 11:34:14 -0500
Message-Id: <20240509163418.67746-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Some controls and widgets have exactly the same items. Rename them to be
generic. This is a preparation for further cleanup. No function change.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_cs42l42.c       | 12 ++++++------
 sound/soc/intel/boards/sof_sdw_cs42l43.c       | 18 +++++++++---------
 sound/soc/intel/boards/sof_sdw_cs_amp.c        |  6 +++---
 sound/soc/intel/boards/sof_sdw_rt5682.c        | 12 ++++++------
 sound/soc/intel/boards/sof_sdw_rt711.c         | 12 ++++++------
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c    | 12 ++++++------
 sound/soc/intel/boards/sof_sdw_rt722_sdca.c    | 12 ++++++------
 sound/soc/intel/boards/sof_sdw_rt_amp.c        | 18 +++++++++---------
 .../intel/boards/sof_sdw_rt_sdca_jack_common.c | 12 ++++++------
 9 files changed, 57 insertions(+), 57 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_cs42l42.c b/sound/soc/intel/boards/sof_sdw_cs42l42.c
index b999f4e7901a..82555c53a9c9 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l42.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l42.c
@@ -17,7 +17,7 @@
 #include <sound/jack.h>
 #include "sof_sdw_common.h"
 
-static const struct snd_soc_dapm_widget cs42l42_widgets[] = {
+static const struct snd_soc_dapm_widget generic_jack_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
@@ -30,7 +30,7 @@ static const struct snd_soc_dapm_route cs42l42_map[] = {
 	{"cs42l42 HS", NULL, "Headset Mic"},
 };
 
-static const struct snd_kcontrol_new cs42l42_controls[] = {
+static const struct snd_kcontrol_new generic_jack_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
@@ -70,15 +70,15 @@ int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, cs42l42_controls,
-					ARRAY_SIZE(cs42l42_controls));
+	ret = snd_soc_add_card_controls(card, generic_jack_controls,
+					ARRAY_SIZE(generic_jack_controls));
 	if (ret) {
 		dev_err(card->dev, "cs42l42 control addition failed: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, cs42l42_widgets,
-					ARRAY_SIZE(cs42l42_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_jack_widgets,
+					ARRAY_SIZE(generic_jack_widgets));
 	if (ret) {
 		dev_err(card->dev, "cs42l42 widgets addition failed: %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l43.c b/sound/soc/intel/boards/sof_sdw_cs42l43.c
index 0fd5e099bb1a..f76a16795fda 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l43.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l43.c
@@ -18,7 +18,7 @@
 #include <sound/soc-dapm.h>
 #include "sof_sdw_common.h"
 
-static const struct snd_soc_dapm_widget cs42l43_hs_widgets[] = {
+static const struct snd_soc_dapm_widget generic_jack_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
@@ -30,7 +30,7 @@ static const struct snd_soc_dapm_route cs42l43_hs_map[] = {
 	{ "cs42l43 ADC1_IN1_N", NULL, "Headset Mic" },
 };
 
-static const struct snd_soc_dapm_widget cs42l43_spk_widgets[] = {
+static const struct snd_soc_dapm_widget generic_spk_widgets[] = {
 	SND_SOC_DAPM_SPK("Speaker", NULL),
 };
 
@@ -41,7 +41,7 @@ static const struct snd_soc_dapm_route cs42l43_spk_map[] = {
 	{ "Speaker", NULL, "cs42l43 AMP2_OUT_N", },
 };
 
-static const struct snd_soc_dapm_widget cs42l43_dmic_widgets[] = {
+static const struct snd_soc_dapm_widget generic_dmic_widgets[] = {
 	SND_SOC_DAPM_MIC("DMIC", NULL),
 };
 
@@ -74,8 +74,8 @@ int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, cs42l43_hs_widgets,
-					ARRAY_SIZE(cs42l43_hs_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_jack_widgets,
+					ARRAY_SIZE(generic_jack_widgets));
 	if (ret) {
 		dev_err(card->dev, "cs42l43 hs widgets addition failed: %d\n", ret);
 		return ret;
@@ -133,8 +133,8 @@ int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 			return -ENOMEM;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, cs42l43_spk_widgets,
-					ARRAY_SIZE(cs42l43_spk_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_spk_widgets,
+					ARRAY_SIZE(generic_spk_widgets));
 	if (ret) {
 		dev_err(card->dev, "cs42l43 speaker widgets addition failed: %d\n", ret);
 		return ret;
@@ -172,8 +172,8 @@ int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, cs42l43_dmic_widgets,
-					ARRAY_SIZE(cs42l43_dmic_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_dmic_widgets,
+					ARRAY_SIZE(generic_dmic_widgets));
 	if (ret) {
 		dev_err(card->dev, "cs42l43 dmic widgets addition failed: %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/sof_sdw_cs_amp.c b/sound/soc/intel/boards/sof_sdw_cs_amp.c
index 3538d3c752b7..e15a4753f103 100644
--- a/sound/soc/intel/boards/sof_sdw_cs_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_cs_amp.c
@@ -14,7 +14,7 @@
 
 #define CODEC_NAME_SIZE	8
 
-static const struct snd_soc_dapm_widget sof_widgets[] = {
+static const struct snd_soc_dapm_widget generic_spk_widgets[] = {
 	SND_SOC_DAPM_SPK("Speaker", NULL),
 };
 
@@ -35,8 +35,8 @@ int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, sof_widgets,
-					ARRAY_SIZE(sof_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_spk_widgets,
+					ARRAY_SIZE(generic_spk_widgets));
 	if (ret) {
 		dev_err(card->dev, "widgets addition failed: %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt5682.c b/sound/soc/intel/boards/sof_sdw_rt5682.c
index f812aea64322..9fbe36322a83 100644
--- a/sound/soc/intel/boards/sof_sdw_rt5682.c
+++ b/sound/soc/intel/boards/sof_sdw_rt5682.c
@@ -17,7 +17,7 @@
 #include <sound/jack.h>
 #include "sof_sdw_common.h"
 
-static const struct snd_soc_dapm_widget rt5682_widgets[] = {
+static const struct snd_soc_dapm_widget generic_jack_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
@@ -29,7 +29,7 @@ static const struct snd_soc_dapm_route rt5682_map[] = {
 	{ "rt5682 IN1P", NULL, "Headset Mic" },
 };
 
-static const struct snd_kcontrol_new rt5682_controls[] = {
+static const struct snd_kcontrol_new generic_jack_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
@@ -69,15 +69,15 @@ int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, rt5682_controls,
-					ARRAY_SIZE(rt5682_controls));
+	ret = snd_soc_add_card_controls(card, generic_jack_controls,
+					ARRAY_SIZE(generic_jack_controls));
 	if (ret) {
 		dev_err(card->dev, "rt5682 control addition failed: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt5682_widgets,
-					ARRAY_SIZE(rt5682_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_jack_widgets,
+					ARRAY_SIZE(generic_jack_widgets));
 	if (ret) {
 		dev_err(card->dev, "rt5682 widgets addition failed: %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 7e54fc5cbe09..1a0f6692034a 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -42,7 +42,7 @@ static int rt711_add_codec_device_props(struct device *sdw_dev)
 	return ret;
 }
 
-static const struct snd_soc_dapm_widget rt711_widgets[] = {
+static const struct snd_soc_dapm_widget generic_jack_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
@@ -53,7 +53,7 @@ static const struct snd_soc_dapm_route rt711_map[] = {
 	{ "rt711 MIC2", NULL, "Headset Mic" },
 };
 
-static const struct snd_kcontrol_new rt711_controls[] = {
+static const struct snd_kcontrol_new generic_jack_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
@@ -93,15 +93,15 @@ int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, rt711_controls,
-					ARRAY_SIZE(rt711_controls));
+	ret = snd_soc_add_card_controls(card, generic_jack_controls,
+					ARRAY_SIZE(generic_jack_controls));
 	if (ret) {
 		dev_err(card->dev, "rt711 controls addition failed: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt711_widgets,
-					ARRAY_SIZE(rt711_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_jack_widgets,
+					ARRAY_SIZE(generic_jack_widgets));
 	if (ret) {
 		dev_err(card->dev, "rt711 widgets addition failed: %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
index 0c4cd4cdbd45..42308228c634 100644
--- a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
@@ -15,7 +15,7 @@
 #include <sound/soc-dapm.h>
 #include "sof_sdw_common.h"
 
-static const struct snd_soc_dapm_widget rt712_spk_widgets[] = {
+static const struct snd_soc_dapm_widget generic_spk_widgets[] = {
 	SND_SOC_DAPM_SPK("Speaker", NULL),
 };
 
@@ -30,7 +30,7 @@ static const struct snd_soc_dapm_route rt712_spk_map[] = {
 	{ "Speaker", NULL, "rt712 SPOR" },
 };
 
-static const struct snd_kcontrol_new rt712_spk_controls[] = {
+static const struct snd_kcontrol_new generic_spk_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 };
 
@@ -45,15 +45,15 @@ int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, rt712_spk_controls,
-					ARRAY_SIZE(rt712_spk_controls));
+	ret = snd_soc_add_card_controls(card, generic_spk_controls,
+					ARRAY_SIZE(generic_spk_controls));
 	if (ret) {
 		dev_err(card->dev, "rt712 spk controls addition failed: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt712_spk_widgets,
-					ARRAY_SIZE(rt712_spk_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_spk_widgets,
+					ARRAY_SIZE(generic_spk_widgets));
 	if (ret) {
 		dev_err(card->dev, "rt712 spk widgets addition failed: %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
index e5c2a36e400b..1653e45a0f7d 100644
--- a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
@@ -15,7 +15,7 @@
 #include <sound/soc-dapm.h>
 #include "sof_sdw_common.h"
 
-static const struct snd_soc_dapm_widget rt722_spk_widgets[] = {
+static const struct snd_soc_dapm_widget generic_spk_widgets[] = {
 	SND_SOC_DAPM_SPK("Speaker", NULL),
 };
 
@@ -23,7 +23,7 @@ static const struct snd_soc_dapm_route rt722_spk_map[] = {
 	{ "Speaker", NULL, "rt722 SPK" },
 };
 
-static const struct snd_kcontrol_new rt722_spk_controls[] = {
+static const struct snd_kcontrol_new generic_spk_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 };
 
@@ -38,15 +38,15 @@ int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, rt722_spk_controls,
-					ARRAY_SIZE(rt722_spk_controls));
+	ret = snd_soc_add_card_controls(card, generic_spk_controls,
+					ARRAY_SIZE(generic_spk_controls));
 	if (ret) {
 		dev_err(card->dev, "failed to add rt722 spk controls: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt722_spk_widgets,
-					ARRAY_SIZE(rt722_spk_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_spk_widgets,
+					ARRAY_SIZE(generic_spk_widgets));
 	if (ret) {
 		dev_err(card->dev, "failed to add rt722 spk widgets: %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
index 1b415708500e..03e0978e6a88 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -131,14 +131,14 @@ static int rt_amp_add_device_props(struct device *sdw_dev)
 	return ret;
 }
 
-static const struct snd_kcontrol_new rt_amp_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Speaker"),
-};
-
-static const struct snd_soc_dapm_widget rt_amp_widgets[] = {
+static const struct snd_soc_dapm_widget generic_spk_widgets[] = {
 	SND_SOC_DAPM_SPK("Speaker", NULL),
 };
 
+static const struct snd_kcontrol_new generic_spk_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
 /*
  * dapm routes for rt1308/rt1316/rt1318 will be registered dynamically
  * according to the number of rt1308/rt1316/rt1318 used. The first two
@@ -202,15 +202,15 @@ int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, rt_amp_controls,
-					ARRAY_SIZE(rt_amp_controls));
+	ret = snd_soc_add_card_controls(card, generic_spk_controls,
+					ARRAY_SIZE(generic_spk_controls));
 	if (ret) {
 		dev_err(card->dev, "%s controls addition failed: %d\n", codec_name, ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt_amp_widgets,
-					ARRAY_SIZE(rt_amp_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_spk_widgets,
+					ARRAY_SIZE(generic_spk_widgets));
 	if (ret) {
 		dev_err(card->dev, "%s widgets addition failed: %d\n", codec_name, ret);
 		return ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index 69161ea5b290..932fba8ccf9a 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -43,7 +43,7 @@ static int rt_sdca_jack_add_codec_device_props(struct device *sdw_dev)
 	return ret;
 }
 
-static const struct snd_soc_dapm_widget rt_sdca_jack_widgets[] = {
+static const struct snd_soc_dapm_widget generic_jack_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
@@ -68,7 +68,7 @@ static const struct snd_soc_dapm_route rt722_sdca_map[] = {
 	{ "rt722 MIC2", NULL, "Headset Mic" },
 };
 
-static const struct snd_kcontrol_new rt_sdca_jack_controls[] = {
+static const struct snd_kcontrol_new generic_jack_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
@@ -129,15 +129,15 @@ int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
 		}
 	}
 
-	ret = snd_soc_add_card_controls(card, rt_sdca_jack_controls,
-					ARRAY_SIZE(rt_sdca_jack_controls));
+	ret = snd_soc_add_card_controls(card, generic_jack_controls,
+					ARRAY_SIZE(generic_jack_controls));
 	if (ret) {
 		dev_err(card->dev, "rt sdca jack controls addition failed: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt_sdca_jack_widgets,
-					ARRAY_SIZE(rt_sdca_jack_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_jack_widgets,
+					ARRAY_SIZE(generic_jack_widgets));
 	if (ret) {
 		dev_err(card->dev, "rt sdca jack widgets addition failed: %d\n", ret);
 		return ret;
-- 
2.40.1

