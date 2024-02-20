Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C280664CE
	for <linux-sound@vger.kernel.org>; Tue, 20 Feb 2024 11:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708429771; cv=none; b=CTYZn9ezpx2vEd8ZxL3+0/GygP41F6Arc2TALbhHHXUyT7d6BrzSOnQCZKAEpkVyBO2i2edy8S4AI47FYH8/6E5Cc6PqQ9GYr8FLKeFLOsa5l02PfzIU+OnioTpt0oZIEtDYCd8H0M3D9dVR7QtBdc+1oHRJRLcjbAo5nOv5wcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708429771; c=relaxed/simple;
	bh=xSFO1wrpj6+sQMujacpsQsxYUjHY9gyMfsGulL/LFLw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bWUxu1nVp9L5SYUbs53fyE9LneYe7HQKrJNuImIceZgZr1wB7H0QvRwft/msm2aeATP4o4S2J+N+BzWgUTiWC18qqmgNlB5hmtIC3rQAhG9/v4qmOUR7pznSwQ7Ear/Tq7pQLGWN+kcD59W2PgTHEzCfSF5iHlyfkrokrxiT1dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PBy977wA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBy977wA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708429769; x=1739965769;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xSFO1wrpj6+sQMujacpsQsxYUjHY9gyMfsGulL/LFLw=;
  b=PBy977wAQkdMNwN+V3JiK47KHx0IuhPNa+DYEcyUJILVV4yg5wup5nCR
   wHf1WHKs+QNMET9c++N30kLGC2UsMcAq/5LPBdu5XauB2ALlI+PWXZjvA
   4mzFjBNE+4OWztDVmmpNgnj/+jfGHIgfqzabrhf3neylp0bopFNlYSOXY
   C8KaqGMKeU3JbIvW+OnJlzxa6I1I4DpNdHGVPh2aeE+ZnBoYZkktCBD/x
   til7fzkOEebtKl2AUNlvGCZOwc8p3tjbWn/qQ19Sqv4Iqv4W3KKH4IHgS
   elTwUH99zQvxiwxV8/ZLIwVdz1APqNv1Rvk6WDAcr/gEA6D7vC9yY3DNo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2988984"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2988984"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 03:49:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="4751011"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2024 03:49:27 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 06/10] ASoC: Intel: avs: CNL-based platforms support
Date: Tue, 20 Feb 2024 12:50:31 +0100
Message-Id: <20240220115035.770402-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240220115035.770402-1-cezary.rojewski@intel.com>
References: <20240220115035.770402-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Define handlers specific to cAVS 1.8 platforms, that is CNL, CFL, CML
and all other variants based on this very version of AudioDSP
architecture. Most operations are inherited from their predecessors.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/Makefile    |  2 +-
 sound/soc/intel/avs/apl.c       | 15 ++++----
 sound/soc/intel/avs/avs.h       |  8 +++++
 sound/soc/intel/avs/cnl.c       | 61 +++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/core.c      | 26 ++++++++++++++
 sound/soc/intel/avs/registers.h | 15 ++++++++
 6 files changed, 119 insertions(+), 8 deletions(-)
 create mode 100644 sound/soc/intel/avs/cnl.c

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index a3fad926d0fb..c95bf5217a94 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -4,7 +4,7 @@ snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o core.o loader.o \
 		    topology.o path.o pcm.o board_selection.o control.o \
 		    sysfs.o
 snd-soc-avs-objs += cldma.o
-snd-soc-avs-objs += skl.o apl.o
+snd-soc-avs-objs += skl.o apl.o cnl.o
 
 snd-soc-avs-objs += trace.o
 # tell define_trace.h where to find the trace header
diff --git a/sound/soc/intel/avs/apl.c b/sound/soc/intel/avs/apl.c
index 6382543a9cdb..c21ecaef9eba 100644
--- a/sound/soc/intel/avs/apl.c
+++ b/sound/soc/intel/avs/apl.c
@@ -13,9 +13,9 @@
 #include "path.h"
 #include "topology.h"
 
-static int __maybe_unused
-avs_apl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
-		    u32 fifo_full_period, unsigned long resource_mask, u32 *priorities)
+#ifdef CONFIG_DEBUG_FS
+int avs_apl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
+			u32 fifo_full_period, unsigned long resource_mask, u32 *priorities)
 {
 	struct avs_apl_log_state_info *info;
 	u32 size, num_cores = adev->hw_cfg.dsp_cores;
@@ -47,8 +47,9 @@ avs_apl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_
 
 	return 0;
 }
+#endif
 
