Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2411F0E2D
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050090; cv=none; b=MPEUCh6CD8Xq/eNYqp2LkkA4QakPnlehSKKb4QrC76ahm2rtVonS5lPodv7B+fVVmiGUVcxPfrwAWvAKKIFH8h4A0kFOZgSv1LtCB3df3wa/Yrq4APIuEF1wZgfq/ZTgTpNBHQYS52HaCF7IRQVdHiPuaBsDzWOds4UQbBgvLpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050090; c=relaxed/simple;
	bh=ZlzV7J25uxWbBdEwHVq/9m7BbmzPCCU2nXkall7tPwM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aZkEaFlt6eAMogXJDu5CjaRh4X0ebagYeYr6sfT9u8KlKbAZwyePWZP4tqEnbWRXto65z+Yg9TV5PkbpzvOXWgsc+EfysmOgz+2GVua7Usg7pQBSLhWrnok7wuZgZPCpW6eoTbYXe65STeN2Iow2nLrhkXEDIAeV4v60gJH7YRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/CLhrTk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/CLhrTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050089; x=1771586089;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZlzV7J25uxWbBdEwHVq/9m7BbmzPCCU2nXkall7tPwM=;
  b=b/CLhrTkjMPKemljbzb7Fp0zJAFz40HBWY/wLKgAjug55kYR7+hcc2Sd
   czIrBT7LikDamF0D6a1Jw97J7x5/6H0+7EIBpJUmx+ciB+JYKjfuCSnA9
   j37AkXV/6PlkW/fua7OKnUSde+/yBVrsj6B9jKBb4t0xFLWdR8tKN34qn
   HJEU9ls11EG8KhkeHVpMP+2ZAHzFQLD4WX0gSQtp1t2Soxom4roJiVo49
   EHdKHyz5WMcRuIkBuISZV3Xw3G0Vq1nSjYsVzwsI4VSDdDFh+n3Wh0hdE
   N/Uy+RUt67aW4YT1wRTsWxsBG3LffeKLPnhw4yMiIBn2nt+yGWkUzt/zq
   Q==;
X-CSE-ConnectionGUID: HRm9JMZ2T8mVWIGN0RpJPg==
X-CSE-MsgGUID: SINb2GwGRuigw/bs4NREVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808297"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808297"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:49 -0800
X-CSE-ConnectionGUID: DRnZpWEVTpSZHZsSxn2GEA==
X-CSE-MsgGUID: zUNW/Q5pSsO8j0WPitNDmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865405"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:47 -0800
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
Subject: [PATCH 15/24] ASoC: codecs: rt5663: Fix definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:34 +0100
Message-Id: <20250220112643.3813295-16-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt5663.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index 9d32debd3689..aa684d62bec6 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -3315,15 +3315,15 @@ MODULE_DEVICE_TABLE(i2c, rt5663_i2c_id);
 #if defined(CONFIG_OF)
 static const struct of_device_id rt5663_of_match[] = {
 	{ .compatible = "realtek,rt5663", },
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, rt5663_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5663_acpi_match[] = {
-	{ "10EC5663", 0},
-	{},
+	{ "10EC5663" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt5663_acpi_match);
 #endif
-- 
2.25.1

