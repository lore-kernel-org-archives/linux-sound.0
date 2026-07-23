Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B893DB651
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 07:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790353; cv=none; b=nzr3zXSBzeQuUQaHp1OJv6rPBEZcDhpU/0/kt2DMSUM+yUTHHIn3cXmV3F5JMG5IiOKO2BX3HXkWpcVu2OjYhYEGq+UP71X23lQnliokAkLDZMNKfYt1d06kGfgM7ebKfhEIOZEvGXCjjB9gD86pSAiOBBvBQERnk6clH1qjRz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790353; c=relaxed/simple;
	bh=FVzpUYCA5sdkrwvMqGin+KL23h4WA03HbI62OtjS6JA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CitpoJndsJ1VS8vFn8byqJLwitswErusmNZYe3oqVUJ/WFMGmCl49wy3e2dT9we053Zgu4z0PCVrB0IRuOX03x/tGb35HaMXMH3OfPMY2LD6o4CLDJ0s+sLpB906B3lEr2HVN80gjEHOy1vrVwdlvKa/q2CO8D6BjacadzbfWok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CytBXxAo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CytBXxAo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784790350; x=1816326350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FVzpUYCA5sdkrwvMqGin+KL23h4WA03HbI62OtjS6JA=;
  b=CytBXxAob/GEJT5V7d893e/2L3WD82eP3hKTyaQtvjJBdlFtSlK4nReH
   Z/Gk2FvrPI1vM6cPJYz8C/mtW3edyVLY6L/MzVyxJCVcRH28s5STtVy4P
   LL7iWY7p+QzUZfoxESqfzI9rxCTZhLTkl/ExFiRJL+3smdq47s/rG4K8M
   KOECB+yNrCCxj5D26E3ODPthAcIXD3gNwM9m68MT/3UJAy4P4i6SAHTIp
   L5AMGN+Ncu34DTpKo+fTfRySbCI0GydvXEfIWXZtaTQxchHMP6Yihi6nG
   PBwOBl7aJuHK9BFqjb6k6ij9sOC9rDXk6l4msZbHLGkQ6KzYR4g3XnIdY
   w==;
X-CSE-ConnectionGUID: 51jRUwn7S5WLzRUX9W4g2g==
X-CSE-MsgGUID: yNxfFJHGSYaaxwVR1kesdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96095053"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="96095053"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:05:47 -0700
X-CSE-ConnectionGUID: X/jG7zV4RoeM3Dm4xnW09w==
X-CSE-MsgGUID: p7APT52CTcGp+YUZ3Zoe6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="256522057"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:05:47 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 4/6] ASoC: soc-acpi-intel-lnl-match: use function topology by default
Date: Thu, 23 Jul 2026 15:05:19 +0800
Message-ID: <20260723070521.870256-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723070521.870256-1-yung-chuan.liao@linux.intel.com>
References: <20260723070521.870256-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With commit c84179a1d36b ("ASoC: Intel: sof_sdw: append dai type to dai
link name unconditionally"), function topology can apply to all
SoundWire codec configurations. Set .get_function_tplg_files callback to
use function topology by default. If any required function topology can
not be found in the file system, it will fallback to use the monolithic
topology.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index 937a74a5d523..3b9758f73238 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -717,24 +717,28 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.links = lnl_3_in_1_sdca,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-rt711-l0-rt1316-l23-rt714-l1.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0) | BIT(2) | BIT(3),
 		.links = lnl_cs42l43_l0_cs35l56_l23,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-cs42l43-l0-cs35l56-l23.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(1) | BIT(2) | BIT(3),
 		.links = lnl_cs42l43_l2_cs35l56x6_l13,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-cs42l43-l2-cs35l56x6-l13.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0) | BIT(3),
 		.links = lnl_cs42l43_l0_cs35l56_l3,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-cs42l43-l0-cs35l56-l3.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
@@ -748,12 +752,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.links = lnl_rvp,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-rt711.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(2) | BIT(3),
 		.links = lnl_712_only,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-rt712-l2-rt1712-l3.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
@@ -766,19 +772,22 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.link_mask = GENMASK(2, 0),
 		.links = lnl_sdw_rt1318_l12_rt714_l0,
 		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-lnl-rt1318-l12-rt714-l0.tplg"
+		.sof_tplg_filename = "sof-lnl-rt1318-l12-rt714-l0.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = GENMASK(2, 0),
 		.links = lnl_sdw_rt1320_l12_rt714_l0,
 		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-lnl-rt1320-l12-rt714-l0.tplg"
+		.sof_tplg_filename = "sof-lnl-rt1320-l12-rt714-l0.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0) | BIT(1),
 		.links = lnl_sdw_rt713_l0_rt1318_l1,
 		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-lnl-rt713-l0-rt1318-l1.tplg"
+		.sof_tplg_filename = "sof-lnl-rt713-l0-rt1318-l1.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(1) | BIT(2),
-- 
2.43.0

