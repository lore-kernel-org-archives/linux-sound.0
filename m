Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552D119FA92
	for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 06:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612413; cv=none; b=ifBZyZFGvGI/mjRXEmCOa7w1iorZlPNWTZ22m498mLIfVFdeIStatlKCI+/xN2ArgJxpanZY1Th42aYHGVP44ZEbR7NEfetvLGazgZMdPgM+NIIC2h2BkT+Q7TD4EF6KDuRWPuZUfBuXmiuZLVrzcVUTNVbBKwxLWEhhSQk7FVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612413; c=relaxed/simple;
	bh=YC1lLXjtQoYoTT2C+5WBVbRujJ4LcLZ15w/Kv/O6nKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q8uZ4y8neEFOKu2wF1o2YjOXcdakkyQvt1cEBoN5oGAt3Ry0YOs87U3yErlBW5BB0RvN+VAe3vh1ixiiL/VnlKfnXsOI1vpxNX9B3o5CtG5RRmEqJL8wt683RljnYcLdislW71q/k2y9Rz7X1jCWX5aY3++Uz4HGV77lDe/LdWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CxYBnOfo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CxYBnOfo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744612412; x=1776148412;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YC1lLXjtQoYoTT2C+5WBVbRujJ4LcLZ15w/Kv/O6nKw=;
  b=CxYBnOfoUdDmGmTva2xEYhgS99LvEpeU7ERTWsn5l8FmIivRbinZaWWR
   k4spklgOX5dcNnvKyN3uXT8Y2AI8UGDEjn23ok/Qrch67CdMS4sIKPlaq
   2dwn2/IvacU36XLcjlxqqn8rGzPe1h4OnNzBQVbCz3dFPCzq3hUiveg5a
   rzkIx6rpT3xZC3sF6msE/gSFcII8sHlyU6Tmw1DhbPeyk+2foQwe9H6QN
   eucQsQAyVnNSYDW101luMDli25DDWK1E6HhY6oDzs2UYp9ytzhHFJDO0K
   B9RobjfZxGgMrpGtAsYPTSrt+B0nTkBb0Uz/WlWJ+wUU3idEoxiA8YHgs
   w==;
X-CSE-ConnectionGUID: yfCGW8jKR62oHqH36/zl9g==
X-CSE-MsgGUID: yCRGLDnTS/GZOoS/b7UkqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49872641"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="49872641"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:32 -0700
X-CSE-ConnectionGUID: oLZv2L53SAuLdhondxA3XA==
X-CSE-MsgGUID: 1lWaURzBR4ShodPGnaHMXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130275302"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:31 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 07/11] ASoC: Intel: soc-acpi-intel-arl-match: set get_function_tplg_files ops
Date: Mon, 14 Apr 2025 14:32:35 +0800
Message-ID: <20250414063239.85200-8-yung-chuan.liao@linux.intel.com>
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
 sound/soc/intel/common/soc-acpi-intel-arl-match.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index 32147dc9d2d6..73e581e93755 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -8,6 +8,7 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 #include <sound/soc-acpi-intel-ssp-common.h>
+#include "sof-function-topology-lib.h"
 
 static const struct snd_soc_acpi_endpoint single_endpoint = {
 	.num = 0,
@@ -436,42 +437,49 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.links = arl_cs42l43_l0_cs35l56_l23,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-arl-cs42l43-l0-cs35l56-l23.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0) | BIT(2) | BIT(3),
 		.links = arl_cs42l43_l0_cs35l56_2_l23,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-arl-cs42l43-l0-cs35l56-l23.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0) | BIT(2) | BIT(3),
 		.links = arl_cs42l43_l0_cs35l56_3_l23,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-arl-cs42l43-l0-cs35l56-l23.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0) | BIT(2),
 		.links = arl_cs42l43_l0_cs35l56_l2,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-arl-cs42l43-l0-cs35l56-l2.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(0),
 		.links = arl_cs42l43_l0,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-arl-cs42l43-l0.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(2),
 		.links = arl_cs42l43_l2,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-arl-cs42l43-l2.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(2) | BIT(3),
 		.links = arl_cs42l43_l2_cs35l56_l3,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-arl-cs42l43-l2-cs35l56-l3.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = 0x1, /* link0 required */
@@ -490,6 +498,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.links = arl_rt722_l0_rt1320_l2,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-arl-rt722-l0_rt1320-l2.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{},
 };
-- 
2.43.0

