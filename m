Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E8E1A08A4
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568199; cv=none; b=nBwqLh+8Jz2S9w0F1LdRg8Zl0IPOcJc4bUf1S19ePScX2d82TBcQ5YyWnWeafY6f4Uvnc52zn0Kehl52S6mj9L4rirPgfOFK9nIf7JVCMjHNe6Y3fcT/lc8qy3HH2FoDLLz7Xsw2dbjezJKzYuHYc6t8YMKAx2vr8VXPr0mfFa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568199; c=relaxed/simple;
	bh=2I1cdTHmIinUV1GQE3EUzLVg/B80RAU52vrhZ70VFFY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LnGUYkKoLY6H79IOnIcPrQJAmCNO0/GRhfcl13ZWQFoeWBkg0Lbmz9brH2XJORxj7NYqPcaPeQKwtyshuOVBEtBTzrfr+0gKdp7/hI2p6Orz8bTIro4avu+hw03eOB7lm0M1KuzKAErWxAa3usAoZQ1EgSXTWfAc+W+3Gw6QV5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZGULhxcZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZGULhxcZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568198; x=1772104198;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2I1cdTHmIinUV1GQE3EUzLVg/B80RAU52vrhZ70VFFY=;
  b=ZGULhxcZoluQ4hil5Nr6FglWQH/6OrJ6RWLEjb20z91rsRtz9QXEONry
   grH2FJ/zti9LqR46IOKfrX3idnd4X3b2plYMj+NiACQQNmz4eO6v6l9vN
   NakMPkeQmkTasXdOJ/ktHze6/7GMh84zYqsXJurGNJtbQNuIgnlGNWw0w
   DCRYwQ7Hazr5phKqK1AuzT1KZ6s7TMTSyf5ceQkSzRH+rngva3zu0OCuV
   7wP9yKCj055hnLocRmxONCbSt4tDqFbHFd6HNJz3Gskx1UsWsVHE8XElO
   KJ20txREVifeEnoM3De9odiktiC5ccE3eqjb3PVA0ghvi4iiZZ3CT2eLc
   Q==;
X-CSE-ConnectionGUID: +GFqvK3YTV+7iMIuzRKTRQ==
X-CSE-MsgGUID: tJyc87LFTW6pvZWi+DBupA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111007"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111007"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:09:58 -0800
X-CSE-ConnectionGUID: oMBQPHSIRd2qc1DhMn4aVA==
X-CSE-MsgGUID: fSg7r06BSfCmOuvMK1YQXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116684944"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:09:55 -0800
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
Subject: [PATCH v2 01/22] ASoC: codecs: rt1011: Fix definition of device_id tables
Date: Wed, 26 Feb 2025 12:25:51 +0100
Message-Id: <20250226112612.166989-2-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt1011.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index a0e75b03e9dc..fb76f9e020ff 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -2192,15 +2192,15 @@ static const struct regmap_config rt1011_regmap = {
 #if defined(CONFIG_OF)
 static const struct of_device_id rt1011_of_match[] = {
 	{ .compatible = "realtek,rt1011", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rt1011_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt1011_acpi_match[] = {
-	{"10EC1011", 0,},
-	{},
+	{ "10EC1011" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt1011_acpi_match);
 #endif
-- 
2.25.1

