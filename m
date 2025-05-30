Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1382B21D3D3
	for <linux-sound@vger.kernel.org>; Fri, 30 May 2025 13:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613245; cv=none; b=rWOwUOEOaCmty1jc9clgRRU2YpRXt737E1Apvp5yY8+WVmWIPaUGVLc4QQCtcc19+2sBWHSgGd818OraS6Lko/07pJBzH1QU87NLchoJGjgXSiUxgbowNo/HedPzucy226Qfr/+R2SA/ozOeZDPnJrKL8QMhoKFq5BM5iSWoiG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613245; c=relaxed/simple;
	bh=OlXYKvoyfcluB+pZKeVU2Z+eqGGPiMq/htAEAh6sAZs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PVmX3UfwxP5D75G2F6pwYtrYan0RQOydqsWygbeLgX2d5A348xHILPjsOzXkZhwiJyxaDC8eeGiK/FnkRmXrM6b1O3+83cDiBKn0U9sJ3ovGZhIACj2yahEwTI0SNJ5KpkVd49r6if8WOIzccWGG6JQgMBS3c5Y5XSk0zycBbxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXQ57PcC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXQ57PcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748613244; x=1780149244;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OlXYKvoyfcluB+pZKeVU2Z+eqGGPiMq/htAEAh6sAZs=;
  b=LXQ57PcCIvIFQXEAEvU6L+jjyUhuEXVhCuZ9L3Q864r12Vr75FlNV+8e
   IChAixl7smnWy9nuFr/NVCwVhigMBMZDmVJ/PGtwtLpl8gs5p/xiYPcFt
   Un3ZWLjG+yPNYlZ8njG3yYg/yikfrSQhPQbDbqHuU6sM/kzF0dJ1k32b1
   mCpqOfkp/a2Imr/rJwlZA3nkybuYmhiQYQNU7UKfUd7k7b9QKOlBN1W50
   lKJ//XvsFjbel3XpQQUO6QAe9ETnxL+1qZj8bgesB1RkcAiE5XnAvr+th
   pa097Y2IfVR9AMxeVAiSTKqhnJXA0lyAvQ7M4Czyt7BaUEYueeXKN3Hgt
   A==;
X-CSE-ConnectionGUID: QtkQ4RhlRbWGEleQe1WuxQ==
X-CSE-MsgGUID: 0EMx2/m9QOe5fnMzsGxKJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68256194"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="68256194"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:54:03 -0700
X-CSE-ConnectionGUID: e+uunW+lSoKsqcZdo8E8bQ==
X-CSE-MsgGUID: Njtf9XPNSJOBY16QCB9rxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="174763416"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 30 May 2025 06:54:02 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 5/9] ASoC: Intel: avs: Fix paths in MODULE_FIRMWARE hints
Date: Fri, 30 May 2025 16:10:21 +0200
Message-Id: <20250530141025.2942936-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250530141025.2942936-1-cezary.rojewski@intel.com>
References: <20250530141025.2942936-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

The binaries for cAVS architecture are located in "intel/avs"
subdirectory, not "intel".

Fixes: 94aa347d34e0 ("ASoC: Intel: avs: Add MODULE_FIRMWARE to inform about FW")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 485842838025..ec1b3f55cb5c 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -945,14 +945,14 @@ MODULE_AUTHOR("Cezary Rojewski <cezary.rojewski@intel.com>");
 MODULE_AUTHOR("Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>");
 MODULE_DESCRIPTION("Intel cAVS sound driver");
 MODULE_LICENSE("GPL");
-MODULE_FIRMWARE("intel/skl/dsp_basefw.bin");
-MODULE_FIRMWARE("intel/apl/dsp_basefw.bin");
-MODULE_FIRMWARE("intel/cnl/dsp_basefw.bin");
-MODULE_FIRMWARE("intel/icl/dsp_basefw.bin");
-MODULE_FIRMWARE("intel/jsl/dsp_basefw.bin");
-MODULE_FIRMWARE("intel/lkf/dsp_basefw.bin");
-MODULE_FIRMWARE("intel/tgl/dsp_basefw.bin");
-MODULE_FIRMWARE("intel/ehl/dsp_basefw.bin");
-MODULE_FIRMWARE("intel/adl/dsp_basefw.bin");
-MODULE_FIRMWARE("intel/adl_n/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/avs/skl/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/avs/apl/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/avs/cnl/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/avs/icl/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/avs/jsl/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/avs/lkf/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/avs/tgl/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/avs/ehl/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/avs/adl/dsp_basefw.bin");
+MODULE_FIRMWARE("intel/avs/adl_n/dsp_basefw.bin");
 MODULE_FIRMWARE("intel/fcl/dsp_basefw.bin");
-- 
2.25.1

