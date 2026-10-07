Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1F044A406
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363033; cv=none; b=ZfL7uj/C25F2YPxE2zB/JKaJHJ2g7ehC0sDVV238FNavyP193wBSv4QPSMiBA2sshxC1I3j8u4X7/Bg3KjvZ6Xv6tO/pUaaQ+7XvaCoYabROuPZNJcoOlO8qGsaJ5iuLSQUm0HMMbKhrM/fCGpr4ACWMOLlwLpmaJ5x4h/iD91s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363033; c=relaxed/simple;
	bh=yTB57VJzD5nhsrnn2/kQdXiY7mUresFg7hbIIhff3Fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FFXOQW5gu8FShSan4yGq3EoVfY/WDWe4W7QIox/JeGj40nOVh9LZK1jqniflg9Y5VM82jwHTDRGxW/bXUCgpvqsKaZ2vakCObIhMjRln/FJQD0fY1Wai1+sO4veh7XavXvjo+liLp1598wIduM1S35H8YV3IDsgOuLm/0kjZA5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHaODb0L; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHaODb0L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791363032; x=1822899032;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yTB57VJzD5nhsrnn2/kQdXiY7mUresFg7hbIIhff3Fo=;
  b=ZHaODb0LryhM7ysgJTWcFLp1PEsyZQuRspuwgMEadUx5sh70WnpAT2Hu
   TOffZoF/GuTqjWNvKq5FaoRAUoDQzmIaenxGYJ0IBBHgNJCDotkBEASEw
   kEEiPjjcZUdkV+3fIIt+hmAI7c8Q8ibmp6EPjnB7ZEmLUEpodBNk13J4U
   M8L3brv3UePFoDa66rofP+Xm2BXaiWF1nGwnUDgFlnNIucULGFSLEfP+Q
   ChEwLRP36Im+VQsGwB6t8qwTUYR2fhxheaUnv4h8OaPaQHuk5PzacCE5O
   qXHoxeY/wk6FZnDTaneTQe506T9P4U5UFAAvXmYMLdrsYQn/T+jAY5iKr
   Q==;
X-CSE-ConnectionGUID: 2GYu9KK5TXSrN13gUWURCQ==
X-CSE-MsgGUID: dc8lxfRkSaK+Q45p/VF6qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="114006"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="114006"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:32 -0700
X-CSE-ConnectionGUID: wtKzd78bQ22nlfIve+pX0A==
X-CSE-MsgGUID: dIvIxg7DTI2Nb1/Seifnhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670774"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:29 -0700
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
Subject: [PATCH v5 18/28] ASoC: SOF: ipc4-pcm: Make the timestamp info usable outside of ipc4-pcm.c
Date: Wed,  7 Oct 2026 11:49:45 +0300
Message-ID: <20261007084955.1256-19-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
References: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The support for compressed stream will also need to have access to the
same information which is used for delay reporting for DAI data
progression tracking.

Make the necessary struct and functions to be available and premare them to
be called without a valid substream.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/ipc4-pcm.c  | 40 +++++++++------------------------------
 sound/soc/sof/ipc4-priv.h | 31 ++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 31 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index d3add122ec00..c565e0e12949 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -15,29 +15,6 @@
 #include "ipc4-topology.h"
 #include "ipc4-fw-reg.h"
 
