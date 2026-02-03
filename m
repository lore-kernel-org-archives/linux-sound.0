Received: from smtp134-89.sina.com.cn (smtp134-89.sina.com.cn [180.149.134.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAF336605F
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 05:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770096304; cv=none; b=V9NOOF2uqdym09XcEdTouDbQXuiamacZlTOmshxCzHpZKV3j8LHCal4DteVZVj/4j1TWNih++RiuHH0CbG0UD1av1ngUkahqVwFmjW2och/WXP7hqTGfTEjVzs8wqKkH65iNljcryukJrcZbhFX3mwLRTXkZrwdxCJtmS/ZSNC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770096304; c=relaxed/simple;
	bh=OKu3+D/a3B+Qf9TOT5+Zu/YM91EdmpW+m+YwezeVKcg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=KEqL+4cefu6gKxF7GqYLd/BbgfjIawH7Uj5iLdMWXsoRwP5SfYXsS3uc1SFgs8SFFp1PnAPZi4d0m80sNJuLwVnaw4lasukLjJPx1FikhCFaquaZDEb/JuCnZc307F5S/JARPjLSF8WsyJV8D44bhaynEWbUWBRXpSPN1GBffDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=180.149.134.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.185.250.31) with ESMTP
	id 6981867B00003F3F; Tue, 3 Feb 2026 13:24:21 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 0A4E2AD8F2C0482FA527B687934AACE0
X-SMAIL-UIID: 0A4E2AD8F2C0482FA527B687934AACE0-20260203-132421
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 3/6] ASoC: sdw_utils: add soc_sdw_es9356
Date: Tue,  3 Feb 2026 13:24:03 +0800
Message-Id: <20260203052406.28562-4-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260203052406.28562-1-zhangyi@everest-semi.com>
References: <20260203052406.28562-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Add a utility program for handling ES9356 in the universal machine driver

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/sdw_utils/Makefile         |   1 +
 sound/soc/sdw_utils/soc_sdw_es9356.c | 272 +++++++++++++++++++++++++++
 2 files changed, 273 insertions(+)
 create mode 100644 sound/soc/sdw_utils/soc_sdw_es9356.c

diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
index e8bd5ffb1..3818aa2dd 100644
--- a/sound/soc/sdw_utils/Makefile
+++ b/sound/soc/sdw_utils/Makefile
@@ -6,6 +6,7 @@ snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o \
 		       soc_sdw_bridge_cs35l56.o 			\
 		       soc_sdw_cs42l42.o soc_sdw_cs42l43.o 		\
 		       soc_sdw_cs42l45.o				\
+		       soc_sdw_es9356.o				\
 		       soc_sdw_cs_amp.o					\
 		       soc_sdw_maxim.o \
 		       soc_sdw_ti_amp.o
diff --git a/sound/soc/sdw_utils/soc_sdw_es9356.c b/sound/soc/sdw_utils/soc_sdw_es9356.c
new file mode 100644
index 000000000..0b9d86277
--- /dev/null
+++ b/sound/soc/sdw_utils/soc_sdw_es9356.c
@@ -0,0 +1,272 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2023 Intel Corporation
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
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s spk:es9356-spk",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, es9356_spk_map,
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
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s mic:es9356-dmic",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, es9356_dmic_map,
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
+	ret = snd_soc_dapm_add_routes(&card->dapm, es9356_map,
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
+					 SND_JACK_BTN_3 | SND_JACK_BTN_4 |
+					 SND_JACK_BTN_5,
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
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_4, KEY_NEXTSONG);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_5, KEY_PREVIOUSSONG);
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
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct device *sdw_dev1, *sdw_dev2;
+	int ret;
+
+	if (!playback)
+		return 0;
+
+	info->amp_num++;
+
+	if (info->amp_num == 2) {
+		sdw_dev1 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[0].name);
+
+		if (!sdw_dev1)
+			return -EPROBE_DEFER;
+
+		ret = es9356_add_codec_device_props(sdw_dev1, ctx->mc_quirk);
+		if (ret < 0) {
+			put_device(sdw_dev1);
+			return ret;
+		}
+		ctx->amp_dev1 = sdw_dev1;
+
+		sdw_dev2 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[1].name);
+
+		if (!sdw_dev2)
+			return -EPROBE_DEFER;
+
+		ret = es9356_add_codec_device_props(sdw_dev2, ctx->mc_quirk);
+		if (ret < 0) {
+			put_device(sdw_dev2);
+			return ret;
+		}
+		ctx->amp_dev2 = sdw_dev2;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_es9356_amp_init, "SND_SOC_SDW_UTILS");
+
+int asoc_sdw_es9356_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
+{
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+
+	if (ctx->amp_dev1) {
+		device_remove_software_node(ctx->amp_dev1);
+		put_device(ctx->amp_dev1);
+	}
+
+	if (ctx->amp_dev2) {
+		device_remove_software_node(ctx->amp_dev2);
+		put_device(ctx->amp_dev2);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_es9356_amp_exit, "SND_SOC_SDW_UTILS");
-- 
2.17.1

