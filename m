Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2211985635
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 11:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712660446; cv=none; b=jKZkCqfICeD3l0wU5iD2TMZrEvdLDapIjBuTp2lnayFg+bj+tqyY7rd1+H7iTM5ofydxiRrW1MvFG8phsnCQzVNvGktLK0gR7mORf8HOs9xRngOgEMfdmZMGYd+o/c90MIhxbmL3dRhQnk+w6/tq/DjSguLjUESaA24kk568CWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712660446; c=relaxed/simple;
	bh=76azb6uJWBmgaHB1RTIeKZ5K+4v5ZGJmshHJdsTf/o8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GXXNLnPlEKu2j+BJkQtVxgkoJ1bLM+rXN9KbfDWm1BWq1EwotqGXGU+qiPVt+XevUeydDpLDBxD24eeuIpwBB/G2SbVrKymZ1oGXWDAkoFXwamt3W4ccuK1yRYqUObGJrEhmB07WbSSgKSc+RSRjA6mkUsjv42jhqhJ6DUAEzMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QmknvgeY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QmknvgeY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712660445; x=1744196445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=76azb6uJWBmgaHB1RTIeKZ5K+4v5ZGJmshHJdsTf/o8=;
  b=QmknvgeY2WOPHeeZrVvtkdBICvPkT32ZKuUm+5P47xjIhDjRkaRLLhY9
   abBfR7x1h6rDJgzRIT7jWTLzDpH5cQOOp5Oay3AzsO87XhfJWVsmT4/pN
   WAsTwUqpVGNRboO0rAU9d5MunpUXIiLSy+aax/b6cDmPGOD+TiKw0trlr
   5PuVPDR8Py9j1hCzrHIFhhKCb1A/rU37BEdDw+Tz66MBIzrOUo0iK+Vk8
   cqzI+90CNwl6BvobDml/BhqGb4zralCSYDRBmZQd3rWd7rKPee7ETTNV/
   ZDHsL5pi0P7A0lN6fYWz1glbMNI2htFTuBfXmb8dFSCg7rk2l1ge2IO1m
   w==;
X-CSE-ConnectionGUID: 9dGpEbWmStSKIVFlwYxwZw==
X-CSE-MsgGUID: S6WFAEc0QDC8EjhRTb4m5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7813010"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7813010"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:00:45 -0700
X-CSE-ConnectionGUID: ifLqex9vRlac/uOPgmyMFA==
X-CSE-MsgGUID: 7VY+JUfWTveT7kSpcGsCmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20309775"
Received: from dpotapen-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.59.81])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:00:43 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 2/4] ASoC: SOF: ipc4-pcm: Use consistent name for sof_ipc4_timestamp_info pointer
Date: Tue,  9 Apr 2024 14:00:34 +0300
Message-ID: <20240409110036.9411-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409110036.9411-1-peter.ujfalusi@linux.intel.com>
References: <20240409110036.9411-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pointer to sof_ipc4_timestamp_info named most of the time as
'time_info' only to be named as 'stream_info' or 'info' in two function.

