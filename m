Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3580B1CDFA3
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 11:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728385776; cv=none; b=i4w+WoV/pbvqsiJznzX+Ux4A5LWXdXjkIjzUiEm7g0Alx9f9Hl6kKxhkNJOBmsUKXvb0qH5f4SNyLtkakYyz9LolRS5/tQ4542+51qreqPggLqGHuL28AquAlVTuSK+O5bdOyaeGtImGbQLLQghbDOkuLw7Jp04Q4K+YNAM3ptk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728385776; c=relaxed/simple;
	bh=ug1S41znjoUf/OvE63S+atNtBFdtD7bJMhGDHdiCvKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iMdcpHdX2/b3sY0IUuw43WU9s3P04N9EunwGpYtePTCa0SHJBicnQ5DZCHwKVtcP2wmpja64sna3t9d5h9rXKTa6M7fl0DTGp0uli6woOS8zMGOqaw2JZs9n0j3Cgj2viRX3iJUM7U3qT6KUQ7Bq1/F9zLEpakDMIqhKf7arkPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1VCWKdw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1VCWKdw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728385774; x=1759921774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ug1S41znjoUf/OvE63S+atNtBFdtD7bJMhGDHdiCvKA=;
  b=f1VCWKdwBIUqHy44AK/BJn3K+TY8155genDZgqcSSGFALIZbXDamkd03
   8V5dd9VrUqSpF20O7G9/0JWQlzisUVlmjxo/wfbZMUf5aNk6O4u1s+0we
   rzuumtOsbddF5l9SNs+75A4SSVdU0X3kQEMmzYfaJKJNuCELLWYaB9nKK
   mxrhw4GYj7qllVYbuwl/vc8OfwG//xPwtmKvH7nSuyepTHVBLGIEwxbaF
   PE5f7yG7zGELRTjbp9ytWTqWU36U6AnFWlWI2CK8euMFZcoWOydmfL22E
   99ygCRfFcErP71MTBj0/86q3Rb5XIwg7gBGp7YQwKk6SFL7ydG1eZyKpP
   Q==;
X-CSE-ConnectionGUID: KNAC2SR/R6qMfNBmbPdziQ==
X-CSE-MsgGUID: viXwBW82SFeuv8N2Wpdplw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="45037031"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="45037031"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:09:34 -0700
X-CSE-ConnectionGUID: TH8+2P4URySOictZvqGuEw==
X-CSE-MsgGUID: 1geL8Lf8Q8WDMUVPRP2Ntw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="80586793"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.49])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:09:32 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 8/8] ASoC: SOF: ipc4-topology: Add helper function to print the module's in/out audio format
Date: Tue,  8 Oct 2024 14:09:36 +0300
Message-ID: <20241008110936.22534-9-peter.ujfalusi@linux.intel.com>
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

Introduce a helper function to print out the audio format(s) used by a
module in a consistent way.

The printed text depends on the module format configuration, taking into
account if they have both input and output support, the format is changed
by the module and the number of formats supported on input/output.

For example, if a module does not change format, there is no point of
printing both in and out format, it is adequate to just state the format
the module is using.

While the function to generate the print is fairly complex (but not too
much), it will create a cleaner experience on the reader side by handling
the filtering of the information and present it in a way that it - I hope -
makes the developer's live a bit more easier when tracking format changes.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 262 ++++++++++++++++++++++++----------
 1 file changed, 186 insertions(+), 76 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index b00797f89595..56427d6e3679 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -203,6 +203,101 @@ static void sof_ipc4_dbg_audio_format(struct device *dev, struct sof_ipc4_pin_fo
 	}
 }
 
