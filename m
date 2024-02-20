Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB92A664CE
	for <linux-sound@vger.kernel.org>; Tue, 20 Feb 2024 11:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708429764; cv=none; b=eDNSM6hv89hPsZu7+v1LWv1/05tZ2GZtcP/S3giQxepdzgXquIyx+Y5nwn+8txHpQARHXv5JTGZWU3s5PMlZOAHJzZ27q70vsS+9WR7iDJPEn9X2EeKQZcQbePWsHPHwTEVNcRMOvdlemUEHtyAyBgXx9ORtuvCc8FMfX0puACE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708429764; c=relaxed/simple;
	bh=vZN4jn1FdHKygdB/bALHkekPBcIZpdTh7h3/bn8JvC0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E19XZFwdb+JngywABL5RLXekfQWyY/cjuuyNfK9TK7Thwz/mZyKg6j3GkUWIu1ehh1YYPk0DHlgyzVWtebbH5kk5yPAaBjBvgozSvVOJckBxeDhb1UspkWPF8yH5Pbas0oGyw0LIlqy4quyxXw3wKZ6rapel0/mioKQGOyZJd4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=expc+Omw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="expc+Omw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708429763; x=1739965763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vZN4jn1FdHKygdB/bALHkekPBcIZpdTh7h3/bn8JvC0=;
  b=expc+Omw09O9orrAPxYwyXGR5RJVKXKRy8gyRNsOEn/asu+OmeAp7tsN
   VKDExeE/+mpNCaehV8Q9P9ngPZwQgyOZztpc/nkZb7Dsbg8UOaMyVVl7h
   L2VomeJnGJ5lGfylmqpDsI5It9P71tJpgzXCAaNXt2kaCly6c3+aL4pdN
   07a3g5GAmK0mCVjv8Iav9ucqBegcFSWcHTlaOujPwx2KnUBXeUcgkzst0
   EzgMDPIFSkngvRwuU4C/B90iv0SDI6Alg/+Rz+if/XVJ4P6/4webMalGL
   4qvOOb6OVcmwc0RnAYHF/WiCNB7Lsrj7DC8CWj7VcbkVnbAf88jGCBtd5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2988932"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2988932"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 03:49:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="4750974"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2024 03:49:20 -0800
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
Subject: [PATCH 03/10] ASoC: Intel: avs: Prefix SKL/APL-specific members
Date: Tue, 20 Feb 2024 12:50:28 +0100
Message-Id: <20240220115035.770402-4-cezary.rojewski@intel.com>
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

Prefix members that are platform-specific with 'avs_' to improve code
cohesiveness and reduce the chance for naming-conflics with other
drivers.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/apl.c      | 51 +++++++++++++++++-----------------
 sound/soc/intel/avs/avs.h      | 18 ++++++------
 sound/soc/intel/avs/core.c     |  4 +--
 sound/soc/intel/avs/messages.h | 10 +++----
 sound/soc/intel/avs/skl.c      | 30 ++++++++++----------
 5 files changed, 56 insertions(+), 57 deletions(-)

diff --git a/sound/soc/intel/avs/apl.c b/sound/soc/intel/avs/apl.c
index 1860099c782a..24c06568b3e8 100644
--- a/sound/soc/intel/avs/apl.c
+++ b/sound/soc/intel/avs/apl.c
@@ -14,10 +14,10 @@
 #include "topology.h"
 
 static int __maybe_unused
-apl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
-		u32 fifo_full_period, unsigned long resource_mask, u32 *priorities)
+avs_apl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
+		    u32 fifo_full_period, unsigned long resource_mask, u32 *priorities)
 {
-	struct apl_log_state_info *info;
+	struct avs_apl_log_state_info *info;
 	u32 size, num_cores = adev->hw_cfg.dsp_cores;
 	int ret, i;
 
@@ -48,9 +48,9 @@ apl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_peri
 	return 0;
 }
 
-static int apl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg)
+static int avs_apl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg)
 {
-	struct apl_log_buffer_layout layout;
+	struct avs_apl_log_buffer_layout layout;
 	void __iomem *addr, *buf;
 
 	addr = avs_log_buffer_addr(adev, msg->log.core);
@@ -63,11 +63,11 @@ static int apl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg
 		/* consume the logs regardless of consumer presence */
 		goto update_read_ptr;
 
-	buf = apl_log_payload_addr(addr);
+	buf = avs_apl_log_payload_addr(addr);
 
 	if (layout.read_ptr > layout.write_ptr) {
 		avs_dump_fw_log(adev, buf + layout.read_ptr,
-				apl_log_payload_size(adev) - layout.read_ptr);
+				avs_apl_log_payload_size(adev) - layout.read_ptr);
 		layout.read_ptr = 0;
 	}
 	avs_dump_fw_log_wakeup(adev, buf + layout.read_ptr, layout.write_ptr - layout.read_ptr);
