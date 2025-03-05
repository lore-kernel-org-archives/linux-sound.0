Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6992063FC
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 13:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741182936; cv=none; b=cnDRqOkLj13z78GWbgbdnLivq5eGxrwTidwxEI9GmI58cFOp175kWr4xPCTm338mewAJDlWwWzLjyDLDFdy6u8to/hDnD/7V/d+y/zT6yHBGXCEc0M90IhnTGbs8YcWEkQBXe9fQQUYh8FHpMZHIG0doyOhJkwG5HHz/PjAqj0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741182936; c=relaxed/simple;
	bh=PgIe0OHMvej1aW9ydf/g1crjITmFEAOjnz6668BopG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VKNKHZPKAFrPUytKxWf+rCQdz9Z+it2Y/QuhdT2334JfXsDKXgd5Yq7PP9NCob2TxVeQNWym8QyfLSH2uO8GosLrIu4y2dhGkh2HznnRnZRCSMF3xku/wyhvamH/6/j9ZK1ZtxkZhDQi/wtJoRd1HGPSqVOepirtKytkYeKLX+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mx53rTJu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mx53rTJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741182934; x=1772718934;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PgIe0OHMvej1aW9ydf/g1crjITmFEAOjnz6668BopG8=;
  b=mx53rTJu5e6vxNXmkPxPNkSoZQS4KaXs6j2iuq62xOFvX6F9XeD10uZs
   AMfa/05U0zI1Sr8xrCu0xUUaxw5akIujmHWA8/LYTwEHL/nKAZj8vGI5S
   wmvMulJ/obVRvUgYJyChm+/cQ/ZAFhtB8pLAe8eYNkPY5u6FHGoLQyzP0
   JFT/DaohdrAJKPx5uSOpoURArcgQJ5RvYlxgMtz8V+Q6x6wtt3YcBBdBK
   6qvjOkb8sewUEjRC3bAYumlBJbuDRmeCFpX8tezQFTFB760eynt5p39ZI
   dAZP6rfdDtaMrzfGmjYnNdG3qiI+2AJ0fSgrRxLiAumC1ewOcaQlCHBXW
   w==;
X-CSE-ConnectionGUID: sDovliX5R1GfvGkCtlbkGQ==
X-CSE-MsgGUID: GReW/XXSQ0SY3jHRUiv2rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59558112"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="59558112"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:55:34 -0800
X-CSE-ConnectionGUID: sW0jLC52SJOheLWu0CzdwQ==
X-CSE-MsgGUID: jPCouVnGQAygkI2DWUrnlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="118847209"
Received: from bvivekan-mobl1.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.175.91])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:55:31 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 8/9] ASoC: Intel: soc-acpi-intel-lnl-match: add cs42l43 6x cs35l56 support
Date: Wed,  5 Mar 2025 21:54:42 +0800
Message-ID: <20250305135443.201884-9-yung-chuan.liao@linux.intel.com>
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

This add a match for cs42l43 on sdw link 2, 3 cs35l56 on sdw link 1 and
3. All speakers are aggregated.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 .../intel/common/soc-acpi-intel-lnl-match.c   | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index 1e24e969ad15..e04f6de746eb 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -37,6 +37,13 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 	.group_id = 1,
 };
 
+static const struct snd_soc_acpi_endpoint spk_1_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 1,
+	.group_id = 1,
+};
+
 static const struct snd_soc_acpi_endpoint spk_2_endpoint = {
 	.num = 0,
 	.aggregated = 1,
@@ -51,6 +58,27 @@ static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
 	.group_id = 1,
 };
 
+static const struct snd_soc_acpi_endpoint spk_4_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 4,
+	.group_id = 1,
+};
+
+static const struct snd_soc_acpi_endpoint spk_5_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 5,
+	.group_id = 1,
+};
+
+static const struct snd_soc_acpi_endpoint spk_6_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 6,
+	.group_id = 1,
+};
+
 static const struct snd_soc_acpi_endpoint rt712_endpoints[] = {
 	{
 		.num = 0,
@@ -159,6 +187,33 @@ static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
 	},
 };
 
+static const struct snd_soc_acpi_endpoint cs42l43_amp_spkagg_endpoints[] = {
+	{ /* Jack Playback Endpoint */
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* DMIC Capture Endpoint */
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Jack Capture Endpoint */
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Speaker Playback Endpoint */
+		.num = 3,
+		.aggregated = 1,
+		.group_position = 0,
+		.group_id = 1,
+	},
+};
+
 static const struct snd_soc_acpi_adr_device cs35l56_2_l_adr[] = {
 	{
 		.adr = 0x00023001FA355601ull,
@@ -204,6 +259,48 @@ static const struct snd_soc_acpi_adr_device cs35l56_3_lr_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device cs35l56_1_3amp_adr[] = {
+	{
+		.adr = 0x00013001fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_1_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00013101fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_2_endpoint,
+		.name_prefix = "AMP2"
+	},
+	{
+		.adr = 0x00013201fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_3_endpoint,
+		.name_prefix = "AMP3"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_3_3amp_adr[] = {
+	{
+		.adr = 0x00033301fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_4_endpoint,
+		.name_prefix = "AMP4"
+	},
+	{
+		.adr = 0x00033401fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_5_endpoint,
+		.name_prefix = "AMP5"
+	},
+	{
+		.adr = 0x00033501fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_6_endpoint,
+		.name_prefix = "AMP6"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
 	{
 		.adr = 0x00003001FA424301ull,
@@ -213,6 +310,15 @@ static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device cs42l43_2_adr[] = {
+	{
+		.adr = 0x00023001fa424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_amp_spkagg_endpoints),
+		.endpoints = cs42l43_amp_spkagg_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	{
 		.adr = 0x000030025D071101ull,
@@ -408,6 +514,25 @@ static const struct snd_soc_acpi_link_adr lnl_cs42l43_l0_cs35l56_l23[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr lnl_cs42l43_l2_cs35l56x6_l13[] = {
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(cs42l43_2_adr),
+		.adr_d = cs42l43_2_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs35l56_1_3amp_adr),
+		.adr_d = cs35l56_1_3amp_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(cs35l56_3_3amp_adr),
+		.adr_d = cs35l56_3_3amp_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr lnl_rvp[] = {
 	{
 		.mask = BIT(0),
@@ -570,6 +695,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-cs42l43-l0-cs35l56-l23.tplg",
 	},
+	{
+		.link_mask = BIT(1) | BIT(2) | BIT(3),
+		.links = lnl_cs42l43_l2_cs35l56x6_l13,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-lnl-cs42l43-l2-cs35l56x6-l13.tplg",
+	},
 	{
 		.link_mask = BIT(0) | BIT(3),
 		.links = lnl_cs42l43_l0_cs35l56_l3,
-- 
2.43.0

