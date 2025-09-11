Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2BE3568EE
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 15:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757606288; cv=none; b=cRNLFtM9GIPrNTxx5hDhA79yjQytBcT4D8L5890bJZXJV2O85M97NxQZhaG8vauCPK75FQjsNUFpd0/2TzFar01mfGf+5YUjaFvRVj9M+mN0CWqOm08zNa8Dg8UUnk4XwSYJ39YGmmlNDPCnRI7vLMsIjbActw3OUIJHGSHsFpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757606288; c=relaxed/simple;
	bh=jTHoT1uW3HxBbYmP6e/PMw2qWVwiloCBGBmkM2QsN6w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s07Jnv4yVPXFpZw89ax0N24f28xWbOxjxfHwvs52pnCygXqCgIVWNWS3Iw8EemqDxFjrMETsSngXrqhAkXaAUMEUykTS0Z4OKrO+sZBrZGXbXrMym21opSkQ175hsNDH8v6tosu0cQhi6zAm0TXYzOx2Ezu+UszcCn9ZkTS3Q9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=IrNA54L0; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IrNA54L0"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BFvfrj781580;
	Thu, 11 Sep 2025 10:57:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757606261;
	bh=8aTQcPl4O+VmyCqwxDGssnLTCR/FcBmnBLatFoTCvUM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IrNA54L02Dk/l5uRLDhz01iiAifmwjAVMMebzF1pyVaV8n8Y+5K5p/EM7LEYhMKPT
	 NXCqkPdwcb+7ngPrNw7TJTDUF736ogkhZfhTG9sSAlI0s7UJQsyResPHBeJV3uTXqE
	 ntJO4SPjWDsnDQDjJNiKPG8H/MboytriizSPFSaw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BFvfhv2051109
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 10:57:41 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 10:57:40 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 10:57:40 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BFvFFL2366393;
	Thu, 11 Sep 2025 10:57:35 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <perex@perex.cz>, <tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
        <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
        <ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <navada@ti.com>,
        <shenghao-ding@ti.com>, <v-hampiholi@ti.com>, <baojun.xu@ti.com>,
        Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v4 4/6] ASoc: tas2783A: machine driver amp utility for TI devices
Date: Thu, 11 Sep 2025 21:27:01 +0530
Message-ID: <20250911155704.2236-4-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250911155704.2236-1-niranjan.hy@ti.com>
References: <20250911155704.2236-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

  Machine driver amp utility file to initialize and support
multiple tas2783a devices are added.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 include/sound/soc_sdw_utils.h        |  8 +++
 sound/soc/sdw_utils/Makefile         |  3 +-
 sound/soc/sdw_utils/soc_sdw_ti_amp.c | 93 ++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sdw_utils/soc_sdw_ti_amp.c

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 6049a5d0c..3c5e9b2af 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -248,5 +248,13 @@ int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_so
 int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+/* TI */
+int asoc_sdw_ti_amp_init(struct snd_soc_card *card,
+			 struct snd_soc_dai_link *dai_links,
+			 struct asoc_sdw_codec_info *info,
+			 bool playback);
+int asoc_sdw_ti_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_ti_amp_initial_settings(struct snd_soc_card *card,
+				     const char *name_prefix);
 
 #endif
diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
index daf019113..a87c53e1a 100644
--- a/sound/soc/sdw_utils/Makefile
+++ b/sound/soc/sdw_utils/Makefile
@@ -6,5 +6,6 @@ snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o \
 		       soc_sdw_bridge_cs35l56.o 			\
 		       soc_sdw_cs42l42.o soc_sdw_cs42l43.o 		\
 		       soc_sdw_cs_amp.o					\
-		       soc_sdw_maxim.o
+		       soc_sdw_maxim.o \
+		       soc_sdw_ti_amp.o
 obj-$(CONFIG_SND_SOC_SDW_UTILS) += snd-soc-sdw-utils.o
diff --git a/sound/soc/sdw_utils/soc_sdw_ti_amp.c b/sound/soc/sdw_utils/soc_sdw_ti_amp.c
new file mode 100644
index 000000000..daa2311c0
--- /dev/null
+++ b/sound/soc/sdw_utils/soc_sdw_ti_amp.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2025 Texas Instruments Inc.
+
+/*
+ *  soc_sdw_ti_amp - Helpers to handle TI's soundwire based codecs
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-dai.h>
+#include <sound/soc_sdw_utils.h>
+
+#define TIAMP_SPK_VOLUME_0DB		200
+
+int asoc_sdw_ti_amp_initial_settings(struct snd_soc_card *card,
+				     const char *name_prefix)
+{
+	char *volume_ctl_name;
+	int ret;
+
+	volume_ctl_name = kasprintf(GFP_KERNEL, "%s Speaker Volume",
+				    name_prefix);
+	if (!volume_ctl_name)
+		return -ENOMEM;
+
+	ret = snd_soc_limit_volume(card, volume_ctl_name,
+				   TIAMP_SPK_VOLUME_0DB);
+	if (ret)
+		dev_err(card->dev,
+			"%s update failed %d\n",
+			volume_ctl_name, ret);
+
+	kfree(volume_ctl_name);
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_ti_amp_initial_settings, "SND_SOC_SDW_UTILS");
+
+int asoc_sdw_ti_spk_rtd_init(struct snd_soc_pcm_runtime *rtd,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_card *card = rtd->card;
+	char widget_name[16];
+	char speaker[16];
+	struct snd_soc_dapm_route route = {speaker, NULL, widget_name};
+	struct snd_soc_dai *codec_dai;
+	const char *prefix;
+	int i, ret = 0;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (!strstr(codec_dai->name, "tas2783"))
+			continue;
+
+		prefix = codec_dai->component->name_prefix;
+		if (!strncmp(prefix, "tas2783-1", strlen("tas2783-1"))) {
+			strscpy(speaker, "Left Spk", sizeof(speaker));
+		} else if (!strncmp(prefix, "tas2783-2", strlen("tas2783-2"))) {
+			strscpy(speaker, "Right Spk", sizeof(speaker));
+		} else {
+			ret = -EINVAL;
+			dev_err(card->dev, "unhandled prefix %s", prefix);
+			break;
+		}
+
+		snprintf(widget_name, sizeof(widget_name), "%s SPK", prefix);
+		ret = asoc_sdw_ti_amp_initial_settings(card, prefix);
+		if (ret)
+			return ret;
+
+		ret = snd_soc_dapm_add_routes(&card->dapm, &route, 1);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_ti_spk_rtd_init, "SND_SOC_SDW_UTILS");
+
+int asoc_sdw_ti_amp_init(struct snd_soc_card *card,
+			 struct snd_soc_dai_link *dai_links,
+			 struct asoc_sdw_codec_info *info,
+			 bool playback)
+{
+	if (!playback)
+		return 0;
+
+	info->amp_num++;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_ti_amp_init, "SND_SOC_SDW_UTILS");
+
-- 
2.45.2

