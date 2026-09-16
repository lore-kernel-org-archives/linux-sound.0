Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE04F3F4DD0
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560248; cv=none; b=AGCnbPZGJHDSbO/2gtTmhXpIajs2Y+GEJJoTHPv0m3DB3OQvPsE3xi2hpiXW1RR55xeRnop9zTWAkm5wBc4y7LZx/DIbLyrVJPSf8+eFAiDxaCV76p2Cl6KSwmP00eAQY1VvK2FF9YDO8qn+galODZxnKdw1sV0tBqQ2UuNgZjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560248; c=relaxed/simple;
	bh=wxsdzKB5xWviLlFDXWyeZUG6y0LX8sOZGa3T7FOgRWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ERUkK+47196Pu3fPavttEZ0DkSI180ulvyjkIXlpF9UwbIS6uik/zW1XexvyIfrsz7l1Tbiphfwup/SgxS+3GcPXnN+D36JdhDOOyLAxTsNDI0p6xT7QegHKZcffdNq1fYZSIhBeZk4r7GpxsprFOy4lOlCbZc1iW+gK+cjP1GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KobIYt1M; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KobIYt1M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560238; x=1821096238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wxsdzKB5xWviLlFDXWyeZUG6y0LX8sOZGa3T7FOgRWM=;
  b=KobIYt1MFPQyjZhbrOhObSfCd6bwvcaTfHBRPUtK7c6sHRJMxJ918da0
   dZvaE9oS4t1t10qc2pNJtxCsWpIXQECDrZdQIojvqLzGa4Fg5/n1XmITZ
   y3oY69FWds9hgcun02gO72WTs4ZpXjzkyetbGtLBdDJIT8q6VXoLnYBBv
   jxekgZ7BWSfEIbErRNbUgXgcIE669IgmfUQuERimGeaAyjEQ4aphijwdQ
   QWJJ/qpne+ydlJGUouFXS7aQdNQN1VFI3TiK08tNKuoZ2OWoegk8ErnEX
   I1hcUrPlTV04/oTRbAsLxgFhMWcKmmZ9bJIRMxxluGfsunH8sf9j0ChfH
   Q==;
X-CSE-ConnectionGUID: EP/KuMeXT1W6AclvRU7XUg==
X-CSE-MsgGUID: 1EVGxumIToiQ5FhyMpblhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496400"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496400"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:51 -0700
X-CSE-ConnectionGUID: E9XLl8RtR3eGIYlIlEmCCA==
X-CSE-MsgGUID: /LqhZZfJRDehtR9JOez0lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293458"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:48 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v4 13/26] ASoC: SOF: pcm: Modify the signature of a couple of PCM IPC ops
Date: Wed, 16 Sep 2026 15:03:07 +0300
Message-ID: <20260916120320.18318-14-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

In order to reuse the pipeline triggering logic for compressed support
with IPC4, modify the signature of the trigger and hw_free PCM IPC ops
so that they can be reused.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/ipc3-pcm.c  | 26 +++++++---------------
 sound/soc/sof/ipc4-pcm.c  | 45 ++++++++++++++++++++-------------------
 sound/soc/sof/pcm.c       |  7 +++---
 sound/soc/sof/sof-audio.h |  7 +++---
 4 files changed, 39 insertions(+), 46 deletions(-)

diff --git a/sound/soc/sof/ipc3-pcm.c b/sound/soc/sof/ipc3-pcm.c
index 1d0c80466f6a..42f93e596598 100644
--- a/sound/soc/sof/ipc3-pcm.c
+++ b/sound/soc/sof/ipc3-pcm.c
@@ -14,23 +14,18 @@
 #include "sof-audio.h"
 
 static int sof_ipc3_pcm_hw_free(struct snd_soc_component *component,
-				struct snd_pcm_substream *substream)
+				struct snd_pcm_substream *substream,
+				struct snd_sof_pcm *spcm, int dir)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sof_ipc_stream stream;
-	struct snd_sof_pcm *spcm;
-
-	spcm = snd_sof_find_spcm_dai(component, rtd);
-	if (!spcm)
-		return -EINVAL;
 
-	if (!spcm->prepared[substream->stream])
+	if (!spcm->prepared[dir])
 		return 0;
 
 	stream.hdr.size = sizeof(stream);
 	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_FREE;
-	stream.comp_id = spcm->stream[substream->stream].comp_id;
+	stream.comp_id = spcm->stream[dir].comp_id;
 
 	/* send IPC to the DSP */
 	return sof_ipc_tx_message_no_reply(sdev->ipc, &stream, sizeof(stream));
