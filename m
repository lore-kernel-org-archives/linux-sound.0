Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83841DE8B7
	for <linux-sound@vger.kernel.org>; Fri,  6 Dec 2024 07:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733471964; cv=none; b=XPtSW4jmD6YJKIOCJuk4ExSqVCcKOl5G2Z9GHUCuZ3WVwIGQeBIw0EIsMv/4G69xSecxcLUkisUQRq9VvgWP285qzpUO6ez9bUm5EM5xa6qRT/lrMShHkTcCc7zRyijlCp4UhUybxv8adQm6MJBu+ls4FbjfpFQyBZ49F8ww7Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733471964; c=relaxed/simple;
	bh=5NYBq1IGgltW8A8pWhf3q+Xz2rSXK99sjpRFMsN22Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oeJFj2YwlXxrahOrP7YgjXYRqvQln6/L1xtU3fxHclUt4chzHab4Xt0dtdf+V8eK0sUFtkfX2SIXZnG6s9ltwfnXsbN6T0gRrrELUEFex7vcEego2O/75lWrcqR3gpEEXZJ7xkL2SZGxiSBsTPtpxMcrA//awsh2mb8zKq99xY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iixlV0GN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iixlV0GN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733471962; x=1765007962;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5NYBq1IGgltW8A8pWhf3q+Xz2rSXK99sjpRFMsN22Ao=;
  b=iixlV0GNi3Q2REYs78IKPwilZaGuOystAaxdIQ8Q7mSR2oBEItwj3qGA
   vAMXMSKflh9bhoSWqQNlh3kHG3luc5f+aD0hSEePzEF9KR1T1UlAsM3AU
   Zx69VdsP7yi4KFCWxCVbz8I8dxQooQxmoPEiKK0JKa/d1JG4QdhQPyFWZ
   Bexvz7juPkrkWf5eb2wKQux5siTvUQfngGw8pvAkW8Lhqfo9rQLcn2p1O
   oOqRi6Hiig9kYkoz5MtiJoOfQkKBj8ZTZ5+KCjAnP44SHuueYydMsP7Tk
   50F/MHjZ/+/l8fuNkIR9DSnlSkFApf7qAYClaSy8bNH/hdjA52pkmRjko
   g==;
X-CSE-ConnectionGUID: TbyGimUFTMydrSMh0W+3rQ==
X-CSE-MsgGUID: 5L7xkPRPQeKvukJwioLhKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45192794"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="45192794"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:22 -0800
X-CSE-ConnectionGUID: Cfhlrmv1TsCS5tEBYaWTYA==
X-CSE-MsgGUID: 2NrbaYvCSGyPhBsCvXBgiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94144425"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.179])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:21 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 06/10] ASoC: Intel: soc-acpi-intel-ptl-match: add rt712_vb + rt1320 support
Date: Fri,  6 Dec 2024 15:58:59 +0800
Message-ID: <20241206075903.195730-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206075903.195730-1-yung-chuan.liao@linux.intel.com>
References: <20241206075903.195730-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add rt712_vb on SDW link 2 and 1 rt1320 on SDW link 1 configuration
support.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index f1c0d7a02cda..573fae541db7 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -8,6 +8,7 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
+#include "soc-acpi-intel-sdca-quirks.h"
 #include "soc-acpi-intel-sdw-mockup-match.h"
 #include <sound/soc-acpi-intel-ssp-common.h>
 
@@ -35,6 +36,13 @@ static const struct snd_soc_acpi_endpoint single_endpoint = {
 	.group_id = 0,
 };
 
+static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 1,
+	.group_id = 1,
+};
+
 /*
  * Multi-function codecs with three endpoints created for
  * headset, amp and dmic functions.
@@ -60,6 +68,30 @@ static const struct snd_soc_acpi_endpoint rt_mf_endpoints[] = {
 	},
 };
 
+static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints_endpoints[] = {
+	/* Jack Endpoint */
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	/* Amp Endpoint, work as spk_l_endpoint */
+	{
+		.num = 1,
+		.aggregated = 1,
+		.group_position = 0,
+		.group_id = 1,
+	},
+	/* DMIC Endpoint */
+	{
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
 static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	{
 		.adr = 0x000030025D071101ull,
@@ -69,6 +101,15 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt712_vb_2_group1_adr[] = {
+	{
+		.adr = 0x000230025D071201ull,
+		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints_endpoints),
+		.endpoints = jack_amp_g1_dmic_endpoints_endpoints,
+		.name_prefix = "rt712"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt721_3_single_adr[] = {
 	{
 		.adr = 0x000330025d072101ull,
@@ -114,6 +155,15 @@ static const struct snd_soc_acpi_adr_device rt722_3_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1320_1_group1_adr[] = {
+	{
+		.adr = 0x000130025D132001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1320-1"
+	}
+};
+
 static const struct snd_soc_acpi_link_adr ptl_rt722_only[] = {
 	{
 		.mask = BIT(0),
@@ -150,6 +200,20 @@ static const struct snd_soc_acpi_link_adr ptl_rvp[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr lnl_sdw_rt712_vb_l2_rt1320_l1[] = {
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt712_vb_2_group1_adr),
+		.adr_d = rt712_vb_2_group1_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1320_1_group1_adr),
+		.adr_d = rt1320_1_group1_adr,
+	},
+	{}
+};
+
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -201,6 +265,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt722.tplg",
 	},
+	{
+		.link_mask = BIT(1) | BIT(2),
+		.links = lnl_sdw_rt712_vb_l2_rt1320_l1,
+		.drv_name = "sof_sdw",
+		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
+		.sof_tplg_filename = "sof-lnl-rt712-l2-rt1320-l1.tplg"
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_sdw_machines);
-- 
2.43.0

