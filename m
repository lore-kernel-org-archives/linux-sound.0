Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41E71862A
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 09:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002844; cv=none; b=D/HzewBWRw+kEyo8jD5lEsY+TUTAHxOsf5PrzkdnQ4QYPUNgtt3v47cNme8CNkPKHkej4EJjgdU7PxMJehVTvSXv1yHE/SwIj2DBV/7+DdcSkgVEY97c7sFvcIdlOAe1mrXbNGFN+Yqq5T3LkwSadQP19tC45B0mSKn3kw7nlwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002844; c=relaxed/simple;
	bh=GU3q02Kk5k/tzn401ctstnQyyqCDAIoVkcct0sI9mKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gGabPqjj7StKdyWN+X4U2xy2TLd3MXUs8utwcb9WCJm86NY2bzR9wYg8t+2IZv+tzaTmEEYdjyQ7bkguQyiMINAGxaAFe96fqqhviCwq6TAutkbP7DP0ukoRYwzx/TmyfyKYYwmz2yPlgaRQ7pAnzktGzdxmeSbPry/p4Dggd7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HLyyy4uc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLyyy4uc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760002843; x=1791538843;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GU3q02Kk5k/tzn401ctstnQyyqCDAIoVkcct0sI9mKc=;
  b=HLyyy4ucUfMe3qmsLP+sAl5PapsM/dDs7Sc6anmcetO68DgnOybiea6t
   TCrI2qgCawAcUT3QJa8cYdLDNnUqt5j/aL24BX7sodBvVNPgHT3swUuo1
   359Zt/ONr0HOxMcHRbAjIDGcLcbCKpSyOJCHhHUjo/lOLWF/OBDTsIoS+
   vid8z6fN8SxNCzeElyB7pCnD7sIfb8qbzgV9ITUUVLrJJ+d5FMekrKCDR
   GEHB4Rxrng8QxiXFOAUmWuNcx6TQM8l2aIVtMaLKeiThdYEhsLVQ2RwIX
   gKL46EhD5V9CrgQFIrBWwONf0Kegxmel6bVFFlgP9Ddwn5h2+BC8k95pd
   Q==;
X-CSE-ConnectionGUID: 37ZKbLXNSG6vx6WJU8KWlA==
X-CSE-MsgGUID: oxhaDuVVQoeyy+ASZY9ABg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62113238"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="62113238"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:40:42 -0700
X-CSE-ConnectionGUID: xNds6onARaGBXTS2ZAKkhA==
X-CSE-MsgGUID: IGJx5ZQBRd6Rn0mSewoQNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="181437985"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:40:41 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 6/9] ASoC: SOF: add platform name into sof_intel_dsp_desc
Date: Thu,  9 Oct 2025 17:40:20 +0800
Message-ID: <20251009094023.3474895-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009094023.3474895-1-yung-chuan.liao@linux.intel.com>
References: <20251009094023.3474895-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform name will be used construct the topology name.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Simon Trimmer <simont@opensource.cirrus.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/apl.c  | 1 +
 sound/soc/sof/intel/cnl.c  | 2 ++
 sound/soc/sof/intel/icl.c  | 1 +
 sound/soc/sof/intel/lnl.c  | 1 +
 sound/soc/sof/intel/mtl.c  | 2 ++
 sound/soc/sof/intel/ptl.c  | 2 ++
 sound/soc/sof/intel/shim.h | 1 +
 sound/soc/sof/intel/skl.c  | 1 +
 sound/soc/sof/intel/tgl.c  | 4 ++++
 9 files changed, 15 insertions(+)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 76a92eaa1359..0c68ae41a8a8 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -118,4 +118,5 @@ const struct sof_intel_dsp_desc apl_chip_info = {
 	.power_down_dsp = hda_power_down_dsp,
 	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_1_5_PLUS,
+	.platform = "apl",
 };
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 385e5339f0a4..dfef908554b3 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -479,6 +479,7 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 	.power_down_dsp = hda_power_down_dsp,
 	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_1_8,
