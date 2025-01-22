Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A75214802
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 17:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737567651; cv=none; b=XbUPO763wlM0chNO7ro5t5UK8QRJOrrQaztpBpGHVdc4vT2ZJY08ixRiylyGR8x4MblhoHQJRFJBQiffxBVyAk/V1ynU4MRUGxDrwaYb6XPwcx7XZrfb328Ic56HnnLVnHgYxmX7KYMJC/ns/Pd8beEZUZCHyQ8ogYDX/RIjR28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737567651; c=relaxed/simple;
	bh=al2ZSdd43HJiM8vEjAjWDLTR8k7lH1ydqgzofjuLmOk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RJ7xi4bq2Sia/zFsCoDn2nZTakNjq3F41t2xXCG4GGyxobKONqRjSK5f8VVs1XnMjX0pnDJU1YomJQXKoHzHSSLmz8A+s0E450qIjQpeI3gndMtFHp1xsuYHeOtawWJcIqu4LMyjcuur6bDXVBwz9EOE43xdWBHlqGh49QxQILY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUEOCvQv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUEOCvQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737567650; x=1769103650;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=al2ZSdd43HJiM8vEjAjWDLTR8k7lH1ydqgzofjuLmOk=;
  b=QUEOCvQvpD4+yXtliuKWaBiQVaP62UhvcK/NzcpEAaD7aMT6pab8R0we
   hO7MH9N6dxPUUZY+Zde4U2FjLJFn4jXmxM8yARpTrXcw1YZ1P03IPkr/k
   Tf3rFxzXfvC5SyVFQcrtZnQFe7UpqMQEvBzGZxIwnVDk/Rmyf/le/5LKA
   u82cMePrMm04iOC5Bpxevb/7EZ/8T4q0vjxrgkWPr+FNuxhfK2avQsh5W
   GDdZ9KD5d85Gi3HpMsMlgnPb/TnIKJN8IxVMrEIOD00P8QE+Ebw1FPapw
   IUOPsf4jD2kWTPudZUHxq2SahiKBtXJQ0TgrGGptZDZm18Em+QrRXVIeb
   w==;
X-CSE-ConnectionGUID: KpJ7ue1mTZWMjDk+o9CkVQ==
X-CSE-MsgGUID: 3UOHQIlVSbOiXs+8a0Udnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49434739"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="49434739"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 09:40:50 -0800
X-CSE-ConnectionGUID: k+Y4BZuSTcaikFEe/nwXSA==
X-CSE-MsgGUID: H82RdEqdQXSPRTArdY2DPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112185260"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa003.jf.intel.com with ESMTP; 22 Jan 2025 09:40:47 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 04/11] ASoC: Intel: avs: Add pcm3168a machine board
Date: Wed, 22 Jan 2025 18:54:19 +0100
Message-Id: <20250122175426.1369059-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122175426.1369059-1-cezary.rojewski@intel.com>
References: <20250122175426.1369059-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To support AVS-pcm3168a configuration add machine board connecting AVS
platform component driver with pcm3168a codec one.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/Kconfig    |  10 ++
 sound/soc/intel/avs/boards/Makefile   |   2 +
 sound/soc/intel/avs/boards/pcm3168a.c | 162 ++++++++++++++++++++++++++
 3 files changed, 174 insertions(+)
 create mode 100644 sound/soc/intel/avs/boards/pcm3168a.c

diff --git a/sound/soc/intel/avs/boards/Kconfig b/sound/soc/intel/avs/boards/Kconfig
index 00b0f6c176d6..ba4bee42124c 100644
--- a/sound/soc/intel/avs/boards/Kconfig
+++ b/sound/soc/intel/avs/boards/Kconfig
@@ -87,6 +87,16 @@ config SND_SOC_INTEL_AVS_MACH_NAU8825
 	   Say Y or m if you have such a device. This is a recommended option.
 	   If unsure select "N".
 
