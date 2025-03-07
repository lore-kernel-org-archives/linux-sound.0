Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E74D217704
	for <linux-sound@vger.kernel.org>; Fri,  7 Mar 2025 11:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741346871; cv=none; b=U4/4hUZslrzycO41AN3Xg44DGwJNwmQnfYXpIuHE7lSobPtSsqmuQnGGRnpgKlzi2LEe2q4hQ0mNc38JZIbiJBYPWFZKD6DzVxA1IgirdxWlCzN1+wZztb68RuACqwFKp1+NCtySfDtLVdpEtxzAeI2xg52E0fAU2KIxkPp0NEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741346871; c=relaxed/simple;
	bh=sbsHXX2gjrY36EUJ/Ghme61ZTt17EMFENIsQec7baPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+0E3nRJKxcqOFszJZyvF+sRBm7pZmSVSpvM456vzldrtki6XJDlS6sR/FWz6tamSaWVaocETXDp4Egaf/GTMrdwHjc/iD38Lst3YVw5vHGeYPJHD0s+377j8TXxijMq3ExcihNJbo3B0uk/LK3CkcIIB0eqYyYxknX3U3mQXmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i4HnWc4y; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i4HnWc4y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741346870; x=1772882870;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sbsHXX2gjrY36EUJ/Ghme61ZTt17EMFENIsQec7baPE=;
  b=i4HnWc4yDwRoOgOWS6EXqY6P/j9XufKTyNavTT4PAtCVY/8+aU7TJDfS
   gR5eAQgIXTpeRzYTaIlmhHvrO+csYDCZmZ2jDE5hg0eqanGp0Lk8I99vE
   oUytC7/1IBhReSyKLV7WjoQ6bXlG6EQl2+ZCqgbwT7wFxkc5tEpcjjudN
   B6zRZB64/GAOhR1gSazEM3L/tdbG5eBwnbLta/ZKzXVdvHMbjbZ+XONz1
   gW/yUVPU4ArP8VAvSd7rKVnxtRleOcVuo9OYX6I0tE3WRQfHi5VC0uiqq
   Qw1Vk2xGwc+qcfGftk4jyL/5+9LYqz6J2SgyxGHbCw7KfkFNw0r2LbaiY
   Q==;
X-CSE-ConnectionGUID: 4+OxMwKQQSu/SWE3ELm+YQ==
X-CSE-MsgGUID: I3lqRTc1TPavPw5rGJ6wkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="29972289"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="29972289"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:27:50 -0800
X-CSE-ConnectionGUID: keHtHD9sReaUx8snXcEybQ==
X-CSE-MsgGUID: QHnbF4SZSUyFLFVp8oBgwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="124390682"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.249.140])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:27:47 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	amadeuszx.slawinski@linux.intel.com
Subject: [PATCH v2 2/8] ASoC: SOF: Intel: lnl/ptl: Only set dsp_ops which differs from MTL
Date: Fri,  7 Mar 2025 13:28:10 +0200
Message-ID: <20250307112816.1495-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307112816.1495-1-peter.ujfalusi@linux.intel.com>
References: <20250307112816.1495-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LunarLake is a next generation in ACE architecture and most of the dsp_ops
are the same as it is in previous generation.
Use the sof_mtl_set_ops() to get the ops used for mtl and update the ones
that needs different functions for LNL.

Update pci-ptl at the same time to use the LNL dsp_ops as before.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda.h     |  2 -
 sound/soc/sof/intel/lnl.c     | 86 +++++++----------------------------
 sound/soc/sof/intel/lnl.h     |  2 +
 sound/soc/sof/intel/pci-lnl.c | 12 +++--
 sound/soc/sof/intel/pci-ptl.c | 15 ++++--
 5 files changed, 38 insertions(+), 79 deletions(-)

diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 92b7402e752e..76154627fc17 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -913,8 +913,6 @@ extern struct snd_sof_dsp_ops sof_tgl_ops;
 int sof_tgl_ops_init(struct snd_sof_dev *sdev);
 extern struct snd_sof_dsp_ops sof_icl_ops;
 int sof_icl_ops_init(struct snd_sof_dev *sdev);
-extern struct snd_sof_dsp_ops sof_lnl_ops;
-int sof_lnl_ops_init(struct snd_sof_dev *sdev);
 
 extern const struct sof_intel_dsp_desc skl_chip_info;
 extern const struct sof_intel_dsp_desc apl_chip_info;
diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index 793d8539821d..ffda39ca3606 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -20,17 +20,6 @@
 #include "lnl.h"
 #include <sound/hda-mlink.h>
 
