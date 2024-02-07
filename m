Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193FE1864D
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 11:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707305160; cv=none; b=SMTvdQNPCebhYcdBNdPugDSvNxkIKa2AO+o4R05eEXYYbhl9WoCmnaJC/kfNwReqchfyBQBCdeQsFfLV2Pe53K65LRQHYLtJttXA9p1am9VN8G74SD5Cr2g8qt9PEEPLbjhz5xALE8JorEU72sNysz0IzUQ7x365TW4l6qkq6+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707305160; c=relaxed/simple;
	bh=+lBCuozkfb4dH57/mhvItVLQfr5uIzBiLc2iqrYe83Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=noDKQxaVAFURJmGVzptSzLxc1tM57ZuQynTHuldd+IFzOmoiGixDGbF/+MKH0Rapswf0aW4GMAmsshiBLvn+0lL1vl4eulrHBYM5WHTqVDADQmS1bpVaeFeLNX6wpm1HVGELCoYZL7BNACTAben+ZZBm3CBqhxvEavtiES1Ep/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HqByrHBg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HqByrHBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707305159; x=1738841159;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+lBCuozkfb4dH57/mhvItVLQfr5uIzBiLc2iqrYe83Q=;
  b=HqByrHBgdMglvZtUBYSI0cfTPfa4Xzt4IHG16CSoNsSuuxOWQutxWEDb
   KsMgGZg9gpJfYXhLPYv1XW78u/0sHTD/LkmPEjN6VZl8pMw02T/LuwHH/
   qC3b5fFIQ/bz2VvTOA8MvAA8/YePjrlMdLgkPPStq6JtRf7MyfgFzNdaf
   dHdRA/WSuSyD1Ey3rhCVhZsimRHrwb/ti03kFLEIlWVmXB77Sai63085R
   MsFiN09Ce2HEQgBhJuvbePWNfa5CnnNg/m+BNV43D5ws+bnOqFksBVX6S
   GvfH4U9x5X0zcWFlZO/eGDAai+MSBV73Rr3x0okMuRGGszbhCDOs8Kb4U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="858345"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="858345"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 03:25:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="5936191"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa003.jf.intel.com with ESMTP; 07 Feb 2024 03:25:56 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: Intel: avs: Fix dynamic port assignment when TDM is set
Date: Wed,  7 Feb 2024 12:26:24 +0100
Message-Id: <20240207112624.2132821-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In case TDM is set in topology on SSP0, parser will overwrite vindex
value, because it only checks if port is set. Fix this by checking whole
field value.

Fixes: e6d50e474e45 ("ASoC: Intel: avs: Improve topology parsing of dynamic strings")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 778236d3fd280..48b3c67c91032 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -857,7 +857,7 @@ assign_copier_gtw_instance(struct snd_soc_component *comp, struct avs_tplg_modcf
 	}
 
 	/* If topology sets value don't overwrite it */
-	if (cfg->copier.vindex.i2s.instance)
+	if (cfg->copier.vindex.val)
 		return;
 
 	mach = dev_get_platdata(comp->card->dev);
-- 
2.34.1

