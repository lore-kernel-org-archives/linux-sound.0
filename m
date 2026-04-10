Received: from smtp153-183.sina.com.cn (smtp153-183.sina.com.cn [61.135.153.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ED22BE034
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 07:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775805901; cv=none; b=QMEN7sdZuHbdmAwGzbR51+A54oBrg8gs3ee8gM0foO1eFSh1MwJJaIzS0qHePEeuJy2M3FxwF22kBMG2+EjBKI0+d1IOsX9allluKFzNmRsccj0Dc3LpmUMRukgMRdjgWKlPrYGlLj3puiAgp9Ce0tj4DRtlJUTIEwggnklj72A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775805901; c=relaxed/simple;
	bh=984Hvw3MENsRoN59fDj56e+GhDeqM2YaXNn/Ar7kEOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=tNOK3FCoM9aLiVRH3/qEhcW6eE+Q3i3vwvtfs0H4HsDR6pcpQYGltm4ityzwO7vXBxrfpMzu/NKoHmUvh7NXLXL+NQtKYZwHxNhmPuL3wz7wsmWyJ0yvGJ8w4uwL/SQE4c/a8ealcxPXaPYe/yYSB+3r4BkQoQwfu0BzKbGjtp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.39) with ESMTP
	id 69D8A5BB00000BB0; Fri, 10 Apr 2026 15:24:45 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: AAFCFB68185C48819E0A7E4F80A48E1B
X-SMAIL-UIID: AAFCFB68185C48819E0A7E4F80A48E1B-20260410-152445
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v7 1/5] ASoC: sdw_utils: add soc_sdw_es9356
Date: Fri, 10 Apr 2026 15:24:37 +0800
Message-Id: <20260410072441.6111-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260410072441.6111-1-zhangyi@everest-semi.com>
References: <20260410072441.6111-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Add a utility program for handling ES9356 in the universal machine driver

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 include/sound/soc_sdw_utils.h        |  14 ++
 sound/soc/sdw_utils/Makefile         |   1 +
 sound/soc/sdw_utils/soc_sdw_es9356.c | 230 +++++++++++++++++++++++++++
 3 files changed, 245 insertions(+)
 create mode 100644 sound/soc/sdw_utils/soc_sdw_es9356.c

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 489083183..5ddbbc8bb 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -223,6 +223,17 @@ int asoc_sdw_cs42l43_spk_init(struct snd_soc_card *card,
 			      struct asoc_sdw_codec_info *info,
 			      bool playback);
 
+/* es9356 codec support */
+int asoc_sdw_es9356_init(struct snd_soc_card *card,
+			       struct snd_soc_dai_link *dai_links,
+			       struct asoc_sdw_codec_info *info,
+			       bool playback);
+int asoc_sdw_es9356_amp_init(struct snd_soc_card *card,
+			       struct snd_soc_dai_link *dai_links,
+			       struct asoc_sdw_codec_info *info,
+			       bool playback);
+int asoc_sdw_es9356_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+
 /* CS AMP support */
 int asoc_sdw_bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
 					  int *num_dais, int *num_devs);
