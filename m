Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C90144C66A
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069017; cv=none; b=vBaG9rHHH/rOYMoYs3R21rsdmyqoS0fldc9KEQOBsdeTr5C0g2T02EqtFKDYOiKzbaBmhHfy4xlhGBoSQbDn2O7YEXN9LSAZOYVurjSFR3C5F/WWqGdSdP0Oco+UhFrSyYNzGr3BFqHXWeneNG6TD9pamwnIt6IxtJn7+wVzRxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069017; c=relaxed/simple;
	bh=EV2Ge0bkGe7G93vwDJRvLD//Gzh8pqnIcKCjRbNs3K4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dr2zh8uI7h0RkBlfGIB+Egek7ttp4TuIWFOo7bHh3VI+FKVmcJ419KtvMHztXgwe+RV97tGJH0KYHOs2DNPtYfeDStdL4IP9ZFU5c0l///YbbbfOGXPdas2R7rKG3FegP00Nmy/8dqATNXLoxjoUMc+ANT1X7PZFXC33MAJ2eJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFGFoMSN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFGFoMSN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790069016; x=1821605016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EV2Ge0bkGe7G93vwDJRvLD//Gzh8pqnIcKCjRbNs3K4=;
  b=FFGFoMSNM2KfgeDjDS6U3vR5GBRXbWKW0nzUxlHZc6NH2C6hmepKZjFJ
   rpAakxqMl9FQJjC/p8dfZju+//CEFg7LUynTJqZlenOgGe9a6XHdjMpmZ
   8+YC3l3ryx1m3cernHTLyFGVq2R0qLzKX4/ckTWrnt1MhtEQocedFY2Fw
   OelntOgJkOPpVk6oKPdaKUkbPTBeqNI6J0T2mQbQd3jvBjN/C088hy/aI
   2H5EVOgJoCdVx5FUZG/zBCnW/cZirxh+UcbKOXM/Irn7Sl/b18h3K58wX
   xBbYZlYTswOAP4jDqGKnQ16QUyJIiLcU9zl113S827Gf9oMivFxqK1Qsk
   Q==;
X-CSE-ConnectionGUID: KrR1fDieQyeSgIQ86F/+JQ==
X-CSE-MsgGUID: ahuHDNdeTNqYOl4OnaWHOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89576763"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="89576763"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:23:36 -0700
X-CSE-ConnectionGUID: tlZwRSaXR1WeuyvP+W4kdg==
X-CSE-MsgGUID: 8ZB6D+EhTNeMVx5Nr56+cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="277837574"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:23:35 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 7/7] ASoC: soc-acpi-intel-ptl-match: I2S machines: use function topology
Date: Tue, 22 Sep 2026 17:23:16 +0800
Message-ID: <20260922092316.2296039-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922092316.2296039-1-yung-chuan.liao@linux.intel.com>
References: <20260922092316.2296039-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use sof_i2s_get_tplg_files() for SOF es83x6 machines.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index dd84e97836c9..0ce51c44bfe6 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -51,12 +51,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_machines[] = {
 		.drv_name = "ptl_es83x6_c1_h02",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &ptl_lt6911_hdmi,
+		.get_function_tplg_files = sof_i2s_get_tplg_files,
 		.sof_tplg_filename = "sof-ptl-es83x6-ssp1-hdmi-ssp02.tplg",
 	},
 	{
 		.comp_ids = &ptl_essx_83x6,
 		.drv_name = "sof-essx8336",
 		.sof_tplg_filename = "sof-ptl-es8336", /* the tplg suffix is added at run time */
+		.get_function_tplg_files = sof_i2s_get_tplg_files,
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
@@ -65,6 +67,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_machines[] = {
 	{
 		.id = "INTC10B0",
 		.drv_name = "ptl_lt6911_hdmi_ssp",
+		.get_function_tplg_files = sof_i2s_get_tplg_files,
 		.sof_tplg_filename = "sof-ptl-hdmi-ssp02.tplg",
 	},
 	{},
-- 
2.43.0

