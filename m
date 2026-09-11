Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EC945C6E0
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125778; cv=none; b=thhW4mzaXkyl/+67ZxFXU688UiuQTcpWq2FiteTWYv5DTid90xvQoOn2M5XdqQLaWuZgn4JhwvFKWFU3i3gUde3Wl+bcqNhS3Adafh+87NhhUzKibhJMqwL6aIahepV3v6AmoFRmPv0fkPdAmJIU68viFiKzf/G3+QuULEIkxio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125778; c=relaxed/simple;
	bh=Vu3G2wBoXCcfYpsqo9X4SmxToQP5leDqLV2DrQgeKXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pyzMJ4KwMrOiwBj+oyvglQ4CfR/xOlSsNJVS+tKiowcbZsKohtjhpdxVhl/AYH0Fzx7/9Qwgge0u3yTE3r+Hp5NkP/5s8wxWFMIecfiDr8AjtYkzG2ytsVQT43zJxMgM335reblQVMIvJ1BR9oItp2Z9J99C970+B/9QmZoAsmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZnUg9FjR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZnUg9FjR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125751; x=1820661751;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vu3G2wBoXCcfYpsqo9X4SmxToQP5leDqLV2DrQgeKXg=;
  b=ZnUg9FjRts0Jk9N2NQFshPj5L53wmUYGPMrCheZ/X0IqizfNurnNTeJS
   RCW+/7sf//uO5B8567Qol2134+qNKi2Pv6vPC01L9ZeAooEvxFVEfUv6C
   ol/6YRVMHdftcg6SKD9cfM9UrJhgh9l1BLoteWfrwVIjmcX1kt9SeXagB
   v6DL+v5cbkqORFNFRVqq3YH545fCPIbfKjaGkhDJDgtanDfG+jHvxjA6a
   5fDNRCE7RLV5AGAVlMhB6XulYY+A7XEEpfLo1eceO2h/PaVlV1J62/HUZ
   9Tzp4WgSkDcwQlOuQ1ALZ+PKFaRopJeOevIYQGMee/lJYXA3zRC+RwFmL
   Q==;
X-CSE-ConnectionGUID: MSquouEgR5WcWZ9E1Onn9w==
X-CSE-MsgGUID: mqbF92npSOuu96gN7+3vxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100749954"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100749954"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:14 -0700
X-CSE-ConnectionGUID: bSlKrU5FSGymclge71uOmA==
X-CSE-MsgGUID: EtER6M/GRk6PIF4Zh1PtPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213308"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:11 -0700
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
Subject: [PATCH v3 10/26] ASoC: SOF: ipc4-pcm: Serialize the PCM free with the pipeline triggers
Date: Fri, 11 Sep 2026 14:21:36 +0300
Message-ID: <20260911112152.28528-11-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sof_ipc4_pcm_free() frees the array of the pipelines to be triggered
without any serialization against sof_ipc4_trigger_pipelines(), which
walks the very same array. The trigger took the pipeline_state_mutex
only after it fetched the first pipeline from the list, so a PCM free
running in parallel - on unbind or topology removal - can free the array
from under it.

Take the pipeline_state_mutex in sof_ipc4_pcm_free() and move the guard
in sof_ipc4_trigger_pipelines() before the first access to the pipeline
list. Clear the count of the freed list as well, so that a trigger which
was waiting for the mutex sees an empty list and returns.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 5929ecf6642e..d2a6c569845c 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -434,6 +434,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	spcm_dbg(spcm, substream->stream, "cmd: %d, state: %d\n", cmd, state);
 
 	pipeline_list = &spcm->stream[substream->stream].pipeline_list;
+	guard(mutex)(&ipc4_data->pipeline_state_mutex);
 
 	/* nothing to trigger if the list is empty */
 	if (!pipeline_list->pipelines || !pipeline_list->count)
@@ -487,8 +488,6 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 		return -ENOMEM;
 	}
 
-	guard(mutex)(&ipc4_data->pipeline_state_mutex);
-
 	/*
 	 * IPC4 requires pipelines to be triggered in order starting at the sink and
 	 * walking all the way to the source. So traverse the pipeline_list in the order
@@ -903,13 +902,17 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
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

