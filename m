Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAB2C5AD4C
	for <linux-sound@archiver.kernel.org>; Thu, 16 Nov 2023 11:22:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344966AbjKPLWo (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 16 Nov 2023 06:22:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233461AbjKPLWk (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Thu, 16 Nov 2023 06:22:40 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15594AA
        for <linux-sound@vger.kernel.org>; Thu, 16 Nov 2023 03:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700133757; x=1731669757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v1+8aCvBhTC0KW/UxxH7boYEwxvUIYTIlUs8nqQsEI0=;
  b=LAdeUC8eB92U2quabTouUTVMIDsdEC6GtbK7uelKM0g/K4bzSbuWxx1r
   qX95zRVITfdAtyft9vALK7fEOCxU0yr2alWv9uJEX6q7dcVLrosbFrgqw
   lUzW7JjVDrj5EqaQJ42QhZ/n4TMabmlN/jk2xjeeHWuM+ni8sptr7pUp2
   RnNh6TiNF6vUTKEgRnEhIZOqrggBH7hBt04KoeoeisEM/NAtUudtmvP73
   6PjNoEYx9pkxUpWEPc+PSgogOU6EL27AUOB/1Pm3KlEclInaFzbOgAvs+
   th9qmiPu3St2hVotN/zHxQdobHY9pOvncEoSi8hhSjsL3lIKh7U2GZ9mf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="457562075"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="457562075"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 03:22:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; 
   d="scan'208";a="6698272"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2023 03:22:12 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 15/16] ASoC: Intel: avs: Kill S24_LE format
Date:   Thu, 16 Nov 2023 12:22:54 +0100
Message-Id: <20231116112255.1584795-16-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116112255.1584795-1-cezary.rojewski@intel.com>
References: <20231116112255.1584795-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Eliminate all occurrences of S24_LE within PCM code, both HOST and LINK
side. Replace those with MSBITS subformats to allow for granular
selection when S32_LE is the format of choice.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c      | 20 +++++++++++++++-----
 sound/soc/intel/avs/topology.c | 13 ++++++++++++-
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 595914f93846..73f0fadb97b9 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1073,8 +1073,10 @@ static const struct snd_pcm_hardware avs_pcm_hardware = {
 				  SNDRV_PCM_INFO_RESUME |
 				  SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 	.formats		= SNDRV_PCM_FMTBIT_S16_LE |
-				  SNDRV_PCM_FMTBIT_S24_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
+	.subformats		= SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
 	.buffer_bytes_max	= AZX_MAX_BUF_SIZE,
 	.period_bytes_min	= 128,
 	.period_bytes_max	= AZX_MAX_BUF_SIZE / 2,
@@ -1225,8 +1227,10 @@ static const struct snd_soc_dai_driver i2s_dai_template = {
 		.rates		= SNDRV_PCM_RATE_8000_192000 |
 				  SNDRV_PCM_RATE_KNOT,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
-				  SNDRV_PCM_FMTBIT_S24_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
+		.subformats	= SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
 	},
 	.capture = {
 		.channels_min	= 1,
@@ -1234,8 +1238,10 @@ static const struct snd_soc_dai_driver i2s_dai_template = {
 		.rates		= SNDRV_PCM_RATE_8000_192000 |
 				  SNDRV_PCM_RATE_KNOT,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
-				  SNDRV_PCM_FMTBIT_S24_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
+		.subformats	= SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
 	},
 };
 
@@ -1310,16 +1316,20 @@ static const struct snd_soc_dai_driver hda_cpu_dai = {
 		.channels_max	= 8,
 		.rates		= SNDRV_PCM_RATE_8000_192000,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
-				  SNDRV_PCM_FMTBIT_S24_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
+		.subformats	= SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
 	},
 	.capture = {
 		.channels_min	= 1,
 		.channels_max	= 8,
 		.rates		= SNDRV_PCM_RATE_8000_192000,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
-				  SNDRV_PCM_FMTBIT_S24_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
+		.subformats	= SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+				  SNDRV_PCM_SUBFMTBIT_MSBITS_MAX,
 	},
 };
 
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index c74e9d622e4c..778236d3fd28 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1514,8 +1514,16 @@ static int avs_dai_load(struct snd_soc_component *comp, int index,
 			struct snd_soc_dai_driver *dai_drv, struct snd_soc_tplg_pcm *pcm,
 			struct snd_soc_dai *dai)
 {
-	if (pcm)
+	u32 fe_subformats = SNDRV_PCM_SUBFMTBIT_MSBITS_20 |
+			    SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
+			    SNDRV_PCM_SUBFMTBIT_MSBITS_MAX;
+
+	if (pcm) {
 		dai_drv->ops = &avs_dai_fe_ops;
+		dai_drv->capture.subformats = fe_subformats;
+		dai_drv->playback.subformats = fe_subformats;
+	}
+
 	return 0;
 }
 
@@ -1534,6 +1542,9 @@ static int avs_link_load(struct snd_soc_component *comp, int index, struct snd_s
 		/* Open LINK (BE) pipes last and close them first to prevent xruns. */
 		link->trigger[0] = SND_SOC_DPCM_TRIGGER_PRE;
 		link->trigger[1] = SND_SOC_DPCM_TRIGGER_PRE;
+	} else {
+		/* Do not ignore codec capabilities. */
+		link->dpcm_merged_format = 1;
 	}
 
 	return 0;
-- 
2.25.1

