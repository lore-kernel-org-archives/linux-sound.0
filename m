Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23465221733
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 10:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750328929; cv=none; b=ODRalZfcvRxzncJFNpKKAJruixqG0QxsJald+Haxs55j5ypC3SO5+scQVadUYxKcebqjSPfFW4XwygnG2yFyM7XMh3io3SGcHBvpUECXSed/sYJkdsVY+LeqFAsu8547pVCpqHUcwCOp8l//p4gAFUECujFT0v1mYy+jtRf7HbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750328929; c=relaxed/simple;
	bh=4qAYRLaR6AbaZEPCj/CrhhvDp+Imvlx4UaZD/RfCs9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CK0Xy1+YOCuzVIAIR+tjXsQ3NWsY+K1nzOoSR6fJGRN+TGx6Ld1ItjpYVPLAY9acOuduS5moyxcGZII1uqbpIgddRGjrhRlKOJAAn8aXT5qUqXg6koLy7/GtAjaui4wBQqLwlApvCrqB4lojhJ5usF+6YU5zevyIbvzNJW5dBpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eu1GfTYo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eu1GfTYo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750328928; x=1781864928;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4qAYRLaR6AbaZEPCj/CrhhvDp+Imvlx4UaZD/RfCs9E=;
  b=eu1GfTYoSU+x5/QiWKDN0yn/J0qmzf4U1kv11iUt7AjbVl6nrrWQPhw6
   TiWyr+ha+wsxG6znxnl6inJH3iWFj3q9mCFAxzqRQZm71qFtaBsKV48OC
   aUt/TbKWXuAOFl7/F4YULACtSyuMOgThdTvocJYfiViNkqIjSG9FiyjJ7
   BhGaLBG3ityESMXy4DCkk083XT0HNQlKDTM524O7FwDHFLiinCemqipKU
   CGZpA88nGWVvDIpdQ72QcdqH5zmoVcuK/9yOgO6kg0NATG0gTdQI/G22u
   Dco6rgDNzRGXgL/JsPREayq70SeBGv9ZnUU2O8714Iml2glPB47vB5toS
   w==;
X-CSE-ConnectionGUID: aquITPRHRkmLsMXSwtwSnQ==
X-CSE-MsgGUID: YnW8h/apSla8yT3Vw4hSKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63618742"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="63618742"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:28:47 -0700
X-CSE-ConnectionGUID: 6tuujLUkR+CVBN/Y2+PxfQ==
X-CSE-MsgGUID: xJ6joWosTJKx12BODkBbSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="151277947"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.182])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:28:44 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH] ASoC: SOF: ipc4-pcm: Enable delay reporting for ChainDMA streams
Date: Thu, 19 Jun 2025 13:28:48 +0300
Message-ID: <20250619102848.12389-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All streams (currently) which is configured to use ChainDMA can only work
on Link/host DMA pairs where the link side position can be access via host
registers (like HDA on CAVS 2.5 platforms).

Since the firmware does not provide time_info for ChainDMA, unlike for HDA
stream, the kernel should calculate the start and end offsets that is
needed for the delay calculation.

With this small change we can report accurate delays when the stream is
configured to use ChainDMA.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c      | 49 ++++++++++++++++++++++++++++++++---
 sound/soc/sof/ipc4-topology.c |  6 ++---
 sound/soc/sof/ipc4-topology.h |  1 +
 3 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 8eee3e1aadf9..77d74ce37f91 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -409,9 +409,33 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	 * If use_chain_dma attribute is set we proceed to chained DMA
 	 * trigger function that handles the rest for the substream.
 	 */
