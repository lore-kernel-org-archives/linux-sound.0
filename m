Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0403B47E2
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507143; cv=none; b=hGW6HV6M/OqFj0zqhKFu0M7aJPimbXGFFkeCRxD/iieZ7hfl/QA/Ckv09a+6dJhAS66bX05cY7l8zd4Ee7JLP73So8vWJGGjVVJC5FgYIBWtonslBp+RpP7wvOVQB9V2KLVbB4F9r1bJGM5gWNMFSzJqtAjnWEKJoxiJ6wCnFyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507143; c=relaxed/simple;
	bh=biFL4YT7t2GlJdHyrQ/V5WsubdYOfCgJ73jvSNrK3kA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IvSnsUGA9r1N+LLupBGPgL33QRiQh1egusAFoMRM1UqxIYK6xIDpV88ghYjd1HTKSr4FOyWKZugGOGYLrXBJL5h28qW673LC5lXhrncjh+sB0hduumE6x2EGiD8C8qkcfEwKYYcUf+2feZMc3U+kHpUTRZtt1h4w1yA3pyteSN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BoLmO6of; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BoLmO6of"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788507141; x=1820043141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=biFL4YT7t2GlJdHyrQ/V5WsubdYOfCgJ73jvSNrK3kA=;
  b=BoLmO6of1YAFfL2AOIT3ccpGC829jy6U+zmCYAl5DImTrE35MQloADcB
   vdpsqYUXqtuMQ7INok2Llsb5voKc2AM9rD2obmZbo/SQ6ARI+EudmX4sj
   n1rIxTB0o5eDg9Yr63VpyLvG8UMBygxSgSw0CD/CO12oZOGg2wp0qzf12
   L0XdlW74BjuXByKr9oGr/BQDJhUT6COkvpUzJ0owqzyy+QYbRZgwWtfcU
   Xt6o+5VhSBO5MCFCk4OO++l9dkdIzBoBxKIkq6WaQb4JisapJHDhWmTMe
   qqJBqkQsp/ONABe8VVc3gRRdLuV0sg/tB7w0aPqecLpobVoDs8Nuf/vg0
   g==;
X-CSE-ConnectionGUID: lLqIEP3nR1GsJcKTmM0NRA==
X-CSE-MsgGUID: elNAuvhIQhiUTqRbczhrow==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="111778012"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="111778012"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:32:20 -0700
X-CSE-ConnectionGUID: oiLYqk2mTOS1lBbGa3x2Mw==
X-CSE-MsgGUID: 7u6BJ3uaTkeO9Duiq5LGsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="293480656"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.213])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:32:17 -0700
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
	daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: [PATCH 17/23] ASoC: SOF: ipc4-pcm: Handle COMPR DRAIN triggers as EOS pipeline state
Date: Fri,  4 Sep 2026 10:31:28 +0300
Message-ID: <20260904073134.29648-18-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
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