-/**
- * struct sof_ipc4_timestamp_info - IPC4 timestamp info
- * @host_copier: the host copier of the pcm stream
- * @dai_copier: the dai copier of the pcm stream
- * @stream_start_offset: reported by fw in memory window (converted to
- *                       frames at host_copier sampling rate)
- * @stream_end_offset: reported by fw in memory window (converted to
- *                     frames at host_copier sampling rate)
- * @llp_offset: llp offset in memory window
- * @delay: Calculated and stored in pointer callback. The stored value is
- *         returned in the delay callback. Expressed in frames at host copier
- *         sampling rate.
- */
-struct sof_ipc4_timestamp_info {
-	struct sof_ipc4_copier *host_copier;
-	struct sof_ipc4_copier *dai_copier;
-	u64 stream_start_offset;
-	u64 stream_end_offset;
-	u32 llp_offset;
-
-	snd_pcm_sframes_t delay;
-};
-
 /**
  * struct sof_ipc4_pcm_stream_priv - IPC4 specific private data
  * @time_info: pointer to time info struct if it is supported, otherwise NULL
@@ -61,7 +38,7 @@ struct sof_ipc4_pcm_stream_priv {
 
 #define DELAY_MAX		(DELAY_BOUNDARY >> 1)
 
-static inline struct sof_ipc4_timestamp_info *
+struct sof_ipc4_timestamp_info *
 sof_ipc4_sps_to_time_info(struct snd_sof_pcm_stream *sps)
 {
 	struct sof_ipc4_pcm_stream_priv *stream_priv = sps->private;
@@ -979,7 +956,7 @@ static int sof_ipc4_pcm_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm
 	return 0;
 }
 
-static void sof_ipc4_build_time_info(struct snd_sof_dev *sdev, struct snd_sof_pcm_stream *sps)
+void sof_ipc4_build_time_info(struct snd_sof_dev *sdev, struct snd_sof_pcm_stream *sps)
 {
 	struct sof_ipc4_copier *host_copier = NULL;
 	struct sof_ipc4_copier *dai_copier = NULL;
@@ -1077,7 +1054,7 @@ static int sof_ipc4_pcm_hw_params(struct snd_soc_component *component,
 	return 0;
 }
 
-static u64 sof_ipc4_frames_dai_to_host(struct sof_ipc4_timestamp_info *time_info, u64 value)
+u64 sof_ipc4_frames_dai_to_host(struct sof_ipc4_timestamp_info *time_info, u64 value)
 {
 	u64 dai_rate, host_rate;
 
@@ -1106,10 +1083,10 @@ static u64 sof_ipc4_frames_dai_to_host(struct sof_ipc4_timestamp_info *time_info
 	return value;
 }
 
-static int sof_ipc4_get_stream_start_offset(struct snd_sof_dev *sdev,
-					    struct snd_pcm_substream *substream,
-					    struct snd_sof_pcm_stream *sps,
-					    struct sof_ipc4_timestamp_info *time_info)
+int sof_ipc4_get_stream_start_offset(struct snd_sof_dev *sdev,
+				     struct snd_pcm_substream *substream,
+				     struct snd_sof_pcm_stream *sps,
+				     struct sof_ipc4_timestamp_info *time_info)
 {
 	struct sof_ipc4_copier *host_copier = time_info->host_copier;
 	struct sof_ipc4_copier *dai_copier = time_info->dai_copier;
@@ -1123,7 +1100,8 @@ static int sof_ipc4_get_stream_start_offset(struct snd_sof_dev *sdev,
 
 	if (host_copier->data.gtw_cfg.node_id == SOF_IPC4_INVALID_NODE_ID) {
 		return -EINVAL;
-	} else if (host_copier->data.gtw_cfg.node_id == SOF_IPC4_CHAIN_DMA_NODE_ID) {
+	} else if (substream &&
+		   host_copier->data.gtw_cfg.node_id == SOF_IPC4_CHAIN_DMA_NODE_ID) {
 		/*
 		 * While the firmware does not support time_info reporting for
 		 * streams using ChainDMA, it is granted that ChainDMA can only
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 61dd48282dd3..29217a983e5c 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -104,6 +104,29 @@ struct sof_ipc4_fw_data {
 	struct mutex pipeline_state_mutex; /* protect pipeline triggers, ref counts and states */
 };
 
+/**
+ * struct sof_ipc4_timestamp_info - IPC4 timestamp info
+ * @host_copier: the host copier of the pcm stream
+ * @dai_copier: the dai copier of the pcm stream
+ * @stream_start_offset: reported by fw in memory window (converted to
+ *                       frames at host_copier sampling rate)
+ * @stream_end_offset: reported by fw in memory window (converted to
+ *                     frames at host_copier sampling rate)
+ * @llp_offset: llp offset in memory window
+ * @delay: Calculated and stored in pointer callback. The stored value is
+ *         returned in the delay callback. Expressed in frames at host copier
+ *         sampling rate.
+ */
+struct sof_ipc4_timestamp_info {
+	struct sof_ipc4_copier *host_copier;
+	struct sof_ipc4_copier *dai_copier;
+	u64 stream_start_offset;
+	u64 stream_end_offset;
+	u32 llp_offset;
+
+	snd_pcm_sframes_t delay;
+};
+
 extern const struct sof_ipc_fw_loader_ops ipc4_loader_ops;
 extern const struct sof_ipc_tplg_ops ipc4_tplg_ops;
 extern const struct sof_ipc_tplg_control_ops tplg_ipc4_control_ops;
@@ -135,4 +158,12 @@ void sof_ipc4_mic_privacy_state_change(struct snd_sof_dev *sdev, bool state);
 enum sof_ipc4_pipeline_state;
 const char *sof_ipc4_pipeline_state_str(enum sof_ipc4_pipeline_state state);
 
+struct sof_ipc4_timestamp_info *sof_ipc4_sps_to_time_info(struct snd_sof_pcm_stream *sps);
+void sof_ipc4_build_time_info(struct snd_sof_dev *sdev, struct snd_sof_pcm_stream *sps);
+int sof_ipc4_get_stream_start_offset(struct snd_sof_dev *sdev,
+				     struct snd_pcm_substream *substream,
+				     struct snd_sof_pcm_stream *sps,
+				     struct sof_ipc4_timestamp_info *time_info);
+u64 sof_ipc4_frames_dai_to_host(struct sof_ipc4_timestamp_info *time_info, u64 value);
+
 #endif
-- 
2.56.0

