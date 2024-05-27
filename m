Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C46161301
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838580; cv=none; b=FOMbmtB8b/qRPFLdQ2lmPk+TqCBQi8BgoUiztMk55q96KKzzHJehOqkCKxH74kxhEf4+Pr31aHAvMsBw+s7RvuKkJhmIOcDmriqDGg0d5TBXqFbYvInpUrA34KYdXTBFZOUU0SolEn2czLvYT9AI8MYjpev/MKKsutlGJn04dD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838580; c=relaxed/simple;
	bh=mBR1eG8LrTH2tWng+DOwRhMM8oYZsu8AdmROfY29hRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ze/TnEC/d4u96eitQbsGNMqZtRpSpTbv3PnxdP/Wd4/pJ1RQ0UfX8MccOVIdDD6+uXSrKb5h0vDdSSEcB2Xbo1Qi9nndwZHdYmSoLnuZGnI94CnLGeJT51tb0d87zX7fuYotuuivndrpDBGgkNwLjiSCeL4+sNAag0gzqNbK5zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0eL/cbr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0eL/cbr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838579; x=1748374579;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mBR1eG8LrTH2tWng+DOwRhMM8oYZsu8AdmROfY29hRM=;
  b=T0eL/cbry4YxJrhp85D9VccbCGLuO4DCpEHPqBQHPGbdYgcCgNbNPsOT
   vOTLDkhi36n2g/rco/jRycoWNdOspxYZD8ag9bGHH1QFE3uT4kMBO2Vqb
   DkT1jWzrv14HBJSAXRNlgea+KmNjQau/JJlrTElKR/hAemQTCdeyYMjQg
   8AXnLcfoFImlz0XosOe8LBYYu+sHqR+1iE6Qfp1k+rWsaPAAE6lWyPGUg
   7E7Z/Hz9o5HIvJ0NOUriTPu5ro2SD4XMV+tngBdhVd2Udjw/luC2D17Ua
   Z68tQz4/YU2ffq3psS4yodmuFYdfJvv05bZ03hB/4iBvdz3XghkWsXGO8
   A==;
X-CSE-ConnectionGUID: O9wMoogHR2WA0GMZGSmzyQ==
X-CSE-MsgGUID: krx8noipTQKdiRzi2SIkkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339374"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13339374"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:18 -0700
X-CSE-ConnectionGUID: Nw3ssMQYQKyk3AkUJG+/Qw==
X-CSE-MsgGUID: j/KG1HWrQLiI3IAIOOw8Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58029777"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 12/18] ASoC: SOF: sof-audio: rename dai clock setting query function
Date: Mon, 27 May 2024 14:35:46 -0500
Message-ID: <20240527193552.165567-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

We are going to extend the dai_get_clk() callback function to retrieve
other dai-specific settings like tdm slot number, not just mclk/bclk
frequencies. Revisit functions and macros related to the callback and
replace the string 'clk' with 'param' to reflect the ongoing change.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 12 ++++++------
 sound/soc/sof/ipc4-topology.c | 12 ++++++------
 sound/soc/sof/sof-audio.c     | 10 +++++-----
 sound/soc/sof/sof-audio.h     |  8 ++++----
 4 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 32c7d1f3b528..b68dea41cd95 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2500,7 +2500,7 @@ static int sof_ipc3_tear_down_all_pipelines(struct snd_sof_dev *sdev, bool verif
 	return 0;
 }
 
