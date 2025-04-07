Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6223A226861
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024024; cv=none; b=CBy92YDFhngZ8S1Gm19ZBaEXJQqKXV8Y0PqFByA3MIpwuogrDBsr/33VlcgThnF/EUSVFSyWbHedOtc7mkBTjZJ+A/vIeR+0Dp4BkZdLAsppRGIGUPk363oY9E2EfvdWdeuDG6wbcfDyDmbDOSq/ljgFIYcfNGS9wnMoL9ArsGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024024; c=relaxed/simple;
	bh=MdzqrAqz5d0BCvASgzaytM1Q3GArAfSEUFsXSmWm+Js=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m3nmLbUdVx/7VnilKPGx4Jze5anEukaXL7FBKHLXHsA/r2jzhDEglJHyAYOHBbjz2V6lWrWNb8KBZfCyBEm/OpJz+VCP4Gn1sSo+8QOodMAI3F97W/jQ5BmEZ+sxZFTWl0ERW2VjAjTNgFRBM8FgaSJpTtqS89lb0UruIxYCkeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PFiB7gBy; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PFiB7gBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744024023; x=1775560023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MdzqrAqz5d0BCvASgzaytM1Q3GArAfSEUFsXSmWm+Js=;
  b=PFiB7gBy41HCsO8VlUvEGUzE+s1OGX/OhSDyfOsMb1PjyZ/ioD8mXDWh
   jx3V2D2lqwss3w6+jD7r1JZoFDlwb3ABV6rOwNf6EXCHUlkh9aBkRIliC
   l7PsH3PEHeAqMPG/lcih6+7PNUerGSgM6mxrOVm2j3pNvr/echnq+Ycu4
   ePE82i6B3Z+oihMYpEnY3969uP1PBZocupQJjpN5ouWuVMZ2Ng5UrVYGh
   /fIfJspB+jsJYLyY3TGKUE27reI5NR91NU/jT18pOiXkjuuTWHCpbicq/
   YfPGQoMcQcgV89WNdLW1sThlVEwiWBHgqe5w0tbVOSAiiAC8jlwvrnHYX
   Q==;
X-CSE-ConnectionGUID: cc3igXiISJqlG8jVGv8SFA==
X-CSE-MsgGUID: Jt627kPDTwKpGW5UsGrPNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49057347"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49057347"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 04:07:02 -0700
X-CSE-ConnectionGUID: 6c22vxpyQVurABFRruTBjw==
X-CSE-MsgGUID: 5eGD+3wAQ+CEOWkw8e06Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127776295"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 07 Apr 2025 04:07:00 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	liam.r.girdwood@intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 05/10] ASoC: Intel: avs: PTL-based platforms support
Date: Mon,  7 Apr 2025 13:23:47 +0200
Message-Id: <20250407112352.3720779-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407112352.3720779-1-cezary.rojewski@intel.com>
References: <20250407112352.3720779-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Define handlers specific to ACE platforms, that Frisco Lake (FCL), a
PantherLake (PTL)-based platform, is founded upon. Most operations are
still inherited from their predecessors with the major difference being
AudioDSP cores management - replaced by DSP-domain power management.

Software has to ensure the DSP domain is both powered on and its
power-gating disabled before it can be utilized for streaming.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/linux/pci_ids.h         |   1 +
 sound/soc/intel/avs/Makefile    |   6 +-
 sound/soc/intel/avs/avs.h       |   7 ++
 sound/soc/intel/avs/core.c      |  29 +++++
 sound/soc/intel/avs/dsp.c       |   2 -
 sound/soc/intel/avs/lnl.c       |  27 +++++
 sound/soc/intel/avs/mtl.c       | 200 ++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/ptl.c       |  98 ++++++++++++++++
 sound/soc/intel/avs/registers.h |  38 ++++++
 9 files changed, 403 insertions(+), 5 deletions(-)
 create mode 100644 sound/soc/intel/avs/lnl.c
 create mode 100644 sound/soc/intel/avs/mtl.c
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
index 5139a019a4ad..576dc0da381d 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 snd-soc-avs-y := dsp.o ipc.o messages.o utils.o core.o loader.o \
-		    topology.o path.o pcm.o board_selection.o control.o \
-		    sysfs.o
+		 topology.o path.o pcm.o board_selection.o control.o \
+		 sysfs.o
 snd-soc-avs-y += cldma.o
