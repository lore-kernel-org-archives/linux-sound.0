Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D1E450F2
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 03:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734319654; cv=none; b=gbY7TkE0/cd17CnOM8Qs5/rOk5Uh0hFVQxe7fcBsCUpb5JPjmvSXxSI4F0Bubc1qKwwrhZmzTkWlTPq6vOed1fHLa+BGBmxwbaZVNght6cKzePzcfz/cR7OHeq2w8sE0HTfcbr7BOOcflAQ2q78cClO4blRwltGCPx1N02/DFeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734319654; c=relaxed/simple;
	bh=s5ToiBj6ifoJ0p4+T746HBqXZ5naOwbL7H9kz1lH5go=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LW2BbjYJl+r0qwcDU8ZUq35qW3dejUt6FX225cYj961wP5mBSKBw9ysa9jlpgUQhNaY2v7PWOtunkSy3oUCMJvMIwXc8U+5Fg6ZGhcPutZDhsQ7g/UZIj8nNEI0z6Rig0ce+IXQXrmWl7E6SeX2Yxqm+CRzwQbEZKQlq03YSv6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hz7Igo/P; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hz7Igo/P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734319653; x=1765855653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s5ToiBj6ifoJ0p4+T746HBqXZ5naOwbL7H9kz1lH5go=;
  b=hz7Igo/PO8GbUItC4mDLUPJ5F8a/ZpF/voRNTP6lt+xPZfOXswcrDkp4
   pwiEbpWaHaBiGpfOGK695f8efNaDC7r+W5Kr1/pKVb3q7nYnzRLnn09KT
   OEZ88fU3wFZ0rOuPr2/HNOVzbGZV1ACdhSAjUGHlM/ISoYI8LBdPeb47f
   B0MHTyi773hSsqU0ZZDFvb5ub6g5sd/SWy0569CbaerkmJQl9TFaa/hBL
   DPRVuBWencHCLVoqu4zYqOWDCWwAJsuXJ/wHjryrfDjlzALsttdyyo0+5
   2wBfTZoXDAP42QXIZgPD/WM+k51S4v6gSTtG2ee2hwxTNL4ilAY8J+pYe
   A==;
X-CSE-ConnectionGUID: ibvshKd8SxyC2fWcy8VMpA==
X-CSE-MsgGUID: Ov1IBwsWSVWaDPicXRwfzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34606096"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34606096"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 19:27:32 -0800
X-CSE-ConnectionGUID: f7Gznn6ORpWgp3DLlljDLA==
X-CSE-MsgGUID: 1PkroffcSBe9FxuTfvHR2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="102100018"
Received: from spandruv-mobl4.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.238])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 19:27:31 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 1/3] ASoC: Intel: tgl-match: Add entries for CS35L56 on CDB35L56-EIGHT-C
Date: Mon, 16 Dec 2024 11:27:19 +0800
Message-ID: <20241216032721.131227-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216032721.131227-1-yung-chuan.liao@linux.intel.com>
References: <20241216032721.131227-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Fitzgerald <rf@opensource.cirrus.com>

This adds match entries for the eight CS35L56 amps on the Cirrus Logic
CDB35L56-EIGHT-C board. Speaker playback and amp feedback are aggregated
across all amps on both SoundWire buses.

The mapping of SoundWire addresses to AMPn numbers matches the actual
order of amps on the EIGHT-C board. The SoundWire unique ID is in reverse
order for amps 1..4 on these boards, and the amp resets are paired
1+8, 2+7, 3+6, 4+5.

This then makes the entries from cs35l56_sdw_eight_1_4_fb_adr and
cs35l56_sdw_eight_5_8_fb_adr match the way the amp resets are paired on
the EIGHT-C board.

[0] = 1 + 8
[1] = 2 + 7
[3] = 3 + 6
[4] = 4 + 5

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-tgl-match.c   | 194 ++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 161ba532d270..6f8c06413665 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -536,6 +536,194 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_tgl_machines);
 
