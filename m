Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447323D1CD5
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237002; cv=none; b=snINdEFFVtezYexJJ/51PBftliYBRGqCwegGrYkUQO6NnezW6qG0UR+6n/9RQlfs9HjwECe0HcswAa8KNg69kIzxrcQceXdCMaf5AmZdcd+H9fapRemhYEVuUXqTdRflc6zs3LxB7VNpuAx5I1clpoHkAU2lifJ4F9bMaLkzfmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237002; c=relaxed/simple;
	bh=3lHdpR2yATrVUPDYKJ2f4d9xU6FnKmLJCJZRdmhWLeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WCS3OBuVIWr01Lf75mcmxeA/eHaTJJh4aWKrwn+NyboJhX1pmnZzVIcp8Ze8eNBznAOGZjuxyDi2B+CbRDW3w430UsmRuRoQvnYd1/M3cVerImvkY06ICMpAxiIjkFVAWX+4Ty4KeIcWQJkCep70a8dh0JKkpwuO+U0wz/kQa20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DyvESxL4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DyvESxL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778237002; x=1809773002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3lHdpR2yATrVUPDYKJ2f4d9xU6FnKmLJCJZRdmhWLeE=;
  b=DyvESxL4/Yfg4oMgAkkcx+VRZfitzw7viUn9aO9R7wJPR93EsOEHBcH+
   nTsLcK3Hkqe8baq0GlcPkH+lUchFsCxTDC0bMnRCmhtjR2ubm4TzJLQkj
   DYFvxL2USWokKR1WHN5vBBpVkKELpZA+NsBfDQhYheAh+36gbptxzoBNn
   Xq8wQXDc++HYA52X5/kZYIyJt0d+c6FB6++htRVQCXWna3XteoJSlpOsr
   Z28o/btJwkJj/mor1zo/M1aWNY+bALUR3FnhLQutIA/kSVKOu0qWUv+Lv
   fbG9e2nY1U+atb5cSwxY2IBi+hk0apU57Q14pXwmMz62fVjLiSWl+4rui
   Q==;
X-CSE-ConnectionGUID: odwkUQ5vRly37Eq7SbfLvg==
X-CSE-MsgGUID: eZfEJ66TSqyzF4g9hE7liQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89512092"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="89512092"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 03:43:08 -0700
X-CSE-ConnectionGUID: 5nxs2oG6TbmvYzBuLOPbvQ==
X-CSE-MsgGUID: eLiHgAWUTGGEAluqHUT7pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="236979093"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 03:43:06 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	mac.chiang@intel.com
Subject: [PATCH 2/2] ASoC: soc-acpi-intel-arl-match: add rt712_l0_rt1320_l3 support
Date: Fri,  8 May 2026 18:42:38 +0800
Message-ID: <20260508104239.1247525-3-yung-chuan.liao@linux.intel.com>
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

From: Gary C Wang <gary.c.wang@intel.com>

Add support for using the rt712 multi-function codec on link 0 and the
rt1320 amplifier on link 3 on ARL platforms.

Signed-off-by: Gary C Wang <gary.c.wang@intel.com>
Co-developed-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-arl-match.c   | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index cd4023ccadeb..52c5b5719f51 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -8,6 +8,7 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 #include <sound/soc-acpi-intel-ssp-common.h>
+#include "soc-acpi-intel-sdca-quirks.h"
 #include "sof-function-topology-lib.h"
 
 static const struct snd_soc_acpi_endpoint single_endpoint = {
@@ -237,6 +238,15 @@ static const struct snd_soc_acpi_adr_device rt722_0_agg_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt712_0_agg_adr[] = {
+	{
+		.adr = 0x000030025D071201ull,
+		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints),
+		.endpoints = jack_amp_g1_dmic_endpoints,
+		.name_prefix = "rt712"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1316_3_single_adr[] = {
 	{
 		.adr = 0x000330025D131601ull,
@@ -255,6 +265,15 @@ static const struct snd_soc_acpi_adr_device rt1320_2_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1320_3_group1_adr[] = {
+	{
+		.adr = 0x000330025D132001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1320-1"
+	}
+};
+
 static const struct snd_soc_acpi_link_adr arl_cs42l43_l0[] = {
 	{
 		.mask = BIT(0),
@@ -404,6 +423,20 @@ static const struct snd_soc_acpi_link_adr arl_rt722_l0_rt1320_l2[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr arl_rt712_l0_rt1320_l3[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt712_0_agg_adr),
+		.adr_d = rt712_0_agg_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1320_3_group1_adr),
+		.adr_d = rt1320_3_group1_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_codecs arl_essx_83x6 = {
 	.num_codecs = 3,
 	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
@@ -495,6 +528,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-arl-rt711-l0-rt1316-l3.tplg",
 	},
+	{
+		.link_mask = BIT(0) | BIT(3),
+		.links = arl_rt712_l0_rt1320_l3,
+		.drv_name = "sof_sdw",
+		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
+		.sof_tplg_filename = "sof-arl-rt712-l0-rt1320-l3.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{
 		.link_mask = BIT(2) | BIT(3),
 		.links = arl_cs42l43_l2_cs35l56_l3,
-- 
2.43.0

