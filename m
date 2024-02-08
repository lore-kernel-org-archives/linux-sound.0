Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00AE7FBB0
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411361; cv=none; b=XH9ptJgRQq1GnIN1tzHJsbTm5WlS/bxxec7fJdKtdC1UHIVT9scNBntjlGLIuFSzxSorihYM3XlWbyzXjE2nqDpYce3WZKWbyxcvmbB20CfgtjQYS6ULL/nIYGuqEFvHAmIgWTVnGj1xD+K9eMKOMgB3cd9SjV2v5VsCHROMy8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411361; c=relaxed/simple;
	bh=1qIbuDxxnC7LHRl1bXGWQdtxfGnCJuRj1o/za54baOE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pf8fCtShdaTlFZ/Z82y6U9QZKQ3q0wt2Wt51xU2/I3spdTn5DM4c0T6th/+SnMZJ39oz9Jce2VoLUs66nqTMJJzVhlG/3mU0v/QFpDphDAFnqi3nR/tTfqFxtj1k/A9tHneqec39gpVgpymtLatLrLsfGL9v7YtFnaZMLpb8IQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0YfwsWk; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0YfwsWk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411359; x=1738947359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1qIbuDxxnC7LHRl1bXGWQdtxfGnCJuRj1o/za54baOE=;
  b=B0YfwsWkQj5Jy3yf8TBP473jfjDC3S/PpydHnyLIdx3eJY2od5LB/OGy
   8WG9zY9/C1Rwg2sRlp8oDCnmOp8z2bzE9CFxexUummxYPvzZwAAtSdaEW
   FWXygSHIoEBEov3P3gimhYrDlMSNJYKcZjg65R7J7ukkEcAdrZsnnMmM7
   d6eaPystgElmYx3M1jxrcHzfsONp8hUp/95K4LOz8wnhVXDWaGuRsP/Y+
   XLYa9R9nMgF/mVAuEwySxDV4NIzusmoi/8vZNgaCNyxKyPWchbcHcVpCv
   vmU3zbKJ9Pwm26T1TlLsCWgTzcG7sZQ4vTUhi3vWqRRGJaB5Bgv8HqPq2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675326"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675326"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:55:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690160"
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
Subject: [PATCH 05/24] ASoC: Intel: sof_rt5682: board id cleanup for mtl boards
Date: Thu,  8 Feb 2024 10:55:26 -0600
Message-Id: <20240208165545.93811-6-pierre-louis.bossart@linux.intel.com>
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
removed from board quirk. Introduce "mtl_rt5682_def" board to reduce
the number of mtl board configs.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               | 9 +--------
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 4 ++--
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 995372091387..fc2582045598 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -889,14 +889,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_NUM_HDMIDEV(3)),
 	},
 	{
-		.name = "mtl_rt1019_rt5682",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(2) |
-					SOF_RT5682_SSP_AMP(0) |
-					SOF_RT5682_NUM_HDMIDEV(3)),
-	},
-	{
-		.name = "mtl_rt5650",
+		.name = "mtl_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(2) |
 					SOF_RT5682_SSP_AMP(0) |
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 23eaf47b3f24..e9a5da079089 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -62,7 +62,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 	},
 	{
 		.comp_ids = &mtl_rt5682_rt5682s_hp,
-		.drv_name = "mtl_rt1019_rt5682",
+		.drv_name = "mtl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &mtl_rt1019p_amp,
 		.sof_tplg_filename = "sof-mtl-rt1019-rt5682.tplg",
@@ -84,7 +84,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 	},
 	{
 		.id = "10EC5650",
-		.drv_name = "mtl_rt5650",
+		.drv_name = "mtl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &mtl_rt5650_amp,
 		.sof_tplg_filename = "sof-mtl-rt5650.tplg",
-- 
2.40.1

