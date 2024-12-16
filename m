Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10B12F852
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 03:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734319655; cv=none; b=tNmw06ZJ9zhpAbQG/NlDQ9TlCKCB1DyLBcrWN2KtGSPNu4yv/Rd/v9S/L26ZrWMV1jT0/x4NcUICiTqSmSA8aiAu4hCQNE2khOpt3OaNo6vLcKD/P507ZrEYYLMf0U+JVpx2GxIOC53nGD/V1VGBzRbWQzGk6SFaeT1y28fKqBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734319655; c=relaxed/simple;
	bh=1rNVNj9g5DFiwdX552uVYM48F8A2/jmjR2ozJTnEOi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qw2egoN2Ez4wagEXd3iaqsfQZCCBVuxQnd5JNkFWFbMUD0Be3whIF2nt72MJGU95rbVVkPxgYqBdAI9cwkvIZybPTA6teaQJNIF86yYieL4Z7LdQiIN6MxMFQO5pCRfy1B49Yra7+lWSuMKqvIZX2eKzZhi8jQBtJ9EJVH3HOGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b7Qg4hLM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b7Qg4hLM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734319654; x=1765855654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1rNVNj9g5DFiwdX552uVYM48F8A2/jmjR2ozJTnEOi8=;
  b=b7Qg4hLM1vYIz/GfCQ7gLCFlfpDeWAu6JnOg2mxBtkSwCFDLpjvua4R+
   S5hwfdQPd3s3VC3MHxXYBeT9O0YHl+fSU7cqQgBNt7UOCQqHxFdcHkcrt
   WVQZuFd3hPQzsHYEunC4GSM7CwrkvRVnVeOEyflBItVDsFPvLlE3OV3cj
   KZ/rjz8w0t0mIN5OzdFsK9RxsjhHYWj5C4BT4/BSTmf58z9TRtj15xjzF
   H046rvYxMbd9PWUoP7iTCYsibMbJa6chXFY6yBKrfCEnRn1y50UpIPtc3
   fPd+XxD/6bvk8/6j5F3E8vT8t/KWrKyrdn+ZY8ZiXD/9iaBwBqaprVOU9
   w==;
X-CSE-ConnectionGUID: QCu4aX+QRhqHl1dMOB4frA==
X-CSE-MsgGUID: MFXsj7buRcCzbFfk/fcLYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34606101"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34606101"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 19:27:34 -0800
X-CSE-ConnectionGUID: rCSEbEwXQZi7OUlPCJJx8w==
X-CSE-MsgGUID: 6Mf9aWsYSly3C+i3AOVd+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="102100023"
Received: from spandruv-mobl4.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.238])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 19:27:32 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 2/3] ASoC: Intel: mtl-match: Add CDB35L56-EIGHT-C with aggregated speakers
Date: Mon, 16 Dec 2024 11:27:20 +0800
Message-ID: <20241216032721.131227-3-yung-chuan.liao@linux.intel.com>
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

This adds a match for the CDB35L56-EIGHT-C board with SmartCodec and
SmartAmp speakers aggregated.

The configuration is:

  SDW0: CS35L56 x2 (SmartAmp) using OUT1 and OUT2
  SDW1: CS35L56 x2 (SmartAmp) using OUT7 and OUT8
  SDW3: CS42L43 (SmartJack, SmartMic, SmartAmp)

CS35L56 and CS42L43 Speaker playback is aggregated across all 3 buses.

The device addresses and reset arrangements of the EIGHT-C board are
quirky hence the use of non-contiguous outputs OUT1,2,7,8.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index e78171ec0ca5..35a2cf85140a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -441,6 +441,44 @@ static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
 	}
 };
 
+/* CS42L43 - speaker DAI aggregated with 4 amps */
+static const struct snd_soc_acpi_endpoint cs42l43_4amp_spkagg_endpoints[] = {
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
+		.group_position = 4,
+		.group_id = 1,
+	},
+};
+
+/* CS42L43 on link3 aggregated with 4 amps */
+static const struct snd_soc_acpi_adr_device cs42l43_l3_4amp_spkagg_adr[] = {
+	{
+		.adr = 0x00033001FA424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_4amp_spkagg_endpoints),
+		.endpoints = cs42l43_4amp_spkagg_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
 static const struct snd_soc_acpi_endpoint cs35l56_l_fb_endpoints[] = {
 	{ /* Speaker Playback Endpoint */
 		.num = 0,
@@ -501,6 +539,21 @@ static const struct snd_soc_acpi_endpoint cs35l56_3_fb_endpoints[] = {
 	},
 };
 
+static const struct snd_soc_acpi_adr_device cs35l56_0_adr[] = {
+	{
+		.adr = 0x00003301FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00003201FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_2_endpoint,
+		.name_prefix = "AMP2"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device cs35l56_1_adr[] = {
 	{
 		.adr = 0x00013701FA355601ull,
@@ -825,6 +878,26 @@ static const struct snd_soc_acpi_link_adr cs42l43_link0_cs35l56_link2_link3[] =
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr cs42l43_link3_cs35l56_x4_link0_link1_spkagg[] = {
+	/* Expected order: jack -> amp */
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(cs42l43_l3_4amp_spkagg_adr),
+		.adr_d = cs42l43_l3_4amp_spkagg_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = 2,
+		.adr_d = cs35l56_1_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = 2,
+		.adr_d = cs35l56_0_adr,
+	},
+	{}
+};
+
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -901,6 +974,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-cs42l43-l0-cs35l56-l23.tplg",
 	},
+	{
+		.link_mask = BIT(0) | BIT(1) | BIT(3),
+		.links = cs42l43_link3_cs35l56_x4_link0_link1_spkagg,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-cs42l43-l3-cs35l56-l01-spkagg.tplg",
+	},
 	{
 		.link_mask = GENMASK(2, 0),
 		.links = mtl_cs42l43_cs35l56,
-- 
2.43.0

