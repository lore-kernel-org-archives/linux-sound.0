Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A8343CEFE
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 10:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013875; cv=none; b=NYy8rU5UCEU0UHsW6ESzxFi9xB0/OQMDmcXeqROjeAFoS0uIucEMVJPZEkoirJEfvqvxBrF2AvChsbUGuMEKwnqCfLppDJmNgd5e67JH1qd2u9l8jAcgAR7eBXqMsWv+Y1mPhbqcwMBVFpijzHXSD+kWENeeHCgX1PmcY1jXfoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013875; c=relaxed/simple;
	bh=5uPs4gCgM0+wWg3v3cUXgGO/75x4QMMBi33fO/HKhUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hIY3XSCpZ7+4LJ1rF3j2dvGMcI6ccCLLwxfKk4vLVqIiEXuixv4nFVZlz5n2W5jtnq6TD9TF+tAPPYHeKzL8X+LrNx+Mz7AprcyiatXNrc8zKgbxgbX07Fq3k2ZAzpKKzMbTtYNge4D2y/zs+dM+RrcnzfXc/J45AW2yt7KFG8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iB3P/yhK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iB3P/yhK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786013874; x=1817549874;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5uPs4gCgM0+wWg3v3cUXgGO/75x4QMMBi33fO/HKhUI=;
  b=iB3P/yhKAcKpBe+K7Wl1Rboqz3+3pdw+eWADIQOK6Z64Wt0pJXjhs4Zl
   MKBYAZcKDG7pO4i5TeW24Gja8//HEo0aFRBXdrmgrd1N1FVtJenKD2a00
   po/8EHDc2I6/j/2HIA5BK5exwhG2x0pT61RPYeQ9+V6PEiZXP7aVf6ug/
   C4gixIzO8gy7RFoORa1T8Rz+jaT7Ldta9X0B49tIhc6l4KNsVL4glJ1FO
   auCi08ZtVcIb+QM6v9XcNf6h7D1QOaHHUz0dIw54sNIFnfBwnDysiucUa
   7GSoOH/Mfcyj4fcdeLgeadxoacx9LPaVNDv3g9cwTDb2LUD07rtrLPAn8
   A==;
X-CSE-ConnectionGUID: V6GCz7dkTaWI/bFcYz8uSw==
X-CSE-MsgGUID: xOMEyjNFTP2W8kPddZeKRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="98114688"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="98114688"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 03:57:53 -0700
X-CSE-ConnectionGUID: NIsoWEnQQ8exLZS4AkFskw==
X-CSE-MsgGUID: suCELzkbTMulAXpg2CaMKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="285452208"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 03:57:52 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/2] ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in NVL match table
Date: Thu,  6 Aug 2026 18:57:41 +0800
Message-ID: <20260806105742.2676322-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806105742.2676322-1-yung-chuan.liao@linux.intel.com>
References: <20260806105742.2676322-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Balamurugan C <balamurugan.c@intel.com>

Adding HDMI-In capture via I2S feature support in NVL platform.

Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_es8336.c               | 10 ++++++++++
 sound/soc/intel/common/soc-acpi-intel-nvl-match.c | 12 ++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index e9ee752d5ec3..9b016136c639 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -847,6 +847,16 @@ static const struct platform_device_id board_ids[] = {
 					SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK |
 					SOF_ES8336_JD_INVERTED),
 	},
+	{
+		.name = "nvl_es83x6_c1_h02",
+		.driver_data = (kernel_ulong_t)(SOF_ES8336_SSP_CODEC(1) |
+					SOF_NO_OF_HDMI_CAPTURE_SSP(2) |
+					SOF_HDMI_CAPTURE_1_SSP(0) |
+					SOF_HDMI_CAPTURE_2_SSP(2) |
+					SOF_SSP_HDMI_CAPTURE_PRESENT |
+					SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK |
+					SOF_ES8336_JD_INVERTED),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-nvl-match.c b/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
index a7f4097d426c..51bbae5ed8fc 100644
--- a/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
@@ -16,12 +16,24 @@ static const struct snd_soc_acpi_codecs nvl_essx_83x6 = {
 	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
 };
 
+static const struct snd_soc_acpi_codecs nvl_lt6911_hdmi = {
+	.num_codecs = 1,
+	.codecs = {"INTC10B0"}
+};
+
 static const struct snd_soc_acpi_codecs nvl_rt5682_rt5682s_hp = {
 	.num_codecs = 2,
 	.codecs = {RT5682_ACPI_HID, RT5682S_ACPI_HID},
 };
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_nvl_machines[] = {
+	{
+		.comp_ids = &nvl_essx_83x6,
+		.drv_name = "nvl_es83x6_c1_h02",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &nvl_lt6911_hdmi,
+		.sof_tplg_filename = "sof-nvl-es83x6-ssp1-hdmi-ssp02.tplg",
+	},
 	{
 		.comp_ids = &nvl_essx_83x6,
 		.drv_name = "sof-essx8336",
-- 
2.43.0

