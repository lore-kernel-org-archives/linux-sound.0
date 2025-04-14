Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED71B19FA92
	for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 06:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612418; cv=none; b=fQsiWwaFKdqh199SNsPRwAwP13Efps6hxShdwN3KZeGCPTdBoz4tdsbxudkUHdXWqAcXalhJmdMtJCXrkv/SbNxs20DEXrxph1fEekU/OP0laZltGpAv+r33t9d1RxQaor9HaXEWgIzl40Dst+L6CLsedAWzYobYbP5Ld25yXMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612418; c=relaxed/simple;
	bh=hs0HkxwMrAfmMTP31qNqXzw4y/fHQWCpsmXvB59v4JM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mxum+5hoVKHkROIQzeLbKaWjY1KerJ7F/DHUu1l9FsUuKUmGmK5Quwg62ko8tVJV/cPEXlIkQ1euKv8OGR8HJyPY2xdUHSHKhZ7W8XXDKpNCo0pftmVk7Usyf5TqUBS9krTUDFHwea9wAGzBNWvNW/A7FGRpyVcXnhGbPwq6gaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1xF3/q7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1xF3/q7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744612417; x=1776148417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hs0HkxwMrAfmMTP31qNqXzw4y/fHQWCpsmXvB59v4JM=;
  b=M1xF3/q71Nqva8JbUGeIzGWy1eniMq9p3QdFplcQFJ6VGMkrXXDib/N2
   S5JTBxEytUMB3CE2LvibqJVcE2iGBQDn9ToA9KDDF7TbOcfmM/hvdFDlF
   zyDXzbcTasxo2pEEJQRhgX0c4V5khvFiVmjwdjQlntjl4ffhpcuYgcjwF
   in34b4cl78lL4ZbjuU5WsEZ9ssyoBf1AzhEOkWi7dWQGWFjyOftjjFMiv
   xiRbbkv5bNameGVEZo8M9c4Ah27BCOnKym9DVLzlezbOz6TeUrrXM+8+C
   DhVvTOFR87Tg7NfN5HFmyt4rSA1/MqCRe94hQ5nl0ujpL4L4Oz+UjT/MX
   g==;
X-CSE-ConnectionGUID: iw+cM3YJQGuWXjO2S/5Tng==
X-CSE-MsgGUID: Z3RLcw7dS3Ca0pq0itYiug==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49872659"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="49872659"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:37 -0700
X-CSE-ConnectionGUID: TfyH4jhFRbmDp2WogyhBqQ==
X-CSE-MsgGUID: yrjnkRlGT/2sWTl18cAUag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130275317"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:36 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 09/11] ASoC: Intel: soc-acpi-intel-mtl-match: add get_function_tplg_files ops
Date: Mon, 14 Apr 2025 14:32:37 +0800
Message-ID: <20250414063239.85200-10-yung-chuan.liao@linux.intel.com>
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
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 9e611e3667ad..af131d26bd33 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -11,6 +11,7 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 #include <sound/soc-acpi-intel-ssp-common.h>
+#include "sof-function-topology-lib.h"
 #include "soc-acpi-intel-sdca-quirks.h"
 #include "soc-acpi-intel-sdw-mockup-match.h"
 
@@ -1083,12 +1084,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
 		.sof_tplg_filename = "sof-mtl-rt712-vb-l0.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
 		.links = mtl_712_l0,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt712-l0.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = GENMASK(2, 0),
@@ -1101,30 +1104,35 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.links = cs42l43_link0_cs35l56_link2_link3,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-cs42l43-l0-cs35l56-l23.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0) | BIT(1) | BIT(3),
 		.links = cs42l43_link3_cs35l56_x4_link0_link1_spkagg,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-cs42l43-l3-cs35l56-l01-spkagg.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = GENMASK(2, 0),
 		.links = mtl_cs42l43_cs35l56,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-cs42l43-l0-cs35l56-l12.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0) | BIT(1),
 		.links = mtl_cs35l56_x8_link0_link1_fb,
 		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-mtl-cs35l56-l01-fb8.tplg"
+		.sof_tplg_filename = "sof-mtl-cs35l56-l01-fb8.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
 		.links = mtl_cs42l43_l0,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-cs42l43-l0.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = GENMASK(3, 0),
@@ -1143,6 +1151,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.links = mtl_rt722_only,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt722-l0.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
-- 
2.43.0

