Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726011BC9FC
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 12:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761989; cv=none; b=ZkW3uzQ5ADZZdRU1Wd1etSPrvY15XxZ3hB4lFGW8Af5vphrK3ZlNFZl9b71/eLZdNQWkPQ9RuDaYrW9jOYsFlJMtjf0RnjM/J3z5x4PZ4eDrTt0sDn15DvXmPQwvZ2o6wTg0zrSZDLpBAyug8Tb46M/y+MxjIus7oHLtedgTRbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761989; c=relaxed/simple;
	bh=sXMeZZNRbQaUfBswDOyMGOTkyfQ9jRFyGA4IgezDZho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qmd89BQx/SDI6oZ/dQyhyAa1vTIwmyHQttCY/Jk2pn6wbK4Rdqg+MFtQSv5fe+zyjphjv4ZQyDDLptv976gJiUSM1ZVObCtHJTIXcZIZjcGoTZGN1MZCFA/6Bu+J4r0ZK+m4Ev6dQX3rgLOv6CUNAX9br2psryaUFirwMXRoLy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmnv6W31; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmnv6W31"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724761988; x=1756297988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sXMeZZNRbQaUfBswDOyMGOTkyfQ9jRFyGA4IgezDZho=;
  b=jmnv6W31riPkO7/x97L3mnsjSD51ix5vVwGm0gOPil6BtJR/ZCTrJ4r9
   5aQAUuYrIgpUUWZgDptvUzbTMvC1OD9o7W/nYmyEvW/zbPQlGvkPjzMDR
   1E/m/hPqn1oHFtvpw49o9XJuP+K7CNkcyaaS/+pQt27ziO8aMlyr2GvA+
   W4RSXDjaFRuTXBWV1KlpKOk5vcY1QQlVyR+VgHODxHXNq5bvCJJRHegoI
   1fbUCMy1SyAfnXYwLn/pN/431XMLHxnJ03b85DMCeVVsG+I4OZO2jDylO
   GMjgcZhDv1eqIb7qOPCWFLLNJFkwJs1mVdu/8hBi8q+4K+VKPgMhNSWDx
   Q==;
X-CSE-ConnectionGUID: q7znXLHkTneu8En4GSzoZA==
X-CSE-MsgGUID: Hvoci8oRQPSeq+ZFCxZHhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13235531"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="13235531"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:33:08 -0700
X-CSE-ConnectionGUID: sQHt9OdrQn68r+ccqP220g==
X-CSE-MsgGUID: HlJ6tRLaSDOEFEEl/L5iFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="62676838"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:33:05 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 15/17] ASoC: Intel: soc-acpi: adl: Add match entries for new cs42l43 laptops
Date: Tue, 27 Aug 2024 20:32:13 +0800
Message-ID: <20240827123215.258859-16-yung-chuan.liao@linux.intel.com>
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

Add some new match table entries on Alderlake for some coming cs42l43
laptops.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 4167b2e9bc6a..bb1324fb588e 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -35,6 +35,86 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 	.group_id = 1,
 };
 
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
@@ -416,6 +496,25 @@ static const struct snd_soc_acpi_adr_device rt5682_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_link_adr adl_cs42l43_l0_cs35l56_l23[] = {
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
 static const struct snd_soc_acpi_link_adr adl_rvp[] = {
 	{
 		.mask = BIT(0),
@@ -560,6 +659,12 @@ EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_adl_machines);
 
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_sdw_machines[] = {
+	{
+		.link_mask = BIT(0) | BIT(2) | BIT(3),
+		.links = adl_cs42l43_l0_cs35l56_l23,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-adl-cs42l43-l0-cs35l56-l23.tplg",
+	},
 	{
 		.link_mask = 0xF, /* 4 active links required */
 		.links = adl_default,
-- 
2.43.0

