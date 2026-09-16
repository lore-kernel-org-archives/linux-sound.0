Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984E94F7979
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560261; cv=none; b=YfJCOUO/8CC3Q+/gtL8p/suAkmCYK+eccUBIIhfemhX4SLRyFp16qcQHP+yLpKI+AWYQc5HhrKvgLYN7sV9B2ii+q3GD5DseqyGYZCeJvf9TIjvlrVN9C7rFmMiBpRxfw5adNXK24ckaScEgrPtXOSSacv+BxSOJ80YdTCMZRFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560261; c=relaxed/simple;
	bh=e44ghcIsOpwyWiF4xua7eu5agSztMS3cMv4bxqAcPyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=okeGIABXLwRpYZ0pxhz5FekQ4f78gi/RSq73FBEZuE7ggFAKprC4YC6rUKVeZ4x/ApOBzEOqFenhh9U5L0OgAuWzK4Uag75El9MWTeuVzNsSr0LGgK8VU4GXtUvjoJD5IS2PetlBMYahSXJaA0MMUlMFx1IDZ1YOWj+6rG6A8Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PE1qI7L3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PE1qI7L3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560255; x=1821096255;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e44ghcIsOpwyWiF4xua7eu5agSztMS3cMv4bxqAcPyI=;
  b=PE1qI7L3HdXfUiHn2RIP5rmt57eO4bhVGCq5KsT5Lz7mJFgRdrBxw++a
   pqIgUt2jCjQ0LyYXtUK6T9CL8jJAaptmL80lV+O67FpO84wn/yxWYr82n
   ANKsWwTpbSQZhN0ymydaJv1CU1/LjidvxWXFngZ5Rvz2dlGEDtWqX+OQE
   jITWWq+6EHhDWQ6MgVuF2GtFKv3mHC7r7NX+01R6a5j4ufL+MY1iWKcWW
   94bf3i6hzRTQa3u/a4cLiFc9IHxZZZosQecewH1cZtzdmxNQt8R0IJXdB
   OKwaVNyWlZUkHYrj8+0vJACJE1hofBdExY5l1ug/QSzQlODKQXUtLuGqd
   A==;
X-CSE-ConnectionGUID: JgtFhBmWR9SvcGPwW0FopQ==
X-CSE-MsgGUID: 5C6gJrvMRFWOTFke9Roiig==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496476"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496476"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:04:02 -0700
X-CSE-ConnectionGUID: 3kPNKzHaQa+RERQvp1hpyQ==
X-CSE-MsgGUID: Wz5WeJyYQQ+sC7+YFa5Gcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293526"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:04:00 -0700
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
Subject: [PATCH v4 17/26] ASoC: SOF: ipc4-pcm: Make the timestamp info usable outside of ipc4-pcm.c
Date: Wed, 16 Sep 2026 15:03:11 +0300
Message-ID: <20260916120320.18318-18-peter.ujfalusi@linux.intel.com>
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
index a8cdf9bc750b..7c0861d63bef 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -98,6 +98,29 @@ struct sof_ipc4_fw_data {
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
@@ -129,4 +152,12 @@ void sof_ipc4_mic_privacy_state_change(struct snd_sof_dev *sdev, bool state);
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
2.55.0

