Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DD0216E39
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 12:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424512; cv=none; b=GWOv02lAWWAEkD6UyQWkKBj/e3JF6nLZiXG07Avc+4mu3lePe6svj4KOlwrflpJgN3Cfu8CdpNkvETtB5Tf93jwIPc27F4bP+hFti1RrFbpaeUpOpoOsvDIlaUethT4RPFOBjHEu0Mol4B6nl/IkI38i8lflu3/A3mCKKVB6fwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424512; c=relaxed/simple;
	bh=6Ytc4WyZvnHBDjP6/5hUynRH7SsDbU4VsW0veBiJEUA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FXD9ytvmLL5TmFknBBuogbvvg0RatM8mL0GYHVX44F00s5gRijZmZcbXo5uY5aEaHEw2m+VfxNz1wvUr7XsF47R2xtV5XceU6c43RpNS8jjvtqajQLwYZRN+4+4r1XFiX5mRYHoywEuf1jEQUcrRSJtTUuHVypOV6a6OE8AiKRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZEbIOkn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZEbIOkn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736424511; x=1767960511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Ytc4WyZvnHBDjP6/5hUynRH7SsDbU4VsW0veBiJEUA=;
  b=KZEbIOknY1zYCMMEIT76wlN4kZfcvW1C1IJ3Tn5uApjUkKz4FW64gO8Z
   YygYyPbQlo7LSGs6sRkwFh/qGqYvZWyQXxO7+o46ev1kpUfZiwxu0kujH
   7uhogEaPbJwN6MuyoMuSMJy/8namBWII+CZsRZMbuwH4vvrLl6kXN3P0E
   3D1OE2TA19qdpp1kJCfizE5EnWkeYSBuXWgdUG1yc6iy3gqB+VqT/F0Ii
   j0gsqhBNDT1x337afefYS4s9IiEfG8R2UKpXXN7UA/jRRRw/gU/DSlxGy
   D206vExRjBQtcgWfwDj/h1M8dDxUyVfu2bma0dY9KplgKni7ahl+zSRB/
   A==;
X-CSE-ConnectionGUID: EilMFpHkSBufdYqmdXp1Kw==
X-CSE-MsgGUID: IEA/VhopRBSbqi9AW26O6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47179611"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="47179611"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:08:31 -0800
X-CSE-ConnectionGUID: te2O5fMbSKeJBIIbG9N1Hg==
X-CSE-MsgGUID: 5R9ADxgfSUObIoqJd4qHmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140710387"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2025 04:08:28 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 11/13] ASoC: Intel: avs: Adjust DSP status register names
Date: Thu,  9 Jan 2025 13:22:14 +0100
Message-Id: <20250109122216.3667847-12-cezary.rojewski@intel.com>
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

Both status and error are "codes". Update the wording to make code
cohesive.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/loader.c    | 12 ++++++------
 sound/soc/intel/avs/registers.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index b3ea35d267e9..9ff7818395cd 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -168,7 +168,7 @@ int avs_cldma_load_basefw(struct avs_dev *adev, struct firmware *fw)
 				       AVS_ROM_INIT_POLLING_US, SKL_ROM_INIT_TIMEOUT_US);
 	if (ret < 0) {
 		dev_err(adev->dev, "rom init failed: %d, status: 0x%08x, lec: 0x%08x\n",
-			ret, reg, snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR_CODE(adev)));
+			ret, reg, snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR(adev)));
 		avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
 		return ret;
 	}
@@ -182,7 +182,7 @@ int avs_cldma_load_basefw(struct avs_dev *adev, struct firmware *fw)
 	hda_cldma_stop(cl);
 	if (ret < 0) {
 		dev_err(adev->dev, "transfer fw failed: %d, status: 0x%08x, lec: 0x%08x\n",
-			ret, reg, snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR_CODE(adev)));
+			ret, reg, snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR(adev)));
 		avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
 		return ret;
 	}
@@ -316,7 +316,7 @@ avs_hda_init_rom(struct avs_dev *adev, unsigned int dma_id, bool purge)
 				       AVS_ROM_INIT_POLLING_US, APL_ROM_INIT_TIMEOUT_US);
 	if (ret < 0) {
 		dev_err(adev->dev, "rom init failed: %d, status: 0x%08x, lec: 0x%08x\n",
-			ret, reg, snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR_CODE(adev)));
+			ret, reg, snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR(adev)));
 		goto err;
 	}
 
@@ -348,7 +348,7 @@ static int avs_imr_load_basefw(struct avs_dev *adev)
 	if (!ret) {
 		dev_err(adev->dev, "firmware ready timeout, status: 0x%08x, lec: 0x%08x\n",
 			snd_hdac_adsp_readl(adev, AVS_FW_REG_STATUS(adev)),
-			snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR_CODE(adev)));
+			snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR(adev)));
 		avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
 		return -ETIMEDOUT;
 	}
@@ -408,7 +408,7 @@ int avs_hda_load_basefw(struct avs_dev *adev, struct firmware *fw)
 	snd_hdac_dsp_trigger(hstream, false);
 	if (ret < 0) {
 		dev_err(adev->dev, "transfer fw failed: %d, status: 0x%08x, lec: 0x%08x\n",
-			ret, reg, snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR_CODE(adev)));
+			ret, reg, snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR(adev)));
 		avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
 	}
 
@@ -590,7 +590,7 @@ static int avs_dsp_load_basefw(struct avs_dev *adev)
 	if (!ret) {
 		dev_err(adev->dev, "firmware ready timeout, status: 0x%08x, lec: 0x%08x\n",
 			snd_hdac_adsp_readl(adev, AVS_FW_REG_STATUS(adev)),
-			snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR_CODE(adev)));
+			snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR(adev)));
 		avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
 		ret = -ETIMEDOUT;
 		goto release_fw;
diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
index f76e91cff2a9..64afd56b1897 100644
--- a/sound/soc/intel/avs/registers.h
+++ b/sound/soc/intel/avs/registers.h
@@ -74,7 +74,7 @@
 /* Constants used when accessing SRAM, space shared with firmware */
 #define AVS_FW_REG_BASE(adev)		((adev)->spec->sram->base_offset)
 #define AVS_FW_REG_STATUS(adev)		(AVS_FW_REG_BASE(adev) + 0x0)
-#define AVS_FW_REG_ERROR_CODE(adev)	(AVS_FW_REG_BASE(adev) + 0x4)
+#define AVS_FW_REG_ERROR(adev)		(AVS_FW_REG_BASE(adev) + 0x4)
 
 #define AVS_WINDOW_CHUNK_SIZE		SZ_4K
 #define AVS_FW_REGS_SIZE		AVS_WINDOW_CHUNK_SIZE
-- 
2.25.1

