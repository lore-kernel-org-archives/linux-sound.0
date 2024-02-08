Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1255281AAA
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411371; cv=none; b=jdAbIdRUiDtkvXLERXBgbd5oNPLTr33D69f4RaFpYt+g1Ponive/+P2rPNEyZJedchmrRVYYgqnhw0VHIPqOr33TSCmMCmsYDuLn0THupMHy5FWgXvLx4tJgGj5PlHOcmixcabyZfYx4caudNv0IKIEVHAUUWLV+GfMVqJBWaNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411371; c=relaxed/simple;
	bh=bBqCF2/OnOSVb2gLZk/AQzWEjtWBOf6SkDQcoEfQ+BM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pr1rMgBnTZt9jFajMRK4XmW2hA8njW8M/NmFOuGvwCUmYmS9uU2egVinwua/qxxjsz+3RPivYGUX8cPRUgKw96FDL5OmsXhkhhsBvXGaxmkeGhzM8etI7NDyMkcWz381X05w2p6PuuOqVe8WAnNjb08NrEnrywMcpoWl/TM01S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FjZOm1wK; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjZOm1wK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411369; x=1738947369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bBqCF2/OnOSVb2gLZk/AQzWEjtWBOf6SkDQcoEfQ+BM=;
  b=FjZOm1wK3aGGsQwyf3tBc4R8KShgZ3xWpGdhh0LtWCE5eAB0ZCIGXpE3
   L++dMPCLyw2XjYBHcG9jEgiLzhzBKvj2BBcJGGX8LFt9WtWnGry30KMsY
   ipmLTr04lIX8d1W7UwVlnT/15KzioiWV2sta9VgpMVqWPJIoI9GmQl+0y
   pWJojh7sGsnpwCE6SQwEU2cfDVGFboxxzmkgG9igABQ4uvrPlRAqx1N0f
   kOqmU4Lp4bW4Z/5jw8p2cpHinKAdKDxZe2I6FPYGJf/fk9bAAKE4Hs5Ha
   ayrifQIQJx85mfBoO2Up93SGT2C08jOMjutbGvDFbSdOXL4iheZjAEQKx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675440"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675440"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690279"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:06 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Chao Song <chao.song@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 22/24] ASoC: Intel: soc-acpi: add RT712 support for LNL
Date: Thu,  8 Feb 2024 10:55:43 -0600
Message-Id: <20240208165545.93811-23-pierre-louis.bossart@linux.intel.com>
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

This patch adds RT712 support for LNL.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-lnl-match.c   | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index 5897bb6b28b8..3d48e161cb33 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -36,6 +36,21 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 	.group_id = 1,
 };
 
+static const struct snd_soc_acpi_endpoint rt712_endpoints[] = {
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
+};
+
 static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	{
 		.adr = 0x000030025D071101ull,
@@ -45,6 +60,24 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt712_2_single_adr[] = {
+	{
+		.adr = 0x000230025D071201ull,
+		.num_endpoints = ARRAY_SIZE(rt712_endpoints),
+		.endpoints = rt712_endpoints,
+		.name_prefix = "rt712"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1712_3_single_adr[] = {
+	{
+		.adr = 0x000330025D171201ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt712-dmic"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1316_2_group1_adr[] = {
 	{
 		.adr = 0x000230025D131601ull,
@@ -81,6 +114,20 @@ static const struct snd_soc_acpi_link_adr lnl_rvp[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr lnl_712_only[] = {
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt712_2_single_adr),
+		.adr_d = rt712_2_single_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1712_3_single_adr),
+		.adr_d = rt1712_3_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr lnl_3_in_1_sdca[] = {
 	{
 		.mask = BIT(0),
@@ -138,6 +185,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-rt711.tplg",
 	},
+	{
+		.link_mask = BIT(2) | BIT(3),
+		.links = lnl_712_only,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-lnl-rt712-l2-rt1712-l3.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_lnl_sdw_machines);
-- 
2.40.1

