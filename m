Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DEB3BB3A
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 11:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707825147; cv=none; b=jeeKpKqJS5WTBDTYmUhVoKClxm2sJIlQDbrCfLRHvAPHRPsssY2tNz++4PAy26ISU0ZOGXYzjViLIKdN/PJMrjheo5JNpXq7y/awjLEyeCSILFQDtqzWIGp2MW05yTx/vgKxsEjYCrpaAQ431NWplvGh72uOcDYwJt8DV+A6vQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707825147; c=relaxed/simple;
	bh=IxVR45Cx5NWbe3bvWMFHxheIWy8MTO3jyXpvNQE7k38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JqnouVf7sBC2swr5LWEy+Hh4J/UZElXX0fOGbbxuwEGNOPmj5/8AUWjRuTQkYZ1xd8sJ6X8WvbrTHOic8jGLmiaLoNa2f8MNInXZJ2btQGnRTkm/pga7Oo35oKB6NdMBvBrA9fWjW1oTQBXnUWCLtMTVrcqcSqOhUiCmw/abUzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1SJkRe2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1SJkRe2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707825146; x=1739361146;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IxVR45Cx5NWbe3bvWMFHxheIWy8MTO3jyXpvNQE7k38=;
  b=W1SJkRe2FMrx5a0nQAW+3Pz0X7GcSi2Xy4g0H3NAxcoItKXtkTM/H89v
   YUf3BfXEwITn6tZzQHWp54fF1jtWAixoi+4jij32Lh69DEobsEGLRH8XL
   LFWyHPbyCWal1706aBAa1pua6EMHNA4svLas+9mFqzM8F73B4ukOXm33F
   nNbcqJ4WyzaV6uZ7uDqs3vSafz4TtcD74SSvNi0U1HhMUfegz1/jzz2i0
   JiCuIrcsbeyVcLVMPa0cwEjQEXgB++sJuZ39jLJg952RrkeDuwk2uhWDX
   U33qsu+ElCWmpj9Us9NBVqtqotWZNlPfiRjOxriT7ex2mNU1mUiyjfg2Z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1949918"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1949918"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 03:52:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="40332623"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 03:52:24 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4-pcm: Workaround for crashed firmware on system suspend
Date: Tue, 13 Feb 2024 13:52:33 +0200
Message-ID: <20240213115233.15716-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the system is suspended while audio is active, the
sof_ipc4_pcm_hw_free() is invoked to reset the pipelines since during
suspend the DSP is turned off, streams will be re-started after resume.

If the firmware crashes during while audio is running (or when we reset
the stream before suspend) then the sof_ipc4_set_multi_pipeline_state()
will fail with IPC error and the state change is interrupted.
This will cause misalignment between the kernel and firmware state on next
DSP boot resulting errors returned by firmware for IPC messages, eventually
failing the audio resume.
On stream close the errors are ignored so the kernel state will be
corrected on the next DSP boot, so the second boot after the DSP panic.

If sof_ipc4_trigger_pipelines() is called from sof_ipc4_pcm_hw_free() then
state parameter is SOF_IPC4_PIPE_RESET and only in this case.

Treat a forced pipeline reset similarly to how we treat a pcm_free by
ignoring error on state sending to allow the kernel's state to be
consistent with the state the firmware will have after the next boot.

Link: https://github.com/thesofproject/sof/issues/8721
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 85d3f390e4b2..07eb5c6d4adf 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -413,7 +413,18 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	ret = sof_ipc4_set_multi_pipeline_state(sdev, state, trigger_list);
 	if (ret < 0) {
 		dev_err(sdev->dev, "failed to set final state %d for all pipelines\n", state);
-		goto free;
+		/*
+		 * workaround: if the firmware is crashed while setting the
+		 * pipelines to reset state we must ignore the error code and
+		 * reset it to 0.
+		 * Since the firmware is crashed we will not send IPC messages
+		 * and we are going to see errors printed, but the state of the
+		 * widgets will be correct for the next boot.
+		 */
+		if (sdev->fw_state != SOF_FW_CRASHED || state != SOF_IPC4_PIPE_RESET)
+			goto free;
+
+		ret = 0;
 	}
 
 	/* update RUNNING/RESET state for all pipelines that were just triggered */
-- 
2.43.0