@@ -141,20 +136,15 @@ static int sof_ipc3_pcm_hw_params(struct snd_soc_component *component,
 }
 
 static int sof_ipc3_pcm_trigger(struct snd_soc_component *component,
-				struct snd_pcm_substream *substream, int cmd)
+				struct snd_pcm_substream *substream,
+				struct snd_sof_pcm *spcm, int cmd, int dir)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct sof_ipc_stream stream;
-	struct snd_sof_pcm *spcm;
-
-	spcm = snd_sof_find_spcm_dai(component, rtd);
-	if (!spcm)
-		return -EINVAL;
 
 	stream.hdr.size = sizeof(stream);
 	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG;
-	stream.comp_id = spcm->stream[substream->stream].comp_id;
+	stream.comp_id = spcm->stream[dir].comp_id;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
@@ -172,7 +162,7 @@ static int sof_ipc3_pcm_trigger(struct snd_soc_component *component,
 		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_STOP;
 		break;
 	default:
-		spcm_err(spcm, substream->stream, "Unhandled trigger cmd %d\n", cmd);
+		spcm_err(spcm, dir, "Unhandled trigger cmd %d\n", cmd);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index d2a6c569845c..d3add122ec00 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -412,28 +412,23 @@ static int sof_ipc4_chain_dma_trigger(struct snd_sof_dev *sdev,
 }
 
 static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
-				      struct snd_pcm_substream *substream, int state, int cmd)
+				      struct snd_pcm_substream *substream, int state, int cmd,
+				      struct snd_sof_pcm *spcm, int dir)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_sof_pcm_stream_pipeline_list *pipeline_list;
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	struct ipc4_pipeline_set_state_data *trigger_list;
 	struct snd_sof_widget *pipe_widget;
 	struct sof_ipc4_pipeline *pipeline;
 	struct snd_sof_pipeline *spipe;
-	struct snd_sof_pcm *spcm;
 	u8 *pipe_priority;
 	int ret;
 	int i;
 
-	spcm = snd_sof_find_spcm_dai(component, rtd);
-	if (!spcm)
-		return -EINVAL;
+	spcm_dbg(spcm, dir, "cmd: %d, state: %d\n", cmd, state);
 
-	spcm_dbg(spcm, substream->stream, "cmd: %d, state: %d\n", cmd, state);
-
-	pipeline_list = &spcm->stream[substream->stream].pipeline_list;
+	pipeline_list = &spcm->stream[dir].pipeline_list;
 	guard(mutex)(&ipc4_data->pipeline_state_mutex);
 
 	/* nothing to trigger if the list is empty */
