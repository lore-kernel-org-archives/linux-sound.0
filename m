Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D771DD88F
	for <linux-sound@vger.kernel.org>; Fri,  6 Dec 2024 07:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733471965; cv=none; b=h/tfN8aRjXgIr7rFXDht+eLAS2yc1qtGjbAm7/fwO7Dh5u7Gvz2nACh0vPeTKWbE9WXejm4GklCXZAPXKQFXWPWv5x80QmPZpmKudxuUjExeiXCyJjL3dxCx1rS5Ecr+QaqCO5xEFEeDx83zPKgYFupIaCSj5wO6m9S0RL9mWDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733471965; c=relaxed/simple;
	bh=alpJMwWkXrz229ORacG1w1icTT2OVJ5ZU2fPOTCexZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NCIY6V9kch12h4532/djUw4nzLdHNxJhEOO15FqBB3z7jTIFxND+clBv9RTO5s/Bam/ffMEPWuX1xgEkwCJMaRMZf4T0YlJqlYrQFxnWZ49zhmHCKIcoScshJQJncrwyL4NeFjCKbwJYqpdYiFfHAGnL2YrZzRDham9l7VXSW6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/rZsWCZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/rZsWCZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733471964; x=1765007964;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=alpJMwWkXrz229ORacG1w1icTT2OVJ5ZU2fPOTCexZM=;
  b=h/rZsWCZF5rV02aZwe4cu3brVera30j4gLxNV9W+7jnsfrJbodjnx67V
   5IKJ/77j2ZFizwdLoAVtnfYUVo4XUiojn6TRhQSaz/eXRVW4SWMkuZFcG
   pbMW0G2Smqwdjkkg0OqVT96BSX39fxjauYhb3ag3PHOiSHkJO55VGwyQv
   DY5ahc+lAnzaNLfdZz5UjnhSYS6csPvz6h0yczPnmRBtSEn+vy+W3T/3a
   0Wxfl6G/cEXDRKycvs8rhdQ//Tyxhm5EFSkU/5FK/nUp3+rzMVey5q138
   +bywylLZ3fxSxjxlqtiX+R/Wc0ghnrllmGxRmJk1j5fvE3V5/eAWAj1On
   w==;
X-CSE-ConnectionGUID: 0mEtF1MMS5Wo6NyYvzM76w==
X-CSE-MsgGUID: 87dpFpEAS4+X6+UKjBDVFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45192798"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="45192798"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:24 -0800
X-CSE-ConnectionGUID: kTeGUkBcS5aD3snjghFaMQ==
X-CSE-MsgGUID: HogZgMSFR6e6D26QrWx8Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94144447"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.179])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:22 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 07/10] ASoC: Intel: soc-acpi-intel-lnl-match: add rt713_vb_l2_rt1320_l13 support
Date: Fri,  6 Dec 2024 15:59:00 +0800
Message-ID: <20241206075903.195730-8-yung-chuan.liao@linux.intel.com>
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
 .../intel/common/soc-acpi-intel-lnl-match.c   | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index 98a9c36d7a4c..0b4a9c27c47e 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -91,6 +91,23 @@ static const struct snd_soc_acpi_endpoint rt722_endpoints[] = {
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
@@ -295,6 +312,24 @@ static const struct snd_soc_acpi_adr_device rt1320_1_group1_adr[] = {
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
 static const struct snd_soc_acpi_adr_device rt713_0_adr[] = {
 	{
 		.adr = 0x000031025D071301ull,
@@ -304,6 +339,15 @@ static const struct snd_soc_acpi_adr_device rt713_0_adr[] = {
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
 static const struct snd_soc_acpi_adr_device rt714_0_adr[] = {
 	{
 		.adr = 0x000030025D071401ull,
@@ -453,6 +497,25 @@ static const struct snd_soc_acpi_link_adr lnl_sdw_rt713_l0_rt1318_l1[] = {
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
@@ -550,6 +613,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
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
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_lnl_sdw_machines);
-- 
2.43.0

