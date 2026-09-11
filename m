Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2500544C4EA
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125801; cv=none; b=BZT2O4sbYdHXGVi3pMXzIYnmAR98YnM4zXBruSpj7foUA36xhh6s3nCojgBeq6xbcUiLc8Kr41YIcCZbBYpL213SFQZXyD00RISpTl/a0CvjcSQGcq6Vq/kPgqIP97Ki0zovpjIMTLFaWMMP+KkCguzmbGxg1PTLPhfo+dP3cBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125801; c=relaxed/simple;
	bh=HdlIYQ8sQOnhxgGX+kSE0mUsch6iR9AuhPg7bGT81zo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lVtSyO53Ca5mG8JnGkwwrJaeDAP9rc3PpQf6yQX0VaOZnD9g+0mYwsgGRVWsquCYYTq4o2qMsq4D9IN5uCFFX6W8KcrLndFunsKeot08e4Xa0RF+fsJ/p6xWiAAu+FkHle2jmjTTcwnLCHMS3S+4DYIFsoUe/C3s1OfA5Dz3Skw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbdxB7Ef; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbdxB7Ef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125797; x=1820661797;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HdlIYQ8sQOnhxgGX+kSE0mUsch6iR9AuhPg7bGT81zo=;
  b=QbdxB7EfJG44mp/jOhc9Y0cq+Cwf3G3MbV5fV6I68VdjGcsI+tR64tst
   saBg+wxLA6QYvJxBxMxTD5EOP45p7Y30HLPD6P2cCuWE7hUYOeMfTk1UP
   c0g8CahUat4dDCJI21LPUHNgEweYNRZ0koap1/M7qQtr5PYW7eV3FbAW3
   LdklmqDJ3i+d+YvY7+8QqcYFKg7yFwiERN708z9eNhzTUd98FM8IYWw30
   8+TA5Y0q/l/IqqIH2zoVDbHu4+mNVZ4eeHugZLzvDF6WWtMK2grVc+UcM
   r+DcZODmPn88HHaJ6GV8IIQcgsbte6+a9W4rKNddysUIVIaVpBvVt2kVu
   w==;
X-CSE-ConnectionGUID: qnSnQTNiQlqsMfaIjvQAog==
X-CSE-MsgGUID: z42uWKY+So6lU7kU8D/BqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100750037"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100750037"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:39 -0700
X-CSE-ConnectionGUID: 3qwGfw9GSuOWQRzRHgrcDQ==
X-CSE-MsgGUID: oaEVDrIDQ6yib30IAqJ6NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213478"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:37 -0700
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
Subject: [PATCH v3 19/26] ASoC: SOF: ipc4-pcm: Handle COMPR DRAIN triggers as EOS pipeline state
Date: Fri, 11 Sep 2026 14:21:45 +0300
Message-ID: <20260911112152.28528-20-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
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

