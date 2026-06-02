Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB38C3A8749
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 08:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387986; cv=none; b=VuASNttEm3Rss6AlOrrWPBe3aCU4mpoBU/+AsolyjUtx+YnaoVsdqp8afR2UbzSdSLJxy0V3kDsKj90dXLpVoCKSUbw3x7/8ir/WxwKgN2/LAXwglWdtJRNmf0vONvZIWn30PFWXTYIunQy0E4vtpCbuKVYBjjGorhOOI3lQsTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387986; c=relaxed/simple;
	bh=JG6w9o3vi3vf2uqnRBhUW9RicrZBepOg8iror8IRnFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UNwP7CfaEpADkXMkqdVfOAY7WSo8XE/x280sXRra8TeNfQfBuoJSUYbCA49tj9R2e46jFtUITF5eqHEhKllOwNsP1Ud/j036MI1CVxcGmJptpZR2FnATSPFuu201Co4Lx+3iIryDn81h40Vf8hfs4C8x9Bpg6o1ZfpQM+roWq0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DSQ7oDZk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSQ7oDZk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780387985; x=1811923985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JG6w9o3vi3vf2uqnRBhUW9RicrZBepOg8iror8IRnFk=;
  b=DSQ7oDZk2cd9oZm00CjYdpzcVkPj00qSimCS9KDtkTibA3w0Ah2cvkl+
   PZ03khGcNt45aDheV2VSjgTPevT47+pAk8AuuhbjvbNmSoLHt/8l3WV8T
   8cO1wtw6E66i0zludUo428TBnh3YABLgIqTW2vTwqx8jRCR+k4eCJv4ng
   nWFVx3EubL2BXQOYcKW+FudKTS4of5smXF2jtjF42wJRqsdd9WagUb2xL
   0oDbcgoWjlSv2bASuFEuO70GOB5MzPaIfKmNwsL6SxJAdONBcNh1uwO4S
   SBIjeBRb8SizJ4JpvM9DL1gho6LuKmmSWtxdlqQ7afXG0mPyAj2tXz0pm
   w==;
X-CSE-ConnectionGUID: A/GqaqFjST225ehKgZ2TWQ==
X-CSE-MsgGUID: bQQMhhm0SLuSpOpOZB4v2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91742912"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="91742912"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:13:04 -0700
X-CSE-ConnectionGUID: p/eOBmZnSlSOSDwQ6JuzLQ==
X-CSE-MsgGUID: S+fl3pvFQFa7I/6Bi+5q7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="243949960"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 02 Jun 2026 01:13:03 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 6/7] ASoC: Intel: catpt: Drop manipulation of the obsolete direction flag
Date: Tue,  2 Jun 2026 10:13:49 +0200
Message-Id: <20260602081350.1752773-7-cezary.rojewski@intel.com>
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

