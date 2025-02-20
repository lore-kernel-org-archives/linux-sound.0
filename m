Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85B01F0E2D
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050083; cv=none; b=isFdsYnOT5JHucwA+mTLuRaWs2N08GKvUVhHcQb24dCHn9MUsIrEVhWJtCa9oidrI42o6+Hvm0ltAVb349QO+7QeGFk7tcFj+ddpm7Jq5Ku2P7YasRNvGRzpXeCz0Ov0z+SDQH7rzDjxl235gQh3NH06OFgR7KuCl4rfWCPMaSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050083; c=relaxed/simple;
	bh=3PlstzKzN0fhS4dVIUbGcwyykV9PPM4FoTTHW6shm3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EBEQwHjY+MkBYdsAnDFCfGbCspsWEn6HbhitwaoLnyQQcoYjbgSHSsUhhnuoQe52f/bxNEaqTJpmT9IWPcVwat+UhUUrSU+nAJX/svakZ9HP1RFPzHeNuje0fU0WtviT69Ft9RLnI+RFSRMxQYHhwRwH08umZ1JDSvue16/3K04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/L0f85/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/L0f85/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050082; x=1771586082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3PlstzKzN0fhS4dVIUbGcwyykV9PPM4FoTTHW6shm3c=;
  b=l/L0f85/GpspfZ+IEWEsCsoGES0Ek1l4aJtwx7YNhdL97Lz4Iogxmb9L
   exq9sy1viRadhGkEMsSa0/aPkYLbqbt7YfrfwtV13sV06414BYej0nPX5
   4sR2EaeauK3Z1Tzt3JszliSZ06rwzt89wE9mytB+wlGIC7RN7tprxtQnJ
   zKniC4dlXKmVQjuf13J0iih3OcBR8yQLt9D1GzkE67FQX+qRz2wMe1Y6z
   s8GC2e/U7v6k1PCNfpGiEPwSoQzAiPh5CSPWLQeZW2MgvYH974LaE2WNG
   GEg8oQbfexDTLlBpYsc2Ok/15ARPJMbJcFdh5SO8+emAdDdcK2aJPrQhk
   g==;
X-CSE-ConnectionGUID: hn0intYPQ3uPPjFIfHlugg==
X-CSE-MsgGUID: 6xkoRl0SQ4GeUeyJhzJbEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808263"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808263"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:42 -0800
X-CSE-ConnectionGUID: x3XesA05Qyiub9yujh5x1Q==
X-CSE-MsgGUID: xOHVb9kMTQGTvaOsKvh6xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865355"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:39 -0800
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
Subject: [PATCH 12/24] ASoC: codecs: rt5651: Fix definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:31 +0100
Message-Id: <20250220112643.3813295-13-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt5651.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5651.c b/sound/soc/codecs/rt5651.c
index 00421a1f54bf..a4ea6c47617a 100644
--- a/sound/soc/codecs/rt5651.c
+++ b/sound/soc/codecs/rt5651.c
@@ -2184,16 +2184,16 @@ static const struct regmap_config rt5651_regmap = {
 #if defined(CONFIG_OF)
 static const struct of_device_id rt5651_of_match[] = {
 	{ .compatible = "realtek,rt5651", },
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, rt5651_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5651_acpi_match[] = {
-	{ "10EC5651", 0 },
-	{ "10EC5640", 0 },
-	{ },
+	{ "10EC5651" },
+	{ "10EC5640" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt5651_acpi_match);
 #endif
-- 
2.25.1

