Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CFB213252
	for <linux-sound@vger.kernel.org>; Thu, 23 Jan 2025 16:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737649399; cv=none; b=s4rQTXuVE4eAvw/zLUDVCKdN0N+wagnt9brYM4jbTyH7ZnZlWagxjhCTKo9u3vSiKvHs02G1zFJ8ZGHs/NECordIn7VdZ4P0e1obv2Okh9qc/QDbBw2J03Px6DTpCLkS8MhMUPzntORRnxYChVY2B3hH7IwWRaOxJZLwtEaooUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737649399; c=relaxed/simple;
	bh=s9wo7SLMtXruic1MhYBKouirxtYzQFaT+Dz+qbVSKXM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IXAcy18xDX8bvxbAY4UHnlnJOr3/l7ftmG7TYk0RxtxCb9iM334lwqEOIexIFKsJHia0xE7OIPnABR2vlYVcsyIoorlzsXPgg97EUIy64tcfWilcapfdMnbsX2r4oztTJ7r5qSRvq20csFy4qaTVoR9MlqYxOVpL5CLPm8G41cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CAFw+Djb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAFw+Djb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737649398; x=1769185398;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s9wo7SLMtXruic1MhYBKouirxtYzQFaT+Dz+qbVSKXM=;
  b=CAFw+Djb+juOZimux2SWPnFRNeQkCCbFHbogfBg56f4F8U96YkIH9oNa
   j8qXXq6zv47yvTZXiBBaGWYlsT3R29dwRVgp7GpdwRgY6wDY1q13Yu/qv
   rqZ2jGnLP/PcA6Fq4QO9y3kO2K27pUe8c/bMxSobwZj2mv3C+ugIkZoo7
   VwLLvPM84fafBa46AHFSFTyoS2DJxuE/dsIWGXa4Yr82/9iakBOLeSP0e
   iyn+7S6QAlr8uyqv6jmHcPhwGJvwf1sxaaAeEhiXs0EBcePB8uEC8U1Ht
   TALTLDb+6J5B1NIVCbqWbXpqlqPN0uCe/O7pEt7xXVpMLwJThVRE92tzT
   g==;
X-CSE-ConnectionGUID: UfqeSkfmQuWQVIOtYuY+ow==
X-CSE-MsgGUID: 1mEQ0fKuR4qevWljrZh1Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55572563"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="55572563"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 08:23:17 -0800
X-CSE-ConnectionGUID: VNbnxS4qRmmfJ9Chu2Wovw==
X-CSE-MsgGUID: YS++sTkFRR2Jl+6kWYEGvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107346790"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 08:23:10 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 07/11] ASoC: Intel: avs: Configure basefw on TGL-based platforms
Date: Thu, 23 Jan 2025 17:36:30 +0100
Message-Id: <20250123163634.1451237-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250123163634.1451237-1-cezary.rojewski@intel.com>
References: <20250123163634.1451237-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

The AudioDSP firmware requires additional information about the
configuration on selected devices. That information is unaccessible from
the DSP side and shall be sent before any streaming starts.

To achieve the goal, introduce FW_CONFIG_SET request. FW_CONFIG_SET
message allows driver to modify firmware's configuration. Multiple
parameters can be modified at once, thanks to payload being an array of
TLVs.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/messages.c | 38 ++++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/messages.h |  9 ++++++++
 sound/soc/intel/avs/tgl.c      | 31 +++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)

diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index 30b666f8909b..242a175381c2 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -510,6 +510,44 @@ int avs_ipc_get_fw_config(struct avs_dev *adev, struct avs_fw_cfg *cfg)
 	return ret;
 }
 
