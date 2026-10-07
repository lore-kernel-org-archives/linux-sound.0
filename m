Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE453D812A
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363012; cv=none; b=WclGnhxF7tQ8izLE0/k70kPp/0e73Ax5Go2aAilqnHKBXIc3VpUe9QjC+yBnoIOWCFfyYnSvUncsd2v18VGpYFAf4lM99Zxo2OL5LFv3/vIdPr3onDgu1sPz681qha9Srhm94g63xEc9hvhN9Gu61TiCgnu0QR1cPXlXBw2WOdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363012; c=relaxed/simple;
	bh=TELxH5iw/nftJkdEcZ5GQuG9aL/CirMIyWJ7tLEKr7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DppwNI3XRFv2l/BJjRXpaIxWIKaJGrF3s3bRxWxS00chG5wtBz+HPDVvyNy+Gr0G82T33RJSCVnZgYkdjE2/to6Kf6rfJFl+smeUqxbshtHjpmb8rt+546Z+HdTYOMMKtHeqDJFRp0H3hrrABvCGUTnJy2x+Oi18R6xnRnKSvlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUZTn+DG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUZTn+DG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791363012; x=1822899012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TELxH5iw/nftJkdEcZ5GQuG9aL/CirMIyWJ7tLEKr7E=;
  b=eUZTn+DG1aHcG1jFUFFGDav66TZ+vLcGNfDNb30fAGiN8Nvy8l977dth
   NdIaBj5U+65ljSOkqzIqt/x/U77NfZTDK4/N8zLpJh+poWfX9AJzG4kR7
   /onyf4t+VeNBYPHXbb9pbJQPKPIrS9QV64rO/VwS3F6iWwlw7D3BpDkUS
   PUZdHyWAYUhR9RCo6ZqNoNgxhmWuCZjvrz85YqQHiEx6vY3PAsf/Etq+8
   ZMbQXM+kWfdoUUTHpFpc5wK99n3u698ZcauQhPMx3fVvuZU59P/wa72GR
   aAm3VxARCBLwcSUYqn/Mny1ISKeo1NBK4N66t5uTnsaNWy5UbnGHjCpTH
   A==;
X-CSE-ConnectionGUID: wCj4DbXgTj+BrmAridGUhQ==
X-CSE-MsgGUID: 1Uu1WErKS7+l6mJ9o4DTGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="113938"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="113938"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:11 -0700
X-CSE-ConnectionGUID: oRNkEPg2R3K0vUDXsTVIqw==
X-CSE-MsgGUID: DkiR+OmcQ92VSVQKRY20uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670649"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:08 -0700
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
Subject: [PATCH v5 11/28] ASoC: SOF: ipc4-pcm: Serialize the PCM free with the pipeline triggers
Date: Wed,  7 Oct 2026 11:49:38 +0300
Message-ID: <20261007084955.1256-12-peter.ujfalusi@linux.intel.com>
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
2.56.0

