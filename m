Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBE01F930
	for <linux-sound@vger.kernel.org>; Tue,  1 Apr 2025 13:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514615; cv=none; b=PKwikRXdXXzN4ly6WOO++P9AaGvq3KT5hWudc3uUqn9jWhUk8SS1PqmbmAJTA+8abbBD14CUiaTQaNPgeGVriP6drAiYsUVuDilODPmpdiSTfwiKcrYtbzduuz+PwdOGTPZY2TZpbyWrav4MVDmbRe3TYgWoBzSeN4MZh5O+dus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514615; c=relaxed/simple;
	bh=llFm4IBrza9kdY7Ae6qOwGSmHVXIffKU9+YO5FtwwAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hVC2aeMfbisIMD+puEUBzgihCMsOqQYxvdmLDMECKqzo2leJ695Dr+Ui3JW9TDh4LK8gGG4fAXyJu/A3N5V2rQj3ydfk+0NLJDzrGyAawqbZ26dElY1GYTbbFB+bxo0S5KzkeCDL9OtS2IBzfFQ2rMYqjSDBlPTsnGPk3zDLnNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mtpGXGls; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtpGXGls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743514613; x=1775050613;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=llFm4IBrza9kdY7Ae6qOwGSmHVXIffKU9+YO5FtwwAg=;
  b=mtpGXGlsXZUyRI6zGaUH9Mz4021cuq4+xuUWArYWDaboAh4/rEtZdhQr
   ZvSz0ypA4da7oek8ZcYIIAGzB0mbCCwAvCEFo03J8FQLlTOGaNS8lO0Wk
   LgSh4y6k6A8tK5AmLVW0+m3eSfzN2DJNixmz+Wq7FLDvDkZgLwyg1ovPG
   Z8Dr2Ifw5B1m4OsPIRYnKZSfNgs8PEiotRMvcOLIHFCLhlPotey8vbt+d
   Ih1gg6HNOeEzYkKHMhmZ5e3MDHL1uwELaxLMAnPM+QiQVPADNyat/HJRd
   h78Wh9LB3zHl2kDd+c0xI/v8qGtGtzf2QmzepfB7+6+z5LTkRUyS4cw9T
   A==;
X-CSE-ConnectionGUID: Urm0z/JGS5qDTASKd7VfMw==
X-CSE-MsgGUID: C8n+MxlZTK+qSFDiyBdTuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44549130"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="44549130"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 06:36:52 -0700
X-CSE-ConnectionGUID: PYIAITcARvy41LWKKbGn/w==
X-CSE-MsgGUID: 9b5TEa9hTTKLXhrN3LgF0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="126217635"
Received: from mpelleg-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.251.179])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 06:36:01 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH] ALSA: pcm: Release paused streams before suspend if resume is not supported
Date: Tue,  1 Apr 2025 16:36:52 +0300
Message-ID: <20250401133652.11617-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Streams moved to SUSPENDED state from PAUSED without trigger. If a stream
does not support RESUME then on system resume the RESUME trigger is not
sent, the stream's state and suspended_state remains untouched.
When the user space releases the pause then the core will reject this
because the state of the stream is _not_ PAUSED, it is still SUSPENDED.

From this point user space will do the normal (hw_params) prepare and
START, PAUSE_RELEASE trigger will not be sent by the core after the
system has resumed.

To fix this issue, release the paused stream before handling the suspend
if the resume is not supported.
This will ensure that the stream is properly suspended for suspend entry.
On resume no attempt will be taken to resume the suspended stream as the
resume is not supported, userspace will eventually going restart the audio.

Link: https://github.com/thesofproject/linux/issues/5035
Link: https://github.com/thesofproject/linux/issues/5341
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/core/pcm_native.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 6c2b6a62d9d2..a16d15ee98fa 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1730,7 +1730,20 @@ static const struct action_ops snd_pcm_action_suspend = {
  */
 static int snd_pcm_suspend(struct snd_pcm_substream *substream)
 {
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
 	guard(pcm_stream_lock_irqsave)(substream);
+	/*
+	 * Release the paused stream before suspending if resume is not
+	 * supported, because:
+	 * PAUSED streams will not receive the suspend trigger and since the
+	 * driver does not support resuming streams, it is not going to be able
+	 * to handle them properly when the system resumes.
+	 */
+	if (runtime->state == SNDRV_PCM_STATE_PAUSED &&
+	    !(runtime->info & SNDRV_PCM_INFO_RESUME))
+		snd_pcm_pause(substream, false);
+
 	return snd_pcm_action(&snd_pcm_action_suspend, substream,
 			      ACTION_ARG_IGNORE);
 }
-- 
2.49.0

