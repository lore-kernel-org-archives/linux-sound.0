Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF547EF13
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411359; cv=none; b=rPIJR+Gguq/xsTNA5h5qxX+PWKUCTRrtbCgGkisv5dtZuepkvbldZohoAHac/tF572kUgLlJWkHap8TUvh8gQFZUWadI+5E5cj45D965xM3+5LdEbWKa3PKxAtzeJ0F05rgOBuoVGTopZo3sXNpKEd4icSQ1DOspkKK01RgeCXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411359; c=relaxed/simple;
	bh=CwCQqe8Wtinvw9+lp8kMPSEZjWhZhkC5BLRRyJmVlaM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bvxNphdREIRnIhbZNU7iH+u4rQssnWTA8KtkVaZpVug7AoKZtu6MPCjjSzlko2tDbvGB3vxppmpqZXUyO0tkFxuTm0WU9az6ikMjHfJ15zN4THVDXCF+gWZr/ZqmALCP9awK39alheVW2qDkOmtkZ3FU7q2paKrupMSstSXt+M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eoqt7F+T; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eoqt7F+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411358; x=1738947358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CwCQqe8Wtinvw9+lp8kMPSEZjWhZhkC5BLRRyJmVlaM=;
  b=eoqt7F+TUpzbk0S0NvEUKRFrjV0ZN3WHGRpbivdPpprRQDpboUqFvHsu
   HlQRi2Jvlz7dEAR70GE0Sw3wCmGqkxXuLQhFwmIHqJZnwOChxErDTSjcr
   I0Ot24XVE32fW38F5yrfUJgk4TYPSvmLVFBFs/HbVqD7WPqlDDZ4yR89B
   Y8lv4K5P+rFcMzjiBnduPgY9NF+YcZnSdCt2dqBlVU8+6qAGXyK/SNWaW
   MgbeyZ+y68eDrwT92Yl5YhuElyyKlkURyF/T8X11tsDmHRUrVheE9NZLm
   vTHyX663OHVpcq0s+rYqwEpz91zPBQA4pa4+hD0Nn7dvfJeRSq8DBfJ3J
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675308"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675308"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:55:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690146"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:55:56 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 02/24] ASoC: Intel: sof_rt5682: board id cleanup for tgl boards
Date: Thu,  8 Feb 2024 10:55:23 -0600
Message-Id: <20240208165545.93811-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Many board configs are duplicated since codec and amplifier type are
removed from board quirk. Introduce "tgl_rt5682_def" board to reduce
the number of tgl board configs.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c           | 20 +------------------
 .../intel/common/soc-acpi-intel-tgl-match.c   |  6 +++---
 2 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 3763985f570f..9644ae22c6ee 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -816,25 +816,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_AMP(1)),
 	},
 	{
-		.name = "tgl_mx98357_rt5682",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
-	},
-	{
-		.name = "tgl_rt1011_rt5682",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
-	},
-	{
-		.name = "tgl_mx98373_rt5682",
+		.name = "tgl_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_RT5682_SSP_AMP(1) |
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index e5f721ba5ed4..0fba0a60d9c7 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -495,21 +495,21 @@ static const struct snd_soc_acpi_codecs tgl_lt6911_hdmi = {
 struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
 	{
 		.comp_ids = &tgl_rt5682_rt5682s_hp,
-		.drv_name = "tgl_mx98357_rt5682",
+		.drv_name = "tgl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &tgl_codecs,
 		.sof_tplg_filename = "sof-tgl-max98357a-rt5682.tplg",
 	},
 	{
 		.comp_ids = &tgl_rt5682_rt5682s_hp,
-		.drv_name = "tgl_mx98373_rt5682",
+		.drv_name = "tgl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &tgl_max98373_amp,
 		.sof_tplg_filename = "sof-tgl-max98373-rt5682.tplg",
 	},
 	{
 		.comp_ids = &tgl_rt5682_rt5682s_hp,
-		.drv_name = "tgl_rt1011_rt5682",
+		.drv_name = "tgl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &tgl_rt1011_amp,
 		.sof_tplg_filename = "sof-tgl-rt1011-rt5682.tplg",
-- 
2.40.1

