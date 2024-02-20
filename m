Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69210664CE
	for <linux-sound@vger.kernel.org>; Tue, 20 Feb 2024 11:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708429774; cv=none; b=vGF2uTzJ4BSApvPoJD7+1NEa64Seft/RhUuF5bVPvQzHV+Jn4UtDezGOmlGHJdVDN+t6UoRQ53YqhcCf44wNgnmlBm4lM5qP73icnVpL4SScl+QCu3Y0lwqhC+dGDQBjdtSQ6yM5ZeDzqOEOFkDg5B3EhkkRxSxtoLt0NyJBw0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708429774; c=relaxed/simple;
	bh=2XsNZaVpjaIOuqbgfEesk0PeJDqXbPMvkzRTyHE165U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g0oQEeS+jFcwtAyLbty8VdWPDQc2mpTaDtFnsHMlm7aNTx7JqWkuXTrEqnjiE/YwYoFMfck9P9eaPNQKt7LK1RJ0ExmO+5TnAi4usR7u5lGB+lAhtn2GykHU90D0d0EBqJSZPD/2rv5pWYNPyzqWkHj+PcDo+uRg0djCPB4teEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmYKqlCn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmYKqlCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708429772; x=1739965772;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2XsNZaVpjaIOuqbgfEesk0PeJDqXbPMvkzRTyHE165U=;
  b=SmYKqlCnaoKW0tGUjOczXl+tesjUrqdY3DVvbSULSngYuLursTTy32fS
   nOm66p8QE8uXxZxwsfmWHq4SnfmTSAP8oX/4ovGMkq7Bc4vihJjN27Rrk
   +0rL8jxZLfrjEbEzIxf3NE/mUtNk8sy4/FXkQVfworh78da7/AUFzNaL6
   mlsA8wBQXnl4P4XfyKDpubTYsyv3tJ/aT/h/IsFMvWCPtMd5XwEMZhztB
   XcZjG8mwAIqMernWb1y4KtO0WwL9FV7pHj3nKmx9LdsIIcZ/YZOUDQGVl
   4ISUGNkrTBDVBo7h1N7eT2YLh2Iw0b/fiTUNrru6ro03Fealb6LjURx89
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2988991"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2988991"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 03:49:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="4751024"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2024 03:49:29 -0800
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
Subject: [PATCH 07/10] ASoC: Intel: avs: ICL-based platforms support
Date: Tue, 20 Feb 2024 12:50:32 +0100
Message-Id: <20240220115035.770402-8-cezary.rojewski@intel.com>
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

Define handlers specific to cAVS 2.0 platforms, that is ICL, JSL and all
other variants based on this very version of AudioDSP architecture. Most
operations are inherited from their predecessors with the major
difference being firmware-logging functionality - IPC request as well as
debug memory windows layout have changed.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/Makefile   |   2 +-
 sound/soc/intel/avs/avs.h      |   6 ++
 sound/soc/intel/avs/core.c     |  24 ++++++
 sound/soc/intel/avs/icl.c      | 137 +++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/messages.c |   1 +
 sound/soc/intel/avs/messages.h |  28 +++++++
 6 files changed, 197 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/avs/icl.c

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index c95bf5217a94..d9c0027e72de 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -4,7 +4,7 @@ snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o core.o loader.o \
 		    topology.o path.o pcm.o board_selection.o control.o \
 		    sysfs.o
 snd-soc-avs-objs += cldma.o
-snd-soc-avs-objs += skl.o apl.o cnl.o
+snd-soc-avs-objs += skl.o apl.o cnl.o icl.o
 
 snd-soc-avs-objs += trace.o
 # tell define_trace.h where to find the trace header
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index efa6e3566407..a850351808f9 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -67,6 +67,7 @@ struct avs_dsp_ops {
 extern const struct avs_dsp_ops avs_skl_dsp_ops;
 extern const struct avs_dsp_ops avs_apl_dsp_ops;
 extern const struct avs_dsp_ops avs_cnl_dsp_ops;
+extern const struct avs_dsp_ops avs_icl_dsp_ops;
 
 #define AVS_PLATATTR_CLDMA		BIT_ULL(0)
 #define AVS_PLATATTR_IMR		BIT_ULL(1)
@@ -269,11 +270,16 @@ irqreturn_t avs_skl_irq_thread(struct avs_dev *adev);
 irqreturn_t avs_cnl_irq_thread(struct avs_dev *adev);
 int avs_apl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
 			u32 fifo_full_period, unsigned long resource_mask, u32 *priorities);
+int avs_icl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
+			u32 fifo_full_period, unsigned long resource_mask, u32 *priorities);
 int avs_skl_log_buffer_offset(struct avs_dev *adev, u32 core);
