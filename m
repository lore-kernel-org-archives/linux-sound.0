Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139C213CAA8
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469140; cv=none; b=kU3XiEGVjaeSbdAND0TkR9x8RNXmYCvKrdGRuf37CYYNPgKadLqm3iJLn4id4zcwxnFMD9+cXP1YT1aB5CWA5ePfnOCb3nH7KlZ0BCxyV6PV236gcoAecB7USZgA+rDFs2cskxuo35QCviz1ZyiuK9zDVle5i9O77MmCRK+o4ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469140; c=relaxed/simple;
	bh=3BGgqt/NQ1cOKzlyAvCQvOk3uiXzl+v1VYM0btX6ABw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tNoqqBfGy+ACrh/OG/apAvg4bBj9Baxo1KZu4QYREWLIr/7+pvs/13iEX4HIcbMjDCsoS+2Em/P0/Jui66CC5EKKeDzCP7LauI96+Bau18YTAjEEKoOWrk3pWSeXjaDX/nfw+BZvBq6kyWaakIzPdEKI3fx1gqyMv5Rklz4ZFgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkRx+4s5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkRx+4s5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469138; x=1743005138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3BGgqt/NQ1cOKzlyAvCQvOk3uiXzl+v1VYM0btX6ABw=;
  b=IkRx+4s56/qWsdPwKf/mCa3GtppKRTbZGQGV0i0Vt0n13u58cV8/ztcL
   jBCQa1MPH2/pOVFD/QDKsPlD6bo7PEk3CvzHtB23N+1j4i/61IDCBlUU4
   WurOv6m4uIoKgI49QC4W4Hy6EMNwewH6qQDwlzLF5bW3lav/f4pEuExh8
   qD31Ney95Xy6HBb4yFabZ+eOL2QHPCtFsHQdBcXrPhWk1StqWYHOZyDUq
   QZAkaO/1oP2LKEh+57m8yIClGSrF/aSr3xTwir6b/t1CgUo4p1KK7PPKg
   Qzctrbbw3z8ZoFcsFLkI3U5k6mVTAx2TaTWxGzqk8UGV1hg72ixEqWC2O
   Q==;
X-CSE-ConnectionGUID: zYPgoY0qTdeseXn7lhxqFg==
X-CSE-MsgGUID: mUsfFuBbQPa94aHSh093HA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260494"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260494"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482381"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:59 -0700
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
Subject: [PATCH 24/34] ASoC: Intel: sof_sdw: use generic rtd_init function for Realtek SDW DMICs
Date: Tue, 26 Mar 2024 11:04:19 -0500
Message-Id: <20240326160429.13560-25-pierre-louis.bossart@linux.intel.com>
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

The only thing that the rt_xxx_rtd_init() functions do is to set
card->components. And we can set card->components with name_prefix
as rt712_sdca_dmic_rtd_init() does.
And sof_sdw_rtd_init() will always select the first dai with the
given dai->name from codec_info_list[]. Unfortunately, we have
different codecs with the same dai name. For example, dai name of
rt715 and rt715-sdca are both "rt715-aif2". Using a generic rtd_init
allow sof_sdw_rtd_init() run the rtd_init() callback from a similar
codec dai.

Fixes: 8266c73126b7 ("ASoC: Intel: sof_sdw: add common sdw dai link init")
Reviewed-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Makefile          |  1 +
 sound/soc/intel/boards/sof_sdw.c         | 12 +++---
 sound/soc/intel/boards/sof_sdw_common.h  |  1 +
 sound/soc/intel/boards/sof_sdw_rt_dmic.c | 52 ++++++++++++++++++++++++
 4 files changed, 60 insertions(+), 6 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt_dmic.c

diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index bbf796a5f7ba..08cfd4baecdd 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -42,6 +42,7 @@ snd-soc-sof-sdw-objs += sof_sdw.o				\
 			sof_sdw_rt711.o sof_sdw_rt_sdca_jack_common.o	\
 			sof_sdw_rt712_sdca.o sof_sdw_rt715.o	\
 			sof_sdw_rt715_sdca.o sof_sdw_rt722_sdca.o	\
+			sof_sdw_rt_dmic.o			\
 			sof_sdw_cs42l42.o sof_sdw_cs42l43.o	\
 			sof_sdw_cs_amp.o			\
 			sof_sdw_dmic.o				\
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 3e6a758c98ab..0e376cb0ce0b 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -749,7 +749,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt712-sdca-dmic-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.rtd_init = rt712_sdca_dmic_rtd_init,
+				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -779,7 +779,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt712-sdca-dmic-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.rtd_init = rt712_sdca_dmic_rtd_init,
+				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -841,7 +841,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.rtd_init = rt715_sdca_rtd_init,
+				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -856,7 +856,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.rtd_init = rt715_sdca_rtd_init,
+				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -871,7 +871,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.rtd_init = rt715_rtd_init,
+				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -886,7 +886,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.rtd_init = rt715_rtd_init,
+				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index e21ef79126b2..decaed97fa74 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -197,6 +197,7 @@ int rt712_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt715_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt715_sdca_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd);
 
diff --git a/sound/soc/intel/boards/sof_sdw_rt_dmic.c b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
new file mode 100644
index 000000000000..9091f5b5c648
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2024 Intel Corporation
+
+/*
+ * sof_sdw_rt_dmic - Helpers to handle Realtek SDW DMIC from generic machine driver
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "sof_board_helpers.h"
+#include "sof_sdw_common.h"
+
+static const char * const dmics[] = {
+	"rt715",
+	"rt712-sdca-dmic",
+};
+
+int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_component *component;
+	struct snd_soc_dai *codec_dai;
+	char *mic_name;
+
+	codec_dai = get_codec_dai_by_name(rtd, dmics, ARRAY_SIZE(dmics));
+	if (!codec_dai)
+		return -EINVAL;
+
+	component = codec_dai->component;
+
+	/*
+	 * rt715-sdca (aka rt714) is a special case that uses different name in card->components
+	 * and component->name_prefix.
+	 */
+	if (!strcmp(component->name_prefix, "rt714"))
+		mic_name = devm_kasprintf(card->dev, GFP_KERNEL, "rt715-sdca");
+	else
+		mic_name = devm_kasprintf(card->dev, GFP_KERNEL, "%s", component->name_prefix);
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s mic:%s", card->components,
+					  mic_name);
+	if (!card->components)
+		return -ENOMEM;
+
+	dev_dbg(card->dev, "card->components: %s\n", card->components);
+
+	return 0;
+}
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
-- 
2.40.1

