Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2547F7FC
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411360; cv=none; b=IiN5nJlIPkR7KTl+dS9L97vvzZjPyqhs2gUWNBmVpQOTiH4R7S6M3n9MhfAa+FLZc3EelnFkOBr22ZwSJ3FGWtV3jOrfl8EB2Plc4MAS9Na0l6oQPZMbPoHNQPx+Ad2N0RD8RlDI1DdEPUTczbAWsETU9W0rbHazzTsxPT7Xnx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411360; c=relaxed/simple;
	bh=2GOhPgPfZXs0eLtD8qC1pk8cpbLmORrtDi6ZC4N/T8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n3aWPW9lfKuNgGekq6wTPat5GFMJx126Yf8B5Z9ZaUTGFTYCEUbN04OIfRFv9fYnAURjv8WAL99cs+o+f9LLhYPc0XByS0Rocr3uNrFUPKB3/R88qmx2IoWawxY4qnebpiTuYXfmzfyvFgferd8hoVyqvqB4WgAKXVYR+B5aJc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9AHfjUD; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9AHfjUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411359; x=1738947359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2GOhPgPfZXs0eLtD8qC1pk8cpbLmORrtDi6ZC4N/T8w=;
  b=H9AHfjUD/DyCKtqOdxGHogmYO5B0nj1ONJNIxeFdRUc/t1H86eUW89I+
   0hvWb9X1KFeyqZ98SGRZTwvN8mSyBJU/RzvqP5RRYrcs2ZTnmc5Lyql7P
   DLnmmRWCYpEantVT9ot9ysQT9RtNPCkQtFdj9BKRGgbhqB73epfn9joIv
   ZpkwEWcow3/mmVZQl6Kc4iImdcRMx21QUd0j5KdAa/74gPUi2FqFbfG36
   59Ft3fvMfbwgssaCVt3RqYf2bk8e2BF2icyiXTEcBiB5Y+TNtdUW5oRX8
   UJ0gGnkDquefhNAiQJ4unREUU30piWjXsZ4Gm/GW9YUKQZg6O28+zBVYz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675319"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675319"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:55:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690156"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:55:57 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 04/24] ASoC: Intel: sof_rt5682: board id cleanup for rpl boards
Date: Thu,  8 Feb 2024 10:55:25 -0600
Message-Id: <20240208165545.93811-5-pierre-louis.bossart@linux.intel.com>
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
removed from board quirk. Introduce "rpl_rt5682_def" board to reduce
the number of rpl board configs.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               | 11 +----------
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c |  4 ++--
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index e556bbd660c5..995372091387 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -856,16 +856,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
 	{
-		.name = "rpl_mx98360_rt5682",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
-	},
-	{
-		.name = "rpl_rt1019_rt5682",
+		.name = "rpl_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_RT5682_SSP_AMP(1) |
diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index c0a643f4725a..00a21af210fa 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -395,7 +395,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 	},
 	{
 		.comp_ids = &rpl_rt5682_hp,
-		.drv_name = "rpl_mx98360_rt5682",
+		.drv_name = "rpl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &rpl_max98360a_amp,
 		.sof_tplg_filename = "sof-rpl-max98360a-rt5682.tplg",
@@ -423,7 +423,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 	},
 	{
 		.comp_ids = &rpl_rt5682_hp,
-		.drv_name = "rpl_rt1019_rt5682",
+		.drv_name = "rpl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &rpl_rt1019p_amp,
 		.sof_tplg_filename = "sof-rpl-rt1019-rt5682.tplg",
-- 
2.40.1

