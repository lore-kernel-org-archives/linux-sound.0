Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FrukP7j8"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D0DEB2
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 05:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701263623; x=1732799623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uy5zXgx0lci9B4dbDx3tNmZ0OM0U2EZB8iLhIeUb45E=;
  b=FrukP7j8LOKz5WFmksqzYO5RVn1Qe5R8hvaxyc5dvaal81CjmL0LmnJ4
   q6hNy90JAT3JpfwF8ALA33tW//LskviMbsg72wiv+xtuk+uiNdkQGYvkW
   Pd/ETmDlTi6mCibwEudBv78iYakC9meV+BrzjSQSRJw2fQQkjmGNsxgYP
   uTxiyv0vIbYc6KL79onuz/hR4y/tFz8T/Dp4agNPmAmJ7pqZEx5DIDZxY
   OvNlvLCL0Jj+gHEApifH636Mqu3T4hBhRqf8Wtc0mBQ+o6zZCc+Fkfh+k
   6fGLRZ4nimuod6/c/aAVav8muzveWrgkCLmWdRFBEmxF3LXhpw7SfsdNc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="383553841"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="383553841"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 05:13:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="912850193"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="912850193"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 05:13:40 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 2/2] ASoC: SOF: ipc4-topology: Correct data structures for the GAIN module
Date: Wed, 29 Nov 2023 15:14:11 +0200
Message-ID: <20231129131411.27516-3-peter.ujfalusi@linux.intel.com>
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

Move the base_cfg to struct sof_ipc4_gain_data. This struct
describes the message payload passed to the firmware via the mailbox.

It is not wise to be 'clever' and try to use the first part of a struct
as IPC message without marking the message section as packed and aligned.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-control.c  | 20 ++++++++++----------
 sound/soc/sof/ipc4-topology.c | 31 +++++++++++++++----------------
 sound/soc/sof/ipc4-topology.h | 18 +++++++++++++-----
 3 files changed, 38 insertions(+), 31 deletions(-)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 3d2a35f27a87..1be9519de909 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -89,7 +89,7 @@ sof_ipc4_set_volume_data(struct snd_sof_dev *sdev, struct snd_sof_widget *swidge
 	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
 	struct sof_ipc4_gain *gain = swidget->private;
 	struct sof_ipc4_msg *msg = &cdata->msg;
-	struct sof_ipc4_gain_data data;
+	struct sof_ipc4_gain_params params;
 	bool all_channels_equal = true;
 	u32 value;
 	int ret, i;
@@ -109,20 +109,20 @@ sof_ipc4_set_volume_data(struct snd_sof_dev *sdev, struct snd_sof_widget *swidge
 	 */
 	for (i = 0; i < scontrol->num_channels; i++) {
 		if (all_channels_equal) {
-			data.channels = SOF_IPC4_GAIN_ALL_CHANNELS_MASK;
-			data.init_val = cdata->chanv[0].value;
+			params.channels = SOF_IPC4_GAIN_ALL_CHANNELS_MASK;
+			params.init_val = cdata->chanv[0].value;
 		} else {
-			data.channels = cdata->chanv[i].channel;
-			data.init_val = cdata->chanv[i].value;
+			params.channels = cdata->chanv[i].channel;
+			params.init_val = cdata->chanv[i].value;
 		}
 
 		/* set curve type and duration from topology */
-		data.curve_duration_l = gain->data.curve_duration_l;
-		data.curve_duration_h = gain->data.curve_duration_h;
-		data.curve_type = gain->data.curve_type;
+		params.curve_duration_l = gain->data.params.curve_duration_l;
+		params.curve_duration_h = gain->data.params.curve_duration_h;
+		params.curve_type = gain->data.params.curve_type;
 
-		msg->data_ptr = &data;
-		msg->data_size = sizeof(data);
+		msg->data_ptr = &params;
+		msg->data_size = sizeof(params);
 
 		ret = sof_ipc4_set_get_kcontrol_data(scontrol, true, lock);
 		msg->data_ptr = NULL;
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 417e841173fb..06744ce96331 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -130,12 +130,12 @@ static const struct sof_topology_token comp_ext_tokens[] = {
 
 static const struct sof_topology_token gain_tokens[] = {
 	{SOF_TKN_GAIN_RAMP_TYPE, SND_SOC_TPLG_TUPLE_TYPE_WORD,
-		get_token_u32, offsetof(struct sof_ipc4_gain_data, curve_type)},
+		get_token_u32, offsetof(struct sof_ipc4_gain_params, curve_type)},
 	{SOF_TKN_GAIN_RAMP_DURATION,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc4_gain_data, curve_duration_l)},
+		offsetof(struct sof_ipc4_gain_params, curve_duration_l)},
 	{SOF_TKN_GAIN_VAL, SND_SOC_TPLG_TUPLE_TYPE_WORD,
-		get_token_u32, offsetof(struct sof_ipc4_gain_data, init_val)},
+		get_token_u32, offsetof(struct sof_ipc4_gain_params, init_val)},
 };
 
 /* SRC */
