Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E1F218ADD
	for <linux-sound@vger.kernel.org>; Fri,  7 Mar 2025 11:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741346882; cv=none; b=Xf3Du+HrFASRX4BilFFin0KKMqJtaUm2mnE9b+8P9SG0x0YEzkGdV7DTXktJ0IXSz5+CcuZ5mfx5GbuQRxa5/mVvDcg2taRPh8yWMaoeZ5vSLyfDPfN8epOpUeVZ2zzvQbpnB7D9JSeYCP9GT3ogO47I3LuEZsXwF5NgHV/HX9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741346882; c=relaxed/simple;
	bh=kWjgrFuBUgS6viiOz4HqTd/6eFgp0j+xeukh5Bm5s3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u7GENJA8JVKwbZuKoGy3caLdPRAzWRH1QguAd6ro2Dt9/nyxUX3pvsLbNh5IJQ/s0zlk/EHBEyQOeLCKM0i9P/2A8LumHv7wqCC16fI2ri2ic3Ku/2quEXOMz7/g/AP9kLcPooEsQNhWDltUAtM8sOL1Su10p1coiBGSmJ/zd6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YvkFw98P; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YvkFw98P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741346880; x=1772882880;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kWjgrFuBUgS6viiOz4HqTd/6eFgp0j+xeukh5Bm5s3Q=;
  b=YvkFw98P6tcx43VWqPS3/QYQAFQvEz+evfl6ilNnvA3dtGc45juGPEdE
   bLTwwTl7+AZtDYgt6t4tyW9ACn1xHt0kjU2gfBDp+tBH+A2YxdBaxCoSD
   Bp0xLtBbHVdx8srQxC9UNe/mKMzUuN64dtCyEmTvMJrT9HpOevqYGwUcM
   VKimUQNIWzqcu2ZxZsg6ku3Mw9bvbPrTyrNiIPuJIz9FVAdrbBos9HZCp
   p8JL3kFsKmmLbNYPxypq46qC2vp1OOrwh80Cfa9+AVD43aRzoVKdYxOx+
   n3Rvj3tbY/vUoMeP8CsEMhx8nEJ/G4vnuetuGIYSy45WdWXR72Fp/f7MN
   Q==;
X-CSE-ConnectionGUID: FnZBYkZkRBuWzU34eJ5a0A==
X-CSE-MsgGUID: oC/C/AxyTKuC/3WnT0aU0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="29972310"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="29972310"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:28:00 -0800
X-CSE-ConnectionGUID: YghwhwoARDSriF8wJzsdAQ==
X-CSE-MsgGUID: s9dxe1jxRJ6VDGFY3Xqqkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="124390695"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.249.140])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:27:57 -0800
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
Subject: [PATCH v2 5/8] ASoC: SOF: ipc4: Add support for Intel HW managed mic privacy messaging
Date: Fri,  7 Mar 2025 13:28:13 +0200
Message-ID: <20250307112816.1495-6-peter.ujfalusi@linux.intel.com>
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

ACE3 (Panther Lake) introduced support for microphone privacy feature which
can - in hardware - mute incoming audio data based on a state of a physical
switch.
The change in the privacy state is delivered through interface IP blocks
and can only be handled by the link owner.
In Intel platforms Soundwire is for example host owned, so the interrupt
can only be handled by the host.

Since the input stream is going to be muted by hardware, the host needs to
send a message to firmware about the change in privacy so it can execute a
fade out/in to enhance user experience.

The support for microphone privacy can be queried from the HW_CONFIG data
under the INTEL_MIC_PRIVACY_CAP tuple. This is Intel specific data, the
core will pass it to platform code if the intel_configure_mic_privacy()
callback is provided.

