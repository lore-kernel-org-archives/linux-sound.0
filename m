Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990D247F2FF
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 09:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945035; cv=none; b=Cvw+HZxNQyOFk4i3kdMocILgFJZ6qNfwVTn2weNasI1tnVc92haO32Bcug5d4t2ssw2VFa34WG0HTgkvi4Zp6BpqKj/NrNbS7jgMMX7YhO+sVHvYVdVjWkiwoRPeBKq8NYd8b/UmCxPGZtXj5sqFV3gOPICtcTVee+Lg0zLGZE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945035; c=relaxed/simple;
	bh=biFL4YT7t2GlJdHyrQ/V5WsubdYOfCgJ73jvSNrK3kA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F/FEMt01F2hmPSLNicBJbAHJ5X/XzT/xWzntyFq1/KF6wJZD6wXOIXLdSFOVU16FF7WQSFscHEQWZICZXGpWhtxAku7YYDpVgk/OAMw1I6LXlgGju+pXWrzjMMbdIQtAFF/0DDbGlsvAku3COC/0OG8qMW1NSYO1yH3gGKucMfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJModFt1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJModFt1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788945034; x=1820481034;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=biFL4YT7t2GlJdHyrQ/V5WsubdYOfCgJ73jvSNrK3kA=;
  b=fJModFt15L68M+u6kjw5wt3roFDzcTXa42VqXQ67EE36JxKPw0dLrhxu
   HLouVvf9eBBl2txwjV1lGsN+YOEvVraYopOw0qw6GvQT4YMpEh1uaMoyN
   Gbc8J71NA+zVYIPdI9/NT3aIRujWm+dgiSP5qJJMb2XqukbfQEWZQ8YDN
   K1AuDz2bzI+FjEgut9AHqDqO7/gS7rxDp5pvPqheIwRWMhUntvwq7cB1N
   FxhJxJRdJ5PZuQd8OzuxWhTCG6q74VKDXGKxH0t8NOSYPmp+MK8mSZ82G
   I4eAp9mr3zNU9UmBTJ0DbL4p7DwjKzAsv5JVct29y/qyswebXlZV3zITV
   g==;
X-CSE-ConnectionGUID: y4vSHZq7STeJErrj5omTIQ==
X-CSE-MsgGUID: R8L9qxbxSkSqQw68dfNKbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89200805"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89200805"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:34 -0700
X-CSE-ConnectionGUID: EZw9tukqRNGjTGRKHhwAWA==
X-CSE-MsgGUID: q9QjbKKwQp+JNmnkQYIuAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266973192"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.252])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:30 -0700
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
Subject: [PATCH v2 18/24] ASoC: SOF: ipc4-pcm: Handle COMPR DRAIN triggers as EOS pipeline state
Date: Wed,  9 Sep 2026 12:09:43 +0300
Message-ID: <20260909090949.7503-19-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
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
index 45cdd5d8fbbf..543b4b29a056 100644
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
@@ -499,8 +505,9 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 		goto free;
 	}
 
-	/* no need to pause before reset or before pause release */
-	if (state == SOF_IPC4_PIPE_RESET || cmd == SNDRV_PCM_TRIGGER_PAUSE_RELEASE)
+	/* no need to pause before reset, EOS or before pause release */
+	if (state == SOF_IPC4_PIPE_RESET || state == SOF_IPC4_PIPE_EOS ||
+	    cmd == SNDRV_PCM_TRIGGER_PAUSE_RELEASE)
 		goto skip_pause_transition;
 
 	/*
@@ -602,6 +609,10 @@ static int sof_ipc4_pcm_trigger(struct snd_soc_component *component,
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