Use the consistent name of 'time_info' throughout the file.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index f989cc2992bf..74b0d0d00270 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -721,7 +721,7 @@ static int sof_ipc4_pcm_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm
 {
 	struct snd_sof_pcm_stream_pipeline_list *pipeline_list;
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
-	struct sof_ipc4_timestamp_info *stream_info;
+	struct sof_ipc4_timestamp_info *time_info;
 	bool support_info = true;
 	u32 abi_version;
 	u32 abi_offset;
@@ -752,13 +752,13 @@ static int sof_ipc4_pcm_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm
 		if (!support_info)
 			continue;
 
-		stream_info = kzalloc(sizeof(*stream_info), GFP_KERNEL);
-		if (!stream_info) {
+		time_info = kzalloc(sizeof(*time_info), GFP_KERNEL);
+		if (!time_info) {
 			sof_ipc4_pcm_free(sdev, spcm);
 			return -ENOMEM;
 		}
 
-		spcm->stream[stream].private = stream_info;
+		spcm->stream[stream].private = time_info;
 	}
 
 	return 0;
@@ -769,7 +769,7 @@ static void sof_ipc4_build_time_info(struct snd_sof_dev *sdev, struct snd_sof_pc
 	struct sof_ipc4_copier *host_copier = NULL;
 	struct sof_ipc4_copier *dai_copier = NULL;
 	struct sof_ipc4_llp_reading_slot llp_slot;
-	struct sof_ipc4_timestamp_info *info;
+	struct sof_ipc4_timestamp_info *time_info;
 	struct snd_soc_dapm_widget *widget;
 	struct snd_sof_dai *dai;
 	int i;
@@ -795,44 +795,44 @@ static void sof_ipc4_build_time_info(struct snd_sof_dev *sdev, struct snd_sof_pc
 		return;
 	}
 
-	info = sps->private;
-	info->host_copier = host_copier;
-	info->dai_copier = dai_copier;
-	info->llp_offset = offsetof(struct sof_ipc4_fw_registers, llp_gpdma_reading_slots) +
-				    sdev->fw_info_box.offset;
+	time_info = sps->private;
+	time_info->host_copier = host_copier;
+	time_info->dai_copier = dai_copier;
+	time_info->llp_offset = offsetof(struct sof_ipc4_fw_registers,
+					 llp_gpdma_reading_slots) + sdev->fw_info_box.offset;
 
 	/* find llp slot used by current dai */
 	for (i = 0; i < SOF_IPC4_MAX_LLP_GPDMA_READING_SLOTS; i++) {
-		sof_mailbox_read(sdev, info->llp_offset, &llp_slot, sizeof(llp_slot));
+		sof_mailbox_read(sdev, time_info->llp_offset, &llp_slot, sizeof(llp_slot));
 		if (llp_slot.node_id == dai_copier->data.gtw_cfg.node_id)
 			break;
 
-		info->llp_offset += sizeof(llp_slot);
+		time_info->llp_offset += sizeof(llp_slot);
 	}
 
 	if (i < SOF_IPC4_MAX_LLP_GPDMA_READING_SLOTS)
 		return;
 
 	/* if no llp gpdma slot is used, check aggregated sdw slot */
-	info->llp_offset = offsetof(struct sof_ipc4_fw_registers, llp_sndw_reading_slots) +
-					sdev->fw_info_box.offset;
+	time_info->llp_offset = offsetof(struct sof_ipc4_fw_registers,
+					 llp_sndw_reading_slots) + sdev->fw_info_box.offset;
 	for (i = 0; i < SOF_IPC4_MAX_LLP_SNDW_READING_SLOTS; i++) {
-		sof_mailbox_read(sdev, info->llp_offset, &llp_slot, sizeof(llp_slot));
+		sof_mailbox_read(sdev, time_info->llp_offset, &llp_slot, sizeof(llp_slot));
 		if (llp_slot.node_id == dai_copier->data.gtw_cfg.node_id)
 			break;
 
-		info->llp_offset += sizeof(llp_slot);
+		time_info->llp_offset += sizeof(llp_slot);
 	}
 
 	if (i < SOF_IPC4_MAX_LLP_SNDW_READING_SLOTS)
 		return;
 
 	/* check EVAD slot */
-	info->llp_offset = offsetof(struct sof_ipc4_fw_registers, llp_evad_reading_slot) +
-					sdev->fw_info_box.offset;
-	sof_mailbox_read(sdev, info->llp_offset, &llp_slot, sizeof(llp_slot));
+	time_info->llp_offset = offsetof(struct sof_ipc4_fw_registers,
+					 llp_evad_reading_slot) + sdev->fw_info_box.offset;
+	sof_mailbox_read(sdev, time_info->llp_offset, &llp_slot, sizeof(llp_slot));
 	if (llp_slot.node_id != dai_copier->data.gtw_cfg.node_id)
-		info->llp_offset = 0;
+		time_info->llp_offset = 0;
 }
 
 static int sof_ipc4_pcm_hw_params(struct snd_soc_component *component,
-- 
2.44.0

