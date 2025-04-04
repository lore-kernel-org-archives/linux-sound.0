Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3EE1A38E3
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 09:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743759208; cv=none; b=cHi69lhxb5vqKTfUdUolFRb3abxlFoVE3eGmOiI1yFptVBcpRlJe7jOUX/IkF44l5GET7ISkB9WZdDcFJsHJhrry2VXbWTJYqrx7o0q6X6Aa8M1fzxd8H2CgT2uOJUE2HKuguOKMrEyfVSdiPEMqrlPGCfmFcuX9M8yd+28R35I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743759208; c=relaxed/simple;
	bh=idssxDB5hZBhP30TyZhs+EuPfp5xbuQoFeTOFXBLp8Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=grVpSlG54ANJYGOhNL/v3plmBqkDSUM4SeG6lsN5RmIXZFQKQUbTu8ub6spWzkmVGEw4Y97B04w4WrHgYVtQUYz2xGHNrdwzLKAtnzgf1Cq0DpSqdDBiPZ1vjzJMoKUCEAnWdh3g8DxESZs0csFvHiZsUAWIgeOCIqhEumwWYqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CUJVCAYo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CUJVCAYo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743759207; x=1775295207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=idssxDB5hZBhP30TyZhs+EuPfp5xbuQoFeTOFXBLp8Y=;
  b=CUJVCAYo+shXZsIe2OTKQTcItpN6dGFin3VY6y5AdjaBWavRppkB3zCQ
   GLdW6f8cSPFCZFkBsN5ftEYU7DU8wgfUz0ZRYIEowTnuwE3JeD+R9eOHG
   8KGNF2pSXhpgvEB9b1wn90K5CFrzAb0pF9Satr1z/yNrza4ZSKRTSyzq2
   fEDHBVbAkiUCx3ozKYgCKkfTBYd15LM3ApNWvU5E+6pCxmOOCUPQsP4kD
   iZ1u7iY0DwFjKwUxCxWRAbW+QeV/o+ZB2nzzHef9Q+7Y6dgetuIL66UCW
   xlo2PRq+AWFMHFFCyhb2npff3Bfl/fuGPz0nvhyES5eYPsna370LjG02p
   w==;
X-CSE-ConnectionGUID: lmF9vsI3SC6lH4gv8+WFVA==
X-CSE-MsgGUID: mvEtwt9hT1mgm5WuIrQMaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="70566367"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="70566367"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 02:33:23 -0700
X-CSE-ConnectionGUID: Q7xWJbgbRaCthM0sZ5kAPA==
X-CSE-MsgGUID: D5U0sDfgQx6ZlsIgDzD6BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="158248630"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2025 02:33:04 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 07/12] ASoC: Intel: avs: PTL-based platforms support
Date: Fri,  4 Apr 2025 11:49:48 +0200
Message-Id: <20250404094953.3657679-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250404094953.3657679-1-cezary.rojewski@intel.com>
References: <20250404094953.3657679-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With exception of the power() operation, all DSP operations are
inherited from the platform predecessors.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/linux/pci_ids.h         |  1 +
 sound/soc/intel/avs/Makefile    |  2 +-
 sound/soc/intel/avs/avs.h       |  2 +
 sound/soc/intel/avs/core.c      | 24 ++++++++
 sound/soc/intel/avs/lnl.c       |  2 +-
 sound/soc/intel/avs/ptl.c       | 98 +++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/registers.h |  4 ++
 7 files changed, 131 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/intel/avs/ptl.c

diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 1a2594a38199..41cdddc68ebb 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -3066,6 +3066,7 @@
 #define PCI_DEVICE_ID_INTEL_5100_21	0x65f5
 #define PCI_DEVICE_ID_INTEL_5100_22	0x65f6
 #define PCI_DEVICE_ID_INTEL_IOAT_SCNB	0x65ff
+#define PCI_DEVICE_ID_INTEL_HDA_FCL	0x67a8
 #define PCI_DEVICE_ID_INTEL_82371SB_0	0x7000
 #define PCI_DEVICE_ID_INTEL_82371SB_1	0x7010
 #define PCI_DEVICE_ID_INTEL_82371SB_2	0x7020
diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index e86a1854efaf..576dc0da381d 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -4,7 +4,7 @@ snd-soc-avs-y := dsp.o ipc.o messages.o utils.o core.o loader.o \
 		 topology.o path.o pcm.o board_selection.o control.o \
 		 sysfs.o
 snd-soc-avs-y += cldma.o
-snd-soc-avs-y += skl.o apl.o cnl.o icl.o tgl.o mtl.o lnl.o
+snd-soc-avs-y += skl.o apl.o cnl.o icl.o tgl.o mtl.o lnl.o ptl.o
 
 snd-soc-avs-y += trace.o
 # tell define_trace.h where to find the trace header
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index be6521bbf97d..3637a6f59e17 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -71,6 +71,7 @@ extern const struct avs_dsp_ops avs_icl_dsp_ops;
 extern const struct avs_dsp_ops avs_tgl_dsp_ops;
 extern const struct avs_dsp_ops avs_mtl_dsp_ops;
 extern const struct avs_dsp_ops avs_lnl_dsp_ops;
