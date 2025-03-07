Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44938218AA2
	for <linux-sound@vger.kernel.org>; Fri,  7 Mar 2025 11:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741346878; cv=none; b=Rf5+u64NqyCen4JDW2vkCp4PH8yD2YZOjuUuBW+Hx5vOfIpOfV8cJqpaaKbmaemlfedznIG7mEsdSl/jTanMpfCnot1oMJ9tibA5Uc+OFKTE+3WXgbIoq4uDd2RCNZGKtYPXp/Pvkk5FF3HzpItojdq/FhpKWne4gG22bZEaX1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741346878; c=relaxed/simple;
	bh=TROEmg1qplUspzWYktCas206XLJQDXLiqrR1p+lWrho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o4GZWIouMrAdmwpaUt3/o5xVRBqkl0+JQP5Mhc1zJT5yM1D6wRmHlPhfleNKKqzwgH0B5GTyPnGKL6wd1SE9DP+uf4jjkfOfMgpxk1fmWr6yaNm4mz0M7nv6YDpXCbV5qboPm05YkXj7d+nhIH+Bj91Dh19RqA53eRgoLt8+/cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jtLcM2eB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jtLcM2eB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741346877; x=1772882877;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TROEmg1qplUspzWYktCas206XLJQDXLiqrR1p+lWrho=;
  b=jtLcM2eBPyoQrjK/1m+U+gborqW1gvqwOApx0YvL7MwxKqSLq9OeR8cU
   EIaQ0PCIIXL1H+STlQr5pg8DNEL+EYfSht6sxQvOMQIZNRKjJh8TzT9tL
   KOTrhFV8LWqeqNpCIW3FEf2IpI6blwYz1qywDjcSc9qsN29zx+C2uf0Ma
   phkELNJF7V/pzGbaQI1k8BQrEVs5lEvHx617vA+oJzVXpqOkMqI0j+lAd
   Tz+f/kgXKxqqA5O/GIzxDSIptWn/8w9c16FTnUavUejoYwI2BaTr2z8XY
   FB1K0QYbyxa5cfDMWCQiWkq3o8T8k24C4zymfP7/77sHHxfGcjNc3+fmQ
   Q==;
X-CSE-ConnectionGUID: 6bzCU6dSSE+PgF0SK86VWg==
X-CSE-MsgGUID: il3zrGTKRZmHqOS0NF6icQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="29972303"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="29972303"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:27:57 -0800
X-CSE-ConnectionGUID: QNXmvDH5T+e/qufD4mpU0w==
X-CSE-MsgGUID: F3+CRQTkRWeQcY46kTobmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="124390690"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.249.140])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:27:54 -0800
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
Subject: [PATCH v2 4/8] ASoC: SOF: Intel: Create ptl.c as placeholder for Panther Lake features
Date: Fri,  7 Mar 2025 13:28:12 +0200
Message-ID: <20250307112816.1495-5-peter.ujfalusi@linux.intel.com>
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

Create a minimal placeholder to make it possible to add code to handle
the new features of Panther Lake compared to MTL/LNL.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/Makefile  |  2 +-
 sound/soc/sof/intel/lnl.c     | 33 ++++------------------
 sound/soc/sof/intel/lnl.h     |  4 +++
 sound/soc/sof/intel/pci-ptl.c |  6 ++--
 sound/soc/sof/intel/ptl.c     | 52 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/ptl.h     | 14 ++++++++++
 6 files changed, 79 insertions(+), 32 deletions(-)
 create mode 100644 sound/soc/sof/intel/ptl.c
 create mode 100644 sound/soc/sof/intel/ptl.h

diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index f40daa616803..675f9fc92dde 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -34,7 +34,7 @@ snd-sof-pci-intel-icl-y := pci-icl.o icl.o
 snd-sof-pci-intel-tgl-y := pci-tgl.o tgl.o
 snd-sof-pci-intel-mtl-y := pci-mtl.o mtl.o
 snd-sof-pci-intel-lnl-y := pci-lnl.o lnl.o
-snd-sof-pci-intel-ptl-y := pci-ptl.o
+snd-sof-pci-intel-ptl-y := pci-ptl.o ptl.o
 
 obj-$(CONFIG_SND_SOC_SOF_MERRIFIELD) += snd-sof-pci-intel-tng.o
 obj-$(CONFIG_SND_SOC_SOF_INTEL_SKL) += snd-sof-pci-intel-skl.o
diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index ffda39ca3606..2f3222040f98 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -128,20 +128,22 @@ int sof_lnl_set_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *dsp_ops)
 EXPORT_SYMBOL_NS(sof_lnl_set_ops, "SND_SOC_SOF_INTEL_LNL");
 
 /* Check if an SDW IRQ occurred */
-static bool lnl_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
+bool lnl_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 
 	return hdac_bus_eml_check_interrupt(bus, true,  AZX_REG_ML_LEPTR_ID_SDW);
 }
+EXPORT_SYMBOL_NS(lnl_dsp_check_sdw_irq, "SND_SOC_SOF_INTEL_LNL");
 
-static int lnl_dsp_disable_interrupts(struct snd_sof_dev *sdev)
+int lnl_dsp_disable_interrupts(struct snd_sof_dev *sdev)
 {
 	mtl_disable_ipc_interrupts(sdev);
 	return mtl_enable_interrupts(sdev, false);
 }
+EXPORT_SYMBOL_NS(lnl_dsp_disable_interrupts, "SND_SOC_SOF_INTEL_LNL");
 
-static bool lnl_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
+bool lnl_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	u16 wake_sts;
@@ -157,6 +159,7 @@ static bool lnl_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
 	/* filter out the range of SDIs that can be set for SoundWire */
 	return wake_sts & GENMASK(SDW_MAX_DEVICES, SDW_INTEL_DEV_NUM_IDA_MIN);
 }
+EXPORT_SYMBOL_NS(lnl_sdw_check_wakeen_irq, "SND_SOC_SOF_INTEL_LNL");
 
 const struct sof_intel_dsp_desc lnl_chip_info = {
 	.cores_num = 5,
@@ -182,29 +185,5 @@ const struct sof_intel_dsp_desc lnl_chip_info = {
 	.hw_ip_version = SOF_INTEL_ACE_2_0,
 };
 
-const struct sof_intel_dsp_desc ptl_chip_info = {
-	.cores_num = 5,
-	.init_core_mask = BIT(0),
-	.host_managed_cores_mask = BIT(0),
-	.ipc_req = MTL_DSP_REG_HFIPCXIDR,
-	.ipc_req_mask = MTL_DSP_REG_HFIPCXIDR_BUSY,
-	.ipc_ack = MTL_DSP_REG_HFIPCXIDA,
-	.ipc_ack_mask = MTL_DSP_REG_HFIPCXIDA_DONE,
-	.ipc_ctl = MTL_DSP_REG_HFIPCXCTL,
-	.rom_status_reg = LNL_DSP_REG_HFDSC,
-	.rom_init_timeout = 300,
-	.ssp_count = MTL_SSP_COUNT,
-	.d0i3_offset = MTL_HDA_VS_D0I3C,
-	.read_sdw_lcount =  hda_sdw_check_lcount_ext,
-	.check_sdw_irq = lnl_dsp_check_sdw_irq,
-	.check_sdw_wakeen_irq = lnl_sdw_check_wakeen_irq,
-	.check_ipc_irq = mtl_dsp_check_ipc_irq,
-	.cl_init = mtl_dsp_cl_init,
-	.power_down_dsp = mtl_power_down_dsp,
-	.disable_interrupts = lnl_dsp_disable_interrupts,
-	.hw_ip_version = SOF_INTEL_ACE_3_0,
-};
-EXPORT_SYMBOL_NS(ptl_chip_info, "SND_SOC_SOF_INTEL_LNL");
-
 MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_MTL");
 MODULE_IMPORT_NS("SND_SOC_SOF_HDA_MLINK");
diff --git a/sound/soc/sof/intel/lnl.h b/sound/soc/sof/intel/lnl.h
index e585b93d2b63..2837f818ac51 100644
--- a/sound/soc/sof/intel/lnl.h
+++ b/sound/soc/sof/intel/lnl.h
@@ -14,4 +14,8 @@
 
 int sof_lnl_set_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *dsp_ops);
 
+bool lnl_dsp_check_sdw_irq(struct snd_sof_dev *sdev);
+int lnl_dsp_disable_interrupts(struct snd_sof_dev *sdev);
+bool lnl_sdw_check_wakeen_irq(struct snd_sof_dev *sdev);
+
 #endif /* __SOF_INTEL_LNL_H */
