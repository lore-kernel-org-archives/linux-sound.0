Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AF93B798
	for <linux-sound@vger.kernel.org>; Thu, 11 Apr 2024 22:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712873060; cv=none; b=K80+TnoOYHONH15DecDSZ6VWJFDf4aY3WYhmKTUdiBxH3zCeYUNT85x1p3TqKdq7+dAF5qaqG4uJaqltbh4vnq/iEJUpiuRH3K1ECdWg4ZbIzhNAwbfcgPngnS3WFZA8g38QJcSLIboJsPwK+hlMBW2jOWN0Kf9pdAhwWGKZtb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712873060; c=relaxed/simple;
	bh=wBjDQokRYtq31R2Ea4yafBKooKGT/vw7/VmQBBy8a+4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FW2ARQXT+DbO0Xg3cem0J5uzIQipLGCpCQH2IjpWXXRJ0tstHUk++TxJosggaMpmGj/jP/8i4pk53n+qjLVn8hKROUgCxX6JkZ8VRc23PeKOh9E00uV8czX4e8lBoXF9xwCHnKXheucgFnyjcSUkpcKJo0mC3bHZ+aV+VHT9Gzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1s53ilm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1s53ilm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873059; x=1744409059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wBjDQokRYtq31R2Ea4yafBKooKGT/vw7/VmQBBy8a+4=;
  b=Q1s53ilmXslkrfV78PZobr8TyczQE5Rw3dB4bjCCD2VZpp0EEmaoUtrT
   PZ8LA6xgniOAomPrYfAs/OJVOHzxKXYgODuEzwBUF9TTdNM2uJLD88foi
   Quhi4vrD1oq8ghqBWaM2lpDzqHb8mPdV6I6qA953CuVdSO9lx6sPh8KMk
   Nk7hct+R24skbRReZYkWf5nAc6b6rGCcyASP7prMgTnpMVqz7MardP1vH
   AuUgh24ZMaasmN+PQlWmno+9R03C5Th/7Q1HSQOnZNls030JrXEW4wWg7
   gSm/3th97KPM3pu/bJUWIVGpBBFVrBc7mHI0Xik5US0jrLQFnFqvYz2PN
   g==;
X-CSE-ConnectionGUID: Y7CkP8SpRlCBU0f2MkmVSQ==
X-CSE-MsgGUID: 0XUQ0M/vQY6T7v5d1LEeOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708378"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="19708378"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:18 -0700
X-CSE-ConnectionGUID: VTGykaW1Qj2E315oyOi9Xw==
X-CSE-MsgGUID: XskPlUCcQ326x8vZdb6RLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="21628760"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 09/12] ASoC: Intel: sof_realtek_common: support 4xALC1011 amplifier
Date: Thu, 11 Apr 2024 17:03:44 -0500
Message-Id: <20240411220347.131267-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add support for boards with four ALC1011 amplifiers. Configuration is
copied from cml_rt1011_rt5682 machine driver for backward
compatibility with existing cml devices.

Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_realtek_common.c | 178 +++++++++++++++++---
 sound/soc/intel/boards/sof_realtek_common.h |   4 +-
 sound/soc/intel/boards/sof_rt5682.c         |   4 +-
 3 files changed, 162 insertions(+), 24 deletions(-)

diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index 80c8687cd1da..20d094c52d28 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -15,10 +15,40 @@
 #include "../../codecs/rt1011.h"
 #include "../../codecs/rt1015.h"
 #include "../../codecs/rt1308.h"
