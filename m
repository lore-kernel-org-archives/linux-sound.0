Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E014330E0CE
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 07:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426044; cv=none; b=JdquvrmM8KMVC6MBOoa2ODkA4VMcNYAHcE+gbIMMez5cMd3VE6KcRj/4FpdDAQIWtbfFmWEUTV8BvFHhKd9min1S7YL/zZiXt95Fb4LLxm4BTWfrLpjEn2rAVGlegQgfHTwyi+12djeZrGjhigENwWsfw1tAibbF5WniQRovCWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426044; c=relaxed/simple;
	bh=GU3q02Kk5k/tzn401ctstnQyyqCDAIoVkcct0sI9mKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G2qIuoErZcIeGoKyJONIHewFV6bCcbGWKN/2FbK7iZ3bfnFTsCUoYvXMtNLju/VC12mgH4DrvaxhoGb564tcAd7MuAVWfmCosA/rv+y+9ebL7BMk/JAP+o1E3pWk7UAVM5PasxQ7y/pdYK7j2Z8WDcS3SeMWfo/nAsU/z30P2oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fR9nItpm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fR9nItpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426043; x=1791962043;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GU3q02Kk5k/tzn401ctstnQyyqCDAIoVkcct0sI9mKc=;
  b=fR9nItpmlWYzy+wAsNUudsldbNPSt+vnir7OQKrhs0pFn5VAM720W1i7
   tQMoakEV7XetFf4JwcSZ/J4RsMq8Pxr6EBQo5ufHxXEM0IgLy/83Qj1uU
   k7rnhJLezpzZIHimOfTr01lra4WeHBl/BRauDMMJi2VISgyd39t05tRx3
   Gq8w/3RZt4Y3iSdokSjq+zsuAIXBjiOudvZg2ImOC3+GMnP/lPWIaohBh
   OKaWZD0l9vZJWiJ+OSrj+HJGECANl3bA0qr4Lu49mrBoo7QDUwfWCDUUw
   sZ9PH9oso4yzu7yDLxAtBWUtrFMcf41NbCkD/A9R6QRtmvf3zodn6Ok2Q
   g==;
X-CSE-ConnectionGUID: 8A0Bf4BiQoOZCMVQG9ZybQ==
X-CSE-MsgGUID: 66Stxr34Qai+sI2ZkgPe8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66233698"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="66233698"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:14:02 -0700
X-CSE-ConnectionGUID: HyvRqT9XSoaXI/y6OD50XA==
X-CSE-MsgGUID: BgZ+f750TyGljOXfz5z6cw==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:14:00 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	niranjan.hy@ti.com,
	sbinding@opensource.cirrus.com
Subject: [PATCH v2 6/9] ASoC: SOF: add platform name into sof_intel_dsp_desc
Date: Tue, 14 Oct 2025 15:13:32 +0800
Message-ID: <20251014071335.3844631-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014071335.3844631-1-yung-chuan.liao@linux.intel.com>
References: <20251014071335.3844631-1-yung-chuan.liao@linux.intel.com>
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

