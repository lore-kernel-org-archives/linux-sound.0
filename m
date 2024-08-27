Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3DED53F
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 01:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724723056; cv=none; b=Z/XQtJFqOdN5q6Fv662sQIRO/c/chBvoSmQmNDpqAy2zInSGMxjQJAf4lNoHPDzBoMcZX7r+EQZ4GVdyUQh9aTouJzB1oCYcbesMuyiwKYNN8kiQhQaZXvVj4Fsga+qE7lYISPDMLHtr/egLogig7Uizi3i/j8AkstyO8VKfYmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724723056; c=relaxed/simple;
	bh=wW/2pLJSjdZPh1qaw9OqI4sD1uYGY+4NcDSA8I0HQ5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iz9wWL5nsAqRBqzabImYVSeTiesHfAjpo/Dmn4middoDk1E6jNFnt79+c2niKVd6d8B8DiC9Pwwhf6KdMnlePjcaV5jqgOdP0Uk+E2mKL+N5DAqj34p2UKHTVQs3LowOgx9r46hnB3nxRgS3o+wr05Y9MozuorOg6m/+Nv75oyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y14iQI8O; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y14iQI8O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724723055; x=1756259055;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wW/2pLJSjdZPh1qaw9OqI4sD1uYGY+4NcDSA8I0HQ5E=;
  b=Y14iQI8OY3lXF1yQsIIBHtfdtOWXnglNN6QJ76SDgdknDUYO2UbGutZp
   up1sO9sY8vq5lI0W63Ucj29qwhxG1gnjoNzmKo4+HV1WPyQSJzisq7VqV
   /eCmT32aE2fAyNaOteLLHmaPikaAOJ0/F2GIEBz8DliHAb6IocFJL2uQt
   oX5TJzN0yPTd6ONGTIlKAQJGul6Ga6iM1sB5jZnL+ySnhordQAHkzB9Ro
   8vkEo3R0DxtNEfDSrwnnskv1vKz0gCC6mJrnZ2m1fe/8PcbNYAjs+W1Sz
   GBHEuZvxXtdRxizrZliGUKlzzq1KUfeamj3DNcwv5Ft4OyNw3813pBXZo
   w==;
X-CSE-ConnectionGUID: KOMqXqprR1uulaeUpcxQow==
X-CSE-MsgGUID: ww5ebg1hRsyY9u1p/1JqaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22984970"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="22984970"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:44:15 -0700
X-CSE-ConnectionGUID: U4EKq+biTq2SCU5G9VgseQ==
X-CSE-MsgGUID: wkYFDk7wR3iPJDmYQLuX6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="63427952"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:44:12 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 12/16] ASoC: Intel: skl_hda_dsp_generic: use sof_hdmi_private to init HDMI
Date: Tue, 27 Aug 2024 09:43:24 +0800
Message-ID: <20240827014329.6542-13-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
References: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
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