@@ -274,5 +285,8 @@ int asoc_sdw_ti_amp_init(struct snd_soc_card *card,
 int asoc_sdw_ti_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_ti_amp_initial_settings(struct snd_soc_card *card,
 				     const char *name_prefix);
+int asoc_sdw_es9356_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_es9356_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_es9356_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
 #endif
diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
index a8d091fd3..5ae8c69b8 100644
--- a/sound/soc/sdw_utils/Makefile
+++ b/sound/soc/sdw_utils/Makefile
@@ -8,6 +8,7 @@ snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o \
 		       soc_sdw_cs42l45.o				\
 		       soc_sdw_cs47l47.o				\
 		       soc_sdw_cs_amp.o					\
+		       soc_sdw_es9356.o					\
 		       soc_sdw_maxim.o \
 		       soc_sdw_ti_amp.o
 obj-$(CONFIG_SND_SOC_SDW_UTILS) += snd-soc-sdw-utils.o
diff --git a/sound/soc/sdw_utils/soc_sdw_es9356.c b/sound/soc/sdw_utils/soc_sdw_es9356.c
new file mode 100644
index 000000000..aa405e7da
--- /dev/null
+++ b/sound/soc/sdw_utils/soc_sdw_es9356.c
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Based on sof_sdw_rt5682.c
+// This file incorporates work covered by the following copyright notice:
+// Copyright (c) 2023 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
+// Copyright (c) 2025 Everest Semiconductor Co., Ltd
+
+/*
+ *  soc_sdw_es9356 - Helpers to handle ES9356 from generic machine driver
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/input.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <sound/control.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
+#include <sound/jack.h>
+#include <sound/soc_sdw_utils.h>
+
+/*
+ * Note this MUST be called before snd_soc_register_card(), so that the props
+ * are in place before the codec component driver's probe function parses them.
+ */
+static int es9356_add_codec_device_props(struct device *sdw_dev, unsigned long quirk)
+{
+	struct property_entry props[SOC_SDW_MAX_NO_PROPS] = {};
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	if (!SOC_SDW_JACK_JDSRC(quirk))
+		return 0;
+	props[0] = PROPERTY_ENTRY_U32("everest,jd-src", SOC_SDW_JACK_JDSRC(quirk));
+
+	fwnode = fwnode_create_software_node(props, NULL);
+	if (IS_ERR(fwnode))
+		return PTR_ERR(fwnode);
+
+	ret = device_add_software_node(sdw_dev, to_software_node(fwnode));
+
+	fwnode_handle_put(fwnode);
+
+	return ret;
+}
+
+static const struct snd_soc_dapm_route es9356_map[] = {
+	/* Headphones */
+	{ "Headphone", NULL, "es9356 HP" },
+	{ "es9356 MIC1", NULL, "Headset Mic" },
+};
+
+static const struct snd_soc_dapm_route es9356_spk_map[] = {
+	/* Speaker */
+	{ "Speaker", NULL, "es9356 SPK" },
+};
+
+static const struct snd_soc_dapm_route es9356_dmic_map[] = {
+	/* DMIC */
+	{ "es9356 PDM_DIN", NULL, "DMIC" },
+};
+
+static struct snd_soc_jack_pin es9356_jack_pins[] = {
+	{
+		.pin    = "Headphone",
+		.mask   = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin    = "Headset Mic",
+		.mask   = SND_JACK_MICROPHONE,
+	},
+};
+
+int asoc_sdw_es9356_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s spk:es9356-spk",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_dapm_add_routes(dapm, es9356_spk_map,
+				      ARRAY_SIZE(es9356_spk_map));
+	if (ret)
+		dev_err(card->dev, "es9356 map addition failed: %d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_es9356_spk_rtd_init, "SND_SOC_SDW_UTILS");
+
+int asoc_sdw_es9356_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s mic:es9356-dmic",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_dapm_add_routes(dapm, es9356_dmic_map,
+				      ARRAY_SIZE(es9356_dmic_map));
+	if (ret)
+		dev_err(card->dev, "es9356 map addition failed: %d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_es9356_dmic_rtd_init, "SND_SOC_SDW_UTILS");
+
+int asoc_sdw_es9356_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_component *component;
+	struct snd_soc_jack *jack;
+	int ret;
+
+	component = dai->component;
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s hs:es9356",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_dapm_add_routes(dapm, es9356_map,
+				      ARRAY_SIZE(es9356_map));
+
+	if (ret) {
+		dev_err(card->dev, "es9356 map addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
+					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
+					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+					 SND_JACK_BTN_3 | SND_JACK_BTN_4,
+					 &ctx->sdw_headset,
+					 es9356_jack_pins,
+					 ARRAY_SIZE(es9356_jack_pins));
+	if (ret) {
+		dev_err(rtd->card->dev, "Headset Jack creation failed: %d\n",
+			ret);
+		return ret;
+	}
+
+	jack = &ctx->sdw_headset;
+
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_NEXTSONG);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_4, KEY_PREVIOUSSONG);
+
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+
+	if (ret)
+		dev_err(rtd->card->dev, "Headset Jack call-back failed: %d\n",
+			ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_es9356_rtd_init, "SND_SOC_SDW_UTILS");
+
+int asoc_sdw_es9356_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
+{
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+
+	if (!ctx->headset_codec_dev)
+		return 0;
+
+	device_remove_software_node(ctx->headset_codec_dev);
+	put_device(ctx->headset_codec_dev);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_es9356_exit, "SND_SOC_SDW_UTILS");
+
+int asoc_sdw_es9356_init(struct snd_soc_card *card,
+		       struct snd_soc_dai_link *dai_links,
+		       struct asoc_sdw_codec_info *info,
+		       bool playback)
+{
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct device *sdw_dev;
+	int ret;
+
+	/*
+	 * headset should be initialized once.
+	 * Do it with dai link for playback.
+	 */
+	if (!playback)
+		return 0;
+
+	sdw_dev = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[0].name);
+	if (!sdw_dev)
+		return -EPROBE_DEFER;
+
+	ret = es9356_add_codec_device_props(sdw_dev, ctx->mc_quirk);
+	if (ret < 0) {
+		put_device(sdw_dev);
+		return ret;
+	}
+	ctx->headset_codec_dev = sdw_dev;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_es9356_init, "SND_SOC_SDW_UTILS");
+
+int asoc_sdw_es9356_amp_init(struct snd_soc_card *card,
+		       struct snd_soc_dai_link *dai_links,
+		       struct asoc_sdw_codec_info *info,
+		       bool playback)
+{
+	if (!playback)
+		return 0;
+
+	info->amp_num++;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_es9356_amp_init, "SND_SOC_SDW_UTILS");
-- 
2.17.1

