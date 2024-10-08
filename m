Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB081D9A6A
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 11:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728385770; cv=none; b=Pp7K7urbwjyZDPT7SL5n/qlafp65rHrEka1TwXdcYFKRzilzbD4tZPoHTM/vf+wF1g45S7lRcG82BigSQ4TrF6S4+XjgFTMxVSzriBZ6lGkcL6skkCyDrf3gbhIC14eochu/QTocJhzrnEyEzpHHORSKKZ7V7vsS0ZLQ16I9FLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728385770; c=relaxed/simple;
	bh=U4uy7p8XMpbbwFiPKOw9PoppSOPBL1bsyYXMEv6tnJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=se2+in9R/+j0KR14flYHlKpbjupShsBY0cM8wYG7N74rW+IADmwu8XPQnxJ9S7/Ou2BBoZE1TQ9cL/DVS7e2xvHI4ykZwsMrl4R1ToV3omuoTLj6igvKD2gvziF9hLxyy1WB4otZzgE0tcPg8aquqZoBXVrCv69vYLZ4+hsfdVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AWAnDfV0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AWAnDfV0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728385770; x=1759921770;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U4uy7p8XMpbbwFiPKOw9PoppSOPBL1bsyYXMEv6tnJ8=;
  b=AWAnDfV05FxYrz2UrLDyDW2B5FmiaR0jAAExlaLa5mRM4MeSuEIAau8C
   09ebDbFnBR0qZK82ME2A/U0xvX8i1x+cGQSlg+OXGF+Lv9Dj1CF2S4gj6
   4/1CGNTGrJRfrGZMulcBRQYZbV8mgsGGt4KzZH5d8hDh9MC5bMLxyHmxy
   KOheF+QGDb8Vu6mK/pNHUbFfkifEZEBxVviWRSkJwMzq68I9kRfWVz3G0
   jVcGQImScjfPdHYlNdCKSqMX8e8a1Xk29LMv1MCH2qPPpspUHlK/cexHs
   K31MWETIntDynvzHRlQtjFRrI92S/u9f4h8FvRRQB7P0pVMQMYnsECpar
   g==;
X-CSE-ConnectionGUID: laJML4pcSvaILWrJWYz7iw==
X-CSE-MsgGUID: m2CfqhWZSr+jrak7R4VNFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="45037014"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="45037014"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:09:30 -0700
X-CSE-ConnectionGUID: mpiQkj5eTx2aTasiehrzhA==
X-CSE-MsgGUID: gnNfEIRVSWm2rDGYkVl+rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="80586779"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.49])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:09:28 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 6/8] ASoC: SOF: ipc4-topology: Simplify code to deal with process modules without output
Date: Tue,  8 Oct 2024 14:09:34 +0300
Message-ID: <20241008110936.22534-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241008110936.22534-1-peter.ujfalusi@linux.intel.com>
References: <20241008110936.22534-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Process modules are allowed to have zero outputs, thus zero output formats.

In this case there is no need for complicated if expressions to handle such
cases, we can just use a single if for the number of output formats and
the rest can be simplified.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 70 +++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 31 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 45727c4d5b7e..c5f15e1bbacd 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2357,10 +2357,7 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc4_process *process = swidget->private;
 	struct sof_ipc4_available_audio_format *available_fmt = &process->available_fmt;
-	struct sof_ipc4_audio_format *in_fmt;
-	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits;
 	void *cfg = process->ipc_config_data;
-	int output_fmt_index;
 	int ret;
 
 	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &process->base_config,
@@ -2368,36 +2365,47 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 	if (ret < 0)
 		return ret;
 
-	in_fmt = &available_fmt->input_pin_fmts[ret].audio_fmt;
-	out_ref_rate = in_fmt->sampling_frequency;
-	out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
-	out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
+	/* Configure output audio format only if the module supports output */
+	if (available_fmt->num_output_formats) {
+		u32 out_ref_rate, out_ref_channels, out_ref_valid_bits, fmt_index;
+		struct sof_ipc4_audio_format *in_fmt;
+		struct sof_ipc4_pin_format *pin_fmt;
 
-	output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, &process->base_config,
-							  available_fmt, out_ref_rate,
-							  out_ref_channels, out_ref_valid_bits);
-	if (output_fmt_index < 0 && available_fmt->num_output_formats) {
-		dev_err(sdev->dev, "Failed to initialize output format for %s",
-			swidget->widget->name);
-		return output_fmt_index;
-	}
+		in_fmt = &available_fmt->input_pin_fmts[ret].audio_fmt;
 
-	/* copy Pin 0 output format */
-	if (available_fmt->num_output_formats &&
-	    output_fmt_index < available_fmt->num_output_formats &&
-	    !available_fmt->output_pin_fmts[output_fmt_index].pin_index) {
-		memcpy(&process->output_format,
-		       &available_fmt->output_pin_fmts[output_fmt_index].audio_fmt,
-		       sizeof(struct sof_ipc4_audio_format));
-
-		/* modify the pipeline params with the pin 0 output format */
-		ret = sof_ipc4_update_hw_params(sdev, pipeline_params,
-						&process->output_format,
-						BIT(SNDRV_PCM_HW_PARAM_FORMAT) |
-						BIT(SNDRV_PCM_HW_PARAM_CHANNELS) |
-						BIT(SNDRV_PCM_HW_PARAM_RATE));
-		if (ret)
-			return ret;
+		out_ref_rate = in_fmt->sampling_frequency;
+		out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
+		out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
+
+		fmt_index = sof_ipc4_init_output_audio_fmt(sdev,
+							   &process->base_config,
+							   available_fmt,
+							   out_ref_rate,
+							   out_ref_channels,
+							   out_ref_valid_bits);
+		if (fmt_index < 0) {
+			dev_err(sdev->dev,
+				"Failed to initialize output format for %s",
+				swidget->widget->name);
+			return fmt_index;
+		}
+
+		pin_fmt = &available_fmt->output_pin_fmts[fmt_index];
+
+		/* copy Pin output format for Pin 0 only */
+		if (pin_fmt->pin_index == 0) {
+			memcpy(&process->output_format, &pin_fmt->audio_fmt,
+			       sizeof(struct sof_ipc4_audio_format));
+
+			/* modify the pipeline params with the output format */
+			ret = sof_ipc4_update_hw_params(sdev, pipeline_params,
+							&process->output_format,
+							BIT(SNDRV_PCM_HW_PARAM_FORMAT) |
+							BIT(SNDRV_PCM_HW_PARAM_CHANNELS) |
+							BIT(SNDRV_PCM_HW_PARAM_RATE));
+			if (ret)
+				return ret;
+		}
 	}
 
 	/* update pipeline memory usage */
-- 
2.47.0

