Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D450E390610
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 08:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477019; cv=none; b=I9fGdWXJg7i833BeGm6OfReN3rdFvX0323toF5GMvstNND/Cvk9dt8A/gANRZ6beoQkWGwlvtkVLhOFAtD/wT8bcnq4p8Z73d1So84H6EsCbDcrU0dE27KzQ4KHM654DIFu4YOU++SUm2+qEtcm4c1wK5DDJs6ERFyxw/AwKZFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477019; c=relaxed/simple;
	bh=pG79UHOf3g+XGylq/KvC2486UvRsL6NxAXMzNNH8P1s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KY4cQdP8xs4fWX1S0VYtKji0h2NmBLqRqVJDqJTfsKYvZrRBNe0ChyCNtXzEEUGYM4qWn/3dVquGozeug0HggklDZi314108kvpegGx4aiyxsFx3ZgF6e4a9LlCsJTw+NCY5e3d+J+kgt+okjpmkNIcvYHtrGWlv3kDVqoACtYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Or/5wq+g; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Or/5wq+g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477018; x=1812013018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pG79UHOf3g+XGylq/KvC2486UvRsL6NxAXMzNNH8P1s=;
  b=Or/5wq+gDDVQGwxMpSOJqyiTz8xEi7yIdtyThv6xjnmT2NSBz/vpvgeD
   nyIpLHx39OLaBriJgZC/zgulTYyXg70WVd9G0ENdho9+PRVH16yzUWp8d
   wUp4VJ/b+RnVYnA5KbdMIWG15Up+/j9Vt8LOsnWsSq/DYOrGb/q7pXqLd
   sme1+vIW5hRTlFJ4h3f45GZHie3Nm5wAzsWsAI6nHqBan/0d2LKGqZGXL
   4tzgZ4vtpmODdkKQqnA3i3UpyJadWnOvwl6SES37gH8Yvy3saYmyHfwRM
   GDzHRtkxAX1xVztnFPCqvYCuluSldvgz9ctoRbrx9WAflHFPBjJDuT9ZD
   A==;
X-CSE-ConnectionGUID: b6Pr92xESJKh8I/0ZVQ2eA==
X-CSE-MsgGUID: fKLplfmMQW6DNHmjA6Zomw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81182139"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81182139"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 01:56:58 -0700
X-CSE-ConnectionGUID: PGvuvuM0Rieut5aH2wOjCw==
X-CSE-MsgGUID: rqXxyKQfR0iqAWJkw4v34g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="248109334"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 03 Jun 2026 01:56:55 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 3/7] ASoC: Intel: catpt: Simplify the RAM-navigation code
Date: Wed,  3 Jun 2026 10:58:23 +0200
Message-Id: <20260603085827.1964796-4-cezary.rojewski@intel.com>
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

Add catpt_iram_addr() to the catpt helpers family and replace all the
open arithmetics with them.  Makes it easier to understand the code.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

