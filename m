Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B5F2CCB9
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 12:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785413821; cv=none; b=b3ttTxS66H7Qnh3CJ9osNyUuP4Ih1SFH5KHFcOA6RyzTsI3IvVk2U7UDQ3MpIp6S+AVpWgHKPWQwEbDs5gmW9DSQCXykJLb5xtQvZRw9FyRLY14bhLbHPg7vqUsKuh/3l9qi+RsYNkaoE6QTLbt2kAgKJiCLb5wpASg7NDIahfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785413821; c=relaxed/simple;
	bh=my6Qf7gdtyw/MvKBvHxDvwn6A9ffiTpmk1/qxTCHd6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FSRCO9I92uKQzfLYd7dB/ofcF5LuK3nVqgBqslhBtuJLAevr1FJOKE4MRyUpjnG/r9HBgNyKg0PVKL7OcfkKC1sz/YDXS68Nei+uQHjPAJtdA64TnKK4j15bX/IshpqdM+kDKUJ2J5E2Jou+nc+975VEoLZbvRuyE7h9detXluM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5GOmmil; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5GOmmil"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785413820; x=1816949820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=my6Qf7gdtyw/MvKBvHxDvwn6A9ffiTpmk1/qxTCHd6A=;
  b=l5GOmmilRzJVkyApI5ZNtVejzzM5CN65oCuhyfxHaZOXB892Cn7PmZ3M
   pEZcIuVGK+ZHeTD05GvPTQ3uD40QpLwtJQfz4P+5R+jNPsgX03Cy/4Xdr
   zPevjgcJJk82vLM4DJIkCYgBQ9hz66fg6KkVO3WdfabDm4C7vpbxvnP8H
   ltOKiJ7NH79jHYO8VMLnVEXyIKGUOkb9LkgBazgYnvn/8ZBF+2+am08xN
   944SWHMChF9Bzx3cG7Y3m3wJQwqlZslqFxxvJR+UXeqBk3NzqetZCqW+M
   yVN+bUHhRIlaVhf0aFGShdBsk3v7L1eubdrzv3bwBB3w+5/+ghvnE0Y6S
   w==;
X-CSE-ConnectionGUID: zM3Es7OmR32N8lB8zas/fA==
X-CSE-MsgGUID: 4Q47x1FSRImfTtq7mCkrQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97187666"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="97187666"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:16:59 -0700
X-CSE-ConnectionGUID: BXaoRfq2SpCYli6zYAcf+g==
X-CSE-MsgGUID: BoT+KZgESEmke3lmk0vUkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="259711259"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:16:58 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 2/3] ASoC: SOF: ipc4-topology: Correct the process module's output lookup
Date: Thu, 30 Jul 2026 15:17:28 +0300
Message-ID: <20260730121729.18673-3-peter.ujfalusi@linux.intel.com>
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

The process module can change different parameters in the audio path and
this change has to be properly evaluated and applied.

In case of playback we are converting from multiple input formats to a
single format (or just passing through without change), the output format
lookup must be based on the input format.

In case of capture, we are converting from a single input format to a
format which is to be passed to the FE, we need to use the input parameters
and the FE parameters to be able to find the correct format:
for those parameters that are modified by the module instance we need to
use the FE parameter while for the rest we use the input parameters.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/ipc4-topology.c | 66 +++++++++++++++++++++++++----------
 1 file changed, 47 insertions(+), 19 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index df002e69d2a7..6f9f5325a50b 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2863,39 +2863,69 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 	if (available_fmt->num_output_formats) {
 		struct sof_ipc4_audio_format *in_fmt;
 		struct sof_ipc4_pin_format *pin_fmt;
-		u32 out_ref_rate, out_ref_channels;
-		int out_ref_valid_bits, out_ref_type;
+		u32 ref_rate, ref_channels;
+		int ref_valid_bits, ref_type;
 
 		if (available_fmt->num_input_formats) {
+			/*
+			 * The process module can change parameters and their operation
+			 * depends on the direction:
+			 * Playback: typically they have single output format. This is
+			 *	     to 'force' the conversion from input to output.
+			 *	     Use the input format as reference since the single
+			 *	     format is going to be picked.
+			 * Capture: typically they have multiple output formats to
+			 *	    convert from dai (input) to FE (output) parameters.
+			 *          Use the input format as base and replace the param
+			 *	    which is changed by the module with the FE parameter
+			 *	    Reason: we can have module which changes the
+			 *	            parameters in path, we cannot use the full
+			 *		    FE param set for the module output lookup.
+			 */
 			in_fmt = &available_fmt->input_pin_fmts[input_fmt_index].audio_fmt;
 
-			out_ref_rate = in_fmt->sampling_frequency;
-			out_ref_channels =
+			ref_rate = in_fmt->sampling_frequency;
+			ref_channels =
 				SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
-			out_ref_valid_bits =
+			ref_valid_bits =
 				SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
-			out_ref_type = sof_ipc4_fmt_cfg_to_type(in_fmt->fmt_cfg);
+			ref_type = sof_ipc4_fmt_cfg_to_type(in_fmt->fmt_cfg);
 		} else {
 			/* for modules without input formats, use FE params as reference */
-			out_ref_rate = params_rate(fe_params);
-			out_ref_channels = params_channels(fe_params);
+			ref_rate = params_rate(fe_params);
+			ref_channels = params_channels(fe_params);
 			ret = sof_ipc4_get_sample_type(sdev, fe_params);
 			if (ret < 0)
 				return ret;
-			out_ref_type = (u32)ret;
+			ref_type = (u32)ret;
 
-			out_ref_valid_bits = sof_ipc4_get_valid_bits(sdev, fe_params);
-			if (out_ref_valid_bits < 0)
-				return out_ref_valid_bits;
+			ref_valid_bits = sof_ipc4_get_valid_bits(sdev, fe_params);
+			if (ref_valid_bits < 0)
+				return ref_valid_bits;
 		}
 
+		if (dir == SNDRV_PCM_STREAM_CAPTURE) {
+			if (available_fmt->changed_params & BIT(SNDRV_PCM_HW_PARAM_RATE))
+				ref_rate = params_rate(fe_params);
+			if (available_fmt->changed_params & BIT(SNDRV_PCM_HW_PARAM_CHANNELS))
+				ref_channels = params_channels(fe_params);
+			if (available_fmt->changed_params & BIT(SNDRV_PCM_HW_PARAM_FORMAT)) {
+				ref_valid_bits = sof_ipc4_get_valid_bits(sdev, fe_params);
+				if (ref_valid_bits < 0)
+					return ref_valid_bits;
+
+				ref_type = sof_ipc4_get_sample_type(sdev, fe_params);
+				if (ref_type < 0)
+					return ref_type;
+			}
+		}
 		output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, swidget,
 								  &process->base_config,
 								  available_fmt,
-								  out_ref_rate,
-								  out_ref_channels,
-								  out_ref_valid_bits,
-								  out_ref_type);
+								  ref_rate,
+								  ref_channels,
+								  ref_valid_bits,
+								  ref_type);
 		if (output_fmt_index < 0)
 			return output_fmt_index;
 
@@ -2909,9 +2939,7 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 			/* modify the pipeline params with the output format */
 			ret = sof_ipc4_update_hw_params(sdev, pipeline_params,
 							&process->output_format,
-							BIT(SNDRV_PCM_HW_PARAM_FORMAT) |
-							BIT(SNDRV_PCM_HW_PARAM_CHANNELS) |
-							BIT(SNDRV_PCM_HW_PARAM_RATE));
+							available_fmt->changed_params);
 			if (ret)
 				return ret;
 		}
-- 
2.55.0

