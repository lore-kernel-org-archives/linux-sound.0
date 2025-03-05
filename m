Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9036243955
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 13:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741182910; cv=none; b=V0NKdT6/rAOFEdADXm0nORis3OKGaJGkiDlYjjou8kfTlaw3bWnODugXubiJis9WYU2N8UM+hk+++K41s27vPUH4QF1EPMaXmBOq7jOLHdK6cPtRbMV7DuQBF1L9QBWcxtr23aH9mPAE9brAIgSV2GwLKPT1Pmmcf973knSgNLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741182910; c=relaxed/simple;
	bh=+b3H6epFoTv3BlWDbh6+N3IdH3Y/bxCTwIBFJx4pRPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aH6AGsotoVxHAU5w/wz95uCP40MKydTvzsHucKzGQz9UQrr0K/ty9vKGfnzw/7qO5/pTMeoKYYZ/R1SHrH0cbXI7S2z/59GYTVa3SJyLKG0pyEGLEWM1fQU5cQ5igYa4ksSeIRf5+R9l0C7gG5Bpoc7noCbesIeRTRQZrC3Af8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxRTive9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxRTive9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741182908; x=1772718908;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+b3H6epFoTv3BlWDbh6+N3IdH3Y/bxCTwIBFJx4pRPQ=;
  b=mxRTive9SVEMryeZrvB0tTz213/UwDz0jLatHfiHbfhMHY3P5xtNx7UA
   hA8eeweyn1tkIGU5MRNBzb79ZWzpvZCebAt5+cbtIzAH+wEcqwr39FUTP
   ZMInuoJUdKS0SArY9UOCXl7ZjOXSyeJqfnDGZyNXxEUhnn5loUA/VJpuE
   YQnyMT3O+Uv85xbs8+wtMN0mz06LtBbVll7gnnbnz0V0vgyC4EINftOiV
   rNWrGWgNZ1817uMYW2sNAgmegbOQ3w9fQaRUSW9xA15Fy3m9zJx4KpiDC
   9rqSJtNnPOcEeDyca23asqh63xvWXSTH040PHPyf73U7hVk+rE64xynIV
   w==;
X-CSE-ConnectionGUID: U6ICKb85R2qDz0zMOvK0dw==
X-CSE-MsgGUID: 16MXviqqRI+23eZGaq5b8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59558069"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="59558069"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:55:08 -0800
X-CSE-ConnectionGUID: ez60qBpcSNKAyLy7s2yoZQ==
X-CSE-MsgGUID: 80Ka8IoeRmeAG6+i2Yq6mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="118847059"
Received: from bvivekan-mobl1.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.175.91])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:55:05 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 2/9] ASoC: Intel: soc-acpi-intel-ptl-match: add rt712_vb_l3_rt1320_l2 support
Date: Wed,  5 Mar 2025 21:54:36 +0800
Message-ID: <20250305135443.201884-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305135443.201884-1-yung-chuan.liao@linux.intel.com>
References: <20250305135443.201884-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Add rt712_vb on SDW link 3 and 1 rt1320 on SDW link 2 configuration
support.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index dd7993b76dee..8807acb92ecf 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -134,6 +134,15 @@ static const struct snd_soc_acpi_adr_device rt712_vb_2_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt712_vb_3_group1_adr[] = {
+	{
+		.adr = 0x000330025D071201ull,
+		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints_endpoints),
+		.endpoints = jack_amp_g1_dmic_endpoints_endpoints,
+		.name_prefix = "rt712"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt713_vb_2_adr[] = {
 	{
 		.adr = 0x000230025d071301ull,
@@ -206,6 +215,15 @@ static const struct snd_soc_acpi_adr_device rt1320_1_group2_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1320_2_group1_adr[] = {
+	{
+		.adr = 0x000230025D132001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1320-1"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1320_3_group2_adr[] = {
 	{
 		.adr = 0x000330025D132001ull,
@@ -284,6 +302,20 @@ static const struct snd_soc_acpi_link_adr ptl_sdw_rt712_vb_l2_rt1320_l1[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr ptl_sdw_rt712_vb_l3_rt1320_l2[] = {
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt712_vb_3_group1_adr),
+		.adr_d = rt712_vb_3_group1_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1320_2_group1_adr),
+		.adr_d = rt1320_2_group1_adr,
+	},
+	{}
+};
+
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -342,6 +374,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
 		.sof_tplg_filename = "sof-ptl-rt712-l2-rt1320-l1.tplg"
 	},
+	{
+		.link_mask = BIT(2) | BIT(3),
+		.links = ptl_sdw_rt712_vb_l3_rt1320_l2,
+		.drv_name = "sof_sdw",
+		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
+		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l2.tplg"
+	},
 	{
 		.link_mask = BIT(1) | BIT(2) | BIT(3),
 		.links = ptl_sdw_rt713_vb_l2_rt1320_l13,
-- 
2.43.0