-static int sof_ipc3_dai_get_clk(struct snd_sof_dev *sdev, struct snd_sof_dai *dai, int clk_type)
+static int sof_ipc3_dai_get_param(struct snd_sof_dev *sdev, struct snd_sof_dai *dai, int param_type)
 {
 	struct sof_dai_private_data *private = dai->private;
 
@@ -2509,15 +2509,15 @@ static int sof_ipc3_dai_get_clk(struct snd_sof_dev *sdev, struct snd_sof_dai *da
 
 	switch (private->dai_config->type) {
 	case SOF_DAI_INTEL_SSP:
-		switch (clk_type) {
-		case SOF_DAI_CLK_INTEL_SSP_MCLK:
+		switch (param_type) {
+		case SOF_DAI_PARAM_INTEL_SSP_MCLK:
 			return private->dai_config->ssp.mclk_rate;
-		case SOF_DAI_CLK_INTEL_SSP_BCLK:
+		case SOF_DAI_PARAM_INTEL_SSP_BCLK:
 			return private->dai_config->ssp.bclk_rate;
 		default:
+			dev_err(sdev->dev, "invalid SSP param %d\n", param_type);
 			break;
 		}
-		dev_err(sdev->dev, "fail to get SSP clk %d rate\n", clk_type);
 		break;
 	default:
 		/* not yet implemented for platforms other than the above */
@@ -2692,7 +2692,7 @@ const struct sof_ipc_tplg_ops ipc3_tplg_ops = {
 	.widget_free = sof_ipc3_widget_free,
 	.widget_setup = sof_ipc3_widget_setup,
 	.dai_config = sof_ipc3_dai_config,
-	.dai_get_clk = sof_ipc3_dai_get_clk,
+	.dai_get_param = sof_ipc3_dai_get_param,
 	.set_up_all_pipelines = sof_ipc3_set_up_all_pipelines,
 	.tear_down_all_pipelines = sof_ipc3_tear_down_all_pipelines,
 	.parse_manifest = sof_ipc3_parse_manifest,
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index beff10989324..67e34fd559f2 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -3130,7 +3130,7 @@ static int sof_ipc4_parse_manifest(struct snd_soc_component *scomp, int index,
 	return 0;
 }
 
-static int sof_ipc4_dai_get_clk(struct snd_sof_dev *sdev, struct snd_sof_dai *dai, int clk_type)
+static int sof_ipc4_dai_get_param(struct snd_sof_dev *sdev, struct snd_sof_dai *dai, int param_type)
 {
 	struct sof_ipc4_copier *ipc4_copier = dai->private;
 	struct snd_soc_tplg_hw_config *hw_config;
@@ -3169,13 +3169,13 @@ static int sof_ipc4_dai_get_clk(struct snd_sof_dev *sdev, struct snd_sof_dai *da
 
 	switch (ipc4_copier->dai_type) {
 	case SOF_DAI_INTEL_SSP:
-		switch (clk_type) {
-		case SOF_DAI_CLK_INTEL_SSP_MCLK:
+		switch (param_type) {
+		case SOF_DAI_PARAM_INTEL_SSP_MCLK:
 			return le32_to_cpu(hw_config->mclk_rate);
-		case SOF_DAI_CLK_INTEL_SSP_BCLK:
+		case SOF_DAI_PARAM_INTEL_SSP_BCLK:
 			return le32_to_cpu(hw_config->bclk_rate);
 		default:
-			dev_err(sdev->dev, "Invalid clk type for SSP %d\n", clk_type);
+			dev_err(sdev->dev, "invalid SSP param %d\n", param_type);
 			break;
 		}
 		break;
@@ -3352,7 +3352,7 @@ const struct sof_ipc_tplg_ops ipc4_tplg_ops = {
 	.route_free = sof_ipc4_route_free,
 	.dai_config = sof_ipc4_dai_config,
 	.parse_manifest = sof_ipc4_parse_manifest,
-	.dai_get_clk = sof_ipc4_dai_get_clk,
+	.dai_get_param = sof_ipc4_dai_get_param,
 	.tear_down_all_pipelines = sof_ipc4_tear_down_all_pipelines,
 	.link_setup = sof_ipc4_link_setup,
 };
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index b3ac040811e7..2421a115747e 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -978,7 +978,7 @@ struct snd_sof_dai *snd_sof_find_dai(struct snd_soc_component *scomp,
 	return NULL;
 }
 
-static int sof_dai_get_clk(struct snd_soc_pcm_runtime *rtd, int clk_type)
+static int sof_dai_get_param(struct snd_soc_pcm_runtime *rtd, int param_type)
 {
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
@@ -991,8 +991,8 @@ static int sof_dai_get_clk(struct snd_soc_pcm_runtime *rtd, int clk_type)
 	if (!dai)
 		return 0;
 
-	if (tplg_ops && tplg_ops->dai_get_clk)
-		return tplg_ops->dai_get_clk(sdev, dai, clk_type);
+	if (tplg_ops && tplg_ops->dai_get_param)
+		return tplg_ops->dai_get_param(sdev, dai, param_type);
 
 	return 0;
 }
@@ -1003,7 +1003,7 @@ static int sof_dai_get_clk(struct snd_soc_pcm_runtime *rtd, int clk_type)
  */
 int sof_dai_get_mclk(struct snd_soc_pcm_runtime *rtd)
 {
-	return sof_dai_get_clk(rtd, SOF_DAI_CLK_INTEL_SSP_MCLK);
+	return sof_dai_get_param(rtd, SOF_DAI_PARAM_INTEL_SSP_MCLK);
 }
 EXPORT_SYMBOL(sof_dai_get_mclk);
 
@@ -1013,6 +1013,6 @@ EXPORT_SYMBOL(sof_dai_get_mclk);
  */
 int sof_dai_get_bclk(struct snd_soc_pcm_runtime *rtd)
 {
-	return sof_dai_get_clk(rtd, SOF_DAI_CLK_INTEL_SSP_BCLK);
+	return sof_dai_get_param(rtd, SOF_DAI_PARAM_INTEL_SSP_BCLK);
 }
 EXPORT_SYMBOL(sof_dai_get_bclk);
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index ec2a3bb644d2..abb2a00c520d 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -44,8 +44,8 @@
 #define WIDGET_IS_AIF_OR_DAI(id) (WIDGET_IS_DAI(id) || WIDGET_IS_AIF(id))
 #define WIDGET_IS_COPIER(id) (WIDGET_IS_AIF_OR_DAI(id) || (id) == snd_soc_dapm_buffer)
 
-#define SOF_DAI_CLK_INTEL_SSP_MCLK	0
-#define SOF_DAI_CLK_INTEL_SSP_BCLK	1
+#define SOF_DAI_PARAM_INTEL_SSP_MCLK	0
+#define SOF_DAI_PARAM_INTEL_SSP_BCLK	1
 
 enum sof_widget_op {
 	SOF_WIDGET_PREPARE,
@@ -208,7 +208,7 @@ struct sof_ipc_tplg_widget_ops {
  * @widget_setup: Function pointer for setting up setup in the DSP
  * @widget_free: Function pointer for freeing widget in the DSP
  * @dai_config: Function pointer for sending DAI config IPC to the DSP
- * @dai_get_clk: Function pointer for getting the DAI clock setting
+ * @dai_get_param: Function pointer for getting the DAI parameter
  * @set_up_all_pipelines: Function pointer for setting up all topology pipelines
  * @tear_down_all_pipelines: Function pointer for tearing down all topology pipelines
  * @parse_manifest: Function pointer for ipc4 specific parsing of topology manifest
@@ -229,7 +229,7 @@ struct sof_ipc_tplg_ops {
 	int (*widget_free)(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
 	int (*dai_config)(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget,
 			  unsigned int flags, struct snd_sof_dai_config_data *data);
-	int (*dai_get_clk)(struct snd_sof_dev *sdev, struct snd_sof_dai *dai, int clk_type);
+	int (*dai_get_param)(struct snd_sof_dev *sdev, struct snd_sof_dai *dai, int param_type);
 	int (*set_up_all_pipelines)(struct snd_sof_dev *sdev, bool verify);
 	int (*tear_down_all_pipelines)(struct snd_sof_dev *sdev, bool verify);
 	int (*parse_manifest)(struct snd_soc_component *scomp, int index,
-- 
2.43.0

