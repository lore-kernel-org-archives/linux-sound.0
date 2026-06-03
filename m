Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A95A42669C
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 08:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477024; cv=none; b=pRRn1y8Tytl9HfDmpafPWXyEi4a255yB5WG2zg3sJxJ9Pk+ANACrCmbMb0BEbB5INK5ozEEE21CCtK8FkEhpsnGhpdE/k3ze8rppWRXc6DrJsEQJV4lmeYRvswoLj5C14iAt61PXwNvMlzyK+90vO0dZq3Grgj/5tycss0k+bzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477024; c=relaxed/simple;
	bh=fOZ2EqVsfCximIlhbR7Te/+PWjLsAAyCDA7bObWjcy8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=he8odzM0rsWTBsdDolYMixaEdWJaPi2UaY/1g/GjK6TieGIQAhgrMtL4xgi9PZFBhELrPcUvBmjADU+8XHTRH+A/8h8gJsEVerIBhRyNFk0MBJeTwWsI9gKs4TsCIRbWxBKnZj32xYZc2qUgzLjZ4toQhaqMSUH5GU6tYmeMhXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gpl1jJy/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gpl1jJy/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477024; x=1812013024;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fOZ2EqVsfCximIlhbR7Te/+PWjLsAAyCDA7bObWjcy8=;
  b=gpl1jJy/lFkczDW2B2XFC5jndGNQ4nX/RTzEwCycYCmqIyS8yHhL0qjg
   ED6x7HddmCc3oNFkae4018cii1UbLa5uX/RY4ROsCwIruQrkYDlR+mRQD
   kaot0XDP+2ZXptGwGXKQdVEOocELczCxhN2vAW9kLrvcNMmUXxMzCvVxY
   EDyj614viNw+Q93GxrxLhgsRTjWbffdf8t6/XS/IdLILslO75I/W080ZU
   De+IVy/DoCI6r3d0jmSDZtDBlcCNU3IT0laOGvuFVB3xOMQjXRrkgWL56
   SnrqI6pjvRzZW8xSXKAW/hJhGoDwITI3Lw2cP0YirMS0CKzIF+6gJ7psA
   A==;
X-CSE-ConnectionGUID: PWaVPR3lRiCwHpR/YTLkQw==
X-CSE-MsgGUID: S3NphopqS7CzDZK7VBaq0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81182156"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81182156"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 01:57:04 -0700
X-CSE-ConnectionGUID: zOOSzxxeTVy5TIG93BqnzQ==
X-CSE-MsgGUID: NCE19+9yQmmltSdmOQWudQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="248109358"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 03 Jun 2026 01:57:01 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 6/7] ASoC: Intel: catpt: Drop manipulation of the obsolete direction flag
Date: Wed,  3 Jun 2026 10:58:26 +0200
Message-Id: <20260603085827.1964796-7-cezary.rojewski@intel.com>
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

Setting up direction for struct dma_slave_config is obsolete, see the
description of the struct.  The transfer performed by the catpt-driver
is also always DMA_MEM_TO_MEM not DMA_MEM_TO_DEV with preparation step
being dmaengine_prep_dma_memcpy().

DW's ->device_prep_dma_memcpy() always fixes the direction to
DMA_MEM_TO_MEM even if its user fails to do so, see
drivers/dma/dw/core.c.   While the change impacts number of checks done
by ->device_config() - p/m buswidth checks are skipped - fields being
fixed up in those i.e.: .dst_addr_width and .src_addr_width, do not take
part in DMA_MEM_TO_MEM transfer.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/dsp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
index 60ec561d670c..960344991b11 100644
--- a/sound/soc/intel/catpt/dsp.c
+++ b/sound/soc/intel/catpt/dsp.c
@@ -44,7 +44,6 @@ struct dma_chan *catpt_dma_request_config_chan(struct catpt_dev *cdev)
 	}
 
 	memset(&config, 0, sizeof(config));
-	config.direction = DMA_MEM_TO_DEV;
 	config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	config.src_maxburst = 16;
-- 
2.34.1

