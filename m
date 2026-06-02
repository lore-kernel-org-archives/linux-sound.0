Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36433A8749
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 08:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387980; cv=none; b=H61/fRYnt2nzjK9EydEkZHyJdp2QAwFAI5MZ574HNRtF4KlIJ1CyROYxuDsmxPEcQxO637E9Ywth67hbOdowQxQx3g16eJmq1NhRlOW6m7xNDlPGLThGR6FaIHLSfk2oJiP5wOU/3emazJ8C6g1tkr9zWhLENGibeP0mbrofFKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387980; c=relaxed/simple;
	bh=AX5PKoi4S4V+mv++qTS49/A8EF+5K67AmE5Qqv7a1II=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qpyscbc2YbPwtlMhMdpoe87CWyQHGcj17q5NRJOfvEWDOxxAYnJk5bQKMri5PZyXIaK4gKNbMzlBM7KF2CF5oubvDYwekk5LwFaojHmQoYdHrBmlhVeUSu/ufLfk8hp00F4M9MGCEnEl1u5wYwieEu3Zx3q8K632B7JqECvJq/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYzr6mTP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYzr6mTP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780387979; x=1811923979;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AX5PKoi4S4V+mv++qTS49/A8EF+5K67AmE5Qqv7a1II=;
  b=jYzr6mTPPXoCLeKagEUF1jLbbhPgWNfE3URW7r5zJRPd1IO3rhrjCHz3
   kU1prTpM4WgBcHlqHZUNdL064aFDbIIPz8QU00cBrVaa6UhxvwGBs/GY6
   cDl5s3A9wAX7v+xu1+kPgsLHzhH9y2SO3H/te4HUUdjJHNmk89UOOgQoU
   a3b1nZP0p2TFpgE255MoMTYA5dm3XYfOdqDlhtNxinI2BFd0H8yylRaFd
   BEGBlmJdU858kmPfIxNFEdHNzM3bOkWj2voEFxoHjaV9EK/CXrTWRfKHB
   bvKTbWSr2UOFjPZUKkRIsNCjQeQSaPNzTXc+GcbaB8+KkYt2A+R7LEn9r
   A==;
X-CSE-ConnectionGUID: b+CJ1stpTXOcdzOEMnxTyA==
X-CSE-MsgGUID: t/j9utx+QZSdkM2H8ZMHKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91742893"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="91742893"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:12:58 -0700
X-CSE-ConnectionGUID: ec8bI2uAT2iE6azTmjeDkQ==
X-CSE-MsgGUID: wCGg+v8gRviganE3kfRmLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="243949942"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 02 Jun 2026 01:12:57 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 3/7] ASoC: Intel: catpt: Simplify the RAM-navigation code
Date: Tue,  2 Jun 2026 10:13:46 +0200
Message-Id: <20260602081350.1752773-4-cezary.rojewski@intel.com>
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

