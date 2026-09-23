Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEC442E439
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 05:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141335; cv=none; b=dcJzEdCyo0t2IfVGqdoVIwQ2k+vuB3S1iFEuHogILCW9F4s4jH2aWzTJ9t4+u5cPMxr0WvozHkat/rC+CLBZ6MgSW7YgwB+4VNlbsMZ9Xsl4y9gxuf9FWmXBSARxaHCdG87zHR+8dq912oY1M1Yx/qjEYpt16Sz5pznYoHolkJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141335; c=relaxed/simple;
	bh=pfu6Mn4QK3mXg9EoayReu3yL1FeIr+a+t5G2TrYFgUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g7JhbeS1SnHxFkKX5RerPjSxMM9OJFJ3Ttc8N6Pq5fsHYOD2VCibvs4QNVLj5C5QM3c+/12IWc6rMX3hJQdOI7/tI1vZaxIodJFG32Cjva660hmfUoVoJG39Zj1lKe+OI492lKzp94huiuCLspGvuxQ39YxkPGiVY5Svve8pzWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+iS6AaZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+iS6AaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790141333; x=1821677333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pfu6Mn4QK3mXg9EoayReu3yL1FeIr+a+t5G2TrYFgUg=;
  b=Q+iS6AaZtG5Wz3g/V4E7ZzNEQqjiThF1Rmyy9r9aR9hsz9aZUaBF+NRE
   rj+uLEptQdSNXhHmSPnTFb+105xxuH0fSCemfM7ZPOXsfMLI+R0Hz7Mw7
   h2Z7ZSDkIs5t/uQmfbQR93tJ3qD4OjKMq+Q/JdJMHJt+URKKSonOlMlvw
   3gENORSrOKOZZjKS5e5gOFAAhJH4POtjePn/fxfZfCZO9b7O/PCT/7Hoy
   JK3k1PHytwEiV422g1XBHz+BT/TZ2mmn0W43u72kIi3LroKhb4miwIcDb
   bHDCrTAGRhzuWhHa9mfWJ54kae9wz/F+ti4sWaU/IMD5ukDyEL+FRJLKE
   A==;
X-CSE-ConnectionGUID: kC6B1+EpRauDk3GiPc9ojQ==
X-CSE-MsgGUID: 5SL03EeoSryuVaACvAYtjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90821725"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="90821725"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:28:53 -0700
X-CSE-ConnectionGUID: jpNY9l5ORse83OYCQnNtNg==
X-CSE-MsgGUID: j8EEeHy7SaadVEMfY1PQQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="272938517"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:28:51 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 3/7] ASoC: Intel: sof-function-topology-lib: create common helpers
Date: Wed, 23 Sep 2026 13:28:28 +0800
Message-ID: <20260923052832.2392758-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923052832.2392758-1-yung-chuan.liao@linux.intel.com>
References: <20260923052832.2392758-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing code supports get_function_tplg_files callback for
SoundWire machine driver only. Some common sections can be used to
extend the support to other machines.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 .../intel/common/sof-function-topology-lib.c  | 139 ++++++++++++------
 1 file changed, 90 insertions(+), 49 deletions(-)

