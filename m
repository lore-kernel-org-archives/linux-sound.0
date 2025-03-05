Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9A3245025
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 13:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741182940; cv=none; b=Yw2fcErsqDzrYNpc5HxubZU8x+GFpHKSvNWLF7H6Hf2ZnJQ9KzItarYzqznJI3Z1yXPBleN0KVm11KaDeWMidq9Nhdh+ueIre3qJEFQRfb3+FNACex3KaJNxWE32b4sAQNzU7TcyVV9fe794IIliXz3U/tGeDz6+qdpg8aSiFXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741182940; c=relaxed/simple;
	bh=DSoBmLrCDvKgqoTI2PsIYpYsvDv1jASp+t8DIiuprDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SnKd2m7Xr6uo8WyaamG2CbDaa+WnmhinWazU0msQTOb7WVGM9ZrlSSld/hCuqAkyk7Pc0DuVVw+jppuRXT27RXFqSCycI/7OnvFWlfFIJg3+RoS4IZZzrdkSMrkfnred8uqjjIDcV9XqgcQ2bhqTc8c28llcmn15A+YB/wJa6os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eh6MiR1e; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eh6MiR1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741182939; x=1772718939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DSoBmLrCDvKgqoTI2PsIYpYsvDv1jASp+t8DIiuprDM=;
  b=Eh6MiR1e70R6teJ9TgBZmONc+mItTAUrcue4OQFCaw/ZnrXyaFHKWQu8
   fYBpFgctXpOtqw+Ny8xd44uDozo8acFzKm7S8luPo4E1XCyshsoqRlsen
   4Ap/v1MaeOsc+L9z3l8QpyeQIv73u6jnOMx3ApvZGMJms3iAeT0uOl5b3
   enHrl8ZuYriTsONAtbnCnzr9o1NdXauh9KwW8mfL2egkxOHc0U0mp7Z8T
   XT4P1+J9TgCSFk2sa6dk+Ht1j0puSqjkhKUYwx+fz9P05Gy9eh8oZSphm
   cwDN6pf26woD0snmFqGpYcKbiIRgRzyJFsTGMD/pPumKAg1gMX4KcthfG
   g==;
X-CSE-ConnectionGUID: MmenaPPISmqOAJcnYPhWmg==
X-CSE-MsgGUID: XDWeJA6CQ/ecMX+6Gtz1Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59558116"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="59558116"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:55:38 -0800
X-CSE-ConnectionGUID: Pg6A7ewRR+y7B+RG5DQMsQ==
X-CSE-MsgGUID: rlQiJRaoRYaMpCI3oirqjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="118847222"
Received: from bvivekan-mobl1.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.175.91])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:55:35 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 9/9] ASoC: Intel: soc-acpi-intel-ptl-match: add cs42l43 6x cs35l56 support
Date: Wed,  5 Mar 2025 21:54:43 +0800
Message-ID: <20250305135443.201884-10-yung-chuan.liao@linux.intel.com>
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
 .../intel/common/soc-acpi-intel-ptl-match.c   | 145 ++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 28ee768efd57..a07526eb802b 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -50,6 +50,48 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 	.group_id = 1,
 };
 
+static const struct snd_soc_acpi_endpoint spk_1_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 1,
+	.group_id = 1,
+};
+
+static const struct snd_soc_acpi_endpoint spk_2_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 2,
+	.group_id = 1,
+};
+
+static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 3,
+	.group_id = 1,
+};
+
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
 /*
  * Multi-function codecs with three endpoints created for
  * headset, amp and dmic functions.
@@ -116,6 +158,84 @@ static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints_endpoints[]
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
+static const struct snd_soc_acpi_adr_device cs42l43_2_adr[] = {
+	{
+		.adr = 0x00023001fa424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_amp_spkagg_endpoints),
+		.endpoints = cs42l43_amp_spkagg_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
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
 static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	{
 		.adr = 0x000030025D071101ull,
@@ -251,6 +371,25 @@ static const struct snd_soc_acpi_adr_device rt1320_3_group2_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_link_adr ptl_cs42l43_l2_cs35l56x6_l13[] = {
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
 static const struct snd_soc_acpi_link_adr ptl_rt722_only[] = {
 	{
 		.mask = BIT(0),
@@ -374,6 +513,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt715-rt711-rt1308-mono.tplg",
 	},
+	{
+		.link_mask = BIT(1) | BIT(2) | BIT(3),
+		.links = ptl_cs42l43_l2_cs35l56x6_l13,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-cs42l43-l2-cs35l56x6-l13.tplg",
+	},
 	{
 		.link_mask = BIT(0),
 		.links = sdw_mockup_multi_func,
-- 
2.43.0