+config SND_SOC_INTEL_AVS_MACH_PCM3168A
+	tristate "pcm3168a I2S board"
+	depends on I2C
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	select SND_SOC_PCM3168A_I2C
+	help
+	  This adds support for AVS with PCM3168A I2C codec configuration.
+	  Say Y or m if you have such a device. This is a recommended option.
+	  If unsure select "N".
+
 config SND_SOC_INTEL_AVS_MACH_PROBE
 	tristate "Probing (data) board"
 	depends on DEBUG_FS
diff --git a/sound/soc/intel/avs/boards/Makefile b/sound/soc/intel/avs/boards/Makefile
index 4fbd936ffb3e..a95256b94dc8 100644
--- a/sound/soc/intel/avs/boards/Makefile
+++ b/sound/soc/intel/avs/boards/Makefile
@@ -9,6 +9,7 @@ snd-soc-avs-max98927-y := max98927.o
 snd-soc-avs-max98357a-y := max98357a.o
 snd-soc-avs-max98373-y := max98373.o
 snd-soc-avs-nau8825-y := nau8825.o
+snd-soc-avs-pcm3168a-y := pcm3168a.o
 snd-soc-avs-probe-y := probe.o
 snd-soc-avs-rt274-y := rt274.o
 snd-soc-avs-rt286-y := rt286.o