+static const struct snd_soc_acpi_endpoint cs35l56_l_fb_endpoints[] = {
+	{ /* Speaker Playback Endpoint */
+		.num = 0,
+		.aggregated = 1,
+		.group_position = 0,
+		.group_id = 1,
+	},
+	{ /* Feedback Capture Endpoint */
+		.num = 1,
+		.aggregated = 1,
+		.group_position = 0,
+		.group_id = 2,
+	},
+};
+
+static const struct snd_soc_acpi_endpoint cs35l56_r_fb_endpoints[] = {
+	{ /* Speaker Playback Endpoint */
+		.num = 0,
+		.aggregated = 1,
+		.group_position = 1,
+		.group_id = 1,
+	},
+	{ /* Feedback Capture Endpoint */
+		.num = 1,
+		.aggregated = 1,
+		.group_position = 1,
+		.group_id = 2,
+	},
+};
+
+static const struct snd_soc_acpi_endpoint cs35l56_2_fb_endpoints[] = {
+	{ /* Speaker Playback Endpoint */
+		.num = 0,
+		.aggregated = 1,
+		.group_position = 2,
+		.group_id = 1,
+	},
+	{ /* Feedback Capture Endpoint */
+		.num = 1,
+		.aggregated = 1,
+		.group_position = 2,
+		.group_id = 2,
+	},
+};
+
+static const struct snd_soc_acpi_endpoint cs35l56_3_fb_endpoints[] = {
+	{ /* Speaker Playback Endpoint */
+		.num = 0,
+		.aggregated = 1,
+		.group_position = 3,
+		.group_id = 1,
+	},
+	{ /* Feedback Capture Endpoint */
+		.num = 1,
+		.aggregated = 1,
+		.group_position = 3,
+		.group_id = 2,
+	},
+};
+
+static const struct snd_soc_acpi_endpoint cs35l56_4_fb_endpoints[] = {
+	{ /* Speaker Playback Endpoint */
+		.num = 0,
+		.aggregated = 1,
+		.group_position = 4,
+		.group_id = 1,
+	},
+	{ /* Feedback Capture Endpoint */
+		.num = 1,
+		.aggregated = 1,
+		.group_position = 4,
+		.group_id = 2,
+	}
+};
+
+static const struct snd_soc_acpi_endpoint cs35l56_5_fb_endpoints[] = {
+	{ /* Speaker Playback Endpoint */
+		.num = 0,
+		.aggregated = 1,
+		.group_position = 5,
+		.group_id = 1,
+	},
+	{ /* Feedback Capture Endpoint */
+		.num = 1,
+		.aggregated = 1,
+		.group_position = 5,
+		.group_id = 2,
+	}
+};
+
+static const struct snd_soc_acpi_endpoint cs35l56_6_fb_endpoints[] = {
+	{ /* Speaker Playback Endpoint */
+		.num = 0,
+		.aggregated = 1,
+		.group_position = 6,
+		.group_id = 1,
+	},
+	{ /* Feedback Capture Endpoint */
+		.num = 1,
+		.aggregated = 1,
+		.group_position = 6,
+		.group_id = 2,
+	}
+};
+
+static const struct snd_soc_acpi_endpoint cs35l56_7_fb_endpoints[] = {
+	{ /* Speaker Playback Endpoint */
+		.num = 0,
+		.aggregated = 1,
+		.group_position = 7,
+		.group_id = 1,
+	},
+	{ /* Feedback Capture Endpoint */
+		.num = 1,
+		.aggregated = 1,
+		.group_position = 7,
+		.group_id = 2,
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_sdw_eight_1_4_fb_adr[] = {
+	{
+		.adr = 0x00003301fa355601,
+		.num_endpoints = ARRAY_SIZE(cs35l56_l_fb_endpoints),
+		.endpoints = cs35l56_l_fb_endpoints,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00003201fa355601,
+		.num_endpoints = ARRAY_SIZE(cs35l56_2_fb_endpoints),
+		.endpoints = cs35l56_2_fb_endpoints,
+		.name_prefix = "AMP2"
+	},
+	{
+		.adr = 0x00003101fa355601,
+		.num_endpoints = ARRAY_SIZE(cs35l56_4_fb_endpoints),
+		.endpoints = cs35l56_4_fb_endpoints,
+		.name_prefix = "AMP3"
+	},
+	{
+		.adr = 0x00003001fa355601,
+		.num_endpoints = ARRAY_SIZE(cs35l56_6_fb_endpoints),
+		.endpoints = cs35l56_6_fb_endpoints,
+		.name_prefix = "AMP4"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_sdw_eight_5_8_fb_adr[] = {
+	{
+		.adr = 0x00013701fa355601,
+		.num_endpoints = ARRAY_SIZE(cs35l56_r_fb_endpoints),
+		.endpoints = cs35l56_r_fb_endpoints,
+		.name_prefix = "AMP8"
+	},
+	{
+		.adr = 0x00013601fa355601,
+		.num_endpoints = ARRAY_SIZE(cs35l56_3_fb_endpoints),
+		.endpoints = cs35l56_3_fb_endpoints,
+		.name_prefix = "AMP7"
+	},
+	{
+		.adr = 0x00013501fa355601,
+		.num_endpoints = ARRAY_SIZE(cs35l56_5_fb_endpoints),
+		.endpoints = cs35l56_5_fb_endpoints,
+		.name_prefix = "AMP6"
+	},
+	{
+		.adr = 0x00013401fa355601,
+		.num_endpoints = ARRAY_SIZE(cs35l56_7_fb_endpoints),
+		.endpoints = cs35l56_7_fb_endpoints,
+		.name_prefix = "AMP5"
+	},
+};
+
+static const struct snd_soc_acpi_link_adr up_extreme_cs35l56_sdw_eight[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs35l56_sdw_eight_5_8_fb_adr),
+		.adr_d = cs35l56_sdw_eight_5_8_fb_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs35l56_sdw_eight_1_4_fb_adr),
+		.adr_d = cs35l56_sdw_eight_1_4_fb_adr,
+	},
+	{}
+};
+
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -635,6 +823,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-tgl-rt711.tplg",
 	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = up_extreme_cs35l56_sdw_eight,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-tgl-cs35l56-l01-fb8.tplg"
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_tgl_sdw_machines);
-- 
2.43.0

