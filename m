Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A0A217F31
	for <linux-sound@vger.kernel.org>; Fri,  7 Mar 2025 11:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741346893; cv=none; b=mvEkLVo/Hu2Re3gn0iSE3lW0SJ8S4VzwAhL0a18jOK5wB9FdNO376DVVqej2nYZ/BmvKC8Lb0D86KATtyqAVA7lPELCJpkkDtc9xJrt8Hi6XyVCuazcxiaZK+pQzLtw0pw0zMci4yRZlrPAnKhLZt+5ML1VWFy6VcG1wy8ahVzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741346893; c=relaxed/simple;
	bh=y7GlNf9+d28AxXBB8J8fWnawXlS8pxJVs8tZ0q+nUSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bsBTbaEEzvztV7EXwV2dPmA/SSwBu5I81705z5DRXaqLbFcYkdehiercg84ZtOBSNarRPkP34uOR4Gd67INyJXR7yhTSLmvUa3x6cd9eI8bExYeuc49nESKANxaBGoY8mEoxLrFl5/EyENFT7+ACTE+Bx7aBWSrkAlRBmDmpwT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O34qQYS5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O34qQYS5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741346891; x=1772882891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y7GlNf9+d28AxXBB8J8fWnawXlS8pxJVs8tZ0q+nUSA=;
  b=O34qQYS5DLPA77OUc9KjAcgaf0DCRYceMBbSBdL+nZNARcWxCpnPadaS
   b5jPU3S5WiIWZQUDbPVTMAuA8iEaZlRI7j+luWRd+B9Gaw9DKUaQZtudI
   /165SJ0MZcVWqkLpSBl4fOcyr7I4N+y7L5ysFARyQ4oW2HUckg4FQIgFs
   3CpBDgZri4acHP3mAMgrld3wNCeEOPjoPs2hJm5SGDyD6mYZQSnsk2n3I
   usiy7ZyGhipqsDnY6GwkLFbRcV22rl+ERWeMUuOYpRmgRnfbzC0cDBUz7
   YF9FiYRUrgvFHcTkRjdYaEFuI8eqqAkMh/fxHHwhi69kbZRCbiSO7Mbia
   Q==;
X-CSE-ConnectionGUID: XgVlBMULSFmkVWjKi41Jrw==
X-CSE-MsgGUID: eULFT09yTwOSVNBtdXrJZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="29972338"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="29972338"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:28:11 -0800
X-CSE-ConnectionGUID: hw1e2S5sRHOQQN9Q0rpf9Q==
X-CSE-MsgGUID: fQO6bwgTSyaLG6wodYJu2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="124390727"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.249.140])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:28:08 -0800
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
Subject: [PATCH v2 8/8] ASoC: SOF: Intel: ptl: Add support for mic privacy
Date: Fri,  7 Mar 2025 13:28:16 +0200
Message-ID: <20250307112816.1495-9-peter.ujfalusi@linux.intel.com>
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

Implement the three callbacks that is needed to enable support for
reporting the mic privacy change via soundwire.

In PTL the mic privacy reporting is supported via soundwire and DMIC and
the soundwire is owned by the host, it's interrupt is routed there.

To enable the interrupt, the sublink mask needs to be passed to the
multilink layer, the check_mic_privacy_irq/process_mic_privacy callbacks
needs to be implemented to check and report the mic privacy change.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/ptl.c | 58 +++++++++++++++++++++++++++++++++++++--
 sound/soc/sof/intel/ptl.h |  5 ++++
 2 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/ptl.c b/sound/soc/sof/intel/ptl.c
index ae8e9e08ad2a..8fa4bdceedd9 100644
--- a/sound/soc/sof/intel/ptl.c
+++ b/sound/soc/sof/intel/ptl.c
@@ -18,10 +18,62 @@
 #include "lnl.h"
 #include "ptl.h"
 
