Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D61F3FE67B
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408079; cv=none; b=UKDSQzqm/uJ90LafEWJpFn1mL7Q8U1f5JX8WMpwQ2FGRnQh5TfATDvUojOqKhdLSttN0Aj2VOo+2XSLArS9t7WvnaRbXepJiiLUEcKTKDhCu1AinAJoU51KgYIHUhgD7ylqAY6ZXRLuZz0FrZIdJPDLaiMgJtpZiBBf4Ji4+NFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408079; c=relaxed/simple;
	bh=4h0XXFvbOH3ohtuVFtOK0uj2a3ntW2UIZ3JxRoWEfzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gDwxlgpiI6j7xN7nyk5B0OaGOL4438KwKyk2zDE18KtzKSTAZ1nCnaKEcEF0y3nXzm0d2l1KRW1cdYmk6ArPDYkq8XnDBhJLEwZJQN9G3PjVVOG4//dAMiv4jRm4CFE0ijKI85YqMExFrA8TZJddeUKW67zez4ZVUUbjs07/8c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RtBRAAQD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtBRAAQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785408078; x=1816944078;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4h0XXFvbOH3ohtuVFtOK0uj2a3ntW2UIZ3JxRoWEfzU=;
  b=RtBRAAQDFhHSP7NFpX7/V98Jre7BtWukJbXOgVlXlnBpi5h1ma4sCeSr
   aOOqXiuesg1VMlyzW9b39sYicOGk8YAZWugcyRQWWVMRr+2jo8XyubGAi
   jKnerBXkZRJ8ITPqXTRGBq+S664PvE1CHjQ4hDVO3ij/pUDJvb8DgukF1
   1MaUmzHtTqr+FHBdu4s/N/H6jyb0WiE5AO0qkLhcFWWGxHC3CJ5dinibS
   Zjev6l7Oo3CSmyatwdxvoyTfWnSXarIzojKk4AYVnqS+WICh/t72IJdss
   bnJ55ZT1T4DMHpk8ET86BoeqjPQ8RTIKOJPPMQNma4RbbpchHFKyTC2uK
   A==;
X-CSE-ConnectionGUID: CfIY/CfHQPCXYaIy5QohAw==
X-CSE-MsgGUID: VlrZUeu0Qr25r1Zsgzwd5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108817787"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="108817787"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:41:17 -0700
X-CSE-ConnectionGUID: +ojgoJ4hRKy8w73gQibdIw==
X-CSE-MsgGUID: gVbESsBeRK6BnGcntpMIqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="262221318"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:41:15 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	jyri.sarha@linux.intel.com
Subject: [PATCH 4/6] ASoC: SOF: ipc4-topology: Add payload to pipeline create messages
Date: Thu, 30 Jul 2026 13:41:39 +0300
Message-ID: <20260730104141.14817-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730104141.14817-1-peter.ujfalusi@linux.intel.com>
References: <20260730104141.14817-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jyri Sarha <jyri.sarha@linux.intel.com>

Start adding payloads to pipeline create messages. The payload
contains information for payload specific memory configuration.

All non DP module instances within the same pipeline share the same
memory attributes and access the same resources. The new logic sums
interim, lifetime, and shared heap memory requirements together and
picks the highest stack requirement of all module instances belonging
to a pipeline. These pipeline specific attributes are sent as struct
sof_ipc4_glb_pipe_payload payload in pipeline's create message.

The idea is to pass common memory configuration for all the Low
Latency modules in the pipeline in pipeline create message payload.

