Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB36238D2D
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024017; cv=none; b=WqlbiqxIGZGutVnQ08k+OE0kDF2R2iWGjjKXJiV7TzYu2tCKU6DeKNuTi/BEtRXQDGyZJUosz1u/hv+Y7lMQSYa75dOAdOAge6gh4hYLy5Tc/Xck9VgcNlWA5StkdKdLCs0wT34WKmU75D14vLLD8wMhXfHRxiBGnXnrBNR3hvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024017; c=relaxed/simple;
	bh=i1Upb0JKsb+VJJAjjboOOBKZJjddwZYQcu69ZbR+CIU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qk4Ty5LN2HPYuMVq7AW/sk+J++8cM6LRERKcf+1Rn2P7pyB+k7dzzEXzxd9w+MU2SkftvpTD0BIdgi9p+zNuWtOgLwhrLwmn6raXB+L1stU0YppwOi0FHvYp3jy1yqzECAWPcj//jDcJkSXu74pZ81awusikjAF3nFErNjgoB38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHNIDEyb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHNIDEyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744024016; x=1775560016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i1Upb0JKsb+VJJAjjboOOBKZJjddwZYQcu69ZbR+CIU=;
  b=JHNIDEyb3W/2PnJAZ8Se4ZJoSTDQeKpP/soH+vvqRh5PeAPu1FVaSWsv
   C1i/2vYiwFdMS5oydykcFsY0QTowzDSzEixpV4liy2hijdXZj2WwV7fUo
   BCuz/KGdpd8VfSC0D6iAU2vp358tVdex/AVavHN8qy8xN0OKN6OyuHebK
   C3eUehiXt/PZcK96sBRjfsrYpZkfS0El+xgfEI8bKGpaap+CPiEM8YZME
   IWc596Cs80o3vJZkM4UivvXx2LeLYELlO9e82Hcm8i9CdEMV6rudUf1Mx
   6AqjwdgLjr42SZn1HPefLMj8dbx3beVwL7nuSjL79Iqhu8w03VYjh/6nA
   g==;
X-CSE-ConnectionGUID: tfY7EhobTq63xRDKiFwh1Q==
X-CSE-MsgGUID: YfgTUcyxT/mR+FUGgow4Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49057332"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49057332"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 04:06:56 -0700
X-CSE-ConnectionGUID: cNTPPyPIQlS3KirKqLKiCA==
X-CSE-MsgGUID: bYvo4NSoTFGNosbeE1ditg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127776263"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 07 Apr 2025 04:06:54 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	liam.r.girdwood@intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 02/10] ASoC: Intel: avs: Ignore Vendor-space manipulation for ACE
Date: Mon,  7 Apr 2025 13:23:44 +0200
Message-Id: <20250407112352.3720779-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407112352.3720779-1-cezary.rojewski@intel.com>
References: <20250407112352.3720779-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A number of Vendor Specific registers utilized on cAVS architecture
(SkyLake till RaptorLake) are not present on ACE hardware (MeteorLake
onward). Similarly, certain recommended procedures do not apply. Adjust
existing code to be ACE-friendly.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h  |  1 +
 sound/soc/intel/avs/core.c | 13 ++++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 585543f872fc..91872d1df97a 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -72,6 +72,7 @@ extern const struct avs_dsp_ops avs_tgl_dsp_ops;
 
 #define AVS_PLATATTR_CLDMA		BIT_ULL(0)
 #define AVS_PLATATTR_IMR		BIT_ULL(1)
+#define AVS_PLATATTR_ACE		BIT_ULL(2)
 
 #define avs_platattr_test(adev, attr) \
 	((adev)->spec->attributes & AVS_PLATATTR_##attr)
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 8fbf33e30dfc..72a14dca1a1e 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -54,14 +54,17 @@ void avs_hda_power_gating_enable(struct avs_dev *adev, bool enable)
 {
 	u32 value = enable ? 0 : pgctl_mask;
 
-	avs_hda_update_config_dword(&adev->base.core, AZX_PCIREG_PGCTL, pgctl_mask, value);
+	if (!avs_platattr_test(adev, ACE))
+		avs_hda_update_config_dword(&adev->base.core, AZX_PCIREG_PGCTL, pgctl_mask, value);
 }
 
 static void avs_hdac_clock_gating_enable(struct hdac_bus *bus, bool enable)
 {
+	struct avs_dev *adev = hdac_to_avs(bus);
 	u32 value = enable ? cgctl_mask : 0;
 
-	avs_hda_update_config_dword(bus, AZX_PCIREG_CGCTL, cgctl_mask, value);
+	if (!avs_platattr_test(adev, ACE))
+		avs_hda_update_config_dword(bus, AZX_PCIREG_CGCTL, cgctl_mask, value);
 }
 
 void avs_hda_clock_gating_enable(struct avs_dev *adev, bool enable)
@@ -71,6 +74,8 @@ void avs_hda_clock_gating_enable(struct avs_dev *adev, bool enable)
 
 void avs_hda_l1sen_enable(struct avs_dev *adev, bool enable)
 {
+	if (avs_platattr_test(adev, ACE))
+		return;
 	if (enable) {
 		if (atomic_inc_and_test(&adev->l1sen_counter))
 			snd_hdac_chip_updatel(&adev->base.core, VS_EM2, AZX_VS_EM2_L1SEN,
@@ -99,6 +104,7 @@ static int avs_hdac_bus_init_streams(struct hdac_bus *bus)
 
 static bool avs_hdac_bus_init_chip(struct hdac_bus *bus, bool full_reset)
 {
+	struct avs_dev *adev = hdac_to_avs(bus);
 	struct hdac_ext_link *hlink;
 	bool ret;
 
@@ -114,7 +120,8 @@ static bool avs_hdac_bus_init_chip(struct hdac_bus *bus, bool full_reset)
 	/* Set DUM bit to address incorrect position reporting for capture
 	 * streams. In order to do so, CTRL needs to be out of reset state
 	 */
-	snd_hdac_chip_updatel(bus, VS_EM2, AZX_VS_EM2_DUM, AZX_VS_EM2_DUM);
+	if (!avs_platattr_test(adev, ACE))
+		snd_hdac_chip_updatel(bus, VS_EM2, AZX_VS_EM2_DUM, AZX_VS_EM2_DUM);
 
 	return ret;
 }
-- 
2.25.1

