Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575333A7F48
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 14:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322942; cv=none; b=I6TLc+9Vj/qEmwB/wuYxYMnc4yGMl0dg8nU9djkTCOddhuCF+QxXE4xf3dOTTVQuSJ7qJZrPi/pCJgmt3iiQpyDCfRsOTxlMajr+eEdadZMqqezAGW6bofsZypv64sFhK1hAR1baH7hKecoffJc2hcInT6+f8SbwH7Q4BBk1y74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322942; c=relaxed/simple;
	bh=AX5PKoi4S4V+mv++qTS49/A8EF+5K67AmE5Qqv7a1II=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cacajA7bZZMNbJkkXjBpJoHVXlCrErkaRU5HzyQykiEExYIH2btp+zmkOPmA7pH03tXa7ple5ju9clkQpGtSsAb27NS7jy8R59D8na5QPnmmHZQNKzeb0vzHveucnRt+DWz+FfRcyhf8jNnPR1qtOoooK/k7QsJPKtAaYzRjOZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JRTn9iCT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRTn9iCT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780322941; x=1811858941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AX5PKoi4S4V+mv++qTS49/A8EF+5K67AmE5Qqv7a1II=;
  b=JRTn9iCT+gOFpz5mhPsh9wEQ2sEetrtJcocIMIYaQNdI+1AkFa733irq
   LJSCdkKUsEv9Pu1zIG3pxBI/AJ4lNeqP+zesBOMIrEcssC9d5L84wWdsN
   y7vLJzZ7NUuwbJh6FD8VuE3xTCUzYcAu/BCWAKue3TktSe8zg26UKomE3
   ffGgx8UKNba7ec4c2QrYeLBBkw1LAsMlqqcXADWMOsQjLMVhsrda9jKPt
   YoUyNFIw3oqDhXp+6tFKs7LHX4YqV/1f6b+NKGz79ojYeupKU6zVQ/d0K
   JcP7h6S8P0V34B/oSRjmMl2TwzbKci8pjE1ylN0b5N6Pr9O/4EH4tsnl2
   g==;
X-CSE-ConnectionGUID: +DRj8loATqyhDuW8Bva7Gw==
X-CSE-MsgGUID: 1MF2H2s9SxGn8GvKbtWmZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81140270"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81140270"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:09:01 -0700
X-CSE-ConnectionGUID: vwaZvGa3TsGrSHax4QeLsg==
X-CSE-MsgGUID: CKosNfCvS5e/YX2YJ5mgcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243704961"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2026 07:08:58 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/7] ASoC: Intel: catpt: Simplify the RAM-navigation code
Date: Mon,  1 Jun 2026 16:10:27 +0200
Message-Id: <20260601141031.1606847-4-cezary.rojewski@intel.com>
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

Add catpt_iram_addr() to the catpt helpers family and replace all the
open arithmetics with them.  Makes it easier to understand the code.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/dsp.c       | 6 +++---
 sound/soc/intel/catpt/registers.h | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
index b1865d10f995..60ec561d670c 100644
--- a/sound/soc/intel/catpt/dsp.c
+++ b/sound/soc/intel/catpt/dsp.c
@@ -122,7 +122,7 @@ int catpt_dmac_probe(struct catpt_dev *cdev)
 	if (!dmac)
 		return -ENOMEM;
 
-	dmac->regs = cdev->lpe_ba + cdev->spec->host_dma_offset[CATPT_DMA_DEVID];
+	dmac->regs = catpt_dma_addr(cdev, CATPT_DMA_DEVID);
 	dmac->dev = cdev->dev;
 	dmac->irq = cdev->irq;
 
@@ -498,7 +498,7 @@ int catpt_coredump(struct catpt_dev *cdev)
 	hdr->size = resource_size(&cdev->iram);
 	pos += sizeof(*hdr);
 
-	memcpy_fromio(pos, cdev->lpe_ba + cdev->iram.start, hdr->size);
+	memcpy_fromio(pos, catpt_iram_addr(cdev), hdr->size);
 	pos += hdr->size;
 
 	hdr = (struct catpt_dump_section_hdr *)pos;
@@ -508,7 +508,7 @@ int catpt_coredump(struct catpt_dev *cdev)
 	hdr->size = resource_size(&cdev->dram);
 	pos += sizeof(*hdr);
 
-	memcpy_fromio(pos, cdev->lpe_ba + cdev->dram.start, hdr->size);
+	memcpy_fromio(pos, catpt_dram_addr(cdev), hdr->size);
 	pos += hdr->size;
 
 	hdr = (struct catpt_dump_section_hdr *)pos;
diff --git a/sound/soc/intel/catpt/registers.h b/sound/soc/intel/catpt/registers.h
index 64bd534a76ff..864802bd7809 100644
--- a/sound/soc/intel/catpt/registers.h
+++ b/sound/soc/intel/catpt/registers.h
@@ -144,6 +144,8 @@
 
 #define catpt_dram_addr(cdev) \
 	((cdev)->lpe_ba + (cdev)->spec->host_dram_offset)
+#define catpt_iram_addr(cdev) \
+	((cdev)->lpe_ba + (cdev)->spec->host_iram_offset)
 #define catpt_shim_addr(cdev) \
 	((cdev)->lpe_ba + (cdev)->spec->host_shim_offset)
 #define catpt_dma_addr(cdev, dma) \
-- 
2.34.1

