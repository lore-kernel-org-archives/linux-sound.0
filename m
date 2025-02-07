Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC0A17C68
	for <linux-sound@vger.kernel.org>; Fri,  7 Feb 2025 12:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931811; cv=none; b=NKlP0LxTAFkrlMPOLMLDhYrwL6lXwp9IaAj9DnDm2FVCtgbhFxFurx8tF+TVip4aBBfD/c7Y6DHpY6R63LDUhkqN8lgVeHBtBqrGYWve/99wkGh550gDCWX12nK1v4UZXJSOHh8j52zHyKmshgJZEJzORkiepaKVyGSRy3NXXsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931811; c=relaxed/simple;
	bh=76PcZgssK/Lv0TO58+llcjwrS/G+MOyIqE0jxxhjbJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgCdCLFhlUnGF8ACnbq0NDOYrYT00RelyRJvwLq4Pb/D0Sug+lDCxIIjIuYHHo3qlJvS0eWL3Hgm3IAroItIfZSS1iWN3UzslT6M4ZbFSDCQHm4hVXdiyAzRlJNxMmY6SziHyPjDZAB+pzlRZBTjwhJ423qrR9KBdFk6To9C2YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZ0g9/gO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZ0g9/gO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738931810; x=1770467810;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=76PcZgssK/Lv0TO58+llcjwrS/G+MOyIqE0jxxhjbJY=;
  b=bZ0g9/gO0NtMj9Z37kFOQAHN2PQe7pU1cY6yfRkuM9S3p5f5Yq6stvr0
   JycwazF0o67SKKlKJrQTlXx0+4K75zN5vbZRRkZWVuODF5jXRmYudAl6H
   128aLgme/O0/OiDoo0YMskurSakoF9Tn2GzKkxMBbvOyago/NSlSQimm3
   BWRZ3AHkGGlAozkqA2OXEtF2pVJxMNBr64FZtcC8vXqvKygIgrbWhdRHM
   0TukO5pSbcFsvdybxejLmfFyAPNfxkjMRCDAUnhCSvqMeRetMsomFvYXy
   7e8DtrfwXv6bGLUO4UneOht+L9WzwJwRpBECbwqttu46pf+WI65ZoQczu
   g==;
X-CSE-ConnectionGUID: 7lArn5X2SKCVNVGGY2FaGA==
X-CSE-MsgGUID: sX2MYgHITJyWCtymbqIWuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50959185"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="50959185"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 04:36:50 -0800
X-CSE-ConnectionGUID: NlJp6jbKT5+KmgT8Us8ixA==
X-CSE-MsgGUID: gw2kcXh1SJ2BEafAHmlxjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111364304"
Received: from johunt-mobl9.ger.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.223])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 04:36:48 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 2/2] fixup!:  ASoC: Intel: soc-acpi-intel-ptl-match: add rt713_vb_l2_rt1320_l13
Date: Fri,  7 Feb 2025 20:36:37 +0800
Message-ID: <20250207123637.215320-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250207123637.215320-1-yung-chuan.liao@linux.intel.com>
References: <20250207123637.215320-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

s/lnl/ptl

Fixes: a7ebb0255188 ("ASoC: Intel: soc-acpi-intel-ptl-match: add rt713_vb_l2_rt1320_l13 support")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index e487c4e1c034..dd7993b76dee 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -251,7 +251,7 @@ static const struct snd_soc_acpi_link_adr ptl_rvp[] = {
 	{}
 };
 
-static const struct snd_soc_acpi_link_adr lnl_sdw_rt713_vb_l2_rt1320_l13[] = {
+static const struct snd_soc_acpi_link_adr ptl_sdw_rt713_vb_l2_rt1320_l13[] = {
 	{
 		.mask = BIT(2),
 		.num_adr = ARRAY_SIZE(rt713_vb_2_adr),
@@ -344,10 +344,10 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 	},
 	{
 		.link_mask = BIT(1) | BIT(2) | BIT(3),
-		.links = lnl_sdw_rt713_vb_l2_rt1320_l13,
+		.links = ptl_sdw_rt713_vb_l2_rt1320_l13,
 		.drv_name = "sof_sdw",
 		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
-		.sof_tplg_filename = "sof-lnl-rt713-l2-rt1320-l13.tplg"
+		.sof_tplg_filename = "sof-ptl-rt713-l2-rt1320-l13.tplg"
 	},
 	{},
 };
-- 
2.43.0