-int sof_ptl_set_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *dsp_ops)
+static bool sof_ptl_check_mic_privacy_irq(struct snd_sof_dev *sdev, bool alt,
+					  int elid)
+{
+	if (!alt || elid != AZX_REG_ML_LEPTR_ID_SDW)
+		return false;
+
+	return hdac_bus_eml_is_mic_privacy_changed(sof_to_bus(sdev), alt, elid);
+}
+
+static void sof_ptl_process_mic_privacy(struct snd_sof_dev *sdev, bool alt,
+					int elid)
+{
+	bool state;
+
+	if (!alt || elid != AZX_REG_ML_LEPTR_ID_SDW)
+		return;
+
+	state = hdac_bus_eml_get_mic_privacy_state(sof_to_bus(sdev), alt, elid);
+
+	sof_ipc4_mic_privacy_state_change(sdev, state);
+}
+
+static void sof_ptl_set_mic_privacy(struct snd_sof_dev *sdev,
+				    struct sof_ipc4_intel_mic_privacy_cap *caps)
 {
-	return sof_lnl_set_ops(sdev, dsp_ops);
+	u32 micpvcp;
+
+	if (!caps || !caps->capabilities_length)
+		return;
+
+	micpvcp = caps->capabilities[0];
+
+	/* No need to set the mic privacy if it is not enabled or forced */
+	if (!(micpvcp & PTL_MICPVCP_DDZE_ENABLED) ||
+	    micpvcp & PTL_MICPVCP_DDZE_FORCED)
+		return;
+
+	hdac_bus_eml_set_mic_privacy_mask(sof_to_bus(sdev), true,
+					  AZX_REG_ML_LEPTR_ID_SDW,
+					  PTL_MICPVCP_GET_SDW_MASK(micpvcp));
 }
+
+int sof_ptl_set_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *dsp_ops)
+{
+	struct sof_ipc4_fw_data *ipc4_data;
+	int ret;
+
+	ret = sof_lnl_set_ops(sdev, dsp_ops);
+	if (ret)
+		return ret;
+
+	ipc4_data = sdev->private;
+	ipc4_data->intel_configure_mic_privacy = sof_ptl_set_mic_privacy;
+
+	return 0;
+};
 EXPORT_SYMBOL_NS(sof_ptl_set_ops, "SND_SOC_SOF_INTEL_PTL");
 
 const struct sof_intel_dsp_desc ptl_chip_info = {
@@ -41,6 +93,8 @@ const struct sof_intel_dsp_desc ptl_chip_info = {
 	.check_sdw_irq = lnl_dsp_check_sdw_irq,
 	.check_sdw_wakeen_irq = lnl_sdw_check_wakeen_irq,
 	.check_ipc_irq = mtl_dsp_check_ipc_irq,
+	.check_mic_privacy_irq = sof_ptl_check_mic_privacy_irq,
+	.process_mic_privacy = sof_ptl_process_mic_privacy,
 	.cl_init = mtl_dsp_cl_init,
 	.power_down_dsp = mtl_power_down_dsp,
 	.disable_interrupts = lnl_dsp_disable_interrupts,
diff --git a/sound/soc/sof/intel/ptl.h b/sound/soc/sof/intel/ptl.h
index 186f7c835acb..6a7ef11f411e 100644
--- a/sound/soc/sof/intel/ptl.h
+++ b/sound/soc/sof/intel/ptl.h
@@ -9,6 +9,11 @@
 #ifndef __SOF_INTEL_PTL_H
 #define __SOF_INTEL_PTL_H
 
+#define PTL_MICPVCP_DDZE_FORCED		BIT(16)
+#define PTL_MICPVCP_DDZE_ENABLED	BIT(17)
+#define PTL_MICPVCP_DDZLS_SDW		GENMASK(26, 20)
+#define PTL_MICPVCP_GET_SDW_MASK(x)	(((x) & PTL_MICPVCP_DDZLS_SDW) >> 20)
+
 int sof_ptl_set_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *dsp_ops);
 
 #endif /* __SOF_INTEL_PTL_H */
-- 
2.48.1

