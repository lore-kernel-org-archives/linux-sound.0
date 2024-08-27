Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399631C4621
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 12:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761984; cv=none; b=e1970Bd94nd8hlznGs90c+FLB6EU6QEpYkswhOcByjCTl7fp7dNWn3tGPipopgbejYQtRDbealD1hwBgaktA2AggCMOqOmA7G/l6j7epCU9218+IdkA+zyJyOWhGJ20FNcZnKmqNgr6fYUvSFEDzn4U0+kqOswUnk85sCJXfUYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761984; c=relaxed/simple;
	bh=wW/2pLJSjdZPh1qaw9OqI4sD1uYGY+4NcDSA8I0HQ5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UyoxrkZt+dn/2FpaLsQi/YhGGA22Mw0A1QSnb7FCN+T4mSMrKhp7Bj5vVVEMR1XTO18ko2IM8F9EVd8MBMhxNSVDZlTcE4LIVCUgOu9dONRQmMyRDLyNTfUHeiZt5QejPtBx2BAzFuFFDEnGC7WfVSrf66jhoBr6duaG0inJLKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcb/PPZ8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcb/PPZ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724761983; x=1756297983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wW/2pLJSjdZPh1qaw9OqI4sD1uYGY+4NcDSA8I0HQ5E=;
  b=bcb/PPZ8s+rlDcIi2otp7mKUEWjOA473pjn5bXVOXpqNcvaCrDl6D+k1
   h4CDAtYAfXU7HZAPAWg6e5F6mlEaFDhe8jXbNvUnqml9rs5oeBw+O95Gp
   UAWuFN/CiVrhHKqOpkwg+pb+xHlW9vTYY5W7OiGgGMqfYE26HMekPZSu5
   0+arfQjvfuA2FiMHLst0E0K4QC3oCT4n4lqocrNFi+Dj4lzvSrmcWXk/e
   91SCpf+ea0bhCPH5It2ZIJmIbTpTQ3zCmT3Nfmh3EI1g34EkDUXiF30/P
   BF7GCcWg3vS6f8kHkqJVGLKv11Gq63TAqIpZCVpUs1jRkJvTuorw2m9U0
   g==;
X-CSE-ConnectionGUID: 2hMooHa4SZOHd08I+2yADQ==
X-CSE-MsgGUID: uBxFKwnqSXi6rRmuKJty0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13235525"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="13235525"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:33:03 -0700
X-CSE-ConnectionGUID: BBoBJOAdSVSFu3D2ReRO5Q==
X-CSE-MsgGUID: Kuj6TxfsSXmL4K/03EscMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="62676823"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:33:00 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 13/17] ASoC: Intel: skl_hda_dsp_generic: use sof_hdmi_private to init HDMI
Date: Tue, 27 Aug 2024 20:32:11 +0800
Message-ID: <20240827123215.258859-14-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
References: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Use sof_hdmi_private structure instead of a link list of
skl_hda_hdmi_pcm structure for HDMI dai link initialization since
hdac-hdmi support is removed.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_common.c  | 23 ++++++--------------
 sound/soc/intel/boards/skl_hda_dsp_common.h  |  9 ++------
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 13 +++++------
 3 files changed, 15 insertions(+), 30 deletions(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
index d1de772e9304..5019bdfa5b45 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
@@ -21,20 +21,16 @@
 int skl_hda_hdmi_add_pcm(struct snd_soc_card *card, int device)
 {
 	struct skl_hda_private *ctx = snd_soc_card_get_drvdata(card);
-	struct skl_hda_hdmi_pcm *pcm;
+	struct snd_soc_dai *dai;
 	char dai_name[NAME_SIZE];
 
-	pcm = devm_kzalloc(card->dev, sizeof(*pcm), GFP_KERNEL);
-	if (!pcm)
-		return -ENOMEM;
-
 	snprintf(dai_name, sizeof(dai_name), "intel-hdmi-hifi%d",
 		 ctx->dai_index);
-	pcm->codec_dai = snd_soc_card_get_codec_dai(card, dai_name);
-	if (!pcm->codec_dai)
+	dai = snd_soc_card_get_codec_dai(card, dai_name);
+	if (!dai)
 		return -EINVAL;
 
-	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
+	ctx->hdmi.hdmi_comp = dai->component;
 
 	return 0;
 }
@@ -148,18 +144,13 @@ struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS] = {
 int skl_hda_hdmi_jack_init(struct snd_soc_card *card)
 {
 	struct skl_hda_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_component *component;
-	struct skl_hda_hdmi_pcm *pcm;
 
 	/* HDMI disabled, do not create controls */
-	if (list_empty(&ctx->hdmi_pcm_list))
+	if (!ctx->hdmi.idisp_codec)
 		return 0;
 
-	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct skl_hda_hdmi_pcm,
-			       head);
-	component = pcm->codec_dai->component;
-	if (!component)
+	if (!ctx->hdmi.hdmi_comp)
 		return -EINVAL;
 
-	return hda_dsp_hdmi_build_controls(card, component);
+	return hda_dsp_hdmi_build_controls(card, ctx->hdmi.hdmi_comp);
 }
diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.h b/sound/soc/intel/boards/skl_hda_dsp_common.h
index 8455f953f4b8..40ffbccb2fe0 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.h
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.h
@@ -17,21 +17,16 @@
 #include <sound/hda_codec.h>
 #include "../../codecs/hdac_hda.h"
 #include "hda_dsp_common.h"
+#include "sof_hdmi_common.h"
 
 #define HDA_DSP_MAX_BE_DAI_LINKS 8
 
-struct skl_hda_hdmi_pcm {
-	struct list_head head;
-	struct snd_soc_dai *codec_dai;
-};
-
 struct skl_hda_private {
 	struct snd_soc_card card;
-	struct list_head hdmi_pcm_list;
+	struct sof_hdmi_private hdmi;
 	int pcm_count;
 	int dai_index;
 	const char *platform_name;
-	bool idisp_codec;
 	bool bt_offload_present;
 	int ssp_bt;
 };
diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 860a21915bce..225867bb3310 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -75,7 +75,7 @@ skl_hda_add_dai_link(struct snd_soc_card *card, struct snd_soc_dai_link *link)
 	link->platforms->name = ctx->platform_name;
 	link->nonatomic = 1;
 
-	if (!ctx->idisp_codec)
+	if (!ctx->hdmi.idisp_codec)
 		return 0;
 
 	if (strstr(link->name, "HDMI")) {
@@ -98,7 +98,6 @@ skl_hda_add_dai_link(struct snd_soc_card *card, struct snd_soc_dai_link *link)
 
 /* there are two routes per iDisp output */
 #define IDISP_ROUTE_COUNT	(IDISP_DAI_COUNT * 2)
-#define IDISP_CODEC_MASK	0x4
 
 #define HDA_CODEC_AUTOSUSPEND_DELAY_MS 1000
 
@@ -113,10 +112,9 @@ static int skl_hda_fill_card_info(struct device *dev, struct snd_soc_card *card,
 
 	codec_mask = mach_params->codec_mask;
 	codec_count = hweight_long(codec_mask);
-	ctx->idisp_codec = !!(codec_mask & IDISP_CODEC_MASK);
 
 	if (!codec_count || codec_count > 2 ||
-	    (codec_count == 2 && !ctx->idisp_codec))
+	    (codec_count == 2 && !ctx->hdmi.idisp_codec))
 		return -EINVAL;
 
 	if (codec_mask == IDISP_CODEC_MASK) {
@@ -141,7 +139,7 @@ static int skl_hda_fill_card_info(struct device *dev, struct snd_soc_card *card,
 		num_route = ARRAY_SIZE(skl_hda_map);
 		card->dapm_widgets = skl_hda_widgets;
 		card->num_dapm_widgets = ARRAY_SIZE(skl_hda_widgets);
-		if (!ctx->idisp_codec) {
+		if (!ctx->hdmi.idisp_codec) {
 			card->dapm_routes = &skl_hda_map[IDISP_ROUTE_COUNT];
 			num_route -= IDISP_ROUTE_COUNT;
 			for (i = 0; i < IDISP_DAI_COUNT; i++) {
@@ -218,8 +216,6 @@ static int skl_hda_audio_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
-
 	card = &ctx->card;
 	card->name = "hda-dsp",
 	card->owner = THIS_MODULE,
@@ -232,6 +228,9 @@ static int skl_hda_audio_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(card, ctx);
 
+	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
+		ctx->hdmi.idisp_codec = true;
+
 	if (hweight_long(mach->mach_params.bt_link_mask) == 1) {
 		ctx->bt_offload_present = true;
 		ctx->ssp_bt = fls(mach->mach_params.bt_link_mask) - 1;
-- 
2.43.0

