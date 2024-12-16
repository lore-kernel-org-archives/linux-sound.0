Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852CC450F2
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 03:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734319657; cv=none; b=Jd6VNyTmZ0+M+fR83tZcwIMZKgXvvSSPwccVyYCvm1i7TzVe7YM5JBElyMszO+8xKbCs8CbShO2Ih4fUQvK3gOzENn5R2Y+I2j5uATdUqgetaiM/yHmbt06YOUq67n8MoLrYI1SM4XHkJekv6uOUxDHhVL84yMmdm5R6pCR0yyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734319657; c=relaxed/simple;
	bh=SHlOAcN/TPfF83am81UpEvCdm+mLxGnGS7lptONBaCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UcO+43GQjIsAy3tV0DdRXRJfT5hiZ10Feviw9yc0aKfKZUBn68x2wn6a9RuUdkFNfSN9n5ofuwwQPFLiaw5Uqwxvwmj4M9M01+99Orm10RRINk8chcbp5wjh5gl/tJ9dlL51O9KTsVzZFkQeSihZK8NTWNjG65gf4FsVxMPYbYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kr2PBZEH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kr2PBZEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734319655; x=1765855655;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SHlOAcN/TPfF83am81UpEvCdm+mLxGnGS7lptONBaCQ=;
  b=kr2PBZEHV6Y3kWw+GIC+3cZEOlo7F8KFbP06qSTa9P1o2hzJcmlJqrn8
   lQl65rb3BpHoUrQfjl/NIJnScMa1Y0IlRaj4tTeNnU+3l+zocOgltEbzG
   SZ6XoMnkAEbS3JL/d+SjXQ5pp4+LJ3DvNN1Y1fSuIb4ZrsE03EbSkP1rl
   CB5ryS3W91WrDBI2MaFH3d2CPGiOw+k9cLXxwg8TZG7MK0MwtWcebpsuV
   YnPNtxa4wi5T34U1n9T2gUCLWHEPg41nP8VlnaJkOnCypZCPlATINPVI3
   LcSiFBgclRYKk/JiMRVecKQGUTOO42yam8xHFxb90qNGDFF4SyQsYNWds
   A==;
X-CSE-ConnectionGUID: BTUkiQdZScqqLNFJpzLj2w==
X-CSE-MsgGUID: T1nvDZkpRQarq+eYWgQPpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34606105"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34606105"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 19:27:35 -0800
X-CSE-ConnectionGUID: 6ha3DUlpQlSGDJAq1U1zZQ==
X-CSE-MsgGUID: oya0+pkiSYWMwG2GKOfdeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="102100027"
Received: from spandruv-mobl4.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.238])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 19:27:33 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 3/3] ASoC: Intel: mtl-match: Add CDB35L56-EIGHT-C 8x CS35L56 without CS42L43
Date: Mon, 16 Dec 2024 11:27:21 +0800
Message-ID: <20241216032721.131227-4-yung-chuan.liao@linux.intel.com>
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

This adds a match entry for using all the amps on a CDB35L56-EIGHT-C board
without the CS42L43 codec. Configuration is:

  SDW0: 4x CS35L56 (OUT1, OUT2, OUT3, OUT4)
  SDW1: 4x CS35L56 (OUT5, OUT6, OUT7, OUT8)

Speaker playback and amp feedback are aggregated.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 35a2cf85140a..770e2194a283 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -539,6 +539,66 @@ static const struct snd_soc_acpi_endpoint cs35l56_3_fb_endpoints[] = {
 	},
 };
 
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
+	},
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
+	},
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
+	},
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
+	},
+};
+
 static const struct snd_soc_acpi_adr_device cs35l56_0_adr[] = {
 	{
 		.adr = 0x00003301FA355601ull,
@@ -584,6 +644,60 @@ static const struct snd_soc_acpi_adr_device cs35l56_2_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device cs35l56_0_fb_adr[] = {
+	{
+		.adr = 0x00003301FA355601ull,
+		.num_endpoints = ARRAY_SIZE(cs35l56_l_fb_endpoints),
+		.endpoints = cs35l56_l_fb_endpoints,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00003201FA355601ull,
+		.num_endpoints = ARRAY_SIZE(cs35l56_2_fb_endpoints),
+		.endpoints = cs35l56_2_fb_endpoints,
+		.name_prefix = "AMP2"
+	},
+	{
+		.adr = 0x00003101FA355601ull,
+		.num_endpoints = ARRAY_SIZE(cs35l56_4_fb_endpoints),
+		.endpoints = cs35l56_4_fb_endpoints,
+		.name_prefix = "AMP3"
+	},
+	{
+		.adr = 0x00003001FA355601ull,
+		.num_endpoints = ARRAY_SIZE(cs35l56_6_fb_endpoints),
+		.endpoints = cs35l56_6_fb_endpoints,
+		.name_prefix = "AMP4"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_1_fb_adr[] = {
+	{
+		.adr = 0x00013701FA355601ull,
+		.num_endpoints = ARRAY_SIZE(cs35l56_r_fb_endpoints),
+		.endpoints = cs35l56_r_fb_endpoints,
+		.name_prefix = "AMP8"
+	},
+	{
+		.adr = 0x00013601FA355601ull,
+		.num_endpoints = ARRAY_SIZE(cs35l56_3_fb_endpoints),
+		.endpoints = cs35l56_3_fb_endpoints,
+		.name_prefix = "AMP7"
+	},
+	{
+		.adr = 0x00013501FA355601ull,
+		.num_endpoints = ARRAY_SIZE(cs35l56_5_fb_endpoints),
+		.endpoints = cs35l56_5_fb_endpoints,
+		.name_prefix = "AMP6"
+	},
+	{
+		.adr = 0x00013401FA355601ull,
+		.num_endpoints = ARRAY_SIZE(cs35l56_7_fb_endpoints),
+		.endpoints = cs35l56_7_fb_endpoints,
+		.name_prefix = "AMP5"
+	},
+};
+
 static const struct snd_soc_acpi_adr_device cs35l56_2_r_adr[] = {
 	{
 		.adr = 0x00023201FA355601ull,
@@ -898,6 +1012,20 @@ static const struct snd_soc_acpi_link_adr cs42l43_link3_cs35l56_x4_link0_link1_s
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_cs35l56_x8_link0_link1_fb[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs35l56_1_fb_adr),
+		.adr_d = cs35l56_1_fb_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs35l56_0_fb_adr),
+		.adr_d = cs35l56_0_fb_adr,
+	},
+	{}
+};
+
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -986,6 +1114,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-cs42l43-l0-cs35l56-l12.tplg",
 	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = mtl_cs35l56_x8_link0_link1_fb,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-cs35l56-l01-fb8.tplg"
+	},
 	{
 		.link_mask = BIT(0),
 		.links = mtl_cs42l43_l0,
-- 
2.43.0

