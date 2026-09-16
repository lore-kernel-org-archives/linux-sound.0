Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FAB4AA416
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560264; cv=none; b=DHFoQHxhLF5Yr1Gg5zqjcbgkJIZBdDaR23/2wdqDSxaxtBSKbxsnTQOPYRW83+8OZA5n6eGbgrNTNTYO9XlVBoDj+kyjr5xfNxeVAwHumrKHhxZgSGhxZhPnvh8eVNy15PaLD+sSjFvWsusoKzeV4lP4ff2lCzqRRtiTx6KJqMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560264; c=relaxed/simple;
	bh=HdlIYQ8sQOnhxgGX+kSE0mUsch6iR9AuhPg7bGT81zo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRRpgSdhSK9LtirvqiCeeh6qvzB7ANO2ncGhTgKCWvidfi1oKtDrlAHUMh+JRybR0E0iPf3sXcMh0MnCgcZ0eexMrHztEOKJbiQszgYwxgIJV0FoX7mzFgpHx/PmoUrNb2trBRgxOj2b+Kt3w506U0Qv31bfSXmj96RIWHGvJxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxI2C33i; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxI2C33i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560260; x=1821096260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HdlIYQ8sQOnhxgGX+kSE0mUsch6iR9AuhPg7bGT81zo=;
  b=AxI2C33iHGmXHcM0tRXziWJ5L/QF3UyFCw9PzKQxflh4oEcOn2rUfO0v
   eWKgeg/D1xIypvEI6AI8wt6gOAziIsfmCtDlP5WMw7FWwd5FXprZOct85
   3Z2KRZe4mgYT1pGgj64wsY6FH6G93ElZBKR4cID1Bd7u4xM8OIZyh9KL2
   W9ETBGoFD9DxZvQEQ3X6BJzEURuCFWE9LOuhIiEThnhCvM2R0Z75FRv3C
   he4/Goh5BlY7htZwQe6oz34dp1hnALMOsHYLnrs0wwO9Yz7jj/ZjLyn3T
   5z8Ft5qHcStJ3f2sNtfcQ5YyTStq3CMSFHglGki4/P77MWv2y77/Ps4CX
   w==;
X-CSE-ConnectionGUID: 86osR/PhR12y9t/mqTtfgA==
X-CSE-MsgGUID: wHkAI18oTj+6Xg6dV4u0uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496508"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496508"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:04:08 -0700
X-CSE-ConnectionGUID: rkW/9h7NSUGeDMRAxeWNLA==
X-CSE-MsgGUID: /HmtIpxuTj6xrjKQdmIeVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293664"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:04:06 -0700
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
Subject: [PATCH v4 19/26] ASoC: SOF: ipc4-pcm: Handle COMPR DRAIN triggers as EOS pipeline state
Date: Wed, 16 Sep 2026 15:03:13 +0300
Message-ID: <20260916120320.18318-20-peter.ujfalusi@linux.intel.com>
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

The DRAIN trigger is received by a compr device when user space wrote all
the data to the buffer and it is waiting for the decoding to be completed.

Set the pipeline state to EOS in firmware so it can expect the stream to
be stopping anytime soon.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index c565e0e12949..f65c2a804a36 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -153,7 +153,8 @@ sof_ipc4_add_pipeline_to_trigger_list(struct snd_sof_dev *sdev, int state,
 	struct snd_sof_widget *pipe_widget = spipe->pipe_widget;
 	struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
 
-	if (pipeline->skip_during_fe_trigger && state != SOF_IPC4_PIPE_RESET)
+	if (pipeline->skip_during_fe_trigger && state != SOF_IPC4_PIPE_RESET &&
+	    state != SOF_IPC4_PIPE_EOS)
 		return;
 
 	switch (state) {
@@ -173,7 +174,12 @@ sof_ipc4_add_pipeline_to_trigger_list(struct snd_sof_dev *sdev, int state,
 							  true);
 		break;
 	case SOF_IPC4_PIPE_PAUSED:
-		/* Pause the pipeline only when its started_count is 1 more than paused_count */
+	case SOF_IPC4_PIPE_EOS:
+		/*
+		 * Pause the pipeline only when its started_count is 1 more than
+		 * paused_count.
+		 * Same rule applies to EOS state.
+		 */
 		if (spipe->paused_count == (spipe->started_count - 1))
 			sof_ipc4_add_pipeline_by_priority(trigger_list, pipe_widget, pipe_priority,
 							  true);
@@ -492,8 +498,9 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 		goto free;
 	}
 
-	/* no need to pause before reset or before pause release */
-	if (state == SOF_IPC4_PIPE_RESET || cmd == SNDRV_PCM_TRIGGER_PAUSE_RELEASE)
+	/* no need to pause before reset, EOS or before pause release */
+	if (state == SOF_IPC4_PIPE_RESET || state == SOF_IPC4_PIPE_EOS ||
+	    cmd == SNDRV_PCM_TRIGGER_PAUSE_RELEASE)
 		goto skip_pause_transition;
 
 	/*
@@ -591,6 +598,10 @@ static int sof_ipc4_pcm_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_STOP:
 		state = SOF_IPC4_PIPE_PAUSED;
 		break;
+	case SND_COMPR_TRIGGER_DRAIN:
+	case SND_COMPR_TRIGGER_PARTIAL_DRAIN:
+		state = SOF_IPC4_PIPE_EOS;
+		break;
 	default:
 		dev_err(component->dev, "%s: unhandled trigger cmd %d\n", __func__, cmd);
 		return -EINVAL;
-- 
2.55.0

