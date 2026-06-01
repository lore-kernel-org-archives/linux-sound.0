Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050AB3AE1B1
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322939; cv=none; b=BAoTxDEwGOEOPZHG8MumqMCpJ32QoUPjzucI6eoDWchWcyWBNJehMu6KYHfwWKeLPgcS6q0aSmmnMHW/3rMrhNscVDV8Lh9KDk9usQl5iPy7Y4YAfYYLh00LJggToJAiLPhwRdckyfLc29LLbps7HosQde3wy4e55NNCOVAzxBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322939; c=relaxed/simple;
	bh=Pj4rE8ZKu+eAw4sum9XZWM9ZUSOfEkRnMtcpj1LYtVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H/bjoXrRQxnI/ssAK/wi/x77PbrAX0w9oYdMaDu/RZhG3Oo4Yd4C0u9l2jTjM9SHUSixtR4wh+VM2OZ0IVJOVVVa0AYlJOGwteBufssxaQkTeltKBsO6Q9ewaCUxw/ok+0cUkGcGm9lJIyZ0c304LM4LtGSxs2obnIJHlPymEGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVkkQnmK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVkkQnmK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780322939; x=1811858939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pj4rE8ZKu+eAw4sum9XZWM9ZUSOfEkRnMtcpj1LYtVM=;
  b=QVkkQnmKu4o2b1kkIOwagQv5+/kiM1hUViYwVYCo9N2FtK30qHErs+a2
   nveDZ2mqWsvWg0qh3GdS5gfpbKV7cCMdo3Id1nqpqUsHBr/cKem/ds69u
   oYYAzbMvt3Q9hNaofu55CQRbXi5SAHTFd7PaQ1qGC9i1F9MFG0qIkl0Ju
   dqUXnAb2dxpNIpX/GDcS/6gJMPzp0tasT3O+pFiTTTAekL72trcAJGsfH
   JMMNGGZ4MnK2poONj/c2IkPpqBcpgUkv1yTbr6nOgijI4FbSWsN213AEz
   Zd1k/fEB/DFAs/QfxIh1VzGlBPYYCOqo1OkE1MrY8U+18ndO+CTgZQ2mY
   w==;
X-CSE-ConnectionGUID: BEPqUz2HT1af7ATD2B+W/Q==
X-CSE-MsgGUID: 7aSP0gjYSR2ODmZGzYpvvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81140259"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81140259"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:08:58 -0700
X-CSE-ConnectionGUID: vOX5wYrgR5KV5ymNubJqDQ==
X-CSE-MsgGUID: nKZE2quORZ2/diylY14zoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243704921"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2026 07:08:56 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/7] ASoC: Intel: catpt: Replace RAM-helpers with resource_xxx()
Date: Mon,  1 Jun 2026 16:10:26 +0200
Message-Id: <20260601141031.1606847-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260601141031.1606847-1-cezary.rojewski@intel.com>
References: <20260601141031.1606847-1-cezary.rojewski@intel.com>
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
 sound/soc/intel/catpt/device.c | 9 +++------
 sound/soc/intel/catpt/loader.c | 7 +------
 2 files changed, 4 insertions(+), 12 deletions(-)

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

