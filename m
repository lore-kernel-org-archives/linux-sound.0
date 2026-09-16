Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A933F8EB7
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560243; cv=none; b=aXQnFQuSk8DcZnkubJDgzCut8upGpAQd2Y8kWwLa5muYU3o1C2FfZ/IQVQk7dFIzddrfX+/5YAvIcRonMI8UOMJUbJBSkxn+9oy0mx5E8ikOs3TgLRPzJcv8cCt+WzyM18ghN9hAeDtHoaMWYAZqMKWp3E3oi90C1hM6FNVQs5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560243; c=relaxed/simple;
	bh=Vu3G2wBoXCcfYpsqo9X4SmxToQP5leDqLV2DrQgeKXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aTIMJ9sXSH2cW1r6ia0KXmjeKFlUIcfu6Ct3TEH6e17fNuV1l+eMHUpaYrWogSLpLW68qjL46yfnVqy0ED1c+9TLF03tjAQeS7T4kgCV+vrW8Jh1P/cqTeNlpuBwxEDQjwMf058AAIOt3m3Ng9m1atyOKPARVRm/nyJ10kyOFqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SSI/P+uu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SSI/P+uu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560228; x=1821096228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vu3G2wBoXCcfYpsqo9X4SmxToQP5leDqLV2DrQgeKXg=;
  b=SSI/P+uuVwck9o6GGz6vaKw0zGiXRzZ6STM0NOZSq4FRtLw3Gtj+S2C6
   oH3nIKMPMsBUTF7/L/IL4ZgcJeDos7ZRkIz//LexNDDHfTMSvCDm5roA0
   17/P1MZFAalIA24AI0LoKUKSmwiRN4b665+ZHTTKZfyfjT1csd0QWVzPv
   kq1lU4Ff+ROKLR8/orc0HXzlHaxuRoWgJDJ/vBa7IMWiFxDBaKP9JhQBv
   hMuYujwJumeQmdAHVv8k0rnCHJUlnprUjrAb32srsT44L8DlT8U/JeGES
   opitWahtXQISbXG5OS7ymuj7sjaj/R52Uy/Yr3dn+s/Kvuu84dRFR7UXJ
   Q==;
X-CSE-ConnectionGUID: EAdQoyOVR0irosTlbNwg4w==
X-CSE-MsgGUID: wtb25L7zSDmW02AAvEEqTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496339"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496339"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:42 -0700
X-CSE-ConnectionGUID: 1ZXGc7qfQKaztULJEEKKfw==
X-CSE-MsgGUID: /lnu08s9SsGnJaoCkOWCxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293391"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:39 -0700
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
Subject: [PATCH v4 10/26] ASoC: SOF: ipc4-pcm: Serialize the PCM free with the pipeline triggers
Date: Wed, 16 Sep 2026 15:03:04 +0300
Message-ID: <20260916120320.18318-11-peter.ujfalusi@linux.intel.com>
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
2.55.0

