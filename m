Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB283A6405
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 08:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477018; cv=none; b=lTsMu+uPzpqUtp02W4q+RMbiQcAy9mUrjT81Kvj3TJlIwV7CONFAE+KjMG1NFf4vhiBOqNCkaQLRppEkXcobgrrO6szXcoDy8cRDgHRM+tlzRDCxSMimYrkt4v7vCObQKi5KVnJJiYqqrDE8EbWo3yZUPpwV/XAxb7LPWROLj/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477018; c=relaxed/simple;
	bh=bLNyrTc0lA8DN4azttOdZ18tQwH8VUgA8wM91nY94Qs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CPQPugKzbHHsVGWS4ATP0ow/0p3H/jh+JyM3ryupy919cYYBNHXFlI4jrDvkd37PeQQIYEoWTvoOVUykLiHGPgvUcJUb3qS9uSlKfqCppFdtlOQxi+VuAShjH3y4s8TQ+GYX/CRYJNkPXBMIM4v87D9kcfAeogtA8qW8WvxzldY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ED/WywoM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ED/WywoM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477017; x=1812013017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bLNyrTc0lA8DN4azttOdZ18tQwH8VUgA8wM91nY94Qs=;
  b=ED/WywoMXqJSXRh7y3T/F+dNjGAMQNz0IJzuIxiRgAeTZwOqK9QRbtI/
   /WJBvZAKauUqFYdZFS11MlmyD4w+3XpZLxk0nZdBrPqFhW668E9Auvjfd
   IBELl3zeKqMfFHoJm/1+pvXmMTjwK/Z76uWvdxlOIhJS2I89MEJJc7gWA
   x71bDx3EVuH5QIIbFcdJZkCLKat55zc6egq0bdk3WWyyBjHdur7USvWLs
   Pkwg7KCn1rpOp7h0Mnhqbkol1kSl8qsryHe1yVIkdcMWbtb4vNmDOrDae
   S2dUrsiRAKdnrefzPbU4z4SuQSh0uW+UnAK4uyKmR/NowSPX8CS2Hgcmm
   w==;
X-CSE-ConnectionGUID: 39crgVO4SSq9CcrNvX4Aeg==
X-CSE-MsgGUID: tEUO7kFkQBOS/gkoV48lGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81182131"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81182131"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 01:56:56 -0700
X-CSE-ConnectionGUID: BPUMJ1YrTmKjzlLeM7Rwtw==
X-CSE-MsgGUID: hyPo611fSOatC8cqRmFkMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="248109321"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 03 Jun 2026 01:56:53 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 2/7] ASoC: Intel: catpt: Replace RAM-helpers with resource_xxx()
Date: Wed,  3 Jun 2026 10:58:22 +0200
Message-Id: <20260603085827.1964796-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260603085827.1964796-1-cezary.rojewski@intel.com>
References: <20260603085827.1964796-1-cezary.rojewski@intel.com>
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

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