-snd-soc-avs-y += skl.o apl.o cnl.o icl.o tgl.o
+snd-soc-avs-y += skl.o apl.o cnl.o icl.o tgl.o mtl.o lnl.o ptl.o
 
 snd-soc-avs-y += trace.o
 # tell define_trace.h where to find the trace header
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index ec5502f9d5cb..f5553aba813a 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -69,6 +69,7 @@ extern const struct avs_dsp_ops avs_apl_dsp_ops;
 extern const struct avs_dsp_ops avs_cnl_dsp_ops;
 extern const struct avs_dsp_ops avs_icl_dsp_ops;
 extern const struct avs_dsp_ops avs_tgl_dsp_ops;
+extern const struct avs_dsp_ops avs_ptl_dsp_ops;
 
 #define AVS_PLATATTR_CLDMA		BIT_ULL(0)
 #define AVS_PLATATTR_IMR		BIT_ULL(1)
@@ -267,8 +268,14 @@ void avs_ipc_block(struct avs_ipc *ipc);
 int avs_dsp_disable_d0ix(struct avs_dev *adev);
 int avs_dsp_enable_d0ix(struct avs_dev *adev);
 
+int avs_mtl_core_power(struct avs_dev *adev, u32 core_mask, bool power);
+int avs_mtl_core_reset(struct avs_dev *adev, u32 core_mask, bool power);
+int avs_mtl_core_stall(struct avs_dev *adev, u32 core_mask, bool stall);
+int avs_lnl_core_stall(struct avs_dev *adev, u32 core_mask, bool stall);
+void avs_mtl_interrupt_control(struct avs_dev *adev, bool enable);
 void avs_skl_ipc_interrupt(struct avs_dev *adev);
 irqreturn_t avs_cnl_dsp_interrupt(struct avs_dev *adev);
+irqreturn_t avs_mtl_dsp_interrupt(struct avs_dev *adev);
 int avs_apl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
 			u32 fifo_full_period, unsigned long resource_mask, u32 *priorities);
 int avs_icl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 1495e163d47e..a7aa3a6cde9e 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -762,6 +762,11 @@ static const struct avs_sram_spec apl_sram_spec = {
 	.window_size = APL_ADSP_SRAM_WINDOW_SIZE,
 };
 
+static const struct avs_sram_spec mtl_sram_spec = {
+	.base_offset = MTL_ADSP_SRAM_BASE_OFFSET,
+	.window_size = MTL_ADSP_SRAM_WINDOW_SIZE,
+};
+
 static const struct avs_hipc_spec skl_hipc_spec = {
 	.req_offset = SKL_ADSP_REG_HIPCI,
 	.req_ext_offset = SKL_ADSP_REG_HIPCIE,
@@ -798,6 +803,18 @@ static const struct avs_hipc_spec cnl_hipc_spec = {
 	.sts_offset = APL_ADSP_SRAM_BASE_OFFSET,
 };
 
+static const struct avs_hipc_spec lnl_hipc_spec = {
+	.req_offset = MTL_REG_HfIPCxIDR,
+	.req_ext_offset = MTL_REG_HfIPCxIDD,
+	.req_busy_mask = MTL_HfIPCxIDR_BUSY,
+	.ack_offset = MTL_REG_HfIPCxIDA,
+	.ack_done_mask = MTL_HfIPCxIDA_DONE,
+	.rsp_offset = MTL_REG_HfIPCxTDR,
+	.rsp_busy_mask = MTL_HfIPCxTDR_BUSY,
+	.ctl_offset = MTL_REG_HfIPCxCTL,
+	.sts_offset = LNL_REG_HfDFR(0),
+};
+
 static const struct avs_spec skl_desc = {
 	.name = "skl",
 	.min_fw_version = { 9, 21, 0, 4732 },
@@ -865,6 +882,16 @@ AVS_TGL_BASED_SPEC(ehl, 30);
 AVS_TGL_BASED_SPEC(adl, 35);
 AVS_TGL_BASED_SPEC(adl_n, 35);
 
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
@@ -900,6 +927,7 @@ static const struct pci_device_id avs_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_P_1,	&adl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_M,	&adl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_PX,	&adl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_FCL,	&fcl_desc) },
 	{ 0 }
 };
 MODULE_DEVICE_TABLE(pci, avs_ids);
