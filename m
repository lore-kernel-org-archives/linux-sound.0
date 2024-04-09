Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF60F81AA5
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 11:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712660448; cv=none; b=SZwUxvGKh5r97UA2Mn1R0ttXgaPf5HSOqWW86mrSVhs2jelTLmywBVtpY1sYBXQNk3q/EFb3X0mPj3TA2Nmcnog4K0TE+8jHP4sDkuFRXsdqE4sKyiPM603mcIXCMranIF3MgS3kXaGFJsyZnZC2brsVCYkgrRgizHiHw9a1iTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712660448; c=relaxed/simple;
	bh=HG0lw8XEW9Q/a1RHr7YyPvv9hmBbtb2nh94e8iCdYd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RHyBkJMqPbpRx2CljrufdbjyKoJzEBqUDjfFntMJpMf8PVZMMpeR5BLvvKBXZveD22BYw2D3ChaeXo9DXXtfOWMK+bI77caBG8Q5wM0DiP3nZlG+x/AWoo7AXCRyGc9LQcMq23XbyW8SukSBrSz9/VlVYjBFsvIyH3gnPuAlAfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HyNeqm2S; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HyNeqm2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712660447; x=1744196447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HG0lw8XEW9Q/a1RHr7YyPvv9hmBbtb2nh94e8iCdYd0=;
  b=HyNeqm2S4Y3I9LTdO1U1yB0YsAJK0YdqPqhnIyi+vCOSVAbNhTpr6kNv
   vMO51P5izh06ksgk+cI6R8p+Aw6nH1yn8nqdDJJhTEK1ces6sqOQYAzJR
   btF0ylHrOwMflsw6LY0RUyLKm6ccV1EwHqLcWipHXDfgjAbv60w2IMkAV
   rS1RQRQod+ZTNPzklrFBGDtxG+gBKdiTawxI7rLSWjtNG7uKEG2pHKuqP
   C2REIQ3Zsfz8zgrAc7lQMJizTQ2UhoMECG0unYLRYM5VHvCuhqBCNawE8
   e9PSbKqsSHQeeFU/fm3ivrHr2do+5b4bqhErHm9N4aERYLWObPdKWMY4X
   Q==;
X-CSE-ConnectionGUID: r+TN2hAnTVWIGX8YAvBRPg==
X-CSE-MsgGUID: JQbCnMPoSGe6ECj0vUCnLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7813019"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7813019"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:00:47 -0700
X-CSE-ConnectionGUID: dDQwH9nPTvqHIMs+oEv5Ig==
X-CSE-MsgGUID: BIRIJfPPQdi/BycxtuRWGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20309778"
Received: from dpotapen-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.59.81])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:00:45 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 3/4] ASoC: SOF: ipc4-pcm: Introduce generic sof_ipc4_pcm_stream_priv
Date: Tue,  9 Apr 2024 14:00:35 +0300
Message-ID: <20240409110036.9411-4-peter.ujfalusi@linux.intel.com>
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

Using the sof_ipc4_timestamp_info struct directly as sps->private data
is too restrictive, add a new generic sof_ipc4_pcm_stream_priv struct
containing the time_info to allow new information to be stored in a
generic way.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 43 ++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 74b0d0d00270..34ce6bb7f37d 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -37,6 +37,22 @@ struct sof_ipc4_timestamp_info {
 	snd_pcm_sframes_t delay;
 };
 
