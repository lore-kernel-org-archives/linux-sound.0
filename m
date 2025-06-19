Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A690618EFD4
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 10:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750330590; cv=none; b=lxcAG+FhTwF1QqFOLu9v5KCAVKY8OR6JILxT5wkDRoymeeiA4pR1VTMIszyIv9j0otUHO/bXP8V78NZ28hPWZJBEE3FJe3l+Gutt7abWwfvk1gfBKO4OPXKrfQcAwCmTqfFiCyo4E/WYtA8joNHjTtSKbRfxIsb1f8g43SfGIQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750330590; c=relaxed/simple;
	bh=6fmkjCwUC4Rs5TEjAkik6rzpW3Xd8CQeTHzZs9vPGlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PIFN7ZYRcecWULgy9ZuidQQVTFuddsCtG4jgj5pp2409ck2R+ipVDjFWKlEmK9RaaxoK0g0iVrtAh3QkH7Mar/x89UV1LR9W0UYSehRkw7WxJ88+gS+3g4j5MW1geEJYt1Y3Q5Vtbu8TWbeDBY6OJ1TJqltskWml2oeYBJlLCoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WyN/BrOL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WyN/BrOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750330588; x=1781866588;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6fmkjCwUC4Rs5TEjAkik6rzpW3Xd8CQeTHzZs9vPGlM=;
  b=WyN/BrOLeVrgoQ/zuKD0hUUuC4logNm6jkDPuhNwDFYVGBTvQM3FAC5a
   MgvjPNphh7ONKsWLhZjOlKKn4K5VGCXgiO5xufTJKSqUr3KMUbxEXMbII
   R7fEaVy/1buH4QKpeaqREM/fSA+ejcUcPOQ577iFlOQNTiY7iImNYSgmz
   nkSfMCAYLcyu3rBGIPwSD5CJQd4iNKFtDBkWRy246N2R8GpV1OBNv9Mx5
   hoyOVA+hkvZX9Bi5tgGDEitcRXGp+ItzSLmixYe2SbYYgA4O1LY/r8PFe
   L4i0hUt5EcQ7swfdcVHAEH9Wo5kBPTOBCZl0krAvEA2OiCL0hTkhsz+hv
   w==;
X-CSE-ConnectionGUID: JhSaMOhtSVOWkmqhDYvmOA==
X-CSE-MsgGUID: mDM7xGSxQvi3I6Hdx3wLgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52282563"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52282563"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:56:28 -0700
X-CSE-ConnectionGUID: qHKoF/D8SFyT4mTK/pyhfQ==
X-CSE-MsgGUID: lpod29p5R02+FvkDRXFX/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="187817363"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.182])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:56:26 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	guennadi.liakhovetski@linux.intel.com,
	liam.r.girdwood@intel.com
Subject: [PATCH 2/2] ASoC: SOF: ipc4/Intel: Add support for library restore firmware functionality
Date: Thu, 19 Jun 2025 13:56:23 +0300
Message-ID: <20250619105623.4546-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619105623.4546-1-peter.ujfalusi@linux.intel.com>
References: <20250619105623.4546-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware will be able to only save and restore the context related to
library management.
This means that even without a full context save, the libraries do not
need to be re-loaded to the firmware after second or consecutive boots.

This is reported via the FW_READY notification, where BIT(15) indicates:
0 - the library restore is not done
1 - library restore is done

This bit is only valid if full context save is not enabled, full context
save is by definition saves and restores the library related book-keeping
as well.

Add a new flag to tell the platform code if the libraries have been
restored, no need to reload them after boot.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof/ipc4/header.h  |  2 ++
 sound/soc/sof/intel/hda-loader.c |  7 +++++--
 sound/soc/sof/ipc4-loader.c      |  6 ++++++
 sound/soc/sof/ipc4-priv.h        |  2 ++
 sound/soc/sof/ipc4.c             | 14 ++++++++++++--
 5 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index f71d04736d17..e85c7afd85a4 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -498,6 +498,8 @@ struct sof_ipc4_intel_mic_privacy_cap {
 #define SOF_IPC4_LOG_CORE_GET(x)		(((x) & SOF_IPC4_LOG_CORE_MASK) >> \
 						 SOF_IPC4_LOG_CORE_SHIFT)
 
+#define SOF_IPC4_FW_READY_LIB_RESTORED		BIT(15)
+
 /* Value of notification type field - must fit into 8 bits */
 enum sof_ipc4_notification_type {
 	/* Phrase detected (notification from WoV module) */
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 49085ca7b46b..2cc11d8b0f70 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -579,8 +579,11 @@ int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
 	struct sof_ipc4_msg msg = {};
 	int ret, ret1;
 
-	/* if IMR booting is enabled and fw context is saved for D3 state, skip the loading */
-	if (reload && hda->booted_from_imr && ipc4_data->fw_context_save)
+	/*
+	 * if IMR booting is enabled and libraries have been restored during fw
+	 * boot, skip the loading
+	 */
+	if (reload && hda->booted_from_imr && ipc4_data->libraries_restored)
 		return 0;
 
 	/* the fw_lib has been verified during loading, we can trust the validity here */
diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index d2f534d65edf..ee61394e73d7 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -494,6 +494,12 @@ int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev)
 			break;
 		case SOF_IPC4_FW_CONTEXT_SAVE:
 			ipc4_data->fw_context_save = *tuple->value;
+			/*
+			 * Set the default libraries_restored value - if full
+			 * context save is supported then it means that
+			 * libraries are restored
+			 */
+			ipc4_data->libraries_restored = ipc4_data->fw_context_save;
 			break;
 		default:
 			break;
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 76dc54a2f07d..45e9b78432f7 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -73,6 +73,7 @@ struct sof_ipc4_fw_library {
  * @max_libs_count: Maximum number of libraries support by the FW including the
  *		    base firmware
  * @fw_context_save: Firmware supports full context save and restore
+ * @libraries_restored: The libraries have been retained during firmware boot
  *
  * @load_library: Callback function for platform dependent library loading
  * @pipeline_state_mutex: Mutex to protect pipeline triggers, ref counts, states and deletion
@@ -88,6 +89,7 @@ struct sof_ipc4_fw_data {
 	int max_num_pipelines;
 	u32 max_libs_count;
 	bool fw_context_save;
+	bool libraries_restored;
 
 	int (*load_library)(struct snd_sof_dev *sdev,
 			    struct sof_ipc4_fw_library *fw_lib, bool reload);
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 37e837b22ac8..0ba0e8e615ae 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -576,9 +576,19 @@ EXPORT_SYMBOL(sof_ipc4_find_debug_slot_offset_by_type);
 
 static int ipc4_fw_ready(struct snd_sof_dev *sdev, struct sof_ipc4_msg *ipc4_msg)
 {
-	/* no need to re-check version/ABI for subsequent boots */
-	if (!sdev->first_boot)
+	if (!sdev->first_boot) {
+		struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+
+		/*
+		 * After the initial boot only check if the libraries have been
+		 * restored when full context save is not enabled
+		 */
+		if (!ipc4_data->fw_context_save)
+			ipc4_data->libraries_restored = !!(ipc4_msg->primary &
+							   SOF_IPC4_FW_READY_LIB_RESTORED);
+
 		return 0;
+	}
 
 	sof_ipc4_create_exception_debugfs_node(sdev);
 
-- 
2.49.0