+#include "../common/soc-intel-quirks.h"
 #include "sof_realtek_common.h"
 
 /*
- * Current only 2-amp configuration is supported for rt1011
+ * Common structures and functions
+ */
+static const struct snd_kcontrol_new realtek_4spk_kcontrols[] = {
+	SOC_DAPM_PIN_SWITCH("WL Ext Spk"),
+	SOC_DAPM_PIN_SWITCH("WR Ext Spk"),
+	SOC_DAPM_PIN_SWITCH("TL Ext Spk"),
+	SOC_DAPM_PIN_SWITCH("TR Ext Spk"),
+};
+
+static const struct snd_soc_dapm_widget realtek_4spk_widgets[] = {
+	SND_SOC_DAPM_SPK("WL Ext Spk", NULL),
+	SND_SOC_DAPM_SPK("WR Ext Spk", NULL),
+	SND_SOC_DAPM_SPK("TL Ext Spk", NULL),
+	SND_SOC_DAPM_SPK("TR Ext Spk", NULL),
+};
+
+/* helper function to get the number of specific codec */
+static unsigned int get_num_codecs(const char *hid)
+{
+	struct acpi_device *adev;
+	unsigned int dev_num = 0;
+
+	for_each_acpi_dev_match(adev, hid, NULL, -1)
+		dev_num++;
+
+	return dev_num;
+}
+
+/*
+ * Realtek ALC1011
  */
 static const struct snd_soc_dapm_route speaker_map_lr[] = {
 	/* speaker */
@@ -26,16 +56,14 @@ static const struct snd_soc_dapm_route speaker_map_lr[] = {
 	{ "Right Spk", NULL, "Right SPO" },
 };
 
-/*
- * Make sure device's Unique ID follows this configuration:
- *
- * Two speakers:
- *         0: left, 1: right
- * Four speakers:
- *         0: Woofer left, 1: Woofer right
- *         2: Tweeter left, 3: Tweeter right
- */
-static struct snd_soc_codec_conf rt1011_codec_confs[] = {
+static const struct snd_soc_dapm_route rt1011_4spk_routes[] = {
+	{"WL Ext Spk", NULL, "WL SPO" },
+	{"WR Ext Spk", NULL, "WR SPO" },
+	{"TL Ext Spk", NULL, "TL SPO" },
+	{"TR Ext Spk", NULL, "TR SPO" },
+};
+
+static struct snd_soc_codec_conf rt1011_2spk_codec_confs[] = {
 	{
 		.dlc = COMP_CODEC_CONF(RT1011_DEV0_NAME),
 		.name_prefix = "Left",
@@ -46,6 +74,25 @@ static struct snd_soc_codec_conf rt1011_codec_confs[] = {
 	},
 };
 
+static struct snd_soc_codec_conf rt1011_4spk_codec_confs[] = {
+	{
+		.dlc = COMP_CODEC_CONF(RT1011_DEV0_NAME),
+		.name_prefix = "WL",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(RT1011_DEV1_NAME),
+		.name_prefix = "WR",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(RT1011_DEV2_NAME),
+		.name_prefix = "TL",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(RT1011_DEV3_NAME),
+		.name_prefix = "TR",
+	},
+};
+
 static struct snd_soc_dai_link_component rt1011_dai_link_components[] = {
 	{
 		.name = RT1011_DEV0_NAME,
@@ -55,6 +102,14 @@ static struct snd_soc_dai_link_component rt1011_dai_link_components[] = {
 		.name = RT1011_DEV1_NAME,
 		.dai_name = RT1011_CODEC_DAI,
 	},
+	{
+		.name = RT1011_DEV2_NAME,
+		.dai_name = RT1011_CODEC_DAI,
+	},
+	{
+		.name = RT1011_DEV3_NAME,
+		.dai_name = RT1011_CODEC_DAI,
+	},
 };
 
 static const struct {
@@ -63,6 +118,8 @@ static const struct {
 } rt1011_tdm_mask[] = {
 	{.tx = 0x4, .rx = 0x1},
 	{.tx = 0x8, .rx = 0x2},
+	{.tx = 0x1, .rx = 0x1},
+	{.tx = 0x2, .rx = 0x2},
 };
 
 static int rt1011_hw_params(struct snd_pcm_substream *substream,
@@ -118,28 +175,109 @@ static const struct snd_soc_ops rt1011_ops = {
 static int rt1011_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	unsigned int num_codecs = get_num_codecs(RT1011_ACPI_HID);
 	int ret;
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, speaker_map_lr,
-				      ARRAY_SIZE(speaker_map_lr));
-	if (ret)
-		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
+	switch (num_codecs) {
+	case 2:
+		if (!soc_intel_is_cml()) {
+			ret = snd_soc_dapm_add_routes(&card->dapm, speaker_map_lr,
+						      ARRAY_SIZE(speaker_map_lr));
+			if (ret) {
+				dev_err(rtd->dev, "fail to add rt1011 routes, ret %d\n",
+					ret);
+				return ret;
+			}
+
+			break;
+		}
+
+		/*
+		 * register speaker widgets "WL Ext Spk" and "WR Ext Spk" to
+		 * keep backward compatible with cml devices
+		 */
+		fallthrough;
+	case 4:
+		ret = snd_soc_dapm_new_controls(&card->dapm, realtek_4spk_widgets,
+						num_codecs);
+		if (ret) {
+			dev_err(rtd->dev, "fail to add rt1011 widgets, ret %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = snd_soc_add_card_controls(card, realtek_4spk_kcontrols,
+						num_codecs);
+		if (ret) {
+			dev_err(rtd->dev, "fail to add rt1011 controls, ret %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = snd_soc_dapm_add_routes(&card->dapm, rt1011_4spk_routes,
+					      num_codecs);
+		if (ret) {
+			dev_err(rtd->dev, "fail to add rt1011 routes, ret %d\n",
+				ret);
+			return ret;
+		}
+		break;
+	default:
+		dev_err(rtd->dev, "rt1011: invalid num_codecs %d\n", num_codecs);
+		return -EINVAL;
+	}
+
 	return ret;
 }
 
-void sof_rt1011_dai_link(struct snd_soc_dai_link *link)
+void sof_rt1011_dai_link(struct device *dev, struct snd_soc_dai_link *link)
 {
+	unsigned int num_codecs = get_num_codecs(RT1011_ACPI_HID);
+
 	link->codecs = rt1011_dai_link_components;
-	link->num_codecs = ARRAY_SIZE(rt1011_dai_link_components);
+
+	switch (num_codecs) {
+	case 2:
+	case 4:
+		link->num_codecs = num_codecs;
+		break;
+	default:
+		dev_err(dev, "rt1011: invalid num_codecs %d\n", num_codecs);
+		break;
+	}
+
 	link->init = rt1011_init;
 	link->ops = &rt1011_ops;
 }
 EXPORT_SYMBOL_NS(sof_rt1011_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
 
-void sof_rt1011_codec_conf(struct snd_soc_card *card)
+void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card *card)
 {
-	card->codec_conf = rt1011_codec_confs;
-	card->num_configs = ARRAY_SIZE(rt1011_codec_confs);
+	unsigned int num_codecs = get_num_codecs(RT1011_ACPI_HID);
+
+	switch (num_codecs) {
+	case 2:
+		if (soc_intel_is_cml()) {
+			/*
+			 * use name prefix 'WL' and 'WR' for speaker widgets to
+			 * keep backward compatible with cml devices
+			 */
+			card->codec_conf = rt1011_4spk_codec_confs;
+		} else {
+			card->codec_conf = rt1011_2spk_codec_confs;
+		}
+
+		card->num_configs = num_codecs;
+		break;
+	case 4:
+		card->codec_conf = rt1011_4spk_codec_confs;
+		card->num_configs = ARRAY_SIZE(rt1011_4spk_codec_confs);
+		break;
+	default:
+		dev_err(dev, "rt1011: invalid num_codecs %d\n", num_codecs);
+		break;
+	}
+
 }
 EXPORT_SYMBOL_NS(sof_rt1011_codec_conf, SND_SOC_INTEL_SOF_REALTEK_COMMON);
 
diff --git a/sound/soc/intel/boards/sof_realtek_common.h b/sound/soc/intel/boards/sof_realtek_common.h
index 289e85b61660..d0e331530b39 100644
--- a/sound/soc/intel/boards/sof_realtek_common.h
+++ b/sound/soc/intel/boards/sof_realtek_common.h
@@ -23,8 +23,8 @@
 #define RT1011_DEV2_NAME	"i2c-" RT1011_ACPI_HID ":02"
 #define RT1011_DEV3_NAME	"i2c-" RT1011_ACPI_HID ":03"
 
-void sof_rt1011_dai_link(struct snd_soc_dai_link *link);
-void sof_rt1011_codec_conf(struct snd_soc_card *card);
+void sof_rt1011_dai_link(struct device *dev, struct snd_soc_dai_link *link);
+void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card *card);
 
 /*
  * Realtek ALC1015 (AUTO)
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 966bcd3e8bdc..326d23dd79de 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -576,7 +576,7 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 		max_98390_dai_link(dev, ctx->amp_link);
 		break;
 	case CODEC_RT1011:
-		sof_rt1011_dai_link(ctx->amp_link);
+		sof_rt1011_dai_link(dev, ctx->amp_link);
 		break;
 	case CODEC_RT1015:
 		sof_rt1015_dai_link(ctx->amp_link);
@@ -683,7 +683,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 		max_98390_set_codec_conf(&pdev->dev, &sof_audio_card_rt5682);
 		break;
 	case CODEC_RT1011:
-		sof_rt1011_codec_conf(&sof_audio_card_rt5682);
+		sof_rt1011_codec_conf(&pdev->dev, &sof_audio_card_rt5682);
 		break;
 	case CODEC_RT1015:
 		sof_rt1015_codec_conf(&sof_audio_card_rt5682);
-- 
2.40.1