+/**
+ * struct sof_ipc4_pcm_stream_priv - IPC4 specific private data
+ * @time_info: pointer to time info struct if it is supported, otherwise NULL
+ */
+struct sof_ipc4_pcm_stream_priv {
+	struct sof_ipc4_timestamp_info *time_info;
+};
+
+static inline struct sof_ipc4_timestamp_info *
+sof_ipc4_sps_to_time_info(struct snd_sof_pcm_stream *sps)
+{
+	struct sof_ipc4_pcm_stream_priv *stream_priv = sps->private;
+
+	return stream_priv->time_info;
+}
+
 static int sof_ipc4_set_multi_pipeline_state(struct snd_sof_dev *sdev, u32 state,
 					     struct ipc4_pipeline_set_state_data *trigger_list)
 {
@@ -452,7 +468,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 		 * Invalidate the stream_start_offset to make sure that it is
 		 * going to be updated if the stream resumes
 		 */
-		time_info = spcm->stream[substream->stream].private;
+		time_info = sof_ipc4_sps_to_time_info(&spcm->stream[substream->stream]);
 		if (time_info)
 			time_info->stream_start_offset = SOF_IPC4_INVALID_STREAM_POSITION;
 
@@ -706,12 +722,16 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 static void sof_ipc4_pcm_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm)
 {
 	struct snd_sof_pcm_stream_pipeline_list *pipeline_list;
+	struct sof_ipc4_pcm_stream_priv *stream_priv;
 	int stream;
 
 	for_each_pcm_streams(stream) {
 		pipeline_list = &spcm->stream[stream].pipeline_list;
 		kfree(pipeline_list->pipelines);
 		pipeline_list->pipelines = NULL;
+
+		stream_priv = spcm->stream[stream].private;
+		kfree(stream_priv->time_info);
 		kfree(spcm->stream[stream].private);
 		spcm->stream[stream].private = NULL;
 	}
@@ -721,6 +741,7 @@ static int sof_ipc4_pcm_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm
 {
 	struct snd_sof_pcm_stream_pipeline_list *pipeline_list;
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	struct sof_ipc4_pcm_stream_priv *stream_priv;
 	struct sof_ipc4_timestamp_info *time_info;
 	bool support_info = true;
 	u32 abi_version;
@@ -749,6 +770,14 @@ static int sof_ipc4_pcm_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm
 			return -ENOMEM;
 		}
 
+		stream_priv = kzalloc(sizeof(*stream_priv), GFP_KERNEL);
+		if (!stream_priv) {
+			sof_ipc4_pcm_free(sdev, spcm);
+			return -ENOMEM;
+		}
+
+		spcm->stream[stream].private = stream_priv;
+
 		if (!support_info)
 			continue;
 
@@ -758,7 +787,7 @@ static int sof_ipc4_pcm_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm
 			return -ENOMEM;
 		}
 
-		spcm->stream[stream].private = time_info;
+		stream_priv->time_info = time_info;
 	}
 
 	return 0;
@@ -795,7 +824,7 @@ static void sof_ipc4_build_time_info(struct snd_sof_dev *sdev, struct snd_sof_pc
 		return;
 	}
 
-	time_info = sps->private;
+	time_info = sof_ipc4_sps_to_time_info(sps);
 	time_info->host_copier = host_copier;
 	time_info->dai_copier = dai_copier;
 	time_info->llp_offset = offsetof(struct sof_ipc4_fw_registers,
@@ -849,7 +878,7 @@ static int sof_ipc4_pcm_hw_params(struct snd_soc_component *component,
 	if (!spcm)
 		return -EINVAL;
 
-	time_info = spcm->stream[substream->stream].private;
+	time_info = sof_ipc4_sps_to_time_info(&spcm->stream[substream->stream]);
 	/* delay calculation is not supported by current fw_reg ABI */
 	if (!time_info)
 		return 0;
@@ -928,7 +957,7 @@ static int sof_ipc4_pcm_pointer(struct snd_soc_component *component,
 		return -EOPNOTSUPP;
 
 	sps = &spcm->stream[substream->stream];
-	time_info = sps->private;
+	time_info = sof_ipc4_sps_to_time_info(sps);
 	if (!time_info)
 		return -EOPNOTSUPP;
 
@@ -1030,15 +1059,13 @@ static snd_pcm_sframes_t sof_ipc4_pcm_delay(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sof_ipc4_timestamp_info *time_info;
-	struct snd_sof_pcm_stream *sps;
 	struct snd_sof_pcm *spcm;
 
 	spcm = snd_sof_find_spcm_dai(component, rtd);
 	if (!spcm)
 		return 0;
 
-	sps = &spcm->stream[substream->stream];
-	time_info = sps->private;
+	time_info = sof_ipc4_sps_to_time_info(&spcm->stream[substream->stream]);
 	/*
 	 * Report the stored delay value calculated in the pointer callback.
 	 * In the unlikely event that the calculation was skipped/aborted, the
-- 
2.44.0

