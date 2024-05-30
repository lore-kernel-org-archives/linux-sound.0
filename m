Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FDB17966D
	for <linux-sound@vger.kernel.org>; Thu, 30 May 2024 11:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717067945; cv=none; b=Zo25Qq9gLTBKG0l21c5BgUcfTB5uC3POElQMwxHl4pPLS2K5x2r0+5Qmtf+Y6y0zKqbcXmiyJBl4MTef845SyzW4b9inx+E5mnT+dejRsMceVsi3ZQHIxDJwvq7iiChQ2dpm6xAKAkUdpA5U6idZfQeNIkTFgsuJ8ixlaYdYBmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717067945; c=relaxed/simple;
	bh=dosJ+elJmZ6p6YaNbWgzOCOvOzeGA3QAfbOJjz8p8Hk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q1INjFSLKm5fIc3X0uU5IPTQJDg8anyAJ9hrcHIpREQuXwgmlcXasZ+Xd1h0wkrihUcrrN1ktR6/6jVND3sKtBouRCNW8kLDHpZ/CH3S3CupRsznyz7FoFkndpv6JuqMDK75/9B9wANMKSP9UgTBck1bd9bzxd+pDWwZhXv6nes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RfnnwGGD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RfnnwGGD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717067944; x=1748603944;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dosJ+elJmZ6p6YaNbWgzOCOvOzeGA3QAfbOJjz8p8Hk=;
  b=RfnnwGGD5pwmNL+n1a3JBcFpZxvsvBtHWlUvw4M2Pj7bBXJMcJSvqfeg
   G7TMdEwLSrDR72EQ971g5geFTqqYHwBqPWCWhh5kRxSreJIT0Fk7sf2EM
   GDEqs/UP+gCJ5XqORhzbI041MB/77FHTJAQ2NuPgUpPyCkk+1UejTAJvg
   HUtOar8Bc030JM3eksDoFss1mU8IybOzlyv7xf2Fae7sruY9V9HqHCO6t
   WxgWxQUs9yCQGwRSkDhFM7n5L+8cozbnKmZjoaj5o6dRVBHqYcFpHImh7
   9On9UgkXAoEPiWlaYwUdpa173F7EAoCD/rrQXm+pDRJSz4fTLBUcI7Rd9
   g==;
X-CSE-ConnectionGUID: MSIMHe4eQByhZkGl7Otwxw==
X-CSE-MsgGUID: xIlT+7ojQlWNytjAMbfMEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="31065233"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="31065233"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 04:19:04 -0700
X-CSE-ConnectionGUID: fVBcrPSjQNCZ3C3NONIOAQ==
X-CSE-MsgGUID: asPlsAqzTFCY0B1zy05dww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="73258754"
Received: from unknown (HELO pujfalus-desk.intel.com) ([10.124.223.207])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 04:19:01 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	seppo.ingalsuo@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 6.10 3/5] ASoC: SOF: ipc4-topology/pcm: Rename sof_ipc4_copier_is_single_format()
Date: Thu, 30 May 2024 14:19:16 +0300
Message-ID: <20240530111918.21974-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530111918.21974-1-peter.ujfalusi@linux.intel.com>
References: <20240530111918.21974-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the sof_ipc4_copier_is_single_format() to
sof_ipc4_copier_is_single_bitdepth() to clear the confusion of the use of
'format' when we are querying information on the bit depth.
Format is used to describe a combination of parameters (rate, channels,
sample format / bit depth).
Rename the flags used to store the result at the same time.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c      | 12 +++++------
 sound/soc/sof/ipc4-topology.c | 40 +++++++++++++++++------------------
 sound/soc/sof/ipc4-topology.h |  6 +++---
 3 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 307bee63756b..4df2be3d39eb 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -650,7 +650,7 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sof_ipc4_audio_format *ipc4_fmt;
 	struct sof_ipc4_copier *ipc4_copier;
-	bool single_fmt = false;
+	bool single_bitdepth = false;
 	u32 valid_bits = 0;
 	int dir, ret;
 
@@ -682,18 +682,18 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 				return 0;
 
 			if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
