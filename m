Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F2685635
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 11:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712660444; cv=none; b=SZrjm5lh8hIHfGpc0a3nFb11k/bFPa3mw+rVneQxQXECjb5jMokJwmYC2dMpAboRgxV5QM7zJ8oC474ziqYs08aQCIbHmruXxYh3phovfzOz0Zfs5g9TRTiJZUWhDMuhNHhRUswG3FTDdD0lhJnOvxDSa1RJTKir6KzITimjhAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712660444; c=relaxed/simple;
	bh=VBYYBjFX2N+zvY7C17PXf+eexGiRCy8Bb9vL0n9lCk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=shZKy5Z/mnvwVacw3wLY6DQ+9bZd3HFmGMD1dijzK0uk0gzNVOuxsvcPG567XlbKRWzIZri/gLtzZ2gOVnzBUM5gRC4HYjMutDA6g/fLhj/9NlpDRUZUjZWAkSNIvNPzF7MPG1GZxK81V12S4mgWh7gezVsT0l6uX1PDI4E91WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OjPUgGvs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OjPUgGvs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712660443; x=1744196443;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VBYYBjFX2N+zvY7C17PXf+eexGiRCy8Bb9vL0n9lCk0=;
  b=OjPUgGvsjThhFIukA8NyNFtCh9ZAi5tn9qCBPkMlzO9ZJQFXUJvHAvMj
   O+LvK6tA6KvaZiD8pMJ1cbmRLRDsk0OtoDKyFIgekdpSlZ4DYJGXRB5gh
   UYgbUMpPP5szc90xAOvzPo5L6z87T/3hV+kTTlJ2O74AhVQ3dQwpZZeQX
   JuNhQ1pyO3wWae2kbviyjn1V3MwqcPBAiCAwAhZc+0hVwhxx4EGsA48IX
   gUtOoaHI5O9OiGT7fpLG7fdkCaaOSFELria/0P6p/gUHlCDxTvMu07I9s
   UiV9wa0/CaWHbAzlBWHBO64UINgoZLz7lRPxeYjuam7GUbHuROAy5LtKq
   g==;
X-CSE-ConnectionGUID: ZvydGC0pRdqkOquWR3w/xQ==
X-CSE-MsgGUID: 2oGt1k/9SJCg8G8vflXoUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7812998"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7812998"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:00:43 -0700
X-CSE-ConnectionGUID: A59FklepTViFCvRTkDDq2w==
X-CSE-MsgGUID: ETXbKtGtRm69i91lFRMsfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20309774"
Received: from dpotapen-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.59.81])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:00:41 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 1/4] ASoC: SOF: ipc4-pcm: Use consistent name for snd_sof_pcm_stream pointer
Date: Tue,  9 Apr 2024 14:00:33 +0300
Message-ID: <20240409110036.9411-2-peter.ujfalusi@linux.intel.com>
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

Throughout the file the pointer for snd_sof_pcm_stream is named either
'stream' or (wrongly) 'spcm' which confuses the reader.

Use 'sps' for the pointer name as it is the most common name used in SOF
codebase.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index e915f9f87a6c..f989cc2992bf 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -764,7 +764,7 @@ static int sof_ipc4_pcm_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm
 	return 0;
 }
 
-static void sof_ipc4_build_time_info(struct snd_sof_dev *sdev, struct snd_sof_pcm_stream *spcm)
+static void sof_ipc4_build_time_info(struct snd_sof_dev *sdev, struct snd_sof_pcm_stream *sps)
 {
 	struct sof_ipc4_copier *host_copier = NULL;
 	struct sof_ipc4_copier *dai_copier = NULL;
@@ -775,7 +775,7 @@ static void sof_ipc4_build_time_info(struct snd_sof_dev *sdev, struct snd_sof_pc
 	int i;
 
 	/* find host & dai to locate info in memory window */
-	for_each_dapm_widgets(spcm->list, i, widget) {
+	for_each_dapm_widgets(sps->list, i, widget) {
 		struct snd_sof_widget *swidget = widget->dobj.private;
 
 		if (!swidget)
@@ -795,7 +795,7 @@ static void sof_ipc4_build_time_info(struct snd_sof_dev *sdev, struct snd_sof_pc
 		return;
 	}
 
-	info = spcm->private;
+	info = sps->private;
 	info->host_copier = host_copier;
 	info->dai_copier = dai_copier;
 	info->llp_offset = offsetof(struct sof_ipc4_fw_registers, llp_gpdma_reading_slots) +
@@ -864,7 +864,7 @@ static int sof_ipc4_pcm_hw_params(struct snd_soc_component *component,
 
 static int sof_ipc4_get_stream_start_offset(struct snd_sof_dev *sdev,
 					    struct snd_pcm_substream *substream,
-					    struct snd_sof_pcm_stream *stream,
+					    struct snd_sof_pcm_stream *sps,
 					    struct sof_ipc4_timestamp_info *time_info)
 {
 	struct sof_ipc4_copier *host_copier = time_info->host_copier;
@@ -918,7 +918,7 @@ static int sof_ipc4_pcm_pointer(struct snd_soc_component *component,
 	struct sof_ipc4_timestamp_info *time_info;
 	struct sof_ipc4_llp_reading_slot llp;
 	snd_pcm_uframes_t head_cnt, tail_cnt;
-	struct snd_sof_pcm_stream *stream;
+	struct snd_sof_pcm_stream *sps;
 	u64 dai_cnt, host_cnt, host_ptr;
 	struct snd_sof_pcm *spcm;
 	int ret;
@@ -927,8 +927,8 @@ static int sof_ipc4_pcm_pointer(struct snd_soc_component *component,
 	if (!spcm)
 		return -EOPNOTSUPP;
 
-	stream = &spcm->stream[substream->stream];
-	time_info = stream->private;
+	sps = &spcm->stream[substream->stream];
+	time_info = sps->private;
 	if (!time_info)
 		return -EOPNOTSUPP;
 
@@ -938,7 +938,7 @@ static int sof_ipc4_pcm_pointer(struct snd_soc_component *component,
 	 * the statistics is complete. And it will not change after the first initiailization.
 	 */
 	if (time_info->stream_start_offset == SOF_IPC4_INVALID_STREAM_POSITION) {
-		ret = sof_ipc4_get_stream_start_offset(sdev, substream, stream, time_info);
+		ret = sof_ipc4_get_stream_start_offset(sdev, substream, sps, time_info);
 		if (ret < 0)
 			return -EOPNOTSUPP;
 	}
@@ -1030,15 +1030,15 @@ static snd_pcm_sframes_t sof_ipc4_pcm_delay(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sof_ipc4_timestamp_info *time_info;
-	struct snd_sof_pcm_stream *stream;
+	struct snd_sof_pcm_stream *sps;
 	struct snd_sof_pcm *spcm;
 
 	spcm = snd_sof_find_spcm_dai(component, rtd);
 	if (!spcm)
 		return 0;
 
-	stream = &spcm->stream[substream->stream];
-	time_info = stream->private;
+	sps = &spcm->stream[substream->stream];
+	time_info = sps->private;
 	/*
 	 * Report the stored delay value calculated in the pointer callback.
 	 * In the unlikely event that the calculation was skipped/aborted, the
-- 
2.44.0