-static int avs_apl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg)
+int avs_apl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg)
 {
 	struct avs_apl_log_buffer_layout layout;
 	void __iomem *addr, *buf;
@@ -102,7 +103,7 @@ static int avs_apl_wait_log_entry(struct avs_dev *adev, u32 core,
 /* reads log header and tests its type */
 #define avs_apl_is_entry_stackdump(addr) ((readl(addr) >> 30) & 0x1)
 
-static int avs_apl_coredump(struct avs_dev *adev, union avs_notify_msg *msg)
+int avs_apl_coredump(struct avs_dev *adev, union avs_notify_msg *msg)
 {
 	struct avs_apl_log_buffer_layout layout;
 	void __iomem *addr, *buf;
@@ -202,7 +203,7 @@ static bool avs_apl_lp_streaming(struct avs_dev *adev)
 	return true;
 }
 
-static bool avs_apl_d0ix_toggle(struct avs_dev *adev, struct avs_ipc_msg *tx, bool wake)
+bool avs_apl_d0ix_toggle(struct avs_dev *adev, struct avs_ipc_msg *tx, bool wake)
 {
 	/* wake in all cases */
 	if (wake)
@@ -219,7 +220,7 @@ static bool avs_apl_d0ix_toggle(struct avs_dev *adev, struct avs_ipc_msg *tx, bo
 	return avs_apl_lp_streaming(adev);
 }
 
-static int avs_apl_set_d0ix(struct avs_dev *adev, bool enable)
+int avs_apl_set_d0ix(struct avs_dev *adev, bool enable)
 {
 	bool streaming = false;
 	int ret;
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 2cd690a78b5c..efa6e3566407 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -66,6 +66,7 @@ struct avs_dsp_ops {
 
 extern const struct avs_dsp_ops avs_skl_dsp_ops;
 extern const struct avs_dsp_ops avs_apl_dsp_ops;
+extern const struct avs_dsp_ops avs_cnl_dsp_ops;
 
 #define AVS_PLATATTR_CLDMA		BIT_ULL(0)
 #define AVS_PLATATTR_IMR		BIT_ULL(1)
@@ -265,7 +266,14 @@ int avs_dsp_disable_d0ix(struct avs_dev *adev);
 int avs_dsp_enable_d0ix(struct avs_dev *adev);
 
 irqreturn_t avs_skl_irq_thread(struct avs_dev *adev);
+irqreturn_t avs_cnl_irq_thread(struct avs_dev *adev);
+int avs_apl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
+			u32 fifo_full_period, unsigned long resource_mask, u32 *priorities);
 int avs_skl_log_buffer_offset(struct avs_dev *adev, u32 core);
+int avs_apl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg);
+int avs_apl_coredump(struct avs_dev *adev, union avs_notify_msg *msg);
+bool avs_apl_d0ix_toggle(struct avs_dev *adev, struct avs_ipc_msg *tx, bool wake);
+int avs_apl_set_d0ix(struct avs_dev *adev, bool enable);
 
 /* Firmware resources management */
 
diff --git a/sound/soc/intel/avs/cnl.c b/sound/soc/intel/avs/cnl.c
new file mode 100644
index 000000000000..5423c29ecc4e
--- /dev/null
+++ b/sound/soc/intel/avs/cnl.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2024 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <sound/hdaudio_ext.h>
+#include "avs.h"
+#include "messages.h"
+
+irqreturn_t avs_cnl_irq_thread(struct avs_dev *adev)
+{
+	union avs_reply_msg msg;
+	u32 hipctdr, hipctdd, hipctda;
+
+	hipctdr = snd_hdac_adsp_readl(adev, CNL_ADSP_REG_HIPCTDR);
+	hipctdd = snd_hdac_adsp_readl(adev, CNL_ADSP_REG_HIPCTDD);
+
+	/* Ensure DSP sent new response to process. */
+	if (!(hipctdr & CNL_ADSP_HIPCTDR_BUSY))
+		return IRQ_NONE;
+
+	msg.primary = hipctdr;
+	msg.ext.val = hipctdd;
+	avs_dsp_process_response(adev, msg.val);
+
+	/* Tell DSP we accepted its message. */
+	snd_hdac_adsp_updatel(adev, CNL_ADSP_REG_HIPCTDR,
+			      CNL_ADSP_HIPCTDR_BUSY, CNL_ADSP_HIPCTDR_BUSY);
+	/* Ack this response. */
+	snd_hdac_adsp_updatel(adev, CNL_ADSP_REG_HIPCTDA,
+			      CNL_ADSP_HIPCTDA_DONE, CNL_ADSP_HIPCTDA_DONE);
+	/* HW might have been clock gated, give some time for change to propagate. */
+	snd_hdac_adsp_readl_poll(adev, CNL_ADSP_REG_HIPCTDA, hipctda,
+				 !(hipctda & CNL_ADSP_HIPCTDA_DONE), 10, 1000);
+	/* Unmask busy interrupt. */
+	snd_hdac_adsp_updatel(adev, CNL_ADSP_REG_HIPCCTL,
+			      AVS_ADSP_HIPCCTL_BUSY, AVS_ADSP_HIPCCTL_BUSY);
+
+	return IRQ_HANDLED;
+}
+
+const struct avs_dsp_ops avs_cnl_dsp_ops = {
+	.power = avs_dsp_core_power,
+	.reset = avs_dsp_core_reset,
+	.stall = avs_dsp_core_stall,
+	.irq_handler = avs_irq_handler,
+	.irq_thread = avs_cnl_irq_thread,
+	.int_control = avs_dsp_interrupt_control,
+	.load_basefw = avs_hda_load_basefw,
+	.load_lib = avs_hda_load_library,
+	.transfer_mods = avs_hda_transfer_modules,
+	.log_buffer_offset = avs_skl_log_buffer_offset,
+	.log_buffer_status = avs_apl_log_buffer_status,
+	.coredump = avs_apl_coredump,
+	.d0ix_toggle = avs_apl_d0ix_toggle,
+	.set_d0ix = avs_apl_set_d0ix,
+	AVS_SET_ENABLE_LOGS_OP(apl)
+};
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 4d1d3445cac1..a9748d43ee54 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -767,6 +767,17 @@ static const struct avs_hipc_spec skl_hipc_spec = {
 	.ctl_offset = SKL_ADSP_REG_HIPCCTL,
 };
 
+static const struct avs_hipc_spec cnl_hipc_spec = {
+	.req_offset = CNL_ADSP_REG_HIPCIDR,
+	.req_ext_offset = CNL_ADSP_REG_HIPCIDD,
+	.req_busy_mask = CNL_ADSP_HIPCIDR_BUSY,
+	.ack_offset = CNL_ADSP_REG_HIPCIDA,
+	.ack_done_mask = CNL_ADSP_HIPCIDA_DONE,
+	.rsp_offset = CNL_ADSP_REG_HIPCTDR,
+	.rsp_busy_mask = CNL_ADSP_HIPCTDR_BUSY,
+	.ctl_offset = CNL_ADSP_REG_HIPCCTL,
+};
+
 static const struct avs_spec skl_desc = {
 	.name = "skl",
 	.min_fw_version = { 9, 21, 0, 4732 },
@@ -787,6 +798,16 @@ static const struct avs_spec apl_desc = {
 	.hipc = &skl_hipc_spec,
 };
 
+static const struct avs_spec cnl_desc = {
+	.name = "cnl",
+	.min_fw_version = { 10, 23, 0, 5314 },
+	.dsp_ops = &avs_cnl_dsp_ops,
+	.core_init_mask = 1,
+	.attributes = AVS_PLATATTR_IMR,
+	.sram = &apl_sram_spec,
+	.hipc = &cnl_hipc_spec,
+};
+
 static const struct pci_device_id avs_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_SKL_LP, &skl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_SKL, &skl_desc) },
@@ -796,6 +817,11 @@ static const struct pci_device_id avs_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_CML_S, &skl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_APL, &apl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_GML, &apl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_CNL_LP,	&cnl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_CNL_H,	&cnl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_CML_LP,	&cnl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_CML_H,	&cnl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_RKL_S,	&cnl_desc) },
 	{ 0 }
 };
 MODULE_DEVICE_TABLE(pci, avs_ids);
diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
index 8468acd15c3d..6126adca500c 100644
--- a/sound/soc/intel/avs/registers.h
+++ b/sound/soc/intel/avs/registers.h
@@ -50,6 +50,21 @@
 #define SKL_ADSP_HIPCIE_DONE		BIT(30)
 #define SKL_ADSP_HIPCT_BUSY		BIT(31)
 
+/* CNL Intel HD Audio Inter-Processor Communication Registers */
+#define CNL_ADSP_IPC_BASE               0xC0
+#define CNL_ADSP_REG_HIPCTDR            (CNL_ADSP_IPC_BASE + 0x00)
+#define CNL_ADSP_REG_HIPCTDA            (CNL_ADSP_IPC_BASE + 0x04)
+#define CNL_ADSP_REG_HIPCTDD            (CNL_ADSP_IPC_BASE + 0x08)
+#define CNL_ADSP_REG_HIPCIDR            (CNL_ADSP_IPC_BASE + 0x10)
+#define CNL_ADSP_REG_HIPCIDA            (CNL_ADSP_IPC_BASE + 0x14)
+#define CNL_ADSP_REG_HIPCIDD            (CNL_ADSP_IPC_BASE + 0x18)
+#define CNL_ADSP_REG_HIPCCTL            (CNL_ADSP_IPC_BASE + 0x28)
+
+#define CNL_ADSP_HIPCTDR_BUSY		BIT(31)
+#define CNL_ADSP_HIPCTDA_DONE		BIT(31)
+#define CNL_ADSP_HIPCIDR_BUSY		BIT(31)
+#define CNL_ADSP_HIPCIDA_DONE		BIT(31)
+
 /* Intel HD Audio SRAM windows base addresses */
 #define SKL_ADSP_SRAM_BASE_OFFSET	0x8000
 #define SKL_ADSP_SRAM_WINDOW_SIZE	0x2000
-- 
2.25.1

