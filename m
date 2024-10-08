Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AF61CDFA3
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 11:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728385773; cv=none; b=q1iX3/gjbm53Qw10RYBIrkm3iHv6dG0mMs5ZukTp0zHm/IHvb+Z8msti4cEXd/w3eUFieXIgcTVrfSRUezW3euwmJBZoNVVZTkIEhMq3axPcH4IMxTvwNaPF71op5rDIdIfpCCJxPQ+I/NFYY3nDhDjLSQQYzzeWM0hJblgu1+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728385773; c=relaxed/simple;
	bh=yP/FNnhfvxySCge+EGPS9WN82mzbbbIG+d6mNDtiIq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LGDOHZjbUUHwZFu6MnWI9K3U+IERqsnYO/dxXVnw9xA8N+rIPbvOHuqT+eKjUzLyWZL+x/Szbj1qL/wuz3nsFVraxtQH6PNnsnhDSylEBEuo+FbVyvkmYqEPt49TgqjfYS01XHX75XIx7npwus/SnB12O4XRPjbScIoVc7jiRSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U97Kk+ux; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U97Kk+ux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728385772; x=1759921772;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yP/FNnhfvxySCge+EGPS9WN82mzbbbIG+d6mNDtiIq0=;
  b=U97Kk+uxhb1zEtvPcWOntoy2NbpepClrEFXhrBVzROLnRjInpDk0Xk4Q
   Y+gDVC4DcCA8MTyrqYYxduBPFhDMxYSUc/w+ka7oZZOAzQ8mYxiiQqU+W
   5QX64WymPb661xlroe8OL9ezeqL866QSAgddgaj4iM2WFzWmycFZ0Ob2h
   QAhCcYYZcAxfUU6Raj1qWpajHJloNdfrvxIo71kksHAgVIbCTu7/TPqHg
   0rzmowj2jFy0A7MgNMoAGvpzFul1ddYsMeM83kqUK11tQso9pp6WsKa/a
   vexmj6/ktKqwSpS9slJiWfjMUzgqLX462K5cU3oG2j1d3qQaP9YlB6AWi
   A==;
X-CSE-ConnectionGUID: nmYlZk+8QrKVoKT24ziLeg==
X-CSE-MsgGUID: p1ntGIVpREWvVXSGCH2lvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="45037020"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="45037020"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:09:32 -0700
X-CSE-ConnectionGUID: xmBU1E/eSBGq6Q8nxVClZA==
X-CSE-MsgGUID: /yhLVBHrS9+/WnNDnOgBzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="80586785"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.49])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:09:30 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 7/8] ASoC: SOF: ipc4-topology: Concentrate prints inside of sof_ipc4_init_output_audio_fmt()
Date: Tue,  8 Oct 2024 14:09:35 +0300
Message-ID: <20241008110936.22534-8-peter.ujfalusi@linux.intel.com>
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

Similarly to sof_ipc4_init_input_audio_fmt(), move all output format
selection related prints (success or failure) inside of the
sof_ipc4_init_output_audio_fmt() function.