@@ -27,6 +28,7 @@ obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_MAX98927) += snd-soc-avs-max98927.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_MAX98357A) += snd-soc-avs-max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_MAX98373) += snd-soc-avs-max98373.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_NAU8825) += snd-soc-avs-nau8825.o
+obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_PCM3168A) += snd-soc-avs-pcm3168a.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_PROBE) += snd-soc-avs-probe.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT274) += snd-soc-avs-rt274.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT286) += snd-soc-avs-rt286.o
diff --git a/sound/soc/intel/avs/boards/pcm3168a.c b/sound/soc/intel/avs/boards/pcm3168a.c
new file mode 100644
index 000000000000..ec6fb736d228
--- /dev/null
+++ b/sound/soc/intel/avs/boards/pcm3168a.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2024-2025 Intel Corporation
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+static const struct snd_soc_dapm_widget card_widgets[] = {
+	SND_SOC_DAPM_HP("CPB Stereo HP 1", NULL),
+	SND_SOC_DAPM_HP("CPB Stereo HP 2", NULL),
+	SND_SOC_DAPM_HP("CPB Stereo HP 3", NULL),
+	SND_SOC_DAPM_LINE("CPB Line Out", NULL),
+	SND_SOC_DAPM_MIC("CPB Stereo Mic 1", NULL),
+	SND_SOC_DAPM_MIC("CPB Stereo Mic 2", NULL),
+	SND_SOC_DAPM_LINE("CPB Line In", NULL),
+};
+
+static const struct snd_soc_dapm_route card_routes[] = {
+	{ "CPB Stereo HP 1", NULL, "AOUT1L" },
+	{ "CPB Stereo HP 1", NULL, "AOUT1R" },
+	{ "CPB Stereo HP 2", NULL, "AOUT2L" },
+	{ "CPB Stereo HP 2", NULL, "AOUT2R" },
+	{ "CPB Stereo HP 3", NULL, "AOUT3L" },
+	{ "CPB Stereo HP 3", NULL, "AOUT3R" },
+	{ "CPB Line Out", NULL, "AOUT4L" },
+	{ "CPB Line Out", NULL, "AOUT4R" },
+
+	{ "AIN1L", NULL, "CPB Stereo Mic 1" },
+	{ "AIN1R", NULL, "CPB Stereo Mic 1" },
+	{ "AIN2L", NULL, "CPB Stereo Mic 2" },
+	{ "AIN2R", NULL, "CPB Stereo Mic 2" },
+	{ "AIN3L", NULL, "CPB Line In" },
+	{ "AIN3R", NULL, "CPB Line In" },
+};
+
+static int avs_pcm3168a_be_fixup(struct snd_soc_pcm_runtime *runtime,
+				 struct snd_pcm_hw_params *params)
+{
+	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+
+	/* Set SSP to 24 bit. */
+	snd_mask_none(fmt);
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
+
+	return 0;
+}
+
+static int avs_pcm3168a_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	int ret;
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, 24576000, SND_SOC_CLOCK_IN);
+	if (ret < 0)
+		dev_err(rtd->dev, "Set codec sysclk failed: %d\n", ret);
+
+	return ret;
+}
+
+static const struct snd_soc_ops avs_pcm3168a_ops = {
+	.hw_params = avs_pcm3168a_hw_params,
+};
+
+SND_SOC_DAILINK_DEF(pcm3168a_dac,
+		    DAILINK_COMP_ARRAY(COMP_CODEC("i2c-PCM3168A:00", "pcm3168a-dac")));
+SND_SOC_DAILINK_DEF(pcm3168a_adc,
+		    DAILINK_COMP_ARRAY(COMP_CODEC("i2c-PCM3168A:00", "pcm3168a-adc")));
+SND_SOC_DAILINK_DEF(cpu_ssp0, DAILINK_COMP_ARRAY(COMP_CPU("SSP0 Pin")));
+SND_SOC_DAILINK_DEF(cpu_ssp2, DAILINK_COMP_ARRAY(COMP_CPU("SSP2 Pin")));
+
+static int avs_create_dai_links(struct device *dev, struct snd_soc_dai_link **links, int *num_links)
+{
+	struct snd_soc_dai_link_component *platform;
+	struct snd_soc_dai_link *dl;
+	const int num_dl = 2;
+
+	dl = devm_kcalloc(dev, num_dl, sizeof(*dl), GFP_KERNEL);
+	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
+	if (!dl || !platform)
+		return -ENOMEM;
+
+	platform->name = dev_name(dev);
+	dl[0].num_cpus = 1;
+	dl[0].num_codecs = 1;
+	dl[0].platforms = platform;
+	dl[0].num_platforms = 1;
+	dl[0].dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBP_CFP;
+	dl[0].be_hw_params_fixup = avs_pcm3168a_be_fixup;
+	dl[0].nonatomic = 1;
+	dl[0].no_pcm = 1;
+	memcpy(&dl[1], &dl[0], sizeof(*dl));
+
+	dl[0].name = "SSP0-Codec-dac";
+	dl[0].cpus = cpu_ssp0;
+	dl[0].codecs = pcm3168a_dac;
+	dl[0].playback_only = 1;
+	dl[1].name = "SSP2-Codec-adc";
+	dl[1].cpus = cpu_ssp2;
+	dl[1].codecs = pcm3168a_adc;
+	dl[1].capture_only = 1;
+
+	*links = dl;
+	*num_links = num_dl;
+	return 0;
+}
+
+static int avs_pcm3168a_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct snd_soc_card *card;
+	int ret;
+
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+
+	ret = avs_create_dai_links(dev, &card->dai_link, &card->num_links);
+	if (ret)
+		return ret;
+
+	card->name = "avs_pcm3168a";
+	card->dev = dev;
+	card->owner = THIS_MODULE;
+	card->dapm_widgets = card_widgets;
+	card->num_dapm_widgets = ARRAY_SIZE(card_widgets);
+	card->dapm_routes = card_routes;
+	card->num_dapm_routes = ARRAY_SIZE(card_routes);
+	card->fully_routed = true;
+
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static const struct platform_device_id avs_pcm3168a_driver_ids[] = {
+	{
+		.name = "avs_pcm3168a",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, avs_pcm3168a_driver_ids);
+
+static struct platform_driver avs_pcm3168a_driver = {
+	.probe = avs_pcm3168a_probe,
+	.driver = {
+		.name = "avs_pcm3168a",
+		.pm = &snd_soc_pm_ops,
+	},
+	.id_table = avs_pcm3168a_driver_ids,
+};
+
+module_platform_driver(avs_pcm3168a_driver);
+
+MODULE_AUTHOR("Cezary Rojewski <cezary.rojewski@intel.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

