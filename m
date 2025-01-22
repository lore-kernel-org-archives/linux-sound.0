Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DA6214802
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 17:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737567658; cv=none; b=XyWrmc0UjCPKVc39220fnjJNITd0oi1H/jSXU8y22MjUvvreAHGhqrGd82OR5W6orQTSS/TYB8bMpCjPpdbG+oJog6G3Z0eqyFEvBG1BzubwKXjUiStkjuK7XlsHKppgGqPA1wzntF3gX14KpIIuvDT/JyX3yUKfVphD1viBhuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737567658; c=relaxed/simple;
	bh=s9wo7SLMtXruic1MhYBKouirxtYzQFaT+Dz+qbVSKXM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f0NoukQyooNNBRiNJj0v+tj0ucMnycXSmV6pg+i0ZbJWN2cUSUyxb2u+IDCPGodNSTMViwgLouxRqBfWFA+8RlshuGm8QwUGVRyH6BSbzXvD/IAofLvB6aUcNTSqib3VDBbWVsToExkrWflQPE3PtvVormkKVzohDz70iYkmVgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mfD+epcL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mfD+epcL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737567657; x=1769103657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s9wo7SLMtXruic1MhYBKouirxtYzQFaT+Dz+qbVSKXM=;
  b=mfD+epcLPA9fGKunkbk6Q+vIAlW9thpRkhEYhDR4d5AI+pSpPgN1X9I7
   ENfxa3wVFWXVZq0olyUDQyKshoZQYpw0Jb9Dw9aQW4ii4DxcyNu49KGk9
   C37y5fUkt0Bh7YlCpPsujlxBxyc9pDjaEQ266SDwsWyR/lOjPziZt/6t6
   LIFZz8e3Xy9ZcZfj2fy/FF/tp79mjoQbGgghZ4HvY+T08cDMa/v1jzhMj
   afY2IXpk/jyvSodP4lwkYh6TCTlBiNutOldk9vO3WoPLyIGmEuqIlefBd
   rtZ6pX3dZ98b2dRqc2YiY5tdYHQWIszNhc+Hgpll56pEtg+3qM7MO/DEW
   A==;
X-CSE-ConnectionGUID: c8OEf7rSQnSEWXp/hKGi6w==
X-CSE-MsgGUID: Xl6cb02YQwGADUxUYfdsZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49434763"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="49434763"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 09:40:57 -0800
X-CSE-ConnectionGUID: VyatG/mQSAOAcmAppzsslw==
X-CSE-MsgGUID: mli6+iF8TcCEHb1xSP3NDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112185310"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa003.jf.intel.com with ESMTP; 22 Jan 2025 09:40:55 -0800
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
Subject: [PATCH 07/11] ASoC: Intel: avs: Configure basefw on TGL-based platforms
Date: Wed, 22 Jan 2025 18:54:22 +0100
Message-Id: <20250122175426.1369059-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122175426.1369059-1-cezary.rojewski@intel.com>
References: <20250122175426.1369059-1-cezary.rojewski@intel.com>
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

