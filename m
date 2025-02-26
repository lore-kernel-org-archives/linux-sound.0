Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF71211A3D
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568217; cv=none; b=qm6jNVK/W+PQhhLw4K1QQNic0QiS1EeYzM6PHKclPuRl3QnJBs490Z4XD1/BesLdaYHYO0bUA4FJfIiuzKdihqgCbs7j/v2ydGvLqrmzBRAmzxbGr0awkiMQeOPI6VXlCCYSoKk+JkPZ3o65uF4voC5S/XcpNdPg9uriANDml7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568217; c=relaxed/simple;
	bh=7/EOZGXh642TKXBX4hwc308u34kVD6XRhHrotUBKJag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mOMfIUmZqKa6EfrEZdr05g5TcD8cGBGO1/bkVN8Y3m+M5niAKSg53+KY/Xi8xxmEs4sxbxElGgOUKhmz2ookmrDOXFeqgnOw9OKmp8T7XizFJZt+m100mWhtUBqNg6DkcrH5rKJpxAWU5kvq0ibZv/Y5xt/AMCuu/doZE5m/3Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=isFCH6Ks; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="isFCH6Ks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568217; x=1772104217;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7/EOZGXh642TKXBX4hwc308u34kVD6XRhHrotUBKJag=;
  b=isFCH6Ksqf/qLVuFYyf1qBqJS7856svxk24u2oETbGx48mfKRxl/K34J
   1+QAsVazZ7RVe7WEqBJaRy3x6or5gS8xZ9MyrWyfR+idMhfubCf3ffrFo
   34E8/PGNg3zy6/PQ72PcaY9/zJ7kuPuNpl+xg0F1grUCpPmFbaQwH70Sj
   T5KEiGllzfkbtb3xy24Vy79hUzcFNuIn1H3N9eudhbG/xhCCFJVS7gfYK
   YVowrwg9chEGcwRrUL7oGKwZRnXkKgSqX0uZqYq/h1xYVtyMHw8HSISdP
   1A5u3dOGEJq8aaWJ0PzUMH6X0VffU12MU3DY5Zad/sy4ugpAu6teACJMU
   w==;
X-CSE-ConnectionGUID: MITHDl32RQuixcbnwSceKA==
X-CSE-MsgGUID: gl0EJlscS4Ctq67SC2TiUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111094"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111094"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:16 -0800
X-CSE-ConnectionGUID: QSoQaCkTTsaDdwNKILJqHg==
X-CSE-MsgGUID: ldhptlXMTnGfJLvJoaX3Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116685079"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:14 -0800
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
Subject: [PATCH v2 08/22] ASoC: codecs: rt274: Fix definition of device_id tables
Date: Wed, 26 Feb 2025 12:25:58 +0100
Message-Id: <20250226112612.166989-9-cezary.rojewski@intel.com>
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

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt274.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt274.c b/sound/soc/codecs/rt274.c
index bd61a257d7b5..b27e9d06e32d 100644
--- a/sound/soc/codecs/rt274.c
+++ b/sound/soc/codecs/rt274.c
@@ -1091,7 +1091,7 @@ static const struct regmap_config rt274_regmap = {
 #ifdef CONFIG_OF
 static const struct of_device_id rt274_of_match[] = {
 	{.compatible = "realtek,rt274"},
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rt274_of_match);
 #endif
@@ -1104,9 +1104,9 @@ MODULE_DEVICE_TABLE(i2c, rt274_i2c_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt274_acpi_match[] = {
-	{ "10EC0274", 0 },
-	{ "INT34C2", 0 },
-	{},
+	{ "10EC0274" },
+	{ "INT34C2" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt274_acpi_match);
 #endif
-- 
2.25.1

