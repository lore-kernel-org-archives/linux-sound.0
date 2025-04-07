Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B36C24EF73
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029666; cv=none; b=Maelpk7hxQdrYsSNIus3LOG7YFspoOxW0DDoq8ItHkAPqi/3N0Gs7ud+axh5hK545YZrkVoFOjBqq2QDu52+zlrQF+KC/qLq/oY/DwOa8k42ffTNWfk8qEeF4G7ez360z7XtVOBlwP8LEo54y3InPIZBgsXhlxXa+uIC2TZSkSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029666; c=relaxed/simple;
	bh=z88CUaUvEGcdWCteOlAhvY8GwqF0lM9g1pIdOQLIBXU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jw4mXwdTNKvfAIZMweIcOusiYsV4cVWiSo9zVijbsJn6xvfiKM8883g1A/iv2ExKo3qbJ+5f5oVJNS77dA8qq+5ZQZYKBbhaaMyEmHmw5SSqWVy9j9o3P4zI6ReiNKIyVrUDMVz7ECo+UysibOUDLSx5AjWCzA5AVErLJGVsULo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTkiiG+M; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTkiiG+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029666; x=1775565666;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z88CUaUvEGcdWCteOlAhvY8GwqF0lM9g1pIdOQLIBXU=;
  b=fTkiiG+MRUznItpcItJXeFo7oEPUOzG5NXvIn36hvp5YY7RPNOPvKgoD
   4Omw3bUmUU4ndvgMYdq2QuenlQhft6J0ZZ6aaRU9rNyzxL65k4hR1uzZR
   HAqhU1xyiYL053qf/aE5Qm4rMnFfAzCgfxl9SfCZ1Av4Us0Hm0DvRP7hH
   8KT3QoWkou7zydM+qQWE9xpjcjJqyjMJNxzrgW6T/YHzTvVC7c41s+jiE
   ZeteiZvApr754AcKYDg6nBjqItoN72ihV5g1TlU05qDptL8a/nSmNw+9t
   8fK+4jh90DUSg2MUu1KiZ52Aatt8squ5J+boGsW59qqLBUWxcgPtWnP2m
   Q==;
X-CSE-ConnectionGUID: 4HdekguzSKKHWMbWycUIww==
X-CSE-MsgGUID: p2RF70S4TKmpTc7kqwZuKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56779060"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56779060"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:41:05 -0700
X-CSE-ConnectionGUID: +xBAuhr+REaX0s94gTCF0w==
X-CSE-MsgGUID: Nc97bA5USz+/Ak29qCJ92g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134211"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:41:03 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 13/20] ASoC: Intel: avs: boards: Change probe card name
Date: Mon,  7 Apr 2025 14:41:47 +0200
Message-Id: <20250407124154.1713039-14-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
References: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename FE from "avs_probe_mb" to "AVS PROBE".

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/probe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/probe.c b/sound/soc/intel/avs/boards/probe.c
index 1cdc285ab8101..3c4491c87df4a 100644
--- a/sound/soc/intel/avs/boards/probe.c
+++ b/sound/soc/intel/avs/boards/probe.c
@@ -36,7 +36,8 @@ static int avs_probe_mb_probe(struct platform_device *pdev)
 	if (!card)
 		return -ENOMEM;
 
-	card->name = "avs_probe_mb";
+	card->driver_name = "avs_probe_mb";
+	card->long_name = card->name = "AVS PROBE";
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->dai_link = probe_mb_dai_links;
-- 
2.34.1

