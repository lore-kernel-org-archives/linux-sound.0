Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153263DB960
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 07:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790355; cv=none; b=XirdXyNEOGeqYLd8+czJjUr+qFinXZRPJZJbwwgcKmHMWo1HxXQ9ek6KuhJaB0hrgAyTpsT60ms8OTA9ph6ugSn3NOeemR2PF8AI1YulinDIrL7o0A4eBA+nct6YRo5hZHlf0E+4aGTDfTWyVs4UM3KK2obh6lFgXFWBlq+ZcYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790355; c=relaxed/simple;
	bh=l1XuSGQMg+enjnM+AvHIL0o/5xCx4VcRwhOGRO1XHLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BuipNT/F2eAD4wZHF54m2M426B5nODhXa/+yjcfDAZe9RG6YWIq/eq0map27mU5CUlo2WSqHk1XbrfYB43i8wkiKeJqw9aXnK5olL2drJPvtAE4Y3qGKvx0EyyrpUh8N5oCfNCsumTQtiU0Iw7RfrEfCLL8lCNNZ6sep2Nd2hYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sxg/hbg1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sxg/hbg1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784790352; x=1816326352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l1XuSGQMg+enjnM+AvHIL0o/5xCx4VcRwhOGRO1XHLc=;
  b=Sxg/hbg1q1gHlYO7rPnpVRR5D9jSxpaXMtQGTgf0Lt7NRTA/WN5fkHJe
   xhXktXoDecPY9RqjHKviLjZG8SVi5+4aUYqazbWRalmNaSwnUyMyFPOWE
   OUG1SwAxCM2tE4ympKX5DXgipl0OKdQ4vxHF0ya5+L7sj1Z0MqGGjgeMR
   h0cX0giTRgN3/O18a9X02urhTu7Kbfk99KucKGz0Bbb0lFK0L0/aGESOU
   gW+/XFzPHISEZf2gySo2fbITlLqYOAT5BYWYlCfMhoH3RNyA1zt3sLVk6
   s0thB+uxvQIGEXq8G3ecDVAl3iaERCRS6mmo1m4znw/lhh99eefx+NHDI
   A==;
X-CSE-ConnectionGUID: zP3LdcklSEKfQL88CsFayw==
X-CSE-MsgGUID: ohjZjOaIRRWFhOJBhVjSnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96095060"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="96095060"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:05:50 -0700
X-CSE-ConnectionGUID: E0cgl50ZSkafJc/MwHcFhw==
X-CSE-MsgGUID: 48Xrmr34Qn+p2wJrcmi4SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="256522081"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:05:49 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 6/6] ASoC: soc-acpi-intel-mtl-match: use function topology by default
Date: Thu, 23 Jul 2026 15:05:21 +0800
Message-ID: <20260723070521.870256-7-yung-chuan.liao@linux.intel.com>
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
 .../intel/common/soc-acpi-intel-mtl-match.c    | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 2e4222456f27..596582053d93 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -1321,60 +1321,70 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.links = tac5572_l0,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-tac5572.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
 		.links = tac5672_l0,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-tac5672.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
 		.links = tac5682_l0,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-tac5682.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
 		.links = tas2783_link0,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-tas2783.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
 		.links = tas2883_l0,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-tas2883.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = GENMASK(3, 0),
 		.links = mtl_rt713_l0_rt1316_l12_rt1713_l3,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt713-l0-rt1316-l12-rt1713-l3.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = GENMASK(3, 0),
 		.links = mtl_rt713_l0_rt1318_l12_rt1713_l3,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt713-l0-rt1318-l12-rt1713-l3.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0) | BIT(1) | BIT(3),
 		.links = mtl_rt713_l0_rt1318_l1_rt1713_l3,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt713-l0-rt1318-l1-rt1713-l3.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = GENMASK(2, 0),
 		.links = mtl_rt713_l0_rt1316_l12,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt713-l0-rt1316-l12.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(3) | BIT(0),
 		.links = mtl_712_l0_1712_l3,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt712-l0-rt1712-l3.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
@@ -1395,7 +1405,8 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.link_mask = GENMASK(2, 0),
 		.links = mtl_sdw_rt1318_l12_rt714_l0,
 		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-mtl-rt1318-l12-rt714-l0.tplg"
+		.sof_tplg_filename = "sof-mtl-rt1318-l12-rt714-l0.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0) | BIT(2) | BIT(3),
@@ -1455,12 +1466,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.links = mtl_3_in_1_sdca,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt711-l0-rt1316-l23-rt714-l1.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = 0x9, /* 2 active links required */
 		.links = mtl_rt711_l0_rt1316_l3,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt711-l0-rt1316-l3.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
@@ -1474,18 +1487,21 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.links = mtl_rvp,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt711.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0) | BIT(2),
 		.links = rt5682_link2_max98373_link0,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-sdw-rt5682-l2-max98373-l0.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0) | BIT(2),
 		.links = cs42l42_link0_max98363_link2,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-sdw-cs42l42-l0-max98363-l2.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{},
 };
-- 
2.43.0

