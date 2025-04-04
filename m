Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB7519E804
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 09:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743759208; cv=none; b=gsQA3KPVv+SV++G1hC0IoeAA34Ll5+TnKhyeuF1KCRAriTYAHLjOsU3z4QzVeV3SqyMTtWCGNtOKL0rivpbJ5+m8quekTQmfHg3MTanM4jKLilc4Ix5d8jbLIi4zzEYmQirOBMR5ZNQc7NI3N9h9eITxEmMQv1l0XmodmJlUiLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743759208; c=relaxed/simple;
	bh=hVVDWMkhZqJ3j8NJiH7odguYZuA2DwoZZorTiQsKIR4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h3RPKmzDGQL01ubzcHv9saVB1FX0L8PuScWYN3iIWTUqwWrrubgh/jtwErDkrhW1W4GiOMVZeOyFKbmXyXztUcXGcM5IFc+nHz9VcWYdo/rMm4V0BfuY9DEqARyih2pYT9KTbelQNQ1hF8/rSe3dnrh0Ab3egNFtH7DcW6dtgVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oH15eUev; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oH15eUev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743759204; x=1775295204;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hVVDWMkhZqJ3j8NJiH7odguYZuA2DwoZZorTiQsKIR4=;
  b=oH15eUevBa3MoJLGIW0gMozVDJAyc0ySPhv375sc9QcYp8Wn2mtA7snX
   jUhI/5YOw3+Twxo8BE6ILUH++tLPfkjMIRVgojapP/DpRqyFPq7kGLsLl
   i+YB2pdbmesafYUJOHVcgdfly0IusdwGpYoNlhhMCKf2GuuqhhLAHerwy
   CJluZJVWmL6Dpu0gF8iNbDy3z7PIPOZqKmVE/YAPSYIQ7QxsOTxQhjiQz
   pGV2HojB69zTphmgr7fEMHrXCOJfSYRXc0EEdsyhUgJgelBNMa22VvfiI
   jHYSTP3G57ub4MoVC9nGM9bgrlxZ+rgvQsNrdWG6PBWGdOxE90kNcNW/b
   A==;
X-CSE-ConnectionGUID: AbN1DytaSsW+H6WoD+8how==
X-CSE-MsgGUID: i8uG/1fNQBeob0LQY27+eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="70566360"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="70566360"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 02:33:23 -0700
X-CSE-ConnectionGUID: RNSG9RHRTe2hieK6VH/gwg==
X-CSE-MsgGUID: BEmpuBd2QlOYOgGsCtYTKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="158248621"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2025 02:33:01 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 06/12] ASoC: Intel: avs: LNL-based platforms support
Date: Fri,  4 Apr 2025 11:49:47 +0200
Message-Id: <20250404094953.3657679-7-cezary.rojewski@intel.com>
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

Define handlers specific to ACE 2.x platforms, that is MTL, ARL and all
variants based on this very version of AudioDSP architecture. Expect for
minor changes to core handling flow, all operations are inherited from
their predecessors.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/Makefile    |  2 +-
 sound/soc/intel/avs/avs.h       |  1 +
 sound/soc/intel/avs/core.c      | 24 ++++++++++++++++++
 sound/soc/intel/avs/lnl.c       | 44 +++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/registers.h |  1 +
 5 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/avs/lnl.c

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index 78cf65566510..e86a1854efaf 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -4,7 +4,7 @@ snd-soc-avs-y := dsp.o ipc.o messages.o utils.o core.o loader.o \
 		 topology.o path.o pcm.o board_selection.o control.o \
 		 sysfs.o
 snd-soc-avs-y += cldma.o
-snd-soc-avs-y += skl.o apl.o cnl.o icl.o tgl.o mtl.o
+snd-soc-avs-y += skl.o apl.o cnl.o icl.o tgl.o mtl.o lnl.o
 
 snd-soc-avs-y += trace.o
 # tell define_trace.h where to find the trace header
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index e0398319da9d..be6521bbf97d 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -70,6 +70,7 @@ extern const struct avs_dsp_ops avs_cnl_dsp_ops;
 extern const struct avs_dsp_ops avs_icl_dsp_ops;
 extern const struct avs_dsp_ops avs_tgl_dsp_ops;
 extern const struct avs_dsp_ops avs_mtl_dsp_ops;
+extern const struct avs_dsp_ops avs_lnl_dsp_ops;
 
 #define AVS_PLATATTR_CLDMA		BIT_ULL(0)
 #define AVS_PLATATTR_IMR		BIT_ULL(1)
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 069e97310457..b11083ff43b7 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -815,6 +815,18 @@ static const struct avs_hipc_spec mtl_hipc_spec = {
 	.sts_offset = MTL_REG_HfFLGP(0, 0),
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
@@ -892,6 +904,16 @@ static const struct avs_spec mtl_desc = {
 	.hipc = &mtl_hipc_spec,
 };
 
+static const struct avs_spec lnl_desc = {
+	.name = "lnl",
+	.min_fw_version = { 0 },
+	.dsp_ops = &avs_lnl_dsp_ops,
+	.core_init_mask = 1,
+	.attributes = AVS_PLATATTR_IMR | AVS_PLATATTR_ACE | AVS_PLATATTR_ALTHDA,
+	.sram = &mtl_sram_spec,
+	.hipc = &lnl_hipc_spec,
+};
+
 static const struct pci_device_id avs_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_SKL_LP, &skl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_SKL, &skl_desc) },
@@ -929,6 +951,7 @@ static const struct pci_device_id avs_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_PX,	&adl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_MTL,	&mtl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_ARL_S,	&mtl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_LNL_P,	&lnl_desc) },
 	{ 0 }
 };
 MODULE_DEVICE_TABLE(pci, avs_ids);
@@ -961,3 +984,4 @@ MODULE_FIRMWARE("intel/ehl/dsp_basefw.bin");
 MODULE_FIRMWARE("intel/adl/dsp_basefw.bin");
 MODULE_FIRMWARE("intel/adl_n/dsp_basefw.bin");
 MODULE_FIRMWARE("intel/mtl/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/lnl/dsp_basefw.bin");
diff --git a/sound/soc/intel/avs/lnl.c b/sound/soc/intel/avs/lnl.c
new file mode 100644
index 000000000000..46ffe5628548
--- /dev/null
+++ b/sound/soc/intel/avs/lnl.c
@@ -0,0 +1,44 @@
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
+static int avs_lnl_core_stall(struct avs_dev *adev, u32 core_mask, bool stall)
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
+
+const struct avs_dsp_ops avs_lnl_dsp_ops = {
+	.power = avs_mtl_core_power,
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
index f487db07aceb..844f168515cb 100644
--- a/sound/soc/intel/avs/registers.h
+++ b/sound/soc/intel/avs/registers.h
@@ -86,6 +86,7 @@
 
 #define MTL_HfFLV_BASE			0x162000
 #define MTL_REG_HfFLGP(x, y)		(MTL_HfFLV_BASE + 0x1200 + (x) * 0x20 + (y) * 0x08)
+#define LNL_REG_HfDFR(x)		(0x160200 + (x) * 0x8)
 
 #define MTL_DWICTL_BASE			0x1800
 #define MTL_DWICTL_REG_INTENL		(MTL_DWICTL_BASE + 0x0)
-- 
2.25.1

