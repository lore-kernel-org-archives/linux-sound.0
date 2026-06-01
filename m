Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B6837C918
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322947; cv=none; b=fJHeoAdU/e66RDssfwMnyxw0Rxi2tWoEMEavfTngtz3Y/qwr1VRa2UwblXhy7bNXYPUGJqwteYn8/2mq42c7nOXlLWdmzXZKEsB9ad2pDHZlCF9/CnjOq7jDwmcbj/YoqQgjFS3Mcq4J0FbSx46lZ8pUkWNFOQ4+UYUC69csudY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322947; c=relaxed/simple;
	bh=JG6w9o3vi3vf2uqnRBhUW9RicrZBepOg8iror8IRnFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B4axDVlKPU/HQoFV7FzGyqFJ7/kKcoBPpNKDZeye0myDdzZOXrKn/IGVqdT5g1AVFcgT8PutX7XV0JLCHrXDGXXZaN6khm8ZLE4HaaBkwBab56emKDCROirGxembdRYlA0nheEXxzfVBgeXMRRZ3bxoGjrKxryrQ7s0cheFwF5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UpkOcvUb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UpkOcvUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780322947; x=1811858947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JG6w9o3vi3vf2uqnRBhUW9RicrZBepOg8iror8IRnFk=;
  b=UpkOcvUbpNMWAJs4ipPciX/jkb5rYV5cyR7RCFZvjV+pbQDrU7UIKusA
   7Qyz+yBma7Isk+89ckmjz06Ex8U3MccGsoRIieGemudRhdTmRm8fg+JwR
   lxF67WeeIS0AcvGLVZLwuTJ7t97Zsa5qzj0k2SGBxj38qqmMKYAtf2EzM
   TRC3038E0M/mpy9KNYDysZHzm2eWTi/KJp0rDGxxVYWkYdam1go0YQasz
   kxisrdMqgGZzBujrk9rUPS2UYSu3yW90m1CYGMws9mpGJdoPoY2K6/cko
   coiF0aQoD/JXuaK+ecFpqkFmearSESFj9RWklNnZnhlFyGnlfDuoBb1cT
   w==;
X-CSE-ConnectionGUID: kZnjAyG4SoqSoHg/9jnMjA==
X-CSE-MsgGUID: lnVgj6YYRyCJMoOFcsFEkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81140296"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81140296"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:09:06 -0700
X-CSE-ConnectionGUID: KDt/3ZGVTaqr+b62DbaAEA==
X-CSE-MsgGUID: 0aOE8uZyTiKToAlOA7Y/Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243705054"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2026 07:09:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 6/7] ASoC: Intel: catpt: Drop manipulation of the obsolete direction flag
Date: Mon,  1 Jun 2026 16:10:30 +0200
Message-Id: <20260601141031.1606847-7-cezary.rojewski@intel.com>
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

