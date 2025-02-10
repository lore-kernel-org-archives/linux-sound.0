Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE88224D6
	for <linux-sound@vger.kernel.org>; Mon, 10 Feb 2025 03:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739157606; cv=none; b=UB7f8+53tzgb7sWB8xgra88QKF7+qmBbmYzLavJRfqnuwToP1+6qmqLgxSqfbDxTukvKkJRp8fmV+XOgHWr2XVwUMYcs7PRL+KVGqQZv3rOuK1sYKIBeS0bugsaNz3SpYxylcIE4ACC9g2gh33UDrVJrlA33OVycj217HEcGLVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739157606; c=relaxed/simple;
	bh=nkEjCYSSGp8fpVNrYDPtwQZ274fP8Cn7prJKOxRYYT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V+p4sNiCiRoKJY+JFquu2ghdTR3xhQQjq7wJuhrxtls8rbOXOWEm+I42KPdD2bc6wcHZGO2drbJz1tlhiqEW9NsCxSB83aM7QkEwqGgRVEhzQeL9Nu2TWVxD23Y23Yvoo2fUvn1zR6U4uZTA15wswqjk4wZHTjG+8Y9Xhlv7e0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWZ/V3Xe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWZ/V3Xe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739157605; x=1770693605;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nkEjCYSSGp8fpVNrYDPtwQZ274fP8Cn7prJKOxRYYT8=;
  b=WWZ/V3XetYS7Rz3MQTyp1TjbxNbYDaKUhYYTPcn9S7t4+2daB0sq4gjo
   M8JJk9tXYoOfZU5f2VH4fFGd9s++xmIRoriVBOex0hHvi56+n8Xm8w4pi
   FcTqzvKdg64NtgknbvL4oQcSnmYspnXXczbmo1b4meC1Pna+KwAnPLE3p
   9TYWToV2mr41IJ35amjutZNZGngmikvbYSagGeVleJ1mOeb4gDWZPT11x
   ROfLC+o+//zzb8M/rut50XMmuf50RNZ2wneM8d2+mGwBObOxDM6lbyQk6
   RTAXK+pr18nGGw1K5ogzabqzB4ZnJb1ht1eBuuVvQUKsF8YSjTPc5NAPm
   Q==;
X-CSE-ConnectionGUID: 85GvsSl4SKuZPOCZXzw93Q==
X-CSE-MsgGUID: mLTZS4pBROe1WfeY1yfXaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="43488599"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="43488599"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 19:20:04 -0800
X-CSE-ConnectionGUID: 3Qr33D0nSTW6kFu8vhN/Mw==
X-CSE-MsgGUID: MME1LTG/SOaHo9YTTlndPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142945814"
Received: from unknown (HELO yungchua-desk.intel.com) ([10.124.221.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 19:20:03 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v2 1/2] ASoC: Intel: soc-acpi-intel-ptl-match: revise typo of rt712_vb + rt1320 support
Date: Mon, 10 Feb 2025 11:19:53 +0800
Message-ID: <20250210031954.6287-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250210031954.6287-1-yung-chuan.liao@linux.intel.com>
References: <20250210031954.6287-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

s/lnl/ptl

Fixes: bd40d912728f ("ASoC: Intel: soc-acpi-intel-ptl-match: add rt712_vb + rt1320 support")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 9eb4a43e3e7a..e487c4e1c034 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -270,7 +270,7 @@ static const struct snd_soc_acpi_link_adr lnl_sdw_rt713_vb_l2_rt1320_l13[] = {
 	{}
 };
 
-static const struct snd_soc_acpi_link_adr lnl_sdw_rt712_vb_l2_rt1320_l1[] = {
+static const struct snd_soc_acpi_link_adr ptl_sdw_rt712_vb_l2_rt1320_l1[] = {
 	{
 		.mask = BIT(2),
 		.num_adr = ARRAY_SIZE(rt712_vb_2_group1_adr),
@@ -337,10 +337,10 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 	},
 	{
 		.link_mask = BIT(1) | BIT(2),
-		.links = lnl_sdw_rt712_vb_l2_rt1320_l1,
+		.links = ptl_sdw_rt712_vb_l2_rt1320_l1,
 		.drv_name = "sof_sdw",
 		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
-		.sof_tplg_filename = "sof-lnl-rt712-l2-rt1320-l1.tplg"
+		.sof_tplg_filename = "sof-ptl-rt712-l2-rt1320-l1.tplg"
 	},
 	{
 		.link_mask = BIT(1) | BIT(2) | BIT(3),
-- 
2.43.0

