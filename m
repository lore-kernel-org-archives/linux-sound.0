Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6300036073E
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 10:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774001541; cv=none; b=fEw7nM3o3ApWerSPdRwljlXjk7EVbqpfCy5fYkQl1t//8msK+apRwucWRCGmvmzMAawfgKXnLDmffTtccWi7uQJ/h+4Oiu1R3RyBD/3v1X+YRZWV+/72I9P/hNJ97YcCKh7L7ptDUgRiDo+WjncvJPODTcNjUoX7lPyvY/oGCes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774001541; c=relaxed/simple;
	bh=erJc+wkLLjvb8r2SDzIhX5Xk+o4+I6SEg3fPQSDUhQo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B+u0g+BgPdKyMBd9RYK5hon+AjfAiNmLQTbmpQvmFTV5S4UyXJki3RT0/H/HWl+DaiJPtFbz5juygubh739AcRdS/P3ii8BRdLHp9zL4tWfV14jm52vs6oMu2LVnS7monmfi5tbIzAl7uj0mdUHYm8dZF9JDgIlilvrd5pbF4yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+Kq3j1K; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+Kq3j1K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774001540; x=1805537540;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=erJc+wkLLjvb8r2SDzIhX5Xk+o4+I6SEg3fPQSDUhQo=;
  b=M+Kq3j1K6C3+Fw7x78M4TNQsNh88Uks3JO7xjsBTwYvDU4GFdZHSdJRZ
   RyQl/iVya+IRO6F/XKlAeDG8FNLUeDKpvjKeayNEvBATG9FKBoMeMIAzS
   3a8jl37q4GooeKUJOh3AjS7+QGUdyQYj7pxgdJwYHdaOEoRkbWDYgQuXq
   +4ydx3mkECugG/1xi2aDKh7vd3az33XuN1gV+4+el+fmBZE1PqG8aVcAL
   mpIUDRYSMLleYAgvw49+EZM/xVC5JBcIt9p+DXN1ngi7BIgCD3SjUNFNU
   10WcGIjCYKIh+G+GGbRSgcE6S/LE6vAlMpC1yyKAv49O50XJRF2LGqfm+
   w==;
X-CSE-ConnectionGUID: DHlLOANkRHuQ/rvmGRBBgw==
X-CSE-MsgGUID: BOlwIQf5Q1ynF2AImVwccw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="85786489"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="85786489"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 03:12:20 -0700
X-CSE-ConnectionGUID: WvGT1Qg5RMuW1ThVLLL1QA==
X-CSE-MsgGUID: RSS0VndzSRSSIz3UKvr1Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="227974125"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa005.fm.intel.com with ESMTP; 20 Mar 2026 03:12:18 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	andriy.shevchenko@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH] ASoC: Intel: catpt: Fix the device initialization
Date: Fri, 20 Mar 2026 11:12:17 +0100
Message-Id: <20260320101217.1243688-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA mask shall be coerced before any buffer allocations for the
device are done.  At the same time explain why DMA mask of 31 bits is
used in the first place.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Fixes: 7a10b66a5df9 ("ASoC: Intel: catpt: Device driver lifecycle")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/device.c | 10 +++++++++-
 sound/soc/intel/catpt/dsp.c    |  3 ---
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index b5f4361d4465..ca4fd18b6a6e 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -281,7 +281,15 @@ static int catpt_acpi_probe(struct platform_device *pdev)
 	if (IS_ERR(cdev->pci_ba))
 		return PTR_ERR(cdev->pci_ba);
 
-	/* alloc buffer for storing DRAM context during dx transitions */
+	/*
+	 * As per design HOST is responsible for preserving firmware's runtime
+	 * context during D0 -> D3 -> D0 transitions.  Addresses used for DMA
+	 * to/from HOST memory shall be outside the reserved range of 0xFFFxxxxx.
+	 */
+	ret = dma_coerce_mask_and_coherent(cdev->dev, DMA_BIT_MASK(31));
+	if (ret)
+		return ret;
+
 	cdev->dxbuf_vaddr = dmam_alloc_coherent(dev, catpt_dram_size(cdev),
 						&cdev->dxbuf_paddr, GFP_KERNEL);
 	if (!cdev->dxbuf_vaddr)
diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
index 008a20a2acbd..677f348909c8 100644
--- a/sound/soc/intel/catpt/dsp.c
+++ b/sound/soc/intel/catpt/dsp.c
@@ -125,9 +125,6 @@ int catpt_dmac_probe(struct catpt_dev *cdev)
 	dmac->dev = cdev->dev;
 	dmac->irq = cdev->irq;
 
-	ret = dma_coerce_mask_and_coherent(cdev->dev, DMA_BIT_MASK(31));
-	if (ret)
-		return ret;
 	/*
 	 * Caller is responsible for putting device in D0 to allow
 	 * for I/O and memory access before probing DW.
-- 
2.34.1

