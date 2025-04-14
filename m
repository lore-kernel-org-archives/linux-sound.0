Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31B619FA92
	for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 06:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612411; cv=none; b=da5sZwNo0PujGyAEZtAHakqFvAcftN5lbDVvPm5+kMmANFK8njm+hPp0uYA85nRrDz7WpC9BN+01GxXD4ArNAICbTH+MlI961qnsV58/IMrNvENF/tPSzvXzXXCgAZiksLqf619vKS+N9fFdBAIkhnh3QIWiyStOmorkbyHmkmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612411; c=relaxed/simple;
	bh=u6N/SpTVLhp3URmn/ZVL8fulX+PHhuD5LUKKCz/iDrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bsXlURYcMj3PATYmj5vIzlu4iSQ/3qC/0Te5iF4SyHT+gHNPfvFuoq7VKl/1OcmtEvBijsHez4Yxfej0E4e9vUxOpkiVYVtMp6gfe6QB0RM8IoVd+7xwsysguZSlydMCwy6D/zg4Pgt+tamXk1qw/PGeB7+23gMqqbwNLAO8LnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLsY9A2g; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLsY9A2g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744612410; x=1776148410;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u6N/SpTVLhp3URmn/ZVL8fulX+PHhuD5LUKKCz/iDrk=;
  b=XLsY9A2g/Jq3nKm4aIN5CrF5vmpFkiCi7u4vrjwl3GheYPUjgTTK43sR
   2GsON/t/dHXuJhrg+DVhe3DCWCsEnQwUjf/9LpodNVi0Ere6TF0pPVVvo
   F5uqZl+UxCeUK+IG6MRPDEwxcl5WHPaoyqIwhNpf2/31M61gcg8MsMp8/
   t6Xt2IkQfTT3d+GHaqHeFNEK3evofm/7QZHWEG0lT8faP82v/RkMCrbAj
   ePcGpaqcJ/zmsp25bDa/RfAq2ZlNYT5Tketa+JWpdSW/UDVULcJGd3cTT
   Sa0T2OxJ3s7cOZoRgUCgu7ec7jzU4g5T+B7hcN7gAA358T7vWmOwztxrb
   A==;
X-CSE-ConnectionGUID: Zz5F69YLRZ6yvAh3UlCufQ==
X-CSE-MsgGUID: R2XeSjgGQTuX+qJ5CmX1gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49872635"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="49872635"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:30 -0700
X-CSE-ConnectionGUID: +ggUzl8XRmml9ReKkynnRA==
X-CSE-MsgGUID: /n6HSjMNQEKt3+12F4OHxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130275296"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:29 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 06/11] ASoC: Intel: soc-acpi-intel-lnl-match: set get_function_tplg_files ops
Date: Mon, 14 Apr 2025 14:32:34 +0800
Message-ID: <20250414063239.85200-7-yung-chuan.liao@linux.intel.com>
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
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index e04f6de746eb..a2bee667facb 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -8,6 +8,7 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
+#include "sof-function-topology-lib.h"
 #include "soc-acpi-intel-sdca-quirks.h"
 #include "soc-acpi-intel-sdw-mockup-match.h"
 
@@ -712,6 +713,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.links = lnl_cs42l43_l0,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-cs42l43-l0.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
@@ -730,6 +732,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.links = lnl_rt722_only,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-rt722-l0.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = GENMASK(2, 0),
@@ -748,14 +751,16 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.links = lnl_sdw_rt712_vb_l2_rt1320_l1,
 		.drv_name = "sof_sdw",
 		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
-		.sof_tplg_filename = "sof-lnl-rt712-l2-rt1320-l1.tplg"
+		.sof_tplg_filename = "sof-lnl-rt712-l2-rt1320-l1.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(1) | BIT(2) | BIT(3),
 		.links = lnl_sdw_rt713_vb_l2_rt1320_l13,
 		.drv_name = "sof_sdw",
 		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
-		.sof_tplg_filename = "sof-lnl-rt713-l2-rt1320-l13.tplg"
+		.sof_tplg_filename = "sof-lnl-rt713-l2-rt1320-l13.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{},
 };
-- 
2.43.0

