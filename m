Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9733EC2E1
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286834; cv=none; b=h9T228DT0EINwPe8CKb4osRmJXsfQKXRNFcfEDOSvkR5t3khCTHVEVn/5RJGGmesT2kdP9YveeXbimODOBEN0xDsgaMY4N0Mh9er7H73qROPe7IPmtbe3NN8L7oOX2mxfsbqmu4FX6RkXidXO4lq5halCtJCd1oxVWfssTtBBfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286834; c=relaxed/simple;
	bh=Pmyr+HC4XEMvb7dHMZNcd533gM/H77FfShLlC23q8fY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l+rh6CChj3gZnU9pRV/fxrSyEGqWn9alWP+uFN2kej/ox5H+ZkePT7d+Yv33WrhErQWmucitPUxiZkWngDILUdOvt29XRo7EYUxblCoVobz3y6q7RVnG/rzBt6aIkjIrnNpwBJrr4tNN6unEuV9JRQFgZ4TtcgqkjgmxPjzqdPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxn8KvZg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxn8KvZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779286831; x=1810822831;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Pmyr+HC4XEMvb7dHMZNcd533gM/H77FfShLlC23q8fY=;
  b=dxn8KvZgLlXjqlwcxiO1Km4Lm88QB97DDo41gmUqBg1VWkzcC06tIHeR
   iXQZvSdk/33Y7GKdZCxcFrkfhLtbroYTWrdFMvpvQFSnUU77dG5DYvuIl
   qw1PzOK7nAEneQYHhN9GTD1YciS40XKGKQeH0+4/TVzG1aSbj7M1aBAsg
   R9Hy93xfVqv5EivjIcrLhbsAiGGZN8xHGJtbeyBIpyZ+lINFlihw9eABa
   Vd5WkgmLIpDS4JSHHZ1kwN22neSG73zYPW4AJjlP5taLaAN6/Ko1YZWGH
   uhMHXZDsnGenHSNwz5djl4XZrBwnyc4BLPqY8HRyF0MiJm/Jvgsq3aZH1
   Q==;
X-CSE-ConnectionGUID: HSNY5//fRr68dRJ+cHNMOQ==
X-CSE-MsgGUID: Wu2khUj+TpSMzH7ss4piVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91578920"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="91578920"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 07:20:28 -0700
X-CSE-ConnectionGUID: YNcB7z+eSUebzPFHCGVpfg==
X-CSE-MsgGUID: wOUz75JwRbWCcx5n9lzIrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="242004555"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.85])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 07:20:26 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4-topology: Enable deep buffer capture
Date: Wed, 20 May 2026 17:20:37 +0300
Message-ID: <20260520142037.13476-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>

This patch lets a capture PCM to operate with deep buffer
by taking dsp_max_burst_size_in_ms from topology if it is
defined. Earlier the value from topology was omitted for
capture.

If not defined, the maximum burst size for capture is set
similarly as before to one millisecond.

The dma_buffer_size is set similarly as for playback from
largest of deep_buffer_dma_ms or SOF_IPC4_MIN_DMA_BUFFER_SIZE
times OBS.

Signed-off-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 39 +++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 76812d8fb567..65756fe3a64f 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -624,6 +624,7 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 	struct sof_ipc4_available_audio_format *available_fmt;
 	struct snd_soc_component *scomp = swidget->scomp;
 	struct sof_ipc4_copier *ipc4_copier;
+	struct snd_sof_pcm_stream *sps;
 	struct snd_sof_pcm *spcm;
 	int node_type = 0;
 	int ret, dir;
@@ -668,24 +669,23 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 	if (ret)
 		goto free_available_fmt;
 
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
-		struct snd_sof_pcm_stream *sps = &spcm->stream[dir];
+	sps = &spcm->stream[dir];
+	sof_update_ipc_object(scomp, &sps->dsp_max_burst_size_in_ms,
+			      SOF_COPIER_DEEP_BUFFER_TOKENS,
+			      swidget->tuples,
+			      swidget->num_tuples, sizeof(u32), 1);
 
-		sof_update_ipc_object(scomp, &sps->dsp_max_burst_size_in_ms,
-				      SOF_COPIER_DEEP_BUFFER_TOKENS,
-				      swidget->tuples,
-				      swidget->num_tuples, sizeof(u32), 1);
-		/* Set default DMA buffer size if it is not specified in topology */
-		if (!sps->dsp_max_burst_size_in_ms) {
-			struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
-			struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
+	/* Set default DMA buffer size if it is not specified in topology */
+	if (!sps->dsp_max_burst_size_in_ms) {
+		struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
+		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
 
+		if (dir == SNDRV_PCM_STREAM_PLAYBACK)
 			sps->dsp_max_burst_size_in_ms = pipeline->use_chain_dma ?
 				SOF_IPC4_CHAIN_DMA_BUFFER_SIZE : SOF_IPC4_MIN_DMA_BUFFER_SIZE;
-		}
-	} else {
-		/* Capture data is copied from DSP to host in 1ms bursts */
-		spcm->stream[dir].dsp_max_burst_size_in_ms = 1;
+		else
+			/* Capture data is copied from DSP to host in 1ms bursts */
+			sps->dsp_max_burst_size_in_ms = 1;
 	}
 
 skip_gtw_cfg:
@@ -2430,10 +2430,19 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			copier_data->gtw_cfg.dma_buffer_size);
 		break;
 	case snd_soc_dapm_dai_out:
-	case snd_soc_dapm_aif_out:
 		copier_data->gtw_cfg.dma_buffer_size =
 			SOF_IPC4_MIN_DMA_BUFFER_SIZE * copier_data->base_config.obs;
 		break;
+	case snd_soc_dapm_aif_out:
+		copier_data->gtw_cfg.dma_buffer_size =
+			max((u32)SOF_IPC4_MIN_DMA_BUFFER_SIZE, deep_buffer_dma_ms) *
+				copier_data->base_config.obs;
+		dev_dbg(sdev->dev, "copier %s, dma buffer%s: %u ms (%u bytes)",
+			swidget->widget->name,
+			deep_buffer_dma_ms ? " (using Deep Buffer)" : "",
+			max((u32)SOF_IPC4_MIN_DMA_BUFFER_SIZE, deep_buffer_dma_ms),
+			copier_data->gtw_cfg.dma_buffer_size);
+		break;
 	default:
 		break;
 	}
-- 
2.54.0

