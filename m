Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7B02248BA
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 10:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750330055; cv=none; b=NThPE7uyBHJ1tkQpOgYRfkdAhDkrrGoKyKtyX6oMaXYk3x34c5IwaP5nz/Ch6anAnLntNbKAjZQmtMNy1+andBOaDyYf36JpqafrYrsG6kq+GFU7+i0Irvaku0FltHnOfxQ+BKR08vIVKhfHw7yqpvviEqJNpz4aorpAxj233DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750330055; c=relaxed/simple;
	bh=jFVxu+eoKUx0KIbOYAKmMOrHr4Cs2IFioFMgre+n0HM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fLKJZZJKfbZ/E/8Ns2CMfVPSq2RZB7y0xCAdTGMGh241KOI2aARVzvln8DTl9I2ZN6gETWdwy6U6SDqM/LXa3LFtA0LBrHTK0gTrkuPzhHzTLiIzUjQI0WxZ7urUuEHFFi3S6AsB6j7gouwJUV1TJvIu1m59d9u675YpjHV2Qhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KplMT5TA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KplMT5TA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750330054; x=1781866054;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jFVxu+eoKUx0KIbOYAKmMOrHr4Cs2IFioFMgre+n0HM=;
  b=KplMT5TApoIidhBD2pCmRvf/dsnaReCD3et+smpA8gmI+UgYecUw8the
   UeQeUO8G3nEeXvvjJbrgcPgSq9RDw5JAyK0dnakWP0Sp5wJsXp/qenmUV
   KelMoxgb23fzozCN+ETpBe/A0i8bjc3n9Fd//imdIzH4lTO+Bk+4ybLQf
   PI3eLe+3AiB7mxB0KwcOY71D4SJlVRmZykBbGHZ2e1zyoNvGcAi+whVlY
   L1Yy6WBnlGe5sQR1SQF8BJqY52l2/MaHHFPNKC49Q/9cpEnrspLAQK0U2
   XahbS/jqd2mXfnKLqMCiRX6BfNn6TfwQlitl8PYxio6NIcI5P1cd5AJOJ
   A==;
X-CSE-ConnectionGUID: dKqUkII5SFyPjULsHexFSg==
X-CSE-MsgGUID: XSSme5hJQW6ZVR++++gqNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52280572"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52280572"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:47:34 -0700
X-CSE-ConnectionGUID: N4LpE50cSFSIqZ+MEBcKPw==
X-CSE-MsgGUID: F1rF0piNS2+CkNpitRmDDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150051523"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.182])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:47:31 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4-topology: Add load of ASRC component
Date: Thu, 19 Jun 2025 13:47:35 +0300
Message-ID: <20250619104735.26161-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>

This patch adds to IPC4 topology parsing the support for the
asynchronous sample rate converter (ASRC) SOF component. It
is applied for the DAPM widget type SND_SOC_TPLG_DAPM_ASRC.

The parsed SOF tokens for ASRC are SOF_TKN_ASRC_RATE_OUT and
SOF_TKN_ASRC_OPERATION_MODE.

Signed-off-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 88 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-topology.h | 24 ++++++++++
 2 files changed, 112 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 540ba140e155..089f2c9fe693 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -145,6 +145,14 @@ static const struct sof_topology_token src_tokens[] = {
 		offsetof(struct sof_ipc4_src_data, sink_rate)},
 };
 
+/* ASRC */
+static const struct sof_topology_token asrc_tokens[] = {
+	{SOF_TKN_ASRC_RATE_OUT, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc4_asrc_data, out_freq)},
+	{SOF_TKN_ASRC_OPERATION_MODE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc4_asrc_data, asrc_mode)},
+};
+
 static const struct sof_token_info ipc4_token_list[SOF_TOKEN_COUNT] = {
 	[SOF_DAI_TOKENS] = {"DAI tokens", dai_tokens, ARRAY_SIZE(dai_tokens)},
 	[SOF_PIPELINE_TOKENS] = {"Pipeline tokens", pipeline_tokens, ARRAY_SIZE(pipeline_tokens)},
@@ -166,6 +174,7 @@ static const struct sof_token_info ipc4_token_list[SOF_TOKEN_COUNT] = {
 		ipc4_audio_fmt_num_tokens, ARRAY_SIZE(ipc4_audio_fmt_num_tokens)},
 	[SOF_GAIN_TOKENS] = {"Gain tokens", gain_tokens, ARRAY_SIZE(gain_tokens)},
 	[SOF_SRC_TOKENS] = {"SRC tokens", src_tokens, ARRAY_SIZE(src_tokens)},
+	[SOF_ASRC_TOKENS] = {"ASRC tokens", asrc_tokens, ARRAY_SIZE(asrc_tokens)},
 };
 
 struct snd_sof_widget *sof_ipc4_find_swidget_by_ids(struct snd_sof_dev *sdev,
@@ -1045,6 +1054,50 @@ static int sof_ipc4_widget_setup_comp_src(struct snd_sof_widget *swidget)
 	return ret;
 }
 
