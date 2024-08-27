Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAEE1BBBF5
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 12:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761995; cv=none; b=IDRHtDyJQayZk1Eg9mFotyzD+YI+EM+ssnLo3zHJp8PrYKCSLu8ICDk82IabW5NbO8/c87zlvJz88ZKIoEFl9wDr6SD34u2+Tn87UaIMuZiFcIfuXsRnzB7WJ2awdHCqez2OfrcocCyTdKmirAAPlg3Ek1JKOOXFU9kyquBsYOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761995; c=relaxed/simple;
	bh=plgYLZUH4hSB8RBHdWrUYinlJ2D8P8EfiRGnW+DxjRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kslbZAdbcE+Se/bM/lcA9FniiZM7RBYL91f7lfsa+5Ha1YmiTgC8/RfcszY8uKGsFeOJ1r39U3eNYbCAZprKJbMC+GZ0fjwnnCrLOKNIpulGMvmeJgCDBNEZma6DhjGDkY4DRphcczM2bIEsrQ8nqowH/78OkgdDT7WAsRwWPy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sbh6jngk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sbh6jngk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724761994; x=1756297994;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=plgYLZUH4hSB8RBHdWrUYinlJ2D8P8EfiRGnW+DxjRs=;
  b=Sbh6jngk0rBVdFc4qI5EkDtCXcaW2C2P/+I4TxNJcq4fnMnex31iXLWd
   weJEkSJPCRpHIq9iLZ/KUDDD9O47kBUT0B8YjqYkUQunE20sF0eniFoPq
   VRs5lu/dDiQvoxNLFfLJN34nCiGKSgCxRmDf5yQp8EwXDpZnCgmHaL6FD
   bbeGvYL+FE7seQdssNZ1mGRyQTlsMSBWqmWhZnwuLN220kjFkJ2xnS7Z7
   si51x4wl1MvlBtjeCOg+j6ATQbGDcUyi5ES6ulcGfy6fZ7biDVEQQi/R5
   vQkW7hoIyR2p2+vO/ec4n0SXPl29PPmGkyuNbe9REHownygMmRgHwijQ6
   g==;
X-CSE-ConnectionGUID: 2+VrbTv2SgerSwl1iwQ+EQ==
X-CSE-MsgGUID: mRg/ozkbQKiYVJRS7EIRuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13235537"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="13235537"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:33:13 -0700
X-CSE-ConnectionGUID: RMTPYqCGQc6DbXibbX4PAQ==
X-CSE-MsgGUID: GsPZAnbXS8eNxtwcXPpZiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="62676855"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:33:11 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 17/17] ASoC: Intel: sof_sdw: Add quirks from some new Dell laptops
Date: Tue, 27 Aug 2024 20:32:15 +0800
Message-ID: <20240827123215.258859-18-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
References: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Add quirks for some new Dell laptops using cs42l43's speaker outputs.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 58 ++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b06948c16b3f..855109d22131 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -480,6 +480,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
 					RT711_JD2),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CF9")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
 	/* MeteorLake devices */
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -540,6 +548,56 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CDB")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CDC")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CDD")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CF8")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
+
+	/* ArrowLake devices */
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CE8")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CF7")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
 	{}
 };
 
-- 
2.43.0

