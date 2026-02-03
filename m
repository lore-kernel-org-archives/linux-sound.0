Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FA5158535
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 10:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770112841; cv=none; b=pm8D0yqUysppT4S4jzNBByyzK7dwuZPVmRynkppwMNk6Aqx6Wtlo2Tl6hze0nEVHLKZonymQgjhwvvzwgnWMB/WShMPpwffOZ5F3aDUlOy451W9cEOfmFQJ8IMbocflKop86mtL3ynvex3LiWA9bjNAIbtmU8pmfdirNYoA+1cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770112841; c=relaxed/simple;
	bh=cyX2KzRA0ylLViS7wWMneLRs19Vcdmyntk4N+H9zSZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AGNwjmrsQCKIDhYkG29r2z7VEFeNHMpHoFzUxk2+8p+H7Le4NYcAXlE7wNAhbDuH/HBqfDQZfqiDwXvOULDlHJr6n7e8Rq81Qc8bWoANL8hJhEvAc8bqEdiSxrfybZrpCRdQQFjynG6a2PQLp23AI+YJMIkH3dxpUuYqzEIkxF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRoVvTmz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRoVvTmz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770112840; x=1801648840;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cyX2KzRA0ylLViS7wWMneLRs19Vcdmyntk4N+H9zSZc=;
  b=VRoVvTmzYJjK7iKX0StxSMOjMJR4OA9TDG/yPQ4JqZ/Eu243mKyoqmZ1
   zfOYBtjHXDNqb2e9wJV127NWY4ZdJOD7tIovoFL0kLFeNQbUW3OaILPFe
   jfnrFaBfjf1yydGdC7ZABwKkmRUyEN/31ERn2cJPBvqHO5PlEkaXg3atK
   AFp9j/IE7CuijDMI/PJIVZCc53D4y5xXziLOEOMazjK+g6zMNceU1Dhqz
   iBc0ZG6qMPziFaoJ87ceZKhVfOatFGbXbx8yJf9lb9cLs5/Wo1o9d0JR5
   0cvKrx6WG6XbidMcWafAPlRus3Yd2PWiYJoyNNKk+32bnSvQQBv3a1rtl
   w==;
X-CSE-ConnectionGUID: iVIfc/UYQp264bR0laLkfA==
X-CSE-MsgGUID: tSH1clfjSv6y8rSCt0fS5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58860337"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="58860337"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 02:00:39 -0800
X-CSE-ConnectionGUID: pm+yggmVTYak4CAe/018uA==
X-CSE-MsgGUID: rbgT6fb7Rm+hPrhQ65o6rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="247408509"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 02:00:36 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: drop rt721 related match tables
Date: Tue,  3 Feb 2026 18:00:27 +0800
Message-ID: <20260203100027.3741754-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mac Chiang <mac.chiang@intel.com>

Use functional topologies to support all RT721-related topology and
amplifier combinations,
e.g. sof-ptl-rt721.tplg, sof-ptl-rt721-l3-rt1320-l3.tplg.

If these entries are not removed, they will all use the sof-ptl-rt721.tplg.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 50 -------------------
 1 file changed, 50 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 1055fb4838f6..ddd919847c1f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -356,33 +356,6 @@ static const struct snd_soc_acpi_adr_device rt1320_3_group1_adr[] = {
 	}
 };
 
-static const struct snd_soc_acpi_adr_device rt721_0_single_adr[] = {
-	{
-		.adr = 0x000030025d072101ull,
-		.num_endpoints = ARRAY_SIZE(rt_mf_endpoints),
-		.endpoints = rt_mf_endpoints,
-		.name_prefix = "rt721"
-	}
-};
-
-static const struct snd_soc_acpi_adr_device rt721_3_single_adr[] = {
-	{
-		.adr = 0x000330025d072101ull,
-		.num_endpoints = ARRAY_SIZE(rt_mf_endpoints),
-		.endpoints = rt_mf_endpoints,
-		.name_prefix = "rt721"
-	}
-};
-
-static const struct snd_soc_acpi_link_adr ptl_rt721_l3[] = {
-	{
-		.mask = BIT(3),
-		.num_adr = ARRAY_SIZE(rt721_3_single_adr),
-		.adr_d = rt721_3_single_adr,
-	},
-	{},
-};
-
 static const struct snd_soc_acpi_adr_device rt722_0_agg_adr[] = {
 	{
 		.adr = 0x000030025d072201ull,
@@ -506,15 +479,6 @@ static const struct snd_soc_acpi_link_adr ptl_cs42l43_l2_cs35l56x6_l13[] = {
 	{}
 };
 
-static const struct snd_soc_acpi_link_adr ptl_rt721_l0[] = {
-	{
-		.mask = BIT(0),
-		.num_adr = ARRAY_SIZE(rt721_0_single_adr),
-		.adr_d = rt721_0_single_adr,
-	},
-	{}
-};
-
 static const struct snd_soc_acpi_link_adr ptl_rt722_only[] = {
 	{
 		.mask = BIT(0),
@@ -734,13 +698,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt711.tplg",
 	},
-	{
-		.link_mask = BIT(0),
-		.links = ptl_rt721_l0,
-		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-ptl-rt721.tplg",
-		.get_function_tplg_files = sof_sdw_get_tplg_files,
-	},
 	{
 		.link_mask = BIT(0),
 		.links = ptl_rt722_only,
@@ -763,13 +720,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l3.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
-	{
-		.link_mask = BIT(3),
-		.links = ptl_rt721_l3,
-		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-ptl-rt721.tplg",
-		.get_function_tplg_files = sof_sdw_get_tplg_files,
-	},
 	{
 		.link_mask = BIT(3),
 		.links = ptl_rt722_l3,
-- 
2.43.0

