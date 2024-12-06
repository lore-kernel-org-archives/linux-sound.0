Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619351DE3D9
	for <linux-sound@vger.kernel.org>; Fri,  6 Dec 2024 07:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733471967; cv=none; b=YY1twZTC3F0DUHON2uWyWZx23mfsJtzXf9fUXtuY+9mar4Pc8GcR/OCFlb1t4yHFd6qWBuiK3AKYejuQmVeKXvU7RB8ryyTB6wtvat5gLiwQ1jhZWP0odxguVzhA2V2YHpH5Q+vHLvvtloCI1S2SOnByJootbI6W2GmqFGIa+P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733471967; c=relaxed/simple;
	bh=OZWo5ztAMGckN1p4cTSiDgVfOM4xN1isEsRzK6nnsz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VDVzbT1APjbnnkijt6MSP8DZ36PipCL8tkXslwSMsn9Ob5F537JgGPQIkTVSaBni5CQoQN+R8+FaD529ozr1ngqAXnjHvaKQPFauTkJS2PfGQn0cIGQPoheiKygoxqC48rwyLrZbn0cErgEElKuTyw4g9dl91AVEfn066AXNHFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ftJJmoTj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ftJJmoTj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733471965; x=1765007965;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OZWo5ztAMGckN1p4cTSiDgVfOM4xN1isEsRzK6nnsz8=;
  b=ftJJmoTj5sql17Se/nmMQp5ue3w5ZBY2KteJV7AFNWlygLYIew5zUHSe
   rTXry+ijPY9dfKm7+awfBG/8PRh3+PqRMywMt/GvDRKpk8b7t8c/wp1sd
   rRM8B/LMnKiMB0kMFIft6anxRLFWk9P1V6v/L085TATU2kqF3beOHrpsl
   k6XUCaAjNcOfLV50Gnd6BpYl4rWZl3anIGhh9/Q0+LlgDA4CpnCMCXn6O
   maPBPmJop+2NQNv5zVc7jkt7m1xfDkRF4CVWdRvH2eQISSW/8ifC3FgVK
   OPIu5qiLP7PY8ZL+U2J0t2XHVMHTlnU/5qArKL0LylmrZGIOXNCk7LzHY
   w==;
X-CSE-ConnectionGUID: PK0BfACJRhq//jg9vA3XlA==
X-CSE-MsgGUID: UJd5XNZ0Tia8MPBmYHIFZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45192804"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="45192804"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:25 -0800
X-CSE-ConnectionGUID: hcNrblHgSMqD85WCbq8ZBQ==
X-CSE-MsgGUID: S2LN5XxLQFmljvpHu10YTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94144469"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.179])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:24 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 08/10] ASoC: Intel: soc-acpi-intel-ptl-match: add rt713_vb_l2_rt1320_l13 support
Date: Fri,  6 Dec 2024 15:59:01 +0800
Message-ID: <20241206075903.195730-9-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206075903.195730-1-yung-chuan.liao@linux.intel.com>
References: <20241206075903.195730-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add rt713_vb on SoundWire link 2 and rt1320 on SoundWire link 1 and 3
configuration support.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 573fae541db7..9eb4a43e3e7a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -36,6 +36,13 @@ static const struct snd_soc_acpi_endpoint single_endpoint = {
 	.group_id = 0,
 };
 
+static const struct snd_soc_acpi_endpoint spk_l_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 0,
+	.group_id = 1,
+};
+
 static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 	.num = 0,
 	.aggregated = 1,
@@ -68,6 +75,23 @@ static const struct snd_soc_acpi_endpoint rt_mf_endpoints[] = {
 	},
 };
 
+static const struct snd_soc_acpi_endpoint jack_dmic_endpoints[] = {
+	/* Jack Endpoint */
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	/* DMIC Endpoint */
+	{
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
 static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints_endpoints[] = {
 	/* Jack Endpoint */
 	{
@@ -110,6 +134,15 @@ static const struct snd_soc_acpi_adr_device rt712_vb_2_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt713_vb_2_adr[] = {
+	{
+		.adr = 0x000230025d071301ull,
+		.num_endpoints = ARRAY_SIZE(jack_dmic_endpoints),
+		.endpoints = jack_dmic_endpoints,
+		.name_prefix = "rt713"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt721_3_single_adr[] = {
 	{
 		.adr = 0x000330025d072101ull,
@@ -164,6 +197,24 @@ static const struct snd_soc_acpi_adr_device rt1320_1_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1320_1_group2_adr[] = {
+	{
+		.adr = 0x000130025D132001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1320-1"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1320_3_group2_adr[] = {
+	{
+		.adr = 0x000330025D132001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1320-2"
+	}
+};
+
 static const struct snd_soc_acpi_link_adr ptl_rt722_only[] = {
 	{
 		.mask = BIT(0),
@@ -200,6 +251,25 @@ static const struct snd_soc_acpi_link_adr ptl_rvp[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr lnl_sdw_rt713_vb_l2_rt1320_l13[] = {
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt713_vb_2_adr),
+		.adr_d = rt713_vb_2_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1320_1_group2_adr),
+		.adr_d = rt1320_1_group2_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1320_3_group2_adr),
+		.adr_d = rt1320_3_group2_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr lnl_sdw_rt712_vb_l2_rt1320_l1[] = {
 	{
 		.mask = BIT(2),
@@ -272,6 +342,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
 		.sof_tplg_filename = "sof-lnl-rt712-l2-rt1320-l1.tplg"
 	},
+	{
+		.link_mask = BIT(1) | BIT(2) | BIT(3),
+		.links = lnl_sdw_rt713_vb_l2_rt1320_l13,
+		.drv_name = "sof_sdw",
+		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
+		.sof_tplg_filename = "sof-lnl-rt713-l2-rt1320-l13.tplg"
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_sdw_machines);
-- 
2.43.0