+static void
+sof_ipc4_dbg_module_audio_format(struct device *dev,
+				 struct snd_sof_widget *swidget,
+				 struct sof_ipc4_available_audio_format *available_fmt,
+				 int in_fmt_index, int out_fmt_index)
+{
+	struct sof_ipc4_audio_format *in_fmt, *out_fmt;
+	u32 out_rate, out_channels, out_valid_bits;
+	u32 in_rate, in_channels, in_valid_bits;
+	struct sof_ipc4_pin_format *pin_fmt;
+
+	if (!available_fmt->num_input_formats &&
+	    !available_fmt->num_output_formats)
+		return;
+
+	/* Only input or output is supported by the module */
+	if (!available_fmt->num_input_formats) {
+		if (available_fmt->num_output_formats == 1)
+			dev_dbg(dev, "Output audio format for %s:\n",
+				swidget->widget->name);
+		else
+			dev_dbg(dev,
+				"Output audio format (format index: %d) for %s:\n",
+				out_fmt_index, swidget->widget->name);
+
+		pin_fmt = &available_fmt->output_pin_fmts[out_fmt_index];
+		sof_ipc4_dbg_audio_format(dev, pin_fmt, 1);
+
+		return;
+	} else if (!available_fmt->num_output_formats) {
+		if (available_fmt->num_input_formats == 1)
+			dev_dbg(dev, "Input audio format for %s:\n",
+				swidget->widget->name);
+		else
+			dev_dbg(dev,
+				"Input audio format (format index: %d) for %s:\n",
+				out_fmt_index, swidget->widget->name);
+
+		pin_fmt = &available_fmt->input_pin_fmts[in_fmt_index];
+		sof_ipc4_dbg_audio_format(dev, pin_fmt, 1);
+
+		return;
+	}
+
+	in_fmt = &available_fmt->input_pin_fmts[in_fmt_index].audio_fmt;
+	out_fmt = &available_fmt->output_pin_fmts[out_fmt_index].audio_fmt;
+
+	in_rate = in_fmt->sampling_frequency;
+	in_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
+	in_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
+
+	out_rate = out_fmt->sampling_frequency;
+	out_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(out_fmt->fmt_cfg);
+	out_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(out_fmt->fmt_cfg);
+
+	if (!(in_valid_bits != out_valid_bits || in_rate != out_rate ||
+	      in_channels != out_channels)) {
+		/* There is no change in format */
+		if (available_fmt->num_input_formats == 1 &&
+		    available_fmt->num_output_formats == 1)
+			dev_dbg(dev, "Audio format for %s:\n",
+				swidget->widget->name);
+		else
+			dev_dbg(dev,
+				"Audio format (in/out format index: %d/%d) for %s:\n",
+				in_fmt_index, out_fmt_index, swidget->widget->name);
+
+		pin_fmt = &available_fmt->input_pin_fmts[in_fmt_index];
+		sof_ipc4_dbg_audio_format(dev, pin_fmt, 1);
+
+		return;
+	}
+
+	/* The format is changed by the module */
+	if (available_fmt->num_input_formats == 1)
+		dev_dbg(dev, "Input audio format for %s:\n",
+			swidget->widget->name);
+	else
+		dev_dbg(dev, "Input audio format (format index: %d) for %s:\n",
+			in_fmt_index, swidget->widget->name);
+
+	pin_fmt = &available_fmt->input_pin_fmts[in_fmt_index];
+	sof_ipc4_dbg_audio_format(dev, pin_fmt, 1);
+
+	if (available_fmt->num_output_formats == 1)
+		dev_dbg(dev, "Output audio format for %s:\n",
+			swidget->widget->name);
+	else
+		dev_dbg(dev, "Output audio format (format index: %d) for %s:\n",
+			out_fmt_index, swidget->widget->name);
+
+	pin_fmt = &available_fmt->output_pin_fmts[out_fmt_index];
+	sof_ipc4_dbg_audio_format(dev, pin_fmt, 1);
+}
+
 static const struct sof_ipc4_audio_format *
 sof_ipc4_get_input_pin_audio_fmt(struct snd_sof_widget *swidget, int pin_index)
 {
@@ -1254,16 +1349,6 @@ static int sof_ipc4_init_output_audio_fmt(struct snd_sof_dev *sdev,
 out_fmt:
 	base_config->obs = pin_fmts[i].buffer_size;
 
-	if (single_format)
-		dev_dbg(sdev->dev, "Output audio format for %s:\n",
-			swidget->widget->name);
-	else
-		dev_dbg(sdev->dev,
-			"Output audio format (format index: %d) for %s:\n", i,
-			swidget->widget->name);
-
-	sof_ipc4_dbg_audio_format(sdev->dev, &pin_fmts[i], 1);
-
 	return i;
 }
 
@@ -1342,16 +1427,6 @@ static int sof_ipc4_init_input_audio_fmt(struct snd_sof_dev *sdev,
 	/* set base_cfg ibs/obs */
 	base_config->ibs = pin_fmts[i].buffer_size;
 
-	if (single_format)
-		dev_dbg(sdev->dev, "Input audio format for %s:\n",
-			swidget->widget->name);
-	else
-		dev_dbg(sdev->dev,
-			"Input audio format (format index: %d) for %s:\n", i,
-			swidget->widget->name);
-
-	sof_ipc4_dbg_audio_format(sdev->dev, &pin_fmts[i], 1);
-
 	return i;
 }
 
@@ -1726,6 +1801,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	struct snd_soc_component *scomp = swidget->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc4_copier_data *copier_data;
+	int input_fmt_index, output_fmt_index;
 	struct snd_pcm_hw_params ref_params;
 	struct sof_ipc4_copier *ipc4_copier;
 	struct snd_sof_dai *dai;
@@ -1737,7 +1813,6 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	int ipc_size, ret, out_ref_valid_bits;
 	u32 out_ref_rate, out_ref_channels;
 	u32 deep_buffer_dma_ms = 0;
-	int output_fmt_index;
 	bool single_output_bitdepth;
 	int i;
 
@@ -1869,10 +1944,11 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	}
 
 	/* set input and output audio formats */
