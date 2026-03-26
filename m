Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5BB38E5CE
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 07:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511596; cv=none; b=U5bBfnvIu4LnRxTFQBtEXBeWrjsLP56SMGcZdKUCoArxAZfbqYCJw02JyhHL+cp0vo9qsSqdYPMcPrUd4vaXIdBDRxljqeJw3aCotw9VCW3ytKzml6tQNsIH/PguzJw6DWHOBb29e+1bUToTBHz+h1rwE5bXO+iqIqh/2mQfGjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511596; c=relaxed/simple;
	bh=tnok6IPQqxtJfZ89YUJcn/zCFb2aF+E71MRebCnOvi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qBNqcIBKAyNDaTJDLP+oav6yPNH2YvpACV/8g/3CTXCoygwhjCoW5qz82MJIu98xexdjFkFwQuYGKFjULsmRh2INcPCtfabAIByVGUQGIN01nspjCpg+3xVInCtQVtRGDCf70LkyhLglDOL8nRHWHY6d6bq8QbHjYHikeDdqco0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2PEdtQ8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2PEdtQ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774511595; x=1806047595;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tnok6IPQqxtJfZ89YUJcn/zCFb2aF+E71MRebCnOvi8=;
  b=T2PEdtQ816W/c+E3aSlAUX9cZkZ0f3Pfz6070yPJag4Sc12VzPget1cf
   2Qz3uV1M7vuBSPfSBospwTvGKApVImBIkKjzLdYEyIP/07+fP6de0OL0n
   VjuZtSN0FCviE+TTW/1m3+PCEIUQsViv7BA737PkabW6lMoXwZiOo3nn9
   LPGQ/WxYPgdO/cTy9Q6S0KD8lgA8NKnNf43KzB/NLb92hl1q/4P915qkf
   uemww//YjMsCA97oOyVBz+3mMoG+LQki7z5EDYh2FFz4B5qGar7+yqhF/
   stTt3Bv63BuwSEswnLnvX9YqeamM8VbUdwAi9fmwWVXi5pWZfJt+53XjM
   A==;
X-CSE-ConnectionGUID: CaS9VvOgTcGPYJD2XhIZ4A==
X-CSE-MsgGUID: IMKb7UYOSrC1MppAjgptQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="78157938"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="78157938"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 00:53:14 -0700
X-CSE-ConnectionGUID: VfDRKS8VTxWt6Dt8SvFiSg==
X-CSE-MsgGUID: v3UjCxXHTFSPEU6JThZN+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="220084916"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 00:53:12 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	flove@realtek.com,
	derek.fang@realtek.com
Subject: [PATCH 1/3] ASoC: Intel: soc-acpi-intel-ptl-match: drop rt722 monolithic match tables
Date: Thu, 26 Mar 2026 15:53:00 +0800
Message-ID: <20260326075303.1083567-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326075303.1083567-1-yung-chuan.liao@linux.intel.com>
References: <20260326075303.1083567-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mac Chiang <mac.chiang@intel.com>

Use functional topologies to support RT722 topologies with/without
amplifiers,
e.g. sof-ptl-rt722.tplg, sof-ptl-rt722-rt1320.tplg...

If these entries are not removed, they will find the first same link of
sof-ptl-rt722.tplg.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Co-developed-by: Derek Fang <derek.fang@realtek.com>
Signed-off-by: Derek Fang <derek.fang@realtek.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 100 ------------------
 1 file changed, 100 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index ddd919847c1f..3b7818355ff6 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -134,31 +134,6 @@ static const struct snd_soc_acpi_endpoint spk_6_endpoint = {
 	.group_id = 1,
 };
 
-/*
- * Multi-function codecs with three endpoints created for
- * headset, amp and dmic functions.
- */
-static const struct snd_soc_acpi_endpoint rt_mf_endpoints[] = {
-	{
-		.num = 0,
-		.aggregated = 0,
-		.group_position = 0,
-		.group_id = 0,
-	},
-	{
-		.num = 1,
-		.aggregated = 0,
-		.group_position = 0,
-		.group_id = 0,
-	},
-	{
-		.num = 2,
-		.aggregated = 0,
-		.group_position = 0,
-		.group_id = 0,
-	},
-};
-
 static const struct snd_soc_acpi_endpoint jack_dmic_endpoints[] = {
 	/* Jack Endpoint */
 	{
@@ -365,33 +340,6 @@ static const struct snd_soc_acpi_adr_device rt722_0_agg_adr[] = {
 	}
 };
 
-static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
-	{
-		.adr = 0x000030025d072201ull,
-		.num_endpoints = ARRAY_SIZE(rt_mf_endpoints),
-		.endpoints = rt_mf_endpoints,
-		.name_prefix = "rt722"
-	}
-};
-
-static const struct snd_soc_acpi_adr_device rt722_1_single_adr[] = {
-	{
-		.adr = 0x000130025d072201ull,
-		.num_endpoints = ARRAY_SIZE(rt_mf_endpoints),
-		.endpoints = rt_mf_endpoints,
-		.name_prefix = "rt722"
-	}
-};
-
-static const struct snd_soc_acpi_adr_device rt722_3_single_adr[] = {
-	{
-		.adr = 0x000330025d072201ull,
-		.num_endpoints = ARRAY_SIZE(rt_mf_endpoints),
-		.endpoints = rt_mf_endpoints,
-		.name_prefix = "rt722"
-	}
-};
-
 static const struct snd_soc_acpi_adr_device rt1320_1_group1_adr[] = {
 	{
 		.adr = 0x000130025D132001ull,
@@ -479,33 +427,6 @@ static const struct snd_soc_acpi_link_adr ptl_cs42l43_l2_cs35l56x6_l13[] = {
 	{}
 };
 
-static const struct snd_soc_acpi_link_adr ptl_rt722_only[] = {
-	{
-		.mask = BIT(0),
-		.num_adr = ARRAY_SIZE(rt722_0_single_adr),
-		.adr_d = rt722_0_single_adr,
-	},
-	{}
-};
-
-static const struct snd_soc_acpi_link_adr ptl_rt722_l1[] = {
-	{
-		.mask = BIT(1),
-		.num_adr = ARRAY_SIZE(rt722_1_single_adr),
-		.adr_d = rt722_1_single_adr,
-	},
-	{}
-};
-
-static const struct snd_soc_acpi_link_adr ptl_rt722_l3[] = {
-	{
-		.mask = BIT(3),
-		.num_adr = ARRAY_SIZE(rt722_3_single_adr),
-		.adr_d = rt722_3_single_adr,
-	},
-	{}
-};
-
 static const struct snd_soc_acpi_link_adr ptl_rt722_l0_rt1320_l23[] = {
 	{
 		.mask = BIT(0),
@@ -698,20 +619,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt711.tplg",
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
 		.links = ptl_sdw_rt712_vb_l3_rt1320_l3,
@@ -720,13 +627,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l3.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
-	{
-		.link_mask = BIT(3),
-		.links = ptl_rt722_l3,
-		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-ptl-rt722.tplg",
-		.get_function_tplg_files = sof_sdw_get_tplg_files,
-	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_sdw_machines);
-- 
2.43.0

