Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KcYnyA+H"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF7A685
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 05:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701263620; x=1732799620;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dwq0e7l0x80Z1wmsmGQRwkvzL5jXKW5PrzdytkqWisY=;
  b=KcYnyA+H7JvUWIYUDnhShhAV+Y85i6w0lKm3whu/HTw2FmOye7LLhtY6
   mqi+1Uzk90ekDFNEIRfoUd8gkbMMcp3z/PT/IfhwyETSHdOKp9RGSeRmR
   DyhBLye3CfVCNXk9IsNJzbWakWx4CQPnvaDga/hML99cvJNrhHVOj8FNh
   mbDJUuxXr/fEhtyj02UwL2zPG75WJwACuwnWsSC9KXCslqo8AjBoPg3Fz
   ZX9am+uaUovYsViHiwGDt5bFFlZS5I0nHCbxXeIvu0SdNQVsk3C1bCl0F
   x9Yqp2ksyJ0l9YNlLDGOuSAglwjRjx1lMhx5CvkYX7MB6FD6u40SA3Chi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="383553828"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="383553828"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 05:13:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="912850185"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="912850185"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 05:13:38 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 1/2] ASoC: SOF: ipc4-topology: Correct data structures for the SRC module
Date: Wed, 29 Nov 2023 15:14:10 +0200
Message-ID: <20231129131411.27516-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129131411.27516-1-peter.ujfalusi@linux.intel.com>
References: <20231129131411.27516-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separate the IPC message part as struct sof_ipc4_src_data. This struct
describes the message payload passed to the firmware via the mailbox.

It is not wise to be 'clever' and try to use the first part of a struct
as IPC message without marking the message section as packed and aligned.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 21 +++++++++++----------
 sound/soc/sof/ipc4-topology.h | 16 ++++++++++++----
 2 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index b89065abb511..417e841173fb 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -141,7 +141,7 @@ static const struct sof_topology_token gain_tokens[] = {
 /* SRC */
 static const struct sof_topology_token src_tokens[] = {
 	{SOF_TKN_SRC_RATE_OUT, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc4_src, sink_rate)},
+		offsetof(struct sof_ipc4_src_data, sink_rate)},
 };
 
 static const struct sof_token_info ipc4_token_list[SOF_TOKEN_COUNT] = {
@@ -831,11 +831,12 @@ static int sof_ipc4_widget_setup_comp_src(struct snd_sof_widget *swidget)
 
 	swidget->private = src;
 
-	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &src->available_fmt, &src->base_config);
+	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &src->available_fmt,
+				     &src->data.base_config);
 	if (ret)
 		goto err;
 
-	ret = sof_update_ipc_object(scomp, src, SOF_SRC_TOKENS, swidget->tuples,
+	ret = sof_update_ipc_object(scomp, &src->data, SOF_SRC_TOKENS, swidget->tuples,
 				    swidget->num_tuples, sizeof(*src), 1);
 	if (ret) {
 		dev_err(scomp->dev, "Parsing SRC tokens failed\n");
@@ -844,7 +845,7 @@ static int sof_ipc4_widget_setup_comp_src(struct snd_sof_widget *swidget)
 
 	spipe->core_mask |= BIT(swidget->core);
 
-	dev_dbg(scomp->dev, "SRC sink rate %d\n", src->sink_rate);
+	dev_dbg(scomp->dev, "SRC sink rate %d\n", src->data.sink_rate);
 
 	ret = sof_ipc4_widget_setup_msg(swidget, &src->msg);
 	if (ret)
@@ -1920,7 +1921,7 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits;
 	int output_format_index, input_format_index;
 
-	input_format_index = sof_ipc4_init_input_audio_fmt(sdev, swidget, &src->base_config,
+	input_format_index = sof_ipc4_init_input_audio_fmt(sdev, swidget, &src->data.base_config,
 							   pipeline_params, available_fmt);
 	if (input_format_index < 0)
 		return input_format_index;
@@ -1950,7 +1951,7 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	 */
 	out_ref_rate = params_rate(fe_params);
 
-	output_format_index = sof_ipc4_init_output_audio_fmt(sdev, &src->base_config,
+	output_format_index = sof_ipc4_init_output_audio_fmt(sdev, &src->data.base_config,
 							     available_fmt, out_ref_rate,
 							     out_ref_channels, out_ref_valid_bits);
 	if (output_format_index < 0) {
@@ -1960,10 +1961,10 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	}
 
 	/* update pipeline memory usage */
-	sof_ipc4_update_resource_usage(sdev, swidget, &src->base_config);
+	sof_ipc4_update_resource_usage(sdev, swidget, &src->data.base_config);
 
 	out_audio_fmt = &available_fmt->output_pin_fmts[output_format_index].audio_fmt;
-	src->sink_rate = out_audio_fmt->sampling_frequency;
+	src->data.sink_rate = out_audio_fmt->sampling_frequency;
 
 	/* update pipeline_params for sink widgets */
 	return sof_ipc4_update_hw_params(sdev, pipeline_params, out_audio_fmt);
@@ -2364,8 +2365,8 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 	{
 		struct sof_ipc4_src *src = swidget->private;
 
-		ipc_size = sizeof(struct sof_ipc4_base_module_cfg) + sizeof(src->sink_rate);
-		ipc_data = src;
+		ipc_size = sizeof(src->data);
+		ipc_data = &src->data;
 
 		msg = &src->msg;
 		break;
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 0a57b8ab3e08..127caca5262a 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -404,16 +404,24 @@ struct sof_ipc4_mixer {
 	struct sof_ipc4_msg msg;
 };
 
-/**
- * struct sof_ipc4_src SRC config data
+/*
+ * struct sof_ipc4_src_data - IPC data for SRC
  * @base_config: IPC base config data
  * @sink_rate: Output rate for sink module
+ */
+struct sof_ipc4_src_data {
+	struct sof_ipc4_base_module_cfg base_config;
+	uint32_t sink_rate;
+} __packed __aligned(4);
+
+/**
+ * struct sof_ipc4_src - SRC config data
+ * @data: IPC base config data
  * @available_fmt: Available audio format
  * @msg: IPC4 message struct containing header and data info
  */
 struct sof_ipc4_src {
-	struct sof_ipc4_base_module_cfg base_config;
-	uint32_t sink_rate;
+	struct sof_ipc4_src_data data;
 	struct sof_ipc4_available_audio_format available_fmt;
 	struct sof_ipc4_msg msg;
 };
-- 
2.43.0

