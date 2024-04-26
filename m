Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5957214D452
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714144904; cv=none; b=UkNWG5jOtpDBDs3REV2QBpqno0pCM/5GXDtebCIF5ikyc/q9h2yF+tEc2uzeRusAT7tVoFjR151e0GLSHPD2MRcJoAe/GhJmbpftTSNCG5TYUdowJ2ZZAf0yUC+f6C54jife6aR4PcNmHSCZdUBvZryWft136OgVKa4r+Bub2fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714144904; c=relaxed/simple;
	bh=PuF4w6Ln2EhUy7cEQnbfcGAWOeZqMgiQxCSwhmlUlek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UqinkhJbrgqaVCxrlcLs7A8+alpFqULcGzNEr+MN8JmbwgilEvD8VjOoYqCWBJT71AaS+XqGBidtCxzyAz0HyGMLlc3M5zYcEb9YCw/OEd/lDfbNyUaduyhpihIClioppfNeNDc7l2Vpj31hicGechT70zMawkc1kTu6X+Qa7YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LdKvcALd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LdKvcALd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144902; x=1745680902;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PuF4w6Ln2EhUy7cEQnbfcGAWOeZqMgiQxCSwhmlUlek=;
  b=LdKvcALdpcLDTEVA/MQynlnZeRREumJiawpxT7sMXiqn9ZpJdewYAJID
   jrHOI7wg3FZADDSaff7oJ3cNpdBc4Zn/fNYmO9Egp9yitWObw7r+suhgO
   OD6+xDGw/szKvZivjqrBzzHIL0eKW09xZtC1ZIXv7Uqj4pGQblKw5xDuy
   LeubVCkfcnGIcTk0eSm7iltttTKVjbybU0b5/gyAq+dZOownYCDxOr/2P
   DEVGhP9NRikLL4dvQgIMlhciSNGnohymyYp5zl3ocH2OO4sGIMdjeS+mT
   f0I/pn5gqaF0fC4m3cZ/wsZ+132iuq5Dstg5KqlbuzL+CdWCyPnd7pMcd
   A==;
X-CSE-ConnectionGUID: mxLHhto6TeuXGb4G6tcs2g==
X-CSE-MsgGUID: 9drK0bv9QkWxBTDKp9eAyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290611"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21290611"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:42 -0700
X-CSE-ConnectionGUID: o3pmswGHQIiEbQYdntSOJw==
X-CSE-MsgGUID: 61DS1Hl5R2Ozpi/Y5mDOtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259030"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Mac Chiang <mac.chiang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 05/12] ASoC: Intel: soc-acpi-intel-lnl-match: adds RT714 and RT1318 support
Date: Fri, 26 Apr 2024 10:21:16 -0500
Message-Id: <20240426152123.36284-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mac Chiang <mac.chiang@intel.com>

This patch adds support for corresponding codecs on LNL hardware
configuration:

SDW0: RT714 DMIC
SDW1: RT1318 Left Speaker
SDW2: RT1318 Right Speaker

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-lnl-match.c   | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index 74d6dcd7471f..0318c1a46f3c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -130,6 +130,33 @@ static const struct snd_soc_acpi_adr_device rt1316_3_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1318_1_group1_adr[] = {
+	{
+		.adr = 0x000130025D131801ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1318-1"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1318_2_group1_adr[] = {
+	{
+		.adr = 0x000232025D131801ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1318-2"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt714_0_adr[] = {
+	{
+		.adr = 0x000030025D071401ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt714"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt714_1_adr[] = {
 	{
 		.adr = 0x000130025D071401ull,
@@ -195,6 +222,25 @@ static const struct snd_soc_acpi_link_adr lnl_3_in_1_sdca[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr lnl_sdw_rt1318_l12_rt714_l0[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1318_1_group1_adr),
+		.adr_d = rt1318_1_group1_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1318_2_group1_adr),
+		.adr_d = rt1318_2_group1_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt714_0_adr),
+		.adr_d = rt714_0_adr,
+	},
+	{}
+};
+
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -240,6 +286,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-rt722-l0.tplg",
 	},
+	{
+		.link_mask = GENMASK(2, 0),
+		.links = lnl_sdw_rt1318_l12_rt714_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-lnl-rt1318-l12-rt714-l0.tplg"
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_lnl_sdw_machines);
-- 
2.40.1

