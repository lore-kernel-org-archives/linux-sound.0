Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51863C5550
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560263; cv=none; b=W2Aqq6S1FRoeM5LCmY98W7RZzCtYIxdWrU/FravRMkrvkwHhF6wKYPfwcXJcqgJGvnrGRJt8Frjo0mzUzcA46388vHBgN96QKQO/TIbnS2QpHSJmzYXWlh6UdrgIkdhgSruN7i5ZaqV9f2l789QjRmsPpbV9nEgj+pJ5bFrf5pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560263; c=relaxed/simple;
	bh=5efcYEmpr7QRG8S+Rwjxqs3jhWzChxGMm4OP2njC5T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CbPJRaHfjGkDrkMdwxMGRSlHDDJ+EmrO+TpUWXwroG0Vb9xu9DrTgOepO8h8VPSOBwhGovHO1yqV0cOAZJNwISmpBFZ4bdTUaasvrAciPWXGmU2Lq28lIw+JPSJ4HpwHsEI0aHl7IIyAZsWI617rVGMoKR9ziK62cXayNxjreLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PTuNRENB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PTuNRENB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560259; x=1821096259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5efcYEmpr7QRG8S+Rwjxqs3jhWzChxGMm4OP2njC5T8=;
  b=PTuNRENB7wCy6ejmN9T5Hw35ex13PRYREOPbP9vPq+mWdwLmV+nFPKKz
   IAdpgXpIE0CSmIG2j93Gb7TFz2edgclRsD5mx8u1YPwln9ssRdZs/lp+a
   OK7gjdrJBBugLjqp66uKpgydRhBbHPBTKV5rtt7xh7HZGqyrLhpzZdMhd
   BFYxojEAhuzxaavPYMGVQmfA7Y5wUld82/oAxPXS0dLwYNyVjP/n6YeKE
   2XfmuE2i9euXygkmjiZTdQeHTYEh0X7zVMO4CJXTojNidJ441wdUl2ocS
   X7DZpAPIEbplCpIYaYL6cH5Z4qbTtkUdhCw5ACdUcoeVabJUM+KvP5z0T
   w==;
X-CSE-ConnectionGUID: GPs0d1K3QwKYwzi/hXtYsg==
X-CSE-MsgGUID: iLN9VZ7FSQmX47AW8o2Xiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496494"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496494"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:04:05 -0700
X-CSE-ConnectionGUID: r29ZKz3bSiWgARqym2F4iQ==
X-CSE-MsgGUID: srrzr61EQoOpczVjg39Qtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293592"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:04:03 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v4 18/26] ASoC: SOF: ipc4/ipc4-loader: Add SOF_INFO and CODEC_INFO to fw_config_params
Date: Wed, 16 Sep 2026 15:03:12 +0300
Message-ID: <20260916120320.18318-19-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SOF_INFO (id == 35) tuple holds tuple structured information about SOF
features.

The first entry in SOF_INFO is the SOF_CODEC_INFO (id == 0) which contains
information about the supported codecs for decode/encode in the booted
firmware.

If present in the fw_config payload, make a copy of it and store it
sof_ipc4_fw_data->codec_info to be used by the compressed code.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 include/sound/sof/ipc4/header.h | 18 ++++++++++------
 sound/soc/sof/ipc4-loader.c     | 37 +++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-priv.h       |  4 ++++
 3 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index e5161f0a37e8..dd1e0d1cf0d8 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -436,12 +436,10 @@ enum sof_ipc4_fw_config_params {
 	SOF_IPC4_FW_CFG_RESERVED,
 	SOF_IPC4_FW_CFG_POWER_GATING_POLICY,
 	SOF_IPC4_FW_CFG_ASSERT_MODE,
-	SOF_IPC4_FW_RESERVED1,
-	SOF_IPC4_FW_RESERVED2,
-	SOF_IPC4_FW_RESERVED3,
-	SOF_IPC4_FW_RESERVED4,
-	SOF_IPC4_FW_RESERVED5,
-	SOF_IPC4_FW_CONTEXT_SAVE
+	/* Reserved: 24 - 28 */
+	SOF_IPC4_FW_CONTEXT_SAVE = 29,
+	/* Reserved: 30 - 34 */
+	SOF_IPC4_FW_CFG_SOF_INFO = 35,
 };
 
 struct sof_ipc4_fw_version {
@@ -451,6 +449,14 @@ struct sof_ipc4_fw_version {
 	uint16_t build;
 } __packed;
 
+/*
+ * tuple based array for SOF specific information under SOF_IPC4_FW_CFG_SOF_INFO
+ * tuple of fw_config
+ */
+enum ipc4_fw_sof_info_params {
+	SOF_IPC4_SOF_CODEC_INFO,
+};
+
 /* Payload data for SOF_IPC4_MOD_SET_DX */
 struct sof_ipc4_dx_state_info {
 	/* core(s) to apply the change */
diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index 07a78cb3c25c..2dff394f4128 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -408,6 +408,38 @@ static int sof_ipc4_validate_firmware(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static int sof_ipc4_query_sof_info(struct snd_sof_dev *sdev,
+				   void *sof_info_data, u32 sof_info_size)
+{
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	struct sof_ipc4_tuple *tuple;
+	size_t offset = 0;
+
+	/*
+	 * No size validation is needed as the sof_info data is coming from
+	 * firmware as part of the firmware config, it is guarantied to be
+	 * correct.
+	 */
+	while (offset < sof_info_size) {
+		tuple = (struct sof_ipc4_tuple *)((u8 *)sof_info_data + offset);
+
+		switch (tuple->type) {
+		case SOF_IPC4_SOF_CODEC_INFO:
+			ipc4_data->codec_info = devm_kmemdup(sdev->dev, tuple->value,
+							     tuple->size, GFP_KERNEL);
+			if (!ipc4_data->codec_info)
+				return -ENOMEM;
+			break;
+		default:
+			break;
+		}
+
+		offset += sizeof(*tuple) + tuple->size;
+	}
+
+	return 0;
+}
+
 int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
@@ -483,6 +515,11 @@ int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev)
 			 */
 			ipc4_data->libraries_restored = ipc4_data->fw_context_save;
 			break;
+		case SOF_IPC4_FW_CFG_SOF_INFO:
+			ret = sof_ipc4_query_sof_info(sdev, tuple->value, tuple->size);
+			if (ret)
+				goto out;
+			break;
 		default:
 			break;
 		}
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 7c0861d63bef..07df6799c7a8 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -75,6 +75,8 @@ struct sof_ipc4_fw_library {
  * @fw_context_save: Firmware supports full context save and restore
  * @libraries_restored: The libraries have been retained during firmware boot
  *
+ * @codec_info: Information about the available codecs in booted firmware. The
+ *		data is to be used by the code for compressed support.
  * @load_library: Callback function for platform dependent library loading
  * @pipeline_state_mutex: Mutex to protect pipeline triggers, ref counts, states and deletion
  */
@@ -91,6 +93,8 @@ struct sof_ipc4_fw_data {
 	bool fw_context_save;
 	bool libraries_restored;
 
+	void *codec_info;
+
 	int (*load_library)(struct snd_sof_dev *sdev,
 			    struct sof_ipc4_fw_library *fw_lib, bool reload);
 	void (*intel_configure_mic_privacy)(struct snd_sof_dev *sdev,
-- 
2.55.0

