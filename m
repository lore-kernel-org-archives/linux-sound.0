Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5295037DAD5
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 12:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785413823; cv=none; b=H+u9zXVEljK0df0+MKF/b+BzunFxV4wYlGH/9twqGxsSqtkn9KZQJXfvm8uoGUaTJ5/fntUbkmCM8VVbEHbKxTAkW9J8YBu4VkQgfj6Xz6hRoqIxHH+kt2VYOTiom2YtcSKj8KC+XVHh+d2re8J/FQu5dUV4Vbz7U0gSgN0ozCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785413823; c=relaxed/simple;
	bh=zdQgxvajsV6Fj2jetNjbaNc1suHg2SL7HRPuEmrYZJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lrqE+CPo3VkkIWLMh+2IM/Rkb1jDrPN5qjXjaFVBhrMSZpmPEmVL/l1njzilFP5Uashm/8MxO5O3Dz1j5UwhVUSpdmvqNWh9WBhpWkGSeT/gWVGGuGG3ZbK8VDArZtKpMiFyHCFXw9siyezhqcaIurpCK9iwTkQI95kl2ybE9CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kdy9BTlF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kdy9BTlF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785413822; x=1816949822;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zdQgxvajsV6Fj2jetNjbaNc1suHg2SL7HRPuEmrYZJw=;
  b=Kdy9BTlF69FVE+7qOeX2ohSPHQy4oOloRAT8siGVc/KwGeL0lfOQkrEV
   2xhhv7zdG4FojZzKPrtYylWw1OO3tw7EiJYPHRG8erupAspY8/ZqTKCSz
   FBGTQKvL0+O9wkGaMFNpN7QoSPVtJXyugJ7utyb0K6a1vT84l2YBTEk5Y
   s2ygfcNltMq0ZftP5eGDKif0sj3gf70U4vMtrfzPa6jCGLJr1xgH0weFx
   YAt2MIOrTTMh2KTPQ7fpnpj668K3fdGAd7iyA1SaBrHA5mAVTfcUsvGDe
   HMw+tXvksABmz2kjeHLmCwlyVVgOKgi3TbUN0J70n5X3FT2ZtH1jeiXBu
   A==;
X-CSE-ConnectionGUID: v1R4SNynSpq4+9TSN9YOVQ==
X-CSE-MsgGUID: qrkawv0IRBWMHWWlqdvSXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97187673"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="97187673"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:17:02 -0700
X-CSE-ConnectionGUID: Vn6p8xQxRLizONVjb+pTaw==
X-CSE-MsgGUID: lJW9JStjQ46s0hpTPeuIoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="259711274"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:17:00 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 3/3] ASoC: SOF: ipc4-topology: Update the pipeline_params of prepared modules
Date: Thu, 30 Jul 2026 15:17:29 +0300
Message-ID: <20260730121729.18673-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730121729.18673-1-peter.ujfalusi@linux.intel.com>
References: <20260730121729.18673-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the module in path has been already prepared on a branch type of
topology, where the branching happens downstream:
A1--> A2 ---> B1 --> B2 ... B-branch
          |-> C1 --> C2 ... C-branch

In this case if B-branch is started then A1/A2 is prepared, but when
C-branch starts we still need to refine the parameters up to C1 to arrive
with a correct params to configure C1.

This branching can happen with copiers process modules.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/ipc4-topology.c | 94 +++++++++++++++++++++++++++++++++--
 sound/soc/sof/sof-audio.c     |  5 +-
 2 files changed, 92 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 6f9f5325a50b..9303e018b3fe 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2106,10 +2106,57 @@ static void sof_ipc4_host_config(struct snd_sof_dev *sdev, struct snd_sof_widget
 }
 
 static int
-sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
-			       struct snd_pcm_hw_params *fe_params,
-			       struct snd_sof_platform_stream_params *platform_params,
-			       struct snd_pcm_hw_params *pipeline_params, int dir)
+sof_ipc4_copier_module_update_params(struct snd_sof_widget *swidget,
+				     struct snd_pcm_hw_params *pipeline_params)
+{
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct sof_ipc4_copier_data *copier_data;
+	struct sof_ipc4_copier *ipc4_copier;
+
+	switch (swidget->id) {
+	case snd_soc_dapm_aif_in:
+	case snd_soc_dapm_aif_out:
+	case snd_soc_dapm_buffer:
+		ipc4_copier = swidget->private;
+		copier_data = &ipc4_copier->data;
+		break;
+	case snd_soc_dapm_dai_in:
+	case snd_soc_dapm_dai_out:
+	{
+		struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
+		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
+		struct snd_sof_dai *dai;
+
+		if (pipeline->use_chain_dma)
+			return 0;
+
+		dai = swidget->private;
+
+		ipc4_copier = (struct sof_ipc4_copier *)dai->private;
+		copier_data = &ipc4_copier->data;
+
+		break;
+	}
+	default:
+		dev_err(sdev->dev, "unsupported type %d for copier %s",
+			swidget->id, swidget->widget->name);
+		return -EINVAL;
+	}
+
+	/* modify the input params for the next widget */
+	return sof_ipc4_update_hw_params(sdev, pipeline_params,
+					 &copier_data->out_format,
+					 BIT(SNDRV_PCM_HW_PARAM_FORMAT) |
+					 BIT(SNDRV_PCM_HW_PARAM_CHANNELS) |
+					 BIT(SNDRV_PCM_HW_PARAM_RATE));
+}
+
+static int
+_sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
+				struct snd_pcm_hw_params *fe_params,
+				struct snd_sof_platform_stream_params *platform_params,
+				struct snd_pcm_hw_params *pipeline_params, int dir)
 {
 	struct sof_ipc4_available_audio_format *available_fmt;
 	struct snd_soc_component *scomp = swidget->scomp;
@@ -2581,6 +2628,21 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	return 0;
 }
 
+static int
+sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
+			       struct snd_pcm_hw_params *fe_params,
+			       struct snd_sof_platform_stream_params *platform_params,
+			       struct snd_pcm_hw_params *pipeline_params, int dir)
+{
+	if (swidget->prepared)
+		return sof_ipc4_copier_module_update_params(swidget,
+							    pipeline_params);
+
+	return _sof_ipc4_prepare_copier_module(swidget, fe_params,
+					       platform_params, pipeline_params,
+					       dir);
+}
+
 static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 					struct snd_pcm_hw_params *fe_params,
 					struct snd_sof_platform_stream_params *platform_params,
@@ -2594,6 +2656,10 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits, out_ref_type;
 	int input_fmt_index, output_fmt_index;
 
+	/* This cannot happen */
+	if (unlikely(swidget->prepared))
+		return 0;
+
 	input_fmt_index = sof_ipc4_init_input_audio_fmt(sdev, swidget,
 							&gain->data.base_config,
 							pipeline_params,
@@ -2639,6 +2705,10 @@ static int sof_ipc4_prepare_mixer_module(struct snd_sof_widget *swidget,
 	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits, out_ref_type;
 	int input_fmt_index, output_fmt_index;
 
+	/* Already prepared, nothing to do */
+	if (swidget->prepared)
+		return 0;
+
 	input_fmt_index = sof_ipc4_init_input_audio_fmt(sdev, swidget,
 							&mixer->base_config,
 							pipeline_params,
@@ -2685,6 +2755,10 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits, out_ref_type;
 	int output_fmt_index, input_fmt_index;
 
+	/* This cannot happen */
+	if (unlikely(swidget->prepared))
+		return 0;
+
 	input_fmt_index = sof_ipc4_init_input_audio_fmt(sdev, swidget,
 							&src->data.base_config,
 							pipeline_params,
@@ -2851,6 +2925,18 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 	int ret;
 
 	if (available_fmt->num_input_formats) {
+		if (swidget->prepared) {
+			if (!available_fmt->num_output_formats)
+				return 0;
+
+			/* modify the pipeline params with the output format */
+			return sof_ipc4_update_hw_params(sdev, pipeline_params,
+							&process->output_format,
+							BIT(SNDRV_PCM_HW_PARAM_FORMAT) |
+							BIT(SNDRV_PCM_HW_PARAM_CHANNELS) |
+							BIT(SNDRV_PCM_HW_PARAM_RATE));
+		}
+
 		input_fmt_index = sof_ipc4_init_input_audio_fmt(sdev, swidget,
 								&process->base_config,
 								pipeline_params,
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index acf56607bc9c..a58617d2b824 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -502,9 +502,8 @@ sof_prepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget
 	    !sof_widget_in_same_direction(swidget, dir))
 		return 0;
 
-	/* skip widgets already prepared or aggregated DAI widgets*/
-	if (!widget_ops[widget->id].ipc_prepare || swidget->prepared ||
-	    is_aggregated_dai(swidget))
+	/* skip widgets aggregated DAI widgets */
+	if (!widget_ops[widget->id].ipc_prepare || is_aggregated_dai(swidget))
 		goto sink_prepare;
 
 	/* prepare the source widget */
-- 
2.55.0