diff --git a/sound/soc/sof/intel/pci-ptl.c b/sound/soc/sof/intel/pci-ptl.c
index 32f93723ee66..3812ab6d99c0 100644
--- a/sound/soc/sof/intel/pci-ptl.c
+++ b/sound/soc/sof/intel/pci-ptl.c
@@ -16,14 +16,14 @@
 
 /* platform specific devices */
 #include "hda.h"
-#include "lnl.h"
+#include "ptl.h"
 
 /* PantherLake ops */
 static struct snd_sof_dsp_ops sof_ptl_ops;
 
 static int sof_ptl_ops_init(struct snd_sof_dev *sdev)
 {
-	return sof_lnl_set_ops(sdev, &sof_ptl_ops);
+	return sof_ptl_set_ops(sdev, &sof_ptl_ops);
 }
 
 static const struct sof_dev_desc ptl_desc = {
@@ -80,6 +80,4 @@ MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for PantherLake platforms");
 MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_GENERIC");
 MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_COMMON");
-MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_LNL");
-MODULE_IMPORT_NS("SND_SOC_SOF_HDA_MLINK");
 MODULE_IMPORT_NS("SND_SOC_SOF_PCI_DEV");
diff --git a/sound/soc/sof/intel/ptl.c b/sound/soc/sof/intel/ptl.c
new file mode 100644
index 000000000000..ae8e9e08ad2a
--- /dev/null
+++ b/sound/soc/sof/intel/ptl.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// Copyright(c) 2025 Intel Corporation
+
+/*
+ * Hardware interface for audio DSP on PantherLake.
+ */
+
+#include <sound/hda_register.h>
+#include <sound/hda-mlink.h>
+#include <sound/sof/ipc4/header.h>
+#include "../ipc4-priv.h"
+#include "../ops.h"
+#include "hda.h"
+#include "hda-ipc.h"
+#include "../sof-audio.h"
+#include "mtl.h"
+#include "lnl.h"
+#include "ptl.h"
+
+int sof_ptl_set_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *dsp_ops)
+{
+	return sof_lnl_set_ops(sdev, dsp_ops);
+}
+EXPORT_SYMBOL_NS(sof_ptl_set_ops, "SND_SOC_SOF_INTEL_PTL");
+
+const struct sof_intel_dsp_desc ptl_chip_info = {
+	.cores_num = 5,
+	.init_core_mask = BIT(0),
+	.host_managed_cores_mask = BIT(0),
+	.ipc_req = MTL_DSP_REG_HFIPCXIDR,
+	.ipc_req_mask = MTL_DSP_REG_HFIPCXIDR_BUSY,
+	.ipc_ack = MTL_DSP_REG_HFIPCXIDA,
+	.ipc_ack_mask = MTL_DSP_REG_HFIPCXIDA_DONE,
+	.ipc_ctl = MTL_DSP_REG_HFIPCXCTL,
+	.rom_status_reg = LNL_DSP_REG_HFDSC,
+	.rom_init_timeout = 300,
+	.ssp_count = MTL_SSP_COUNT,
+	.d0i3_offset = MTL_HDA_VS_D0I3C,
+	.read_sdw_lcount =  hda_sdw_check_lcount_ext,
+	.check_sdw_irq = lnl_dsp_check_sdw_irq,
+	.check_sdw_wakeen_irq = lnl_sdw_check_wakeen_irq,
+	.check_ipc_irq = mtl_dsp_check_ipc_irq,
+	.cl_init = mtl_dsp_cl_init,
+	.power_down_dsp = mtl_power_down_dsp,
+	.disable_interrupts = lnl_dsp_disable_interrupts,
+	.hw_ip_version = SOF_INTEL_ACE_3_0,
+};
+
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_MTL");
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_LNL");
+MODULE_IMPORT_NS("SND_SOC_SOF_HDA_MLINK");
diff --git a/sound/soc/sof/intel/ptl.h b/sound/soc/sof/intel/ptl.h
new file mode 100644
index 000000000000..186f7c835acb
--- /dev/null
+++ b/sound/soc/sof/intel/ptl.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2025 Intel Corporation
+ */
+
+#ifndef __SOF_INTEL_PTL_H
+#define __SOF_INTEL_PTL_H
+
+int sof_ptl_set_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *dsp_ops);
+
+#endif /* __SOF_INTEL_PTL_H */
-- 
2.48.1