-	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &copier_data->base_config,
-					    &ref_params, available_fmt);
-	if (ret < 0)
-		return ret;
+	input_fmt_index = sof_ipc4_init_input_audio_fmt(sdev, swidget,
+							&copier_data->base_config,
+							&ref_params, available_fmt);
+	if (input_fmt_index < 0)
+		return input_fmt_index;
 
 	/* set the reference params for output format selection */
 	single_output_bitdepth = sof_ipc4_copier_is_single_bitdepth(sdev,
@@ -1885,7 +1961,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	{
 		struct sof_ipc4_audio_format *in_fmt;
 
-		in_fmt = &available_fmt->input_pin_fmts[ret].audio_fmt;
+		in_fmt = &available_fmt->input_pin_fmts[input_fmt_index].audio_fmt;
 		out_ref_rate = in_fmt->sampling_frequency;
 		out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
 
@@ -2117,6 +2193,9 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 
 	*ipc_config_size = ipc_size;
 
+	sof_ipc4_dbg_module_audio_format(sdev->dev, swidget, available_fmt,
+					 input_fmt_index, output_fmt_index);
+
 	/* update pipeline memory usage */
 	sof_ipc4_update_resource_usage(sdev, swidget, &copier_data->base_config);
 
@@ -2152,23 +2231,31 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	struct sof_ipc4_available_audio_format *available_fmt = &gain->available_fmt;
 	struct sof_ipc4_audio_format *in_fmt;
 	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits;
-	int ret;
+	int input_fmt_index, output_fmt_index;
 
-	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &gain->data.base_config,
-					    pipeline_params, available_fmt);
-	if (ret < 0)
-		return ret;
+	input_fmt_index = sof_ipc4_init_input_audio_fmt(sdev, swidget,
+							&gain->data.base_config,
+							pipeline_params,
+							available_fmt);
+	if (input_fmt_index < 0)
+		return input_fmt_index;
 
-	in_fmt = &available_fmt->input_pin_fmts[ret].audio_fmt;
+	in_fmt = &available_fmt->input_pin_fmts[input_fmt_index].audio_fmt;
 	out_ref_rate = in_fmt->sampling_frequency;
 	out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
 	out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
 
-	ret = sof_ipc4_init_output_audio_fmt(sdev, swidget, &gain->data.base_config,
-					     available_fmt, out_ref_rate,
-					     out_ref_channels, out_ref_valid_bits);
-	if (ret < 0)
-		return ret;
+	output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, swidget,
+							  &gain->data.base_config,
+							  available_fmt,
+							  out_ref_rate,
+							  out_ref_channels,
+							  out_ref_valid_bits);
+	if (output_fmt_index < 0)
+		return output_fmt_index;
+
+	sof_ipc4_dbg_module_audio_format(sdev->dev, swidget, available_fmt,
+					 input_fmt_index, output_fmt_index);
 
 	/* update pipeline memory usage */
 	sof_ipc4_update_resource_usage(sdev, swidget, &gain->data.base_config);
