Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBABC8FE
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 01:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724723054; cv=none; b=jfQVc181a3ir10dUZ6SN6OzJqqD8qOhB59zz2CHqHTWJhjpVFBY7iVb4ESytfhU45NzA+TphDD9sUYLB7XwZZHP97ikzaFfCT+vkoYdh81M+AFBFI1mS5wrSKx0gfLXEF4O8Aw1jqUebMm/JGOq+VHjTULsgdF8jm/7jOIgRtNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724723054; c=relaxed/simple;
	bh=GAXssEYxSMcqOuV3uPxRaPmNeAofcYK9DNL5VOOEe84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eah2dPUbDJaBwyAXo9q0e4nfp3JdnViPL47jE9Gvy4VrbG+O6je9meelw2EtquLXpnBsynRUo8U4Vb23ZnVw6rhV/Q93noOXT0m5P9wxZULcKOlQEa9EYgE9sSuuDfm/L9TAyZb/1rM6+BHMjugRReVriT+lYjj7eMDWVgUB5HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZJKiJkW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZJKiJkW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724723052; x=1756259052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GAXssEYxSMcqOuV3uPxRaPmNeAofcYK9DNL5VOOEe84=;
  b=BZJKiJkWLr6CU1VEj6Cp4XKfqDNjSPWskF7mRPSdq/Dv0mpGgEcrMAHv
   s5rdf0zQA6JwU4Al7pc0Wq2FKHGCYKvEQI5g3DCSWibRGj2pojmIr32/d
   FS+oaZ0hIfsML9YxxQEXVWUMCygi47vigVkkg6NJ5gyhVUnFRxI/czzYx
   kh0HBZaBuKe5VRk/80Hf5W1kZ7CwwItGneM6AYtKZ4iAbM3E9hfjMEEJx
   NepHIB2vPtkJsY4M9IYlXjpM6LpOP3hl+fAQnT/5YBBhtmniqJLX8+K87
   LUppEwGvexnt59SPmfl2p+1sEGariKSmR6bXmvEAs3nTIS6460NH1QnzI
   Q==;
X-CSE-ConnectionGUID: vHel0dPTQ9OGHHexjVvn2Q==
X-CSE-MsgGUID: 46mn0LxuSgi2WGUyElyIOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22984962"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="22984962"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:44:12 -0700
X-CSE-ConnectionGUID: uZBRGDRLTE2bb5hu48/vYQ==
X-CSE-MsgGUID: SiM9Lm1dS7W6cuhrlPzvNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="63427943"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:44:10 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 11/16] ASoC: Intel: skl_hda_dsp_generic: remove hdac-hdmi support
Date: Tue, 27 Aug 2024 09:43:23 +0800
Message-ID: <20240827014329.6542-12-yung-chuan.liao@linux.intel.com>
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

Since this machine driver has no longer been enumerated by SKL
platform driver, we could remove hdac-hdmi support code just like
what we did to other SOF machine drivers.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig               |  1 -
 sound/soc/intel/boards/skl_hda_dsp_common.c  | 32 +++++---------------
 sound/soc/intel/boards/skl_hda_dsp_common.h  | 26 ----------------
 sound/soc/intel/boards/skl_hda_dsp_generic.c |  8 +----
 4 files changed, 9 insertions(+), 58 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 1141fe1263ce..793a9170513a 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -305,7 +305,6 @@ if SND_SOC_SOF_HDA_AUDIO_CODEC
 config SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH
 	tristate "Skylake+ with HDA Codecs"
 	depends on SND_HDA_CODEC_HDMI
-	select SND_SOC_HDAC_HDMI
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_DMIC
 	# SND_SOC_HDAC_HDA is already selected
diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
index 5eb63f4df241..d1de772e9304 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
@@ -11,7 +11,6 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
-#include "../../codecs/hdac_hdmi.h"
 #include "skl_hda_dsp_common.h"
 
 #include <sound/hda_codec.h>
@@ -35,7 +34,6 @@ int skl_hda_hdmi_add_pcm(struct snd_soc_card *card, int device)
 	if (!pcm->codec_dai)
 		return -EINVAL;
 
-	pcm->device = device;
 	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
 
 	return 0;
