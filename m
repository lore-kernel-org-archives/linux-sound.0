Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4641322E
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 01:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724723060; cv=none; b=hNyibc8GaEv2yW0SCHhD0VVfguYAlR02VY/FfJPWBLLikg9zuJ4Wv5FMtHIK2d3uuaDik986kwG9T3YE+PEAnz2Sew4F5uUwnyKAr23DjfUFL6yQpTXCIluv6lsXHp2DakaMEjcwMwwWEq+wI99egcAhGWNoJwVQAtJ40p08oDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724723060; c=relaxed/simple;
	bh=qcl5K7Jxr6xC3mex/t1yEXqmgPSTaXdqXxFfQlamcTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rif1xMUh1YPuCgJmoNy46TCLIj0Qze+GIaWPfFHb0LoTWb4bHmkrw7SMOmc85Xr1MPzYLASR+MQmT6PMjkqbV6wwIEKua9EoEz5u9rZuxs9m6JcoLIv4Wd8cwHwNfGpZk1r0PgR6JPMjXCgRlTZa32BHODN6iHFDaP+52B89tn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SrTGGhZq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SrTGGhZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724723059; x=1756259059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qcl5K7Jxr6xC3mex/t1yEXqmgPSTaXdqXxFfQlamcTk=;
  b=SrTGGhZqzDfKVQ7nAaxnRvlFmm/t0qqPYnOznfkQaYdKFcRZJX9gkdhl
   EhCc3k08SoQpwvb2RUJgJQmRw2iIFu94UGnVIBNwy6jJBj3RnXGxwpL4l
   q7U4L88fdk69ZhNsS5RbwlGFs0RwkZFNo9GXAwW4MrsJiBgIREcROGGiG
   hJfDmLts5KtUv/nYHBdADQXog1sZzip5NFHZdm1U1Z2jlCuZDpnI7t3R7
   G6NnaVGPDnfLHSjYjaLzxVOS9DkT9l74affkEDwTDBGOJz+QXYvZpElGu
   mjNhrugBx55vdomIC19ul8W3fWdufs0HntnPW1KHVOWGQFwZq/GYksKFD
   A==;
X-CSE-ConnectionGUID: pome2DdNRdOeKM/htQ/FVw==
X-CSE-MsgGUID: 6u07avyuSsGawHMhfmP1fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22984981"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="22984981"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:44:18 -0700
X-CSE-ConnectionGUID: VzfxSZKcRP+RwHsjpHO3QQ==
X-CSE-MsgGUID: s8BumgtZRBegTPQ9eE5Lqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="63427963"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:44:15 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 13/16] ASoC: Intel: soc-acpi: arl: Add match entries for new cs42l43 laptops
Date: Tue, 27 Aug 2024 09:43:25 +0800
Message-ID: <20240827014329.6542-14-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
References: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Add some new match table entries on Arrowlake for some coming cs42l43
laptops.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-arl-match.c   | 219 ++++++++++++++++++
 1 file changed, 219 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index 8f69d61ea39c..9936a4b4eee7 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -15,6 +15,112 @@ static const struct snd_soc_acpi_endpoint single_endpoint = {
 	.group_id = 0,
 };
 
+static const struct snd_soc_acpi_endpoint spk_l_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 0,
+	.group_id = 1,
+};
+
+static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
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
+static const struct snd_soc_acpi_adr_device cs35l56_2_lr_adr[] = {
+	{
+		.adr = 0x00023001FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00023101FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_3_lr_adr[] = {
+	{
+		.adr = 0x00033001FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00033401FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_2_r_adr[] = {
+	{
+		.adr = 0x00023201FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP3"
+	},
+	{
+		.adr = 0x00023301FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_3_endpoint,
+		.name_prefix = "AMP4"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_3_l_adr[] = {
+	{
+		.adr = 0x00033001fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00033101fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_2_endpoint,
+		.name_prefix = "AMP2"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_2_r1_adr[] = {
+	{
+		.adr = 0x00023101FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_3_l1_adr[] = {
+	{
+		.adr = 0x00033301fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+};
+
 static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
 	{ /* Jack Playback Endpoint */
 		.num = 0,
@@ -51,6 +157,15 @@ static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device cs42l43_2_adr[] = {
+	{
+		.adr = 0x00023001FA424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	{
 		.adr = 0x000020025D071100ull,
@@ -77,6 +192,80 @@ static const struct snd_soc_acpi_link_adr arl_cs42l43_l0[] = {
 	},
 };
 
+static const struct snd_soc_acpi_link_adr arl_cs42l43_l2[] = {
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(cs42l43_2_adr),
+		.adr_d = cs42l43_2_adr,
+	},
+};
+
+static const struct snd_soc_acpi_link_adr arl_cs42l43_l2_cs35l56_l3[] = {
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(cs42l43_2_adr),
+		.adr_d = cs42l43_2_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(cs35l56_3_lr_adr),
+		.adr_d = cs35l56_3_lr_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr arl_cs42l43_l0_cs35l56_l2[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
+		.adr_d = cs42l43_0_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(cs35l56_2_lr_adr),
+		.adr_d = cs35l56_2_lr_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr arl_cs42l43_l0_cs35l56_l23[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
+		.adr_d = cs42l43_0_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(cs35l56_2_r_adr),
+		.adr_d = cs35l56_2_r_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(cs35l56_3_l_adr),
+		.adr_d = cs35l56_3_l_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr arl_cs42l43_l0_cs35l56_2_l23[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
+		.adr_d = cs42l43_0_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(cs35l56_2_r1_adr),
+		.adr_d = cs35l56_2_r1_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(cs35l56_3_l1_adr),
+		.adr_d = cs35l56_3_l1_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr arl_rvp[] = {
 	{
 		.mask = BIT(0),
@@ -127,12 +316,42 @@ EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_arl_machines);
 
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
+	{
+		.link_mask = BIT(0) | BIT(2) | BIT(3),
+		.links = arl_cs42l43_l0_cs35l56_l23,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-cs42l43-l0-cs35l56-l23.tplg",
+	},
+	{
+		.link_mask = BIT(0) | BIT(2) | BIT(3),
+		.links = arl_cs42l43_l0_cs35l56_2_l23,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-cs42l43-l0-cs35l56-l23.tplg",
+	},
+	{
+		.link_mask = BIT(0) | BIT(2),
+		.links = arl_cs42l43_l0_cs35l56_l2,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-cs42l43-l0-cs35l56-l2.tplg",
+	},
 	{
 		.link_mask = BIT(0),
 		.links = arl_cs42l43_l0,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-arl-cs42l43-l0.tplg",
 	},
+	{
+		.link_mask = BIT(2),
+		.links = arl_cs42l43_l2,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-cs42l43-l2.tplg",
+	},
+	{
+		.link_mask = BIT(2) | BIT(3),
+		.links = arl_cs42l43_l2_cs35l56_l3,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-cs42l43-l2-cs35l56-l3.tplg",
+	},
 	{
 		.link_mask = 0x1, /* link0 required */
 		.links = arl_rvp,
-- 
2.43.0

