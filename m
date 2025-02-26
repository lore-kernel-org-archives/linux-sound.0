Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB3421323B
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568225; cv=none; b=T9/T/r+ofz6ZOtlEYREK5yc+wus8X2GjL2fnt/JGNoHf1CVWwOh7qFcyiQZnrG1wY8hFhAD2rucO6Giw2XjR0eAJI7jrWhTboiVj9/WvR8EPI9Vl4ZvEWsLw6j4FRSK2E4RT/e4TNRWcEP42qqm80uy3S2qrXMRSMJW8sBVYf9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568225; c=relaxed/simple;
	bh=16Fpo8q5tBdch/SvglgwBJC0K1uZsqTs6YZ+qAk1jmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mOiTejiwc4qcsao4TFIC4tTNrl5cJ5Oiw6DI6GtcecDS5ioJh4SryFtNa8dumLIl+7ZhVZ3L8J+cD8f/BoxIww92516XlF43fydFdmAlBUHtDSevbvdbTxWTzacXAqtqb8cRmD+QeQN/P97hym4N8pBEn2SSOdIaQjzfXI6ecp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csUHKb4H; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csUHKb4H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568224; x=1772104224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=16Fpo8q5tBdch/SvglgwBJC0K1uZsqTs6YZ+qAk1jmQ=;
  b=csUHKb4HVnko0m3tVhV36ymVXqvDW5r2vRqnw4RcXVIF8XnCq11PGtU+
   abEjU76sCct9C77Uln92X8g3MV6xTvCxdv3TUy7GrMmUdZY/8qwQyUhN/
   AZQwh+qwB2/SE0XHREgk3yfOD71+pryMSqCGWjNQe52gnOX/UHGPOKxm+
   NHQbcZaYc9s6Vv2ZAq7WG2uSkyAr6YB6v0ZHgrqbKGiqFMZn092yFPNBm
   4q9wH3lxAHfhbg0T+w4AGzPQoED6+A1L6fNuOHsyct14IKEJchmQsqm0u
   CKgUdYAeawZ9pzHCXbPow4q1gV+hMNyYkSaO1RbMm1jOsiILG7pZDK0WV
   A==;
X-CSE-ConnectionGUID: ZotPTn2GT/efwOFCV03I4w==
X-CSE-MsgGUID: ZxYLnxPSRn+MR2UwDcukVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111117"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111117"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:24 -0800
X-CSE-ConnectionGUID: OEwVhiDYQoSBsHCik7N6gg==
X-CSE-MsgGUID: oUCroQJISWOQu9fqtIwOOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116685115"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:22 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	flove@realtek.com,
	oder_chiou@realtek.com,
	shumingf@realtek.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 11/22] ASoC: codecs: rt5645: Fix definition of device_id tables
Date: Wed, 26 Feb 2025 12:26:01 +0100
Message-Id: <20250226112612.166989-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226112612.166989-1-cezary.rojewski@intel.com>
References: <20250226112612.166989-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There shall be no comma after the terminator entry and initializing
fields with 0 for statically defined structs is redundant.

While at it, sort the IDs alphabetically.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt5645.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 51187b1e0ed2..56cf410926e3 100644
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
+	{ "10EC3270" },
+	{ "10EC5640" },
+	{ "10EC5645" },
+	{ "10EC5648" },
+	{ "10EC5650" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt5645_acpi_match);
 #endif
-- 
2.25.1

