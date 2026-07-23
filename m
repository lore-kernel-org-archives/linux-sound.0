Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7695B242D7B
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 06:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784787696; cv=none; b=ROB0WTdtPOK7rFZNeRzz8Y1m8AGQuqiA7jyQAhyDEWh3NuQD7c/DHWHf9eNGYO4GfWwalUE1RoMuMnwchyeM7LJe/tKKRsqoiJ0RobRlV9KV45m0o1FZJboaMWJlDISYN7i7q2OuVczU7O+5xQ4or7STOy3NWiowopYxgrWlFsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784787696; c=relaxed/simple;
	bh=V0vcSWgTPrvQullT0l1iWVIBULUYH5goUHc+v+FK8t4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AUcsVWtarnVZ3X9L8UeDoqe4MHR2/MMYh4Izcp+i2AEcomCwKpgrdIg5w+64rOtFDD85wLxPDnFiYk8UrXSZNAz1KQQps7FIjfLv5A6OIZpfv+6JqmEi+RVYnx1l/deYnKp/uXI4Losa1p454v5uSRH3lTWikMnI9OaB1/twApo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IRipuF/q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRipuF/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784787694; x=1816323694;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V0vcSWgTPrvQullT0l1iWVIBULUYH5goUHc+v+FK8t4=;
  b=IRipuF/qhGAGlupwTK+XX4zIncEAyWtnByDFWRjl6Ez8DXcObZeNSTu+
   QgLnvEGfe4Nc7VZ8Vn42IRn2i+C18uIcBW0MDHkO1XYi3bcDaXvMJwlAh
   qN9ms9Sll02eabYu1YGnDMOc73e3RVVm6MNPAAX8V8wSuyWKkuscP75zq
   oSPo6Q4/fWhBC3CMsm4Z5/RRKd7qbgtIhQlkYs5K+NofKKVaQm8AMTVrg
   zDdElcdkLFgE+RQrzA0fclI90JSAVdqnE46lqEqcXt3grdCKU2kUtSRTi
   6j4fdfYErJiIQBkT/VR20exb+oXIpehzQmkha7mYWnZWWkkFmRP+x6XVC
   Q==;
X-CSE-ConnectionGUID: m6GoHwo6TwiQ/jEEaNqpxg==
X-CSE-MsgGUID: G9sECI+WTTCZYZsy6ZSD2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85289270"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="85289270"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 23:21:34 -0700
X-CSE-ConnectionGUID: sMRLaMPVRCSv03ash2dVKg==
X-CSE-MsgGUID: r6mMRdc5SamoipzmS5xUaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="263290829"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 23:21:32 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: Intel: soc-acpi: Add entry for sof_rt5682 in NVL match table.
Date: Thu, 23 Jul 2026 14:21:21 +0800
Message-ID: <20260723062121.869857-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Balamurugan C <balamurugan.c@intel.com>

Adding rt5682 I2S codec support for NVL platforms and entry in match table.

Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-nvl-match.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-nvl-match.c b/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
index 217272260803..a7f4097d426c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
@@ -8,6 +8,7 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
+#include <sound/soc-acpi-intel-ssp-common.h>
 #include "soc-acpi-intel-sdw-mockup-match.h"
 
 static const struct snd_soc_acpi_codecs nvl_essx_83x6 = {
@@ -15,6 +16,11 @@ static const struct snd_soc_acpi_codecs nvl_essx_83x6 = {
 	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
 };
 
+static const struct snd_soc_acpi_codecs nvl_rt5682_rt5682s_hp = {
+	.num_codecs = 2,
+	.codecs = {RT5682_ACPI_HID, RT5682S_ACPI_HID},
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_nvl_machines[] = {
 	{
 		.comp_ids = &nvl_essx_83x6,
@@ -24,6 +30,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_nvl_machines[] = {
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
+	{
+		.comp_ids = &nvl_rt5682_rt5682s_hp,
+		.drv_name = "sof_rt5682",
+		.sof_tplg_filename = "sof-nvl-rt5682", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
+					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB,
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_nvl_machines);
-- 
2.43.0

