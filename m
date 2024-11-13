Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020D51853
	for <linux-sound@vger.kernel.org>; Wed, 13 Nov 2024 06:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731480273; cv=none; b=f3ktzYGBVBl4lRC1fxF6I8ba8xdWwLH0JD38r5V849v9gU6c+zk6XQQNA22DqkSRk/VxYxQKeCq7zLmPEz/wgYkbSAbpNqCRkKAz9DG9Lx3x9tRnKyfwZSpysNhzpwhvD3JanRAbrSe+TNeR9nm6ROnrvCOQWL3FWVUya0kPeIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731480273; c=relaxed/simple;
	bh=6vURL2XPhPg9gjqUwAmkr9qKh5XyDoVc5R+H89hR6PI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=md/NR+EZNCBqdKTu2pFQ5cuV1gnT/Xaan8CcsaBZ0RorI0loSAyePHUJQwi5aVwWV9/l00N3urL1EqNYzD4LWg0R6DkjL/Ii7/WknkVZMDi1LrnEtdwhh6jryILlDLWmxZPWyE22Bq6QTnu9nlKd7c/3/4vEFAff8y8SPmkXMuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6e9x93E; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6e9x93E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731480272; x=1763016272;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6vURL2XPhPg9gjqUwAmkr9qKh5XyDoVc5R+H89hR6PI=;
  b=L6e9x93Em+qA+G1oTPSFUpwzpdYnTl2vq/fytryOwQvpv480l8kM/OjH
   hKXZor1qobceD1E8xt7vpTOCJjYYM+ebYXOPGcFqe0phQlnI4om9673Va
   xg6ueLIg9NDq/NAC41iF2SSU2KiCxqCtW4voMggzgx64A8rtVehxxRRdS
   YZASBysPD2T3ZClxnl9oC9DaNIluWN3uJG7QtPJxYHzthFYPm70HFU4qw
   bxf691TVbfWEekQcMh+uNajhZwUa88cY+Pt3DGjf51QZIJdq7wImmGrAY
   oW1uh1ooaSr7SNUq9uI2W2/Jowg7fHNYvPyRYKbZhytsp5NCtwDlcfPbA
   w==;
X-CSE-ConnectionGUID: gs65SQvMTY+PJDkNmBDvqA==
X-CSE-MsgGUID: EKgmD55oSSWXvvMd9tbCvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53907117"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53907117"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 22:44:31 -0800
X-CSE-ConnectionGUID: 3Y+N5Rn1QyK/xK+2dpPH0w==
X-CSE-MsgGUID: vNrrZAX6SeWJAVyjqEDezA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="88172932"
Received: from sramkris-mobl1.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.154])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 22:44:30 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH] ASoC: Intel: soc-acpi-intel-lnl-match: add rt712_vb + rt1320 support
Date: Wed, 13 Nov 2024 14:44:17 +0800
Message-ID: <20241113064418.162592-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Realtek Gen6 AIOC supports rt712_vb on SoundWire link 2 and rt1320 on
SoundWire link 1.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-lnl-match.c   | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index 094ed4b27cb0..98a9c36d7a4c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -8,6 +8,7 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
+#include "soc-acpi-intel-sdca-quirks.h"
 #include "soc-acpi-intel-sdw-mockup-match.h"
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_machines[] = {
@@ -90,6 +91,30 @@ static const struct snd_soc_acpi_endpoint rt722_endpoints[] = {
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
 static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
 	{ /* Jack Playback Endpoint */
 		.num = 0,
@@ -198,6 +223,15 @@ static const struct snd_soc_acpi_adr_device rt1712_3_single_adr[] = {
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
 static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
 	{
 		.adr = 0x000030025d072201ull,
@@ -252,6 +286,15 @@ static const struct snd_soc_acpi_adr_device rt1318_2_group1_adr[] = {
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
 static const struct snd_soc_acpi_adr_device rt713_0_adr[] = {
 	{
 		.adr = 0x000031025D071301ull,
@@ -410,6 +453,21 @@ static const struct snd_soc_acpi_link_adr lnl_sdw_rt713_l0_rt1318_l1[] = {
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
+/* this table is used when there is no I2S codec present */
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -485,6 +543,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-rt713-l0-rt1318-l1.tplg"
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
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_lnl_sdw_machines);
-- 
2.43.0

