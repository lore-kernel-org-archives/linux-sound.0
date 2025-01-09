Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47382216E01
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 12:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424509; cv=none; b=V4QvVERUTa8kpTmJCxEoa6llfjp5OG9BtQFeCVloutuP6wuojxql5VLNbK8AgXw/Xl9AZ/k6sVPovW+81yjddnBNcQAUJQA5xqTLYZ6lLG/0ZW61gmUE7DUpXLzPNtk5yZzXMdqF8jBNsozrArs9islZIEL80Lslgwq3soaSzvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424509; c=relaxed/simple;
	bh=+uZClC7iRu1a4PdHneo+LFnMmfb9D7wAhmIJ/lq/Fb8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W4vGshUsJsrMK1D546kN0TupyhGhwfxo3+LbpYcq3wfFIAGgGBOKlB0RtT4mE7N8flZ3O9oX2RswTma264UB5fGqWC0pcznFbKgC1WfH6k7rZbqnXzt91iG1tz3CsHwdua6sgTwqLfCBbTJTUoy5eQ1dP7uzNLDMEeBdLo+zt/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCmrsoDJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCmrsoDJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736424508; x=1767960508;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+uZClC7iRu1a4PdHneo+LFnMmfb9D7wAhmIJ/lq/Fb8=;
  b=jCmrsoDJIk5K/86AJ6rR4j11bjRr3WsSamEyuskd2RLIIvC7VZAQVz5k
   rcG7S/SFmO5XdjQwtU8v6WULrNVts8eyDpI9MkOev+hHeO8IQKS2w14Dv
   ZsYuwNjYXy7db2NNfdge2V6ASkRAW9h2QvC+RQbQ5Uqqj9/+cmMFymUQ5
   bRSyt6cMMKnlcC8BCygdDTndlSyijNB+PlyFH18og+fBW1qmih4d0DO3j
   FK6nOABr8z2Wb1siT+mvi5GBHGKqTea7ht1H3lOchF368/gebN6C4aLz+
   lnfFTd+OaseT+rgoZikv7K/OJ/1s4/V7FNNs/Gc93+FCqXMSUTg24iNPo
   w==;
X-CSE-ConnectionGUID: I+7eX0bYRxqXX3owRrxGeQ==
X-CSE-MsgGUID: LDtAYqptR3KTriwh1vkFLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47179597"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="47179597"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:08:27 -0800
X-CSE-ConnectionGUID: rlyFlxe5TOmFGpzzeqJ3Rg==
X-CSE-MsgGUID: b4Gf5ITVQhObr9nePJwLKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140710372"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2025 04:08:24 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 09/13] ASoC: Intel: avs: Improve logging of firmware loading
Date: Thu,  9 Jan 2025 13:22:12 +0100
Message-Id: <20250109122216.3667847-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250109122216.3667847-1-cezary.rojewski@intel.com>
References: <20250109122216.3667847-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Crucial debug information regarding the ROM/firmware status and last
known error code is missing in the code loading functions.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/loader.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 4203b216ae13..b3ea35d267e9 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -167,7 +167,8 @@ int avs_cldma_load_basefw(struct avs_dev *adev, struct firmware *fw)
 				       (reg & AVS_ROM_INIT_DONE) == AVS_ROM_INIT_DONE,
 				       AVS_ROM_INIT_POLLING_US, SKL_ROM_INIT_TIMEOUT_US);
 	if (ret < 0) {
-		dev_err(adev->dev, "rom init timeout: %d\n", ret);
+		dev_err(adev->dev, "rom init failed: %d, status: 0x%08x, lec: 0x%08x\n",
+			ret, reg, snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR_CODE(adev)));
 		avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
 		return ret;
 	}
@@ -180,7 +181,8 @@ int avs_cldma_load_basefw(struct avs_dev *adev, struct firmware *fw)
 				       AVS_FW_INIT_POLLING_US, AVS_FW_INIT_TIMEOUT_US);
 	hda_cldma_stop(cl);
 	if (ret < 0) {
-		dev_err(adev->dev, "transfer fw failed: %d\n", ret);
+		dev_err(adev->dev, "transfer fw failed: %d, status: 0x%08x, lec: 0x%08x\n",
+			ret, reg, snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR_CODE(adev)));
 		avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
 		return ret;
 	}
@@ -313,7 +315,8 @@ avs_hda_init_rom(struct avs_dev *adev, unsigned int dma_id, bool purge)
 				       (reg & 0xF) == APL_ROM_FW_ENTERED,
 				       AVS_ROM_INIT_POLLING_US, APL_ROM_INIT_TIMEOUT_US);
 	if (ret < 0) {
-		dev_err(adev->dev, "rom init timeout: %d\n", ret);
+		dev_err(adev->dev, "rom init failed: %d, status: 0x%08x, lec: 0x%08x\n",
+			ret, reg, snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR_CODE(adev)));
 		goto err;
 	}
 
@@ -337,15 +340,15 @@ static int avs_imr_load_basefw(struct avs_dev *adev)
 
 	/* DMA id ignored when flashing from IMR as no transfer occurs. */
 	ret = avs_hda_init_rom(adev, 0, false);
-	if (ret < 0) {
-		dev_err(adev->dev, "rom init failed: %d\n", ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	ret = wait_for_completion_timeout(&adev->fw_ready,
 					  msecs_to_jiffies(AVS_FW_INIT_TIMEOUT_MS));
 	if (!ret) {
-		dev_err(adev->dev, "firmware ready timeout\n");
+		dev_err(adev->dev, "firmware ready timeout, status: 0x%08x, lec: 0x%08x\n",
+			snd_hdac_adsp_readl(adev, AVS_FW_REG_STATUS(adev)),
+			snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR_CODE(adev)));
 		avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
 		return -ETIMEDOUT;
 	}
@@ -392,7 +395,7 @@ int avs_hda_load_basefw(struct avs_dev *adev, struct firmware *fw)
 		ret = avs_hda_init_rom(adev, dma_id, true);
 		if (!ret)
 			break;
-		dev_info(adev->dev, "#%d rom init fail: %d\n", i + 1, ret);
+		dev_info(adev->dev, "#%d rom init failed: %d\n", i + 1, ret);
 	}
 	if (ret < 0)
 		goto cleanup_resources;
@@ -404,7 +407,8 @@ int avs_hda_load_basefw(struct avs_dev *adev, struct firmware *fw)
 				       AVS_FW_INIT_POLLING_US, AVS_FW_INIT_TIMEOUT_US);
 	snd_hdac_dsp_trigger(hstream, false);
 	if (ret < 0) {
-		dev_err(adev->dev, "transfer fw failed: %d\n", ret);
+		dev_err(adev->dev, "transfer fw failed: %d, status: 0x%08x, lec: 0x%08x\n",
+			ret, reg, snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR_CODE(adev)));
 		avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
 	}
 
@@ -584,7 +588,9 @@ static int avs_dsp_load_basefw(struct avs_dev *adev)
 	ret = wait_for_completion_timeout(&adev->fw_ready,
 					  msecs_to_jiffies(AVS_FW_INIT_TIMEOUT_MS));
 	if (!ret) {
-		dev_err(adev->dev, "firmware ready timeout\n");
+		dev_err(adev->dev, "firmware ready timeout, status: 0x%08x, lec: 0x%08x\n",
+			snd_hdac_adsp_readl(adev, AVS_FW_REG_STATUS(adev)),
+			snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR_CODE(adev)));
 		avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
 		ret = -ETIMEDOUT;
 		goto release_fw;
-- 
2.25.1

