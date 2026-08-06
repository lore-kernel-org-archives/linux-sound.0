Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5961943786F
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 10:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013876; cv=none; b=f8m86oAPMC+RCABnBZMvNGS4XnfCFMTu8ZlPnmEgHn4iouffP/aHFm/Lw0oww7J09HbNgzHb/pfvS+TermmNecmaYel3BrpHFy/nDmVFlw3cCfPu1urivPcOPHsfBWq3NnskAZf8wLk0TAvttA+EYw2/bSzx537gSkFOQ05uVfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013876; c=relaxed/simple;
	bh=5ejNesO5WKrOxiPKWGoA6uaM8inomt8KqmP7veM+J0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DSvOzv98MiuUxGvCrOHKVsV3ytlzm0GMn0VblzLGRj/5PjkDMR5p+hwUEZ+YiEoCHRUSidnXciUSTRflViUBnHt3ESEOFrTfhzSN/o1FIDXj4q/lQMOBAJSveT4sjDcLjLZsv0Z0l/wWh8gH38MLwRzGIKbbahUsO/5MOyddbD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5PVOwKq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5PVOwKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786013875; x=1817549875;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5ejNesO5WKrOxiPKWGoA6uaM8inomt8KqmP7veM+J0g=;
  b=a5PVOwKqxnEcZ0knyUa664v5ZjBmi327gxr2X5rfxPOblSP0jdSJjqLr
   4OR4Yk9G4XGJXjru6s4u08nm8Y3xEYXE70ofwrhTGO1IEo87WbAUrCe5c
   RB2HeP9QjuNRTgIXEC6ATCzI76M/rAiVKeG1KLGy34pddbUJQGDAUBUmw
   iZ9Dn7ZDdSkSOFG192LB4r/OxI4fPwymH5nGLEkx9TFfZAfB5yOOqAC/V
   mxiz5Osl6GFN89yh8lo1GlZ1PxIpHk49KNeE3f/mTgXNk5Az5e9An9QRo
   2ROhQR5/GY8vSGCE8LBTWOV3rGAJyMCLhdskL84GxjuVCYLazefBGZKQd
   w==;
X-CSE-ConnectionGUID: zrRroZucRUW6UwTL04Lsyg==
X-CSE-MsgGUID: EZK4aTCWQyW+sSQCQcudrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="98114696"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="98114696"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 03:57:55 -0700
X-CSE-ConnectionGUID: 1l0NjO53SQSARNLRCvfatA==
X-CSE-MsgGUID: TGDL9hVHTh2PIBjlQkYrTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="285452213"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 03:57:54 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/2] ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for NVL.
Date: Thu,  6 Aug 2026 18:57:42 +0800
Message-ID: <20260806105742.2676322-3-yung-chuan.liao@linux.intel.com>
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

Added match table entry on nvl machines to support HDMI-In capture
with rt5682 I2S audio codec. also added the respective quirk
configuration in rt5682 machine driver.

Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               | 7 +++++++
 sound/soc/intel/common/soc-acpi-intel-nvl-match.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 649378957b20..7899f7ffd99b 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -915,6 +915,13 @@ static const struct platform_device_id board_ids[] = {
 					/* SSP 0 and SSP 2 are used for HDMI IN */
 					SOF_SSP_MASK_HDMI_CAPTURE(0x5)),
 	},
+	{
+		.name = "nvl_rt5682_c1_h02",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_SSP_PORT_CODEC(1) |
+					/* SSP 0 and SSP 2 are used for HDMI IN */
+					SOF_SSP_MASK_HDMI_CAPTURE(0x5)),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-nvl-match.c b/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
index 51bbae5ed8fc..4a6208f821eb 100644
--- a/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
@@ -42,6 +42,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_nvl_machines[] = {
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
+	{
+		.comp_ids = &nvl_rt5682_rt5682s_hp,
+		.drv_name = "nvl_rt5682_c1_h02",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &nvl_lt6911_hdmi,
+		.sof_tplg_filename = "sof-nvl-rt5682-ssp1-hdmi-ssp02.tplg",
+	},
 	{
 		.comp_ids = &nvl_rt5682_rt5682s_hp,
 		.drv_name = "sof_rt5682",
-- 
2.43.0