@@ -931,3 +959,4 @@ MODULE_FIRMWARE("intel/tgl/dsp_basefw.bin");
 MODULE_FIRMWARE("intel/ehl/dsp_basefw.bin");
 MODULE_FIRMWARE("intel/adl/dsp_basefw.bin");
 MODULE_FIRMWARE("intel/adl_n/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/fcl/dsp_basefw.bin");
diff --git a/sound/soc/intel/avs/dsp.c b/sound/soc/intel/avs/dsp.c
index b9de691e9b9b..464bd6859182 100644
--- a/sound/soc/intel/avs/dsp.c
+++ b/sound/soc/intel/avs/dsp.c
@@ -12,8 +12,6 @@
 #include "registers.h"
 #include "trace.h"
 
-#define AVS_ADSPCS_INTERVAL_US		500
-#define AVS_ADSPCS_TIMEOUT_US		50000
 #define AVS_ADSPCS_DELAY_US		1000
 
 int avs_dsp_core_power(struct avs_dev *adev, u32 core_mask, bool power)
diff --git a/sound/soc/intel/avs/lnl.c b/sound/soc/intel/avs/lnl.c
new file mode 100644
index 000000000000..03208596dfb1
--- /dev/null
+++ b/sound/soc/intel/avs/lnl.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright(c) 2021-2025 Intel Corporation
+ *
+ * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+ *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+ */
+
+#include <sound/hdaudio_ext.h>
+#include "avs.h"
+#include "registers.h"
+
+int avs_lnl_core_stall(struct avs_dev *adev, u32 core_mask, bool stall)
+{
+	struct hdac_bus *bus = &adev->base.core;
+	struct hdac_ext_link *hlink;
+	int ret;
+
+	ret = avs_mtl_core_stall(adev, core_mask, stall);
+
+	/* On unstall, route interrupts from the links to the DSP firmware. */
+	if (!ret && !stall)
+		list_for_each_entry(hlink, &bus->hlink_list, list)
+			snd_hdac_updatel(hlink->ml_addr, AZX_REG_ML_LCTL, AZX_ML_LCTL_OFLEN,
+					 AZX_ML_LCTL_OFLEN);
+	return ret;
+}
diff --git a/sound/soc/intel/avs/mtl.c b/sound/soc/intel/avs/mtl.c
new file mode 100644
index 000000000000..e7b7915b2a82
--- /dev/null
+++ b/sound/soc/intel/avs/mtl.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright(c) 2021-2025 Intel Corporation
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
+#define MTL_DSPCCTL_SPA		BIT(0)
+#define MTL_DSPCCTL_CPA		BIT(8)
+#define MTL_DSPCCTL_OSEL	GENMASK(25, 24)
+#define MTL_DSPCCTL_OSEL_HOST	BIT(25)
+
+#define MTL_HfINT_BASE		0x1100
+#define MTL_REG_HfINTIPPTR	(MTL_HfINT_BASE + 0x8)
+#define MTL_REG_HfHIPCIE	(MTL_HfINT_BASE + 0x40)
+#define MTL_HfINTIPPTR_PTR	GENMASK(20, 0)
+#define MTL_HfHIPCIE_IE		BIT(0)
+
+#define MTL_DWICTL_INTENL_IE		BIT(0)
+#define MTL_DWICTL_FINALSTATUSL_IPC	BIT(0) /* same as ADSPIS_IPC */
+
+static int avs_mtl_core_power_on(struct avs_dev *adev)
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
+	snd_hdac_adsp_updatel(adev, MTL_REG_HfPWRCTL, MTL_HfPWRCTL_WPDSPHPxPG,
+			      MTL_HfPWRCTL_WPDSPHPxPG);
+	trace_avs_dsp_core_op(1, AVS_MAIN_CORE_MASK, "prevent dsp PG", true);
+
+	ret = snd_hdac_adsp_readl_poll(adev, MTL_REG_HfPWRSTS, reg,
+				       (reg & MTL_HfPWRSTS_DSPHPxPGS) == MTL_HfPWRSTS_DSPHPxPGS,
+				       AVS_ADSPCS_INTERVAL_US, AVS_ADSPCS_TIMEOUT_US);
+
+	/* Set ownership to HOST. */
+	snd_hdac_adsp_updatel(adev, MTL_REG_DSPCCTL, MTL_DSPCCTL_OSEL, MTL_DSPCCTL_OSEL_HOST);
+	return ret;
+}
+
+static int avs_mtl_core_power_off(struct avs_dev *adev)
+{
+	u32 reg;
+
+	/* Allow power gating of DSP domain. No STS polling as HOST is only one of its users. */
+	snd_hdac_adsp_updatel(adev, MTL_REG_HfPWRCTL, MTL_HfPWRCTL_WPDSPHPxPG, 0);
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
+int avs_mtl_core_power(struct avs_dev *adev, u32 core_mask, bool power)
+{
+	core_mask &= AVS_MAIN_CORE_MASK;
+	if (!core_mask)
+		return 0;
+
+	if (power)
+		return avs_mtl_core_power_on(adev);
+	return avs_mtl_core_power_off(adev);
+}
+
+int avs_mtl_core_reset(struct avs_dev *adev, u32 core_mask, bool power)
+{
+	/* No logical equivalent on ACE 1.x. */
+	return 0;
+}
+
+int avs_mtl_core_stall(struct avs_dev *adev, u32 core_mask, bool stall)
+{
+	u32 value, reg;
+	int ret;
+
+	core_mask &= AVS_MAIN_CORE_MASK;
+	if (!core_mask)
+		return 0;
+
+	value = snd_hdac_adsp_readl(adev, MTL_REG_DSPCCTL);
+	trace_avs_dsp_core_op(value, core_mask, "stall", stall);
+	if (value == UINT_MAX)
+		return 0;
+
+	value = stall ? 0 : MTL_DSPCCTL_SPA;
+	snd_hdac_adsp_updatel(adev, MTL_REG_DSPCCTL, MTL_DSPCCTL_SPA, value);
+
+	value = stall ? 0 : MTL_DSPCCTL_CPA;
+	ret = snd_hdac_adsp_readl_poll(adev, MTL_REG_DSPCCTL,
+				       reg, (reg & MTL_DSPCCTL_CPA) == value,
+				       AVS_ADSPCS_INTERVAL_US, AVS_ADSPCS_TIMEOUT_US);
+	if (ret)
+		dev_err(adev->dev, "core_mask %d %sstall failed: %d\n",
+			core_mask, stall ? "" : "un", ret);
+	return ret;
+}
+
+static void avs_mtl_ipc_interrupt(struct avs_dev *adev)
+{
+	const struct avs_spec *spec = adev->spec;
+	u32 hipc_ack, hipc_rsp;
+
+	snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
+			      AVS_ADSP_HIPCCTL_DONE | AVS_ADSP_HIPCCTL_BUSY, 0);
+
+	hipc_ack = snd_hdac_adsp_readl(adev, spec->hipc->ack_offset);
+	hipc_rsp = snd_hdac_adsp_readl(adev, spec->hipc->rsp_offset);
+
+	/* DSP acked host's request. */
+	if (hipc_ack & spec->hipc->ack_done_mask) {
+		complete(&adev->ipc->done_completion);
+
+		/* Tell DSP it has our attention. */
+		snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
+				      spec->hipc->ack_done_mask);
+	}
+
+	/* DSP sent new response to process. */
+	if (hipc_rsp & spec->hipc->rsp_busy_mask) {
+		union avs_reply_msg msg;
+
+		msg.primary = snd_hdac_adsp_readl(adev, MTL_REG_HfIPCxTDR);
+		msg.ext.val = snd_hdac_adsp_readl(adev, MTL_REG_HfIPCxTDD);
+
+		avs_dsp_process_response(adev, msg.val);
+
+		/* Tell DSP we accepted its message. */
+		snd_hdac_adsp_updatel(adev, MTL_REG_HfIPCxTDR,
+				      MTL_HfIPCxTDR_BUSY, MTL_HfIPCxTDR_BUSY);
+		/* Ack this response. */
+		snd_hdac_adsp_updatel(adev, MTL_REG_HfIPCxTDA, MTL_HfIPCxTDA_BUSY, 0);
+	}
+
+	snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
+			      AVS_ADSP_HIPCCTL_DONE | AVS_ADSP_HIPCCTL_BUSY,
+			      AVS_ADSP_HIPCCTL_DONE | AVS_ADSP_HIPCCTL_BUSY);
+}
+
+irqreturn_t avs_mtl_dsp_interrupt(struct avs_dev *adev)
+{
+	u32 adspis = snd_hdac_adsp_readl(adev, MTL_DWICTL_REG_FINALSTATUSL);
+	irqreturn_t ret = IRQ_NONE;
+
+	if (adspis == UINT_MAX)
+		return ret;
+
+	if (adspis & MTL_DWICTL_FINALSTATUSL_IPC) {
+		avs_mtl_ipc_interrupt(adev);
+		ret = IRQ_HANDLED;
+	}
+
+	return ret;
+}
+
+void avs_mtl_interrupt_control(struct avs_dev *adev, bool enable)
+{
+	if (enable) {
+		snd_hdac_adsp_updatel(adev, MTL_DWICTL_REG_INTENL, MTL_DWICTL_INTENL_IE,
+				      MTL_DWICTL_INTENL_IE);
+		snd_hdac_adsp_updatew(adev, MTL_REG_HfHIPCIE, MTL_HfHIPCIE_IE, MTL_HfHIPCIE_IE);
+		snd_hdac_adsp_updatel(adev, MTL_REG_HfIPCxCTL, AVS_ADSP_HIPCCTL_DONE,
+				      AVS_ADSP_HIPCCTL_DONE);
+		snd_hdac_adsp_updatel(adev, MTL_REG_HfIPCxCTL, AVS_ADSP_HIPCCTL_BUSY,
+				      AVS_ADSP_HIPCCTL_BUSY);
+	} else {
+		snd_hdac_adsp_updatel(adev, MTL_REG_HfIPCxCTL, AVS_ADSP_HIPCCTL_BUSY, 0);
+		snd_hdac_adsp_updatel(adev, MTL_REG_HfIPCxCTL, AVS_ADSP_HIPCCTL_DONE, 0);
+		snd_hdac_adsp_updatew(adev, MTL_REG_HfHIPCIE, MTL_HfHIPCIE_IE, 0);
+		snd_hdac_adsp_updatel(adev, MTL_DWICTL_REG_INTENL, MTL_DWICTL_INTENL_IE, 0);
+	}
+}
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
index 4db0cdf68ffc..97767882ffa1 100644
--- a/sound/soc/intel/avs/registers.h
+++ b/sound/soc/intel/avs/registers.h
@@ -35,6 +35,8 @@
 #define AVS_ADSPCS_CSTALL_MASK(cm)	((cm) << 8)
 #define AVS_ADSPCS_SPA_MASK(cm)		((cm) << 16)
 #define AVS_ADSPCS_CPA_MASK(cm)		((cm) << 24)
