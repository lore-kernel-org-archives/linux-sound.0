Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2482F15D0
	for <linux-sound@vger.kernel.org>; Tue,  6 May 2025 01:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746496185; cv=none; b=qNOz+khC204MVPWyoE1MnZx2uv+xEwN628QinRzTlJ4Kqb/kMXUe1uo6FNGF3yMa6vOi0JjfEsmVnzCoBCiZtnZNCXwVD+GEKlH+q3GMNMY8lhu0NghSxP0XODn/OwMci0Ol/ihhY6jQVQj6mHaBTlWmTAK6k94IGudZpve7Tm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746496185; c=relaxed/simple;
	bh=Le4y/XJElnvDIu8jsaBcndYNQbL5IPHOAVkYHhqRufs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hgfvcQZe9bo8sr3SpB1oHtX561QaAS5DHO1OdRIAgaEEHAz3DQcMLz3gXBnaRqphCOgW25nhK8lwMol/vwkjKwOGtkXdlE7CObRjjD520ROSE3HAbgRWoP0XhQNwvuPYI+z72AQSVtCINv9Mha/NoMi6qKatgs4e53nqUJ4aq8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtHjXCuB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtHjXCuB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746496183; x=1778032183;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Le4y/XJElnvDIu8jsaBcndYNQbL5IPHOAVkYHhqRufs=;
  b=CtHjXCuBrS67ZF3946bntkL5J5EnUr123KmliQ3UdOcc9jONmqSMS5aQ
   mRuZXq5pX2LJ9P5g3Quvez8thpktiSGeaX0JOMzTpRhK3mJKYrx8jq26L
   IH44T1Em3fJaVPRaxLRf0adqdfuioa3EetZGXgv92yY605cpwnxJO8gEd
   lI4L0Sf33gzD3IKv8UtEJSKyxkU4kWJF7Lt7oYyKmzkzW733AeLC/FUbT
   6hgfUh9geFw23zFgGfj6E3AMra9iJF8omJ3HeIBz6DR74FauARJkr7WwQ
   tUAqVoBVjxNkQxprNSaj4KH0kPwtZygESe6vVAfBpXr3LXdVj7utSGUs/
   g==;
X-CSE-ConnectionGUID: Y+oEt2M1SYmWElbUHcpW/g==
X-CSE-MsgGUID: 1IKsWLX1SdGCTpUvOuA8UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="47243962"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="47243962"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 18:49:42 -0700
X-CSE-ConnectionGUID: h4qb5o23TjOwNbFPnfl3/Q==
X-CSE-MsgGUID: qLCtG+0eRlWotdZEemoMHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="166507949"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.29])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 18:49:40 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: Sort ACPI link/machine tables
Date: Tue,  6 May 2025 09:49:30 +0800
Message-ID: <20250506014930.5408-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Naveen Manohar <naveen.m@intel.com>

Check subset of link mask when matching the machine driver,
rule is superset match should be ordered before subset matches.

Priority: mockup > most links > most bit link-mask > alphabetical

Reorder acpi_link_adr & sdw_machine tables per defined criteria:
1.Mock Test 1st
2.Most links 1st
3.link_mask with more bit first
4.link_number number order
5.Alphabetical order

Signed-off-by: Naveen Manohar <naveen.m@intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 110 +++++++++---------
 1 file changed, 57 insertions(+), 53 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index a62cb6d47e4c..0454de04da68 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -4,6 +4,9 @@
  *
  * Copyright (c) 2024, Intel Corporation.
  *
+ * Order of entries in snd_soc_acpi_intel_ptl_sdw_machines[] matters.
+ * Check subset of link mask when matching the machine driver, rule is
+ * superset match should be ordered before subset matches.
  */
 
 #include <sound/soc-acpi.h>
