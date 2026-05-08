Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0102F3D1718
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 10:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237002; cv=none; b=Rbe/x3On5MQ3I5CCubLD+nHnni7ghZomH46hRMBZ1Ym91H5rqIYuFkjTT55dlkl33THgD1uYTVxXkcyg5m1DB91azjbMfFRKvrM6DdpJhirLd8LgTzP84wglIVaUCC/RDfdb9fH4jtE2Pj4ubm+z5upxWZekIqL1L4sg4Ah6Gec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237002; c=relaxed/simple;
	bh=eT1lKelFsa0/FEujJWkYLHnsJHUqRd7WT6ATldcwPmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dPkWMepcs+igdqelj2vM8XgAF8HAixEPf2NsBMPdkhfJXIIJwy47skCe992/nGy4+CVE1F3dcp8SK7PzB6B1QelHm6aWZDgbcj7Dp8crnsSUUTRf8HvxJQcRc4faFLIn1WLchbM1UwPJ9joEqslo0u4vjpdv6XOpc9nwE3wvstI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYLrF7Rz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYLrF7Rz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778237001; x=1809773001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eT1lKelFsa0/FEujJWkYLHnsJHUqRd7WT6ATldcwPmI=;
  b=JYLrF7RzVwrLJLa3WTW3vrtzsVJjsdhrGdZo6v1vajR/1hqo1ZgBsyA8
   b+nAT4U8oU7FDr2dwRYX3IuzXKVya6bXGk4ORUBUQEuuiWcOPFmndVw+B
   yMPZHDZsVbImPSaVS82KraOQQBkQuoje+uk08p/A4hTHRHZRJbMA1EWaS
   +Y6Upe1v0OmdWB3Y33R0bQXXtgW528D0sXMNHctpAmbADKoyNH2oJVG0R
   HzgHowWYIuT5/X1/hRyhKGjRKqiPj7PbReDlgXKoQzPh8hQma/aL8lk3x
   DciRq1ySJC3Bo+THp1bZFPBd6b4f3tofMDp3eLdr3A4Y6egAwggOhJsj8
   Q==;
X-CSE-ConnectionGUID: 0lUNMHxsQ0W1LOLBAULNyQ==
X-CSE-MsgGUID: 9D9V39OASUWejVccmJv8vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89512085"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="89512085"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 03:43:06 -0700
X-CSE-ConnectionGUID: 4KHDBPoyTB2GPMGHPgn8EQ==
X-CSE-MsgGUID: LI3SSUXYRe2Vs3FShhtJVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="236979078"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 03:43:04 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	mac.chiang@intel.com
Subject: [PATCH 1/2] ASoC: Intel: soc-acpi-intel-arl-match: Reorder ACPI machine tables
Date: Fri,  8 May 2026 18:42:37 +0800
Message-ID: <20260508104239.1247525-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508104239.1247525-1-yung-chuan.liao@linux.intel.com>
References: <20260508104239.1247525-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mac Chiang <mac.chiang@intel.com>

When the SOF device driver enumerates the machine tables,
it selects the entry with the most numbers of matched links in
ascending order.

Align the ordering with commit 08095e20995ad6e3648af7416c90163627fe7e44
("ASoC: Intel: soc-acpi-intel-ptl-match: Sort ACPI link/machine tables").

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-arl-match.c   | 40 +++++++++----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index c952f7d2b2c0..cd4023ccadeb 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -483,24 +483,10 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
-		.link_mask = BIT(0),
-		.links = arl_cs42l43_l0,
+		.link_mask = BIT(0) | BIT(2),
+		.links = arl_rt722_l0_rt1320_l2,
 		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-arl-cs42l43-l0.tplg",
-		.get_function_tplg_files = sof_sdw_get_tplg_files,
-	},
-	{
-		.link_mask = BIT(2) | BIT(3),
-		.links = arl_cs42l43_l2_cs35l56_l3,
-		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-arl-cs42l43-l2-cs35l56-l3.tplg",
-		.get_function_tplg_files = sof_sdw_get_tplg_files,
-	},
-	{
-		.link_mask = BIT(2),
-		.links = arl_cs42l43_l2,
-		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-arl-cs42l43-l2.tplg",
+		.sof_tplg_filename = "sof-arl-rt722-l0_rt1320-l2.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
@@ -509,6 +495,20 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-arl-rt711-l0-rt1316-l3.tplg",
 	},
+	{
+		.link_mask = BIT(2) | BIT(3),
+		.links = arl_cs42l43_l2_cs35l56_l3,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-cs42l43-l2-cs35l56-l3.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
+	{
+		.link_mask = BIT(0),
+		.links = arl_cs42l43_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-cs42l43-l0.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{
 		.link_mask = 0x1, /* link0 required */
 		.links = arl_rvp,
@@ -522,10 +522,10 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-arl-rt711-l0.tplg",
 	},
 	{
-		.link_mask = BIT(0) | BIT(2),
-		.links = arl_rt722_l0_rt1320_l2,
+		.link_mask = BIT(2),
+		.links = arl_cs42l43_l2,
 		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-arl-rt722-l0_rt1320-l2.tplg",
+		.sof_tplg_filename = "sof-arl-cs42l43-l2.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{},
-- 
2.43.0

