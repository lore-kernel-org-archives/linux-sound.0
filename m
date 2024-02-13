Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584E4376FC
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 11:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707824843; cv=none; b=a0x19zBP1oWoqse0Sh4ZB3SteRFh+VkcwePkPBoPLwDQR8H7tB8W6bWB1Cl2uSzZ7uNtZM7so2SpOlyLZwk3t9d4Kc0oKDhzTuj5KTGZse7+XaMdSZWQkyHhi85ClOkMyPNGM5s9WyaW+VpK5BZUzgyd0dEoKmJ5C0hIfUa41gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707824843; c=relaxed/simple;
	bh=9b7kXb+dUg4y/nzaKr97VyQKI7KAXihT1c2vysFXZVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H6xVjbyeEcGBzwhVqlPhw02Ae8ZN8wvoAeW2/3HlfUzzC72zBmyG7AB+UctpWJMDG2tSf4BN4Wi9jNK7Fsw61hk0Qg7vQu1Rk8X7zlAyYISA45wosnFoNyQkDWJ+bb+x5rp8anaSEArJ51F9QcIkGc7wA5dKmRmWvZrlpWc+IXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLdW1U+O; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLdW1U+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707824842; x=1739360842;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9b7kXb+dUg4y/nzaKr97VyQKI7KAXihT1c2vysFXZVc=;
  b=LLdW1U+O+dNsVggk+0t+emRMj1MyI0pJlqxqxWlWiBvra9X4JLkF6tPO
   v9My8RtO7ABwJcIy7qc1dXylwg4dr0UuJACwzQr1aUa8Kw3LiPPYrtkvw
   2GmegY4nAEL112qrcaTltUqtrO8ERVkf6hNs81hPahK88eogQDkXFdlnZ
   mM1fT5QL3fuMv0sIlZ6zi9VteqVqchi3/L1VnhneUC8kIXoXTJ2YT/I4i
   7GQ8P+iaoyqgNtQsxiA5im0oqBvSaz7KA8yyIqJnZqhFwUoLutQ/dWNVi
   5ecIcprygralxTuF/WkLrYzU+SGJuMDr6NtyP1AOuzqVE08kf8n5KFPH8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12917295"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="12917295"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 03:47:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="826086774"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="826086774"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 03:47:19 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH] ASoC: SOF: Fix runtime pm usage counter balance after fw exception
Date: Tue, 13 Feb 2024 13:47:29 +0200
Message-ID: <20240213114729.7055-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the retain context is enabled we will unconditionally increment the
device's pm use count on each exception and when the drivers are unloaded
we do not correct this (as we don't know how many times we 'prevented
d3 entry').
Introduce a flag to make sure that we do not increment the use count more
than once and on module unload decrement the use count if needed to
balance it.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/core.c     | 10 ++++++++++
 sound/soc/sof/debug.c    |  8 +++++---
 sound/soc/sof/sof-priv.h |  1 +
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 425b023b03b4..9b00ede2a486 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -679,6 +679,16 @@ int snd_sof_device_remove(struct device *dev)
 	 */
 	snd_sof_machine_unregister(sdev, pdata);
 
+	/*
+	 * Balance the runtime pm usage count in case we are faced with an
+	 * exception and we forcably prevented D3 power state to preserve
+	 * context
+	 */
+	if (sdev->d3_prevented) {
+		sdev->d3_prevented = false;
+		pm_runtime_put_noidle(sdev->dev);
+	}
+
 	if (sdev->fw_state > SOF_FW_BOOT_NOT_STARTED) {
 		sof_fw_trace_free(sdev);
 		ret = snd_sof_dsp_power_down_notify(sdev);
diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index d547318e0d32..7c8aafca8fde 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -433,13 +433,15 @@ static void snd_sof_ipc_dump(struct snd_sof_dev *sdev)
 
 void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev, const char *msg)
 {
-	if (IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_RETAIN_DSP_CONTEXT) ||
-	    sof_debug_check_flag(SOF_DBG_RETAIN_CTX)) {
+	if ((IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_RETAIN_DSP_CONTEXT) ||
+	    sof_debug_check_flag(SOF_DBG_RETAIN_CTX)) && !sdev->d3_prevented) {
 		/* should we prevent DSP entering D3 ? */
 		if (!sdev->ipc_dump_printed)
 			dev_info(sdev->dev,
 				 "Attempting to prevent DSP from entering D3 state to preserve context\n");
-		pm_runtime_get_if_in_use(sdev->dev);
+
+		if (pm_runtime_get_if_in_use(sdev->dev) == 1)
+			sdev->d3_prevented = true;
 	}
 
 	/* dump vital information to the logs */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 6d7897bf9607..5755c997a9de 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -595,6 +595,7 @@ struct snd_sof_dev {
 	struct list_head dfsentry_list;
 	bool dbg_dump_printed;
 	bool ipc_dump_printed;
+	bool d3_prevented; /* runtime pm use count incremented to prevent context lost */
 
 	/* firmware loader */
 	struct sof_ipc_fw_ready fw_ready;
-- 
2.43.0

