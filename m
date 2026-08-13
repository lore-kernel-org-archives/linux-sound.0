Received: from mail-m49221.qiye.163.com (mail-m49221.qiye.163.com [45.254.49.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5D72C3266
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 03:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786590074; cv=none; b=Os9jhYUMgHS3LBItmYa6som3seDdsTFStMO6kQUjTWs2uIJcmRZxPhwYLpzXf9T+DG4Vw1C/1LI9Bsj3oJ5afaSgvYwVIGXZ//FMsZlpAgik2h5bGZxWaq1n/IvXvTOVOUrG7PeaTuHACVF/I33nBCUEFyDfB20r6KR+SJCZjgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786590074; c=relaxed/simple;
	bh=VusXtT51jPOzT9d2sGdBpaHEH08enHdDjR68UtH2T24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UbX3v2en1RAWzRkqcf2K0e3XXW+MAUjKUPATq/xC4nuqEOCoJBQQgQMzPVwzatfMlcZ4hN4xpXLczm1ge7TEvE2E+FW/UHQTunGQ8wSIjDahxYTC2yeTHAXTiZYj5GwsxdEZIaEt1KH9eg4ae/JcYSwa9ysbtxyrPJybeMu4xpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=MvtkKbHw; arc=none smtp.client-ip=45.254.49.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="MvtkKbHw"
Received: from localhost.localdomain (unknown [182.148.129.16])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49cdb6464;
	Thu, 13 Aug 2026 10:45:46 +0800 (GMT+08:00)
From: Qianghua Wang <qianghua.wang@senarytech.com>
To: linux-sound@vger.kernel.org
Cc: Qianghua Wang <qianghua.wang@senarytech.com>,
	Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bo liu <bo.liu@senarytech.com>
Subject: [PATCH v2 2/3] ASoC: sdw_utils: add Senary SN624x helpers and codec_info
Date: Thu, 13 Aug 2026 10:45:26 +0800
Message-ID: <20260813024527.42294-3-qianghua.wang@senarytech.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260813024527.42294-1-qianghua.wang@senarytech.com>
References: <20260813024527.42294-1-qianghua.wang@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ff902ee5a09d8kunm5727fec547de9b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGB8dVkMaGENKGBpPTRoYSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0lVSk9DVUpJQlVKTVlXWRYaDxIVHRRZQVlPS0hVSk
	tISk9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=MvtkKbHwtGJYJMYMjN5RTi0T5kp147mqJjJAASAJg8FesScrmCuesjk/GMP5YX6+KmpMfeytLFW+D/NaZcM8wJqLyz9NRFINxRKRR2XpXlR80AQwC1kUw2B9V589injpPRwgPbvs1+zqwsE1xL2XNVe72HKZ/6vJ+Uz+1wASL/A=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=6zvRz5NWI+fbrBVpyVkvk/7o2tyW1FAZW5Aeilgj+mU=;
	h=date:mime-version:subject:message-id:from;

Add sof_sdw helpers for SN624x jack, amp, and DMIC, and register the
codec_info entries used by the Intel SOF SoundWire machine driver.
Use name_prefix "sn624x" to match UCM and DAI widget naming.

Signed-off-by: Qianghua Wang <qianghua.wang@senarytech.com>
---
 include/sound/soc_sdw_utils.h                 |  20 ++
 sound/soc/sdw_utils/Makefile                  |   4 +-
 sound/soc/sdw_utils/soc_sdw_senary_amp.c      |  80 +++++++
 sound/soc/sdw_utils/soc_sdw_senary_dmic.c     |  49 +++++
 sound/soc/sdw_utils/soc_sdw_senary_sdca.c     |  63 ++++++
 .../soc_sdw_senary_sdca_jack_common.c         | 197 ++++++++++++++++++
 sound/soc/sdw_utils/soc_sdw_utils.c           | 166 +++++++++++++++
 7 files changed, 578 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_amp.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_dmic.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_sdca.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 79c21966220b..e8bdc20a75f6 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -293,4 +293,24 @@ int asoc_sdw_es9356_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 int asoc_sdw_es9356_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_es9356_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
+/* Senary SN624x SDCA */
+int asoc_sdw_senary_sdca_jack_init(struct snd_soc_card *card,
+				   struct snd_soc_dai_link *dai_links,
+				   struct asoc_sdw_codec_info *info,
+				   bool playback);
+int asoc_sdw_senary_sdca_jack_exit(struct snd_soc_card *card,
+				   struct snd_soc_dai_link *dai_link);
+int asoc_sdw_senary_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd,
+				       struct snd_soc_dai *dai);
+int asoc_sdw_senary_amp_init(struct snd_soc_card *card,
+			     struct snd_soc_dai_link *dai_links,
+			     struct asoc_sdw_codec_info *info,
+			     bool playback);
+int asoc_sdw_senary_amp_exit(struct snd_soc_card *card,
+			     struct snd_soc_dai_link *dai_link);
+int asoc_sdw_senary_sdca_spk_rtd_init(struct snd_soc_pcm_runtime *rtd,
+				      struct snd_soc_dai *dai);
+int asoc_sdw_senary_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd,
+				  struct snd_soc_dai *dai);
+
 #endif
diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
index 5ae8c69b8b98..1dbc00a2d64a 100644
--- a/sound/soc/sdw_utils/Makefile
+++ b/sound/soc/sdw_utils/Makefile
@@ -10,5 +10,7 @@ snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o \
 		       soc_sdw_cs_amp.o					\
 		       soc_sdw_es9356.o					\
 		       soc_sdw_maxim.o \
-		       soc_sdw_ti_amp.o
+		       soc_sdw_ti_amp.o \
+		       soc_sdw_senary_sdca.o soc_sdw_senary_sdca_jack_common.o \
+		       soc_sdw_senary_amp.o soc_sdw_senary_dmic.o
 obj-$(CONFIG_SND_SOC_SDW_UTILS) += snd-soc-sdw-utils.o
diff --git a/sound/soc/sdw_utils/soc_sdw_senary_amp.c b/sound/soc/sdw_utils/soc_sdw_senary_amp.c
new file mode 100644
index 000000000000..9370402ab4c7
--- /dev/null
+++ b/sound/soc/sdw_utils/soc_sdw_senary_amp.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// This file incorporates work covered by the following copyright notice:
+// Copyright (c) 2022 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <sound/control.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <sound/soc_sdw_utils.h>
+
+static int senary_amp_add_device_props(struct device *sdw_dev)
+{
+	return 0;
+}
+
+int asoc_sdw_senary_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
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
+EXPORT_SYMBOL_NS(asoc_sdw_senary_amp_exit, "SND_SOC_SDW_UTILS");
+
+int asoc_sdw_senary_amp_init(struct snd_soc_card *card,
+			     struct snd_soc_dai_link *dai_links,
+			     struct asoc_sdw_codec_info *info,
+			     bool playback)
+{
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct device *sdw_dev1, *sdw_dev2;
+	int ret;
+
+	/* Count amp number and do init on playback link only. */
+	if (!playback)
+		return 0;
+
+	info->amp_num++;
+
+	if (info->amp_num == 2) {
+		sdw_dev1 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[0].name);
+		if (!sdw_dev1)
+			return -EPROBE_DEFER;
+
+		ret = senary_amp_add_device_props(sdw_dev1);
+		if (ret < 0) {
+			put_device(sdw_dev1);
+			return ret;
+		}
+		ctx->amp_dev1 = sdw_dev1;
+
+		sdw_dev2 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[1].name);
+		if (!sdw_dev2)
+			return -EPROBE_DEFER;
+
+		ret = senary_amp_add_device_props(sdw_dev2);
+		if (ret < 0) {
+			put_device(sdw_dev2);
+			return ret;
+		}
+		ctx->amp_dev2 = sdw_dev2;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_senary_amp_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_senary_dmic.c b/sound/soc/sdw_utils/soc_sdw_senary_dmic.c
new file mode 100644
index 000000000000..7481706561f9
--- /dev/null
+++ b/sound/soc/sdw_utils/soc_sdw_senary_dmic.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// This file incorporates work covered by the following copyright notice:
+// Copyright (c) 2024 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
+#include <sound/soc_sdw_utils.h>
+
+/* Card pin "Dmic" → codec input (name_prefix + " DMIC") */
+static const struct snd_soc_dapm_route senary_dmic_map[] = {
+	{ "sn624x DMIC", NULL, "Dmic" },
+};
+
+int asoc_sdw_senary_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
+	struct snd_soc_component *component;
+	char *mic_name;
+	int ret;
+
+	component = dai->component;
+
+	ret = snd_soc_dapm_add_routes(dapm, senary_dmic_map,
+				      ARRAY_SIZE(senary_dmic_map));
+	if (ret) {
+		dev_err(card->dev, "senary dmic map addition failed: %d\n", ret);
+		return ret;
+	}
+
+	mic_name = devm_kasprintf(card->dev, GFP_KERNEL, "%s", component->name_prefix);
+	if (!mic_name)
+		return -ENOMEM;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s mic:%s-dmic", card->components,
+					  mic_name);
+	if (!card->components)
+		return -ENOMEM;
+
+	dev_dbg(card->dev, "card->components: %s\n", card->components);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_senary_dmic_rtd_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_senary_sdca.c b/sound/soc/sdw_utils/soc_sdw_senary_sdca.c
new file mode 100644
index 000000000000..5c2cd75307c9
--- /dev/null
+++ b/sound/soc/sdw_utils/soc_sdw_senary_sdca.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// This file incorporates work covered by the following copyright notice:
+// Copyright (c) 2024 Intel Corporation.
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/string.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <sound/control.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
+#include <sound/soc_sdw_utils.h>
+
+/* dapm routes for SPK will be registered dynamically */
+static const struct snd_soc_dapm_route sn624x_spk_map[] = {
+	{ "Speaker", NULL, "sn624x SPK" },
+};
+
+/* Structure to map codec names to respective route arrays and sizes */
+struct codec_route_map {
+	const char *codec_name;
+	const struct snd_soc_dapm_route *route_map;
+	size_t route_size;
+};
+
+/* Codec route maps array */
+static const struct codec_route_map codec_routes[] = {
+	{ "sn624x", sn624x_spk_map, ARRAY_SIZE(sn624x_spk_map) },
+};
+
+static const struct codec_route_map *get_codec_route_map(const char *dai_name)
+{
+	for (size_t i = 0; i < ARRAY_SIZE(codec_routes); i++) {
+		if (str_has_prefix(dai_name, codec_routes[i].codec_name))
+			return &codec_routes[i];
+	}
+	return NULL;
+}
+
+int asoc_sdw_senary_sdca_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
+	int ret;
+
+	/* Match by DAI name prefix (e.g. sn624x-sdca-aif2). */
+	const struct codec_route_map *route_map = get_codec_route_map(dai->name);
+
+	if (!route_map) {
+		dev_err(rtd->dev, "failed to get codec name and route map\n");
+		return -EINVAL;
+	}
+
+	/* Add routes */
+	ret = snd_soc_dapm_add_routes(dapm, route_map->route_map, route_map->route_size);
+	if (ret)
+		dev_err(rtd->dev, "failed to add rt sdca spk map: %d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_senary_sdca_spk_rtd_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c b/sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c
new file mode 100644
index 000000000000..1dab6f99877d
--- /dev/null
+++ b/sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// This file incorporates work covered by the following copyright notice:
+// Copyright (c) 2020 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
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
+ * jack_init / jack_exit / most of rtd_init follow soc_sdw_rt_sdca_jack_common.c
+ * (same SDCA headset machine-helper pattern). Vendor-specific pieces here are
+ * mainly the "senarytech,jd-src" property name and senary_sdca_jack_map[].
+ *
+ * Keep a Senary-local file for now to mirror the existing RT layout. Sharing
+ * parameterised SDCA jack helpers in snd-soc-sdw-utils (jd-src key + common
+ * init/exit/rtd_init boilerplate) is intentional follow-up work, out of scope
+ * for the sn624x codec series.
+ */
+
+/*
+ * Note this MUST be called before snd_soc_register_card(), so that the props
+ * are in place before the codec component driver's probe function parses them.
+ */
+static int senary_sdca_jack_add_codec_device_props(struct device *sdw_dev, unsigned long quirk)
+{
+	struct property_entry props[SOC_SDW_MAX_NO_PROPS] = {};
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	if (!SOC_SDW_JACK_JDSRC(quirk))
+		return 0;
+
+	props[0] = PROPERTY_ENTRY_U32("senarytech,jd-src", SOC_SDW_JACK_JDSRC(quirk));
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
+static const struct snd_soc_dapm_route senary_sdca_jack_map[] = {
+	{ "Headphone", NULL, "sn624x HP" },
+	{ "sn624x MIC2", NULL, "Headset Mic" },
+};
+
+static struct snd_soc_jack_pin senary_sdca_jack_pins[] = {
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
+static const char * const need_sdca_suffix[] = {
+	"sn624x"
+};
+
+int asoc_sdw_senary_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_component *component;
+	struct snd_soc_jack *jack;
+	int ret;
+	int i;
+
+	component = dai->component;
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s hs:%s",
+					  card->components, component->name_prefix);
+	if (!card->components)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(need_sdca_suffix); i++) {
+		if (!strstr(component->name_prefix, need_sdca_suffix[i]))
+			continue;
+
+		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+						  "%s-sdca", card->components);
+		if (!card->components)
+			return -ENOMEM;
+
+		ret = snd_soc_dapm_add_routes(dapm, senary_sdca_jack_map,
+					      ARRAY_SIZE(senary_sdca_jack_map));
+		if (ret) {
+			dev_err(card->dev,
+				"senary sdca jack map addition failed: %d\n", ret);
+			return ret;
+		}
+		break;
+	}
+
+	if (i == ARRAY_SIZE(need_sdca_suffix)) {
+		dev_err(card->dev, "%s is not supported\n", component->name_prefix);
+		return -EINVAL;
+	}
+
+	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
+					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
+					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+					 SND_JACK_BTN_3,
+					 &ctx->sdw_headset,
+					 senary_sdca_jack_pins,
+					 ARRAY_SIZE(senary_sdca_jack_pins));
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
+
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+
+	if (ret)
+		dev_err(rtd->card->dev, "Headset Jack call-back failed: %d\n",
+			ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_senary_sdca_jack_rtd_init, "SND_SOC_SDW_UTILS");
+
+int asoc_sdw_senary_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
+{
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+
+	if (!ctx->headset_codec_dev)
+		return 0;
+
+	if (!SOC_SDW_JACK_JDSRC(ctx->mc_quirk))
+		return 0;
+
+	device_remove_software_node(ctx->headset_codec_dev);
+	put_device(ctx->headset_codec_dev);
+	ctx->headset_codec_dev = NULL;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_senary_sdca_jack_exit, "SND_SOC_SDW_UTILS");
+
+/*
+ * Same control flow as asoc_sdw_rt_sdca_jack_init(); see file comment above
+ * about deferred helper sharing in snd-soc-sdw-utils.
+ */
+int asoc_sdw_senary_sdca_jack_init(struct snd_soc_card *card,
+				   struct snd_soc_dai_link *dai_links,
+				   struct asoc_sdw_codec_info *info,
+				   bool playback)
+{
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct device *sdw_dev;
+	int ret;
+
+	/*
+	 * Jack detection should be only initialized once for headsets since
+	 * the playback/capture is sharing the same jack
+	 */
+	if (ctx->headset_codec_dev)
+		return 0;
+
+	sdw_dev = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[0].name);
+	if (!sdw_dev)
+		return -EPROBE_DEFER;
+
+	ret = senary_sdca_jack_add_codec_device_props(sdw_dev, ctx->mc_quirk);
+	if (ret < 0) {
+		put_device(sdw_dev);
+		return ret;
+	}
+	ctx->headset_codec_dev = sdw_dev;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_senary_sdca_jack_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index d8db8fc5313e..cbbf9252b393 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -17,6 +17,15 @@ static const struct snd_soc_dapm_widget generic_dmic_widgets[] = {
 	SND_SOC_DAPM_MIC("DMIC", NULL),
 };
 
