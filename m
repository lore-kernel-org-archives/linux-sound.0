Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84AD19D07A
	for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 06:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612416; cv=none; b=erjA/LgmSDahLKL0ShGtDK5YRHhhRT3SoxzN04px8exmwdBjPxVFWiu+Rp3vnezNAOOX6P88fWHBW/GJkRuS/GVKxO6eYkHikmY0YUVATKwKJuuoDMehMfSIxEC3+I+IXTdaEf/+rhbDPSv9Ei1EBFSey2/OVDNLa/2HuHPMDko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612416; c=relaxed/simple;
	bh=h1PhqnWpiBBlfAfNTdhq4rCb1CSU99PMrDmvB0KD9Yc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sL/CjAGY4thmU89fMM41Pxv6fZMO/4++gs+1njDT/8/JgBwokdoWZYT1hL7LqcdLcCutF/WOXaxBzmhZD1MYdSEe23ZYdSrFuNYIqBqZgwAxrzh42v/yJX9F/NZb4CePjMk8wzqX33kfZ9sVpg7uH9II+s4cydMt8MBQ6ddeWPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OvTAqs3y; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OvTAqs3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744612415; x=1776148415;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h1PhqnWpiBBlfAfNTdhq4rCb1CSU99PMrDmvB0KD9Yc=;
  b=OvTAqs3y2OQ+dwhuYESU/oLmyKZVBVhfe75NSBaHR4KrdkQCdXImVjJb
   Lb04X66RBdhC9ikfgaB4hGOKnzMuBaU48R4NdO7mQ3twRxnyqDXCzJ1Kf
   vbuk8qSgX+3nUQisRiDhmy1zg50Om/dgXI/3cNL+XmMrjq7orVFJVXwVs
   eSiKGmxknohpMrSVW+Z+tCWRQbOJCezgc0SwgdNghtWRamxiKAt2XI5Oo
   Vv0pJ2Hy/coYSBGBRNLqvIEuYzXOoS9MfOfdJvYEyM93QiNoGIrJwO1mE
   oCilOdjIXdcTJBdeFC3MdoYSyV6TAUpruy9Rg+HT5+WSpwUqQCuCNXC5S
   g==;
X-CSE-ConnectionGUID: xor24tmdQ2eSBRkFt9UHGg==
X-CSE-MsgGUID: JagHm5D+QDKekiE+cD/X4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49872647"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="49872647"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:34 -0700
X-CSE-ConnectionGUID: EhD4i3QzRqSxedEW5gYy4g==
X-CSE-MsgGUID: B+4eWpXETo2tG4CKbL1N7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130275310"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:34 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 08/11] ASoC: Intel: soc-acpi-intel-ptl-match: add get_function_tplg_files ops
Date: Mon, 14 Apr 2025 14:32:36 +0800
Message-ID: <20250414063239.85200-9-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414063239.85200-1-yung-chuan.liao@linux.intel.com>
References: <20250414063239.85200-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The audio configs with multi-function SDCA codecs can use the
sof_sdw_get_tplg_files ops to get function topologies dynamically.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 .../soc/intel/common/soc-acpi-intel-ptl-match.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 6603d8de501c..992729582562 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -8,6 +8,7 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
+#include "sof-function-topology-lib.h"
 #include "soc-acpi-intel-sdca-quirks.h"
 #include "soc-acpi-intel-sdw-mockup-match.h"
 #include <sound/soc-acpi-intel-ssp-common.h>
@@ -586,52 +587,60 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.links = ptl_rt721_l3,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt721.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
 		.links = ptl_rt722_only,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt722.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(1),
 		.links = ptl_rt722_l1,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt722.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(3),
 		.links = ptl_rt722_l3,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt722.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(1) | BIT(2),
 		.links = ptl_sdw_rt712_vb_l2_rt1320_l1,
 		.drv_name = "sof_sdw",
 		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
-		.sof_tplg_filename = "sof-ptl-rt712-l2-rt1320-l1.tplg"
+		.sof_tplg_filename = "sof-ptl-rt712-l2-rt1320-l1.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(2) | BIT(3),
 		.links = ptl_sdw_rt712_vb_l3_rt1320_l2,
 		.drv_name = "sof_sdw",
 		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
-		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l2.tplg"
+		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l2.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(1) | BIT(2) | BIT(3),
 		.links = ptl_sdw_rt713_vb_l2_rt1320_l13,
 		.drv_name = "sof_sdw",
 		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
-		.sof_tplg_filename = "sof-ptl-rt713-l2-rt1320-l13.tplg"
+		.sof_tplg_filename = "sof-ptl-rt713-l2-rt1320-l13.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(1) | BIT(2) | BIT(3),
 		.links = ptl_sdw_rt713_vb_l3_rt1320_l12,
 		.drv_name = "sof_sdw",
 		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
-		.sof_tplg_filename = "sof-ptl-rt713-l3-rt1320-l12.tplg"
+		.sof_tplg_filename = "sof-ptl-rt713-l3-rt1320-l12.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{},
 };
-- 
2.43.0

