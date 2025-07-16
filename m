Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A092C2EA727
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 08:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752654193; cv=none; b=OGx/7nYrr6tCKnVyY+K9vzrWdOcUcNYK7qs9kxWCYdPMuuqxZAFLQkDmApe3hg+msUiSMY2Rh14Deqtm/JOJPyhs6JE3onP/nkYDTOVuBY2Llz9M4lBanao808JSCV6oN9nd3rSmAqLnHTKCDcQ3fq3NCYQwS3Qlf9/2HTK5E5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752654193; c=relaxed/simple;
	bh=IfcTsG9SPFpZJI366Y5Lg26jIu5zsl0SKwDXI5wuJns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fgyx0avgGdp8F+ZL+LsHotoCaiVghEg/RxexotMpFI9jBu8n2cKPZGyJaouiF3cG+lD2dZOf2fyne3r8/4okkOE03+IggXWOQ1J0yScExpUOitO8YZU6sqthR7oTpSusxT9oKhOIZ55L878K1LnLXejT9ZxfR2bcceTdkzHD+rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3b9Vcni; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3b9Vcni"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752654192; x=1784190192;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IfcTsG9SPFpZJI366Y5Lg26jIu5zsl0SKwDXI5wuJns=;
  b=W3b9Vcni4oPBII1WBIeikpGjPUVW4RJrRPLR/mH1cXR4zgW6m6QqXLnh
   yLn8ZJUctLqlu9mJP6Rim8y/vkAMAvU/7dwfjZfnHVU43R6gjjilei03r
   4PEw3FgI+8kJM1HUjM03oGyxW5YwexT+PZlnqZe7OdWNwWFfEtaShw3Fc
   Bf32eCBy0MUy1QfmlU2YB0cKKVDqdCJZMCEDzRV6WelrEmV6YJn6EnI3Y
   jZlMEwwLEEbJO/A9TXA9NrwSCZn0xfhpRhwOOelcwpe3xR0OUYHLthsRx
   Gh+Kd8TPzXuHBGVvoBNZCWPbhV2CJwlC+/4oFh1rcLvcHeKh1ufXoIwBy
   Q==;
X-CSE-ConnectionGUID: JM1b4J3HStKcr3lEbKJ8sg==
X-CSE-MsgGUID: tXhjjJGRRqa7+nweonBSqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="57497036"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="57497036"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 01:23:10 -0700
X-CSE-ConnectionGUID: OXIdeFT/SXyDIJP9IcCWmQ==
X-CSE-MsgGUID: 1ivh/4qbRW+Z0wDcBPaYxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="188403888"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 01:23:09 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com
Subject: [PATCH] ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for PTL.
Date: Wed, 16 Jul 2025 16:23:00 +0800
Message-ID: <20250716082300.1810352-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Balamurugan C <balamurugan.c@intel.com>

Added match table entry on ptl machines to support HDMI-In capture
with rt5682 I2S audio codec. also added the respective quirk
configuration in rt5682 machine driver.

Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               | 7 +++++++
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index f5925bd0a3fc..4994aaccc583 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -892,6 +892,13 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_PORT_BT_OFFLOAD(2) |
 					SOF_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.name = "ptl_rt5682_c1_h02",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_SSP_PORT_CODEC(1) |
+					/* SSP 0 and SSP 2 are used for HDMI IN */
+					SOF_SSP_MASK_HDMI_CAPTURE(0x5)),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index a8fee8cf4913..e292701dfcfe 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -32,6 +32,13 @@ static const struct snd_soc_acpi_codecs ptl_lt6911_hdmi = {
 };
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_machines[] = {
+	{
+		.comp_ids = &ptl_rt5682_rt5682s_hp,
+		.drv_name = "ptl_rt5682_c1_h02",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &ptl_lt6911_hdmi,
+		.sof_tplg_filename = "sof-ptl-rt5682-ssp1-hdmi-ssp02.tplg",
+	},
 	{
 		.comp_ids = &ptl_rt5682_rt5682s_hp,
 		.drv_name = "ptl_rt5682_def",
-- 
2.43.0

