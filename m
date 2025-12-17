Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E27432FA2D
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765969493; cv=none; b=rfs3tP4W5X+Kk0cFdqcP7JGNRiw2IyvgsMZYJifWS5zxIZfXXYtnUeuaICLLhhlXBcs9a6LCW1RRwDvKLOvUpar5QPZcB1T+u8EmQT/bFMgeekYVpUbuT24RScyjpwiLWM030BGaNHpba+2cBInRgtnaznxshDBmXPmq5goTkSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765969493; c=relaxed/simple;
	bh=TYrR1fiP1zxRcDZhGBEGdDmER1x8xNBtHIKygT2anOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tEmRaeUwvz5zKCNfv1cPmxpGYUol7eiOqb1785lEzUiyMBSNituFLhJQT65ER507KDHc8oy7n6olXjj5Br4F2lG+ji/8v9pRbNHv04SobKJWBxrhD+EUzZYb+as/5Od8izho0Dbu8savSvISR3oV/RP6NFIGu5NC8M7fMqQU/K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iqz2LUEd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iqz2LUEd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765969491; x=1797505491;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TYrR1fiP1zxRcDZhGBEGdDmER1x8xNBtHIKygT2anOU=;
  b=Iqz2LUEdAq7QhItDB6CRQp72w4jnWNPqg/mJE0wC6eVBstlGNa1i073e
   avCxivjVawSh70P6YD0YMj7WLcKNPnOx9wCDSmdmnCkuAbxszPl6rWAoP
   ZbERVJyorrYeACL0z06JGObixujXF/BkldwUjm+nPtMNA5izbwCAp990M
   VthS7QW6UqhfAi7HqRtDQjcZhbDKOIksbF51JGROw5ysZbVOqE8QTew80
   X574u4LUC6NOWJtOme3zRwTwVfe22TL2AlpBTjcUGdCNRU9Z2eU0Gqd3r
   KIGMLdEYWx9h6SyX9i0AhMYD9HvJDE/0UcdVqGtUvxrltvizMKUcdMvZK
   A==;
X-CSE-ConnectionGUID: gJF20ft3SBW+QrrNuAbzPA==
X-CSE-MsgGUID: SqKrtwhJT42ReDoB0yUG7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="55476841"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="55476841"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 03:04:51 -0800
X-CSE-ConnectionGUID: NNitaeHnRhi+CoblvxjZ4w==
X-CSE-MsgGUID: Z1tFDgJyQWK6uRyYv2oPbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="198765873"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 03:04:49 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 1/2] ASoC: Intel: ti-common: support tas2563 amplifier
Date: Wed, 17 Dec 2025 19:04:31 +0800
Message-ID: <20251217110433.3558136-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217110433.3558136-1-yung-chuan.liao@linux.intel.com>
References: <20251217110433.3558136-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Lin <david.lin@intel.com>

Implement tas2563 support code in this common module so it could be
shared between multiple SOF machine drivers.

Signed-off-by: David Lin <david.lin@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/soc-acpi-intel-ssp-common.h     |  4 +
 sound/soc/intel/boards/Kconfig                |  3 +
 sound/soc/intel/boards/Makefile               |  3 +
 sound/soc/intel/boards/sof_ti_common.c        | 76 +++++++++++++++++++
 sound/soc/intel/boards/sof_ti_common.h        | 24 ++++++
 .../intel/common/soc-acpi-intel-ssp-common.c  |  3 +
 6 files changed, 113 insertions(+)
 create mode 100644 sound/soc/intel/boards/sof_ti_common.c
 create mode 100644 sound/soc/intel/boards/sof_ti_common.h

diff --git a/include/sound/soc-acpi-intel-ssp-common.h b/include/sound/soc-acpi-intel-ssp-common.h
index b4597c8dac78..fdb2fce42115 100644
--- a/include/sound/soc-acpi-intel-ssp-common.h
+++ b/include/sound/soc-acpi-intel-ssp-common.h
@@ -37,6 +37,9 @@
 #define RT5682_ACPI_HID		"10EC5682"
 #define RT5682S_ACPI_HID	"RTL5682"
 
+/* Texas Instruments */
+#define TAS2563_ACPI_HID	"TXNW2563"
+
 enum snd_soc_acpi_intel_codec {
 	CODEC_NONE,
 
@@ -63,6 +66,7 @@ enum snd_soc_acpi_intel_codec {
 	CODEC_RT1015P,
 	CODEC_RT1019P,
 	CODEC_RT1308,
+	CODEC_TAS2563,
 };
 
 enum snd_soc_acpi_intel_codec
diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index c23fdb6aad4c..724064149906 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -41,6 +41,9 @@ config SND_SOC_INTEL_SOF_CIRRUS_COMMON
 config SND_SOC_INTEL_SOF_NUVOTON_COMMON
 	tristate
 
+config SND_SOC_INTEL_SOF_TI_COMMON
+	tristate
+
 config SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_ACPI_INTEL_MATCH
 	tristate
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index fcd517d6c279..25a1a9066cbf 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -69,5 +69,8 @@ obj-$(CONFIG_SND_SOC_INTEL_SOF_CIRRUS_COMMON) += snd-soc-intel-sof-cirrus-common
 snd-soc-intel-sof-nuvoton-common-y += sof_nuvoton_common.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_NUVOTON_COMMON) += snd-soc-intel-sof-nuvoton-common.o
 