diff --git a/sound/soc/intel/common/sof-function-topology-lib.c b/sound/soc/intel/common/sof-function-topology-lib.c
index b6e5a40b78cc..657c7b8e06e8 100644
--- a/sound/soc/intel/common/sof-function-topology-lib.c
+++ b/sound/soc/intel/common/sof-function-topology-lib.c
@@ -28,6 +28,86 @@ enum tplg_device_id {
 
 #define SOF_INTEL_PLATFORM_NAME_MAX 4
 
+static int get_platform_name(struct snd_soc_card *card,
+			     const struct snd_soc_acpi_mach *mach, char *platform)
+{
+	int ret;
+
+	ret = sscanf(mach->sof_tplg_filename, "sof-%3s-*.tplg", platform);
+	if (ret != 1) {
+		dev_err(card->dev, "Invalid platform name of tplg %s\n",
+			mach->sof_tplg_filename);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static bool tplg_files_exist(struct device *dev, const char *tplg_files)
+{
+	const struct firmware *fw;
+	int ret;
+
+	ret = firmware_request_nowarn(&fw, tplg_files, dev);
+	if (!ret) {
+		release_firmware(fw);
+		return true;
+	}
+
+	dev_warn(dev,
+		 "Failed to open topology file: %s, you might need to\n",
+		 tplg_files);
+	dev_warn(dev,
+		 "download it from https://github.com/thesofproject/sof-bin/\n");
+	return false;
+}
+
+static char *get_tplg_filename(struct device *dev, const char *prefix,
+			       const char *platform, const char *tplg_dev_name,
+			       int dai_link_id, int tplg_dev)
+{
+	char *filename = NULL;
+
+	/*
+	 * The tplg file naming rule is sof-<platform>-<function>-id<BE id number>.tplg
+	 * where <platform> is only required for the devices that need NHLT blob like DMIC
+	 * as the nhlt blob is platform dependent.
+	 */
+	switch (tplg_dev) {
+	case TPLG_DEVICE_INTEL_PCH_DMIC:
+		filename = devm_kasprintf(dev, GFP_KERNEL, "%s/sof-%s-%s-id%d.tplg",
+					  prefix, platform, tplg_dev_name, dai_link_id);
+		break;
+	default:
+		filename = devm_kasprintf(dev, GFP_KERNEL, "%s/sof-%s-id%d.tplg",
+					  prefix, tplg_dev_name, dai_link_id);
+		break;
+	}
+
+	return filename;
+}
+
+static int get_dmic_tplg_dev(struct device *dev, int dmic_num,
+			     int *tplg_dev, char **tplg_dev_name)
+{
+	switch (dmic_num) {
+	case 2:
+		*tplg_dev_name = "dmic-2ch";
+		break;
+	case 4:
+		*tplg_dev_name = "dmic-4ch";
+		break;
+	default:
+		dev_warn(dev,
+			 "unsupported number of dmics: %d\n",
+			 dmic_num);
+		return -EINVAL;
+	}
+	*tplg_dev = TPLG_DEVICE_INTEL_PCH_DMIC;
+
+	return 0;
+}
+
 int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_mach *mach,
 			   const char *prefix, const char ***tplg_files, bool best_effort)
 {
@@ -38,7 +118,6 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 	 */
 	struct snd_soc_acpi_mach_params mach_params = card_mach->mach_params;
 	struct snd_soc_dai_link *dai_link;
-	const struct firmware *fw;
 	char platform[SOF_INTEL_PLATFORM_NAME_MAX];
 	unsigned long tplg_mask = 0;
 	int tplg_num = 0;
@@ -46,12 +125,9 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 	int ret;
 	int i;
 
-	ret = sscanf(mach->sof_tplg_filename, "sof-%3s-*.tplg", platform);
-	if (ret != 1) {
-		dev_err(card->dev, "Invalid platform name %s of tplg %s\n",
-			platform, mach->sof_tplg_filename);
-		return -EINVAL;
-	}
+	ret = get_platform_name(card, mach, platform);
+	if (ret < 0)
+		return ret;
 
 	for_each_card_prelinks(card, i, dai_link) {
 		char *tplg_dev_name;
@@ -70,20 +146,9 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 			tplg_dev = TPLG_DEVICE_SDCA_MIC;
 			tplg_dev_name = "sdca-mic";
 		} else if (strstr(dai_link->name, "dmic")) {
-			switch (mach_params.dmic_num) {
-			case 2:
-				tplg_dev_name = "dmic-2ch";
-				break;
-			case 4:
-				tplg_dev_name = "dmic-4ch";
-				break;
-			default:
-				dev_warn(card->dev,
-					 "unsupported number of dmics: %d\n",
-					 mach_params.dmic_num);
+			if (get_dmic_tplg_dev(card->dev, mach_params.dmic_num,
+					      &tplg_dev, &tplg_dev_name) < 0)
 				continue;
-			}
-			tplg_dev = TPLG_DEVICE_INTEL_PCH_DMIC;
 		} else if (strstr(dai_link->name, "iDisp")) {
 			tplg_dev = TPLG_DEVICE_HDMI;
 			tplg_dev_name = "hdmi-pcm5";
@@ -111,25 +176,9 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 
 		tplg_mask |= BIT(tplg_dev);
 
-		/*
-		 * The tplg file naming rule is sof-<platform>-<function>-id<BE id number>.tplg
-		 * where <platform> is only required for the DMIC function as the nhlt blob
-		 * is platform dependent.
-		 */
-		switch (tplg_dev) {
-		case TPLG_DEVICE_INTEL_PCH_DMIC:
-			(*tplg_files)[tplg_num] = devm_kasprintf(card->dev, GFP_KERNEL,
-								 "%s/sof-%s-%s-id%d.tplg",
-								 prefix, platform,
-								 tplg_dev_name, dai_link->id);
-			break;
-		default:
-			(*tplg_files)[tplg_num] = devm_kasprintf(card->dev, GFP_KERNEL,
-								 "%s/sof-%s-id%d.tplg",
-								 prefix, tplg_dev_name,
-								 dai_link->id);
-			break;
-		}
+		(*tplg_files)[tplg_num] = get_tplg_filename(card->dev, prefix, platform,
+							    tplg_dev_name, dai_link->id,
+							    tplg_dev);
 		if (!(*tplg_files)[tplg_num])
 			return -ENOMEM;
 		tplg_num++;
@@ -139,17 +188,9 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 
 	/* Check presence of sub-topologies */
 	for (i = 0; i < tplg_num; i++) {
-		ret = firmware_request_nowarn(&fw, (*tplg_files)[i], card->dev);
-		if (!ret) {
-			release_firmware(fw);
-		} else {
-			dev_warn(card->dev,
-				 "Failed to open topology file: %s, you might need to\n",
-				 (*tplg_files)[i]);
-			dev_warn(card->dev,
-				 "download it from https://github.com/thesofproject/sof-bin/\n");
+		if (!tplg_files_exist(card->dev, (*tplg_files)[i]))
+			/* return 0 to use monolithic topology */
 			return 0;
-		}
 	}
 
 	return tplg_num;
-- 
2.43.0