@@ -77,7 +77,8 @@ static int apl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg
 	return 0;
 }
 
-static int apl_wait_log_entry(struct avs_dev *adev, u32 core, struct apl_log_buffer_layout *layout)
+static int avs_apl_wait_log_entry(struct avs_dev *adev, u32 core,
+				  struct avs_apl_log_buffer_layout *layout)
 {
 	unsigned long timeout;
 	void __iomem *addr;
@@ -99,11 +100,11 @@ static int apl_wait_log_entry(struct avs_dev *adev, u32 core, struct apl_log_buf
 }
 
 /* reads log header and tests its type */
-#define apl_is_entry_stackdump(addr) ((readl(addr) >> 30) & 0x1)
+#define avs_apl_is_entry_stackdump(addr) ((readl(addr) >> 30) & 0x1)
 
-static int apl_coredump(struct avs_dev *adev, union avs_notify_msg *msg)
+static int avs_apl_coredump(struct avs_dev *adev, union avs_notify_msg *msg)
 {
-	struct apl_log_buffer_layout layout;
+	struct avs_apl_log_buffer_layout layout;
 	void __iomem *addr, *buf;
 	size_t dump_size;
 	u16 offset = 0;
@@ -124,9 +125,9 @@ static int apl_coredump(struct avs_dev *adev, union avs_notify_msg *msg)
 	if (!addr)
 		goto exit;
 
-	buf = apl_log_payload_addr(addr);
+	buf = avs_apl_log_payload_addr(addr);
 	memcpy_fromio(&layout, addr, sizeof(layout));
-	if (!apl_is_entry_stackdump(buf + layout.read_ptr)) {
+	if (!avs_apl_is_entry_stackdump(buf + layout.read_ptr)) {
 		union avs_notify_msg lbs_msg = AVS_NOTIFICATION(LOG_BUFFER_STATUS);
 
 		/*
@@ -142,11 +143,11 @@ static int apl_coredump(struct avs_dev *adev, union avs_notify_msg *msg)
 	do {
 		u32 count;
 
-		if (apl_wait_log_entry(adev, msg->ext.coredump.core_id, &layout))
+		if (avs_apl_wait_log_entry(adev, msg->ext.coredump.core_id, &layout))
 			break;
 
 		if (layout.read_ptr > layout.write_ptr) {
-			count = apl_log_payload_size(adev) - layout.read_ptr;
+			count = avs_apl_log_payload_size(adev) - layout.read_ptr;
 			memcpy_fromio(pos + offset, buf + layout.read_ptr, count);
 			layout.read_ptr = 0;
 			offset += count;
@@ -165,7 +166,7 @@ static int apl_coredump(struct avs_dev *adev, union avs_notify_msg *msg)
 	return 0;
 }
 
-static bool apl_lp_streaming(struct avs_dev *adev)
+static bool avs_apl_lp_streaming(struct avs_dev *adev)
 {
 	struct avs_path *path;
 
@@ -201,7 +202,7 @@ static bool apl_lp_streaming(struct avs_dev *adev)
 	return true;
 }
 
-static bool apl_d0ix_toggle(struct avs_dev *adev, struct avs_ipc_msg *tx, bool wake)
+static bool avs_apl_d0ix_toggle(struct avs_dev *adev, struct avs_ipc_msg *tx, bool wake)
 {
 	/* wake in all cases */
 	if (wake)
@@ -215,10 +216,10 @@ static bool apl_d0ix_toggle(struct avs_dev *adev, struct avs_ipc_msg *tx, bool w
 	 * Note: for cAVS 1.5+ and 1.8, D0IX is LP-firmware transition,
 	 * not the power-gating mechanism known from cAVS 2.0.
 	 */
-	return apl_lp_streaming(adev);
+	return avs_apl_lp_streaming(adev);
 }
 
-static int apl_set_d0ix(struct avs_dev *adev, bool enable)
+static int avs_apl_set_d0ix(struct avs_dev *adev, bool enable)
 {
 	bool streaming = false;
 	int ret;
@@ -231,7 +232,7 @@ static int apl_set_d0ix(struct avs_dev *adev, bool enable)
 	return AVS_IPC_RET(ret);
 }
 
-const struct avs_dsp_ops apl_dsp_ops = {
+const struct avs_dsp_ops avs_apl_dsp_ops = {
 	.power = avs_dsp_core_power,
 	.reset = avs_dsp_core_reset,
 	.stall = avs_dsp_core_stall,
@@ -241,10 +242,10 @@ const struct avs_dsp_ops apl_dsp_ops = {
 	.load_basefw = avs_hda_load_basefw,
 	.load_lib = avs_hda_load_library,
 	.transfer_mods = avs_hda_transfer_modules,
-	.log_buffer_offset = skl_log_buffer_offset,
-	.log_buffer_status = apl_log_buffer_status,
-	.coredump = apl_coredump,
-	.d0ix_toggle = apl_d0ix_toggle,
-	.set_d0ix = apl_set_d0ix,
+	.log_buffer_offset = avs_skl_log_buffer_offset,
+	.log_buffer_status = avs_apl_log_buffer_status,
+	.coredump = avs_apl_coredump,
+	.d0ix_toggle = avs_apl_d0ix_toggle,
+	.set_d0ix = avs_apl_set_d0ix,
 	AVS_SET_ENABLE_LOGS_OP(apl)
 };
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 1882b2e640f4..ca14fcd6550a 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -64,8 +64,8 @@ struct avs_dsp_ops {
 #define avs_dsp_op(adev, op, ...) \
 	((adev)->spec->dsp_ops->op(adev, ## __VA_ARGS__))
 
-extern const struct avs_dsp_ops skl_dsp_ops;
-extern const struct avs_dsp_ops apl_dsp_ops;
+extern const struct avs_dsp_ops avs_skl_dsp_ops;
+extern const struct avs_dsp_ops avs_apl_dsp_ops;
 
 #define AVS_PLATATTR_CLDMA		BIT_ULL(0)
 #define AVS_PLATATTR_IMR		BIT_ULL(1)
@@ -249,7 +249,7 @@ void avs_ipc_block(struct avs_ipc *ipc);
 int avs_dsp_disable_d0ix(struct avs_dev *adev);
 int avs_dsp_enable_d0ix(struct avs_dev *adev);
 
-int skl_log_buffer_offset(struct avs_dev *adev, u32 core);
+int avs_skl_log_buffer_offset(struct avs_dev *adev, u32 core);
 
 /* Firmware resources management */
 
@@ -343,21 +343,21 @@ static inline int avs_log_buffer_status_locked(struct avs_dev *adev, union avs_n
 	return ret;
 }
 
-struct apl_log_buffer_layout {
+struct avs_apl_log_buffer_layout {
 	u32 read_ptr;
 	u32 write_ptr;
 	u8 buffer[];
 } __packed;
 
-#define apl_log_payload_size(adev) \
-	(avs_log_buffer_size(adev) - sizeof(struct apl_log_buffer_layout))
+#define avs_apl_log_payload_size(adev) \
+	(avs_log_buffer_size(adev) - sizeof(struct avs_apl_log_buffer_layout))
 
-#define apl_log_payload_addr(addr) \
-	(addr + sizeof(struct apl_log_buffer_layout))
+#define avs_apl_log_payload_addr(addr) \
+	(addr + sizeof(struct avs_apl_log_buffer_layout))
 
 #ifdef CONFIG_DEBUG_FS
 #define AVS_SET_ENABLE_LOGS_OP(name) \
-	.enable_logs = name##_enable_logs
+	.enable_logs = avs_##name##_enable_logs
 
 bool avs_logging_fw(struct avs_dev *adev);
 void avs_dump_fw_log(struct avs_dev *adev, const void __iomem *src, unsigned int len);
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index d46f76f8c274..75048a5f00f1 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -738,7 +738,7 @@ static const struct avs_spec skl_desc = {
 		.hotfix = 0,
 		.build = 4732,
 	},
-	.dsp_ops = &skl_dsp_ops,
+	.dsp_ops = &avs_skl_dsp_ops,
 	.core_init_mask = 1,
 	.attributes = AVS_PLATATTR_CLDMA,
 	.sram_base_offset = SKL_ADSP_SRAM_BASE_OFFSET,
@@ -754,7 +754,7 @@ static const struct avs_spec apl_desc = {
 		.hotfix = 1,
 		.build = 4323,
 	},
-	.dsp_ops = &apl_dsp_ops,
+	.dsp_ops = &avs_apl_dsp_ops,
 	.core_init_mask = 3,
 	.attributes = AVS_PLATATTR_IMR,
 	.sram_base_offset = APL_ADSP_SRAM_BASE_OFFSET,
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index d0344e242e5b..0f0862818f02 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -359,21 +359,21 @@ enum avs_skl_log_priority {
 	AVS_SKL_LOG_VERBOSE,
 };
 
-struct skl_log_state {
+struct avs_skl_log_state {
 	u32 enable;
 	u32 min_priority;
 } __packed;
 
-struct skl_log_state_info {
+struct avs_skl_log_state_info {
 	u32 core_mask;
-	struct skl_log_state logs_core[];
+	struct avs_skl_log_state logs_core[];
 } __packed;
 
-struct apl_log_state_info {
+struct avs_apl_log_state_info {
 	u32 aging_timer_period;
 	u32 fifo_full_timer_period;
 	u32 core_mask;
-	struct skl_log_state logs_core[];
+	struct avs_skl_log_state logs_core[];
 } __packed;
 
 int avs_ipc_set_enable_logs(struct avs_dev *adev, u8 *log_info, size_t size);
diff --git a/sound/soc/intel/avs/skl.c b/sound/soc/intel/avs/skl.c
index 6bb8bbc70442..7ea8d91b54d2 100644
--- a/sound/soc/intel/avs/skl.c
+++ b/sound/soc/intel/avs/skl.c
@@ -13,10 +13,10 @@
 #include "messages.h"
 
 static int __maybe_unused
-skl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
-		u32 fifo_full_period, unsigned long resource_mask, u32 *priorities)
+avs_skl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
+		    u32 fifo_full_period, unsigned long resource_mask, u32 *priorities)
 {
-	struct skl_log_state_info *info;
+	struct avs_skl_log_state_info *info;
 	u32 size, num_cores = adev->hw_cfg.dsp_cores;
 	int ret, i;
 
@@ -45,7 +45,7 @@ skl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_peri
 	return 0;
 }
 
-int skl_log_buffer_offset(struct avs_dev *adev, u32 core)
+int avs_skl_log_buffer_offset(struct avs_dev *adev, u32 core)
 {
 	return core * avs_log_buffer_size(adev);
 }
@@ -53,8 +53,7 @@ int skl_log_buffer_offset(struct avs_dev *adev, u32 core)
 /* fw DbgLogWp registers */
 #define FW_REGS_DBG_LOG_WP(core) (0x30 + 0x4 * core)
 
-static int
-skl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg)
+static int avs_skl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg)
 {
 	void __iomem *buf;
 	u16 size, write, offset;
@@ -74,7 +73,7 @@ skl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg)
 	return 0;
 }
 
-static int skl_coredump(struct avs_dev *adev, union avs_notify_msg *msg)
+static int avs_skl_coredump(struct avs_dev *adev, union avs_notify_msg *msg)
 {
 	u8 *dump;
 
@@ -88,20 +87,19 @@ static int skl_coredump(struct avs_dev *adev, union avs_notify_msg *msg)
 	return 0;
 }
 
-static bool
-skl_d0ix_toggle(struct avs_dev *adev, struct avs_ipc_msg *tx, bool wake)
+static bool avs_skl_d0ix_toggle(struct avs_dev *adev, struct avs_ipc_msg *tx, bool wake)
 {
 	/* unsupported on cAVS 1.5 hw */
 	return false;
 }
 
-static int skl_set_d0ix(struct avs_dev *adev, bool enable)
+static int avs_skl_set_d0ix(struct avs_dev *adev, bool enable)
 {
 	/* unsupported on cAVS 1.5 hw */
 	return 0;
 }
 
-const struct avs_dsp_ops skl_dsp_ops = {
+const struct avs_dsp_ops avs_skl_dsp_ops = {
 	.power = avs_dsp_core_power,
 	.reset = avs_dsp_core_reset,
 	.stall = avs_dsp_core_stall,
@@ -111,10 +109,10 @@ const struct avs_dsp_ops skl_dsp_ops = {
 	.load_basefw = avs_cldma_load_basefw,
 	.load_lib = avs_cldma_load_library,
 	.transfer_mods = avs_cldma_transfer_modules,
-	.log_buffer_offset = skl_log_buffer_offset,
-	.log_buffer_status = skl_log_buffer_status,
-	.coredump = skl_coredump,
-	.d0ix_toggle = skl_d0ix_toggle,
-	.set_d0ix = skl_set_d0ix,
+	.log_buffer_offset = avs_skl_log_buffer_offset,
+	.log_buffer_status = avs_skl_log_buffer_status,
+	.coredump = avs_skl_coredump,
+	.d0ix_toggle = avs_skl_d0ix_toggle,
+	.set_d0ix = avs_skl_set_d0ix,
 	AVS_SET_ENABLE_LOGS_OP(skl)
 };
-- 
2.25.1

