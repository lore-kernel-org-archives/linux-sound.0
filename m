Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7668229A9FE
	for <linux-sound@vger.kernel.org>; Tue,  8 Jul 2025 08:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961646; cv=none; b=i3cJpFhDm/qNdpSOawaKSCZLFVLNrFe6yC+WKUPLeH7foZMJgxmNxh7D2kLpSEtteo7kvVDb7UJbytqNBKHjJNd9YRi46uQrvuWl2Cr9c41XSdbXWj6PPC4oWEdavLgVfS4q60e7OmqAn4kb+GnYRD1l8dlAt6GsxmbI/ES7IMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961646; c=relaxed/simple;
	bh=klmSV+cgbVs3hRNuo8lNtJCw0EgsrjbPu+7aaqq/NgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WLLfaMpxv9HiyJxMFPtjKVmU29JKMX/wPaUygfX3FrO9plUNp78BK38klsxrXZWtPsN7aHo/M1Pg1t1CQIYsR0xRMlDrsWcr9OrLnrPwowiTsqLsx9LvnNDYI6keO27xVqG32/N5QsP3gRPRt4U0XrBaC5zrVQW+GRl615A3RmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bExUVuBF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bExUVuBF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751961645; x=1783497645;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=klmSV+cgbVs3hRNuo8lNtJCw0EgsrjbPu+7aaqq/NgU=;
  b=bExUVuBF6vhAxh8pAmqZdFRVniKNS9A6r1v4MEV7FjBKz+CSOWTuycGQ
   cXayiHBavCSeP2/Oi4HwEi7EgXXFGFcuYX7NggC8YnzTbboYq5jMevaI+
   50TyRB5xeJ4mJxsVeXKvCxwZcRe31haPGN7v7PrlCKXF1V31nWpJDW3LO
   rj+rtsYefpeiZlsvJZ1Hb9TV19Cjv6YUhY8bVVLtOo0RNV3K+lgbeRWWF
   dt89DkPJXKJglxSbUwt2ovSgOGsrVfjwVOMAUuSxwBVufdwYseYsTBJbL
   h6O7jDTMcZmjdnFC/tiU/7sE150qLEA8MwgHEzUdIzPvHGcPkP/1K7rtV
   g==;
X-CSE-ConnectionGUID: bXhrCdUPRFKCdxvIU48z7A==
X-CSE-MsgGUID: esHC8AJvR2uXTqWWK2pcJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65542029"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="65542029"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 01:00:44 -0700
X-CSE-ConnectionGUID: qq0r8MHETHKlHEkLh5qI0w==
X-CSE-MsgGUID: Ef4Gv59bQaqO24CObhSX2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="154832102"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 01:00:42 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 2/4] ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in PTL match table
Date: Tue,  8 Jul 2025 16:00:27 +0800
Message-ID: <20250708080030.1257790-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708080030.1257790-1-yung-chuan.liao@linux.intel.com>
References: <20250708080030.1257790-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Balamurugan C <balamurugan.c@intel.com>

Adding HDMI-In capture via I2S feature support in PTL platform.

Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_es8336.c               | 10 ++++++++++
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 12 ++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index a0b3679b17b4..1211a2b8a2a2 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -826,6 +826,16 @@ static const struct platform_device_id board_ids[] = {
 					SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK |
 					SOF_ES8336_JD_INVERTED),
 	},
+	{
+		.name = "ptl_es83x6_c1_h02",
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
diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index ff4f2fbf9271..67f1091483dc 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -26,6 +26,11 @@ static const struct snd_soc_acpi_codecs ptl_essx_83x6 = {
 	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
 };
 
+static const struct snd_soc_acpi_codecs ptl_lt6911_hdmi = {
+	.num_codecs = 1,
+	.codecs = {"INTC10B0"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_machines[] = {
 	{
 		.comp_ids = &ptl_rt5682_rt5682s_hp,
@@ -34,6 +39,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_machines[] = {
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
 					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
 	},
+	{
+		.comp_ids = &ptl_essx_83x6,
+		.drv_name = "ptl_es83x6_c1_h02",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &ptl_lt6911_hdmi,
+		.sof_tplg_filename = "sof-ptl-es83x6-ssp1-hdmi-ssp02.tplg",
+	},
 	{
 		.comp_ids = &ptl_essx_83x6,
 		.drv_name = "sof-essx8336",
-- 
2.43.0

