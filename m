Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976073A8749
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 08:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387977; cv=none; b=gvJqO9JQuUV8of0S0hrJglQA/7pjchwvw98fRy/6yGvue/gJqyzGpK17iIXmn15Yp96riznIydKgURrqUxyFZWEomGkKoCPOsKpTrxx4vO4l8a6Mhh7DvepIbolA6sl+GS+w7CibBcawhlzywur/yE0ISPib3ucxsuTNgkfqqjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387977; c=relaxed/simple;
	bh=MwIWe2jvCaiK+YzhZ72d33YqfGklv1lDYwKHkxBUjpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HjBRj80tpBybSKsavpO/OO1HqdoIhyxOvnLE6o7lFluln/EOUMWKqNF4+dGYeaM7/U2QVssK8RpoKf1VqY8wYrLZsGMz91m30HXXO+QPuQyiMRx1YCoYIQvqPFLLMkA3q3tY3VCp/X6AAj7zZdoOZwPflu/le0PJEhoKXhL/Etw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FfLkCwUA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FfLkCwUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780387976; x=1811923976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MwIWe2jvCaiK+YzhZ72d33YqfGklv1lDYwKHkxBUjpQ=;
  b=FfLkCwUA0p1t32tSz3eM3S82vj4Awbh/8pLIAGmOFLmbdPbRn3C2EEaf
   F+nvf72dd3ldH/cBX7WQmeLm5qCZL1/88eNDkxoHtU0KYp3eZNdL+Zyk3
   SwWfjl44Go2rwHNPELNIyC7FlaKdgZafTNr61QPJtAP4r8+luMrYP0PCD
   8f8UfjWoXmNjEHJ3Bl9BLjki2xLk5NZpjFOCc8PKZIKNSYiHYBbkJh2Er
   3C2W4uzXNYs2vI9KJNFAlaiWMWjWIgSil/R0pyceZdt/i+a9aByAH/1pX
   g0B+8on5sTO+hWetFHa0ndcXdEwPmfktrTFk/aoIMwmtH9rDR7jWN/Se6
   A==;
X-CSE-ConnectionGUID: OZgCWVarSmikk8woUiJzPg==
X-CSE-MsgGUID: zIDK9Wp/R6Cf0VpSBuIU3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91742885"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="91742885"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:12:56 -0700
X-CSE-ConnectionGUID: 4YYWFNPbRl2ERjftJeTMmw==
X-CSE-MsgGUID: 2aKWHS/kRmePmBkn568Gjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="243949936"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 02 Jun 2026 01:12:55 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 2/7] ASoC: Intel: catpt: Replace RAM-helpers with resource_xxx()
Date: Tue,  2 Jun 2026 10:13:45 +0200
Message-Id: <20260602081350.1752773-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602081350.1752773-1-cezary.rojewski@intel.com>
References: <20260602081350.1752773-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For catpt_sram_init(), the exact same functionality has been provided to
ioport.h with commit 9fb6fef0fb49 ("resource: Add resource set range and
size helpers") in recent years.

As for catpt_dram/iram_size(), leave it for the driver initialization
only.  Have all other manipulations be done using resource_xxx() API
which are more familiar to kernel developers.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/core.h   | 1 -
 sound/soc/intel/catpt/device.c | 9 +++------
 sound/soc/intel/catpt/loader.c | 7 +------
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
index 7e479ef89ad0..3881164422b8 100644
--- a/sound/soc/intel/catpt/core.h
+++ b/sound/soc/intel/catpt/core.h
@@ -17,7 +17,6 @@ struct catpt_dev;
 
 extern const struct attribute_group *catpt_attr_groups[];
 
-void catpt_sram_init(struct resource *sram, u32 start, u32 size);
 void catpt_sram_free(struct resource *sram);
 struct resource *
 catpt_request_region(struct resource *root, resource_size_t size);
diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index b0a926db483c..b176aebea9d5 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -233,12 +233,9 @@ static void catpt_dev_init(struct catpt_dev *cdev, struct device *dev,
 	cdev->devfmt[CATPT_SSP_IFACE_0].iface = UINT_MAX;
 	cdev->devfmt[CATPT_SSP_IFACE_1].iface = UINT_MAX;
 
+	resource_set_range(&cdev->dram, spec->host_dram_offset, catpt_dram_size(cdev));
+	resource_set_range(&cdev->iram, spec->host_iram_offset, catpt_iram_size(cdev));
 	catpt_ipc_init(&cdev->ipc, dev);
-
-	catpt_sram_init(&cdev->dram, spec->host_dram_offset,
-			catpt_dram_size(cdev));
-	catpt_sram_init(&cdev->iram, spec->host_iram_offset,
-			catpt_iram_size(cdev));
 }
 
 static int catpt_acpi_probe(struct platform_device *pdev)
@@ -287,7 +284,7 @@ static int catpt_acpi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	cdev->dxbuf_vaddr = dmam_alloc_coherent(dev, catpt_dram_size(cdev),
+	cdev->dxbuf_vaddr = dmam_alloc_coherent(dev, resource_size(&cdev->dram),
 						&cdev->dxbuf_paddr, GFP_KERNEL);
 	if (!cdev->dxbuf_vaddr)
 		return -ENOMEM;
diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index 75457187b614..c577f2e17ddf 100644
--- a/sound/soc/intel/catpt/loader.c
+++ b/sound/soc/intel/catpt/loader.c
@@ -7,6 +7,7 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/firmware.h>
+#include <linux/ioport.h>
 #include <linux/slab.h>
 #include "core.h"
 #include "registers.h"
@@ -50,12 +51,6 @@ struct catpt_fw_block_hdr {
 	u32 rsvd;
 } __packed;
 
-void catpt_sram_init(struct resource *sram, u32 start, u32 size)
-{
-	sram->start = start;
-	sram->end = start + size - 1;
-}
-
 void catpt_sram_free(struct resource *sram)
 {
 	struct resource *res, *save;
-- 
2.34.1

