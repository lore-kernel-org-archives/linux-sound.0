Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2093B27F7
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 09:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945005; cv=none; b=ETfifXT2zOHsUoAdMKZx2LXlTUnIb5/PC8nxfRDmrsKGF0cFzQQa9piQCkX9Db1/SadZcHADeswenIGXOrPm5hHPhJ9eV1BsrlkgBi+9gMDUTJsRp5TQxsRMj8FxrRibweb/0OQFjb5ynsVuq86TbQBuksMqR9kCiYCfiqb9V54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945005; c=relaxed/simple;
	bh=hoHYnnt6yrnVks9VhSTID72YWNFOfMc6ZpW1FhkU99I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J3kFYaAKeH4ThQKMXG/z9WBzg+M7rUkwZ54/hX9X02AvPQppJ9e9YoqnEDO3y7c9fDSAnoLuyd+FhnFJKB2ukz8ReeyGnR+Dq5oE4fKlkX7vEi07WT52/S1E2tE1hupLxUlWqzW8bLBd9PR2thm3F1awTORUp/QqDOsJ90GGh2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0LeiUAu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0LeiUAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788945005; x=1820481005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hoHYnnt6yrnVks9VhSTID72YWNFOfMc6ZpW1FhkU99I=;
  b=O0LeiUAuO120D0R0kWPuv7wCCW+dvu4kdHf0jJofZB9V/Z9U0cqOoe29
   PhWQ4rr3o+utdebenH6B0GhPESv+iC9nOo071SDAOH7dftXxpG/Aii1sN
   uNLy1rtxAOFbOms7Ab7fvy6LgwHXXFokQdck5squKUXa8F+KtvHr5gvZb
   fT9+a57oclbcK7xRTAibPtCXmo+yl1SZsNMmDy/Kdw0XWS33h2Cl4+ryG
   z/Jz1TcxCePyE8yU+hmfZMo1BBPvS7FGU/YddBsBhocA+Jt12eaIJHSOq
   skt7z0TdY0i3XLL3Isr0YDWgbSwpfgmdIsGotl7FQFsuC8SxukuklDTls
   A==;
X-CSE-ConnectionGUID: IQ+yzyGlTPWzjpQ/CzC/1g==
X-CSE-MsgGUID: m2gZNC3wSSO0DXMuyQjKmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89200668"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89200668"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:05 -0700
X-CSE-ConnectionGUID: /f7bVxVaRemhFj5onJ00DQ==
X-CSE-MsgGUID: ldNbgIqiQfWIc9Vj6ntV+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266972921"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.252])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:01 -0700
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
Subject: [PATCH v2 08/24] ASoC: SOF: ipc4-pcm: harden pipeline teardown races
Date: Wed,  9 Sep 2026 12:09:33 +0300
Message-ID: <20260909090949.7503-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Serialize trigger/free with pipeline_state_mutex and validate
pipeline entries before use.

Also clear pipeline_list->count when freeing lists to avoid stale
entries during concurrent teardown.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 5929ecf6642e..9d4be9ef4403 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -434,12 +434,16 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	spcm_dbg(spcm, substream->stream, "cmd: %d, state: %d\n", cmd, state);
 
 	pipeline_list = &spcm->stream[substream->stream].pipeline_list;
+	guard(mutex)(&ipc4_data->pipeline_state_mutex);
 
 	/* nothing to trigger if the list is empty */
 	if (!pipeline_list->pipelines || !pipeline_list->count)
 		return 0;
 
 	spipe = pipeline_list->pipelines[0];
+	if (!spipe || !spipe->pipe_widget || !spipe->pipe_widget->private)
+		return 0;
+
 	pipe_widget = spipe->pipe_widget;
 	pipeline = pipe_widget->private;
 
@@ -487,8 +491,6 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 		return -ENOMEM;
 	}
 
-	guard(mutex)(&ipc4_data->pipeline_state_mutex);
-
 	/*
 	 * IPC4 requires pipelines to be triggered in order starting at the sink and
 	 * walking all the way to the source. So traverse the pipeline_list in the order
@@ -501,12 +503,16 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	if (state == SOF_IPC4_PIPE_RUNNING || state == SOF_IPC4_PIPE_RESET)
 		for (i = pipeline_list->count - 1; i >= 0; i--) {
 			spipe = pipeline_list->pipelines[i];
+			if (!spipe || !spipe->pipe_widget || !spipe->pipe_widget->private)
+				continue;
 			sof_ipc4_add_pipeline_to_trigger_list(sdev, state, spipe, trigger_list,
 							      pipe_priority);
 		}
 	else
 		for (i = 0; i < pipeline_list->count; i++) {
 			spipe = pipeline_list->pipelines[i];
+			if (!spipe || !spipe->pipe_widget || !spipe->pipe_widget->private)
+				continue;
 			sof_ipc4_add_pipeline_to_trigger_list(sdev, state, spipe, trigger_list,
 							      pipe_priority);
 		}
@@ -546,6 +552,8 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	/* update PAUSED state for all pipelines just triggered */
 	for (i = 0; i < pipeline_list->count ; i++) {
 		spipe = pipeline_list->pipelines[i];
+		if (!spipe || !spipe->pipe_widget || !spipe->pipe_widget->private)
+			continue;
 		sof_ipc4_update_pipeline_state(sdev, SOF_IPC4_PIPE_PAUSED, cmd, spipe,
 					       trigger_list);
 	}
@@ -589,6 +597,8 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	/* update RUNNING/RESET state for all pipelines that were just triggered */
 	for (i = 0; i < pipeline_list->count; i++) {
 		spipe = pipeline_list->pipelines[i];
+		if (!spipe || !spipe->pipe_widget || !spipe->pipe_widget->private)
+			continue;
 		sof_ipc4_update_pipeline_state(sdev, state, cmd, spipe, trigger_list);
 	}
 
@@ -903,13 +913,17 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 static void sof_ipc4_pcm_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm)
 {
 	struct snd_sof_pcm_stream_pipeline_list *pipeline_list;
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	struct sof_ipc4_pcm_stream_priv *stream_priv;
 	int stream;
 
+	guard(mutex)(&ipc4_data->pipeline_state_mutex);
+
 	for_each_pcm_streams(stream) {
 		pipeline_list = &spcm->stream[stream].pipeline_list;
 		kfree(pipeline_list->pipelines);
 		pipeline_list->pipelines = NULL;
+		pipeline_list->count = 0;
 
 		stream_priv = spcm->stream[stream].private;
 		kfree(stream_priv->time_info);
-- 
2.55.0