+#define AVS_ADSPCS_INTERVAL_US		500
+#define AVS_ADSPCS_TIMEOUT_US		10000
 #define AVS_MAIN_CORE_MASK		BIT(0)
 
 #define AVS_ADSP_HIPCCTL_BUSY		BIT(0)
@@ -67,11 +69,47 @@
 #define CNL_ADSP_HIPCIDR_BUSY		BIT(31)
 #define CNL_ADSP_HIPCIDA_DONE		BIT(31)
 
+/* MTL Intel HOST Inter-Processor Communication Registers */
+#define MTL_HfIPC_BASE			0x73000
+#define MTL_REG_HfIPCxTDR		(MTL_HfIPC_BASE + 0x200)
+#define MTL_REG_HfIPCxTDA		(MTL_HfIPC_BASE + 0x204)
+#define MTL_REG_HfIPCxIDR		(MTL_HfIPC_BASE + 0x210)
+#define MTL_REG_HfIPCxIDA		(MTL_HfIPC_BASE + 0x214)
+#define MTL_REG_HfIPCxCTL		(MTL_HfIPC_BASE + 0x228)
+#define MTL_REG_HfIPCxTDD		(MTL_HfIPC_BASE + 0x300)
+#define MTL_REG_HfIPCxIDD		(MTL_HfIPC_BASE + 0x380)
+
+#define MTL_HfIPCxTDR_BUSY		BIT(31)
+#define MTL_HfIPCxTDA_BUSY		BIT(31)
+#define MTL_HfIPCxIDR_BUSY		BIT(31)
+#define MTL_HfIPCxIDA_DONE		BIT(31)
+
+#define MTL_HfFLV_BASE			0x162000
+#define MTL_REG_HfFLGP(x, y)		(MTL_HfFLV_BASE + 0x1200 + (x) * 0x20 + (y) * 0x08)
+#define LNL_REG_HfDFR(x)		(0x160200 + (x) * 0x8)
+
+#define MTL_DWICTL_BASE			0x1800
+#define MTL_DWICTL_REG_INTENL		(MTL_DWICTL_BASE + 0x0)
+#define MTL_DWICTL_REG_FINALSTATUSL	(MTL_DWICTL_BASE + 0x30)
+
+#define MTL_HfPMCCU_BASE		0x1D00
+#define MTL_REG_HfCLKCTL		(MTL_HfPMCCU_BASE + 0x10)
+#define MTL_REG_HfPWRCTL		(MTL_HfPMCCU_BASE + 0x18)
+#define MTL_REG_HfPWRSTS		(MTL_HfPMCCU_BASE + 0x1C)
+#define MTL_REG_HfPWRCTL2		(MTL_HfPMCCU_BASE + 0x20)
+#define MTL_REG_HfPWRSTS2		(MTL_HfPMCCU_BASE + 0x24)
+#define MTL_HfPWRCTL_WPDSPHPxPG		BIT(0)
+#define MTL_HfPWRSTS_DSPHPxPGS		BIT(0)
+#define MTL_HfPWRCTL2_WPDSPHPxPG	BIT(0)
+#define MTL_HfPWRSTS2_DSPHPxPGS		BIT(0)
+
 /* Intel HD Audio SRAM windows base addresses */
 #define SKL_ADSP_SRAM_BASE_OFFSET	0x8000
 #define SKL_ADSP_SRAM_WINDOW_SIZE	0x2000
 #define APL_ADSP_SRAM_BASE_OFFSET	0x80000
 #define APL_ADSP_SRAM_WINDOW_SIZE	0x20000
+#define MTL_ADSP_SRAM_BASE_OFFSET	0x180000
+#define MTL_ADSP_SRAM_WINDOW_SIZE	0x8000
 
 /* Constants used when accessing SRAM, space shared with firmware */
 #define AVS_FW_REG_BASE(adev)		((adev)->spec->hipc->sts_offset)
-- 
2.25.1