+	.platform = "cnl",
 };
 
 /*
@@ -515,5 +516,6 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 	.power_down_dsp = hda_power_down_dsp,
 	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_2_0,
+	.platform = "jsl",
 };
 EXPORT_SYMBOL_NS(jsl_chip_info, "SND_SOC_SOF_INTEL_CNL");
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index dad6bc72ad37..dbc5ad62258b 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -193,4 +193,5 @@ const struct sof_intel_dsp_desc icl_chip_info = {
 	.power_down_dsp = hda_power_down_dsp,
 	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_2_0,
+	.platform = "icl",
 };
diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index 2f3222040f98..c01ea7e731aa 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -183,6 +183,7 @@ const struct sof_intel_dsp_desc lnl_chip_info = {
 	.power_down_dsp = mtl_power_down_dsp,
 	.disable_interrupts = lnl_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_ACE_2_0,
+	.platform = "lnl",
 };
 
 MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_MTL");
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 2242c96bfa51..095dcf1a18e4 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -786,6 +786,7 @@ const struct sof_intel_dsp_desc mtl_chip_info = {
 	.power_down_dsp = mtl_power_down_dsp,
 	.disable_interrupts = mtl_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_ACE_1_0,
+	.platform = "mtl",
 };
 
 const struct sof_intel_dsp_desc arl_s_chip_info = {
@@ -814,4 +815,5 @@ const struct sof_intel_dsp_desc arl_s_chip_info = {
 	.power_down_dsp = mtl_power_down_dsp,
 	.disable_interrupts = mtl_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_ACE_1_0,
+	.platform = "arl",
 };
diff --git a/sound/soc/sof/intel/ptl.c b/sound/soc/sof/intel/ptl.c
index 4633cd01e7dd..c1db735237f8 100644
--- a/sound/soc/sof/intel/ptl.c
+++ b/sound/soc/sof/intel/ptl.c
@@ -125,6 +125,7 @@ const struct sof_intel_dsp_desc ptl_chip_info = {
 	.power_down_dsp = mtl_power_down_dsp,
 	.disable_interrupts = lnl_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_ACE_3_0,
+	.platform = "ptl",
 };
 
 const struct sof_intel_dsp_desc wcl_chip_info = {
@@ -149,6 +150,7 @@ const struct sof_intel_dsp_desc wcl_chip_info = {
 	.power_down_dsp = mtl_power_down_dsp,
 	.disable_interrupts = lnl_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_ACE_3_0,
+	.platform = "wcl",
 };
 
 MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_MTL");
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index d4372f0bff7e..dc6a93d05bfe 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -186,6 +186,7 @@ struct sof_intel_dsp_desc {
 	u32 sdw_alh_base;
 	u32 d0i3_offset;
 	u32 quirks;
+	const char *platform;
 	enum sof_intel_hw_ip_version hw_ip_version;
 	int (*read_sdw_lcount)(struct snd_sof_dev *sdev);
 	void (*enable_sdw_irq)(struct snd_sof_dev *sdev, bool enable);
diff --git a/sound/soc/sof/intel/skl.c b/sound/soc/sof/intel/skl.c
index 0696bce65e33..90a3c2e2334c 100644
--- a/sound/soc/sof/intel/skl.c
+++ b/sound/soc/sof/intel/skl.c
@@ -113,5 +113,6 @@ const struct sof_intel_dsp_desc skl_chip_info = {
 	.power_down_dsp = hda_power_down_dsp,
 	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_1_5,
+	.platform = "skl",
 };
 EXPORT_SYMBOL_NS(skl_chip_info, "SND_SOC_SOF_INTEL_HDA_COMMON");
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index df2d26b78ddc..e68bbe685ba3 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -162,6 +162,7 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	.power_down_dsp = hda_power_down_dsp,
 	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_2_5,
+	.platform = "tgl",
 };
 
 const struct sof_intel_dsp_desc tglh_chip_info = {
@@ -191,6 +192,7 @@ const struct sof_intel_dsp_desc tglh_chip_info = {
 	.power_down_dsp = hda_power_down_dsp,
 	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_2_5,
+	.platform = "tgl",
 };
 
 const struct sof_intel_dsp_desc ehl_chip_info = {
@@ -220,6 +222,7 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	.power_down_dsp = hda_power_down_dsp,
 	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_2_5,
+	.platform = "ehl",
 };
 
 const struct sof_intel_dsp_desc adls_chip_info = {
@@ -249,4 +252,5 @@ const struct sof_intel_dsp_desc adls_chip_info = {
 	.power_down_dsp = hda_power_down_dsp,
 	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_2_5,
+	.platform = "adl",
 };
-- 
2.43.0

