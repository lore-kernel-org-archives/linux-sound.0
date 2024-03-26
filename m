Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BEF13CA9C
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469139; cv=none; b=rPj/EvSRFvNyzK3EgpyHwlPvHFZ/PzUCLX9fAJsd/0DQRd8NfUQtFG90Pz1+FrlvMuGoJcGjJhB6U8/YDEZOUf6McpsTCEp1woDHQM55V69lI0KlT/BR6wTLT5rsVTTPWYcB4ubi56jzuVhhCNnv86N5kZ4cVqH9c3cswHtuPnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469139; c=relaxed/simple;
	bh=tREAwQrFehuM87JjX9YUMXsTXTVzigFunxTBdz/OtwY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nHwSGXCrVc4N8XbBLbC9+WhECpPiIdHHWvovVuqmc2kWfbBCSywItx2n9bl/modMrqBEAIIE3R6FVH46rW4qXtDpv5ka6JjviE8T+xijEj2nLOdxlOHTC98EQr++DJ4gc91gLWxO4WoAlf3Ti+7F+RBqb0cvBjqeh3wCDjTWvP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBp94pVp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBp94pVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469138; x=1743005138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tREAwQrFehuM87JjX9YUMXsTXTVzigFunxTBdz/OtwY=;
  b=XBp94pVpGpYeMvcpG57xvoysztHG1iiek2PjDDmouCsf6OUoaKzPq+1m
   5WeGDE5+hcfw0uQC5JGMbYHuHwRTjqakGE5vDrmBD5Kp58qjG+EcN1x2Q
   8EpVdtFfK6EFcsFtH3hfVYbTr+wGNny20+gg3hB9t++il7WK2/n90uV2u
   X60WuTUTJVDyx5iINAVbNvskgb1JNeWFiJ22ranBR0bTJrtv799yg02iI
   Fmbt3/TA9a5pi7FV0gXxWpTlm887oTYBDp38Z2hLfTLq8zTpo98IbRv9I
   P6RuRUh9XktcsV4LL9I22BOJq6nqc2jKPDj4wm+/gQSH3o2txfSrG2nVk
   Q==;
X-CSE-ConnectionGUID: TohCtjqaTLiLhT+ntm58EQ==
X-CSE-MsgGUID: VLvHAHr7TiGKWDbAz+JacQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260503"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260503"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482392"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 25/34] ASoC: Intel: sof_sdw: remove unused rt dmic rtd_init
Date: Tue, 26 Mar 2024 11:04:20 -0500
Message-Id: <20240326160429.13560-26-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Some Realtek SDW DMIC codecs use the generic rt_dmic_rtd_init callback now.
Remove unused rtd_init callbacks.

Reviewed-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Makefile             |  3 +--
 sound/soc/intel/boards/sof_sdw_common.h     |  3 ---
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c | 24 -------------------
 sound/soc/intel/boards/sof_sdw_rt715.c      | 26 ---------------------
 sound/soc/intel/boards/sof_sdw_rt715_sdca.c | 26 ---------------------
 5 files changed, 1 insertion(+), 81 deletions(-)
 delete mode 100644 sound/soc/intel/boards/sof_sdw_rt715.c
 delete mode 100644 sound/soc/intel/boards/sof_sdw_rt715_sdca.c

diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 08cfd4baecdd..8f711be46c43 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -40,8 +40,7 @@ snd-soc-sof-sdw-objs += sof_sdw.o				\
 			sof_sdw_maxim.o sof_sdw_rt_amp.o	\
 			sof_sdw_rt5682.o sof_sdw_rt700.o	\
 			sof_sdw_rt711.o sof_sdw_rt_sdca_jack_common.o	\
-			sof_sdw_rt712_sdca.o sof_sdw_rt715.o	\
-			sof_sdw_rt715_sdca.o sof_sdw_rt722_sdca.o	\
+			sof_sdw_rt712_sdca.o sof_sdw_rt722_sdca.o	\
 			sof_sdw_rt_dmic.o			\
 			sof_sdw_cs42l42.o sof_sdw_cs42l43.o	\
 			sof_sdw_cs_amp.o			\
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index decaed97fa74..84715d9ca942 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -193,10 +193,7 @@ int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt712_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt715_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt715_sdca_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd);
diff --git a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
index 9c898c7286af..0c4cd4cdbd45 100644
--- a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
@@ -66,27 +66,3 @@ int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
-static const char * const dmics[] = {
-	"rt712-sdca-dmic"
-};
-
-int rt712_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai;
-	struct snd_soc_component *component;
-
-	codec_dai = get_codec_dai_by_name(rtd, dmics, ARRAY_SIZE(dmics));
-	if (!codec_dai)
-		return -EINVAL;
-
-	component = codec_dai->component;
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s mic:%s",
-					  card->components, component->name_prefix);
-	if (!card->components)
-		return -ENOMEM;
-
-	return 0;
-}
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
diff --git a/sound/soc/intel/boards/sof_sdw_rt715.c b/sound/soc/intel/boards/sof_sdw_rt715.c
deleted file mode 100644
index b5a886cd595d..000000000000
--- a/sound/soc/intel/boards/sof_sdw_rt715.c
+++ /dev/null
@@ -1,26 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-// Copyright (c) 2020 Intel Corporation
-
-/*
- *  sof_sdw_rt715 - Helpers to handle RT715 from generic machine driver
- */
-
-#include <linux/device.h>
-#include <linux/errno.h>
-#include <sound/soc.h>
-#include <sound/soc-acpi.h>
-#include "sof_sdw_common.h"
-
-int rt715_rtd_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s mic:rt715",
-					  card->components);
-	if (!card->components)
-		return -ENOMEM;
-
-	return 0;
-}
-
diff --git a/sound/soc/intel/boards/sof_sdw_rt715_sdca.c b/sound/soc/intel/boards/sof_sdw_rt715_sdca.c
deleted file mode 100644
index 4b37a8a6dd2e..000000000000
--- a/sound/soc/intel/boards/sof_sdw_rt715_sdca.c
+++ /dev/null
@@ -1,26 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-// Copyright (c) 2020 Intel Corporation
-
-/*
- *  sof_sdw_rt715_sdca - Helpers to handle RT715-SDCA from generic machine driver
- */
-
-#include <linux/device.h>
-#include <linux/errno.h>
-#include <sound/soc.h>
-#include <sound/soc-acpi.h>
-#include "sof_sdw_common.h"
-
-int rt715_sdca_rtd_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s mic:rt715-sdca",
-					  card->components);
-	if (!card->components)
-		return -ENOMEM;
-
-	return 0;
-}
-
-- 
2.40.1

