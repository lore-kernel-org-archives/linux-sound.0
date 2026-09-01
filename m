Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1797933CEBD
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 01:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788225606; cv=none; b=ly+ONAF3BJcfErMqjRgcwAadwZqTReuiYiigBb2XlJhTC+vyyMuLkWUz2vVBeV+Edh3l1kbcnoEbUj5uSa2RGaAV2+011Nuxr8MZ2U9qgedDmBCEjLxyJmt8XA7q98YcqP14h35D3Zt6x8P5PiSaecGjSPcPPxYRg+JQiytCy6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788225606; c=relaxed/simple;
	bh=mAIMP6nA2c/ZiwKjUBA/C/FAAUEHLMv40SELD+CyikE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lFmmy8/W0fb2sa9q6htJTLYTCltu5Z2Cqh7MvKdJoWi67OW6mFr2fIrSQ0oZ1vsFxeEJIAezJlB40F2zqlG0I2IWFha8F9GESR4fdh62qFYu3j0m9ldqI8lVllQvcMHga1un8bdXTcUTl7iT/x9bpK+OsTx8IxviSYTQL5HJ9ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dN2DoiMy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dN2DoiMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788225604; x=1819761604;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mAIMP6nA2c/ZiwKjUBA/C/FAAUEHLMv40SELD+CyikE=;
  b=dN2DoiMydXysHCWqxC0W75O4u7dBQYpzJnuQkUReElOUfA8oj5QdrzGD
   T6iGD1qJUMiLmwcPTwyrs9dQKdVrGBQWnFT7AW+3EdlXTz3bnsuXdNo+Z
   nJt4iz8FYm/EIIaLYtBbm+AXVgBdwXQyvdAN+XoDePFcMFR5OLLBe0Nri
   LqV2EkxVO+V1Eobh1lZGYWYc8kd0wsswXUO8a1Sryiap+8pqXbuiOGP/Y
   +2E7L0xS+IXPxiRDrMw4HLQEDUiUMqFQ1s3k/NalQF3awPuvZy5Sthg0V
   OIexXumF/fc8s9No/KFYUV8Szg4IpOxS/HvO5mjDVtpxdAf+mVVXhmpYF
   A==;
X-CSE-ConnectionGUID: F48AC91NQqqqoNwhexou8w==
X-CSE-MsgGUID: iHGnUnTqTkSbbt6TpSq6Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="114180503"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="114180503"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 18:20:03 -0700
X-CSE-ConnectionGUID: nvBPjHzRQ2mBwJ0ERWdGjw==
X-CSE-MsgGUID: m/f4wVUqSR6iFck1Fj4q7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="269527927"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 18:20:02 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	jairaj.arava@intel.com
Subject: [PATCH] ASoC: Intel: sof_rt5682: Add support for nvl_max98360a_rt5682
Date: Tue,  1 Sep 2026 09:19:51 +0800
Message-ID: <20260901011951.230315-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jairaj Arava <jairaj.arava@intel.com>

This patch adds the driver data for rt5682 codec on SSP0 and
max98360a speaker amplifiers on SSP1 for NVL platform.

The existing one is not aligned with PTL.
Hence, changed it to align with the working changes in PTL.

Signed-off-by: Jairaj Arava <jairaj.arava@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               | 8 ++++++++
 sound/soc/intel/common/soc-acpi-intel-nvl-match.c | 8 ++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 7899f7ffd99b..88cf5c0ab2e3 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -908,6 +908,14 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_PORT_BT_OFFLOAD(2) |
 					SOF_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.name = "nvl_rt5682_def",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1) |
+					SOF_SSP_PORT_BT_OFFLOAD(2) |
+					SOF_BT_OFFLOAD_PRESENT),
+	},
 	{
 		.name = "ptl_rt5682_c1_h02",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
diff --git a/sound/soc/intel/common/soc-acpi-intel-nvl-match.c b/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
index 8f6e987c791e..4a67f6b72fa5 100644
--- a/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
@@ -51,10 +51,10 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_nvl_machines[] = {
 	},
 	{
 		.comp_ids = &nvl_rt5682_rt5682s_hp,
-		.drv_name = "sof_rt5682",
-		.sof_tplg_filename = "sof-nvl-rt5682", /* the tplg suffix is added at run time */
-		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
-					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB,
+		.drv_name = "nvl_rt5682_def",
+		.sof_tplg_filename = "sof-nvl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
 	},
 	/* place amp/hdmi-in only boards in the end of table */
 	{
-- 
2.43.0

