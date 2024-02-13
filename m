Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255EC24205
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 10:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707819175; cv=none; b=IU3h9K/VSybWghrzRcLXiP+Uu1DpEuWIxyWrWomh6Eerdf6kSV7v/4q2kNaASzJ/uNW3Zy4i5blt5yhX4MvUHKMC1kILvtiBNSWMr0P7wTPXxhzUjUh4qa8QBNWFxk8EO7un8N2PQUANU6O1o0JpNtvBu7ZQq95V9OlRbeoCwC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707819175; c=relaxed/simple;
	bh=Wbp7AzQJ/Ydx2xMZDIxuoxDQjFFqmkQ0A0B3Cxao/7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WttkX6NZxYcq7oey1nwo+Q3WdosvQuVrFBjG9hIiZNhnxhzRsDu46LSuZ8SYBuLfLKlOJefCtedISU1g5VAb89+fhoNlV1WxsYGhx3k55BoXxY+6LvFVZEznZAS26QgeBYzdlPludy5SZjsKtyO7ZPxyH5mvAGoxPjq6fR6Yjno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFBNSHtk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFBNSHtk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707819174; x=1739355174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wbp7AzQJ/Ydx2xMZDIxuoxDQjFFqmkQ0A0B3Cxao/7I=;
  b=TFBNSHtkfoZw66UN1OUHiXl5zmhRK6Qarp7t7/qZSRd+2Z/eH38Sp30b
   rPEXn7XKcGCV33IDnHGfa9fEmCX99AXtdUgsRW4NCsZ0PVq47WUbh2SVV
   BCzQoMxfLzY2+gOHthxGD0xUds2jYfNhr4gSPPGnYT9decE0HnsQDiYNQ
   XL6UWYe/3ooZ/i0KP2NOj9AGDI2Kq3C6xn3CEni/aKEd/cBQYah50L6vq
   xYfEXm4jilY3bu6/atTskd99EqXz7Ug9rKRSYkCOxzPQbd/fGi+LOrgzZ
   S3E8BnVSgqgJIbKz+nVe53GlpWXa416k3U+u75mGcvPRbhFhnxbF64yg1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27260169"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="27260169"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:12:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7498044"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:12:52 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 06/15] ASoC: SOF: ipc4-pcm: fix dma_id for CHAIN_DMA capture
Date: Tue, 13 Feb 2024 12:12:38 +0200
Message-ID: <20240213101247.28887-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
References: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The existing code uses (stream_tag - 1) for the host and link dma id.

This is correct for playback, but for capture this results in an
invalid dma_type being used. The firmware assumes that the dma_id for
capture is always larger than DAI_NUM_HDA_OUT

This patch adds the offset for num_playback_streams, filled on Intel
platforms with the value extracted from the hardware capabilities.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 85d3f390e4b2..035c44ce6c9d 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -231,9 +231,11 @@ sof_ipc4_update_pipeline_state(struct snd_sof_dev *sdev, int state, int cmd,
  */
 
 static int sof_ipc4_chain_dma_trigger(struct snd_sof_dev *sdev,
+				      int direction,
 				      struct snd_sof_pcm_stream_pipeline_list *pipeline_list,
 				      int state, int cmd)
 {
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	bool allocate, enable, set_fifo_size;
 	struct sof_ipc4_msg msg = {{ 0 }};
 	int i;
@@ -294,6 +296,20 @@ static int sof_ipc4_chain_dma_trigger(struct snd_sof_dev *sdev,
 			msg.extension |= pipeline->msg.extension;
 	}
 
+	if (direction == SNDRV_PCM_STREAM_CAPTURE) {
+		/*
+		 * For ChainDMA the DMA ids are unique with the following mapping:
+		 * playback:  0 - (num_playback_streams - 1)
+		 * capture:   num_playback_streams - (num_playback_streams +
+		 *				      num_capture_streams - 1)
+		 *
+		 * Add the num_playback_streams offset to the DMA ids stored in
+		 * msg.primary in case capture
+		 */
+		msg.primary +=  SOF_IPC4_GLB_CHAIN_DMA_HOST_ID(ipc4_data->num_playback_streams);
+		msg.primary +=  SOF_IPC4_GLB_CHAIN_DMA_LINK_ID(ipc4_data->num_playback_streams);
+	}
+
 	if (allocate)
 		msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_ALLOCATE_MASK;
 
@@ -340,7 +356,8 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	 * trigger function that handles the rest for the substream.
 	 */
 	if (pipeline->use_chain_dma)
-		return sof_ipc4_chain_dma_trigger(sdev, pipeline_list, state, cmd);
+		return sof_ipc4_chain_dma_trigger(sdev, substream->stream,
+						  pipeline_list, state, cmd);
 
 	/* allocate memory for the pipeline data */
 	trigger_list = kzalloc(struct_size(trigger_list, pipeline_instance_ids,
-- 
2.43.0

