Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD9222257C
	for <linux-sound@vger.kernel.org>; Mon, 10 Mar 2025 08:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741594049; cv=none; b=c+uD+QzKN9SHVrtUxkiAjnThH3ncUHqpSK6KSVszvTCJCp+bscFvhdhrhiZraancxsrMG/ptU74nQ7+TU7cUmaNoOsFr0+9Mk8/FzLZtp1i/YKx4uoTlimiT5Ern/bV5/VJT/MMv458tdG7zTKwAC2TszLbHj5vtr0MVbOfjvP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741594049; c=relaxed/simple;
	bh=3thOJ5go4X6MyM3y0bdvVIZzBTWw/GpyLnsRx4UJjIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KKHTyhDHjF/zdU93GfJq+Z8LDlmU9LvrMemjFC5o33JVzPsLpE0EV4Be59OI2+/DlwlrT/dxLVH7GLE9dyULVGNrtA6OAEV3RhbubPeu37n2KF1xUzKdORgoxl6GpKXdwvOpi8vsJ4HIhA+RncW1PrmejJ150zs5++vlxhzEoFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNShKtgn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNShKtgn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741594048; x=1773130048;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3thOJ5go4X6MyM3y0bdvVIZzBTWw/GpyLnsRx4UJjIA=;
  b=lNShKtgn2rHobJAZit+Mk06zD9DZ37B0zTGZYBAwsSKS78iZuU/4Al8W
   mAA85EpRJLjqi3Tt3VoD4wL0Pt+74iHay0pht2BWh1AGPIobzT5wa42Vx
   eOxQXA8iqgA7W5h5N2AEMAfqdWTmIeNTQUnG/xy8/NluAmuoBXnHtegFi
   aIy2Gd+ElnFI6ET/ywjEFxwMcNSfYteeiGLrRmnCD+Qg4wP2u/dyC7miv
   atqt0C2DRJQk3GG3YJ8ofIBKZm7trZbmTaeVRiKVXtyYP8lA6d4cirfsg
   ZFp4O795NFCVkJk+9baoCEHFq/H7UOjTU8gt3CLbZoNom86MA0EzWf2Yp
   w==;
X-CSE-ConnectionGUID: ocX82OidSb2Hb1sWDNq0Ng==
X-CSE-MsgGUID: u2JDHsStQW2ByiSR/aa6ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42449540"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="42449540"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 01:07:27 -0700
X-CSE-ConnectionGUID: tM5aolj+RD6YriXNMBMjYQ==
X-CSE-MsgGUID: AgXoW5hdTfayFWFfmt5v6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="150692263"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.85])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 01:07:25 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: Add cs42l43 support
Date: Mon, 10 Mar 2025 16:07:12 +0800
Message-ID: <20250310080712.58911-1-yung-chuan.liao@linux.intel.com>
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
 .../intel/common/soc-acpi-intel-ptl-match.c   | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index a07526eb802b..eedce68a0424 100644
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
@@ -531,6 +575,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt711.tplg",
 	},
+	{
+		.link_mask = BIT(3),
+		.links = ptl_cs42l43_l3,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-cs42l43-l3.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{
 		.link_mask = BIT(3),
 		.links = ptl_rt721_l3,
-- 
2.43.0

