Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECEC44F568
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069012; cv=none; b=hUe9VKhatWulAGYYXJPf4dBrI2h4I6CP0g82M1XaeMkHtVb+iz1JvfkAxS6bRfLajAwpfmvjOx4JiLizdCbnDwQ+DQtDkjsgTIuSSIJueGdlqfbN3vOlAvDHgT3zi9lD605vNMNPvWKrWR+pmVOa2bW8JlBqTsf1k5Z0Z/EC+II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069012; c=relaxed/simple;
	bh=pfu6Mn4QK3mXg9EoayReu3yL1FeIr+a+t5G2TrYFgUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ky69DDzVWAVzkh68g/RxxYF3j4OAEUK7fkulBzj/EHq6wRf9INzSaIcMA5l5h4xBHimmtTJ8LoTlAyNw7zuv/C/z7FDyOIZDmkg5U2CjSLwFYmE/dVHWUT8EldspVDrKATvjvs3+UxSBU9OS2TIaxPwifpgQ+oxC6Nm1wnZuwx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4SRGKfs; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4SRGKfs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790069011; x=1821605011;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pfu6Mn4QK3mXg9EoayReu3yL1FeIr+a+t5G2TrYFgUg=;
  b=J4SRGKfsgvNC+I6LDdPaT2GfkuEVVbD51dq7nqhBuAt7RNAD8XExWQsh
   RYSZFU5jBumARhl9AXddIHNji+OFIE768R7WURZw4iZQsA+4VsBCwBPfs
   7aUwPq2onh3R/AW/mHwJZpD+eiy+lIvPKhnS0fXnEIEVNd0xBtPMTIe6M
   J3enW5qkZfJH5OlVz6EaL1q1zWpDWHAGeKRYZCu5/sYQGDmCWjTjDcUbJ
   4O9dE1Ga5GMAeWFwGbWjEsoBZ2A/t2lITXjI4YADds80FoDp5evtJ+CPD
   0VuRf1OMIjHaGmMn9zafF6Mf6N1kg6ZWFR1upYR/WkCuDlUoV8MPASUW4
   w==;
X-CSE-ConnectionGUID: +/kTQRvUT/KOhDJdtfSNXw==
X-CSE-MsgGUID: w/8hYGgeRgmvbJr0NKp29A==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89576744"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="89576744"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:23:30 -0700
X-CSE-ConnectionGUID: FLeBBAakSHS8cdyYJtLzEg==
X-CSE-MsgGUID: 8c2YliuTQVS6JhJJYqF7kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="277837537"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:23:28 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 3/7] ASoC: Intel: sof-function-topology-lib: create common helpers
Date: Tue, 22 Sep 2026 17:23:12 +0800
Message-ID: <20260922092316.2296039-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922092316.2296039-1-yung-chuan.liao@linux.intel.com>
References: <20260922092316.2296039-1-yung-chuan.liao@linux.intel.com>
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