+snd-soc-intel-sof-ti-common-y += sof_ti_common.o
+obj-$(CONFIG_SND_SOC_INTEL_SOF_TI_COMMON) += snd-soc-intel-sof-ti-common.o
+
 snd-soc-intel-sof-board-helpers-y += sof_board_helpers.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_BOARD_HELPERS) += snd-soc-intel-sof-board-helpers.o
diff --git a/sound/soc/intel/boards/sof_ti_common.c b/sound/soc/intel/boards/sof_ti_common.c
new file mode 100644
index 000000000000..218c3536723c
--- /dev/null
+++ b/sound/soc/intel/boards/sof_ti_common.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2025 Intel Corporation
+#include <linux/module.h>
+#include <linux/string.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-dai.h>
+#include <sound/soc-dapm.h>
+#include <sound/sof.h>
+#include <uapi/sound/asound.h>
+#include "../common/soc-intel-quirks.h"
+#include "sof_ti_common.h"
+
+/*
+ * Texas Instruments TAS2563 just mount one device to manage multiple devices,
+ * so the kcontrols, widgets and routes just keep one item, respectively.
+ */
+static const struct snd_kcontrol_new tas2563_spk_kcontrols[] = {
+	SOC_DAPM_PIN_SWITCH("Spk"),
+};
+
+static const struct snd_soc_dapm_widget tas2563_spk_dapm_widgets[] = {
+	SND_SOC_DAPM_SPK("Spk", NULL),
+};
+
+static const struct snd_soc_dapm_route tas2563_spk_dapm_routes[] = {
+	{ "Spk", NULL, "OUT" },
+};
+
+static struct snd_soc_dai_link_component tas2563_dai_link_components[] = {
+	{
+		.name = TAS2563_DEV0_NAME,
+		.dai_name = TAS2563_CODEC_DAI,
+	},
+};
+
+static int tas2563_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, tas2563_spk_dapm_widgets,
+					ARRAY_SIZE(tas2563_spk_dapm_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add dapm widgets, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, tas2563_spk_kcontrols,
+					ARRAY_SIZE(tas2563_spk_kcontrols));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add controls, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, tas2563_spk_dapm_routes,
+				      ARRAY_SIZE(tas2563_spk_dapm_routes));
+	if (ret)
+		dev_err(rtd->dev, "unable to add dapm routes, ret %d\n", ret);
+
+	return ret;
+}
+
+void sof_tas2563_dai_link(struct snd_soc_dai_link *link)
+{
+	link->codecs = tas2563_dai_link_components;
+	link->num_codecs = ARRAY_SIZE(tas2563_dai_link_components);
+	link->init = tas2563_init;
+}
+EXPORT_SYMBOL_NS(sof_tas2563_dai_link, "SND_SOC_INTEL_SOF_TI_COMMON");
+
+MODULE_DESCRIPTION("ASoC Intel SOF Texas Instruments helpers");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_ti_common.h b/sound/soc/intel/boards/sof_ti_common.h
new file mode 100644
index 000000000000..de15845aff0c
--- /dev/null
+++ b/sound/soc/intel/boards/sof_ti_common.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2025 Intel Corporation.
+ */
+
+/*
+ * This file defines data structures used in Machine Driver for Intel
+ * platforms with Texas Instruments Codecs.
+ */
+#ifndef __SOF_TI_COMMON_H
+#define __SOF_TI_COMMON_H
+
+#include <sound/soc.h>
+#include <sound/soc-acpi-intel-ssp-common.h>
+
+/*
+ * Texas Instruments TAS2563
+ */
+#define TAS2563_CODEC_DAI	"tasdev_codec"
+#define TAS2563_DEV0_NAME	"i2c-" TAS2563_ACPI_HID ":00"
+
+void sof_tas2563_dai_link(struct snd_soc_dai_link *link);
+
+#endif /* __SOF_TI_COMMON_H */
diff --git a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
index f56f4bfa5187..a12b11f2cd7a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
@@ -65,6 +65,9 @@ static const struct codec_map amps[] = {
 	CODEC_MAP_ENTRY("RT1019P", "rt1019", RT1019P_ACPI_HID, CODEC_RT1019P),
 	CODEC_MAP_ENTRY("RT1308", "rt1308", RT1308_ACPI_HID, CODEC_RT1308),
 
+	/* Texas Instruments */
+	CODEC_MAP_ENTRY("TAS2563", "tas2563", TAS2563_ACPI_HID, CODEC_TAS2563),
+
 	/*
 	 * Monolithic components
 	 *
-- 
2.43.0

