Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3713314C3
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 01:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790903747; cv=none; b=AQt9DvNas7InUQz9yAtAIwI8z0Hm1szuckQxUHHOBEIEq1nfRb04xxLCTXOQruLozdvsHTQ7RBT/q/hBz2nNQJnzGA1uP4x8oeAD1ql8FLm62OYMAUHKU2v1oMx6JZekfz66vn/kHmfIHWzHRsetdvaXCFiVMICRb3b7MUQWo4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790903747; c=relaxed/simple;
	bh=T6kMX53SEFwbHuiVt4gWVhan17tdyivfd/WS44ld4II=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C0z49aKtv3bpVI4mTplOUiazzlUSYAUCWAT8l6HPBrgtCJWWabd7QI+NmshhR9rdua4Q37ZA0YxtXLAQs8y7uWSCBynTMByph3yytZkGbC+khRq0z3xg2g828ypUDgzQnjrxJAPBUqE5PLG6PlzXPVXWJFNScgbqQumyOf/pjq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vs6gS0el; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vs6gS0el"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790903746; x=1822439746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T6kMX53SEFwbHuiVt4gWVhan17tdyivfd/WS44ld4II=;
  b=Vs6gS0el10vwZIwRFzlFuGldHRyBPUDsEN5anHsZLAHFQn3+hjrmQfQy
   n6Y94cg6jFBHILUZZusj5x4zx9MxIxqd2Kxh+qayaPjj/CxW1tcrJmzIB
   QLMssX5gGTgdtaEUDseQP4IdJ6D/zy48nLruG6kWJF6uz9sbIwBNsB8Cu
   /hBRPpxt9pnYbV0rJIfdAp4ec6YtI0PBR3uwYURp0srOQbdV3sJ9XIKh/
   LxBH8ynP/84KHb/2D0lho8lQ2vXhMYT8tCRDgnLMJ/SnTSAql1ZRxsbQc
   5otqemDrxDMBgfc0Jqwe6425vV5U1tPVrbIX3idKNPQsnLBl99WQsknGd
   g==;
X-CSE-ConnectionGUID: 9ImMWvSJT6mtKJCXdAJ4VQ==
X-CSE-MsgGUID: rbekztn0QcuCb40SJ07LTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90442084"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90442084"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 18:15:46 -0700
X-CSE-ConnectionGUID: yNj+cQ1gQNeRNelRUZS5Ig==
X-CSE-MsgGUID: fPykemGNQgG7418T6uhOcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="279894213"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 18:15:45 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/2] ASoC: Intel: soc-acpi-intel-arl-match: Add RT713 + dual RT1320 support
Date: Fri,  2 Oct 2026 09:15:32 +0800
Message-ID: <20261002011532.3468261-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002011532.3468261-1-yung-chuan.liao@linux.intel.com>
References: <20261002011532.3468261-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: JJ Gault <jgault87@gmail.com>

Add a SoundWire machine-driver match entry for boards with an RT713
(SDCA "VB" jack/dmic variant) on link 0 and two RT1320 speaker amps
sharing link 2 (distinguished by unique_id 0/1, left/right).

This exact codec pairing is already supported on Panther Lake
(ptl_sdw_rt713_vb_l2_rt1320_l13) and Lunar Lake
(lnl_sdw_rt713_vb_l2_rt1320_l13); Arrow Lake was missing the
corresponding entry, so affected boards fell back to the generic
skl_hda_dsp_generic driver and only exposed HDMI outputs.

Confirmed on an MSI Raider 16 Max HX B2WI (MS-2651): the kernel now
correctly identifies the hardware and no longer falls back to the
generic HDA driver.

No dedicated topology has been built for this link0/link2 layout yet,
so sof_tplg_filename is set to a placeholder ("sof-arl-dummy.tplg")
rather than pointing at an existing but unrelated topology, per review
feedback.

Signed-off-by: JJ Gault <jgault87@gmail.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-arl-match.c   | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index 09bb7302ed25..310c4b77c4b7 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -70,6 +70,23 @@ static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints[] = {
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
 static const struct snd_soc_acpi_adr_device cs35l56_2_lr_adr[] = {
 	{
 		.adr = 0x00023001FA355601ull,
@@ -301,6 +318,35 @@ static const struct snd_soc_acpi_adr_device rt1320_2_single_adr[] = {
 	}
 };
 
+/*
+ * MSI Raider 16 Max HX B2WI (MS-2651): RT713 (jack/dmic, "VB" SDCA variant)
+ * on link 0, two RT1320 speaker amps sharing link 2 (unique_id 0 = left,
+ * unique_id 1 = right).
+ */
+static const struct snd_soc_acpi_adr_device rt713_vb_0_adr[] = {
+	{
+		.adr = 0x000030025D071301ull,
+		.num_endpoints = ARRAY_SIZE(jack_dmic_endpoints),
+		.endpoints = jack_dmic_endpoints,
+		.name_prefix = "rt713"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1320_2_lr_adr[] = {
+	{
+		.adr = 0x000230025D132001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1320-1"
+	},
+	{
+		.adr = 0x000231025D132001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1320-2"
+	}
+};
+
 static const struct snd_soc_acpi_link_adr arl_n_mrd_es9356_link1[] = {
 	{
 		.mask = BIT(1),
@@ -454,6 +500,20 @@ static const struct snd_soc_acpi_link_adr arl_rt711_l0_rt1316_l3[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr arl_rt713_vb_l0_rt1320_l2[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt713_vb_0_adr),
+		.adr_d = rt713_vb_0_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1320_2_lr_adr),
+		.adr_d = rt1320_2_lr_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr arl_rt722_l0_rt1320_l2[] = {
 	{
 		.mask = BIT(0),
@@ -626,6 +686,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-arl-cs42l43-l0-cs35l56-l2.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(0) | BIT(2),
+		.links = arl_rt713_vb_l0_rt1320_l2,
+		.drv_name = "sof_sdw",
+		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
+		.sof_tplg_filename = "sof-arl-dummy.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{
 		.link_mask = BIT(0) | BIT(2),
 		.links = arl_rt722_l0_rt1320_l2,
-- 
2.43.0

