Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7EE32AADC
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 10:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765793422; cv=none; b=RxyXESHHW1bNf6G72wam1cpnMlQQWa4dEFlVT2qeLJyeRSddlZEjSVSNO972e7Asks7w/pkX5Es8Apc7uQfBAWPzbT3OAt4h8M8Foedvq3IkRBAbiVVGROzz8Ig1QOZCDeYheGPH+p0yfkwZPxw5rz8Fw4nJjoBefpnemmR/4Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765793422; c=relaxed/simple;
	bh=hZSA4UCqzuiWXPnAJOtEsOfew4T67VlslK3c0MX59/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qvP+ZpKlG045/+o7NxiEZ75w3PwW4OmYAXo35dnz7JV352qrXvvK1z68ZNE2wMb6O9jsBX8fGdhwE4ABe2RHMYHHPOYHL/ss0c4zDw/MDMp6rTpopiYNEmrRBgj6/HNhhzNTtC7s4oKWklPra0Ym9nS6qfcceoLU4/X7FLvroWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fh8q+hTP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fh8q+hTP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765793420; x=1797329420;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hZSA4UCqzuiWXPnAJOtEsOfew4T67VlslK3c0MX59/w=;
  b=Fh8q+hTP8SOa9kw+f/Qb1SVEtNV2i6ev1JnresZDsz9ul6m6WN3gpmoN
   f+bmvyVU7hXcg88DUy84y+Jydp+O3Y+qvdUwndKvp51R9N0bp4KrxPPLL
   q8jG4D0JmU+RM7T3+UTNYFWy/xyjUe9rNkKOizHb1iJJlpLnUt8npnqPw
   QtkCPd+jiC207mU0dhHGfH3sGFfOWooFy3OyPF0rbieZXGSW/UX5DcNiT
   4vPNpKxab5rzlfhF9LS0s6g+Sc67g9Sx6VP09QK7eXjJ2dubR11tXmnKU
   t9cDVOLOITkKzoy1AJV4UzYJ4z46zg0ZA/MoFQ6LdOYPSACXvU8LPG2Xb
   Q==;
X-CSE-ConnectionGUID: LPF46+iOSOqL1ZLA9YFdTg==
X-CSE-MsgGUID: 2uBvMkXkSjiP0njOAtjo8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="85282912"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="85282912"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 02:10:20 -0800
X-CSE-ConnectionGUID: B8ZIzPAmR/WV7uSlOEmAKg==
X-CSE-MsgGUID: B+UEdIm3Rn6tfS9R4mCD3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="201872320"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 02:10:18 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	tiwai@suse.de
Subject: [PATCH for 6.19 2/2] ASoC: Intel: soc-acpi-intel-nvl-match: Drop rt722 l3 from the match table
Date: Mon, 15 Dec 2025 12:10:36 +0200
Message-ID: <20251215101036.9370-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215101036.9370-1-peter.ujfalusi@linux.intel.com>
References: <20251215101036.9370-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Revert "ASoC: Intel: soc-acpi-intel-nvl-match: add rt722 l3 support"

NVL should be only using functional topologies for products, no monolithic
topologies are planned to be released.

In parallel a feature has been landed [1] which allows to remove the
entries from the match table for sdca codecs to rely solely on function
fragments.

Link: https://lore.kernel.org/linux-sound/20251014071335.3844631-1-yung-chuan.liao@linux.intel.com/
This reverts commit 41566e3de40616375e8dfe5455344558b79f9354.
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-nvl-match.c   | 49 -------------------
 1 file changed, 49 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-nvl-match.c b/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
index 2768dd10aaa0..b8695d47e55b 100644
--- a/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-nvl-match.c
@@ -15,49 +15,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_nvl_machines[] = {
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_nvl_machines);
 
-/*
- * Multi-function codecs with three endpoints created for
- * headset, amp and dmic functions.
- */
-static const struct snd_soc_acpi_endpoint rt_mf_endpoints[] = {
-	{
-		.num = 0,
-		.aggregated = 0,
-		.group_position = 0,
-		.group_id = 0,
-	},
-	{
-		.num = 1,
-		.aggregated = 0,
-		.group_position = 0,
-		.group_id = 0,
-	},
-	{
-		.num = 2,
-		.aggregated = 0,
-		.group_position = 0,
-		.group_id = 0,
-	},
-};
-
-static const struct snd_soc_acpi_adr_device rt722_3_single_adr[] = {
-	{
-		.adr = 0x000330025d072201ull,
-		.num_endpoints = ARRAY_SIZE(rt_mf_endpoints),
-		.endpoints = rt_mf_endpoints,
-		.name_prefix = "rt722"
-	}
-};
-
-static const struct snd_soc_acpi_link_adr nvl_rt722_l3[] = {
-	{
-		.mask = BIT(3),
-		.num_adr = ARRAY_SIZE(rt722_3_single_adr),
-		.adr_d = rt722_3_single_adr,
-	},
-	{}
-};
-
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_nvl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -79,12 +36,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_nvl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-nvl-rt715-rt711-rt1308-mono.tplg",
 	},
-	{
-		.link_mask = BIT(3),
-		.links = nvl_rt722_l3,
-		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-nvl-rt722.tplg",
-	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_nvl_sdw_machines);
-- 
2.52.0

