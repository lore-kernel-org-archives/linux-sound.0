Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AE17EF04
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411359; cv=none; b=jfhl/lGxkoc+wZe9YSbfdUh43CbBrPC9rfGkxMsgvbMJZlmDBiPvIGdSYNTjKL4vQv5XgIbsAUf/hjyjshwKk4NgV4qOCLO4pdW2BnBNYqW05jibDjbI5WkjNBMKl0gDzmWxD4jyekequys5sPHrjzRCSg2S6FY70ivjJB3qDnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411359; c=relaxed/simple;
	bh=69+mdI94CW8aZEf1uBbgPgHwfToWsgoDZTuYWh6wSeM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X7+VHaDoORXqseg3GhHWzq9hW3AY4a9qIhWX2fY35bF+EIDL0BzniJ8psLE69Qthz2QGTi3etneJeECBvnvKXLoF8mZPkrpqStqhYYkbaEcQqG2Cq/FtF3Z4yqpYuyVnaX58a3DN2yUoB+j06u3JOl3XdCu9JAmEqGsNCaDBslI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=adnkWTKF; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="adnkWTKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411358; x=1738947358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=69+mdI94CW8aZEf1uBbgPgHwfToWsgoDZTuYWh6wSeM=;
  b=adnkWTKFhh0uVxYYZnKfJRZD6Q5jeh7avSJw6s09c3fF3S4l9oD+58uE
   e/ybP7huNAsi57bf81Yy0gyhvqzboucKFxMy94K6AssCwYrvxFiyicJkV
   nt8cx7VD+/OE5bd/t+d5B51CcSALU9Snp5X+d63YdzpsPTm3BfUvUmBt9
   SeRaSo/9+/1vrtBsriPE1aZfAxxviDoxH4EfCp4EqEK6jLZhnkXBGkLUq
   R50GaQIQluEGW6Bb/lXskZGutHjlV0GCc00jj8Jush0RB3QpUX0Ujf4wq
   xYRsF9nXm65MiDNBs4e09H29Jzuv6JFcnxzkJvCI4Cbto4Da2Rxh68326
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675314"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675314"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:55:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690151"
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
Subject: [PATCH 03/24] ASoC: Intel: sof_rt5682: board id cleanup for adl boards
Date: Thu,  8 Feb 2024 10:55:24 -0600
Message-Id: <20240208165545.93811-4-pierre-louis.bossart@linux.intel.com>
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
removed from board quirk. Introduce "adl_rt5682_def" board to reduce
the number of adl board configs.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c           | 46 +------------------
 .../intel/common/soc-acpi-intel-adl-match.c   | 12 ++---
 2 files changed, 7 insertions(+), 51 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 9644ae22c6ee..e556bbd660c5 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -825,7 +825,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
 	{
-		.name = "adl_mx98373_rt5682",
+		.name = "adl_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_RT5682_SSP_AMP(1) |
@@ -840,41 +840,6 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_AMP(2) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
-	{
-		.name = "adl_max98390_rt5682",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
-	},
-	{
-		.name = "adl_mx98360_rt5682",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
-	},
-	{
-		.name = "adl_rt5682",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
-	},
-	{
-		.name = "adl_rt1019_rt5682",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
-	},
 	{
 		.name = "adl_rt5682_c1_h02",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
@@ -883,15 +848,6 @@ static const struct platform_device_id board_ids[] = {
 					/* SSP 0 and SSP 2 are used for HDMI IN */
 					SOF_HDMI_CAPTURE_SSP_MASK(0x5)),
 	},
-	{
-		.name = "adl_rt5650",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
-	},
 	{
 		.name = "rpl_mx98357_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index d3d913458c60..0da79a3ba1f0 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -500,7 +500,7 @@ static struct snd_soc_acpi_codecs adl_rt5650_amp = {
 struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	{
 		.comp_ids = &adl_rt5682_rt5682s_hp,
-		.drv_name = "adl_mx98373_rt5682",
+		.drv_name = "adl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &adl_max98373_amp,
 		.sof_tplg_filename = "sof-adl-max98373-rt5682.tplg",
@@ -514,7 +514,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	},
 	{
 		.comp_ids = &adl_rt5682_rt5682s_hp,
-		.drv_name = "adl_mx98360_rt5682",
+		.drv_name = "adl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &adl_max98360a_amp,
 		.sof_tplg_filename = "sof-adl-max98360a-rt5682.tplg",
@@ -542,7 +542,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	},
 	{
 		.comp_ids = &adl_rt5682_rt5682s_hp,
-		.drv_name = "adl_rt1019_rt5682",
+		.drv_name = "adl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &adl_rt1019p_amp,
 		.sof_tplg_filename = "sof-adl-rt1019-rt5682.tplg",
@@ -568,7 +568,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	},
 	{
 		.comp_ids = &adl_rt5682_rt5682s_hp,
-		.drv_name = "adl_max98390_rt5682",
+		.drv_name = "adl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &adl_max98390_amp,
 		.sof_tplg_filename = "sof-adl-max98390-rt5682.tplg",
@@ -582,7 +582,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	},
 	{
 		.comp_ids = &adl_rt5682_rt5682s_hp,
-		.drv_name = "adl_rt5682",
+		.drv_name = "adl_rt5682_def",
 		.sof_tplg_filename = "sof-adl-rt5682.tplg",
 	},
 	{
@@ -609,7 +609,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	},
 	{
 		.id = "10EC5650",
-		.drv_name = "adl_rt5650",
+		.drv_name = "adl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &adl_rt5650_amp,
 		.sof_tplg_filename = "sof-adl-rt5650.tplg",
-- 
2.40.1

