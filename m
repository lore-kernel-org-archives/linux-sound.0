Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C3A149C62
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714144903; cv=none; b=XMy6KwU0KRyE9OtdcoaQskJcoT+uGerdRTXFiUTmnpZV0UjzBMdAh71CXU5tFDG2fMcss53UJFx1WXQ6g5DJhx762Bp2ORlLoohGipb1J2ZIs4Nsa2VR0RAUa897OGLjHaAGlXWkkTGzyEdCNASAXsAwpXB01CtzRdwH4L8UL+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714144903; c=relaxed/simple;
	bh=uvsiV2YLLM+olUopeXgfESIJEeQMUUr6tjoE9Ugq0pw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QoK+XCTIquGgd/Q9X/e8ZJ7PRRXCX/MeggM6liHbeJxhY7IWZ/G2HzUBB1fv3rkCk6mPg5gLhpP06XmiSbw7Vn4T4LM637Q/DrNx/yID1FEnqnbZyQdfAUIb8hY+Hts2NFj1EWX+zNo52aOeJp7QboJSd2wiZQXF84PpbLCPaIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJup4cFz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJup4cFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144902; x=1745680902;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uvsiV2YLLM+olUopeXgfESIJEeQMUUr6tjoE9Ugq0pw=;
  b=QJup4cFz7imS9uVJHZocF0me2H/XVZPNpbbDb1u/aaWNhBEiBRyV082n
   1aslnHeZ0mHEcXt804FsLprLyRXVP9mW/QX1ecf1NKw4+EhB0xkvnmuEc
   B4YIjfOu9QBRr42zpOkZEYS+a63Eb3snX3Bte+ybZCT5RWfA20wxlYvE5
   6pea57WoKLsYq4QvsVT2HTvK6BBOUdGQnJ3ULse6m0kN5bJk0C9ju41bp
   oBPBbmlwmhXj1lepkXvwbUm7ziSEDEPWFtZES+nezczerQ7jhHAf/Ml6I
   DWp/XvL5GmFJrIDP7qdthKkQderhuAPlqxBvlwGveN9ECJAJwBGonnVmj
   Q==;
X-CSE-ConnectionGUID: 8cwbPuuETkCwpenT8BhMnw==
X-CSE-MsgGUID: k/Z9zRwWQC2cu6KcMr6s5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290600"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21290600"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:40 -0700
X-CSE-ConnectionGUID: TZhS/xgITR+Umrtw3fsWHw==
X-CSE-MsgGUID: cv0B5d47RWaFIROsWzdjPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259025"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 03/12] ASoC: Intel: soc-acpi: mtl: add Dell SKU 0C64 and 0CC6
Date: Fri, 26 Apr 2024 10:21:14 -0500
Message-Id: <20240426152123.36284-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SKU 0C64 relies on rt713 (jack codec) on link0, rt1318 (single
amplifier) on link1 and rt1713 (dmic) on link3.

SKU 0CC6 relies on rt713 (jack codec) on link0, rt1318 (two
amplifiers) on link 1-2 and rt1713 (dmic) on link3.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index f95490a16b55..8c1c430f5482 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -312,6 +312,15 @@ static const struct snd_soc_acpi_adr_device rt1316_3_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1318_1_single_adr[] = {
+	{
+		.adr = 0x000130025D131801,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt1318"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1318_1_group1_adr[] = {
 	{
 		.adr = 0x000130025D131801ull,
@@ -559,6 +568,49 @@ static const struct snd_soc_acpi_link_adr mtl_rt713_l0_rt1316_l12_rt1713_l3[] =
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_rt713_l0_rt1318_l1_rt1713_l3[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt713_0_single_adr),
+		.adr_d = rt713_0_single_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1318_1_single_adr),
+		.adr_d = rt1318_1_single_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1713_3_single_adr),
+		.adr_d = rt1713_3_single_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr mtl_rt713_l0_rt1318_l12_rt1713_l3[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt713_0_single_adr),
+		.adr_d = rt713_0_single_adr,
+	},
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
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1713_3_single_adr),
+		.adr_d = rt1713_3_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr mtl_rt713_l0_rt1316_l12[] = {
 	{
 		.mask = BIT(0),
@@ -697,6 +749,18 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt713-l0-rt1316-l12-rt1713-l3.tplg",
 	},
+	{
+		.link_mask = GENMASK(3, 0),
+		.links = mtl_rt713_l0_rt1318_l12_rt1713_l3,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-rt713-l0-rt1318-l12-rt1713-l3.tplg",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1) | BIT(3),
+		.links = mtl_rt713_l0_rt1318_l1_rt1713_l3,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-rt713-l0-rt1318-l1-rt1713-l3.tplg",
+	},
 	{
 		.link_mask = GENMASK(2, 0),
 		.links = mtl_rt713_l0_rt1316_l12,
-- 
2.40.1