@@ -540,7 +543,7 @@ static const struct snd_soc_acpi_link_adr ptl_sdw_rt712_vb_l3_rt1320_l2[] = {
 
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
-	/* mockup tests need to be first */
+/* Order Priority: mockup > most links > most bit link-mask > alphabetical */
 	{
 		.link_mask = GENMASK(3, 0),
 		.links = sdw_mockup_headset_2amps_mic,
@@ -559,29 +562,76 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt715-rt711-rt1308-mono.tplg",
 	},
-	{
-		.link_mask = BIT(1) | BIT(2) | BIT(3),
-		.links = ptl_cs42l43_l2_cs35l56x6_l13,
-		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-ptl-cs42l43-l2-cs35l56x6-l13.tplg",
-	},
 	{
 		.link_mask = BIT(0),
 		.links = sdw_mockup_multi_func,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt722.tplg", /* Reuse the existing tplg file */
 	},
+	{
+		.link_mask = BIT(1) | BIT(2) | BIT(3),
+		.links = ptl_sdw_rt713_vb_l2_rt1320_l13,
+		.drv_name = "sof_sdw",
+		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
+		.sof_tplg_filename = "sof-ptl-rt713-l2-rt1320-l13.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
+	{
+		.link_mask = BIT(1) | BIT(2) | BIT(3),
+		.links = ptl_sdw_rt713_vb_l3_rt1320_l12,
+		.drv_name = "sof_sdw",
+		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
+		.sof_tplg_filename = "sof-ptl-rt713-l3-rt1320-l12.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
+	{
+		.link_mask = BIT(1) | BIT(2) | BIT(3),
+		.links = ptl_cs42l43_l2_cs35l56x6_l13,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-cs42l43-l2-cs35l56x6-l13.tplg",
+	},
+	{
+		.link_mask = BIT(1) | BIT(2),
+		.links = ptl_sdw_rt712_vb_l2_rt1320_l1,
+		.drv_name = "sof_sdw",
+		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
+		.sof_tplg_filename = "sof-ptl-rt712-l2-rt1320-l1.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
+	{
+		.link_mask = BIT(2) | BIT(3),
+		.links = ptl_sdw_rt712_vb_l3_rt1320_l2,
+		.drv_name = "sof_sdw",
+		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
+		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l2.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{
 		.link_mask = BIT(0),
 		.links = ptl_rvp,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt711.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = ptl_rt722_only,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-rt722.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
+	{
+		.link_mask = BIT(1),
+		.links = ptl_rt722_l1,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-rt722.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{
 		.link_mask = BIT(3),
 		.links = ptl_cs42l43_l3,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-cs42l43-l3.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(3),
@@ -590,20 +640,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-ptl-rt721.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
-	{
-		.link_mask = BIT(0),
-		.links = ptl_rt722_only,
-		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-ptl-rt722.tplg",
-		.get_function_tplg_files = sof_sdw_get_tplg_files,
-	},
-	{
-		.link_mask = BIT(1),
-		.links = ptl_rt722_l1,
-		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-ptl-rt722.tplg",
-		.get_function_tplg_files = sof_sdw_get_tplg_files,
-	},
 	{
 		.link_mask = BIT(3),
 		.links = ptl_rt722_l3,
@@ -611,38 +647,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-ptl-rt722.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
-	{
-		.link_mask = BIT(1) | BIT(2),
-		.links = ptl_sdw_rt712_vb_l2_rt1320_l1,
-		.drv_name = "sof_sdw",
-		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
-		.sof_tplg_filename = "sof-ptl-rt712-l2-rt1320-l1.tplg",
-		.get_function_tplg_files = sof_sdw_get_tplg_files,
-	},
-	{
-		.link_mask = BIT(2) | BIT(3),
-		.links = ptl_sdw_rt712_vb_l3_rt1320_l2,
-		.drv_name = "sof_sdw",
-		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
-		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l2.tplg",
-		.get_function_tplg_files = sof_sdw_get_tplg_files,
-	},
-	{
-		.link_mask = BIT(1) | BIT(2) | BIT(3),
-		.links = ptl_sdw_rt713_vb_l2_rt1320_l13,
-		.drv_name = "sof_sdw",
-		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
-		.sof_tplg_filename = "sof-ptl-rt713-l2-rt1320-l13.tplg",
-		.get_function_tplg_files = sof_sdw_get_tplg_files,
-	},
-	{
-		.link_mask = BIT(1) | BIT(2) | BIT(3),
-		.links = ptl_sdw_rt713_vb_l3_rt1320_l12,
-		.drv_name = "sof_sdw",
-		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
-		.sof_tplg_filename = "sof-ptl-rt713-l3-rt1320-l12.tplg",
-		.get_function_tplg_files = sof_sdw_get_tplg_files,
-	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_sdw_machines);
-- 
2.43.0

