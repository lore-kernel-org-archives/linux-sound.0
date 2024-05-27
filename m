Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C92D160880
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838577; cv=none; b=lebTx9SQRQmO54rWm7QTKaFFtTgJcFSiKQa2B2xIJ7K9TRuGEoWQ7W7SaHgDWMWTta5MoPReNpPV+/4GUjezA/+taIOJOWToShUVW/IktOe4H5UtDL4AYcQegY9N9yhioWIgitET5RR6P6LZAb8awgB7Pihd4R9RQACKocjETEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838577; c=relaxed/simple;
	bh=dW60t95bPnKl9GWiqKVKl+Byxl7cm63BjWqgbq4l084=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dpf4wUbAdB55I8UWbTolDK54OO2wMVd/WA7fe/z3GK3v88sAt821KgoKE1pUMK6ifA33xDLg2SfJ5iAs7QY63AJ/5DiSCmvKM9hstv3i++mPhh8Xn2MO54p/EimlunhjuXkbgf41cFyeB0Kn0Kk13Dl1mQcW3ZYIjAzIGDQj93U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ju0K9GRP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ju0K9GRP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838576; x=1748374576;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dW60t95bPnKl9GWiqKVKl+Byxl7cm63BjWqgbq4l084=;
  b=Ju0K9GRPwo6ftUdeFVdbMgnLwvN/0eURkVB4bKu6ndKqCU9Cg5FKLCPT
   KWBsPVRx2nmoDF8/P8N96azRx9jLjfi8HEpH2NsQiwmZsfGPTq+qinQQm
   VepPqZi7XUg9eEmgSSh6KsBFH1q+H9xIRgfU+A98CHfEi8DXk9Ezrz2Yp
   LzDuSQerYN7Ynk7ZNZBzCAWCsquFwK2rFXADfFkUw37wiHFgIIXaBBWnt
   PZqAiMiFCmd3cgdrovxU9byRpRE/mqxG+12/jS62rzRAL6dKqQFAumLn0
   N9wKy3KcB36XVsDdUJrI4own4uXiHRXWjjotBTc2D4ZntBCWxShKlJLKl
   Q==;
X-CSE-ConnectionGUID: WtR2KOt3Qu+Yt+j8+4J0qQ==
X-CSE-MsgGUID: WuDc9fctQdu3iGvPmv8/TQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339352"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13339352"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:16 -0700
X-CSE-ConnectionGUID: Zsqq2Q+eRfaSs/mvUm/xDQ==
X-CSE-MsgGUID: RRRiOZjUTtmCPcAtG7WfwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58029771"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 09/18] ASoC: Intel: soc-acpi: Add match entries for some cs42l43 laptops
Date: Mon, 27 May 2024 14:35:43 -0500
Message-ID: <20240527193552.165567-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Add some new match table entries on Arrowlake and Raptorlake for some
coming cs42l43 laptops.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-arl-match.c   | 50 +++++++++++++++++++
 .../intel/common/soc-acpi-intel-rpl-match.c   | 50 +++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index 79d26e0f2c28..cc87c34e5a08 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -15,6 +15,42 @@ static const struct snd_soc_acpi_endpoint single_endpoint = {
 	.group_id = 0,
 };
 
+static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
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
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
+	{
+		.adr = 0x00003001FA424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	{
 		.adr = 0x000020025D071100ull,
@@ -33,6 +69,14 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_link_adr arl_cs42l43_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
+		.adr_d = cs42l43_0_adr,
+	},
+};
+
 static const struct snd_soc_acpi_link_adr arl_rvp[] = {
 	{
 		.mask = BIT(0),
@@ -58,6 +102,12 @@ EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_arl_machines);
 
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
+	{
+		.link_mask = BIT(0),
+		.links = arl_cs42l43_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-cs42l43-l0.tplg",
+	},
 	{
 		.link_mask = 0x1, /* link0 required */
 		.links = arl_rvp,
diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index b0a49e28ab09..bc8817633b81 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -30,6 +30,42 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 	.group_id = 1,
 };
 
+static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
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
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
+	{
+		.adr = 0x00003001FA424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	{
 		.adr = 0x000020025D071100ull,
@@ -156,6 +192,14 @@ static const struct snd_soc_acpi_adr_device rt714_3_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_link_adr rpl_cs42l43_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
+		.adr_d = cs42l43_0_adr,
+	},
+};
+
 static const struct snd_soc_acpi_link_adr rpl_sdca_3_in_1[] = {
 	{
 		.mask = BIT(0),
@@ -446,6 +490,12 @@ EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_rpl_machines);
 
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_sdw_machines[] = {
+	{
+		.link_mask = BIT(0),
+		.links = rpl_cs42l43_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-rpl-cs42l43-l0.tplg",
+	},
 	{
 		.link_mask = 0xF, /* 4 active links required */
 		.links = rpl_sdca_3_in_1,
-- 
2.43.0

