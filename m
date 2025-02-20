Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCE61EEA38
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050067; cv=none; b=QxnkJahsbtqjbOyTTTAEkIeEZT058dXnbwzCjTitRn5fD95DhD0RsH7j2yu2OhjM0JiB5Y1gvCHDeSrO3ZM/NJP5A9zHgsXcueh8Ory203/ltHmQP9G/AmbTAU6DOqs8i1MHRyclMaTpBt330HdZpBHJXgSFWEuDor0jcQynEF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050067; c=relaxed/simple;
	bh=Rz8BS7cGg5pxytOcGDA9W9UYvvxmmEV5t4j33Ks3AWU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nwHNX6skiF6rdz57CjEVvmP/JiMZpjNxblCJsNm4V/tTkAyzdwwCoJ8nlXGMJGWu7Qse7a+t0rUF2gEUdnq3Kcp0QTb+tRvE+dDdfPDtEcF2Q8GMAbzMiYA28yKw+1ASm+FxabE53PWnr51QShjZvyicK9hbndAgWCjfJVU8aaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHg9oZUl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHg9oZUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050066; x=1771586066;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Rz8BS7cGg5pxytOcGDA9W9UYvvxmmEV5t4j33Ks3AWU=;
  b=JHg9oZUliOZsJcVGN2hZqfyaUvoKdo7klYWPKreJzOXbL+7wwhm83RjO
   GfClH8Gn2y51uSBvsNR2sTlcsKUC2j6de9RnPVJ6uhTlEM/Laj/a24suE
   pCbMLQmCMsJLcoaVfOPwyRlj3zOYL9M2fR67LQiEw90WcTzIDPn8HtK/I
   9T5Y5ahx5FbSVlEQ/nARKTnpBme7RwLSgtFytMuQyUVpAhRwlt8SBbHFT
   XB708IKW7UZQnWD3CEud6bzmT1+J8O7y95zLMjxGVzgFBsswWj5xV3NmG
   ICimnajVoAAJ29/WpLqgr6V5hG9MJXjdhGnIMlMKV3zqSm/wnYLd8kSBT
   A==;
X-CSE-ConnectionGUID: 8Ut7WqooRtC02+zm21RnZg==
X-CSE-MsgGUID: b+6lDXJAQwiLGGTUyb0fZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808191"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808191"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:25 -0800
X-CSE-ConnectionGUID: 4uP7kg8hSTeb3YC2sV8JWA==
X-CSE-MsgGUID: qBi4I8BYT3SZERJRvQ0R4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865295"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:22 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	oder_chiou@realtek.com,
	flove@realtek.com,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 05/24] ASoC: codecs: rt1305: Fix definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:24 +0100
Message-Id: <20250220112643.3813295-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250220112643.3813295-1-cezary.rojewski@intel.com>
References: <20250220112643.3813295-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There shall be no comma after the terminator entry and initializing
fields with 0 for statically defined structs is redundant.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt1305.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt1305.c b/sound/soc/codecs/rt1305.c
index c2b55be8d165..b4e10ba00dca 100644
--- a/sound/soc/codecs/rt1305.c
+++ b/sound/soc/codecs/rt1305.c
@@ -973,9 +973,9 @@ MODULE_DEVICE_TABLE(of, rt1305_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt1305_acpi_match[] = {
-	{"10EC1305", 0,},
-	{"10EC1306", 0,},
-	{},
+	{ "10EC1305" },
+	{ "10EC1306" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt1305_acpi_match);
 #endif
-- 
2.25.1