@@ -2187,23 +2274,31 @@ static int sof_ipc4_prepare_mixer_module(struct snd_sof_widget *swidget,
 	struct sof_ipc4_available_audio_format *available_fmt = &mixer->available_fmt;
 	struct sof_ipc4_audio_format *in_fmt;
 	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits;
-	int ret;
+	int input_fmt_index, output_fmt_index;
 
-	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &mixer->base_config,
-					    pipeline_params, available_fmt);
-	if (ret < 0)
-		return ret;
+	input_fmt_index = sof_ipc4_init_input_audio_fmt(sdev, swidget,
+							&mixer->base_config,
+							pipeline_params,
+							available_fmt);
+	if (input_fmt_index < 0)
+		return input_fmt_index;
 
-	in_fmt = &available_fmt->input_pin_fmts[ret].audio_fmt;
+	in_fmt = &available_fmt->input_pin_fmts[input_fmt_index].audio_fmt;
 	out_ref_rate = in_fmt->sampling_frequency;
 	out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
 	out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
 
-	ret = sof_ipc4_init_output_audio_fmt(sdev, swidget, &mixer->base_config,
-					     available_fmt, out_ref_rate,
-					     out_ref_channels, out_ref_valid_bits);
-	if (ret < 0)
-		return ret;
+	output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, swidget,
+							  &mixer->base_config,
+							  available_fmt,
+							  out_ref_rate,
+							  out_ref_channels,
+							  out_ref_valid_bits);
+	if (output_fmt_index < 0)
+		return output_fmt_index;
+
+	sof_ipc4_dbg_module_audio_format(sdev->dev, swidget, available_fmt,
+					 input_fmt_index, output_fmt_index);
 
 	/* update pipeline memory usage */
 	sof_ipc4_update_resource_usage(sdev, swidget, &mixer->base_config);
@@ -2223,12 +2318,14 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	struct sof_ipc4_audio_format *out_audio_fmt;
 	struct sof_ipc4_audio_format *in_audio_fmt;
 	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits;
-	int output_format_index, input_format_index;
+	int output_fmt_index, input_fmt_index;
 
-	input_format_index = sof_ipc4_init_input_audio_fmt(sdev, swidget, &src->data.base_config,
-							   pipeline_params, available_fmt);
-	if (input_format_index < 0)
-		return input_format_index;
+	input_fmt_index = sof_ipc4_init_input_audio_fmt(sdev, swidget,
+							&src->data.base_config,
+							pipeline_params,
+							available_fmt);
+	if (input_fmt_index < 0)
+		return input_fmt_index;
 
 	/*
 	 * For playback, the SRC sink rate will be configured based on the requested output
@@ -2244,7 +2341,7 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	 * SRC does not perform format conversion, so the output channels and valid bit depth must
 	 * be the same as that of the input.
 	 */
-	in_audio_fmt = &available_fmt->input_pin_fmts[input_format_index].audio_fmt;
+	in_audio_fmt = &available_fmt->input_pin_fmts[input_fmt_index].audio_fmt;
 	out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_audio_fmt->fmt_cfg);
 	out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_audio_fmt->fmt_cfg);
 
