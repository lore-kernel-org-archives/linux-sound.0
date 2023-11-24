Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sw660qOQ"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEA25D41
	for <linux-sound@vger.kernel.org>; Fri, 24 Nov 2023 05:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700834234; x=1732370234;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cRtP+/fvLp2mZi9KFWBi6Hcoa/TFerpYhlbAz1Ua5uY=;
  b=Sw660qOQnkHaw9+aBCgQF6OLjTEdlx3JZ8N9XYlS925It2JiDKSXN4Uh
   4UOJgAyJ2KMGdQheBtS8dZ6+E6sJdUpMA9UV9HhTrJbXozremkIBqBcWI
   R3f/wlUrbHve5ZdfzOjGUB6z0EBYT+tUTpRuHnZ8r9/NDLQmTY5kLWsXz
   N0qkgMH8WpT4tv6IlT26Eg4ywMPl5gk/szW/YN2exZsuXJVO4bdZl8rp+
   O0qXBAWbdRxrLkpa+JT35e2MrRGnZuRrxADzBgi+EZFcY8C55g22XQhhx
   l9Da1Rn/hw5VYbalNlr+wGFML0DssBDhZ2GW7jkPCLajQTPKvpLVnU1A9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="372590357"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="372590357"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 05:57:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="858397227"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="858397227"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.182])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 05:57:12 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 1/2] ASoC: SOF: ipc4-topology: Add core_mask in struct snd_sof_pipeline
Date: Fri, 24 Nov 2023 15:57:42 +0200
Message-ID: <20231124135743.24674-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231124135743.24674-1-peter.ujfalusi@linux.intel.com>
References: <20231124135743.24674-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

With IPC4, a pipeline may contain multiple modules in the data
processing domain and they can be scheduled to run on different cores.
Add a new field in struct snd_sof_pipeline to keep track of all the
cores that are associated with the modules in the pipeline. Set the
pipeline core mask for IPC3 when initializing the pipeline widget IPC
structure. For IPC4, set the core mark when initializing the pipeline
widget and initializing processing modules in the data processing domain.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 2 ++
 sound/soc/sof/ipc4-topology.c | 9 +++++++++
 sound/soc/sof/sof-audio.h     | 2 ++
 3 files changed, 13 insertions(+)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 7a4932c152a9..8c999e7721f2 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -505,6 +505,7 @@ static int sof_ipc3_widget_setup_comp_mixer(struct snd_sof_widget *swidget)
 static int sof_ipc3_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 {
 	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_pipeline *spipe = swidget->spipe;
 	struct sof_ipc_pipe_new *pipeline;
 	struct snd_sof_widget *comp_swidget;
 	int ret;
@@ -557,6 +558,7 @@ static int sof_ipc3_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 		swidget->dynamic_pipeline_widget);
 
 	swidget->core = pipeline->core;
+	spipe->core_mask |= BIT(pipeline->core);
 
 	return 0;
 
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index b24a64377f68..19f36db30979 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -656,6 +656,7 @@ static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 {
 	struct snd_soc_component *scomp = swidget->scomp;
 	struct sof_ipc4_pipeline *pipeline;
+	struct snd_sof_pipeline *spipe = swidget->spipe;
 	int ret;
 
 	pipeline = kzalloc(sizeof(*pipeline), GFP_KERNEL);
@@ -670,6 +671,7 @@ static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 	}
 
 	swidget->core = pipeline->core_id;
+	spipe->core_mask |= BIT(pipeline->core_id);
 
 	if (pipeline->use_chain_dma) {
 		dev_dbg(scomp->dev, "Set up chain DMA for %s\n", swidget->widget->name);
@@ -797,6 +799,7 @@ static int sof_ipc4_widget_setup_comp_mixer(struct snd_sof_widget *swidget)
 static int sof_ipc4_widget_setup_comp_src(struct snd_sof_widget *swidget)
 {
 	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_pipeline *spipe = swidget->spipe;
 	struct sof_ipc4_src *src;
 	int ret;
 
@@ -819,6 +822,8 @@ static int sof_ipc4_widget_setup_comp_src(struct snd_sof_widget *swidget)
 		goto err;
 	}
 
+	spipe->core_mask |= BIT(swidget->core);
+
 	dev_dbg(scomp->dev, "SRC sink rate %d\n", src->sink_rate);
 
 	ret = sof_ipc4_widget_setup_msg(swidget, &src->msg);
@@ -864,6 +869,7 @@ static int sof_ipc4_widget_setup_comp_process(struct snd_sof_widget *swidget)
 {
 	struct snd_soc_component *scomp = swidget->scomp;
 	struct sof_ipc4_fw_module *fw_module;
+	struct snd_sof_pipeline *spipe = swidget->spipe;
 	struct sof_ipc4_process *process;
 	void *cfg;
 	int ret;
@@ -920,6 +926,9 @@ static int sof_ipc4_widget_setup_comp_process(struct snd_sof_widget *swidget)
 
 	sof_ipc4_widget_update_kcontrol_module_id(swidget);
 
+	/* set pipeline core mask to keep track of the core the module is scheduled to run on */
+	spipe->core_mask |= BIT(swidget->core);
+
 	return 0;
 free_base_cfg_ext:
 	kfree(process->base_config_ext);
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 99c940b22538..8874ee5f557f 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -481,6 +481,7 @@ struct snd_sof_widget {
  * @paused_count: Count of number of PCM's that have started and have currently paused this
 		  pipeline
  * @complete: flag used to indicate that pipeline set up is complete.
+ * @core_mask: Mask containing target cores for all modules in the pipeline
  * @list: List item in sdev pipeline_list
  */
 struct snd_sof_pipeline {
@@ -488,6 +489,7 @@ struct snd_sof_pipeline {
 	int started_count;
 	int paused_count;
 	int complete;
+	unsigned long core_mask;
 	struct list_head list;
 };
 
-- 
2.42.1

