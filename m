Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABE68002D
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411371; cv=none; b=dS6Y8ddKMG4HGfcLchWRifiw3ef2d6pc97P8sEC0dttZKkfvWefKKVd+coQQvHX2YVbHmboJaRlk0Xb6018V2WxLDKNo5FVzIvnkn3HUQ7VEC/DLEyS8+Pdi4s4ri4wxEgvzbLTL2Zk/XcKX9wNcxOrGOebp9B2MraXRuW14oBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411371; c=relaxed/simple;
	bh=iRATeZtRrW+PHtKv+nCULUFBqBZO+V/KE5hbLZcj5RU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r+TzzJ/VKS4uK/gfszuFxoOpE79dhqs3APfSdkhWEuSK3dDdp4Fy1JH3qJ25CrGIja8LR3jNfnw/rDov08yYKzgjcFQMo7m3cRwDcM++yRW55l/kW4ADqtFMkHNka1cTN7u2IrxRwCzNxz/iw7PJFMr2+9cezPdyLAPNXPmH9To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SE97ualz; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SE97ualz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411370; x=1738947370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iRATeZtRrW+PHtKv+nCULUFBqBZO+V/KE5hbLZcj5RU=;
  b=SE97ualzC321zTd6rot03k2SNo09KdlKRcnaDlPqN1GDd5+zAprDXBpT
   GfI6ryG/LfpTsdNMCHwPliIHPiNODARFSpMTzEPYlaviGCSX6p0QSODBo
   fFJ8tNgL1D+Fi53Aq0L6QTvgCOX0eGI3Dle0nJM/W8IjJwd70bhDpe9OI
   Kjd//uS/q1f0U3FRTVeGJR+GlE8+4D3uXLpJHfssUpuw+Y798nYY+6R0X
   0WztAZZhSRlseym2TvJ/bf6l2WUko8aMk+nkXSd1hyS5imQY+WVR/PS1L
   hnxEuEhvM63Del6sqChJKw64WQvFAVwWWM9JlYcArDC4v6lmpvBQ0As/r
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675445"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675445"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690284"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:07 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Chao Song <chao.song@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 23/24] ASoC: Intel: soc-acpi-intel-lnl-match: Add rt722 support
Date: Thu,  8 Feb 2024 10:55:44 -0600
Message-Id: <20240208165545.93811-24-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Song <chao.song@linux.intel.com>

This patch adds match table for rt722 multiple
function codec on link 0.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-lnl-match.c   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index 3d48e161cb33..74d6dcd7471f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -51,6 +51,31 @@ static const struct snd_soc_acpi_endpoint rt712_endpoints[] = {
 	},
 };
 
+/*
+ * RT722 is a multi-function codec, three endpoints are created for
+ * its headset, amp and dmic functions.
+ */
+static const struct snd_soc_acpi_endpoint rt722_endpoints[] = {
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
 static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	{
 		.adr = 0x000030025D071101ull,
@@ -78,6 +103,15 @@ static const struct snd_soc_acpi_adr_device rt1712_3_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
+	{
+		.adr = 0x000030025d072201ull,
+		.num_endpoints = ARRAY_SIZE(rt722_endpoints),
+		.endpoints = rt722_endpoints,
+		.name_prefix = "rt722"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1316_2_group1_adr[] = {
 	{
 		.adr = 0x000230025D131601ull,
@@ -128,6 +162,15 @@ static const struct snd_soc_acpi_link_adr lnl_712_only[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr lnl_rt722_only[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt722_0_single_adr),
+		.adr_d = rt722_0_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr lnl_3_in_1_sdca[] = {
 	{
 		.mask = BIT(0),
@@ -191,6 +234,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-rt712-l2-rt1712-l3.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = lnl_rt722_only,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-lnl-rt722-l0.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_lnl_sdw_machines);
-- 
2.40.1