+int avs_icl_log_buffer_offset(struct avs_dev *adev, u32 core);
 int avs_apl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg);
 int avs_apl_coredump(struct avs_dev *adev, union avs_notify_msg *msg);
 bool avs_apl_d0ix_toggle(struct avs_dev *adev, struct avs_ipc_msg *tx, bool wake);
+bool avs_icl_d0ix_toggle(struct avs_dev *adev, struct avs_ipc_msg *tx, bool wake);
 int avs_apl_set_d0ix(struct avs_dev *adev, bool enable);
+int avs_icl_set_d0ix(struct avs_dev *adev, bool enable);
 
 /* Firmware resources management */
 
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index a9748d43ee54..b66d9c89f79a 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -808,6 +808,26 @@ static const struct avs_spec cnl_desc = {
 	.hipc = &cnl_hipc_spec,
 };
 
+static const struct avs_spec icl_desc = {
+	.name = "icl",
+	.min_fw_version = { 10, 23, 0, 5040 },
+	.dsp_ops = &avs_icl_dsp_ops,
+	.core_init_mask = 1,
+	.attributes = AVS_PLATATTR_IMR,
+	.sram = &apl_sram_spec,
+	.hipc = &cnl_hipc_spec,
+};
+
+static const struct avs_spec jsl_desc = {
+	.name = "jsl",
+	.min_fw_version = { 10, 26, 0, 5872 },
+	.dsp_ops = &avs_icl_dsp_ops,
+	.core_init_mask = 1,
+	.attributes = AVS_PLATATTR_IMR,
+	.sram = &apl_sram_spec,
+	.hipc = &cnl_hipc_spec,
+};
+
 static const struct pci_device_id avs_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_SKL_LP, &skl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_SKL, &skl_desc) },
@@ -822,6 +842,10 @@ static const struct pci_device_id avs_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_CML_LP,	&cnl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_CML_H,	&cnl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_RKL_S,	&cnl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ICL_LP,	&icl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ICL_N,	&icl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ICL_H,	&icl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_JSL_N,	&jsl_desc) },
 	{ 0 }
 };
 MODULE_DEVICE_TABLE(pci, avs_ids);