Platform code can call sof_ipc4_mic_privacy_state_change() to send the IPC
message to the firmware on state change.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof/ipc4/header.h | 13 +++++++++++++
 sound/soc/sof/ipc4-loader.c     | 33 +++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-priv.h       |  5 +++++
 sound/soc/sof/ipc4.c            | 18 ++++++++++++++++++
 4 files changed, 69 insertions(+)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index 0c0cf47946b1..f71d04736d17 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -396,6 +396,7 @@ enum sof_ipc4_base_fw_params {
 	SOF_IPC4_FW_PARAM_MODULES_INFO_GET,
 	SOF_IPC4_FW_PARAM_LIBRARIES_INFO_GET = 16,
 	SOF_IPC4_FW_PARAM_SYSTEM_TIME = 20,
+	SOF_IPC4_FW_PARAM_MIC_PRIVACY_STATE_CHANGE = 35,
 };
 
 enum sof_ipc4_fw_config_params {
@@ -446,6 +447,18 @@ struct sof_ipc4_dx_state_info {
 	uint32_t dx_mask;
 } __packed __aligned(4);
 
+enum sof_ipc4_hw_config_params {
+	SOF_IPC4_HW_CFG_INTEL_MIC_PRIVACY_CAPS = 11,
+};
+
+#define SOF_IPC_INTEL_MIC_PRIVACY_VERSION_PTL	1
+
+struct sof_ipc4_intel_mic_privacy_cap {
+	uint32_t version;
+	uint32_t capabilities_length;
+	uint32_t capabilities[];
+} __packed;
+
 /* Reply messages */
 
 /*
diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index 6ad1ef0e53e8..d2f534d65edf 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -502,6 +502,39 @@ int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev)
 		offset += sizeof(*tuple) + tuple->size;
 	}
 
+	/* Get the hardware configuration */
+	msg.primary = SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
+	msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	msg.primary |= SOF_IPC4_MOD_ID(SOF_IPC4_MOD_INIT_BASEFW_MOD_ID);
+	msg.primary |= SOF_IPC4_MOD_INSTANCE(SOF_IPC4_MOD_INIT_BASEFW_INSTANCE_ID);
+	msg.extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_FW_PARAM_HW_CONFIG_GET);
+
+	msg.data_size = sdev->ipc->max_payload_size;
+
+	ret = iops->set_get_data(sdev, &msg, msg.data_size, false);
+	if (ret)
+		goto out;
+
+	offset = 0;
+	while (offset < msg.data_size) {
+		tuple = (struct sof_ipc4_tuple *)((u8 *)msg.data_ptr + offset);
+
+		switch (tuple->type) {
+		case SOF_IPC4_HW_CFG_INTEL_MIC_PRIVACY_CAPS:
+			if (ipc4_data->intel_configure_mic_privacy) {
+				struct sof_ipc4_intel_mic_privacy_cap *caps;
+
+				caps = (struct sof_ipc4_intel_mic_privacy_cap *)tuple->value;
+				ipc4_data->intel_configure_mic_privacy(sdev, caps);
+			}
+			break;
+		default:
+			break;
+		}
+
+		offset += sizeof(*tuple) + tuple->size;
+	}
+
 out:
 	kfree(msg.data_ptr);
 
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index b798810eff91..58b032820683 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -11,6 +11,7 @@
 
 #include <linux/idr.h>
 #include <sound/sof/ext_manifest4.h>
+#include <sound/sof/ipc4/header.h>
 #include "sof-priv.h"
 
 /* The DSP window indices are fixed */
@@ -89,6 +90,8 @@ struct sof_ipc4_fw_data {
 
 	int (*load_library)(struct snd_sof_dev *sdev,
 			    struct sof_ipc4_fw_library *fw_lib, bool reload);
+	void (*intel_configure_mic_privacy)(struct snd_sof_dev *sdev,
+					    struct sof_ipc4_intel_mic_privacy_cap *caps);
 	struct mutex pipeline_state_mutex; /* protect pipeline triggers, ref counts and states */
 };
 
@@ -118,4 +121,6 @@ void sof_ipc4_update_cpc_from_manifest(struct snd_sof_dev *sdev,
 size_t sof_ipc4_find_debug_slot_offset_by_type(struct snd_sof_dev *sdev,
 					       u32 slot_type);
 
+void sof_ipc4_mic_privacy_state_change(struct snd_sof_dev *sdev, bool state);
+
 #endif
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 2ed0c52fb2f1..37e837b22ac8 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -851,3 +851,21 @@ const struct sof_ipc_ops ipc4_ops = {
 	.pcm = &ipc4_pcm_ops,
 	.fw_tracing = &ipc4_mtrace_ops,
 };
+
+void sof_ipc4_mic_privacy_state_change(struct snd_sof_dev *sdev, bool state)
+{
+	struct sof_ipc4_msg msg;
+	u32 data = state;
+
+	msg.primary = SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
+	msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	msg.primary |= SOF_IPC4_MOD_ID(SOF_IPC4_MOD_INIT_BASEFW_MOD_ID);
+	msg.primary |= SOF_IPC4_MOD_INSTANCE(SOF_IPC4_MOD_INIT_BASEFW_INSTANCE_ID);
+	msg.extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_FW_PARAM_MIC_PRIVACY_STATE_CHANGE);
+
+	msg.data_size = sizeof(data);
+	msg.data_ptr = &data;
+
+	sof_ipc4_set_get_data(sdev, &msg, msg.data_size, true);
+}
+EXPORT_SYMBOL(sof_ipc4_mic_privacy_state_change);
-- 
2.48.1

