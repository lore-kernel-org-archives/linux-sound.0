Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3133E28F5
	for <linux-sound@vger.kernel.org>; Fri,  3 May 2024 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714744356; cv=none; b=Yhhpen0EJmC84KWreNJd65tECLtpcMCpF2xjgS35S2FMsNLwsM2+mlUwARb5QbN0KTn55Cs7Q+u/0sNhDwDOKyPE2yZZTcEUDjlMvSuxREi5JYGJalkqfiy4fCTiyGxE5KL11MHuWLQyEAoXrj0ICQQA7kzIEvgZ68+/Mg1qNIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714744356; c=relaxed/simple;
	bh=+wN3yZnCk76F76EBrwtUp3XcashJbQ3AWpKItiCqS/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fGFtTlWZjo50aCgHllKU1uUw2xxL2do2k8SooRZQRPtxoZZkqO0ODTE/6uUqdbIwoWtV4P5+EDaGeDolpcMJGB+rAf5rT5ENXuxD4F7QAXKj3DVxxLqdLJuANMxwu++uEFxCzru3Myh3BPNd1xuKb3uR+LN4dqn7iDByARIBxuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YD1I40HU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YD1I40HU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714744355; x=1746280355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+wN3yZnCk76F76EBrwtUp3XcashJbQ3AWpKItiCqS/o=;
  b=YD1I40HUSTR8m9Ms160oJZ5lCDGb+F9gyDzGgjkJ0IS39Mj0wQET250z
   1tWR1EtrfxNzLd5VlLgzyJC5uCGbjJKclcmJ0P/+L3E+gT+B6HXK3n7WP
   R7mOQbVuyWeW11fS51YaNeRZ6KiAJR/GuLpkwMpRS8xUKsC5CPWhzB+N0
   WvqhTBv0ZJkkHLigPHvMcBVHjuoeV9hSlUmPYmUi2BD1scrytsd3Qd/Ye
   9m4WHEQnztYjjkDqSA9WIkxpSxxQFZb+nbtXbwgkOw/F2AkGFHYslWCYt
   3NmUX4BRJDRDhJTR5Bvs3C7FdhwnUzUYxdui0lpTB0XXwsXbX8ddTz4PD
   A==;
X-CSE-ConnectionGUID: L2CNPLobQPyUdQuQCaVlEg==
X-CSE-MsgGUID: HVjNA9jyQ+GkULKzwuXiCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28029412"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="28029412"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:52:35 -0700
X-CSE-ConnectionGUID: bPUE7Pn3RLyNsJe375LLFg==
X-CSE-MsgGUID: j0OQ6yVdQ96RLx7SDsIlqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27548725"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.113.3])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:52:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 2/7] ASoC: SOF: Intel: regroup all SoundWire/Intel functions in hda.c
Date: Fri,  3 May 2024 08:52:16 -0500
Message-Id: <20240503135221.229202-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
References: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To avoid circular dependencies between SOF/Intel and SoundWire/Intel,
we need to split the top-level hda.c from the rest of the code. This
patch first regroups all SoundWire related code in hda.c.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 40 --------------------------------
 sound/soc/sof/intel/hda.c        | 39 +++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index dc88b7ea599e..d0474522ea76 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -15,7 +15,6 @@
  * Hardware interface for HDA DSP code loader
  */
 
-#include <linux/debugfs.h>
 #include <linux/firmware.h>
 #include <sound/hdaudio_ext.h>
 #include <sound/hda_register.h>
@@ -651,45 +650,6 @@ int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
 	return ret;
 }
 
-/* pre fw run operations */
-int hda_dsp_pre_fw_run(struct snd_sof_dev *sdev)
-{
-	/* disable clock gating and power gating */
-	return hda_dsp_ctrl_clock_power_gating(sdev, false);
-}
-
-/* post fw run operations */
-int hda_dsp_post_fw_run(struct snd_sof_dev *sdev)
-{
-	int ret;
-
-	if (sdev->first_boot) {
-		struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
-
-		ret = hda_sdw_startup(sdev);
-		if (ret < 0) {
-			dev_err(sdev->dev,
-				"error: could not startup SoundWire links\n");
-			return ret;
-		}
-
-		/* Check if IMR boot is usable */
-		if (!sof_debug_check_flag(SOF_DBG_IGNORE_D3_PERSISTENT) &&
-		    (sdev->fw_ready.flags & SOF_IPC_INFO_D3_PERSISTENT ||
-		     sdev->pdata->ipc_type == SOF_IPC_TYPE_4)) {
-			hdev->imrboot_supported = true;
-			debugfs_create_bool("skip_imr_boot",
-					    0644, sdev->debugfs_root,
-					    &hdev->skip_imr_boot);
-		}
-	}
-
-	hda_sdw_int_enable(sdev, true);
-
-	/* re-enable clock gating and power gating */
-	return hda_dsp_ctrl_clock_power_gating(sdev, true);
-}
-
 int hda_dsp_ext_man_get_cavs_config_data(struct snd_sof_dev *sdev,
 					 const struct sof_ext_man_elem_header *hdr)
 {
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index d4f039ed4ad4..e86236d35fe8 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -545,6 +545,45 @@ static inline bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
 
 #endif /* IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE) */
 
+/* pre fw run operations */
+int hda_dsp_pre_fw_run(struct snd_sof_dev *sdev)
+{
+	/* disable clock gating and power gating */
+	return hda_dsp_ctrl_clock_power_gating(sdev, false);
+}
+
+/* post fw run operations */
+int hda_dsp_post_fw_run(struct snd_sof_dev *sdev)
+{
+	int ret;
+
+	if (sdev->first_boot) {
+		struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
+
+		ret = hda_sdw_startup(sdev);
+		if (ret < 0) {
+			dev_err(sdev->dev,
+				"error: could not startup SoundWire links\n");
+			return ret;
+		}
+
+		/* Check if IMR boot is usable */
+		if (!sof_debug_check_flag(SOF_DBG_IGNORE_D3_PERSISTENT) &&
+		    (sdev->fw_ready.flags & SOF_IPC_INFO_D3_PERSISTENT ||
+		     sdev->pdata->ipc_type == SOF_IPC_TYPE_4)) {
+			hdev->imrboot_supported = true;
+			debugfs_create_bool("skip_imr_boot",
+					    0644, sdev->debugfs_root,
+					    &hdev->skip_imr_boot);
+		}
+	}
+
+	hda_sdw_int_enable(sdev, true);
+
+	/* re-enable clock gating and power gating */
+	return hda_dsp_ctrl_clock_power_gating(sdev, true);
+}
+
 /*
  * Debug
  */
-- 
2.40.1

