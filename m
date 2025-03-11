Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1A82F56
	for <linux-sound@vger.kernel.org>; Tue, 11 Mar 2025 00:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741653079; cv=none; b=eJvNzgBu65EYv4lfZ5lz7jBUeFrsIYDi5O+qd0wATE+fIAlLx42xZisXJ7ZIeBReyxOoBm1yTNEsHt/DATcjHCZwfntqEyYku6UgZPV4SFvTkuUZRBMZ+Tk2M25WqpqBRsVeAIJJyxgv3nO9saiz42yJuzQq13BhM/A3hiDhMAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741653079; c=relaxed/simple;
	bh=aI1d5xeu8Iv56KVdZB8/AN83pgK0dUjo2dydNyD7uoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i9oCOz5u/GRf0m1gMlAKQnc9r/jbQY2cUUll18bnnTiOLbZ6iFt9L7DpnnrrpbhDFe32pCf7+wUNIHcEE0ZZrr3sgtyHJS5EGf6crChC0uhgEDGF33UXrnzXRi63pGKhfMEPU0vXPy475CaM9WXykOfzRBrietIbOsYowE4OHag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USh0Vrfp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USh0Vrfp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741653078; x=1773189078;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aI1d5xeu8Iv56KVdZB8/AN83pgK0dUjo2dydNyD7uoQ=;
  b=USh0VrfpbmYKtYiK85Ufam/lajpvaagkK0+buVuoFHhoPS/25VHGO9jA
   qc2gmcQBaAvSLR7niyVYqnHwyGpYmq6yJVA7ykZsqyWRz8uqPgEbWZn+U
   NU3rRC2dtzMoXWLA28CnvrujA62BWKc40hu6isxd7xLMkvrTRrFR7UitQ
   wD78DbBm72/mdExXrSPX5LqumRVQjFIb4UQdoyhT4vSQajhYi47FB1Qs1
   695w1Mm02Ew6Di/OPb2chnSJtGXFPZMPMcdl0zPaOCxKxVklFdM372ja/
   ojwi/95tm9z9IWoYAOjyk0P+tQluxIegRzdo/IXKiqNY9R1YAP8kjDeBv
   g==;
X-CSE-ConnectionGUID: nxwDi3fLSOyVMsCrMiscog==
X-CSE-MsgGUID: Bkbrfnu6TjSQOMtMlNf49Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="60077924"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="60077924"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 17:31:16 -0700
X-CSE-ConnectionGUID: FWpACg1uQtaRtGCS28T3Sg==
X-CSE-MsgGUID: viIS8uIbQqyctRnmUMGWUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="120174063"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.105])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 17:31:13 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v2] ASoC: Intel: soc-acpi-intel-ptl-match: Add cs42l43 support
Date: Tue, 11 Mar 2025 08:31:01 +0800
Message-ID: <20250311003101.80967-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Naveen Manohar <naveen.m@intel.com>

Patch adds driver data & match table for cs42l43
multi-function codec on PTL-RVP at sdw link3.

Signed-off-by: Naveen Manohar <naveen.m@intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
v2:
- Removed .get_function_tplg_files ops which is not upstream yet.
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index a07526eb802b..6603d8de501c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -185,6 +185,33 @@ static const struct snd_soc_acpi_endpoint cs42l43_amp_spkagg_endpoints[] = {
 	},
 };
 
+static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
+	{ /* Jack Playback Endpoint */
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* DMIC Capture Endpoint */
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Jack Capture Endpoint */
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Speaker Playback Endpoint */
+		.num = 3,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
 static const struct snd_soc_acpi_adr_device cs42l43_2_adr[] = {
 	{
 		.adr = 0x00023001fa424301ull,
@@ -236,6 +263,15 @@ static const struct snd_soc_acpi_adr_device cs35l56_3_3amp_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device cs42l43_3_adr[] = {
+	{
+		.adr = 0x00033001FA424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	{
 		.adr = 0x000030025D071101ull,
@@ -390,6 +426,14 @@ static const struct snd_soc_acpi_link_adr ptl_cs42l43_l2_cs35l56x6_l13[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr ptl_cs42l43_l3[] = {
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(cs42l43_3_adr),
+		.adr_d = cs42l43_3_adr,
+	}
+};
+
 static const struct snd_soc_acpi_link_adr ptl_rt722_only[] = {
 	{
 		.mask = BIT(0),
@@ -531,6 +575,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt711.tplg",
 	},
+	{
+		.link_mask = BIT(3),
+		.links = ptl_cs42l43_l3,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-cs42l43-l3.tplg",
+	},
 	{
 		.link_mask = BIT(3),
 		.links = ptl_rt721_l3,
-- 
2.43.0

