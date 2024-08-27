Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF041C460D
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 12:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761980; cv=none; b=lDQz9Zh//J9at+nKD7c+cu9w6akyfUtbB9mSX23pnyTt7N2nYSCbniHIVaaw5X3LTgs9lEClb7ATEshMF2+kyTKgedmNZ1JZo5hxzpUbdvMXia6QO5Vlep8sHpL0keKaS0n65N2RkK0cKtruiYiJa7QasF/pwRpmlRFgLYXZXto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761980; c=relaxed/simple;
	bh=PxL0aMKSvwXL//qeHZymFfYwo3xE8toXcHBVq72XSEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PofEkWMXtvDZYyewq/FhZOhXtQch37xj41Ozd8bvLSUs9xyjuTO57as0seZheGwVHCrTmriNARizC8+ygE7eeBDHS2OeBiOZ3zvPqu9/K+EzAIGuFqBrtCX1mdwxPbfQqe+tqygkFCeIZolDOk2wkmn4zqtMCxh09j5wAe6xH3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrBLw5IK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrBLw5IK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724761978; x=1756297978;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PxL0aMKSvwXL//qeHZymFfYwo3xE8toXcHBVq72XSEQ=;
  b=nrBLw5IKUa3qJpUI1El8anDJXQDD/Gsjo2Q9i1RqjKGqWR3a09QsHlo9
   wS+xOKAGP3o8+zvUWrk5zn7Tzk7IL0tkbyxnnrkL9mpFGLbt8HgloT+XJ
   CCYRJdIP0PkOmSYm/3FBSZywzr9qw3jksdOA/m4Ih2hDCubjGSnGffcYi
   wG94zowUlSoMIF6/aJTclljCEp8LlnOm7WBpWWukX6Cr1tg4P/fNcTf/b
   nj2sdEOtMXLYr6xfAogmilOs1/JYlLzrrHPZh+YWTZUi4DXPB01ogMJZQ
   KeNd4tPDLp/0DLs1xOb3NNpClHlc4wj775LhmvlatmBVrhJaAoSs6HB1v
   Q==;
X-CSE-ConnectionGUID: 9bw22gxTQYqQjz55K/Tn+A==
X-CSE-MsgGUID: 43pTvnVARFOfwTWsX8KA/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13235519"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="13235519"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:57 -0700
X-CSE-ConnectionGUID: cuHP9bCQQnaqq3SwPkod9g==
X-CSE-MsgGUID: 7QhAf8jtRhG7r1nTiiIRuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="62676807"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:55 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 11/17] ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in ARL match table
Date: Tue, 27 Aug 2024 20:32:09 +0800
Message-ID: <20240827123215.258859-12-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
References: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Balamurugan C <balamurugan.c@intel.com>

Adding HDMI-In capture via I2S feature support in ARL platform.

Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_es8336.c               | 10 ++++++++++
 sound/soc/intel/common/soc-acpi-intel-arl-match.c | 12 ++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index b45d0501f109..578271b4230a 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -818,6 +818,16 @@ static const struct platform_device_id board_ids[] = {
 					SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK |
 					SOF_ES8336_JD_INVERTED),
 	},
+	{
+		.name = "arl_es83x6_c1_h02",
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
diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index 304f974dc960..8f69d61ea39c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -100,7 +100,19 @@ static const struct snd_soc_acpi_codecs arl_essx_83x6 = {
 	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
 };
 
+static const struct snd_soc_acpi_codecs arl_lt6911_hdmi = {
+	.num_codecs = 1,
+	.codecs = {"INTC10B0"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_machines[] = {
+	{
+		.comp_ids = &arl_essx_83x6,
+		.drv_name = "arl_es83x6_c1_h02",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &arl_lt6911_hdmi,
+		.sof_tplg_filename = "sof-arl-es83x6-ssp1-hdmi-ssp02.tplg",
+	},
 	{
 		.comp_ids = &arl_essx_83x6,
 		.drv_name = "sof-essx8336",
-- 
2.43.0

