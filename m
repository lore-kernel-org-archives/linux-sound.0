Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F0B1BD03A
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 12:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761987; cv=none; b=V1xHYFuZmQiw4s0Ph4v9hCmVfKwzDuUyt8K7bnjIqTp95mDUPFx6bMDqW4P66IRCIh36FOCRJM7haJZ3SRw85wTu9efyOz2roFhR01Drqh9hLN1aGiiJht6+qLovLj5jabpV+6HAiyq581u8EBvU/Z/OmYBpbYoYhCI+94+5mZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761987; c=relaxed/simple;
	bh=qcl5K7Jxr6xC3mex/t1yEXqmgPSTaXdqXxFfQlamcTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNVGG9ss2y/1RySeaNRobKuMul9TrcFUtFg7aEKxSL26is23uGkZxhyD4ObMMA6iFYhXfvSpG+aj1WtCVZCtg49jGK0FrGY0VizuXPDctZD8qZz33KY4viQdk8TZOqKqJlv8Naaj/MGCbbkvjaImdswNQzXLfQEfFcACOJd0uec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RnxHMzwZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RnxHMzwZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724761986; x=1756297986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qcl5K7Jxr6xC3mex/t1yEXqmgPSTaXdqXxFfQlamcTk=;
  b=RnxHMzwZ0F/TgR8irKBOIEnmhOwSEVnxVLTWy5rf+NQFoRrzpslAD6jV
   Jkbcj/rREl041houZlhpQKHwNzZhSDzo4if9D1aWvLSHMrVW0EZQBHoo4
   +8yP5KYjIXHpR/+umqpDzvwhv3GbPe2jWFUzKTOn//b1LqdAeRSZUFhwl
   gqNzZfZ7zrWSRwW1Fg0ibj3m7X2QTPjHGPP+JoplSlkOmjSUsPX1UnKrl
   dnOAEZkmmi+AMBoan993KNMT3IMHMuFDmmWRm422OS+xhFejnXiU+2wm0
   lDGvECkxskgBdrUDStnMCq4lUDXJEPIfF3CqWco0jDhemQmNYho0QnRhu
   w==;
X-CSE-ConnectionGUID: x5G4qkNjRM+34PS9uarniQ==
X-CSE-MsgGUID: jjJB/4XIQuaF/eunQauvfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13235528"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="13235528"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:33:05 -0700
X-CSE-ConnectionGUID: OAZ+6YD7SaGCdCGVTZ2WSQ==
X-CSE-MsgGUID: vKMJ4fooQuyZYK6OJ7Ai1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="62676832"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:33:03 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 14/17] ASoC: Intel: soc-acpi: arl: Add match entries for new cs42l43 laptops
Date: Tue, 27 Aug 2024 20:32:12 +0800
Message-ID: <20240827123215.258859-15-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
References: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
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

