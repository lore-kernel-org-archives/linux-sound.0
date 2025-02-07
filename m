Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D648D1E50E
	for <linux-sound@vger.kernel.org>; Fri,  7 Feb 2025 12:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931810; cv=none; b=WoFotX8hr2frX83weZK7Q6NQPy0AlgZG9EhFHsW/1oYDKIBGnaWf3XRzChjdZVlQ2LNSSocbryCzl8dyEta5BMUM9/bWFlOXNtyifCWbAomo3B8EPoiQ5jDqZuhKhlLZIKqeJKyY12eErYDJUlDwu0Rj9Sd4/cwCbFvBzigMegQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931810; c=relaxed/simple;
	bh=nkEjCYSSGp8fpVNrYDPtwQZ274fP8Cn7prJKOxRYYT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FM+NENcDZKSWUh2iCHhAPLkiXx8PVrLZbaPe1NlnuoG41ao6BsNH2mnXjzqhShHQyuctQQyaO9FScEAXmygnMK7USEvYlaI5znZWuWQRhrZ2uupu2/bfylR7VpL8dyYD0Hvr/vgMSP8RcGS63fS67rGphMgtb6s/xc7go09CAXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJA3Ybn2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJA3Ybn2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738931809; x=1770467809;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nkEjCYSSGp8fpVNrYDPtwQZ274fP8Cn7prJKOxRYYT8=;
  b=FJA3Ybn2jJ4MJeNM2ARyZYu+UrX3p0SPiQZ5RC0BmipFFfY4rwUPXlVq
   auf8EB2pYF0WcX3dYQ5gssuaAoiM1awbko4vTbCrCaI4QoIfAXugNHLhW
   RmvzGJUbqXM9B3yG34Qb1P0cz8/NOoMRYeVE0k1TqSEO4x9bIHepEwWCo
   0KYcbbrL7bkcwdWELlAgaaHxwr4FAwHs3vdNyf46MRo6CkRP8YJjUVmWv
   4vVxnIEB3tREQTTFLbejjxuJlCD8xQi/V4yUFZVjB1Wu1VleRHAT046/E
   oiLggPpgPkQ2u+EOv8CWq/nkG6opOllbLa58OAZmlbWpLqDFKhvHVKut8
   g==;
X-CSE-ConnectionGUID: cn/we75sQvacNEkWqRsmvg==
X-CSE-MsgGUID: IrAoEFQfQOCbmqGV12utOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50959180"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="50959180"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 04:36:48 -0800
X-CSE-ConnectionGUID: fKqxo7Z+RGyIDQMP8h/d4g==
X-CSE-MsgGUID: g5G42bwSRpaUm2M8dCbi/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111364299"
Received: from johunt-mobl9.ger.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.223])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 04:36:47 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 1/2] fixup!  ASoC: Intel: soc-acpi-intel-ptl-match: add rt712_vb + rt1320 support
Date: Fri,  7 Feb 2025 20:36:36 +0800
Message-ID: <20250207123637.215320-2-yung-chuan.liao@linux.intel.com>
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

