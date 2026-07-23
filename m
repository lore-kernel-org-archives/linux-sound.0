Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627313D812A
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 07:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790350; cv=none; b=PrkX8ZXLSXBY96q/QI2KR1Upl6e4/IB6s7fa2nHw/eCBQauMSMFp+h47GggrsIqSnUNx8b9BpBbbu8XnC/ZjMsxpUjy1qIJQUbR5g392T6J4epw13hFRUFTlEAHuuqVg0AYq9r7otRCkY78e8D/647reBK70nVS+srF0/aJq5rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790350; c=relaxed/simple;
	bh=bt2lhOb4XlEmbkeNp6bKRuI02cM5c/Y42Gt3y1wWeH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnfpHd1w2ilDrfv0UH7EjaRRS4MGjNTssn0v/7XghTlLtEtDbo48QPNBUqgrT+UDU60FBRAAysCiy/eSjwtIMOlkOBSgsxqLKtor/w450gXdF+XcoBgJnWkbNHS/pdRK+OzHYd2dhcaIwJVFws/G4sskIH9Zzg3lqqsCphj0vbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YY8qXbBb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YY8qXbBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784790348; x=1816326348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bt2lhOb4XlEmbkeNp6bKRuI02cM5c/Y42Gt3y1wWeH0=;
  b=YY8qXbBbcvXyfWp9nu1zIpBeGG1cSXAkjiY/JHif3vT/yimyrm0y63tP
   EdZxSL1msycJPnFsQelA1uDBFrmVgyBzeeueOg6i5SV2D/dfgE+nN0XmG
   xUknVw7HSQ46397yVP8IPw4w17Jm625PTJMXMRHZHIFwlWoe6Ici6qScj
   Y2zjlkTAn1FcWcaFzE08avXx2nXiS09/Js9/R/4Sxvyc34IqLtvxtmY5h
   CdsZ93gn2p/HTem8AYnOrK90W+yiJljy7SVZGyP3bXTgoc3lP9gzVPZLL
   Zj6WtMAO/YV3X/tzwuhLAE7esXEFFQo21K4iy1cEtou83+2CzfWN0/xRJ
   A==;
X-CSE-ConnectionGUID: K1FAqULZRzONwBFD4xZqww==
X-CSE-MsgGUID: osZEe9aVT0aXGt3UeJ6YCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96095047"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="96095047"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:05:45 -0700
X-CSE-ConnectionGUID: jllnjqeoTD6PPxokg9RfiA==
X-CSE-MsgGUID: KDVylnrKQUmF0D2/CNff3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="256522049"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:05:44 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/6] ASoC: soc-acpi-intel-ptl-match: add machine check for machines can't use function topology
Date: Thu, 23 Jul 2026 15:05:17 +0800
Message-ID: <20260723070521.870256-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723070521.870256-1-yung-chuan.liao@linux.intel.com>
References: <20260723070521.870256-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are still some Google machines that need to use the monolithic
topology. Add the machine check for those machines.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index f7694b2a2b02..41c059d43998 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -492,7 +492,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.links = ptl_rt722_l0_rt1320_l23,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt722-l0-rt1320-l23.tplg",
-		.get_function_tplg_files = sof_sdw_get_tplg_files,
+		.machine_check = snd_soc_acpi_intel_no_function_topology,
 	},
 	{
 		.link_mask = BIT(1) | BIT(2),
@@ -527,9 +527,8 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.link_mask = BIT(3),
 		.links = ptl_sdw_rt712_vb_l3_rt1320_l3,
 		.drv_name = "sof_sdw",
-		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
+		.machine_check = snd_soc_acpi_intel_rt712_vb_no_function_topology,
 		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l3.tplg",
-		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{},
 };
-- 
2.43.0