-				if (sof_ipc4_copier_is_single_format(sdev,
+				if (sof_ipc4_copier_is_single_bitdepth(sdev,
 					available_fmt->output_pin_fmts,
 					available_fmt->num_output_formats)) {
 					ipc4_fmt = &available_fmt->output_pin_fmts->audio_fmt;
-					single_fmt = true;
+					single_bitdepth = true;
 				}
 			} else {
-				if (sof_ipc4_copier_is_single_format(sdev,
+				if (sof_ipc4_copier_is_single_bitdepth(sdev,
 					available_fmt->input_pin_fmts,
 					available_fmt->num_input_formats)) {
 					ipc4_fmt = &available_fmt->input_pin_fmts->audio_fmt;
-					single_fmt = true;
+					single_bitdepth = true;
 				}
 			}
 		}
@@ -703,7 +703,7 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 	if (ret)
 		return ret;
 
-	if (single_fmt) {
+	if (single_bitdepth) {
 		snd_mask_none(fmt);
 		valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(ipc4_fmt->fmt_cfg);
 		dev_dbg(component->dev, "Set %s to %d bit format\n", dai->name, valid_bits);
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index b47370b2f503..adaef7b47b3f 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1431,7 +1431,7 @@ static int snd_sof_get_hw_config_params(struct snd_sof_dev *sdev, struct snd_sof
 
 static int
 snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
-			       bool single_format,
+			       bool single_bitdepth,
 			       struct snd_pcm_hw_params *params, u32 dai_index,
 			       u32 linktype, u8 dir, u32 **dst, u32 *len)
 {
@@ -1454,7 +1454,7 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
 		 * Look for 32-bit blob first instead of 16-bit if copier
 		 * supports multiple formats
 		 */
-		if (bit_depth == 16 && !single_format) {
+		if (bit_depth == 16 && !single_bitdepth) {
 			dev_dbg(sdev->dev, "Looking for 32-bit blob first for DMIC\n");
 			format_change = true;
 			bit_depth = 32;
@@ -1502,7 +1502,7 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
 			bit_depth = params_width(params);
 			format_change = false;
 			get_new_blob = true;
-		} else if (linktype == SOF_DAI_INTEL_DMIC && !single_format) {
+		} else if (linktype == SOF_DAI_INTEL_DMIC && !single_bitdepth) {
 			/*
 			 * The requested 32-bit blob (no format change for the
 			 * blob request) was not found in NHLT table, try to
@@ -1558,7 +1558,7 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
 #else
 static int
 snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
-			       bool single_format,
+			       bool single_bitdepth,
 			       struct snd_pcm_hw_params *params, u32 dai_index,
 			       u32 linktype, u8 dir, u32 **dst, u32 *len)
 {
@@ -1566,9 +1566,9 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
 }
 #endif
 
-bool sof_ipc4_copier_is_single_format(struct snd_sof_dev *sdev,
-				      struct sof_ipc4_pin_format *pin_fmts,
-				      u32 pin_fmts_size)
+bool sof_ipc4_copier_is_single_bitdepth(struct snd_sof_dev *sdev,
+					struct sof_ipc4_pin_format *pin_fmts,
+					u32 pin_fmts_size)
 {
 	struct sof_ipc4_audio_format *fmt;
 	u32 valid_bits;
@@ -1599,7 +1599,7 @@ sof_ipc4_prepare_dai_copier(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
 	struct snd_pcm_hw_params dai_params = *params;
 	struct sof_ipc4_copier_data *copier_data;
 	struct sof_ipc4_copier *ipc4_copier;
-	bool single_format;
+	bool single_bitdepth;
 	int ret;
 
 	ipc4_copier = dai->private;
@@ -1613,12 +1613,12 @@ sof_ipc4_prepare_dai_copier(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
 	 * format lookup
 	 */
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
-		single_format = sof_ipc4_copier_is_single_format(sdev,
+		single_bitdepth = sof_ipc4_copier_is_single_bitdepth(sdev,
 						available_fmt->output_pin_fmts,
 						available_fmt->num_output_formats);
 
 		/* Update the dai_params with the only supported format */
-		if (single_format) {
+		if (single_bitdepth) {
 			ret = sof_ipc4_update_hw_params(sdev, &dai_params,
 					&available_fmt->output_pin_fmts[0].audio_fmt,
 					BIT(SNDRV_PCM_HW_PARAM_FORMAT));
@@ -1626,12 +1626,12 @@ sof_ipc4_prepare_dai_copier(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
 				return ret;
 		}
 	} else {
-		single_format = sof_ipc4_copier_is_single_format(sdev,
+		single_bitdepth = sof_ipc4_copier_is_single_bitdepth(sdev,
 						available_fmt->input_pin_fmts,
 						available_fmt->num_input_formats);
 
 		/* Update the dai_params with the only supported format */
-		if (single_format) {
+		if (single_bitdepth) {
 			ret = sof_ipc4_update_hw_params(sdev, &dai_params,
 					&available_fmt->input_pin_fmts[0].audio_fmt,
 					BIT(SNDRV_PCM_HW_PARAM_FORMAT));
@@ -1640,7 +1640,7 @@ sof_ipc4_prepare_dai_copier(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
 		}
 	}
 
-	ret = snd_sof_get_nhlt_endpoint_data(sdev, dai, single_format,
+	ret = snd_sof_get_nhlt_endpoint_data(sdev, dai, single_bitdepth,
 					     &dai_params,
 					     ipc4_copier->dai_index,
 					     ipc4_copier->dai_type, dir,
@@ -1675,7 +1675,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	u32 out_ref_rate, out_ref_channels;
 	u32 deep_buffer_dma_ms = 0;
 	int output_fmt_index;
-	bool single_output_format;
+	bool single_output_bitdepth;
 	int i;
 
 	dev_dbg(sdev->dev, "copier %s, type %d", swidget->widget->name, swidget->id);
@@ -1812,9 +1812,9 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		return ret;
 
 	/* set the reference params for output format selection */
-	single_output_format = sof_ipc4_copier_is_single_format(sdev,
-								available_fmt->output_pin_fmts,
-								available_fmt->num_output_formats);
+	single_output_bitdepth = sof_ipc4_copier_is_single_bitdepth(sdev,
+					available_fmt->output_pin_fmts,
+					available_fmt->num_output_formats);
 	switch (swidget->id) {
 	case snd_soc_dapm_aif_in:
 	case snd_soc_dapm_dai_out:
@@ -1826,7 +1826,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		out_ref_rate = in_fmt->sampling_frequency;
 		out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
 
-		if (!single_output_format)
+		if (!single_output_bitdepth)
 			out_ref_valid_bits =
 				SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
 		break;
@@ -1835,7 +1835,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	case snd_soc_dapm_dai_in:
 		out_ref_rate = params_rate(fe_params);
 		out_ref_channels = params_channels(fe_params);
-		if (!single_output_format) {
+		if (!single_output_bitdepth) {
 			out_ref_valid_bits = sof_ipc4_get_valid_bits(sdev, fe_params);
 			if (out_ref_valid_bits < 0)
 				return out_ref_valid_bits;
@@ -1853,7 +1853,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	 * if the output format is the same across all available output formats, choose
 	 * that as the reference.
 	 */
-	if (single_output_format) {
+	if (single_output_bitdepth) {
 		struct sof_ipc4_audio_format *out_fmt;
 
 		out_fmt = &available_fmt->output_pin_fmts[0].audio_fmt;
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 4488762f6a71..f4dc499c0ffe 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -476,7 +476,7 @@ struct sof_ipc4_process {
 	u32 init_config;
 };
 
-bool sof_ipc4_copier_is_single_format(struct snd_sof_dev *sdev,
-				      struct sof_ipc4_pin_format *pin_fmts,
-				      u32 pin_fmts_size);
+bool sof_ipc4_copier_is_single_bitdepth(struct snd_sof_dev *sdev,
+					struct sof_ipc4_pin_format *pin_fmts,
+					u32 pin_fmts_size);
 #endif
-- 
2.45.1

