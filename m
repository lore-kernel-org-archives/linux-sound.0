Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BD31F0E2D
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050088; cv=none; b=mpzpGTYigIkcjyoGUkGcomiqOs/UP7n5DvFobDTDr9TV9efrJ6sN2wChZjZ8bhAibas/9UDPxQJz7WQxkX513g6YM3M9ohbvUpLGz6KxyYHAewvo6YK4rAdB9H9NGnCxhHLxubcF5F+tVPm8+nyUvG3NS5MMR3yawuK24j/l3Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050088; c=relaxed/simple;
	bh=Mmz4hvGPfTQRA6ghdSZbmlir/wl2XKEmkg1xCG2bTAk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hZGtc+ugZKBNUKme7KFEDiJvfsSkeIlrMZl2E9z+MRxAbEaHS8Obxzhc7hZybK+9X+gcEGLfucSntRZq2rWBn8Mw8zMLB0hxz0sWu2MY7dZNciA5bQ1smHxUZem6vdJW8Y0Fxe1pEMLIXmB/vNYcQ1KMGQOOoVCyOmHD6N0R7hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+olwHSx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+olwHSx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050087; x=1771586087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mmz4hvGPfTQRA6ghdSZbmlir/wl2XKEmkg1xCG2bTAk=;
  b=W+olwHSxTINe50M+K6TN6W3mM6/naakeJ4jJAgx1id/hHzO5+GMJKpK9
   owivYdnC/lVaGUTgohYDTPRMdoEcPrm8xxEyyY5B/rKg/3cFoxLBUV8p/
   IGtdobEfUOiCL3sO5NHJFgTy+x7tWPqawfhGRdnbpBTWUbNsQyRVFJNj4
   PmucXkLuD7euXbXAYbpN0xaYmYV6Xi9aOiHoX99nbY5BcsqL5beBFZ7R4
   hlGvBFRa8LPj9HhoMIO0bbyh4XdTPW5gg0vNRBKUUbY5zssAd6zfEpDSO
   PCSsE/sv64yg3jVpBATGEZCrukmu719PDn6gjH1MxDXVsxYfsIKXs65Uz
   g==;
X-CSE-ConnectionGUID: 0xc3wqOsTI6P+FKVKmnYvA==
X-CSE-MsgGUID: HG0Za5UQRtaC8LFLEW5//Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808289"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808289"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:46 -0800
X-CSE-ConnectionGUID: axWFiRzpT4mTc+5CX8mjYw==
X-CSE-MsgGUID: 0MhQ/MxXQ+yteQw0KSxVrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865401"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:44 -0800
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
Subject: [PATCH 14/24] ASoC: codecs: rt5660: Fix definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:33 +0100
Message-Id: <20250220112643.3813295-15-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt5660.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5660.c b/sound/soc/codecs/rt5660.c
index 3ac41d2c279b..fe8c27297599 100644
--- a/sound/soc/codecs/rt5660.c
+++ b/sound/soc/codecs/rt5660.c
@@ -1232,16 +1232,16 @@ MODULE_DEVICE_TABLE(i2c, rt5660_i2c_id);
 #ifdef CONFIG_OF
 static const struct of_device_id rt5660_of_match[] = {
 	{ .compatible = "realtek,rt5660", },
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, rt5660_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5660_acpi_match[] = {
-	{ "10EC5660", 0 },
-	{ "10EC3277", 0 },
-	{ },
+	{ "10EC5660" },
+	{ "10EC3277" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt5660_acpi_match);
 #endif
-- 
2.25.1

