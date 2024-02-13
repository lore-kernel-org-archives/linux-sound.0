Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDF622F0A
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 10:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707819173; cv=none; b=CJQtYZ4Msdup/UgFeBpGtsKj2E0CmmZHub4ovWJev+8bjPhXiaJJm8BWkltNmi2zalvbnmAHPZ+m7Lm0ZeZmMMNfHraNt9sz2MtTggXIsfMcwS8EogIdWiyKJqnC++RLpX3bTDo7UKhHD6q6da31T74ysNo1VioMfabvktR+VDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707819173; c=relaxed/simple;
	bh=F3MNPVVbNxCgYbBbQ+EyuOxJagBRx6f6MFpOnnNpU9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FooRpZrOi/fSoKO0nvVKGzv2IGHZpd2P+Np27TO+C4/bUvq6vTm1jN0I6J27CT/PAAXle+r5TBGYCTUdSqIAzshfJqdDY7cAuGLfNKO19/NBkkCCEuRXaaZNnX5te9LbU/3Q2z6KyObwDkce05qCNUn1kpNT2yYkARHZsMVxYbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3KNDcq0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3KNDcq0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707819172; x=1739355172;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F3MNPVVbNxCgYbBbQ+EyuOxJagBRx6f6MFpOnnNpU9g=;
  b=V3KNDcq0fuwSvHIaGISWQpL67OklTrYassberwFRoQpQ+GYqTS794iKg
   kMpVGSawm7ClhLXxNzOISNcAm2srNaN/LMSw+7OII02BqqEyE6prI1x1p
   Mm/0EbeZoTz/J3xoFMGQLGlhQAHFfyNU27c1ts7Sg9eI6MhHG6C5GH0za
   d+mJIMPJrxsH81OqCxv9RonuzUEPqaWHP0oTint+wm9H+YWbUyvOxppSq
   Jbc+aE2zUh1uHoUTcRQuvxOKsHUg0tiJSYbpIA6HZ5yBRU/20gyL8atsP
   RvTga8I8D6Oz/qep4Ggj8FBmhjaFwCIE0hvOqIqEgTA0Tm5kiLIffwq4q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27260165"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="27260165"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:12:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7498036"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:12:49 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 05/15] ASoC: SOF: ipc4: store number of playback/capture streams
Date: Tue, 13 Feb 2024 12:12:37 +0200
Message-ID: <20240213101247.28887-6-peter.ujfalusi@linux.intel.com>
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

The CHAIN_DMA IPC needs the number of playback streams as a start
offset for the dma_id of a capture stream.

This offset can be retrieved on Intel platforms from the GCAP
information, and stored in the sof_ipc4_fw_data structure.

One could argue that the fields added are not really dependent on any
firmware definitions but rather on hardware capabilities, but they are
required for the IPC CHAIN_DMA definitions so adding them in
ipc4_fw_data isn't completely silly.

The CHAIN_DMA IPC is currently only functional on Intel HDaudio DMAs,
and gated by the snd_sof_is_chain_dma_supported() helper.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 9 +++++++++
 sound/soc/sof/ipc4-priv.h        | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index f2ebadbbcc10..b387b1a69d7e 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -21,6 +21,7 @@
 #include <trace/events/sof_intel.h>
 #include "../ops.h"
 #include "../sof-audio.h"
+#include "../ipc4-priv.h"
 #include "hda.h"
 
 #define HDA_LTRP_GB_VALUE_US	95
@@ -937,6 +938,14 @@ int hda_dsp_stream_init(struct snd_sof_dev *sdev)
 	/* store total stream count (playback + capture) from GCAP */
 	sof_hda->stream_max = num_total;
 
+	/* store stream count from GCAP required for CHAIN_DMA */
+	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
+		struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+
+		ipc4_data->num_playback_streams = num_playback;
+		ipc4_data->num_capture_streams = num_capture;
+	}
+
 	return 0;
 }
 
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 1d39836d5efa..f3b908b093f9 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -66,6 +66,8 @@ struct sof_ipc4_fw_library {
  * @nhlt: NHLT table either from the BIOS or the topology manifest
  * @mtrace_type: mtrace type supported on the booted platform
  * @mtrace_log_bytes: log bytes as reported by the firmware via fw_config reply
+ * @num_playback_streams: max number of playback DMAs, needed for CHAIN_DMA offset
+ * @num_capture_streams: max number of capture DMAs
  * @max_num_pipelines: max number of pipelines
  * @max_libs_count: Maximum number of libraries support by the FW including the
  *		    base firmware
@@ -79,6 +81,8 @@ struct sof_ipc4_fw_data {
 	void *nhlt;
 	enum sof_ipc4_mtrace_type mtrace_type;
 	u32 mtrace_log_bytes;
+	int num_playback_streams;
+	int num_capture_streams;
 	int max_num_pipelines;
 	u32 max_libs_count;
 	bool fw_context_save;
-- 
2.43.0