@@ -451,9 +446,9 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	if (pipeline->use_chain_dma) {
 		struct sof_ipc4_timestamp_info *time_info;
 
-		time_info = sof_ipc4_sps_to_time_info(&spcm->stream[substream->stream]);
+		time_info = sof_ipc4_sps_to_time_info(&spcm->stream[dir]);
 
-		ret = sof_ipc4_chain_dma_trigger(sdev, spcm, substream->stream,
+		ret = sof_ipc4_chain_dma_trigger(sdev, spcm, dir,
 						 pipeline_list, state, cmd);
 		if (ret || !time_info)
 			return ret;
@@ -462,12 +457,16 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 			/*
 			 * Record the DAI position for delay reporting
 			 * To handle multiple pause/resume/xrun we need to add
-			 * the positions to simulate how the firmware behaves
+			 * the positions to simulate how the firmware behaves.
+			 * Chained DMA does not support compress streams. We should
+			 * never get here with compress.
 			 */
-			u64 pos = snd_sof_pcm_get_dai_frame_counter(sdev, component,
-								    substream);
+			if (substream) {
+				u64 pos = snd_sof_pcm_get_dai_frame_counter(sdev, component,
+									    substream);
 
-			time_info->stream_end_offset += pos;
+				time_info->stream_end_offset += pos;
+			}
 		} else if (state == SOF_IPC4_PIPE_RESET) {
 			/* Reset the end offset as the stream is stopped */
 			time_info->stream_end_offset = 0;
@@ -526,7 +525,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	 */
 	ret = sof_ipc4_set_multi_pipeline_state(sdev, SOF_IPC4_PIPE_PAUSED, trigger_list);
 	if (ret < 0) {
-		spcm_err(spcm, substream->stream, "failed to pause all pipelines\n");
+		spcm_err(spcm, dir, "failed to pause all pipelines\n");
 		/*
 		 * workaround: if the firmware is crashed or the IPC timed out
 		 * while setting the pipeline state we must ignore the error
@@ -557,7 +556,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 		 * Invalidate the stream_start_offset to make sure that it is
 		 * going to be updated if the stream resumes
 		 */
-		time_info = sof_ipc4_sps_to_time_info(&spcm->stream[substream->stream]);
+		time_info = sof_ipc4_sps_to_time_info(&spcm->stream[dir]);
 		if (time_info)
 			time_info->stream_start_offset = SOF_IPC4_INVALID_STREAM_POSITION;
 
@@ -567,7 +566,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	/* else set the RUNNING/RESET state in the DSP */
 	ret = sof_ipc4_set_multi_pipeline_state(sdev, state, trigger_list);
 	if (ret < 0) {
-		spcm_err(spcm, substream->stream,
+		spcm_err(spcm, dir,
 			 "failed to set final state %d for all pipelines\n",
 			 state);
 		/*
@@ -598,7 +597,8 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 }
 
 static int sof_ipc4_pcm_trigger(struct snd_soc_component *component,
-				struct snd_pcm_substream *substream, int cmd)
+				struct snd_pcm_substream *substream,
+				struct snd_sof_pcm *spcm, int cmd, int dir)
 {
 	int state;
 
@@ -620,14 +620,15 @@ static int sof_ipc4_pcm_trigger(struct snd_soc_component *component,
 	}
 
 	/* set the pipeline state */
-	return sof_ipc4_trigger_pipelines(component, substream, state, cmd);
+	return sof_ipc4_trigger_pipelines(component, substream, state, cmd, spcm, dir);
 }
 
 static int sof_ipc4_pcm_hw_free(struct snd_soc_component *component,
-				struct snd_pcm_substream *substream)
+				struct snd_pcm_substream *substream,
+				struct snd_sof_pcm *spcm, int dir)
 {
 	/* command is not relevant with RESET, so just pass 0 */
-	return sof_ipc4_trigger_pipelines(component, substream, SOF_IPC4_PIPE_RESET, 0);
+	return sof_ipc4_trigger_pipelines(component, substream, SOF_IPC4_PIPE_RESET, 0, spcm, dir);
 }
 
 static int ipc4_ssp_dai_config_pcm_params_match(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 8f59c200b8ec..42738f12fa33 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -152,7 +152,7 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 	 * between. At least ALSA OSS emulation depends on this.
 	 */
 	if (spcm->prepared[substream->stream] && pcm_ops && pcm_ops->hw_free) {
-		ret = pcm_ops->hw_free(component, substream);
+		ret = pcm_ops->hw_free(component, substream, spcm, substream->stream);
 		if (ret < 0)
 			return ret;
 
@@ -223,7 +223,8 @@ static int sof_pcm_stream_free(struct snd_sof_dev *sdev,
 
 		/* free PCM in the DSP */
 		if (pcm_ops && pcm_ops->hw_free) {
-			ret = pcm_ops->hw_free(sdev->component, substream);
+			ret = pcm_ops->hw_free(sdev->component, substream, spcm,
+					       substream->stream);
 			if (ret < 0) {
 				spcm_err(spcm, substream->stream,
 					 "pcm_ops->hw_free failed %d\n", ret);
@@ -458,7 +459,7 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 		snd_sof_pcm_platform_trigger(sdev, substream, cmd);
 
 	if (pcm_ops && pcm_ops->trigger)
-		ret = pcm_ops->trigger(component, substream, cmd);
+		ret = pcm_ops->trigger(component, substream, spcm, cmd, substream->stream);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 1b3e66037584..0610f2ab844d 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -125,9 +125,10 @@ struct sof_ipc_pcm_ops {
 	int (*hw_params)(struct snd_soc_component *component, struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *params,
 			 struct snd_sof_platform_stream_params *platform_params);
-	int (*hw_free)(struct snd_soc_component *component, struct snd_pcm_substream *substream);
-	int (*trigger)(struct snd_soc_component *component,  struct snd_pcm_substream *substream,
-		       int cmd);
+	int (*hw_free)(struct snd_soc_component *component, struct snd_pcm_substream *substream,
+		       struct snd_sof_pcm *spcm, int dir);
+	int (*trigger)(struct snd_soc_component *component, struct snd_pcm_substream *substream,
+		       struct snd_sof_pcm *spcm, int cmd, int dir);
 	int (*dai_link_fixup)(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_params *params);
 	int (*pcm_setup)(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm);
 	void (*pcm_free)(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm);
-- 
2.55.0