+extern const struct avs_dsp_ops avs_ptl_dsp_ops;
 
 #define AVS_PLATATTR_CLDMA		BIT_ULL(0)
 #define AVS_PLATATTR_IMR		BIT_ULL(1)
@@ -272,6 +273,7 @@ int avs_dsp_enable_d0ix(struct avs_dev *adev);
 int avs_mtl_core_power(struct avs_dev *adev, u32 core_mask, bool power);
 int avs_mtl_core_reset(struct avs_dev *adev, u32 core_mask, bool power);
 int avs_mtl_core_stall(struct avs_dev *adev, u32 core_mask, bool stall);
+int avs_lnl_core_stall(struct avs_dev *adev, u32 core_mask, bool stall);
 void avs_mtl_interrupt_control(struct avs_dev *adev, bool enable);
 void avs_skl_ipc_interrupt(struct avs_dev *adev);
 irqreturn_t avs_cnl_dsp_interrupt(struct avs_dev *adev);
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index b11083ff43b7..fe7994e6136a 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -914,6 +914,26 @@ static const struct avs_spec lnl_desc = {
 	.hipc = &lnl_hipc_spec,
 };
 
+static const struct avs_spec ptl_desc = {
+	.name = "ptl",
+	.min_fw_version = { 0 },
+	.dsp_ops = &avs_ptl_dsp_ops,
+	.core_init_mask = 1,
+	.attributes = AVS_PLATATTR_IMR | AVS_PLATATTR_ACE | AVS_PLATATTR_ALTHDA,
+	.sram = &mtl_sram_spec,
+	.hipc = &lnl_hipc_spec,
+};
+
+static const struct avs_spec fcl_desc = {
+	.name = "fcl",
+	.min_fw_version = { 0 },
+	.dsp_ops = &avs_ptl_dsp_ops,
+	.core_init_mask = 1,
+	.attributes = AVS_PLATATTR_IMR | AVS_PLATATTR_ACE | AVS_PLATATTR_ALTHDA,
+	.sram = &mtl_sram_spec,
+	.hipc = &lnl_hipc_spec,
+};
+
 static const struct pci_device_id avs_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_SKL_LP, &skl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_SKL, &skl_desc) },
@@ -952,6 +972,9 @@ static const struct pci_device_id avs_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_MTL,	&mtl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_ARL_S,	&mtl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_LNL_P,	&lnl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_PTL,	&ptl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_PTL_H,	&ptl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_FCL,	&fcl_desc) },
 	{ 0 }
 };
 MODULE_DEVICE_TABLE(pci, avs_ids);
@@ -985,3 +1008,4 @@ MODULE_FIRMWARE("intel/adl/dsp_basefw.bin");
 MODULE_FIRMWARE("intel/adl_n/dsp_basefw.bin");
 MODULE_FIRMWARE("intel/mtl/dsp_basefw.bin");
 MODULE_FIRMWARE("intel/lnl/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/ptl/dsp_basefw.bin");
diff --git a/sound/soc/intel/avs/lnl.c b/sound/soc/intel/avs/lnl.c
index 46ffe5628548..035d6a13f26e 100644
--- a/sound/soc/intel/avs/lnl.c
+++ b/sound/soc/intel/avs/lnl.c
@@ -10,7 +10,7 @@
 #include "avs.h"
 #include "registers.h"
 