diff --git a/sound/soc/intel/avs/icl.c b/sound/soc/intel/avs/icl.c
new file mode 100644
index 000000000000..83ebee6f87ac
--- /dev/null
+++ b/sound/soc/intel/avs/icl.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2024 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/slab.h>
+#include "avs.h"
+#include "messages.h"
+
+#ifdef CONFIG_DEBUG_FS
+int avs_icl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
+			u32 fifo_full_period, unsigned long resource_mask, u32 *priorities)
+{
+	struct avs_icl_log_state_info *info;
+	u32 size, num_libs = adev->fw_cfg.max_libs_count;
+	int i, ret;
+
+	if (fls_long(resource_mask) > num_libs)
+		return -EINVAL;
+	size = struct_size(info, logs_priorities_mask, num_libs);
+	info = kzalloc(size, GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->aging_timer_period = aging_period;
+	info->fifo_full_timer_period = fifo_full_period;
+	info->enable = enable;
+	if (enable)
+		for_each_set_bit(i, &resource_mask, num_libs)
+			info->logs_priorities_mask[i] = *priorities++;
+
+	ret = avs_ipc_set_enable_logs(adev, (u8 *)info, size);
+	kfree(info);
+	if (ret)
+		return AVS_IPC_RET(ret);
+
+	return 0;
+}
+#endif
+
+union avs_icl_memwnd2_slot_type {
+	u32 val;
+	struct {
+		u32 resource_id:8;
+		u32 type:24;
+	};
+} __packed;
+
+struct avs_icl_memwnd2_desc {
+	u32 resource_id;
+	union avs_icl_memwnd2_slot_type slot_id;
+	u32 vma;
+} __packed;
+
+#define AVS_ICL_MEMWND2_SLOTS_COUNT	15
+
+struct avs_icl_memwnd2 {
+	union {
+		struct avs_icl_memwnd2_desc slot_desc[AVS_ICL_MEMWND2_SLOTS_COUNT];
+		u8 rsvd[PAGE_SIZE];
+	};
+	u8 slot_array[AVS_ICL_MEMWND2_SLOTS_COUNT][PAGE_SIZE];
+} __packed;
+
+#define AVS_ICL_SLOT_UNUSED \
+	((union avs_icl_memwnd2_slot_type) { 0x00000000U })
+#define AVS_ICL_SLOT_CRITICAL_LOG \
+	((union avs_icl_memwnd2_slot_type) { 0x54524300U })
+#define AVS_ICL_SLOT_DEBUG_LOG \
+	((union avs_icl_memwnd2_slot_type) { 0x474f4c00U })
+#define AVS_ICL_SLOT_GDB_STUB \
+	((union avs_icl_memwnd2_slot_type) { 0x42444700U })
+#define AVS_ICL_SLOT_BROKEN \
+	((union avs_icl_memwnd2_slot_type) { 0x44414544U })
+
+static int avs_icl_slot_offset(struct avs_dev *adev, union avs_icl_memwnd2_slot_type slot_type)
+{
+	struct avs_icl_memwnd2_desc desc[AVS_ICL_MEMWND2_SLOTS_COUNT];
+	int i;
+
+	memcpy_fromio(&desc, avs_sram_addr(adev, AVS_DEBUG_WINDOW), sizeof(desc));
+
+	for (i = 0; i < AVS_ICL_MEMWND2_SLOTS_COUNT; i++)
+		if (desc[i].slot_id.val == slot_type.val)
+			return offsetof(struct avs_icl_memwnd2, slot_array) +
+			       avs_skl_log_buffer_offset(adev, i);
+	return -ENXIO;
+}
+
+int avs_icl_log_buffer_offset(struct avs_dev *adev, u32 core)
+{
+	union avs_icl_memwnd2_slot_type slot_type = AVS_ICL_SLOT_DEBUG_LOG;
+	int ret;
+
+	slot_type.resource_id = core;
+	ret = avs_icl_slot_offset(adev, slot_type);
+	if (ret < 0)
+		dev_dbg(adev->dev, "No slot offset found for: %x\n",
+			slot_type.val);
+
+	return ret;
+}
+
+bool avs_icl_d0ix_toggle(struct avs_dev *adev, struct avs_ipc_msg *tx, bool wake)
+{
+	/* Payload-less IPCs do not take part in d0ix toggling. */
+	return tx->size;
+}
+
+int avs_icl_set_d0ix(struct avs_dev *adev, bool enable)
+{
+	int ret;
+
+	ret = avs_ipc_set_d0ix(adev, enable, false);
+	return AVS_IPC_RET(ret);
+}
+
+const struct avs_dsp_ops avs_icl_dsp_ops = {
+	.power = avs_dsp_core_power,
+	.reset = avs_dsp_core_reset,
+	.stall = avs_dsp_core_stall,
+	.irq_handler = avs_irq_handler,
+	.irq_thread = avs_cnl_irq_thread,
+	.int_control = avs_dsp_interrupt_control,
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
diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index 06b4394cabd2..f874e4f0d95f 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -381,6 +381,7 @@ int avs_ipc_set_d0ix(struct avs_dev *adev, bool enable_pg, bool streaming)
 
 	msg.ext.set_d0ix.wake = enable_pg;
 	msg.ext.set_d0ix.streaming = streaming;
+	msg.ext.set_d0ix.prevent_pg = !enable_pg;
 
 	request.header = msg.val;
 
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 0f0862818f02..4e609a08863c 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -145,8 +145,12 @@ union avs_module_msg {
 				u32 src_queue:3;
 			} bind_unbind;
 			struct {
+				/* pre-IceLake */
 				u32 wake:1;
 				u32 streaming:1;
+				/* IceLake and onwards */
+				u32 prevent_pg:1;
+				u32 prevent_local_cg:1;
 			} set_d0ix;
 		} ext;
 	};
@@ -376,6 +380,30 @@ struct avs_apl_log_state_info {
 	struct avs_skl_log_state logs_core[];
 } __packed;
 
+enum avs_icl_log_priority {
+	AVS_ICL_LOG_CRITICAL = 0,
+	AVS_ICL_LOG_HIGH,
+	AVS_ICL_LOG_MEDIUM,
+	AVS_ICL_LOG_LOW,
+	AVS_ICL_LOG_VERBOSE,
+};
+
+enum avs_icl_log_source {
+	AVS_ICL_LOG_INFRA = 0,
+	AVS_ICL_LOG_HAL,
+	AVS_ICL_LOG_MODULE,
+	AVS_ICL_LOG_AUDIO,
+	AVS_ICL_LOG_SENSING,
+	AVS_ICL_LOG_ULP_INFRA,
+};
+
+struct avs_icl_log_state_info {
+	u32 aging_timer_period;
+	u32 fifo_full_timer_period;
+	u32 enable;
+	u32 logs_priorities_mask[];
+} __packed;
+
 int avs_ipc_set_enable_logs(struct avs_dev *adev, u8 *log_info, size_t size);
 
 struct avs_fw_version {
-- 
2.25.1

