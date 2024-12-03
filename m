Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF6C1E2614
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 10:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733222748; cv=none; b=jAia+Op109gsyg52vuu7o3lnjNN/PeQVh49ObNjSbCgTouDKAxReUcFI1Nh0mN7/eC32Al2sidocu6bItL291t5GKAAuSHicoada+EZdKku3IZFwE2dS6IPq6HWmLrbzrZ52G3nhgBocV4RjAAJ/ZZsGX0iWvRHHDI9Dg6NIJxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733222748; c=relaxed/simple;
	bh=v3P9N4z2SYO6lh20cf+T8Yt5bBCh0EmCJYkgo11fQyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q35qN+Wtc87KhkWd+EHKfvobjYFYeVTlyQRHTnE3F3YFv2S570fjU8H8lqxj2gAmteq/BisjoYk/13/IVaoMCk1D2Cf2xrdNgdhQdG6XppTc5wyIWhyUdbFg70Q+qbFJSSxGxwJFkvfWCix0GrG2gbCnrgvQHxaQOmXnDCOzSnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=al1D1i1Z; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="al1D1i1Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733222747; x=1764758747;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v3P9N4z2SYO6lh20cf+T8Yt5bBCh0EmCJYkgo11fQyM=;
  b=al1D1i1ZVrI/oPaPD6tSEZiQEqjpzARWIkgzEHc08E2iFRNCF2D+pAVF
   2xpZfh229YOyt8EAmliSEEJbdieDaBdn3AQtr6T7n/U+xQ85l+OdD32C3
   uM5Du9htPVtrdikJ5GH9/sINrdgVeZfHV1kwgfi119HFJpXvNmxCUVMqu
   nvWz6I5XNQivKzGVMqUldg17oe+AxNYOzGuol8+/IzbUWMbu9mcvd8XUz
   9UDvxp1u9Dn54GpUyHavgYm9q4TIVal+89yJsLif3X7TZAvZAo/4YkqgR
   1de5+FNyTJNTwipLaAg1+lP2xESEvFVYZo8uAoQ2wM3sg+qhzkHs4vPm+
   g==;
X-CSE-ConnectionGUID: 7KwxpQg0R+KKOZryTPgo6g==
X-CSE-MsgGUID: Xc2tL1/FRW6cfnYhqiENqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33559904"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="33559904"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 02:45:45 -0800
X-CSE-ConnectionGUID: ZWZQlymVTsiWglg35U0fsQ==
X-CSE-MsgGUID: dYybFyhwSSW6I6xFNVPMyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="93799180"
Received: from ccbilbre-mobl3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.75])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 02:45:43 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 1/2] ASoC: cs35l56: Split SoundWire DAI into separate playback and capture
Date: Tue,  3 Dec 2024 18:45:33 +0800
Message-ID: <20241203104534.56719-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203104534.56719-1-yung-chuan.liao@linux.intel.com>
References: <20241203104534.56719-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Richard Fitzgerald <rf@opensource.cirrus.com>

This patch splits the SoundWire capture DP into a separate DAI so that
it can be independently routed and/or aggregated. It also makes
corresponding changes to the SOF SoundWire machine driver.

The playback and capture over SoundWire are separate DPs so don't have to
route to the same place. They could also be aggregated differently - for
example the playback DP could be aggregated with a playback-only DAI on
a codec.

No production device currently uses the capture path and their topologies
do not connect it. So there is no need to change the machine driver match
table entries for these. They will simply drop the unused capture DAI.