-/* LunarLake ops */
-struct snd_sof_dsp_ops sof_lnl_ops;
-EXPORT_SYMBOL_NS(sof_lnl_ops, "SND_SOC_SOF_INTEL_LNL");
-
-static const struct snd_sof_debugfs_map lnl_dsp_debugfs[] = {
-	{"hda", HDA_DSP_HDA_BAR, 0, 0x4000, SOF_DEBUGFS_ACCESS_ALWAYS},
-	{"pp", HDA_DSP_PP_BAR,  0, 0x1000, SOF_DEBUGFS_ACCESS_ALWAYS},
-	{"dsp", HDA_DSP_BAR,  0, 0x10000, SOF_DEBUGFS_ACCESS_ALWAYS},
-	{"fw_regs", HDA_DSP_BAR,  MTL_SRAM_WINDOW_OFFSET(0), 0x1000, SOF_DEBUGFS_ACCESS_D0_ONLY},
-};
-
 /* this helps allows the DSP to setup DMIC/SSP */
 static int hdac_bus_offload_dmic_ssp(struct hdac_bus *bus, bool enable)
 {
@@ -111,78 +100,32 @@ static int lnl_dsp_post_fw_run(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-int sof_lnl_ops_init(struct snd_sof_dev *sdev)
+int sof_lnl_set_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *dsp_ops)
 {
-	struct sof_ipc4_fw_data *ipc4_data;
+	int ret;
 
-	/* common defaults */
-	memcpy(&sof_lnl_ops, &sof_hda_common_ops, sizeof(struct snd_sof_dsp_ops));
+	ret = sof_mtl_set_ops(sdev, dsp_ops);
+	if (ret)
+		return ret;
 
 	/* probe/remove */
 	if (!sdev->dspless_mode_selected) {
-		sof_lnl_ops.probe = lnl_hda_dsp_probe;
-		sof_lnl_ops.remove = lnl_hda_dsp_remove;
+		dsp_ops->probe = lnl_hda_dsp_probe;
+		dsp_ops->remove = lnl_hda_dsp_remove;
 	}
 
-	/* shutdown */
-	sof_lnl_ops.shutdown = hda_dsp_shutdown;
-
-	/* doorbell */
-	sof_lnl_ops.irq_thread = mtl_ipc_irq_thread;
-
-	/* ipc */
-	sof_lnl_ops.send_msg = mtl_ipc_send_msg;
-	sof_lnl_ops.get_mailbox_offset = mtl_dsp_ipc_get_mailbox_offset;
-	sof_lnl_ops.get_window_offset = mtl_dsp_ipc_get_window_offset;
-
-	/* debug */
-	sof_lnl_ops.debug_map = lnl_dsp_debugfs;
-	sof_lnl_ops.debug_map_count = ARRAY_SIZE(lnl_dsp_debugfs);
-	sof_lnl_ops.dbg_dump = mtl_dsp_dump;
-	sof_lnl_ops.ipc_dump = mtl_ipc_dump;
-
-	/* pre/post fw run */
-	sof_lnl_ops.pre_fw_run = mtl_dsp_pre_fw_run;
-	sof_lnl_ops.post_fw_run = lnl_dsp_post_fw_run;
-
-	/* parse platform specific extended manifest */
-	sof_lnl_ops.parse_platform_ext_manifest = NULL;
-
-	/* dsp core get/put */
-	/* TODO: add core_get and core_put */
+	/* post fw run */
+	dsp_ops->post_fw_run = lnl_dsp_post_fw_run;
 
 	/* PM */
 	if (!sdev->dspless_mode_selected) {
-		sof_lnl_ops.resume = lnl_hda_dsp_resume;
-		sof_lnl_ops.runtime_resume = lnl_hda_dsp_runtime_resume;
+		dsp_ops->resume = lnl_hda_dsp_resume;
+		dsp_ops->runtime_resume = lnl_hda_dsp_runtime_resume;
 	}
 
-	/* dsp core get/put */
-	sof_lnl_ops.core_get = mtl_dsp_core_get;
-	sof_lnl_ops.core_put = mtl_dsp_core_put;
-
-	sdev->private = kzalloc(sizeof(struct sof_ipc4_fw_data), GFP_KERNEL);
-	if (!sdev->private)
-		return -ENOMEM;
-
-	ipc4_data = sdev->private;
-	ipc4_data->manifest_fw_hdr_offset = SOF_MAN4_FW_HDR_OFFSET;
-
-	ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_2;
-
-	ipc4_data->fw_context_save = true;
-
-	/* External library loading support */
-	ipc4_data->load_library = hda_dsp_ipc4_load_library;
-
-	/* set DAI ops */
-	hda_set_dai_drv_ops(sdev, &sof_lnl_ops);
-
-	sof_lnl_ops.set_power_state = hda_dsp_set_power_state_ipc4;
-
 	return 0;
-};
-EXPORT_SYMBOL_NS(sof_lnl_ops_init, "SND_SOC_SOF_INTEL_LNL");
+}
+EXPORT_SYMBOL_NS(sof_lnl_set_ops, "SND_SOC_SOF_INTEL_LNL");
 
 /* Check if an SDW IRQ occurred */
 static bool lnl_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
