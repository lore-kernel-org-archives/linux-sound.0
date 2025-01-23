Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD401C5D4D
	for <linux-sound@vger.kernel.org>; Thu, 23 Jan 2025 16:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737649387; cv=none; b=t5sdxz6q+kAMAXz69ixIffkrl3ZGeTtDu0YtqF3xxu/o54vnkeoBW0ujioZKlRdAaDWrta073GVIFJCVPWQTWMZUhcFisuTp7UOXvPtMXUio4E4rmwKkR7a68t5xV2x48rk47E6+a3V5LKS6GOjPOpmIkR8WYuHBngHMph1hpuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737649387; c=relaxed/simple;
	bh=VG0XAZlE/WUXsVFESXR2camOCqaes5FU/Hr3y51b5KY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S2LSzBd4298+k7CQWsQkK/79/0a/wruSCi/t08Wpyao0rulwmDafIu2ClvwdZiuR4AupkCSWz4C+Z4TnTdGt9E+YA2yirxgJ1i8OjeYuQDkb0O0h0Qea1TrDzly4ZZjXXg5jSWdXp3UudB9Lx5xPu1OkVc31AXrQzCw8MY3rL6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghMOs7Uw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghMOs7Uw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737649386; x=1769185386;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VG0XAZlE/WUXsVFESXR2camOCqaes5FU/Hr3y51b5KY=;
  b=ghMOs7Uw1DD2UAIlFSc4TAuRWWeXuj2/5KL+a/Z4PULRjxiUoVRFiou3
   D8R9AeT7QfXYKXlId3k1Ic0hrSVpAnZF4cWX9xcy8d9U5MmedytIYDPG9
   98zDM0D3BfVxZ9XQwHkIvNLID+VhzPfms9OTQFvSgmZrcdiwB207eR8zA
   XDZ59RZIu7RXM7R2L77VenBGcDRFeBdKkKMt8/P64nWiBSQEpkqbTXujS
   bgsx6GCLFJTMiGsBCFJZNBpZ1YnJRD/AJ1GH6nJ/bvtxDSVcheH0KF9Te
   qMY048BR5WlGhmj1xGBzrg2O8qQh4WdA4CYWDWtVjkV8VSeIEjv+a1DQX
   w==;
X-CSE-ConnectionGUID: +OOlBe2KSXm0NcRxEkQ1AA==
X-CSE-MsgGUID: jFQHvg2CRX+4isUSRyVtYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55572512"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="55572512"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 08:23:06 -0800
X-CSE-ConnectionGUID: KSBd7lh6Q6Cel6ubTQNBFQ==
X-CSE-MsgGUID: 7tAeKGhbQOOhxpGfClH5Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107346745"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 08:23:03 -0800
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
Subject: [PATCH v2 04/11] ASoC: Intel: avs: Add pcm3168a machine board
Date: Thu, 23 Jan 2025 17:36:27 +0100
Message-Id: <20250123163634.1451237-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250123163634.1451237-1-cezary.rojewski@intel.com>
References: <20250123163634.1451237-1-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/pcm3168a.c | 161 ++++++++++++++++++++++++++
 3 files changed, 173 insertions(+)
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
index 000000000000..e26e9ceb8baf
--- /dev/null
+++ b/sound/soc/intel/avs/boards/pcm3168a.c
@@ -0,0 +1,161 @@
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
+	dl[1].name = "SSP2-Codec-adc";
+	dl[1].cpus = cpu_ssp2;
+	dl[1].codecs = pcm3168a_adc;
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
+MODULE_DESCRIPTION("Intel pcm3168a machine driver");
+MODULE_AUTHOR("Cezary Rojewski <cezary.rojewski@intel.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

