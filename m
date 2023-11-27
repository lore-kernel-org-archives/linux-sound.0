Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wo61qjNl"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B4009B
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099321; x=1732635321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=31pRsjv2J+AIInTtcDsFPCwKu0vBHoekWn1R0zEBVeM=;
  b=Wo61qjNlVolwsVpvsmGeVVA81TV3Gem3bd+0a3V/FaXNc7NmYaCk7RHn
   bH61zgfV+r0CBPhwRHR6WmJvxQnVw6E3xuP3Q11mYPDigQYX/8aiQDC7m
   t7vF3K0Flc/yeC7mF5JIizbVJcrhVu66SWkFiEZM4EEd1p+eEfwAEeuq/
   USvWoCshKIONGsGnC0nsgU2dsnI9Y6Sk4SlK8VeIaCbLfV/IDzs5kKqqN
   y+FRqLUDLSzeibOrqq55jFbh7r4veafyaeoiMzwsDFhD9MSFLGAgwqNvV
   I6QkglyoMT4vMYda+blRJrewnJYMonMhXMat5NrYQQqT+G98MuuRfgCtF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894425"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894425"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956405"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771956405"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:36 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 06/27] ASoC: Intel: board_helpers: support codec link initialization
Date: Mon, 27 Nov 2023 17:26:33 +0200
Message-ID: <20231127152654.28204-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add a helper function for machine drivers to initialize headphone
codec DAI links. The function will initialize common fields and let
caller to initialize codec-specific fields like codec, init, exit, and
ops fields.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 51 ++++++++++++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h |  6 +++
 2 files changed, 57 insertions(+)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index ce2967850c2d..5ee53c781b37 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -3,6 +3,7 @@
 // Copyright(c) 2023 Intel Corporation. All rights reserved.
 
 #include <sound/soc.h>
+#include "../common/soc-intel-quirks.h"
 #include "hda_dsp_common.h"
 #include "sof_board_helpers.h"
 
@@ -86,6 +87,55 @@ static struct snd_soc_dai_link_component platform_component[] = {
 	}
 };
 
+int sof_intel_board_set_codec_link(struct device *dev,
+				   struct snd_soc_dai_link *link, int be_id,
+				   enum sof_ssp_codec codec_type, int ssp_codec)
+{
+	struct snd_soc_dai_link_component *cpus;
+
+	dev_dbg(dev, "link %d: codec %s, ssp %d\n", be_id,
+		sof_ssp_get_codec_name(codec_type), ssp_codec);
+
+	/* link name */
+	link->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_codec);
+	if (!link->name)
+		return -ENOMEM;
+
+	/* cpus */
+	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component),
+			    GFP_KERNEL);
+	if (!cpus)
+		return -ENOMEM;
+
+	if (soc_intel_is_byt() || soc_intel_is_cht()) {
+		/* backward-compatibility for BYT/CHT boards */
+		cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "ssp%d-port",
+						ssp_codec);
+	} else {
+		cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin",
+						ssp_codec);
+	}
+	if (!cpus->dai_name)
+		return -ENOMEM;
+
+	link->cpus = cpus;
+	link->num_cpus = 1;
+
+	/* codecs - caller to handle */
+
+	/* platforms */
+	link->platforms = platform_component;
+	link->num_platforms = ARRAY_SIZE(platform_component);
+
+	link->id = be_id;
+	link->no_pcm = 1;
+	link->dpcm_capture = 1;
+	link->dpcm_playback = 1;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sof_intel_board_set_codec_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
+
 int sof_intel_board_set_dmic_link(struct device *dev,
 				  struct snd_soc_dai_link *link, int be_id,
 				  enum sof_dmic_be_type be_type)
@@ -202,3 +252,4 @@ MODULE_DESCRIPTION("ASoC Intel SOF Machine Driver Board Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_SSP_COMMON);
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index df99f576c1d8..7392d639672d 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -30,6 +30,7 @@ struct sof_rt5682_private {
  * @amp_type: type of speaker amplifier
  * @dmic_be_num: number of Intel PCH DMIC BE link
  * @hdmi_num: number of Intel HDMI BE link
+ * @ssp_codec: ssp port number of headphone BE link
  * @rt5682: private data for rt5682 machine driver
  */
 struct sof_card_private {
@@ -42,6 +43,8 @@ struct sof_card_private {
 	int dmic_be_num;
 	int hdmi_num;
 
+	int ssp_codec;
+
 	union {
 		struct sof_rt5682_private rt5682;
 	};
@@ -54,6 +57,9 @@ enum sof_dmic_be_type {
 
 int sof_intel_board_card_late_probe(struct snd_soc_card *card);
 
+int sof_intel_board_set_codec_link(struct device *dev,
+				   struct snd_soc_dai_link *link, int be_id,
+				   enum sof_ssp_codec codec_type, int ssp_codec);
 int sof_intel_board_set_dmic_link(struct device *dev,
 				  struct snd_soc_dai_link *link, int be_id,
 				  enum sof_dmic_be_type be_type);
-- 
2.43.0

