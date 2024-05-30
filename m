Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D7417D34F
	for <linux-sound@vger.kernel.org>; Thu, 30 May 2024 11:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717067947; cv=none; b=Jk1VV0cdn8/F7mFVH5XGl8fD0IPv0XnuvxU2qn2NcpDs/Cv+8SLaqlwsJBUaQtm2QS6TvYoYaPAkJX9G4CfNCoQRpE0++k39D362ScFi/9mq5yoep6yt/XKmYDWJ8nKbNuWUd+6sj2gJNvyHI58gZ2G+AECwvConpemhk4EwIPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717067947; c=relaxed/simple;
	bh=qm8Q87mkFDFmlCy+gHLndQRz7pUQuncACFjOJo2SQPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJ0prTW+5mkszD0dAPnTthJo2q8UllI0X0FAAmR/vPzCE3DafHwGw7NLo632hOX/0ZRvo+PHEbWm+RZzVCV6zjRpdhvw6yz8oN9sVz6818nX/Z7tFEEs+ZV/S1QD74hIwvcfJG3FACX0LOxak0wPUqMsyPpdbgqQ0+uE60miEII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zl5PwQGq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zl5PwQGq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717067946; x=1748603946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qm8Q87mkFDFmlCy+gHLndQRz7pUQuncACFjOJo2SQPc=;
  b=Zl5PwQGqK8SYeNAspvA/wG51RpEMcPA9I8ubL9KEeHAdZsnQdYcdqHqZ
   ngF81J3M6dXJVJGregHHF7RyJLe6BfFL1o7tV7ZNqzvapeMXwGXX4zr82
   aYYgZmRCtWrMmvG0cB126DB+izFBICPdszjQAQV+aVdNDPY19pKL9z7nk
   O4/fp57jmuvuJ6Gcoj+s+YKKdgRuq9MaKqbYO1mpYK5OeJCWjs928YVOa
   kXhH6UaKGt1UO9yIcOQxm3Gnnl457/YzJbjePyzg8vFwU5OIsNIOmI+V/
   VO5yQUx1IOIURhIH/mVJeyrHVznqCtU4EVmtSULIcA+hEZZjjyJ00b0Yc
   Q==;
X-CSE-ConnectionGUID: 6H2TuY+NRpa3mWy769Q6dA==
X-CSE-MsgGUID: Fv4xmGCHQ/ebFc2Um3Ahew==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="31065280"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="31065280"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 04:19:06 -0700
X-CSE-ConnectionGUID: Ir9PbHJzSQCZzBLxpeHhuw==
X-CSE-MsgGUID: XxDPp5vITlSNl2GEhdsW5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="73258792"
Received: from unknown (HELO pujfalus-desk.intel.com) ([10.124.223.207])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 04:19:03 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	seppo.ingalsuo@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 6.10 4/5] ASoC: SOF: ipc4-topology: Improve readability of sof_ipc4_prepare_dai_copier()
Date: Thu, 30 May 2024 14:19:17 +0300
Message-ID: <20240530111918.21974-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530111918.21974-1-peter.ujfalusi@linux.intel.com>
References: <20240530111918.21974-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the duplicated code paths to check for single bit depth and to
update the params with storing the parameters needed by the function and
have a single code section.

No functional change but the code is easier to follow.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 42 +++++++++++++++--------------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index adaef7b47b3f..4c455d1bfd89 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1598,8 +1598,10 @@ sof_ipc4_prepare_dai_copier(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
 	struct sof_ipc4_available_audio_format *available_fmt;
 	struct snd_pcm_hw_params dai_params = *params;
 	struct sof_ipc4_copier_data *copier_data;
+	struct sof_ipc4_pin_format *pin_fmts;
 	struct sof_ipc4_copier *ipc4_copier;
 	bool single_bitdepth;
+	u32 num_pin_fmts;
 	int ret;
 
 	ipc4_copier = dai->private;
@@ -1613,31 +1615,23 @@ sof_ipc4_prepare_dai_copier(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
 	 * format lookup
 	 */
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
-		single_bitdepth = sof_ipc4_copier_is_single_bitdepth(sdev,
-						available_fmt->output_pin_fmts,
-						available_fmt->num_output_formats);
-
-		/* Update the dai_params with the only supported format */
-		if (single_bitdepth) {
-			ret = sof_ipc4_update_hw_params(sdev, &dai_params,
-					&available_fmt->output_pin_fmts[0].audio_fmt,
-					BIT(SNDRV_PCM_HW_PARAM_FORMAT));
-			if (ret)
-				return ret;
-		}
+		pin_fmts = available_fmt->output_pin_fmts;
+		num_pin_fmts = available_fmt->num_output_formats;
 	} else {
-		single_bitdepth = sof_ipc4_copier_is_single_bitdepth(sdev,
-						available_fmt->input_pin_fmts,
-						available_fmt->num_input_formats);
-
-		/* Update the dai_params with the only supported format */
-		if (single_bitdepth) {
-			ret = sof_ipc4_update_hw_params(sdev, &dai_params,
-					&available_fmt->input_pin_fmts[0].audio_fmt,
-					BIT(SNDRV_PCM_HW_PARAM_FORMAT));
-			if (ret)
-				return ret;
-		}
+		pin_fmts = available_fmt->input_pin_fmts;
+		num_pin_fmts = available_fmt->num_input_formats;
+	}
+
+	single_bitdepth = sof_ipc4_copier_is_single_bitdepth(sdev, pin_fmts,
+							     num_pin_fmts);
+
+	/* Update the dai_params with the only supported format */
+	if (single_bitdepth) {
+		ret = sof_ipc4_update_hw_params(sdev, &dai_params,
+						&pin_fmts[0].audio_fmt,
+						BIT(SNDRV_PCM_HW_PARAM_FORMAT));
+		if (ret)
+			return ret;
 	}
 
 	ret = snd_sof_get_nhlt_endpoint_data(sdev, dai, single_bitdepth,
-- 
2.45.1