@@ -262,3 +205,6 @@ const struct sof_intel_dsp_desc ptl_chip_info = {
 	.hw_ip_version = SOF_INTEL_ACE_3_0,
 };
 EXPORT_SYMBOL_NS(ptl_chip_info, "SND_SOC_SOF_INTEL_LNL");
+
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_MTL");
+MODULE_IMPORT_NS("SND_SOC_SOF_HDA_MLINK");
diff --git a/sound/soc/sof/intel/lnl.h b/sound/soc/sof/intel/lnl.h
index 79101af84b2e..e585b93d2b63 100644
--- a/sound/soc/sof/intel/lnl.h
+++ b/sound/soc/sof/intel/lnl.h
@@ -12,4 +12,6 @@
 #define LNL_DSP_REG_HFDSC		0x160200 /* DSP core0 status */
 #define LNL_DSP_REG_HFDEC		0x160204 /* DSP core0 error */
 
+int sof_lnl_set_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *dsp_ops);
+
 #endif /* __SOF_INTEL_LNL_H */
diff --git a/sound/soc/sof/intel/pci-lnl.c b/sound/soc/sof/intel/pci-lnl.c
index 8d4d74ac4398..91b9cff8c4ca 100644
--- a/sound/soc/sof/intel/pci-lnl.c
+++ b/sound/soc/sof/intel/pci-lnl.c
@@ -18,7 +18,15 @@
 
 /* platform specific devices */
 #include "hda.h"
-#include "mtl.h"
+#include "lnl.h"
+
+/* LunarLake ops */
+static struct snd_sof_dsp_ops sof_lnl_ops;
+
+static int sof_lnl_ops_init(struct snd_sof_dev *sdev)
+{
+	return sof_lnl_set_ops(sdev, &sof_lnl_ops);
+}
 
 static const struct sof_dev_desc lnl_desc = {
 	.use_acpi_target_states	= true,
@@ -73,6 +81,4 @@ MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for LunarLake platforms");
 MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_GENERIC");
 MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_COMMON");
-MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_MTL");
-MODULE_IMPORT_NS("SND_SOC_SOF_HDA_MLINK");
 MODULE_IMPORT_NS("SND_SOC_SOF_PCI_DEV");
diff --git a/sound/soc/sof/intel/pci-ptl.c b/sound/soc/sof/intel/pci-ptl.c
index c4fb6a2441b7..32f93723ee66 100644
--- a/sound/soc/sof/intel/pci-ptl.c
+++ b/sound/soc/sof/intel/pci-ptl.c
@@ -16,7 +16,15 @@
 
 /* platform specific devices */
 #include "hda.h"
-#include "mtl.h"
+#include "lnl.h"
+
+/* PantherLake ops */
+static struct snd_sof_dsp_ops sof_ptl_ops;
+
+static int sof_ptl_ops_init(struct snd_sof_dev *sdev)
+{
+	return sof_lnl_set_ops(sdev, &sof_ptl_ops);
+}
 
 static const struct sof_dev_desc ptl_desc = {
 	.use_acpi_target_states	= true,
@@ -43,8 +51,8 @@ static const struct sof_dev_desc ptl_desc = {
 		[SOF_IPC_TYPE_4] = "sof-ptl.ri",
 	},
 	.nocodec_tplg_filename = "sof-ptl-nocodec.tplg",
-	.ops = &sof_lnl_ops,
-	.ops_init = sof_lnl_ops_init,
+	.ops = &sof_ptl_ops,
+	.ops_init = sof_ptl_ops_init,
 };
 
 /* PCI IDs */
@@ -73,6 +81,5 @@ MODULE_DESCRIPTION("SOF support for PantherLake platforms");
 MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_GENERIC");
 MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_COMMON");
 MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_LNL");
-MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_MTL");
 MODULE_IMPORT_NS("SND_SOC_SOF_HDA_MLINK");
 MODULE_IMPORT_NS("SND_SOC_SOF_PCI_DEV");
-- 
2.48.1

