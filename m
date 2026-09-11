Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA54745FFA9
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125805; cv=none; b=BFjp7i2Xcfp1Ef+lzR3E4io1Hf/YMTVQQoEniX5aQSqGZJQOZfQkgVk1byqhgFoD0kskI+tkMS54kXz1EMnCuF6VJOfRRH+5t0znoMGna7aqwOlT45c0M4trAd/ObAsCGwJboYpgB91aDayfBPEF5s+n/P+wwYKfvFmjDIq8UsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125805; c=relaxed/simple;
	bh=rxA78f2Dwx/eTnmWDIAUN07vH6t2FvW0TB1c2wWo46s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBftHTnxbSP6OmMgP8uxKYBbZyoCcz9aN1i6fyQJPXEvLAPZRpSX9owErbwnBobK4dsTjmDH+TPPZoeUwC0eR2WzfNCBxRYNJ72n+Z46+TPucmnDzQI4iTAwbftWRZZ7tqmIIfhFQrVOWJuYSIlUwpLO6OuK+Vc9nepnOJdg4UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CR0TxB9D; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CR0TxB9D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125786; x=1820661786;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rxA78f2Dwx/eTnmWDIAUN07vH6t2FvW0TB1c2wWo46s=;
  b=CR0TxB9DbnvGVSZ3+D19UefIV6jFu7cUUw4VgaqJoSH0r1EnS0w90sUK
   dDLsXe0vqHKka33wi+Fb/4OzKNAIW9PX5zLEYwWMG9ndtwJ88KWlxpYHv
   daLd3wGtsMHYlx984VlrLiwLntyvIVnWAcl1wyiLrK3L+rS98zwZ3fFO4
   zZ3g+7byM97yCP0rKTVYk9DaaanzSbH48iWNBZZG5nS5tks71UjPN8cfk
   wXb2vawmGl1xHLrjSiTBY+y9ZvJwttVJW6l/9kbWLSRw/MnKdre5xIJfK
   K3ySj+nBlfrl0b8OxP5vl95MWpzbGKovJLZMnlZu+5mR044l2M/SnCcp6
   Q==;
X-CSE-ConnectionGUID: mlYYSOslQZujSGX1eD1uaw==
X-CSE-MsgGUID: N3I07elERYasEUTTTykEhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100750027"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100750027"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:37 -0700
X-CSE-ConnectionGUID: S/kRpztSQR+6O/bdBK2vYg==
X-CSE-MsgGUID: eKI8MlFaR5GuJFB25JGB3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213464"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:34 -0700
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
Subject: [PATCH v3 18/26] ASoC: SOF: ipc4/ipc4-loader: Add SOF_INFO and CODEC_INFO to fw_config_params
Date: Fri, 11 Sep 2026 14:21:44 +0300
Message-ID: <20260911112152.28528-19-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
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
 include/sound/sof/ipc4/header.h | 18 ++++++++----
 sound/soc/sof/ipc4-loader.c     | 51 +++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-priv.h       |  4 +++
 3 files changed, 67 insertions(+), 6 deletions(-)

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
index 07a78cb3c25c..8e0945b37ec8 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -408,6 +408,52 @@ static int sof_ipc4_validate_firmware(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static int sof_ipc4_query_sof_info(struct snd_sof_dev *sdev,
+				   void *sof_info_data, u32 sof_info_size)
+{
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	struct sof_ipc4_tuple *tuple;
+	size_t tuple_size;
+	size_t offset = 0;
+	int ret = 0;
+
+	while (offset < sof_info_size) {
+		if (sof_info_size - offset < sizeof(*tuple)) {
+			dev_err(sdev->dev, "Invalid SOF info tuple header at offset %zu\n", offset);
+			ret = -EINVAL;
+			goto out;
+		}
+
+		tuple = (struct sof_ipc4_tuple *)((u8 *)sof_info_data + offset);
+		tuple_size = sizeof(*tuple) + tuple->size;
+		if (tuple_size < sizeof(*tuple) || tuple_size > sof_info_size - offset) {
+			dev_err(sdev->dev,
+				"Invalid SOF info tuple size %u at offset %zu\n",
+				tuple->size, offset);
+			ret = -EINVAL;
+			goto out;
+		}
+
+		switch (tuple->type) {
+		case SOF_IPC4_SOF_CODEC_INFO:
+			ipc4_data->codec_info = devm_kmemdup(sdev->dev, tuple->value,
+							     tuple->size, GFP_KERNEL);
+			if (!ipc4_data->codec_info) {
+				ret = -ENOMEM;
+				goto out;
+			}
+			break;
+		default:
+			break;
+		}
+
+		offset += tuple_size;
+	}
+
+out:
+	return ret;
+}
+
 int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
@@ -483,6 +529,11 @@ int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev)
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