@@ -740,15 +740,15 @@ static int sof_ipc4_widget_setup_comp_pga(struct snd_sof_widget *swidget)
 
 	swidget->private = gain;
 
-	gain->data.channels = SOF_IPC4_GAIN_ALL_CHANNELS_MASK;
-	gain->data.init_val = SOF_IPC4_VOL_ZERO_DB;
+	gain->data.params.channels = SOF_IPC4_GAIN_ALL_CHANNELS_MASK;
+	gain->data.params.init_val = SOF_IPC4_VOL_ZERO_DB;
 
-	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &gain->available_fmt, &gain->base_config);
+	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &gain->available_fmt, &gain->data.base_config);
 	if (ret)
 		goto err;
 
-	ret = sof_update_ipc_object(scomp, &gain->data, SOF_GAIN_TOKENS, swidget->tuples,
-				    swidget->num_tuples, sizeof(gain->data), 1);
+	ret = sof_update_ipc_object(scomp, &gain->data.params, SOF_GAIN_TOKENS,
+				    swidget->tuples, swidget->num_tuples, sizeof(gain->data), 1);
 	if (ret) {
 		dev_err(scomp->dev, "Parsing gain tokens failed\n");
 		goto err;
@@ -756,8 +756,8 @@ static int sof_ipc4_widget_setup_comp_pga(struct snd_sof_widget *swidget)
 
 	dev_dbg(scomp->dev,
 		"pga widget %s: ramp type: %d, ramp duration %d, initial gain value: %#x\n",
-		swidget->widget->name, gain->data.curve_type, gain->data.curve_duration_l,
-		gain->data.init_val);
+		swidget->widget->name, gain->data.params.curve_type,
+		gain->data.params.curve_duration_l, gain->data.params.init_val);
 
 	ret = sof_ipc4_widget_setup_msg(swidget, &gain->msg);
 	if (ret)
@@ -1846,7 +1846,7 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits;
 	int ret;
 
-	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &gain->base_config,
+	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &gain->data.base_config,
 					    pipeline_params, available_fmt);
 	if (ret < 0)
 		return ret;
@@ -1856,7 +1856,7 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
 	out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
 
-	ret = sof_ipc4_init_output_audio_fmt(sdev, &gain->base_config, available_fmt,
+	ret = sof_ipc4_init_output_audio_fmt(sdev, &gain->data.base_config, available_fmt,
 					     out_ref_rate, out_ref_channels, out_ref_valid_bits);
 	if (ret < 0) {
 		dev_err(sdev->dev, "Failed to initialize output format for %s",
@@ -1865,7 +1865,7 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	}
 
 	/* update pipeline memory usage */
-	sof_ipc4_update_resource_usage(sdev, swidget, &gain->base_config);
+	sof_ipc4_update_resource_usage(sdev, swidget, &gain->data.base_config);
 
 	return 0;
 }
@@ -2344,9 +2344,8 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 	{
 		struct sof_ipc4_gain *gain = swidget->private;
 
-		ipc_size = sizeof(struct sof_ipc4_base_module_cfg) +
-			   sizeof(struct sof_ipc4_gain_data);
-		ipc_data = gain;
+		ipc_size = sizeof(gain->data);
+		ipc_data = &gain->data;
 
 		msg = &gain->msg;
 		break;
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 127caca5262a..dce174a190dd 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -361,7 +361,7 @@ struct sof_ipc4_control_msg_payload {
 } __packed;
 
 /**
- * struct sof_ipc4_gain_data - IPC gain blob
+ * struct sof_ipc4_gain_params - IPC gain parameters
  * @channels: Channels
  * @init_val: Initial value
  * @curve_type: Curve type
@@ -369,24 +369,32 @@ struct sof_ipc4_control_msg_payload {
  * @curve_duration_l: Curve duration low part
  * @curve_duration_h: Curve duration high part
  */
-struct sof_ipc4_gain_data {
+struct sof_ipc4_gain_params {
 	uint32_t channels;
 	uint32_t init_val;
 	uint32_t curve_type;
 	uint32_t reserved;
 	uint32_t curve_duration_l;
 	uint32_t curve_duration_h;
-} __aligned(8);
+} __packed __aligned(4);
 
 /**
- * struct sof_ipc4_gain - gain config data
+ * struct sof_ipc4_gain_data - IPC gain init blob
  * @base_config: IPC base config data
+ * @params: Initial parameters for the gain module
+ */
+struct sof_ipc4_gain_data {
+	struct sof_ipc4_base_module_cfg base_config;
+	struct sof_ipc4_gain_params params;
+} __packed __aligned(4);
+
+/**
+ * struct sof_ipc4_gain - gain config data
  * @data: IPC gain blob
  * @available_fmt: Available audio format
  * @msg: message structure for gain
  */
 struct sof_ipc4_gain {
-	struct sof_ipc4_base_module_cfg base_config;
 	struct sof_ipc4_gain_data data;
 	struct sof_ipc4_available_audio_format available_fmt;
 	struct sof_ipc4_msg msg;
-- 
2.43.0