-static int avs_lnl_core_stall(struct avs_dev *adev, u32 core_mask, bool stall)
+int avs_lnl_core_stall(struct avs_dev *adev, u32 core_mask, bool stall)
 {
 	struct hdac_bus *bus = &adev->base.core;
 	struct hdac_ext_link *hlink;
diff --git a/sound/soc/intel/avs/ptl.c b/sound/soc/intel/avs/ptl.c
new file mode 100644
index 000000000000..2be4b545c91d
--- /dev/null
+++ b/sound/soc/intel/avs/ptl.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright(c) 2024-2025 Intel Corporation
+ *
+ * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+ *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+ */
+
+#include <sound/hdaudio_ext.h>
+#include "avs.h"
+#include "registers.h"
+#include "trace.h"
+
+#define MTL_HfDSSGBL_BASE	0x1000
+#define MTL_REG_HfDSSCS		(MTL_HfDSSGBL_BASE + 0x0)
+#define MTL_HfDSSCS_SPA		BIT(16)
+#define MTL_HfDSSCS_CPA		BIT(24)
+
+#define MTL_DSPCS_BASE		0x178D00
+#define MTL_REG_DSPCCTL		(MTL_DSPCS_BASE + 0x4)
+#define MTL_DSPCCTL_OSEL	GENMASK(25, 24)
+#define MTL_DSPCCTL_OSEL_HOST	BIT(25)
+
+static int avs_ptl_core_power_on(struct avs_dev *adev)
+{
+	u32 reg;
+	int ret;
+
+	/* Power up DSP domain. */
+	snd_hdac_adsp_updatel(adev, MTL_REG_HfDSSCS, MTL_HfDSSCS_SPA, MTL_HfDSSCS_SPA);
+	trace_avs_dsp_core_op(1, AVS_MAIN_CORE_MASK, "power dsp", true);
+
+	ret = snd_hdac_adsp_readl_poll(adev, MTL_REG_HfDSSCS, reg,
+				       (reg & MTL_HfDSSCS_CPA) == MTL_HfDSSCS_CPA,
+				       AVS_ADSPCS_INTERVAL_US, AVS_ADSPCS_TIMEOUT_US);
+	if (ret) {
+		dev_err(adev->dev, "power on domain dsp failed: %d\n", ret);
+		return ret;
+	}
+
+	/* Prevent power gating of DSP domain. */
+	snd_hdac_adsp_updatel(adev, MTL_REG_HfPWRCTL2, MTL_HfPWRCTL2_WPDSPHPxPG,
+			      MTL_HfPWRCTL2_WPDSPHPxPG);
+	trace_avs_dsp_core_op(1, AVS_MAIN_CORE_MASK, "prevent dsp PG", true);
+
+	ret = snd_hdac_adsp_readl_poll(adev, MTL_REG_HfPWRSTS2, reg,
+				       (reg & MTL_HfPWRSTS2_DSPHPxPGS) == MTL_HfPWRSTS2_DSPHPxPGS,
+				       AVS_ADSPCS_INTERVAL_US, AVS_ADSPCS_TIMEOUT_US);
+
+	/* Set ownership to HOST. */
+	snd_hdac_adsp_updatel(adev, MTL_REG_DSPCCTL, MTL_DSPCCTL_OSEL, MTL_DSPCCTL_OSEL_HOST);
+	return ret;
+}
+
+static int avs_ptl_core_power_off(struct avs_dev *adev)
+{
+	u32 reg;
+
+	/* Allow power gating of DSP domain. No STS polling as HOST is only one of its users. */
+	snd_hdac_adsp_updatel(adev, MTL_REG_HfPWRCTL2, MTL_HfPWRCTL2_WPDSPHPxPG, 0);
+	trace_avs_dsp_core_op(0, AVS_MAIN_CORE_MASK, "allow dsp pg", false);
+
+	/* Power down DSP domain. */
+	snd_hdac_adsp_updatel(adev, MTL_REG_HfDSSCS, MTL_HfDSSCS_SPA, 0);
+	trace_avs_dsp_core_op(0, AVS_MAIN_CORE_MASK, "power dsp", false);
+
+	return snd_hdac_adsp_readl_poll(adev, MTL_REG_HfDSSCS, reg,
+					(reg & MTL_HfDSSCS_CPA) == 0,
+					AVS_ADSPCS_INTERVAL_US, AVS_ADSPCS_TIMEOUT_US);
+}
+
+static int avs_ptl_core_power(struct avs_dev *adev, u32 core_mask, bool power)
+{
+	core_mask &= AVS_MAIN_CORE_MASK;
+	if (!core_mask)
+		return 0;
+
+	if (power)
+		return avs_ptl_core_power_on(adev);
+	return avs_ptl_core_power_off(adev);
+}
+
+const struct avs_dsp_ops avs_ptl_dsp_ops = {
+	.power = avs_ptl_core_power,
+	.reset = avs_mtl_core_reset,
+	.stall = avs_lnl_core_stall,
+	.dsp_interrupt = avs_mtl_dsp_interrupt,
+	.int_control = avs_mtl_interrupt_control,
+	.load_basefw = avs_hda_load_basefw,
+	.load_lib = avs_hda_load_library,
+	.transfer_mods = avs_hda_transfer_modules,
+	.log_buffer_offset = avs_icl_log_buffer_offset,
+	.log_buffer_status = avs_apl_log_buffer_status,
+	.coredump = avs_apl_coredump,
+	.d0ix_toggle = avs_icl_d0ix_toggle,
+	.set_d0ix = avs_icl_set_d0ix,
+	AVS_SET_ENABLE_LOGS_OP(icl)
+};
diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
index 844f168515cb..97767882ffa1 100644
--- a/sound/soc/intel/avs/registers.h
+++ b/sound/soc/intel/avs/registers.h
@@ -96,8 +96,12 @@
 #define MTL_REG_HfCLKCTL		(MTL_HfPMCCU_BASE + 0x10)
 #define MTL_REG_HfPWRCTL		(MTL_HfPMCCU_BASE + 0x18)
 #define MTL_REG_HfPWRSTS		(MTL_HfPMCCU_BASE + 0x1C)
+#define MTL_REG_HfPWRCTL2		(MTL_HfPMCCU_BASE + 0x20)
+#define MTL_REG_HfPWRSTS2		(MTL_HfPMCCU_BASE + 0x24)
 #define MTL_HfPWRCTL_WPDSPHPxPG		BIT(0)
 #define MTL_HfPWRSTS_DSPHPxPGS		BIT(0)
+#define MTL_HfPWRCTL2_WPDSPHPxPG	BIT(0)
+#define MTL_HfPWRSTS2_DSPHPxPGS		BIT(0)
 
 /* Intel HD Audio SRAM windows base addresses */
 #define SKL_ADSP_SRAM_BASE_OFFSET	0x8000
-- 
2.25.1