The Data Processing module instances will still have an individual
memory configuration in struct sof_ipc4_mod_init_ext_dp_memory_data
payloads as before. In their payload everything is as it was before,
all attributes are copied directly from their topology attributes.

Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 112 +++++++++++++++++++++++++++++++---
 1 file changed, 103 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 7808a679e25d..02948b2a809b 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1371,6 +1371,22 @@ sof_ipc4_update_resource_usage(struct snd_sof_dev *sdev, struct snd_sof_widget *
 	pipeline = pipe_widget->private;
 	pipeline->mem_usage += total;
 
+	/*
+	 * If this is not a Data Processing module instance, add the
+	 * required heap sizes to the sum of all module instances belonging
+	 * to the same pipeline, and find the maximum stack requirement
+	 * among all module instances belonging to the same pipeline.
+	 */
+	if (swidget->comp_domain != SOF_COMP_DOMAIN_DP) {
+		pipe_widget->heap_bytes += swidget->heap_bytes;
+		if (pipe_widget->stack_bytes < swidget->stack_bytes)
+			pipe_widget->stack_bytes = swidget->stack_bytes;
+
+		dev_dbg(sdev->dev, "%s mem reqs to %s heap %u stack %u",
+			swidget->widget->name, pipe_widget->widget->name,
+			pipe_widget->heap_bytes, pipe_widget->stack_bytes);
+	}
+
 	/* Update base_config->cpc from the module manifest */
 	sof_ipc4_update_cpc_from_manifest(sdev, fw_module, base_config);
 
@@ -1688,6 +1704,8 @@ static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
 	pipe_widget = swidget->spipe->pipe_widget;
 	pipeline = pipe_widget->private;
 	pipeline->mem_usage = 0;
+	pipe_widget->heap_bytes = 0;
+	pipe_widget->stack_bytes = 0;
 
 	if (WIDGET_IS_AIF(swidget->id) || swidget->id == snd_soc_dapm_buffer) {
 		if (pipeline->use_chain_dma) {
@@ -3085,11 +3103,11 @@ static int sof_ipc4_control_setup(struct snd_sof_dev *sdev, struct snd_sof_contr
 	return 0;
 }
 
-static int sof_ipc4_widget_setup_msg_payload(struct snd_sof_dev *sdev,
-					     struct snd_sof_widget *swidget,
-					     struct sof_ipc4_msg *msg,
-					     void *ipc_data, u32 ipc_size,
-					     void **new_data)
+static int sof_ipc4_widget_mod_init_msg_payload(struct snd_sof_dev *sdev,
+						struct snd_sof_widget *swidget,
+						struct sof_ipc4_msg *msg,
+						void *ipc_data, u32 ipc_size,
+						void **new_data)
 {
 	struct sof_ipc4_mod_init_ext_dp_memory_data *dp_mem_data;
 	struct sof_ipc4_module_init_ext_init *ext_init;
@@ -3113,13 +3131,14 @@ static int sof_ipc4_widget_setup_msg_payload(struct snd_sof_dev *sdev,
 
 	/* Add ext_init first and set objects array flag to 1 */
 	ext_init = (struct sof_ipc4_module_init_ext_init *)payload;
-	ext_init->word0 |= SOF_IPC4_MOD_INIT_EXT_OBJ_ARRAY_MASK;
 	ext_pos = DIV_ROUND_UP(sizeof(*ext_init), sizeof(u32));
 
 	/* Add object array objects after ext_init */
 
 	/* Add memory_data if comp_domain indicates DP */
 	if (swidget->comp_domain == SOF_COMP_DOMAIN_DP) {
+		ext_init->word0 |= SOF_IPC4_MOD_INIT_EXT_OBJ_ARRAY_MASK;
+
 		hdr = (struct sof_ipc4_module_init_ext_object *)&payload[ext_pos];
 		hdr->header = SOF_IPC4_MOD_INIT_EXT_OBJ_LAST_MASK |
 			SOF_IPC4_MOD_INIT_EXT_OBJ_ID(SOF_IPC4_MOD_INIT_DATA_ID_DP_DATA) |
@@ -3132,7 +3151,6 @@ static int sof_ipc4_widget_setup_msg_payload(struct snd_sof_dev *sdev,
 		dp_mem_data->heap_bytes = swidget->heap_bytes;
 		ext_pos += DIV_ROUND_UP(sizeof(*dp_mem_data), sizeof(u32));
 	}
-
 	/* If another array object is added, remember clear previous OBJ_LAST bit */
 
 	/* Calculate final size and check that it fits to max payload size */
@@ -3156,6 +3174,69 @@ static int sof_ipc4_widget_setup_msg_payload(struct snd_sof_dev *sdev,
 	return new_size;
 }
 
+static void sof_ipc4_widget_pipe_ext_obj_memory_data(struct snd_sof_dev *sdev,
+						     struct snd_sof_widget *swidget,
+						     u32 *payload, u32 *ext_pos,
+						     struct sof_ipc4_glb_pipe_ext_object **hdr)
+{
+	struct sof_ipc4_glb_pipe_ext_obj_memory_data *mem_data;
+
+	*hdr = (struct sof_ipc4_glb_pipe_ext_object *)&payload[*ext_pos];
+	(*hdr)->header =
+		SOF_IPC4_GLB_PIPE_EXT_OBJ_ID(SOF_IPC4_GLB_PIPE_DATA_ID_MEM_DATA) |
+		SOF_IPC4_GLB_PIPE_EXT_OBJ_WORDS(DIV_ROUND_UP(sizeof(*mem_data),
+							     sizeof(u32)));
+	*ext_pos += DIV_ROUND_UP(sizeof(**hdr), sizeof(u32));
+	mem_data = (struct sof_ipc4_glb_pipe_ext_obj_memory_data *)&payload[*ext_pos];
+	mem_data->domain_id = swidget->domain_id;
+	mem_data->stack_bytes = swidget->stack_bytes;
+	mem_data->heap_bytes = swidget->heap_bytes;
+	*ext_pos += DIV_ROUND_UP(sizeof(*mem_data), sizeof(u32));
+
+	dev_dbg(sdev->dev,
+		"%s; domain_id %u stack %u heap %u bytes",
+		swidget->widget->name, mem_data->domain_id, mem_data->stack_bytes,
+		mem_data->heap_bytes);
+}
+
+static int sof_ipc4_widget_pipe_create_msg_payload(struct snd_sof_dev *sdev,
+						   struct snd_sof_widget *swidget,
+						   struct sof_ipc4_msg *msg,
+						   void **new_data)
+{
+	struct sof_ipc4_glb_pipe_payload *payload_hdr;
+	struct sof_ipc4_glb_pipe_ext_object *hdr = NULL;
+	u32 *payload;
+	u32 ext_pos;
+
+	payload = kzalloc(sdev->ipc->max_payload_size, GFP_KERNEL);
+	if (!payload)
+		return -ENOMEM;
+
+	/* Add sof_ipc4_glb_pipe_payload and set array bit to  1 */
+	payload_hdr = (struct sof_ipc4_glb_pipe_payload *)payload;
+	payload_hdr->word0 |= SOF_IPC4_GLB_PIPE_EXT_OBJ_ARRAY_MASK;
+	ext_pos = DIV_ROUND_UP(sizeof(*payload_hdr), sizeof(u32));
+
+	sof_ipc4_widget_pipe_ext_obj_memory_data(sdev, swidget, payload, &ext_pos, &hdr);
+	/* Add following array objects here */
+
+	/* Mark end of object array */
+	hdr->header |= SOF_IPC4_GLB_PIPE_EXT_OBJ_LAST_MASK;
+
+	/* Put total payload size in words to the payload header */
+	payload_hdr->word0 |= SOF_IPC4_GLB_PIPE_PAYLOAD_WORDS(ext_pos);
+	*new_data = payload;
+
+	/* Update msg extension bits according to the payload changes */
+	msg->extension |= SOF_IPC4_GLB_PIPE_PAYLOAD_MASK;
+
+	dev_dbg(sdev->dev, "%s: payload word0 %#x", swidget->widget->name,
+		payload_hdr->word0);
+
+	return ext_pos * sizeof(int32_t);
+}
+
 static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
 	struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
@@ -3309,8 +3390,8 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 			swidget->widget->name, swidget->pipeline_id, module_id,
 			swidget->instance_id, swidget->core);
 
-		ret = sof_ipc4_widget_setup_msg_payload(sdev, swidget, msg, ipc_data, ipc_size,
-							&ext_data);
+		ret = sof_ipc4_widget_mod_init_msg_payload(sdev, swidget, msg, ipc_data, ipc_size,
+							   &ext_data);
 		if (ret < 0)
 			goto fail;
 
@@ -3322,6 +3403,17 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 		dev_dbg(sdev->dev, "Create pipeline %s (pipe %d) - instance %d, core %d\n",
 			swidget->widget->name, swidget->pipeline_id,
 			swidget->instance_id, swidget->core);
+
+		msg->extension &= ~SOF_IPC4_GLB_PIPE_PAYLOAD_MASK;
+		ret = sof_ipc4_widget_pipe_create_msg_payload(sdev, swidget, msg,
+							      &ext_data);
+		if (ret < 0)
+			goto fail;
+
+		if (ret > 0) {
+			ipc_size = ret;
+			ipc_data = ext_data;
+		}
 	}
 
 	msg->data_size = ipc_size;
@@ -3379,6 +3471,8 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
 				swidget->widget->name);
 
 		pipeline->mem_usage = 0;
+		swidget->heap_bytes = 0;
+		swidget->stack_bytes = 0;
 		pipeline->state = SOF_IPC4_PIPE_UNINITIALIZED;
 		ida_free(&pipeline_ida, swidget->instance_id);
 		swidget->instance_id = -EINVAL;
-- 
2.55.0

