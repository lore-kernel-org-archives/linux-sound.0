Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E71322E
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 01:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724723062; cv=none; b=S4iQLZ5bldfNu4wiv7P2leo12cEEggw+1aXzARhWWEt1Qcc3lt5icenK9uNNcGd9AxswuI/x9enkV7ZGFqZ3pAEpv1EBbrP9wPfWKYvxIg0izMcSJqU3gy+NA5XVWR5pGOj00A9pztb3PCo8iy5EOrdofMxyB91J16VhPH46liw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724723062; c=relaxed/simple;
	bh=sXMeZZNRbQaUfBswDOyMGOTkyfQ9jRFyGA4IgezDZho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ar94AQtltREk9vmezprWmptpxe5hZHhaWIQJoXMgpkpc4RKlDKhbIxEnB2adkD7y3p3ZVMcifAHxNM4LUusgPrNQ6C/iJjxtjI65gSbK/lHRP3iO/XRUcqFRSDjoISx5vAYI7ei+vuj1mjP827xxiXGImMFaOuePO9jizZTp/dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0mGIp6C; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0mGIp6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724723061; x=1756259061;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sXMeZZNRbQaUfBswDOyMGOTkyfQ9jRFyGA4IgezDZho=;
  b=W0mGIp6CuffUaJmVzZmqVvwLLJoow8+9oIwNgMwDFc2JatvkxD8xa/xl
   MRdLcCo9WuaXpB3YBxeC7G97xdpw9VSHl3dI07BOe2vK3EJUGJng+sZCV
   PCTpYQisB765oRzx8/ttrdSOiWpTmbdpFRw0f6TL0yOdTdpCqpA3uCYA/
   zrUA6u0QiKzekHa/JDspcGyVKpbdyZEoWRU2mdax5B6B/OJiVR3RGYUGQ
   4F1Xl40dcRNvSBFyJuyJ6o41Nd4lHVVScmHYKTLT8cXSJ7LwAwtCJlK25
   8L2E3cQ6tl+hPG6hCGH/UBG6kQ8FtPN3CphMDmV4e9NMXOusYgyA5aKVE
   g==;
X-CSE-ConnectionGUID: Kz39L52TRlaDEqFqylzdTA==
X-CSE-MsgGUID: MaTpvEFMRj2bFbHL0/gH3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22984990"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="22984990"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:44:21 -0700
X-CSE-ConnectionGUID: H62HJ8BdTRWsduvS80ZebA==
X-CSE-MsgGUID: Be7rEXmnQc2+bAlzpaKixQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="63427968"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:44:18 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 14/16] ASoC: Intel: soc-acpi: adl: Add match entries for new cs42l43 laptops
Date: Tue, 27 Aug 2024 09:43:26 +0800
Message-ID: <20240827014329.6542-15-yung-chuan.liao@linux.intel.com>
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