There is one hookup used for a non-production development board that was
added by commit 05fe62842804 ("ASoC: Intel: soc-acpi-intel-mtl-match: add
acpi match table for cdb35l56-eight-c") This is the only hookup using a
topology that connects the SoundWire DP for capture, so this hookup has
been changed to include an aggregated endpoint for the capture DAI.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/cs35l56.c                    |  8 +-
 .../intel/common/soc-acpi-intel-mtl-match.c   | 76 +++++++++++++++++--
 sound/soc/sdw_utils/soc_sdw_utils.c           | 12 ++-
 3 files changed, 84 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 757ade6373ed..5c099443eb7a 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -646,6 +646,12 @@ static struct snd_soc_dai_driver cs35l56_dai[] = {
 			.rates = CS35L56_RATES,
 			.formats = CS35L56_RX_FORMATS,
 		},
+		.symmetric_rate = 1,
+		.ops = &cs35l56_sdw_dai_ops,
+	},
+	{
+		.name = "cs35l56-sdw1c",
+		.id = 2,
 		.capture = {
 			.stream_name = "SDW1 Capture",
 			.channels_min = 1,
@@ -655,7 +661,7 @@ static struct snd_soc_dai_driver cs35l56_dai[] = {
 		},
 		.symmetric_rate = 1,
 		.ops = &cs35l56_sdw_dai_ops,
-	}
+	},
 };
 
 static int cs35l56_write_cal(struct cs35l56_private *cs35l56)
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 0b37465b6c53..9892efd8e9c2 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -441,6 +441,66 @@ static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
 	}
 };
 
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
 static const struct snd_soc_acpi_adr_device cs35l56_1_adr[] = {
 	{
 		.adr = 0x00013701FA355601ull,
@@ -474,14 +534,14 @@ static const struct snd_soc_acpi_adr_device cs35l56_2_adr[] = {
 static const struct snd_soc_acpi_adr_device cs35l56_2_r_adr[] = {
 	{
 		.adr = 0x00023201FA355601ull,
-		.num_endpoints = 1,
-		.endpoints = &spk_r_endpoint,
+		.num_endpoints = ARRAY_SIZE(cs35l56_r_fb_endpoints),
+		.endpoints = cs35l56_r_fb_endpoints,
 		.name_prefix = "AMP3"
 	},
 	{
 		.adr = 0x00023301FA355601ull,
-		.num_endpoints = 1,
-		.endpoints = &spk_3_endpoint,
+		.num_endpoints = ARRAY_SIZE(cs35l56_3_fb_endpoints),
+		.endpoints = cs35l56_3_fb_endpoints,
 		.name_prefix = "AMP4"
 	}
 
@@ -490,14 +550,14 @@ static const struct snd_soc_acpi_adr_device cs35l56_2_r_adr[] = {
 static const struct snd_soc_acpi_adr_device cs35l56_3_l_adr[] = {
 	{
 		.adr = 0x00033001fa355601ull,
-		.num_endpoints = 1,
-		.endpoints = &spk_l_endpoint,
+		.num_endpoints = ARRAY_SIZE(cs35l56_l_fb_endpoints),
+		.endpoints = cs35l56_l_fb_endpoints,
 		.name_prefix = "AMP1"
 	},
 	{
 		.adr = 0x00033101fa355601ull,
-		.num_endpoints = 1,
-		.endpoints = &spk_2_endpoint,
+		.num_endpoints = ARRAY_SIZE(cs35l56_2_fb_endpoints),
+		.endpoints = cs35l56_2_fb_endpoints,
 		.name_prefix = "AMP2"
 	}
 };
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 19bd02e2cd6d..111e00e916c5 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -488,10 +488,10 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.part_id = 0x3556,
 		.dais = {
 			{
-				.direction = {true, true},
+				.direction = {true, false},
 				.dai_name = "cs35l56-sdw1",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
-				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
 				.init = asoc_sdw_cs_amp_init,
 				.rtd_init = asoc_sdw_cs_spk_rtd_init,
 				.controls = generic_spk_controls,
@@ -499,8 +499,14 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				.widgets = generic_spk_widgets,
 				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
 			},
+			{
+				.direction = {false, true},
+				.dai_name = "cs35l56-sdw1c",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
+			},
 		},
-		.dai_num = 1,
+		.dai_num = 2,
 	},
 	{
 		.part_id = 0x4242,
-- 
2.43.0

