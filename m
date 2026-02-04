Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51B038F254
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 08:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770193097; cv=none; b=Bc8cZfLnpZ385lasL3xzgVgCsHxgcHWRYVqdO89LKHMEhvR0R63f//P+LNyrPSr1Fn4ILdOrJZi/Q80N5MxxcuiB1Fj/x4PtPDqc81zcXIrcQURr/LV+BJuY4c/jSSd7OrTUx6qReFHIpFJeKFMiFZ9dYkdffoJ+IAmKD5vaipg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770193097; c=relaxed/simple;
	bh=9I3MDuJZImOXgk6PlQURkAqIY9fHFFYGKf6mC/tOZ6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IX4aKN9CTa101w8QJ+H7yGG82IOsqLPL0PbSEfGpyvHPy5v2PfLYEHzDRGGizr/6g8PF1wtS0YXOV104KVQ6/i7cImIFbwCzvLdGcmf0m+DlzfCtsYT8f0kLK9qPMf2+H/a4DE0cq9ZGhWH/5OPboHEFobcxJ/BoGzKA6h0HzWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MUbUj8fb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MUbUj8fb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770193097; x=1801729097;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9I3MDuJZImOXgk6PlQURkAqIY9fHFFYGKf6mC/tOZ6M=;
  b=MUbUj8fbsEWEzzOSn+cwf8xb+EKYJhx/75e+bVY+LF5sfRmHAHFpB/oH
   KfDY1MvaMPtVPAvJDrz3oeDgfhYnqZ2NjKSDIEeEmiQsbu1nfLjIWqnJt
   PXhNu4V9scOVUeRHVMNc09YtThZYeIxqs40lEdDc/iDqix+qOA6WVt07q
   xbLgMJr91x4MNhuJRa7B8y15cBV9a4Tsc4E9osAW8NDvbBnJ73iIZnOUW
   D0pafpEZj9dlG+q7XwiICwAznzG6VJIaHYZ+6ay9dvdWRXLSx46swM0mM
   vRYYWw+0ornuirvcpMKUoAH1eUFmYKt7i/n5pPVIUufeq3GsxzYwrpXNY
   g==;
X-CSE-ConnectionGUID: 3jQZvzCxQImbTNlwEwBDYw==
X-CSE-MsgGUID: GsTo7TjxTzWnVdVLvMLKRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="94028486"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="94028486"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:18:09 -0800
X-CSE-ConnectionGUID: fnNefhCFTby5eEONBgAoog==
X-CSE-MsgGUID: fKAoqqzKTdKe/6IavYRPCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209893285"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.245])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:18:05 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	mateuszx.redzynia@intel.com
Subject: [PATCH 05/10] ASoC: SOF: ipc4-topology: Add new tokens for pipeline direction
Date: Wed,  4 Feb 2026 10:18:28 +0200
Message-ID: <20260204081833.16630-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204081833.16630-1-peter.ujfalusi@linux.intel.com>
References: <20260204081833.16630-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Parse the pipeline direction from topology. The direction_valid token is
required for backward-compatibility with older topologies that may not
have the direction set for pipelines. This will be used when
setting up pipelines to check if a pipeline is in the same direction as
the requested params and skip those in the opposite direction like in
the case of echo reference capture pipelines during playback.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h |  2 ++
 sound/soc/sof/ipc4-topology.c   | 12 ++++++++++--
 sound/soc/sof/ipc4-topology.h   |  4 ++++
 sound/soc/sof/sof-audio.h       |  5 +++++
 4 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index a68381a263eb..f4a7baadb44d 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -57,6 +57,8 @@
 #define SOF_TKN_SCHED_MEM_USAGE			208
 #define SOF_TKN_SCHED_USE_CHAIN_DMA		209
 #define SOF_TKN_SCHED_KCPS			210
+#define SOF_TKN_SCHED_DIRECTION			211
+#define SOF_TKN_SCHED_DIRECTION_VALID		212
 
 /* volume */
 #define SOF_TKN_VOLUME_RAMP_STEP_TYPE		250
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index d28aad71c7ed..09aca52e020a 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -76,6 +76,10 @@ static const struct sof_topology_token ipc4_sched_tokens[] = {
 		offsetof(struct sof_ipc4_pipeline, core_id)},
 	{SOF_TKN_SCHED_PRIORITY, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
 		offsetof(struct sof_ipc4_pipeline, priority)},
+	{SOF_TKN_SCHED_DIRECTION, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc4_pipeline, direction)},
+	{SOF_TKN_SCHED_DIRECTION, SND_SOC_TPLG_TUPLE_TYPE_BOOL, get_token_u16,
+		offsetof(struct sof_ipc4_pipeline, direction_valid)},
 };
 
 static const struct sof_topology_token pipeline_tokens[] = {
@@ -939,6 +943,10 @@ static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 
 	swidget->core = pipeline->core_id;
 	spipe->core_mask |= BIT(pipeline->core_id);
+	if (pipeline->direction_valid) {
+		spipe->direction = pipeline->direction;
+		spipe->direction_valid = true;
+	}
 
 	if (pipeline->use_chain_dma) {
 		dev_dbg(scomp->dev, "Set up chain DMA for %s\n", swidget->widget->name);
@@ -954,9 +962,9 @@ static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 		goto err;
 	}
 
-	dev_dbg(scomp->dev, "pipeline '%s': id %d, pri %d, core_id %u, lp mode %d\n",
+	dev_dbg(scomp->dev, "pipeline '%s': id %d, pri %d, core_id %u, lp mode %d direction %d\n",
 		swidget->widget->name, swidget->pipeline_id,
-		pipeline->priority, pipeline->core_id, pipeline->lp_mode);
+		pipeline->priority, pipeline->core_id, pipeline->lp_mode, pipeline->direction);
 
 	swidget->private = pipeline;
 
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 9a028a59c553..a289c1d8f3ff 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -150,6 +150,8 @@ struct sof_ipc4_copier_config_set_sink_format {
  * @use_chain_dma: flag to indicate if the firmware shall use chained DMA
  * @msg: message structure for pipeline
  * @skip_during_fe_trigger: skip triggering this pipeline during the FE DAI trigger
+ * @direction_valid: flag indicating if valid direction is set in topology
+ * @direction: pipeline direction set in topology if direction_valid is true
  */
 struct sof_ipc4_pipeline {
 	uint32_t priority;
@@ -160,6 +162,8 @@ struct sof_ipc4_pipeline {
 	bool use_chain_dma;
 	struct sof_ipc4_msg msg;
 	bool skip_during_fe_trigger;
+	bool direction_valid;
+	u32 direction;
 };
 
 /**
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 5f62a34582da..36082e764bf9 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -512,6 +512,9 @@ struct snd_sof_widget {
  * @complete: flag used to indicate that pipeline set up is complete.
  * @core_mask: Mask containing target cores for all modules in the pipeline
  * @list: List item in sdev pipeline_list
+ * @direction_valid: flag indicating if the direction is set in topology
+ * @direction: pipeline direction set in topology, valid is direction_valid is true
+ *
  */
 struct snd_sof_pipeline {
 	struct snd_sof_widget *pipe_widget;
@@ -520,6 +523,8 @@ struct snd_sof_pipeline {
 	int complete;
 	unsigned long core_mask;
 	struct list_head list;
+	bool direction_valid;
+	u32 direction;
 };
 
 /* ASoC SOF DAPM route */
-- 
2.52.0