-	if (pipeline->use_chain_dma)
-		return sof_ipc4_chain_dma_trigger(sdev, spcm, substream->stream,
-						  pipeline_list, state, cmd);
+	if (pipeline->use_chain_dma) {
+		struct sof_ipc4_timestamp_info *time_info;
+
+		time_info = sof_ipc4_sps_to_time_info(&spcm->stream[substream->stream]);
+
+		ret = sof_ipc4_chain_dma_trigger(sdev, spcm, substream->stream,
+						 pipeline_list, state, cmd);
+		if (ret || !time_info)
+			return ret;
+
+		if (state == SOF_IPC4_PIPE_PAUSED) {
+			/*
+			 * Record the DAI position for delay reporting
+			 * To handle multiple pause/resume/xrun we need to add
+			 * the positions to simulate how the firmware behaves
+			 */
+			u64 pos = snd_sof_pcm_get_dai_frame_counter(sdev, component,
+								    substream);
+
+			time_info->stream_end_offset += pos;
+		} else if (state == SOF_IPC4_PIPE_RESET) {
+			/* Reset the end offset as the stream is stopped */
+			time_info->stream_end_offset = 0;
+		}
+
+		return 0;
+	}
 
 	/* allocate memory for the pipeline data */
 	trigger_list = kzalloc(struct_size(trigger_list, pipeline_instance_ids,
@@ -928,8 +952,24 @@ static int sof_ipc4_get_stream_start_offset(struct snd_sof_dev *sdev,
 	if (!host_copier || !dai_copier)
 		return -EINVAL;
 
-	if (host_copier->data.gtw_cfg.node_id == SOF_IPC4_INVALID_NODE_ID)
+	if (host_copier->data.gtw_cfg.node_id == SOF_IPC4_INVALID_NODE_ID) {
 		return -EINVAL;
+	} else if (host_copier->data.gtw_cfg.node_id == SOF_IPC4_CHAIN_DMA_NODE_ID) {
+		/*
+		 * While the firmware does not supports time_info reporting for
+		 * streams using ChainDMA, it is granted that ChainDMA can only
+		 * be used on Host+Link pairs where the link position is
+		 * accessible from the host side.
+		 *
+		 * Enable delay calculation in case of ChainDMA via host
+		 * accessible registers.
+		 *
+		 * The ChainDMA uses 2x 1ms ping-pong buffer, dai side starts
+		 * when 1ms data is available
+		 */
+		time_info->stream_start_offset = substream->runtime->rate / MSEC_PER_SEC;
+		goto out;
+	}
 
 	node_index = SOF_IPC4_NODE_INDEX(host_copier->data.gtw_cfg.node_id);
 	offset = offsetof(struct sof_ipc4_fw_registers, pipeline_regs) + node_index * sizeof(ppl_reg);
@@ -947,6 +987,7 @@ static int sof_ipc4_get_stream_start_offset(struct snd_sof_dev *sdev,
 	time_info->stream_end_offset = ppl_reg.stream_end_offset;
 	do_div(time_info->stream_end_offset, dai_sample_size);
 
+out:
 	/*
 	 * Calculate the wrap boundary need to be used for delay calculation
 	 * The host counter is in bytes, it will wrap earlier than the frames
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 540ba140e155..a4ab25909a2f 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1873,10 +1873,10 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			pipeline->msg.extension |= SOF_IPC4_GLB_EXT_CHAIN_DMA_FIFO_SIZE(fifo_size);
 
 			/*
-			 * Chain DMA does not support stream timestamping, set node_id to invalid
-			 * to skip the code in sof_ipc4_get_stream_start_offset().
+			 * Chain DMA does not support stream timestamping, but it
+			 * can use the host side registers for delay calculation.
 			 */
-			copier_data->gtw_cfg.node_id = SOF_IPC4_INVALID_NODE_ID;
+			copier_data->gtw_cfg.node_id = SOF_IPC4_CHAIN_DMA_NODE_ID;
 
 			return 0;
 		}
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index f4dc499c0ffe..ea1f8dd44733 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -58,6 +58,7 @@
 
 #define SOF_IPC4_DMA_DEVICE_MAX_COUNT 16
 
+#define SOF_IPC4_CHAIN_DMA_NODE_ID	0x7fffffff
 #define SOF_IPC4_INVALID_NODE_ID	0xffffffff
 
 /* FW requires minimum 2ms DMA buffer size */
-- 
2.49.0

