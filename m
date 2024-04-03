Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017761DFCE
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 10:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712141531; cv=none; b=nS2ohzw4M0+OhxcEoaW/YWvC/0hPPlstlyBuo4OdWh5SHxLCRYn3FzE2Xquy+qERQU0knOtpyoNm6iNR6tAdKnKxrdsQcMDB9sYEIekHAT3APLqimFyL6W26aUP+ylxxf91xALKESp6uyS89RgTB5GqdGfSqIINB4VqG98DnZ/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712141531; c=relaxed/simple;
	bh=G6G69kKaVR6Ff3xOyjllVLYIfO5HVjDwgECuLWhpX+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JbZgZhMCblrZXIvVcC2Keqiq2zrxDMEbcR4vLyhMVqPno42JHj8mhkptIuyLGZ9+lV85SKtPq0YoyMLFQ4Dwpjcy8y/90egKoMzymq75pt5dc4t3o+ryqdShyQHrxCHhWLfj8foNl8bFAizDcPrw+Vp/uDxsUe4RwekrJ/Nuh/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXxHcOg/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXxHcOg/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712141530; x=1743677530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G6G69kKaVR6Ff3xOyjllVLYIfO5HVjDwgECuLWhpX+s=;
  b=EXxHcOg/YDtbEZHknNPIbAib3oBu/BWyk685t2JyV9iCao2+JhHLrDeJ
   8i18gyaIjmm/FasUcNuO84MCKvZ5DUPiSRyaoLofZ5jYANZ4uIKrbI+qQ
   XN+wJ7Zop2YulFdTnjIfTtM6R1cD0X5wC68wR2/Kl8/dU2Dm2jjjFGZYT
   xpzMM+hXs78XV4qKz82J9Q8X0EIatIAQEQKll91Zr4o6lHO5etG6Tuw+L
   IiBhaeM3nWoO8isUxNqqsY7hVyDMqcZHeR4Kun/PsnO/aokEHPzxJu754
   Zs88F5Hw5xPDC7Rl4/0H4f+sZU7vUl2Rd4rr19yuHOopfUsor9c5vJ0Dm
   w==;
X-CSE-ConnectionGUID: Kf6OA2vHRGqzdRLTvVbzeg==
X-CSE-MsgGUID: iaucNxoSRNyeQ3/XpAAHVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7212187"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7212187"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 03:51:44 -0700
X-CSE-ConnectionGUID: oJvvTn5USfKFG/Ho1ZItSg==
X-CSE-MsgGUID: 9HTFLHQ9RVO3lClMRU3/Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="49374777"
Received: from aelgham-mobl2.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.35.133])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 03:51:42 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	rander.wang@intel.com,
	liam.r.girdwood@intel.com
Subject: [PATCH 1/7] ASoC: SOF: Intel: hda: Create debugfs file to force a clean DSP boot
Date: Wed,  3 Apr 2024 13:52:04 +0300
Message-ID: <20240403105210.17949-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403105210.17949-1-peter.ujfalusi@linux.intel.com>
References: <20240403105210.17949-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When IMR boot is supported on a platform it is always going to be used to
boot the DSP unless some catastrophic event happens.
There is no way for a developer to force a clean DSP boot without removing
and re-inserting the modules.

Create a 'skip_imr_boot' debugfs file which can be used to force the
next DSP boot as clean (prune) boot.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 7 ++++++-
 sound/soc/sof/intel/hda.c        | 1 +
 sound/soc/sof/intel/lnl.c        | 7 ++++++-
 sound/soc/sof/intel/mtl.c        | 7 ++++++-
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index b81f231abee3..d5b9209beb5a 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -15,6 +15,7 @@
  * Hardware interface for HDA DSP code loader
  */
 
+#include <linux/debugfs.h>
 #include <linux/firmware.h>
 #include <sound/hdaudio_ext.h>
 #include <sound/hda_register.h>
@@ -643,8 +644,12 @@ int hda_dsp_post_fw_run(struct snd_sof_dev *sdev)
 		/* Check if IMR boot is usable */
 		if (!sof_debug_check_flag(SOF_DBG_IGNORE_D3_PERSISTENT) &&
 		    (sdev->fw_ready.flags & SOF_IPC_INFO_D3_PERSISTENT ||
-		     sdev->pdata->ipc_type == SOF_IPC_TYPE_4))
+		     sdev->pdata->ipc_type == SOF_IPC_TYPE_4)) {
 			hdev->imrboot_supported = true;
+			debugfs_create_bool("skip_imr_boot",
+					    0644, sdev->debugfs_root,
+					    &hdev->skip_imr_boot);
+		}
 	}
 
 	hda_sdw_int_enable(sdev, true);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index d38dc43c2f1c..33721e817ef4 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -19,6 +19,7 @@
 #include <sound/hda_register.h>
 
 #include <linux/acpi.h>
+#include <linux/debugfs.h>
 #include <linux/module.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_intel.h>
diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index d1c73d407e68..5114411f1e36 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -6,6 +6,7 @@
  * Hardware interface for audio DSP on LunarLake.
  */
 
+#include <linux/debugfs.h>
 #include <linux/firmware.h>
 #include <sound/hda_register.h>
 #include <sound/sof/ipc4/header.h>
@@ -83,8 +84,12 @@ static int lnl_dsp_post_fw_run(struct snd_sof_dev *sdev)
 		struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 
 		/* Check if IMR boot is usable */
-		if (!sof_debug_check_flag(SOF_DBG_IGNORE_D3_PERSISTENT))
+		if (!sof_debug_check_flag(SOF_DBG_IGNORE_D3_PERSISTENT)) {
 			hda->imrboot_supported = true;
+			debugfs_create_bool("skip_imr_boot",
+					    0644, sdev->debugfs_root,
+					    &hda->skip_imr_boot);
+		}
 	}
 
 	return 0;
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 060c34988e90..c640fbf6615a 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -9,6 +9,7 @@
  * Hardware interface for audio DSP on Meteorlake.
  */
 
+#include <linux/debugfs.h>
 #include <linux/firmware.h>
 #include <sound/sof/ipc4/header.h>
 #include <trace/events/sof_intel.h>
@@ -294,8 +295,12 @@ int mtl_dsp_post_fw_run(struct snd_sof_dev *sdev)
 		}
 
 		/* Check if IMR boot is usable */
-		if (!sof_debug_check_flag(SOF_DBG_IGNORE_D3_PERSISTENT))
+		if (!sof_debug_check_flag(SOF_DBG_IGNORE_D3_PERSISTENT)) {
 			hdev->imrboot_supported = true;
+			debugfs_create_bool("skip_imr_boot",
+					    0644, sdev->debugfs_root,
+					    &hdev->skip_imr_boot);
+		}
 	}
 
 	hda_sdw_int_enable(sdev, true);
-- 
2.44.0