+int avs_ipc_set_fw_config(struct avs_dev *adev, size_t num_tlvs, ...)
+{
+	struct avs_tlv *tlv;
+	void *payload;
+	size_t offset;
+	va_list args;
+	int ret, i;
+
+	payload = kzalloc(AVS_MAILBOX_SIZE, GFP_KERNEL);
+	if (!payload)
+		return -ENOMEM;
+
+	va_start(args, num_tlvs);
+	for (offset = i = 0; i < num_tlvs && offset < AVS_MAILBOX_SIZE - sizeof(*tlv); i++) {
+		tlv = (struct avs_tlv *)(payload + offset);
+		tlv->type = va_arg(args, u32);
+		tlv->length = va_arg(args, u32);
+
+		offset += sizeof(*tlv) + tlv->length;
+		if (offset > AVS_MAILBOX_SIZE)
+			break;
+
+		memcpy(tlv->value, va_arg(args, u8*), tlv->length);
+	}
+
+	if (i == num_tlvs)
+		ret = avs_ipc_set_large_config(adev, AVS_BASEFW_MOD_ID, AVS_BASEFW_INST_ID,
+					       AVS_BASEFW_FIRMWARE_CONFIG, payload, offset);
+	else
+		ret = -ERANGE;
+
+	va_end(args);
+	kfree(payload);
+	if (ret)
+		dev_err(adev->dev, "set fw cfg failed: %d\n", ret);
+	return ret;
+}
+
 int avs_ipc_get_hw_config(struct avs_dev *adev, struct avs_hw_cfg *cfg)
 {
 	struct avs_tlv *tlv;
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 0378633c7f96..84b0d4b69ecb 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -451,6 +451,8 @@ enum avs_fw_cfg_params {
 	AVS_FW_CFG_RESERVED,
 	AVS_FW_CFG_POWER_GATING_POLICY,
 	AVS_FW_CFG_ASSERT_MODE,
+	AVS_FW_CFG_RESERVED2,
+	AVS_FW_CFG_BUS_HARDWARE_ID,
 };
 
 struct avs_fw_cfg {
@@ -475,7 +477,14 @@ struct avs_fw_cfg {
 	u32 power_gating_policy;
 };
 
+struct avs_bus_hwid {
+	u32 device;
+	u32 subsystem;
+	u8 revision;
+};
+
 int avs_ipc_get_fw_config(struct avs_dev *adev, struct avs_fw_cfg *cfg);
+int avs_ipc_set_fw_config(struct avs_dev *adev, size_t num_tlvs, ...);
 
 enum avs_hw_cfg_params {
 	AVS_HW_CFG_AVS_VER,
diff --git a/sound/soc/intel/avs/tgl.c b/sound/soc/intel/avs/tgl.c
index a9019ff5e3af..f18fa394aa53 100644
--- a/sound/soc/intel/avs/tgl.c
+++ b/sound/soc/intel/avs/tgl.c
@@ -6,7 +6,12 @@
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
 //
 
+#include <linux/pci.h>
+#include <asm/cpuid.h>
 #include "avs.h"
+#include "messages.h"
+
+#define CPUID_TSC_LEAF 0x15
 
 static int avs_tgl_dsp_core_power(struct avs_dev *adev, u32 core_mask, bool power)
 {
@@ -35,6 +40,31 @@ static int avs_tgl_dsp_core_stall(struct avs_dev *adev, u32 core_mask, bool stal
 	return avs_dsp_core_stall(adev, core_mask, stall);
 }
 
+static int avs_tgl_config_basefw(struct avs_dev *adev)
+{
+	struct pci_dev *pci = adev->base.pci;
+	struct avs_bus_hwid hwid;
+	unsigned int ecx;
+	int ret;
+
+	ecx = cpuid_ecx(CPUID_TSC_LEAF);
+	if (ecx) {
+		ret = avs_ipc_set_fw_config(adev, 1, AVS_FW_CFG_XTAL_FREQ_HZ, sizeof(ecx), &ecx);
+		if (ret)
+			return AVS_IPC_RET(ret);
+	}
+
+	hwid.device = pci->device;
+	hwid.subsystem = pci->subsystem_vendor | (pci->subsystem_device << 16);
+	hwid.revision = pci->revision;
+
+	ret = avs_ipc_set_fw_config(adev, 1, AVS_FW_CFG_BUS_HARDWARE_ID, sizeof(hwid), &hwid);
+	if (ret)
+		return AVS_IPC_RET(ret);
+
+	return 0;
+}
+
 const struct avs_dsp_ops avs_tgl_dsp_ops = {
 	.power = avs_tgl_dsp_core_power,
 	.reset = avs_tgl_dsp_core_reset,
@@ -44,6 +74,7 @@ const struct avs_dsp_ops avs_tgl_dsp_ops = {
 	.load_basefw = avs_icl_load_basefw,
 	.load_lib = avs_hda_load_library,
 	.transfer_mods = avs_hda_transfer_modules,
+	.config_basefw = avs_tgl_config_basefw,
 	.log_buffer_offset = avs_icl_log_buffer_offset,
 	.log_buffer_status = avs_apl_log_buffer_status,
 	.coredump = avs_apl_coredump,
-- 
2.25.1

