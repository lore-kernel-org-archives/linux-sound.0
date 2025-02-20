Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557DB1F0E2D
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050080; cv=none; b=m581L41VOt6Owu/pBKHr3lV85AudwrtzdOVm8DKEoU/MZYv+ppePugHgEO+n7iUQIMmXyp7a+naQdkj6yUETQyyWzBXFQqWmO5tQK5s6m5dCeLdbbtFK6R0ey+s0Pz1K9M3DrYwJk8ZVl2kBsLrSq/Zo84JWffHHGw2YhpekLFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050080; c=relaxed/simple;
	bh=/4qQSnRdBE+zmVNUUV0exPgTU9n/HYHCvtaWWXWQIMM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jLP7KajZ0ViagXeA+6zsQ+lHISJ23WRe9bNIlhgQKIAlxUxpN4O2oUW2y0ynagZpkhnKerraNkDIm5yKiLAPVxeLZ0zFDnqgw/IH1VkHdjVSlw//tOoUK8rZnMyDuOCwkbJDsa4z3pEdJmQ+4MP0hkrsixp1+m6ie16OkurYybI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9wZXbim; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9wZXbim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050079; x=1771586079;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/4qQSnRdBE+zmVNUUV0exPgTU9n/HYHCvtaWWXWQIMM=;
  b=K9wZXbim8Ux0SPKp0RT0skFBNXgMaV+PT8FUDbKR206czhsdkDY+yZRx
   Zx18cxdnA1bIstj9P5QEnqjMHanMveYxgy88Mv/i4CgZLYCfaX+h5uukw
   uPYSTX2OyGD4bV4nvIOqqOATTEOydGSdzs6kC9OA8AW+Y1WwZ1Rym2h0k
   JoBZWqdo+EPotNajOqtg75KWXCq/lqjBNP3pAn9iSZmyLQfDOl+pCZnpr
   b3/FdjNsHiv8E8UEP6OrGprWH1b4ExVbnjjDz6P+4JuqeJVtV8P2EQu83
   zW1JMYWQrN55S5ZMUkUbrCA77Ric8VKU4GA2zuSi5TFUeKQDHaxr5QuGo
   Q==;
X-CSE-ConnectionGUID: AoQWGRlyTl6yrcison8Vtw==
X-CSE-MsgGUID: M3ItfU2RTyeTI+fxPTv+2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808255"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808255"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:39 -0800
X-CSE-ConnectionGUID: Hrv6bYi+SVi3KIGzwyEM3g==
X-CSE-MsgGUID: IacfpFqPRRagP9O9OSHn+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865349"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:37 -0800
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
Subject: [PATCH 11/24] ASoC: codecs: rt5645: Fix definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:30 +0100
Message-Id: <20250220112643.3813295-12-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt5645.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 51187b1e0ed2..794a81be6ef7 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3660,12 +3660,12 @@ MODULE_DEVICE_TABLE(of, rt5645_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5645_acpi_match[] = {
-	{ "10EC5645", 0 },
-	{ "10EC5648", 0 },
-	{ "10EC5650", 0 },
-	{ "10EC5640", 0 },
-	{ "10EC3270", 0 },
-	{},
+	{ "10EC5645" },
+	{ "10EC5648" },
+	{ "10EC5650" },
+	{ "10EC5640" },
+	{ "10EC3270" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt5645_acpi_match);
 #endif
-- 
2.25.1

