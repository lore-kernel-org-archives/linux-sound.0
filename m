Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51421E7C23
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050055; cv=none; b=UWmxh4JiVQ7N5u5xfT4A8fknOvSRhFDIWOIxc2P5lxaQTrYn5Kt0fFdgZvA19eBykTHrFCR7TCiiXj5osDdP5EPeoxqwomVAdccxu0koPH9jKxzriZrLowTWkCR7W+Tdr7TUk7YoBnpId9NuIcHYVky4hrcuQ4GmiZ1MZuq8aZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050055; c=relaxed/simple;
	bh=BfJKEpslrOVMKaw2N1+ywJ5MHBwqKm9JPTutPpMxKFY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mAYy6uuRycB07ITIllmlZkbnZP+177HiK7RwClFhwK4JYqOLau4hsIt424WAxBSqOTsBrmL9yBidtmGpi5XNHFs1UjpOpF4Hj7O4RCxWTKR74/zqc/phkkW3J62ONMpBkBxsQ+Cwj1nV4mNhjL/sfnMWY/1sj8FbVu1V/CcI1vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Od1LEPCD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Od1LEPCD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050054; x=1771586054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BfJKEpslrOVMKaw2N1+ywJ5MHBwqKm9JPTutPpMxKFY=;
  b=Od1LEPCDoUL2HK1JNQuiKhSMmGGPfZwcsLFNYwOG1SV/OjaeLctgnOEk
   5kkGt5DrE+OAZZu70/maE4zV+FU0TBvc3Facto+6xQXj33fm120NvZO7t
   Ttzek/vLx6pS+inTYo/Sah92Z14EPSbokxzlK3cj5nFdWCxNOvCOebKzv
   FUPWq5Bgf1xSquBvEsdJzzCvJNL4F6inqoK7vx5EjN4jV2bShXqbJmrX+
   lm5AGn1lN7ZcYuubvwGpVIh8MAPPjpAPRe6OPLTKxKq8cHVsiBgBF0rWJ
   0+oSc+SZwvhUdVqT2Qe2+R96F4k5QZ7FZuaI5E4Dna8At4ghztOmyhnqt
   A==;
X-CSE-ConnectionGUID: 1/Cn6QX8TnGegaWbg3yYIQ==
X-CSE-MsgGUID: EWTEvjjoQG+ciI0ylJSMOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808156"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808156"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:13 -0800
X-CSE-ConnectionGUID: uwBU8dwPQr2U80pqgHBetw==
X-CSE-MsgGUID: 3m4AVBViRnK2EwoDSWYS/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865253"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:11 -0800
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
Subject: [PATCH 01/24] ASoC: codecs: rt1011: Fix definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:20 +0100
Message-Id: <20250220112643.3813295-2-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt1011.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index a0e75b03e9dc..71355b7ce7e2 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -2192,15 +2192,15 @@ static const struct regmap_config rt1011_regmap = {
 #if defined(CONFIG_OF)
 static const struct of_device_id rt1011_of_match[] = {
 	{ .compatible = "realtek,rt1011", },
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, rt1011_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt1011_acpi_match[] = {
-	{"10EC1011", 0,},
-	{},
+	{ "10EC1011" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt1011_acpi_match);
 #endif
-- 
2.25.1