+/* Senary SN624x UCM uses CaptureMixerElem "Dmic"; keep separate from generic DMIC. */
+static const struct snd_soc_dapm_widget sn624x_dmic_widgets[] = {
+	SND_SOC_DAPM_MIC("Dmic", NULL),
+};
+
+static const struct snd_kcontrol_new sn624x_dmic_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Dmic"),
+};
+
 static const struct snd_soc_dapm_widget generic_jack_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
@@ -1228,6 +1237,163 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 1,
 	},
+	/*
+	 * Senary SN6242/6244/6247: same SDCA jack/amp/mic topology; only part_id
+	 * differs. name_prefix stays "sn624x" for UCM/DAI naming.
+	 */
+	{
+		.vendor_id = 0x0496,
+		.part_id = 0x6244,
+		.name_prefix = "sn624x",
+		.ignore_internal_dmic = true,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "sn624x-sdca-aif",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.init = asoc_sdw_senary_sdca_jack_init,
+				.exit = asoc_sdw_senary_sdca_jack_exit,
+				.rtd_init = asoc_sdw_senary_sdca_jack_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+			{
+				.direction = {true, false},
+				.dai_name = "sn624x-sdca-aif2",
+				.component_name = "sn624x",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_senary_amp_init,
+				.exit = asoc_sdw_senary_amp_exit,
+				.rtd_init = asoc_sdw_senary_sdca_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+				.quirk = SOC_SDW_CODEC_SPKR,
+				.quirk_exclude = true,
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "sn624x-sdca-aif3",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_senary_dmic_rtd_init,
+				.widgets = sn624x_dmic_widgets,
+				.num_widgets = ARRAY_SIZE(sn624x_dmic_widgets),
+				.controls = sn624x_dmic_controls,
+				.num_controls = ARRAY_SIZE(sn624x_dmic_controls),
+				.quirk = SOC_SDW_CODEC_MIC,
+				.quirk_exclude = true,
+			},
+		},
+		.dai_num = 3,
+	},
+	{
+		.vendor_id = 0x0496,
+		.part_id = 0x6247,
+		.name_prefix = "sn624x",
+		.ignore_internal_dmic = true,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "sn624x-sdca-aif",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.init = asoc_sdw_senary_sdca_jack_init,
+				.exit = asoc_sdw_senary_sdca_jack_exit,
+				.rtd_init = asoc_sdw_senary_sdca_jack_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+			{
+				.direction = {true, false},
+				.dai_name = "sn624x-sdca-aif2",
+				.component_name = "sn624x",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_senary_amp_init,
+				.exit = asoc_sdw_senary_amp_exit,
+				.rtd_init = asoc_sdw_senary_sdca_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+				.quirk = SOC_SDW_CODEC_SPKR,
+				.quirk_exclude = true,
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "sn624x-sdca-aif3",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_senary_dmic_rtd_init,
+				.widgets = sn624x_dmic_widgets,
+				.num_widgets = ARRAY_SIZE(sn624x_dmic_widgets),
+				.controls = sn624x_dmic_controls,
+				.num_controls = ARRAY_SIZE(sn624x_dmic_controls),
+				.quirk = SOC_SDW_CODEC_MIC,
+				.quirk_exclude = true,
+			},
+		},
+		.dai_num = 3,
+	},
+	{
+		.vendor_id = 0x0496,
+		.part_id = 0x6242,
+		.name_prefix = "sn624x",
+		.ignore_internal_dmic = true,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "sn624x-sdca-aif",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.init = asoc_sdw_senary_sdca_jack_init,
+				.exit = asoc_sdw_senary_sdca_jack_exit,
+				.rtd_init = asoc_sdw_senary_sdca_jack_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+			{
+				.direction = {true, false},
+				.dai_name = "sn624x-sdca-aif2",
+				.component_name = "sn624x",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_senary_amp_init,
+				.exit = asoc_sdw_senary_amp_exit,
+				.rtd_init = asoc_sdw_senary_sdca_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+				.quirk = SOC_SDW_CODEC_SPKR,
+				.quirk_exclude = true,
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "sn624x-sdca-aif3",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_senary_dmic_rtd_init,
+				.widgets = sn624x_dmic_widgets,
+				.num_widgets = ARRAY_SIZE(sn624x_dmic_widgets),
+				.controls = sn624x_dmic_controls,
+				.num_controls = ARRAY_SIZE(sn624x_dmic_controls),
+				.quirk = SOC_SDW_CODEC_MIC,
+				.quirk_exclude = true,
+			},
+		},
+		.dai_num = 3,
+	},
 };
 EXPORT_SYMBOL_NS(codec_info_list, "SND_SOC_SDW_UTILS");
 
-- 
2.47.3