+static int sof_ipc4_widget_setup_comp_asrc(struct snd_sof_widget *swidget)
+{
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_pipeline *spipe = swidget->spipe;
+	struct sof_ipc4_asrc *asrc;
+	int ret;
+
+	dev_dbg(scomp->dev, "Updating IPC structure for %s\n", swidget->widget->name);
+
+	asrc = kzalloc(sizeof(*asrc), GFP_KERNEL);
+	if (!asrc)
+		return -ENOMEM;
+
+	swidget->private = asrc;
+
+	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &asrc->available_fmt,
+				     &asrc->data.base_config);
+	if (ret)
+		goto err;
+
+	ret = sof_update_ipc_object(scomp, &asrc->data, SOF_ASRC_TOKENS, swidget->tuples,
+				    swidget->num_tuples, sizeof(*asrc), 1);
+	if (ret) {
+		dev_err(scomp->dev, "Parsing ASRC tokens failed\n");
+		goto err;
+	}
+
+	spipe->core_mask |= BIT(swidget->core);
+
+	dev_dbg(scomp->dev, "ASRC sink rate %d, mode 0x%08x\n",
+		asrc->data.out_freq, asrc->data.asrc_mode);
+
+	ret = sof_ipc4_widget_setup_msg(swidget, &asrc->msg);
+	if (ret)
+		goto err;
+
+	return 0;
+err:
+	sof_ipc4_free_audio_fmt(&asrc->available_fmt);
+	kfree(asrc);
+	swidget->private = NULL;
+	return ret;
+}
+
 static void sof_ipc4_widget_free_comp_src(struct snd_sof_widget *swidget)
 {
 	struct sof_ipc4_src *src = swidget->private;
@@ -1057,6 +1110,18 @@ static void sof_ipc4_widget_free_comp_src(struct snd_sof_widget *swidget)
 	swidget->private = NULL;
 }
 
+static void sof_ipc4_widget_free_comp_asrc(struct snd_sof_widget *swidget)
+{
+	struct sof_ipc4_asrc *asrc = swidget->private;
+
+	if (!asrc)
+		return;
+
+	sof_ipc4_free_audio_fmt(&asrc->available_fmt);
+	kfree(swidget->private);
+	swidget->private = NULL;
+}
+
 static void sof_ipc4_widget_free_comp_mixer(struct snd_sof_widget *swidget)
 {
 	struct sof_ipc4_mixer *mixer = swidget->private;
@@ -2817,6 +2882,16 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 		msg = &src->msg;
 		break;
 	}
+	case snd_soc_dapm_asrc:
+	{
+		struct sof_ipc4_asrc *asrc = swidget->private;
+
+		ipc_size = sizeof(asrc->data);
+		ipc_data = &asrc->data;
+
+		msg = &asrc->msg;
+		break;
+	}
 	case snd_soc_dapm_effect:
 	{
 		struct sof_ipc4_process *process = swidget->private;
@@ -3503,6 +3578,15 @@ static enum sof_tokens src_token_list[] = {
 	SOF_COMP_EXT_TOKENS,
 };
 
+static enum sof_tokens asrc_token_list[] = {
+	SOF_COMP_TOKENS,
+	SOF_ASRC_TOKENS,
+	SOF_AUDIO_FMT_NUM_TOKENS,
+	SOF_IN_AUDIO_FORMAT_TOKENS,
+	SOF_OUT_AUDIO_FORMAT_TOKENS,
+	SOF_COMP_EXT_TOKENS,
+};
+
 static enum sof_tokens process_token_list[] = {
 	SOF_COMP_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
@@ -3548,6 +3632,10 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TY
 				src_token_list, ARRAY_SIZE(src_token_list),
 				NULL, sof_ipc4_prepare_src_module,
 				NULL},
+	[snd_soc_dapm_asrc] = {sof_ipc4_widget_setup_comp_asrc, sof_ipc4_widget_free_comp_asrc,
+				asrc_token_list, ARRAY_SIZE(asrc_token_list),
+				NULL, sof_ipc4_prepare_src_module, /* Common prepare with SRC */
+				NULL},
 	[snd_soc_dapm_effect] = {sof_ipc4_widget_setup_comp_process,
 				sof_ipc4_widget_free_comp_process,
 				process_token_list, ARRAY_SIZE(process_token_list),
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index f4dc499c0ffe..9e98cac19532 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -435,6 +435,30 @@ struct sof_ipc4_src {
 	struct sof_ipc4_msg msg;
 };
 
+/*
+ * struct sof_ipc4_asrc_data - IPC data for ASRC
+ * @base_config: IPC base config data
+ * @out_freq: Output rate for sink module, passed as such from topology to FW.
+ * @asrc_mode: Control for ASRC features with bit-fields, passed as such from topolgy to FW.
+ */
+struct sof_ipc4_asrc_data {
+	struct sof_ipc4_base_module_cfg base_config;
+	uint32_t out_freq;
+	uint32_t asrc_mode;
+} __packed __aligned(4);
+
+/**
+ * struct sof_ipc4_asrc - ASRC config data
+ * @data: IPC base config data
+ * @available_fmt: Available audio format
+ * @msg: IPC4 message struct containing header and data info
+ */
+struct sof_ipc4_asrc {
+	struct sof_ipc4_asrc_data data;
+	struct sof_ipc4_available_audio_format available_fmt;
+	struct sof_ipc4_msg msg;
+};
+
 /**
  * struct sof_ipc4_base_module_cfg_ext - base module config extension containing the pin format
  * information for the module. Both @num_input_pin_fmts and @num_output_pin_fmts cannot be 0 for a
-- 
2.49.0

