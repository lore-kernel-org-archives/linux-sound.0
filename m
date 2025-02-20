Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032751EE7B6
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050061; cv=none; b=G8iEsWsaPvMdOD8yu5nO7ZU8FHbV/TjSgeEj1drse0qHTIU6wTBt3f9HMqm2QbHH7L6O8CTNaisBNmeT7RBfMxYKBpsBUTZsqAScwDiqRF7do4uGu5q9OKZby6iKRRopCk4gkAT/QVdfb/K8o6KhSrSGw+dxReQkFpU17qLYUwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050061; c=relaxed/simple;
	bh=6HSbdYofRPKBzuBF1dqRs+9eAIdO1FSWN2ZKqHhI8Qs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gt4NEBpok7X5k/Wsk/5Q5j+PgLtn+SBld1uX3AxCX9LOflppWhSm5pW0w4+TLcqLA4ZQBkSjoeTb3d7a3wBeD/y2xeHwduvkHY+j4Vws0KGNYwqEH2I9zyZbpHENCF2AYWzFgX0pfdkdS/1lAXVGoLaFTrKq8mtKE2WGRkB3Jes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ua0dpioU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ua0dpioU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050060; x=1771586060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6HSbdYofRPKBzuBF1dqRs+9eAIdO1FSWN2ZKqHhI8Qs=;
  b=Ua0dpioU7jf0KI9wjuQYtUCjSgJMW932NSBJGIlNjE1Sn+tYc9EGYJBC
   bGAMwkCJt5kArVrs2xtfYlf+UJrYhpa2yKPZBawkFSJbORtGzw50rQsYM
   aqvlGDk8CZnDDkWpOrPl7p8f2BQAwAIb6y3aimPWolCTiEhK+Sj5G/0mr
   aQ5kaTxQC0Nq5+9SnA6vhomHGDecpMrqYOJpm1cQUG6liu7wtjDD2vAvv
   mxdNw3lP5/R3rUC38U6Bg8rRfCUtXrVgIxSaWgaGtJzkPIUPEuIoh3hAB
   bIJSzoLiaRi3Sw1t/tKqIyEHP+ZI35OZ1PQMDMtiSHAOgGz7o4FNOtBZ7
   w==;
X-CSE-ConnectionGUID: Ye68fFNfTtGdvQjkETJKpQ==
X-CSE-MsgGUID: BhhPpTr0S0aYXLtVcFqZqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808173"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808173"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:19 -0800
X-CSE-ConnectionGUID: TJ+NyOfPTzerUWZOVDcU6A==
X-CSE-MsgGUID: SXPyg5DzR0W1hYMezslh9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865274"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:13 -0800
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
Subject: [PATCH 02/24] ASoC: codecs: rt1015: Fix definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:21 +0100
Message-Id: <20250220112643.3813295-3-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt1015.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 0f806dde9c39..beed43bb7ca0 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -1105,15 +1105,15 @@ MODULE_DEVICE_TABLE(i2c, rt1015_i2c_id);
 #if defined(CONFIG_OF)
 static const struct of_device_id rt1015_of_match[] = {
 	{ .compatible = "realtek,rt1015", },
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, rt1015_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt1015_acpi_match[] = {
-	{"10EC1015", 0,},
-	{},
+	{ "10EC1015" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt1015_acpi_match);
 #endif
-- 
2.25.1