To do this, we need to pass swidget also, like with the input counterpart.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 87 ++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 43 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index c5f15e1bbacd..b00797f89595 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1205,6 +1205,7 @@ static bool sof_ipc4_is_single_format(struct snd_sof_dev *sdev,
 }
 
 static int sof_ipc4_init_output_audio_fmt(struct snd_sof_dev *sdev,
+					  struct snd_sof_widget *swidget,
 					  struct sof_ipc4_base_module_cfg *base_config,
 					  struct sof_ipc4_available_audio_format *available_fmt,
 					  u32 out_ref_rate, u32 out_ref_channels,
@@ -1213,18 +1214,19 @@ static int sof_ipc4_init_output_audio_fmt(struct snd_sof_dev *sdev,
 	struct sof_ipc4_pin_format *pin_fmts = available_fmt->output_pin_fmts;
 	u32 pin_fmts_size = available_fmt->num_output_formats;
 	bool single_format;
-	int i;
+	int i = 0;
 
-	if (!pin_fmts_size)
+	if (!pin_fmts_size) {
+		dev_err(sdev->dev, "no output formats for %s\n",
+			swidget->widget->name);
 		return -EINVAL;
+	}
 
 	single_format = sof_ipc4_is_single_format(sdev, pin_fmts, pin_fmts_size);
 
 	/* pick the first format if there's only one available or if all formats are the same */
-	if (single_format) {
-		base_config->obs = pin_fmts[0].buffer_size;
-		return 0;
-	}
+	if (single_format)
+		goto out_fmt;
 
 	/*
 	 * if there are multiple output formats, then choose the output format that matches
@@ -1240,13 +1242,29 @@ static int sof_ipc4_init_output_audio_fmt(struct snd_sof_dev *sdev,
 		_out_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
 
 		if (_out_rate == out_ref_rate && _out_channels == out_ref_channels &&
-		    _out_valid_bits == out_ref_valid_bits) {
-			base_config->obs = pin_fmts[i].buffer_size;
-			return i;
-		}
+		    _out_valid_bits == out_ref_valid_bits)
+			goto out_fmt;
 	}
 
+	dev_err(sdev->dev, "%s: Unsupported audio format: %uHz, %ubit, %u channels\n",
+		__func__, out_ref_rate, out_ref_valid_bits, out_ref_channels);
+
 	return -EINVAL;
+
+out_fmt:
+	base_config->obs = pin_fmts[i].buffer_size;
+
+	if (single_format)
+		dev_dbg(sdev->dev, "Output audio format for %s:\n",
+			swidget->widget->name);
+	else
+		dev_dbg(sdev->dev,
+			"Output audio format (format index: %d) for %s:\n", i,
+			swidget->widget->name);
+
+	sof_ipc4_dbg_audio_format(sdev->dev, &pin_fmts[i], 1);
+
+	return i;
 }
 
 static int sof_ipc4_get_valid_bits(struct snd_sof_dev *sdev, struct snd_pcm_hw_params *params)
@@ -1906,17 +1924,12 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(out_fmt->fmt_cfg);
 	}
 
-	dev_dbg(sdev->dev, "copier %s: reference output rate %d, channels %d valid_bits %d\n",
-		swidget->widget->name, out_ref_rate, out_ref_channels, out_ref_valid_bits);
-
-	output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, &copier_data->base_config,
+	output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, swidget,
+							  &copier_data->base_config,
 							  available_fmt, out_ref_rate,
 							  out_ref_channels, out_ref_valid_bits);
-	if (output_fmt_index < 0) {
-		dev_err(sdev->dev, "Failed to initialize output format for %s",
-			swidget->widget->name);
+	if (output_fmt_index < 0)
 		return output_fmt_index;
-	}
 
 	/*
 	 * Set the output format. Current topology defines pin 0 input and output formats in pairs.
@@ -1928,8 +1941,6 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	memcpy(&copier_data->out_format,
 	       &available_fmt->output_pin_fmts[output_fmt_index].audio_fmt,
 	       sizeof(struct sof_ipc4_audio_format));
-	dev_dbg(sdev->dev, "Output audio format for %s\n", swidget->widget->name);
-	sof_ipc4_dbg_audio_format(sdev->dev, &available_fmt->output_pin_fmts[output_fmt_index], 1);
 
 	switch (swidget->id) {
 	case snd_soc_dapm_dai_in:
@@ -2153,13 +2164,11 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
 	out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
 
-	ret = sof_ipc4_init_output_audio_fmt(sdev, &gain->data.base_config, available_fmt,
-					     out_ref_rate, out_ref_channels, out_ref_valid_bits);
-	if (ret < 0) {
-		dev_err(sdev->dev, "Failed to initialize output format for %s",
-			swidget->widget->name);
+	ret = sof_ipc4_init_output_audio_fmt(sdev, swidget, &gain->data.base_config,
+					     available_fmt, out_ref_rate,
+					     out_ref_channels, out_ref_valid_bits);
+	if (ret < 0)
 		return ret;
-	}
 
 	/* update pipeline memory usage */
 	sof_ipc4_update_resource_usage(sdev, swidget, &gain->data.base_config);
@@ -2190,13 +2199,11 @@ static int sof_ipc4_prepare_mixer_module(struct snd_sof_widget *swidget,
 	out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
 	out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
 
-	ret = sof_ipc4_init_output_audio_fmt(sdev, &mixer->base_config, available_fmt,
-					     out_ref_rate, out_ref_channels, out_ref_valid_bits);
-	if (ret < 0) {
-		dev_err(sdev->dev, "Failed to initialize output format for %s",
-			swidget->widget->name);
+	ret = sof_ipc4_init_output_audio_fmt(sdev, swidget, &mixer->base_config,
+					     available_fmt, out_ref_rate,
+					     out_ref_channels, out_ref_valid_bits);
+	if (ret < 0)
 		return ret;
-	}
 
 	/* update pipeline memory usage */
 	sof_ipc4_update_resource_usage(sdev, swidget, &mixer->base_config);
@@ -2248,14 +2255,12 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	 */
 	out_ref_rate = params_rate(fe_params);
 
-	output_format_index = sof_ipc4_init_output_audio_fmt(sdev, &src->data.base_config,
+	output_format_index = sof_ipc4_init_output_audio_fmt(sdev, swidget,
+							     &src->data.base_config,
 							     available_fmt, out_ref_rate,
 							     out_ref_channels, out_ref_valid_bits);
-	if (output_format_index < 0) {
-		dev_err(sdev->dev, "Failed to initialize output format for %s",
-			swidget->widget->name);
+	if (output_format_index < 0)
 		return output_format_index;
-	}
 
 	/* update pipeline memory usage */
 	sof_ipc4_update_resource_usage(sdev, swidget, &src->data.base_config);
@@ -2377,18 +2382,14 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 		out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
 		out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
 
-		fmt_index = sof_ipc4_init_output_audio_fmt(sdev,
+		fmt_index = sof_ipc4_init_output_audio_fmt(sdev, swidget,
 							   &process->base_config,
 							   available_fmt,
 							   out_ref_rate,
 							   out_ref_channels,
 							   out_ref_valid_bits);
-		if (fmt_index < 0) {
-			dev_err(sdev->dev,
-				"Failed to initialize output format for %s",
-				swidget->widget->name);
+		if (fmt_index < 0)
 			return fmt_index;
-		}
 
 		pin_fmt = &available_fmt->output_pin_fmts[fmt_index];
 
-- 
2.47.0

