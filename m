Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61C72139A2
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568228; cv=none; b=YJ73xD7Hdxqjy4sdtMl6hPCUZVIREVAtkB+u0JI+p8Z1gzPI68ObAkm/Nqllv18PWhCJtABW8YgZprChB9HZv6K09+Vm3QqVqYYqvrqz9NCu2bfFk7U+0Y/2ZL5xHY51+me19UwYRE0MxrOvj2ecZilxUS8L4Ib5mAE7DOaWXa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568228; c=relaxed/simple;
	bh=tB62R3f+frGuHP1y+hLDqxsxpDVIKzBkw/x+AjD8Lc8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QcWSgYuLLb19QrsQ3kMLCP7sSKHTxdQmbFWj6veY20Hxo3EsRxS7cikIG4pSiGP9g7HU2PqXegLXOmPn0SApjmcttXbHE8iup1hBQM45MpUgmmwo8wRXBWDc+6Dknyj6AdwlnZXnFQhU6nvUkOnpmUsZDypXgS10wj/ND3pPsdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kK39ySvg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kK39ySvg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568227; x=1772104227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tB62R3f+frGuHP1y+hLDqxsxpDVIKzBkw/x+AjD8Lc8=;
  b=kK39ySvgNa4Grr2AMMYez28oSyvS5Tme4m+oO4BVnsw/8hxhNUSd5vVj
   adXtJw/efw5CWwzAXXRj7qnk42Lp5c+x0WU4t7BhhEk/pW3XlZq4+aqtX
   6WKDS+1xJWeJlQoPuru+jcNf8Q3t7TXPKQVFhhqOqEupt6sL7bvpJGvyH
   p2QTeUHSPmPU4RYgygruzB8kA6ADfe8MN1Lqx0RkllvMe9nXlJ3k60Gow
   /04yxcbOJdvDmuGMay27+nPWX7qwzfFmAs7VEGZ4A0P60ehKQU5UGR5ab
   U0wH7yT+wxOd17mM1hDiIZ6VmM33GrRy/EiV5Ai03kMiradWZx3nWw5G5
   w==;
X-CSE-ConnectionGUID: FoYFk30DTYeiz3ZkIjt6sg==
X-CSE-MsgGUID: anF6CTDtRhCjmGXZdCWnPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111124"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111124"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:27 -0800
X-CSE-ConnectionGUID: ADlBdkrJSESicpsNJqws5A==
X-CSE-MsgGUID: rR+832YTS/qKK1hO4dZi3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116685121"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:24 -0800
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
Subject: [PATCH v2 12/22] ASoC: codecs: rt5651: Fix definition of device_id tables
Date: Wed, 26 Feb 2025 12:26:02 +0100
Message-Id: <20250226112612.166989-13-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt5651.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5651.c b/sound/soc/codecs/rt5651.c
index 00421a1f54bf..2c1fad3ee690 100644
--- a/sound/soc/codecs/rt5651.c
+++ b/sound/soc/codecs/rt5651.c
@@ -2184,16 +2184,16 @@ static const struct regmap_config rt5651_regmap = {
 #if defined(CONFIG_OF)
 static const struct of_device_id rt5651_of_match[] = {
 	{ .compatible = "realtek,rt5651", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rt5651_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5651_acpi_match[] = {
-	{ "10EC5651", 0 },
-	{ "10EC5640", 0 },
-	{ },
+	{ "10EC5640" },
+	{ "10EC5651" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt5651_acpi_match);
 #endif
-- 
2.25.1

