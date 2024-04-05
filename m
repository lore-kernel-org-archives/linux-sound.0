Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858971465B4
	for <linux-sound@vger.kernel.org>; Fri,  5 Apr 2024 09:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712308096; cv=none; b=HCSilr+Bd0FW5Ghw0RXt61WhKdxuUziJbfLvX9AYAu2Zv/9k7TUisX5nTumDVw4SLG0Nc1nAuN3RKUC63eZvA8zysgGZFlVDiUToaQX3Wtvw/+kDgG6AKlxdSzYW+F47AdV5v5E+2h5LMelwg3HdFDEFkFzgDWTyNEFZ5EQcXtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712308096; c=relaxed/simple;
	bh=8IPnmYlyD9UIlHOOUBWMwrj2iTulN0YzLI+v4m5ePr8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uw1GayFxQ5ouzNSVNHVZcgZVCCs5gN1y56FLpOLIXYo9eTG/IHttDXVdTjMu++7WQNcYKqSWaiFyohpBmzIz6bJwDP13+SOQTpXRrbf0k4UZVvCk9mFaAXIrbcjVX9gVvH/GVuVs4m+dt7s3y9smDf+qri+loHArW4owQ43fy/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrTfMGbi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrTfMGbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308096; x=1743844096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8IPnmYlyD9UIlHOOUBWMwrj2iTulN0YzLI+v4m5ePr8=;
  b=nrTfMGbimP/Rh6fVQGZSDlEjoR0H4YuZAyp2kTBokwnmH7k5dnSK27sZ
   e0Uo7mRHWk9WWppC5y9P0R7uIrXBaLGt4UF/3vZmCBibOwNpiVTofoLCd
   QSCEUXl0urqsKDvimuRUww3UuZj30vPNJsl6m/y0H7EVFoGDknqmmfjPP
   ETmlfAGbz+ZPQY5qdueAo/SrzZi1QQFUvjAqT7B1R8uIk5/u+cpWyV19c
   t054ra/4z71w1bEu02rYiBt0l16DsFx0voTU1jdw/MonkVYQ3H8R86U1j
   q0oNF5R9FWiuchF6x0tZ0KBadgBvVUdSg1JIdocc2ZlL6tvuMwLD+KhO6
   Q==;
X-CSE-ConnectionGUID: 7lSGmjjnSpyRIaJ/Um7dXA==
X-CSE-MsgGUID: xh0tSW6VRJ6OoT9U+z40pQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787433"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7787433"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 02:08:16 -0700
X-CSE-ConnectionGUID: I/Z/6ZVZRxi/zlU0Dn1bIg==
X-CSE-MsgGUID: 2SClKS10TI+qMFEtok2pOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19042427"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:14 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 05/13] ASoC: Intel: avs: Fix ASRC module initialization
Date: Fri,  5 Apr 2024 11:09:21 +0200
Message-Id: <20240405090929.1184068-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASRC module configuration consists of several reserved fields. Zero
them out when initializing the module to avoid sending invalid data.

Fixes: 274d79e51875 ("ASoC: Intel: avs: Configure modules according to their type")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/path.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 9bd03a44fcb9..8dfd90587427 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -365,6 +365,7 @@ static int avs_asrc_create(struct avs_dev *adev, struct avs_path_module *mod)
 	struct avs_tplg_module *t = mod->template;
 	struct avs_asrc_cfg cfg;
 
+	memset(&cfg, 0, sizeof(cfg));
 	cfg.base.cpc = t->cfg_base->cpc;
 	cfg.base.ibs = t->cfg_base->ibs;
 	cfg.base.obs = t->cfg_base->obs;
-- 
2.25.1

