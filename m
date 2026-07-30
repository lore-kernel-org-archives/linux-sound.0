Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39A53C1979
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 12:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785413819; cv=none; b=TamSXqzxAQGlbtFIs0Jhg1IL5u5H5kcs4xNilnPsnjRyJeQeaSuhKvX/N1g8H/HZCvwBqKCb3Th8RU+McNe31EGloTHiHBg9FqKVO9o9oXKHAQxJuNjDH13xBPIijyLsYWJGB4IA6Q2DrXMLM0kkbulAFOS5pr5/hhIbxT8Mr0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785413819; c=relaxed/simple;
	bh=qH/wWSzwVVJDN4Qp7RcnhyLby5ln2Zroz0TB1NzRaok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdbr6yGAUUGpBK1Fmx6iDYp8rpGBd8SeMVQCclJHG7vtLRqX14Em5dn/Rv9AZdgV96FO67nvVMWXysJR6ELx0p5oos/4R0gpGzHcEpJ39HAGDKSy7RWcj0Vw9oQTbB9MzIDWmunjR4ZZ3JfQD5JOW8w7ciBUEZGtgDPAX7RNazQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bxGNKoRM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bxGNKoRM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785413817; x=1816949817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qH/wWSzwVVJDN4Qp7RcnhyLby5ln2Zroz0TB1NzRaok=;
  b=bxGNKoRMykTpGAIp+euknOXua59yo0R2ERHD5L/Soz0N+24zox4jaBj8
   FFyWOVyo+R3jqs26+ajOTMeNXWRKUPTwRVdM3sRcsGuINg/sAi34Yq6Nu
   NB7y1gZLrvAIa04RuU9IDTKHnrSykxo1GkDq8I31dtEWI9Lwfd+F+Ly49
   d4XLiQJav/hjzOm+xc/R8Ux99TLU3NiByf8fhdN9LuN9KazgLuATaz+S7
   /p+RrwxntBtnoOPUQmqNx78CooxdTznU6bwkrMjf+omOlp/203aQeUhAp
   YBufpiJNE9DHNd9uMG4xdaK6+tvzAvGY98lpKAqLgfb5xO6p83JfQF1qa
   g==;
X-CSE-ConnectionGUID: P/sz0JZ1SVe1V/qWl41EDw==
X-CSE-MsgGUID: c8pbjMUxTw6i2jdN3UImEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97187661"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="97187661"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:16:57 -0700
X-CSE-ConnectionGUID: b36JtX0/QAGbCpr5csKBTA==
X-CSE-MsgGUID: 2uOIKQeQQH+xeZJS+VLO6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="259711254"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:16:55 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 1/3] ASoC: SOF: ipc4-topology: Store the params change between input/output of a module
Date: Thu, 30 Jul 2026 15:17:27 +0300
Message-ID: <20260730121729.18673-2-peter.ujfalusi@linux.intel.com>
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

Based on the input and output formats we can evaluate what param might be
changed by the module instance.
If there is a difference between the input rate/channels/format and the
output  rate/channels/format it means that the module can change one or
multiple of the params.

Store this information during init for later use.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/ipc4-topology.c | 41 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-topology.h |  3 +++
 2 files changed, 44 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 8ac7dde32f77..df002e69d2a7 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -406,6 +406,39 @@ sof_ipc4_get_input_pin_audio_fmt(struct snd_sof_widget *swidget, int pin_index)
 	return NULL;
 }
 
+static void
+sof_ipc4_evaluate_params_change(struct sof_ipc4_available_audio_format *available_fmt)
+{
+	struct sof_ipc4_audio_format *fmt;
+	u32 in_rate, in_channels, in_valid_bits;
+	u32 out_rate, out_channels, out_valid_bits;
+	u32 changed_params = 0;
+	int i, j;
+
+	for (i = 0; i < available_fmt->num_input_formats; i++) {
+		fmt = &available_fmt->input_pin_fmts[i].audio_fmt;
+		in_rate = fmt->sampling_frequency;
+		in_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg);
+		in_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
+
+		for (j = 0; j < available_fmt->num_output_formats; j++) {
+			fmt = &available_fmt->output_pin_fmts[j].audio_fmt;
+			out_rate = fmt->sampling_frequency;
+			out_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg);
+			out_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
+
+			if (in_rate != out_rate)
+				changed_params |= BIT(SNDRV_PCM_HW_PARAM_RATE);
+			if (in_channels != out_channels)
+				changed_params |= BIT(SNDRV_PCM_HW_PARAM_CHANNELS);
+			if (in_valid_bits != out_valid_bits)
+				changed_params |= BIT(SNDRV_PCM_HW_PARAM_FORMAT);
+		}
+	}
+
+	available_fmt->changed_params = changed_params;
+}
+
 /**
  * sof_ipc4_get_audio_fmt - get available audio formats from swidget->tuples
  * @scomp: pointer to pointer to SOC component
@@ -497,6 +530,8 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 					  available_fmt->num_output_formats);
 	}
 
+	sof_ipc4_evaluate_params_change(available_fmt);
+
 	return 0;
 
 err_out:
@@ -661,6 +696,9 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 	if (ret)
 		goto free_copier;
 
+	/* Copier can only change format */
+	available_fmt->changed_params &= BIT(SNDRV_PCM_HW_PARAM_FORMAT);
+
 	/*
 	 * This callback is used by host copier and module-to-module copier,
 	 * and only host copier needs to set gtw_cfg.
@@ -789,6 +827,9 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 	if (ret)
 		goto free_copier;
 
+	/* Copier can only change format */
+	available_fmt->changed_params &= BIT(SNDRV_PCM_HW_PARAM_FORMAT);
+
 	ret = sof_update_ipc_object(scomp, &node_type,
 				    SOF_COPIER_TOKENS, swidget->tuples,
 				    swidget->num_tuples, sizeof(node_type), 1);
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 54bf0236a127..c9fe9f2e4083 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -197,12 +197,15 @@ struct sof_ipc4_pin_format {
  * @input_pin_fmts: Available input pin formats
  * @num_input_formats: Number of input pin formats
  * @num_output_formats: Number of output pin formats
+ * @changed_params: Mask of changed params by the module instance between it's
+ *		    input and output formts (rate, channels, depth)
  */
 struct sof_ipc4_available_audio_format {
 	struct sof_ipc4_pin_format *output_pin_fmts;
 	struct sof_ipc4_pin_format *input_pin_fmts;
 	u32 num_input_formats;
 	u32 num_output_formats;
+	u32 changed_params;
 };
 
 /**
-- 
2.55.0

