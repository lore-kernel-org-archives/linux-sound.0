Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6F61B0424
	for <linux-sound@vger.kernel.org>; Thu,  2 Jan 2025 12:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735821227; cv=none; b=JV87LUdwJtG+qRgvZCX1lEbjM657UWtkhEmxaehEJbH+n2rTY60YErz8CI+6qOGikhzhZDc7m3YlPD+mu3t9t9VcaFRttVAcOyTBxu2oKvlumIJ259ncIeSBcwtjW3EK7An+qktZPJJifLJhJti1HApfiTtu/P59d2jIZ2JPQB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735821227; c=relaxed/simple;
	bh=PUlyHsp9hk7+1qLwh/j1IlTV46G7+Cf+uHOWnr8u7co=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qsf2Ie4w/IePKV/0szRt+tHdoFhjlzjYypSRKbob/H1o3cBdAPXzJwPWUC+sPsCzt0QEYzutrK9gXcsPFvlE+JU/2fUtPScLkt8p1V5JYy05dOVSNiD/VRvpLUjVMaew2J+k/hnfcaOSHE6dN9yZ/13uaRZGiT8zFUoj24z0KKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EB5Jo3Lf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EB5Jo3Lf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735821226; x=1767357226;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PUlyHsp9hk7+1qLwh/j1IlTV46G7+Cf+uHOWnr8u7co=;
  b=EB5Jo3LfttJAT5zWavd6hATGj/3abOIuGUvGzE2Z5IPVStcr97wF4Aas
   zTvGZTfQeqIfffL61kqXpvOZRdDzgUkDAU11Tt16ZUbPN5TDVJJ9kYGmD
   gkHYONmD8ZX4IJ1//ssznKDJPo4b9wCfKOtv6bNzadDCRQDqTW1JkyqH4
   cT1nU5BvQlROoIjwAUMD+0hmVQYzLbBRVuEqDCXt6sRaIc8t9yojhp1OD
   cd92lZWfNN69hfrmafRf4p0OTDn6OQEdUViNxIw8KHsuq1Zs+/qfSemm/
   1SECGx0/H0Yg2PWycDkaEug49JOZ6ETcnj2aivUY07L3MYM/zKsf1kbzk
   A==;
X-CSE-ConnectionGUID: BMsy1R8JQzuW+MB2GKdyNA==
X-CSE-MsgGUID: ICkVeemITsmL6JHfdANrtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36073887"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="36073887"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 04:33:46 -0800
X-CSE-ConnectionGUID: nvKJY4m7QD2LMlejZCZASw==
X-CSE-MsgGUID: 39vV+6tnTLWrUX78rO5Xsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="101681381"
Received: from iweiny-desk3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.231])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 04:33:45 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 2/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83JX, 83MC and 83NM
Date: Thu,  2 Jan 2025 20:33:35 +0800
Message-ID: <20250102123335.256698-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102123335.256698-1-yung-chuan.liao@linux.intel.com>
References: <20250102123335.256698-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Simon Trimmer <simont@opensource.cirrus.com>

Update the DMI match for a Lenovo laptop to a new DMI identifier.

This laptop ships with a different DMI identifier to what was expected
and now has three match entries. It also has the DMICs connected to the
host rather than the cs42l43 codec.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Fixes: 83c062ae81e8 ("ASoC: Intel: sof_sdw: Add quirks for some new Lenovo laptops")
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d054be360d28..b0d35fda7b17 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -612,9 +612,9 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "3838")
+			DMI_MATCH(DMI_PRODUCT_NAME, "83JX")
 		},
-		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS),
+		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS | SOC_SDW_CODEC_MIC),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -624,6 +624,21 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS | SOC_SDW_CODEC_MIC),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83MC")
+		},
+		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS | SOC_SDW_CODEC_MIC),
+	},	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83NM")
+		},
+		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS | SOC_SDW_CODEC_MIC),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.43.0

