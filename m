Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C74216726E
	for <linux-sound@vger.kernel.org>; Fri, 30 Aug 2024 08:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007287; cv=none; b=ufDGKTsoGhKYEpub6fdiyVjAJ+qgpX1MeiSFGxrDgEgy7zFSY3K5MqoqySHlPZ2I+oBQfazb+soVBT1dZpKsX0Tu7V3gCA0NL0YYr7SOdhzGUIRcWsxk31tKsE2bpBx7PeKoq1JC+8kyd7Ih4Bd8kXVdHPSrQoB67Z//0hyrJqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007287; c=relaxed/simple;
	bh=3sL6IgCE1ws9iA6hRFiFBk19JDaySIROpKkdZNwYThk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oGcG9gnywZPX/Fdv1muAKMY7FgcktQXmSoC80G5vWBOvt54hgyyR+iYedWHus+TvpXiABsE7RvMVdf/XodVy/ocMLyg3AC+73ZekJuM5qr4a231hjGTZcTWQxX0VNX2KiwITiyO62DI18dJLX3M2HSWKDnhcFlF3SY+uhGAp5Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QsdUQUnc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QsdUQUnc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725007286; x=1756543286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3sL6IgCE1ws9iA6hRFiFBk19JDaySIROpKkdZNwYThk=;
  b=QsdUQUnc/VIWoNlOZHVs/ng2gLbYTzEwhJObfrFCUmbAMK56E0vOudsG
   6ytatJa436Fx0S5ViEEJjKe8ZFHO4bC2HS1uRRO5GmYLIT59VpJlbHmL6
   oeUgV5aDWZO9uEftCiHg7xFZ381bVX3XjjXvhS+tHtKUNbZucpIhLmJ1j
   N/BwNkfm5UufuGM/InERw+Fo915m+FMRPtdqO/2pxRPBwXmLjlVrdanoB
   RNgoWBU0AiFW7RAutl/TTD6Z6jNikyWQYCriyxYkjSVXvBF/PimphPIte
   W8pCl/XnY9emmSvFSuBFwAXsdZdT5ce3EHSTt9Xhu43I3jrCDO0xPDsRE
   A==;
X-CSE-ConnectionGUID: QYCJWHeWQHC4I2sCl3R/ZA==
X-CSE-MsgGUID: 8zUm4koTRxWNSqdP+oH06Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="26536445"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="26536445"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 01:41:25 -0700
X-CSE-ConnectionGUID: 8Crz6DseQNO8pCm97eiu6Q==
X-CSE-MsgGUID: bnatcNcmTku9FGMcMoNTCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="94665926"
Received: from unknown (HELO yungchua-desk.intel.com) ([10.247.118.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 01:41:23 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 3/4] ALSA/hda: intel-sdw-acpi: simplify sdw-master-count property read
Date: Fri, 30 Aug 2024 16:41:04 +0800
Message-ID: <20240830084105.154062-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240830084105.154062-1-yung-chuan.liao@linux.intel.com>
References: <20240830084105.154062-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

For some reason we used an array of one u8 when the specification
requires a u32.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/hda/intel-sdw-acpi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
index 7a3735e94545..582e761e7b9f 100644
--- a/sound/hda/intel-sdw-acpi.c
+++ b/sound/hda/intel-sdw-acpi.c
@@ -57,7 +57,8 @@ sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
 {
 	struct acpi_device *adev = acpi_fetch_acpi_dev(info->handle);
 	struct fwnode_handle *fwnode;
-	u8 count, i;
+	unsigned int i;
+	u32 count;
 	int ret;
 
 	if (!adev)
@@ -66,7 +67,7 @@ sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
 	fwnode = acpi_fwnode_handle(adev);
 
 	/* Found controller, find links supported */
-	ret = fwnode_property_read_u8_array(fwnode, "mipi-sdw-master-count", &count, 1);
+	ret = fwnode_property_read_u32(fwnode, "mipi-sdw-master-count", &count);
 
 	/*
 	 * In theory we could check the number of links supported in
-- 
2.43.0

