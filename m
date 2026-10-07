Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286C841440E
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363036; cv=none; b=Eev15VUYIWt+xPc9SyIasn0Hw5lTXoMQUkoO7c2cwM2oLDTInuBWr2hrT2a316gbRzaB0avtWGFahKjjXELGTd4WtrIf+qGt/So9ot/BBO3eYpVlfe2R4TJabwZOgvBinzdM7JUvtBXoPeudShvcUbW2Vd7AGtcmnTmUg6Gzoe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363036; c=relaxed/simple;
	bh=48XMEy2/SSh2VWL7lrUYQwVs04iuG3WPZgzOsR3f0k0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RbEpxx14KJj7r8JKhWU8ZkHF0ezmj1gt5V1NgY1jDv7kBQSdaW5lfSfaIOLHeeJakry4b0MCBWvUfW4MKKK4lu9g2wizliTHc944o9rzCWBUOy0X+TmhMUQkFtPE3tqCW2o0BTZrR6qFw/5dOsbkQj3K36/N/GXIOE29AtloqAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nr23aQFw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nr23aQFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791363035; x=1822899035;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=48XMEy2/SSh2VWL7lrUYQwVs04iuG3WPZgzOsR3f0k0=;
  b=nr23aQFwF46/mI9xWxJ/cQAZikZUiTqgwwvm42LoDUCoxrvS7gZgLsDh
   aqQhkpMOC6uEGus+X34yEu69CCR3tnHeLGrNkgz+zrk0OT4UayDakG6ub
   ig959Ul0li9G+5T5MCkpSa5w7b7CxrF3w8F2K/6ZueFXS4GDODwa1hM3c
   xPNvsw+CHjIdBwpVhnQPHmC+aqHGnyYhGP6eosxScADranC4Zx/ZVq/GF
   2zG1Mz7/r44l/hsDJc9VX5ZACk8nXwQA8H1opEddStzYyvY2zUbpZFpzx
   2apLt+eFAc/66f+HDyKfI96M4d7CguJGkE2Ss7qye40UMLDJvHlX2/Sai
   A==;
X-CSE-ConnectionGUID: CZMguWe9T/S+H+b8uoHPzw==
X-CSE-MsgGUID: 5H26aricT9yCETNV9Y5efg==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="114017"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="114017"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:35 -0700
X-CSE-ConnectionGUID: Z7kkkEBySZmmGfCK+k+9qw==
X-CSE-MsgGUID: Kdb6fSryQam7mP8LDGay4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670781"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:32 -0700
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
Subject: [PATCH v5 19/28] ASoC: SOF: ipc4/ipc4-loader: Add SOF_INFO and CODEC_INFO to fw_config_params
Date: Wed,  7 Oct 2026 11:49:46 +0300
Message-ID: <20261007084955.1256-20-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
References: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
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
index 29217a983e5c..33a8bf146bf6 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -81,6 +81,8 @@ struct snd_ipc4_nhlt {
  * @libraries_restored: The libraries have been retained during firmware boot
  * @nhlt_list: The NHLT tables from the BIOS and the topology manifest
  *
+ * @codec_info: Information about the available codecs in booted firmware. The
+ *		data is to be used by the code for compressed support.
  * @load_library: Callback function for platform dependent library loading
  * @pipeline_state_mutex: Mutex to protect pipeline triggers, ref counts, states and deletion
  */
@@ -97,6 +99,8 @@ struct sof_ipc4_fw_data {
 	bool libraries_restored;
 	struct list_head nhlt_list;
 
+	void *codec_info;
+
 	int (*load_library)(struct snd_sof_dev *sdev,
 			    struct sof_ipc4_fw_library *fw_lib, bool reload);
 	void (*intel_configure_mic_privacy)(struct snd_sof_dev *sdev,
-- 
2.56.0

