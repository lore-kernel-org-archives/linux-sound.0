Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB151C25B47
	for <linux-sound@archiver.kernel.org>; Fri, 27 Oct 2023 11:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345710AbjJ0LFf (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 27 Oct 2023 07:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345696AbjJ0LFd (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 27 Oct 2023 07:05:33 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE0E187
        for <linux-sound@vger.kernel.org>; Fri, 27 Oct 2023 04:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698404730; x=1729940730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VTDWqQn4GnA0fMwpjo1lFZPwjmU0ta8ZumGxGF2HtNs=;
  b=CYRiMxCft+2mbjQ7zMD3Cj4vwOIIYTUdTYf/HLWQ0xxl4e7BuBnrried
   xXnMIE8RmVrK0DGUOY5FiM77Fp4FBE2piZUN91hWMo3z624Yays0R4Kin
   ESZOdlA+2uz4Y407yn1DtH5wdwUKkxmYjk9st8Of0ynQcgNaXKa6wWvia
   dOJ+JuwwLTIJrHB+keSBrPZ/6FFw6Y90ClInxERleOFyfTjm7OW7BR/e5
   HTmSRV8w/eIbj1x2ICxLFZFl/h52AeNV1qDBUgJoH1twB942mkvnzScNb
   79oZ5FtKEnc1IfLyhmy3VXl4ZNpcRV4efSA+MdBdQXfQqCX6HviOPjr3O
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="418866471"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="418866471"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 04:05:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="736054987"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="736054987"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orsmga006.jf.intel.com with ESMTP; 27 Oct 2023 04:05:28 -0700
From:   =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org,
        =?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 1/2] ASoC: Intel: avs: Add rt5514 machine board
Date:   Fri, 27 Oct 2023 13:05:36 +0200
Message-Id: <20231027110537.2103712-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027110537.2103712-1-amadeuszx.slawinski@linux.intel.com>
References: <20231027110537.2103712-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

To support AVS-rt5514 configuration add machine board connecting AVS
platform component driver with rt5514 codec one.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/Kconfig  |  10 ++
 sound/soc/intel/avs/boards/Makefile |   2 +
 sound/soc/intel/avs/boards/rt5514.c | 187 ++++++++++++++++++++++++++++
 3 files changed, 199 insertions(+)
 create mode 100644 sound/soc/intel/avs/boards/rt5514.c

diff --git a/sound/soc/intel/avs/boards/Kconfig b/sound/soc/intel/avs/boards/Kconfig
index 07353d37ecae..00b0f6c176d6 100644
--- a/sound/soc/intel/avs/boards/Kconfig
+++ b/sound/soc/intel/avs/boards/Kconfig
@@ -125,6 +125,16 @@ config SND_SOC_INTEL_AVS_MACH_RT298
 	   Say Y or m if you have such a device. This is a recommended option.
 	   If unsure select "N".
 
+config SND_SOC_INTEL_AVS_MACH_RT5514
+	tristate "rt5514 in I2S mode"
+	depends on I2C
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	select SND_SOC_RT5514
+	help
+	   This adds support for ASoC machine driver with RT5514 I2S audio codec.
+	   Say Y or m if you have such a device. This is a recommended option.
+	   If unsure select "N".
+
 config SND_SOC_INTEL_AVS_MACH_RT5663
 	tristate "rt5663 in I2S mode"
 	depends on I2C
diff --git a/sound/soc/intel/avs/boards/Makefile b/sound/soc/intel/avs/boards/Makefile
index 34347bcd1e7d..0ff21d55be24 100644
--- a/sound/soc/intel/avs/boards/Makefile
+++ b/sound/soc/intel/avs/boards/Makefile
@@ -13,6 +13,7 @@ snd-soc-avs-probe-objs := probe.o
 snd-soc-avs-rt274-objs := rt274.o
 snd-soc-avs-rt286-objs := rt286.o
 snd-soc-avs-rt298-objs := rt298.o
+snd-soc-avs-rt5514-objs := rt5514.o
 snd-soc-avs-rt5663-objs := rt5663.o
 snd-soc-avs-rt5682-objs := rt5682.o
 snd-soc-avs-ssm4567-objs := ssm4567.o
@@ -30,6 +31,7 @@ obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_PROBE) += snd-soc-avs-probe.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT274) += snd-soc-avs-rt274.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT286) += snd-soc-avs-rt286.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT298) += snd-soc-avs-rt298.o
+obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT5514) += snd-soc-avs-rt5514.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT5663) += snd-soc-avs-rt5663.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT5682) += snd-soc-avs-rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_SSM4567) += snd-soc-avs-ssm4567.o
diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
new file mode 100644
index 000000000000..ad486a52e5e3
--- /dev/null
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2023 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/clk.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "../../../codecs/rt5514.h"
+#include "../utils.h"
+
+#define RT5514_CODEC_DAI	"rt5514-aif1"
+
+static const struct snd_soc_dapm_widget card_widgets[] = {
+	SND_SOC_DAPM_MIC("DMIC", NULL),
+};
+
+static const struct snd_soc_dapm_route card_base_routes[] = {
+	/* DMIC */
+	{ "DMIC1L", NULL, "DMIC" },
+	{ "DMIC1R", NULL, "DMIC" },
+	{ "DMIC2L", NULL, "DMIC" },
+	{ "DMIC2R", NULL, "DMIC" },
+};
+
+static int avs_rt5514_codec_init(struct snd_soc_pcm_runtime *runtime)
+{
+	int ret = snd_soc_dapm_ignore_suspend(&runtime->card->dapm, "DMIC");
+
+	if (ret)
+		dev_err(runtime->dev, "DMIC - Ignore suspend failed = %d\n", ret);
+
+	return ret;
+}
+
+static int avs_rt5514_be_fixup(struct snd_soc_pcm_runtime *runtime,
+			       struct snd_pcm_hw_params *params)
+{
+	struct snd_interval *rate, *channels;
+	struct snd_mask *fmt;
+
+	rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+
+	rate->min = rate->max = 48000;
+	channels->min = channels->max = 4;
+
+	snd_mask_none(fmt);
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
+
+	return 0;
+}
+
+static int avs_rt5514_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	int ret;
+
+	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0xF, 0, 8, 16);
+	if (ret < 0) {
+		dev_err(rtd->dev, "set TDM slot err:%d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5514_SCLK_S_MCLK, 24576000, SND_SOC_CLOCK_IN);
+	if (ret < 0)
+		dev_err(rtd->dev, "set sysclk err: %d\n", ret);
+
+	return ret;
+}
+
+static const struct snd_soc_ops avs_rt5514_ops = {
+	.hw_params = avs_rt5514_hw_params,
+};
+
+static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
+			       int tdm_slot, struct snd_soc_dai_link **dai_link)
+{
+	struct snd_soc_dai_link_component *platform;
+	struct snd_soc_dai_link *dl;
+
+	dl = devm_kzalloc(dev, sizeof(*dl), GFP_KERNEL);
+	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
+	if (!dl || !platform)
+		return -ENOMEM;
+
+	platform->name = platform_name;
+
+	dl->name = devm_kasprintf(dev, GFP_KERNEL,
+				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
+	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
+	dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
+	if (!dl->name || !dl->cpus || !dl->codecs)
+		return -ENOMEM;
+
+	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+					    AVS_STRING_FMT("SSP", " Pin", ssp_port, tdm_slot));
+	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "i2c-10EC5514:00");
+	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, RT5514_CODEC_DAI);
+	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
+		return -ENOMEM;
+
+	dl->num_cpus = 1;
+	dl->num_codecs = 1;
+	dl->platforms = platform;
+	dl->num_platforms = 1;
+	dl->id = 0;
+	dl->dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
+	dl->init = avs_rt5514_codec_init;
+	dl->be_hw_params_fixup = avs_rt5514_be_fixup;
+	dl->nonatomic = 1;
+	dl->no_pcm = 1;
+	dl->dpcm_capture = 1;
+	dl->ops = &avs_rt5514_ops;
+
+	*dai_link = dl;
+
+	return 0;
+}
+
+static int avs_rt5514_probe(struct platform_device *pdev)
+{
+	struct snd_soc_dai_link *dai_link;
+	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_card *card;
+	struct device *dev = &pdev->dev;
+	const char *pname;
+	int ssp_port, tdm_slot, ret;
+
+	mach = dev_get_platdata(dev);
+	pname = mach->mach_params.platform;
+
+	ret = avs_mach_get_ssp_tdm(dev, mach, &ssp_port, &tdm_slot);
+	if (ret)
+		return ret;
+
+	ret = avs_create_dai_link(dev, pname, ssp_port, tdm_slot, &dai_link);
+	if (ret) {
+		dev_err(dev, "Failed to create dai link: %d", ret);
+		return ret;
+	}
+
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+
+	card->name = "avs_rt5514";
+	card->dev = dev;
+	card->owner = THIS_MODULE;
+	card->dai_link = dai_link;
+	card->num_links = 1;
+	card->dapm_widgets = card_widgets;
+	card->num_dapm_widgets = ARRAY_SIZE(card_widgets);
+	card->dapm_routes = card_base_routes;
+	card->num_dapm_routes = ARRAY_SIZE(card_base_routes);
+	card->fully_routed = true;
+
+	ret = snd_soc_fixup_dai_links_platform_name(card, pname);
+	if (ret)
+		return ret;
+
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static struct platform_driver avs_rt5514_driver = {
+	.probe = avs_rt5514_probe,
+	.driver = {
+		.name = "avs_rt5514",
+		.pm = &snd_soc_pm_ops,
+	},
+};
+
+module_platform_driver(avs_rt5514_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:avs_rt5514");
-- 
2.34.1