@@ -150,32 +148,18 @@ struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS] = {
 int skl_hda_hdmi_jack_init(struct snd_soc_card *card)
 {
 	struct skl_hda_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_component *component = NULL;
+	struct snd_soc_component *component;
 	struct skl_hda_hdmi_pcm *pcm;
-	char jack_name[NAME_SIZE];
-	int err;
 
-	if (ctx->common_hdmi_codec_drv)
-		return skl_hda_hdmi_build_controls(card);
-
-	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
-		component = pcm->codec_dai->component;
-		snprintf(jack_name, sizeof(jack_name),
-			 "HDMI/DP, pcm=%d Jack", pcm->device);
-		err = snd_soc_card_jack_new(card, jack_name,
-					    SND_JACK_AVOUT, &pcm->hdmi_jack);
-
-		if (err)
-			return err;
-
-		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
-					  &pcm->hdmi_jack);
-		if (err < 0)
-			return err;
-	}
+	/* HDMI disabled, do not create controls */
+	if (list_empty(&ctx->hdmi_pcm_list))
+		return 0;
 
+	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct skl_hda_hdmi_pcm,
+			       head);
+	component = pcm->codec_dai->component;
 	if (!component)
 		return -EINVAL;
 
-	return hdac_hdmi_jack_port_init(component, &card->dapm);
+	return hda_dsp_hdmi_build_controls(card, component);
 }
diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.h b/sound/soc/intel/boards/skl_hda_dsp_common.h
index 9d714f747dca..8455f953f4b8 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.h
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.h
@@ -23,8 +23,6 @@
 struct skl_hda_hdmi_pcm {
 	struct list_head head;
 	struct snd_soc_dai *codec_dai;
-	struct snd_soc_jack hdmi_jack;
-	int device;
 };
 
 struct skl_hda_private {
@@ -33,7 +31,6 @@ struct skl_hda_private {
 	int pcm_count;
 	int dai_index;
 	const char *platform_name;
-	bool common_hdmi_codec_drv;
 	bool idisp_codec;
 	bool bt_offload_present;
 	int ssp_bt;
@@ -43,27 +40,4 @@ extern struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS];
 int skl_hda_hdmi_jack_init(struct snd_soc_card *card);
 int skl_hda_hdmi_add_pcm(struct snd_soc_card *card, int device);
 
-/*
- * Search card topology and register HDMI PCM related controls
- * to codec driver.
- */
-static inline int skl_hda_hdmi_build_controls(struct snd_soc_card *card)
-{
-	struct skl_hda_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_component *component;
-	struct skl_hda_hdmi_pcm *pcm;
-
-	/* HDMI disabled, do not create controls */
-	if (list_empty(&ctx->hdmi_pcm_list))
-		return 0;
-
-	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct skl_hda_hdmi_pcm,
-			       head);
-	component = pcm->codec_dai->component;
-	if (!component)
-		return -EINVAL;
-
-	return hda_dsp_hdmi_build_controls(card, component);
-}
-
 #endif /* __SOUND_SOC_HDA_DSP_COMMON_H */
diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 927c73bef065..860a21915bce 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -13,7 +13,6 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
-#include "../../codecs/hdac_hdmi.h"
 #include "skl_hda_dsp_common.h"
 
 static const struct snd_soc_dapm_widget skl_hda_widgets[] = {
@@ -208,7 +207,7 @@ static void skl_set_hda_codec_autosuspend_delay(struct snd_soc_card *card)
 
 static int skl_hda_audio_probe(struct platform_device *pdev)
 {
-	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct skl_hda_private *ctx;
 	struct snd_soc_card *card;
 	int ret;
@@ -221,10 +220,6 @@ static int skl_hda_audio_probe(struct platform_device *pdev)
 
 	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
 
-	mach = pdev->dev.platform_data;
-	if (!mach)
-		return -EINVAL;
-
 	card = &ctx->card;
 	card->name = "hda-dsp",
 	card->owner = THIS_MODULE,
@@ -251,7 +246,6 @@ static int skl_hda_audio_probe(struct platform_device *pdev)
 	ctx->pcm_count = card->num_links;
 	ctx->dai_index = 1; /* hdmi codec dai name starts from index 1 */
 	ctx->platform_name = mach->mach_params.platform;
-	ctx->common_hdmi_codec_drv = mach->mach_params.common_hdmi_codec_drv;
 
 	card->dev = &pdev->dev;
 	if (!snd_soc_acpi_sof_parent(&pdev->dev))
-- 
2.43.0