@@ -2255,17 +2352,22 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	 */
 	out_ref_rate = params_rate(fe_params);
 
-	output_format_index = sof_ipc4_init_output_audio_fmt(sdev, swidget,
-							     &src->data.base_config,
-							     available_fmt, out_ref_rate,
-							     out_ref_channels, out_ref_valid_bits);
-	if (output_format_index < 0)
-		return output_format_index;
+	output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, swidget,
+							  &src->data.base_config,
+							  available_fmt,
+							  out_ref_rate,
+							  out_ref_channels,
+							  out_ref_valid_bits);
+	if (output_fmt_index < 0)
+		return output_fmt_index;
+
+	sof_ipc4_dbg_module_audio_format(sdev->dev, swidget, available_fmt,
+					 input_fmt_index, output_fmt_index);
 
 	/* update pipeline memory usage */
 	sof_ipc4_update_resource_usage(sdev, swidget, &src->data.base_config);
 
-	out_audio_fmt = &available_fmt->output_pin_fmts[output_format_index].audio_fmt;
+	out_audio_fmt = &available_fmt->output_pin_fmts[output_fmt_index].audio_fmt;
 	src->data.sink_rate = out_audio_fmt->sampling_frequency;
 
 	/* update pipeline_params for sink widgets */
@@ -2363,35 +2465,40 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 	struct sof_ipc4_process *process = swidget->private;
 	struct sof_ipc4_available_audio_format *available_fmt = &process->available_fmt;
 	void *cfg = process->ipc_config_data;
+	int output_fmt_index = 0;
+	int input_fmt_index = 0;
 	int ret;
 
-	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &process->base_config,
-					    pipeline_params, available_fmt);
-	if (ret < 0)
-		return ret;
+	input_fmt_index = sof_ipc4_init_input_audio_fmt(sdev, swidget,
+							&process->base_config,
+							pipeline_params,
+							available_fmt);
+	if (input_fmt_index < 0)
+		return input_fmt_index;
 
 	/* Configure output audio format only if the module supports output */
 	if (available_fmt->num_output_formats) {
-		u32 out_ref_rate, out_ref_channels, out_ref_valid_bits, fmt_index;
 		struct sof_ipc4_audio_format *in_fmt;
 		struct sof_ipc4_pin_format *pin_fmt;
+		u32 out_ref_rate, out_ref_channels;
+		int out_ref_valid_bits;
 
-		in_fmt = &available_fmt->input_pin_fmts[ret].audio_fmt;
+		in_fmt = &available_fmt->input_pin_fmts[input_fmt_index].audio_fmt;
 
 		out_ref_rate = in_fmt->sampling_frequency;
 		out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
 		out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
 
-		fmt_index = sof_ipc4_init_output_audio_fmt(sdev, swidget,
-							   &process->base_config,
-							   available_fmt,
-							   out_ref_rate,
-							   out_ref_channels,
-							   out_ref_valid_bits);
-		if (fmt_index < 0)
-			return fmt_index;
+		output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, swidget,
+								  &process->base_config,
+								  available_fmt,
+								  out_ref_rate,
+								  out_ref_channels,
+								  out_ref_valid_bits);
+		if (output_fmt_index < 0)
+			return output_fmt_index;
 
-		pin_fmt = &available_fmt->output_pin_fmts[fmt_index];
+		pin_fmt = &available_fmt->output_pin_fmts[output_fmt_index];
 
 		/* copy Pin output format for Pin 0 only */
 		if (pin_fmt->pin_index == 0) {
@@ -2409,6 +2516,9 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 		}
 	}
 
+	sof_ipc4_dbg_module_audio_format(sdev->dev, swidget, available_fmt,
+					 input_fmt_index, output_fmt_index);
+
 	/* update pipeline memory usage */
 	sof_ipc4_update_resource_usage(sdev, swidget, &process->base_config);
 
-- 
2.47.0

