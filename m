Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C0174E0C
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711404691; cv=none; b=PhFSJYtI/ep57okTUT9lRJnHdEvC+fAXvmuTUIO1kivztfHcgIqWjamOxpYG2t+ELwsNr677f1E8CBNIRnn98LzJ8SbRohErXNLepyjdzeRo+O+2ylFdu+ANBxVaY2FY0Yh7z04drZUgeMD8ExX2lwL6V251iWPxp8V+LItkzJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711404691; c=relaxed/simple;
	bh=QOBjDB6AApBh+EA1ArAbtjdkuVS+wlbI9u5I4RYbrLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nRiGHw0rvUe7V7lvq1aWiLJgxbc8fnauOt+MEmZFXfqUqEO7w20mfGtEMbeBnRdO65aPWTev8kHGkwaFkp9X9Aw9OPgN7EzJZPPIpVVFn6ykY2q8AFhA7/f0Yl9W4LT0YaqQs20p8Cw2UHkrnllGGYc5OpCJJ1Vv73CDFxz9NoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i8Z035Qe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i8Z035Qe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404690; x=1742940690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QOBjDB6AApBh+EA1ArAbtjdkuVS+wlbI9u5I4RYbrLQ=;
  b=i8Z035QeZUmDns5fsKvUJAX/X6/1wTU51LYmpBqlInh+VFYw7DrqWaM1
   4u9WaInHbD+TL/L/2vK5YohVQLrI6sC70ied4l7cn9V39/2EdTboPiktV
   WmTuoBYVq7Q7d+Lu92HLIvXPhneXtt/3TJAuz2E9JD4VuAHcxPHI6oMDi
   QC7/6cOmQKEfAuB91pqJT7lKWDgAyvlan0XOn0NOMu1YsFZTXdopZOXoj
   L01eU38ybw6iuycy9kjnRbGztuFwRTQCTeT/PTd1QCTCap57vI5o68YZw
   99YJ2WycwbXSoIsNYiLcIRo/oBr4RmLya1UvgMYGRMZyLmZBu5q2CU3Wk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643699"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6643699"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15722186"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 21/21] ASoC: Intel: sof_rt5682: board id cleanup for cml boards
Date: Mon, 25 Mar 2024 17:10:59 -0500
Message-Id: <20240325221059.206042-22-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Introduce "cml_rt5682_def" for cml boards which implement headphone
codec on SSP0 and speaker amplifiers on SSP1.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               | 2 +-
 sound/soc/intel/common/soc-acpi-intel-cml-match.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index f80fdbd8fdac..aadd341a202c 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -722,7 +722,7 @@ static const struct platform_device_id board_ids[] = {
 		.name = "sof_rt5682",
 	},
 	{
-		.name = "cml_rt1015_rt5682",
+		.name = "cml_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_SSP_PORT_CODEC(0) |
 					SOF_SSP_PORT_AMP(1)),
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index 5eab17820532..d47a548959ea 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -49,21 +49,21 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
 	},
 	{
 		.id = "10EC5682",
-		.drv_name = "cml_rt1015_rt5682",
+		.drv_name = "cml_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &rt1015_spk_codecs,
 		.sof_tplg_filename = "sof-cml-rt1011-rt5682.tplg",
 	},
 	{
 		.id = "10EC5682",
-		.drv_name = "sof_rt5682",
+		.drv_name = "cml_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &max98357a_spk_codecs,
 		.sof_tplg_filename = "sof-cml-rt5682-max98357a.tplg",
 	},
 	{
 		.id = "10EC5682",
-		.drv_name = "sof_rt5682",
+		.drv_name = "cml_rt5682_def",
 		.sof_tplg_filename = "sof-cml-rt5682.tplg",
 	},
 	{
-- 
2.40.1

