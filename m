Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4787205ACE
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 13:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591038; cv=none; b=deXAYstIANAS/5I75hni69uefeNtiCgLlgy5Y90MHkm6p+XWLCYwa0TvOLAYS6rpB0aLMxdgp7afbVAt/zOCtPm7aAqIdf5aLzO47/YjD7FMYVzEC3qEGKATqSBTxHr+4RIGYGKjpCpwuPUwR4ArP97JUWGKV7qJQcEC4xex/y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591038; c=relaxed/simple;
	bh=WW8ypsnsHeYCqNbh1BRe3q9h4avF+3PZbincjq4qkBg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T55hl5xV0PH8xBQ/Q7VQSv//HN9bij5NcWefhSruMArRqBACNVKpocj3mUZwsEkLtGXOEaJFJ7BB2M6rKSSHS0OnGbnUuy7tElw0Wqjx4T0RsGusrs21Zig0Y/pdRAdJUVFDjSu05W2BtcjhOu3xnTcOMK0PHFpLPDkffOv1t38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0MOFK8L; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0MOFK8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738591037; x=1770127037;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WW8ypsnsHeYCqNbh1BRe3q9h4avF+3PZbincjq4qkBg=;
  b=R0MOFK8LwoBhnvA1SEsAsqLku9ho1dErQW1+v8pfEaohPVDZCYf49O+c
   rB8edzoRDZxhzkqulr1y/du3Sx+NrlKoLYPrE9/Dw+3aapnqmlNZ9TfWY
   AcZy9LICEVA+4bIZtX9cw015t0Vaknng/Zw3mno6p7U4WHT0pypFfXXuV
   NdkWJW9BxbUnCwnPQ94PoVr3VuZR92dIPMDFVC2Ztb3DdwdzrzKk3VjhX
   5DdB1VFd7WlasEH4Dja6jLC0H/liHZQ50tRAqefLvob2RNB0XY832cKtl
   jRjDNLuPUOiAuJoJRsBRAOv1D1mb1xMoqxMktUey7rtlXZ4V/0TqLlb4n
   Q==;
X-CSE-ConnectionGUID: WWCJNnDRSTq23M657Bp24A==
X-CSE-MsgGUID: 392/fYkpSU23K6M2bD80JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56511836"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56511836"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:57:17 -0800
X-CSE-ConnectionGUID: sLvbEWz/QxuHlQCFm6MNKA==
X-CSE-MsgGUID: TneYxypsSeOUurauzLKrjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110057908"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2025 05:57:14 -0800
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
Subject: [PATCH v3 06/11] ASoC: Intel: avs: Move DSP-boot steps into individual functions
Date: Mon,  3 Feb 2025 15:10:46 +0100
Message-Id: <20250203141051.2361323-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250203141051.2361323-1-cezary.rojewski@intel.com>
References: <20250203141051.2361323-1-cezary.rojewski@intel.com>
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

