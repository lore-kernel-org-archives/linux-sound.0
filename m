Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F07B2139BF
	for <linux-sound@vger.kernel.org>; Thu, 23 Jan 2025 16:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737649391; cv=none; b=cTVNtkNEuo+OllxLOvmPvSZ+B82UwyKbF545Re3ynI3zu1eIaCwScbjgm9AKOm8VtGNt/pe2sW5svWCpmrxsF2yX9ckn+cveO6BrYPbTYsYnKdrSS6eQQ4Npsu0IsjEzY8pJ40S3M3HP4aV3CXLAp6+ij8JLkjMvRpAY6QmK370=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737649391; c=relaxed/simple;
	bh=WW8ypsnsHeYCqNbh1BRe3q9h4avF+3PZbincjq4qkBg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GKdv3krN3mhFSIFcAR4shtwPUbbJsg6sPuCfBGY6b8PovCLyeCXKAumkizynWtkFcy7DvZiA4w46A+tTh/id8e61NXvSgLGLZG/Tj+tZsNvo0FhT2FeDxXpIUOAdWtnp1TavrBTQF6wGSqhcceJs1UnM2YF/hvzb6FseTA5+KWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=coqhJ9x8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="coqhJ9x8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737649391; x=1769185391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WW8ypsnsHeYCqNbh1BRe3q9h4avF+3PZbincjq4qkBg=;
  b=coqhJ9x8dALAQWOaNZ2cqMicXAYNCN7tJJCUOTvOOFs6UPPpRbyfedyO
   8HbkiB2Z91JlBrMmhmdMkz0naba3jNS9NiGvOLCtymOslb34gT3RfSdju
   FJ7Q78NpQyrte5+PftpxzBgvm9JBCvDzuWbdwYan4vAr9lffCIP3fZLA8
   lvfPcykU5Y2X45H/fJJAt7eRs5I9t6hhlXvBkp2g/G/VJM+i4jO2p/BfY
   5/2TqN9S2Wxq6tpuLY3QIs4g/GRjiMQL74bUORGrelFIKcWbOK7FxfmmM
   W2U83cIzs75AHumfLO+LoL6MO8xd5idFM6nuPQ95+J2SJkFxJwHaXGwWd
   g==;
X-CSE-ConnectionGUID: iEzdVvrRRWujyxnvxmIz3g==
X-CSE-MsgGUID: NrDSBfZdSweJ87nWac4X5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55572530"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="55572530"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 08:23:11 -0800
X-CSE-ConnectionGUID: vNwIFDf7R6mxJA7n3BPr4Q==
X-CSE-MsgGUID: rBSgqtpBT3u2UaWtYY3InQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107346781"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 08:23:08 -0800
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
Subject: [PATCH v2 06/11] ASoC: Intel: avs: Move DSP-boot steps into individual functions
Date: Thu, 23 Jan 2025 17:36:29 +0100
Message-Id: <20250123163634.1451237-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250123163634.1451237-1-cezary.rojewski@intel.com>
References: <20250123163634.1451237-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To make DSP-boot code more readable, move each logical step into an
individual function and add the configure step which will be utilized by
follow up changes. To summarize, the steps are: loading the firmware
code, configuring the base firmware and, allocating driver resources
based on FW and HW capabilities.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h    |  1 +
 sound/soc/intel/avs/loader.c | 64 ++++++++++++++++++++++++++----------
 2 files changed, 48 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index eca6ec0428bb..585543f872fc 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -51,6 +51,7 @@ struct avs_dsp_ops {
 	int (* const load_basefw)(struct avs_dev *, struct firmware *);
 	int (* const load_lib)(struct avs_dev *, struct firmware *, u32);
 	int (* const transfer_mods)(struct avs_dev *, bool, struct avs_module_entry *, u32);
+	int (* const config_basefw)(struct avs_dev *);
 	int (* const enable_logs)(struct avs_dev *, enum avs_log_enable, u32, u32, unsigned long,
 				  u32 *);
 	int (* const log_buffer_offset)(struct avs_dev *, u32);
diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 9ff7818395cd..0b29941feb0e 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -603,7 +603,7 @@ static int avs_dsp_load_basefw(struct avs_dev *adev)
 	return ret;
 }
 
-int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge)
+static int avs_load_firmware(struct avs_dev *adev, bool purge)
 {
 	struct avs_soc_component *acomp;
 	int ret, i;
@@ -657,28 +657,33 @@ int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge)
 	return 0;
 }
 
-int avs_dsp_first_boot_firmware(struct avs_dev *adev)
+static int avs_config_basefw(struct avs_dev *adev)
 {
-	int ret, i;
+	int ret;
 
-	if (avs_platattr_test(adev, CLDMA)) {
-		ret = hda_cldma_init(&code_loader, &adev->base.core,
-				     adev->dsp_ba, AVS_CL_DEFAULT_BUFFER_SIZE);
-		if (ret < 0) {
-			dev_err(adev->dev, "cldma init failed: %d\n", ret);
+	if (adev->spec->dsp_ops->config_basefw) {
+		ret = avs_dsp_op(adev, config_basefw);
+		if (ret)
 			return ret;
-		}
 	}
 
-	ret = avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
-	if (ret < 0)
-		return ret;
+	return 0;
+}
+
+int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge)
+{
+	int ret;
 
-	ret = avs_dsp_boot_firmware(adev, true);
-	if (ret < 0) {
-		dev_err(adev->dev, "firmware boot failed: %d\n", ret);
+	ret = avs_load_firmware(adev, purge);
+	if (ret)
 		return ret;
-	}
+
+	return avs_config_basefw(adev);
+}
+
+static int avs_dsp_alloc_resources(struct avs_dev *adev)
+{
+	int ret, i;
 
 	ret = avs_ipc_get_hw_config(adev, &adev->hw_cfg);
 	if (ret)
@@ -705,6 +710,31 @@ int avs_dsp_first_boot_firmware(struct avs_dev *adev)
 	strscpy(adev->lib_names[0], "BASEFW", AVS_LIB_NAME_SIZE);
 
 	ida_init(&adev->ppl_ida);
-
 	return 0;
 }
+
+int avs_dsp_first_boot_firmware(struct avs_dev *adev)
+{
+	int ret;
+
+	if (avs_platattr_test(adev, CLDMA)) {
+		ret = hda_cldma_init(&code_loader, &adev->base.core,
+				     adev->dsp_ba, AVS_CL_DEFAULT_BUFFER_SIZE);
+		if (ret < 0) {
+			dev_err(adev->dev, "cldma init failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
+	if (ret < 0)
+		return ret;
+
+	ret = avs_dsp_boot_firmware(adev, true);
+	if (ret < 0) {
+		dev_err(adev->dev, "firmware boot failed: %d\n", ret);
+		return ret;
+	}
+
+	return avs_dsp_alloc_resources(adev);
+}
-- 
2.25.1

