Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAF614D6EF
	for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 03:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729048041; cv=none; b=INgqKBKt1PWZs++2h8NPY8LwZYsYaeDKffYBFMHcbFtjVT2eKVRCgxrDXylNweZqjv8EzDuY+AE7AbjN4Ha+wcNgI4wr0fG5mi2fcgs6PmssW19mFIoqrKdg2KDEVV5DK4CV2S7vYvravP3QzsniCEyoz+HiKnbSVmkJleTajJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729048041; c=relaxed/simple;
	bh=rzTIsV5b9JI46LHBw7eATx3p3hSfW8GFdc0mhNlaQdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VGdSAjtL4+IM2x2ookqG7ZuhwmLNwKwGnW8/bpfZ7mLIw7tlGy2WSe0v9q04KhIisEhWZ0lL1QREYyfJCvc3VDI1PybC/POnW0RClICiiRnYBp98nwGAwMetNhV2e8zbFybOcW9Rl9mqAxaewMn53GsLLgQLKXN8LY1V4/7Rywc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iW+H+EmK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iW+H+EmK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729048039; x=1760584039;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rzTIsV5b9JI46LHBw7eATx3p3hSfW8GFdc0mhNlaQdE=;
  b=iW+H+EmKhOVDhQzA37aEwrDBX7bWkDHPNF8GgsGTYyEzddjA3ss+egvy
   HvPgrbD+A8ALfCBWvXieFZYD4cnQDSndbMpCiZXgQQAHxJsKkoKGO/3VH
   e/L5ZJ3BjLICR5Se8pp+T/fY3D7rnEl/o+nMtJdxrU7906YbG46wPe6Dr
   4UzDK6i+d5fWRRKwB2bzHPFsCBp1gsEs1E4SPLGAHlcSnuWo2Ov7tZsGC
   OW3XwQD9swx7Bf0smLbP2lBP9hKTz50kFKXlU5fB/6+r24zmRUOIhN1TG
   jJYN0thLprZE+jA0z4Pmj148L2Bky6BiAUsgxUoY+ZLsFgCnIfzGKhHB+
   A==;
X-CSE-ConnectionGUID: Dsku4eFrTaavmj3zZmlWNA==
X-CSE-MsgGUID: cnWy/CC0SnKCzln0Ir0+OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39112259"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="39112259"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 20:07:18 -0700
X-CSE-ConnectionGUID: P/EBjho/S4q+x3xg1xWy0w==
X-CSE-MsgGUID: ZHoyolvyS82lN2hh8iI3kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="78927911"
Received: from cvapit-mobl1.ger.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.236])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 20:07:16 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH] ASoC: Intel: soc-acpi: lnl: Add match entry for TM2 laptops
Date: Wed, 16 Oct 2024 11:07:03 +0800
Message-ID: <20241016030703.13669-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Derek Fang <derek.fang@realtek.com>

Add a new match table entry on Lunarlake for the TM2 laptops
with rt713 and rt1318.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-lnl-match.c   | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index 3c4e0c7ca8ee..094ed4b27cb0 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -225,6 +225,15 @@ static const struct snd_soc_acpi_adr_device rt1316_3_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1318_1_adr[] = {
+	{
+		.adr = 0x000133025D131801ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt1318-1"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1318_1_group1_adr[] = {
 	{
 		.adr = 0x000130025D131801ull,
@@ -243,6 +252,15 @@ static const struct snd_soc_acpi_adr_device rt1318_2_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt713_0_adr[] = {
+	{
+		.adr = 0x000031025D071301ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt713"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt714_0_adr[] = {
 	{
 		.adr = 0x000030025D071401ull,
@@ -378,6 +396,20 @@ static const struct snd_soc_acpi_link_adr lnl_sdw_rt1318_l12_rt714_l0[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr lnl_sdw_rt713_l0_rt1318_l1[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt713_0_adr),
+		.adr_d = rt713_0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1318_1_adr),
+		.adr_d = rt1318_1_adr,
+	},
+	{}
+};
+
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -447,6 +479,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-rt1318-l12-rt714-l0.tplg"
 	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = lnl_sdw_rt713_l0_rt1318_l1,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-lnl-rt713-l0-rt1318-l1.tplg"
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_lnl_sdw_machines);
-- 
2.43.0

