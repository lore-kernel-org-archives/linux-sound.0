Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C0544AB73
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363039; cv=none; b=amKwivntvNRGRbTQwp+5rMYE5TcWGLbB43Iiaou9X+/3uMT6kn4eYqty4KHTZEGkl0yJjptdZX71be9vYAH/J9bh7AsYx/riyRbxtPrzA/REB+Tuu03nwe/4s5MSv4GGSXqGH7lkZ6hxDSmIjkY+MAPxs7a4PoDbebpDIeNF8QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363039; c=relaxed/simple;
	bh=rcVz48lpMzphmcfztqvwN/fpJIGf5wpMaPJzsQrFyaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QVp257Ch/pgzh41oWmXHt6NT4tWtLwlMnTNAWQXGWCeG5REv0sUeBsBk1u+oFtvj4aZUBYJ6a6JHANif9pMbA0BjoP5hOdk/270Wy/PZjAvdhiNOo44e2H5bWqISKdWG2adlgan1pWZnYXWRGHCTD5/RMWnUbRRxev/OK3Lcyf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VaNpoEXq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VaNpoEXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791363038; x=1822899038;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rcVz48lpMzphmcfztqvwN/fpJIGf5wpMaPJzsQrFyaY=;
  b=VaNpoEXqXDJ8MpxagvYibFvw7BOh4zfDnUXjG/0DZDPi1vM5k77ev4Jf
   NxLjMxR8gg6iew2vKLt+5q4lLrkduEXMzJKAdnmXOf/LRd/Px76uLrMCR
   0ZL4htKAK+I9lkQDePnL51SO9q7dxJgdCuj3N2GhoaIFh5d+1KyMnAqJB
   vcySyzo6GdRUvgDRiIiF+BtAdkmm3A7yMf7vzDZia27r93jSsKOfZ6Iwe
   Kuj2ZJf8JKdlV/BlVl181kPHOf8uQGNxuEYJ5UU1GpI2jYYa6HkG5Q1m3
   GkHfxv2CDCJS6TpYR+gdfGFjgrUEW43g/7QazuokCZAhM8MZcjPpouxpf
   g==;
X-CSE-ConnectionGUID: ZcN3x8KbSRSkvERo4lKmRA==
X-CSE-MsgGUID: Cze3nk2fRf+DBu3WTO7dBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="114027"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="114027"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:38 -0700
X-CSE-ConnectionGUID: QKfIBGLTTvasD0iBcd043Q==
X-CSE-MsgGUID: ykdba2FGS9+ZQrXZgNirmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670787"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:35 -0700
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
Subject: [PATCH v5 20/28] ASoC: SOF: ipc4-pcm: Handle COMPR DRAIN triggers as EOS pipeline state
Date: Wed,  7 Oct 2026 11:49:47 +0300
Message-ID: <20261007084955.1256-21-peter.ujfalusi@linux.intel.com>
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
2.56.0

