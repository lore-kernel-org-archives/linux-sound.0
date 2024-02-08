Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543A77EF1F
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411359; cv=none; b=msL67nQhZ1eLVbxK2FrPaYHpoUIuPRKLiPdGlD5W9zuXtArc4CsAflAl9Y8o4+S/qi9iE+ghNXIjWE5OOeyisbZVlKcwZvW5ppx4mQPTN7dlz3lII/ZD+hYBAPNbPHjOHqUgyydbjNAo1mEzpnnyVmWD+vDlziTxVqWN0z6MDms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411359; c=relaxed/simple;
	bh=hFinSNxO5QebP9372ub5GWFoHS3nI5f2YuCXMjpNQZs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W6W4ohQ8Go2YnJXaXM24LttQb20WJODs49hXTzbtpOMSB0WRqMyabudjnMGdjon6hm602i35Jsvvi4fl2slntqYCnm1bcBzbe3/V5D4L2zU0xXaNqGKoGaPkuM5H2bSXsIw8Uhwdj2EcCpYzmbnBguL0ePZ7q5GfFQwp09zYKfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+k8p8vC; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+k8p8vC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411357; x=1738947357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hFinSNxO5QebP9372ub5GWFoHS3nI5f2YuCXMjpNQZs=;
  b=D+k8p8vC0JEfH/zPocdnSwFwrP5wg6YywIjoeNOuJvMIWZwsqWv1/XvL
   K5e1WqVRJzRJmTg149EYWOJKVbg37ywDl+OX8njLT9+t0KqhD8w0ZlIvQ
   OE+GY2XTP+8uQ91swK89dvIlD8Qk53d1SlslgDiw/JoHhQiqXVa71E6Zh
   8I/XQYJ6RWWQYCf8pzvYmjOG43fW5TC01rpu6/jzFzH8XpWwGMHPUYx3/
   IsEdC/irwqWOsRUY6HtOHngdzlzA6mB0KSkcY43aya6Ylx5HTzz5UrgCr
   oQT+xM7LJ0ZxpU1GmVhoMNbRhZBImOhkYbWgrKVMPBQpRX4va8ux2TBtm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675304"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675304"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:55:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690140"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:55:55 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 01/24] ASoC: Intel: sof_rt5682: board id cleanup for jsl boards
Date: Thu,  8 Feb 2024 10:55:22 -0600
Message-Id: <20240208165545.93811-2-pierre-louis.bossart@linux.intel.com>
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
removed from board quirk. Introduce "jsl_rt5682_def" board to reduce
the number of jsl board configs.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c           | 25 +------------------
 .../intel/common/soc-acpi-intel-jsl-match.c   | 10 ++++----
 2 files changed, 6 insertions(+), 29 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index cd50f26d1edb..3763985f570f 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -810,30 +810,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_AMP(1)),
 	},
 	{
-		.name = "jsl_rt5682_rt1015",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(1)),
-	},
-	{
-		.name = "jsl_rt5682_mx98360",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(1)),
-	},
-	{
-		.name = "jsl_rt5682_rt1015p",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(1)),
-	},
-	{
-		.name = "jsl_rt5682",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0)),
-	},
-	{
-		.name = "jsl_rt5650",
+		.name = "jsl_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_RT5682_SSP_AMP(1)),
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index 342bbbb48ca7..a6ac2525df17 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -66,28 +66,28 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 	},
 	{
 		.comp_ids = &rt5682_rt5682s_hp,
-		.drv_name = "jsl_rt5682_rt1015",
+		.drv_name = "jsl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &rt1015_spk,
 		.sof_tplg_filename = "sof-jsl-rt5682-rt1015.tplg",
 	},
 	{
 		.comp_ids = &rt5682_rt5682s_hp,
-		.drv_name = "jsl_rt5682_rt1015p",
+		.drv_name = "jsl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &rt1015p_spk,
 		.sof_tplg_filename = "sof-jsl-rt5682-rt1015.tplg",
 	},
 	{
 		.comp_ids = &rt5682_rt5682s_hp,
-		.drv_name = "jsl_rt5682_mx98360",
+		.drv_name = "jsl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &mx98360a_spk,
 		.sof_tplg_filename = "sof-jsl-rt5682-mx98360a.tplg",
 	},
 	{
 		.comp_ids = &rt5682_rt5682s_hp,
-		.drv_name = "jsl_rt5682",
+		.drv_name = "jsl_rt5682_def",
 		.sof_tplg_filename = "sof-jsl-rt5682.tplg",
 	},
 	{
@@ -107,7 +107,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 	},
 	{
 		.id = "10EC5650",
-		.drv_name = "jsl_rt5650",
+		.drv_name = "jsl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &rt5650_spk,
 		.sof_tplg_filename = "sof-jsl-rt5650.tplg",
-- 
2.40.1

