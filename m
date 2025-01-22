Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8249214802
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 17:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737567646; cv=none; b=dLeRRXTjtCst/wgFctcTDM0URPu8Nxl1AUTbQzNdfHT3i+MGUFCxVZk78PUonRTIrrI0iz77dirsyWcAYgU8bvkKzuaRlApFFmN72bTS3G7LyB4Hk9cqNuleeUpbLt4z8W+qkUI4gF58gwpGxQdKYkN1H7CcebEO3iaue/wYgoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737567646; c=relaxed/simple;
	bh=2HwFycZ0Oc3hA3qSQszAwsZKRAtBO7XsKQ2hvXcJvJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mv5qISZkBdZDsIlK3x8nMZcrqjZL6mF2DocGaRVrrzl5UajuyUvLNUwG1j+Y8IEmtgL+X7UAKyMyYSik3UtZOtS0KLhmY2o8lZCHRM/YxtI4W7M3i1vS5pbBZ5Ps4tJUK1oGgNLTZYaftMrk+MiwoJrP4u0x+Kpn12wlzG2I0yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGJXu0Io; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGJXu0Io"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737567645; x=1769103645;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2HwFycZ0Oc3hA3qSQszAwsZKRAtBO7XsKQ2hvXcJvJ4=;
  b=KGJXu0IoUxD0yfRJyUM17If2qaFCGjIhNQhlEKU1eRpC7TiqaKX2jsdl
   h0e6ACuji8rAEK4p7lURyf8aYQf3whwWHgnDQnztZ7q1WfycF//kFmr+E
   MPDmrZXBU0E3W2rRw5spA0wqY4/VfXL59TRcElNhvZkO+K8uhOTxJH2a3
   Ck6WAtZineNooVCvU9EOxeNKq39SHACvyg4+vs0zKJsCCeXFvgKSn/aaI
   gDsc/NTCdErQjSsVhRjkJCo6+sQNZzLYJY+qJPmFV5JPUXYgh5dKzDzAi
   pk797R47Wlf5EK5ZS1gkAs6PHdxKdye+mRTSMzD/RO1A0vmVbnIMdOP5W
   g==;
X-CSE-ConnectionGUID: eCm8eqmkSEyU8VyZeqsD4g==
X-CSE-MsgGUID: oH6jD9JPSPaviITBhm/d0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49434727"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="49434727"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 09:40:45 -0800
X-CSE-ConnectionGUID: 6E6PtgXeQdWBw9zWbAInuQ==
X-CSE-MsgGUID: w3DiygyVRW6WtAEhKNzawg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112185235"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa003.jf.intel.com with ESMTP; 22 Jan 2025 09:40:42 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 02/11] ASoC: codecs: pcm3168a: Relax probing conditions
Date: Wed, 22 Jan 2025 18:54:17 +0100
Message-Id: <20250122175426.1369059-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122175426.1369059-1-cezary.rojewski@intel.com>
References: <20250122175426.1369059-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On ACPI-based systems with Intel MalibouLake there is no "scki" clock
entry defined. Make that initialization part optional and default to
24.576 MHz rate if not set. The rate is the default for both TI and
Intel devices.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/pcm3168a.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index fac0617ab95b..43c0cb5e538e 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -743,7 +743,7 @@ int pcm3168a_probe(struct device *dev, struct regmap *regmap)
 		return dev_err_probe(dev, PTR_ERR(pcm3168a->gpio_rst),
 				     "failed to acquire RST gpio\n");
 
-	pcm3168a->scki = devm_clk_get(dev, "scki");
+	pcm3168a->scki = devm_clk_get_optional(dev, "scki");
 	if (IS_ERR(pcm3168a->scki))
 		return dev_err_probe(dev, PTR_ERR(pcm3168a->scki),
 				     "failed to acquire clock 'scki'\n");
@@ -755,6 +755,9 @@ int pcm3168a_probe(struct device *dev, struct regmap *regmap)
 	}
 
 	pcm3168a->sysclk = clk_get_rate(pcm3168a->scki);
+	/* Fallback to the default if no clk entry available. */
+	if (!pcm3168a->sysclk)
+		pcm3168a->sysclk = 24576000;
 
 	for (i = 0; i < ARRAY_SIZE(pcm3168a->supplies); i++)
 		pcm3168a->supplies[i].supply = pcm3168a_supply_names[i];
-- 
2.25.1

