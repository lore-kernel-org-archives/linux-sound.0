Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEC5205AA7
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591028; cv=none; b=tmkgjPaXdtm7aAYxQY+2yEz83NrCUFqCJUN3MT60ek1MdE9R/SSwrD5dlKDAdaVQTM0JzsOY03zfB/jycivM8C+RI3SOXrW5ZKbREG0cPgsWXo//phInjhTru0Rx27EoyRBlqc/DMbSlbvDBB89LS6402MoRZXbTrDp1XgQU1yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591028; c=relaxed/simple;
	bh=2HwFycZ0Oc3hA3qSQszAwsZKRAtBO7XsKQ2hvXcJvJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V6jSUXhXHSBDF3+0c23rJ6nnEkAhJfYbaNrYGTtIz3xy0EP4oI2iuh3bWNBWOa5Tpf9vP9fabl1veKMjzlvww4Q81sha7Ry87JhEd+PgMNcFKhE+x7C4hjcqlYhawz5qdnhSsakflRNbnTJbW3FAhF363yoBNd+Ms6ijSn2laLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CMZNwjVQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMZNwjVQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738591027; x=1770127027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2HwFycZ0Oc3hA3qSQszAwsZKRAtBO7XsKQ2hvXcJvJ4=;
  b=CMZNwjVQqGn2a306vNWWwOtryCBun7FKC4havwFXckvts3HeIJADvCW1
   fs5FGOy+rG4rkQPTRJJD38YKHR6d38m16Cv648MBKsbPaKC54thrI5hlg
   vM1FVMRWv7M5B8VIUrKNjFoeDzyAC1Tdxixjay8/aCBjlKh021oxmOlNH
   xx5LyggbbXbvWhxN1D2oABWU+q2CyQVs8eIKBj/oxCqgwIhLEdO+hKYrv
   Mu+Tiz+bUgNdhDkr9yYGzYycbjVgwTAp3Kui1EcDoRgUjYsnXqPam0tBO
   oYik+N9sxImBMwr8i5jNXBWCrj8DD6vTeQfqeiHtb7H2Vt5oTbkHiHct1
   w==;
X-CSE-ConnectionGUID: 4qrU+TbIQLOfpkqzYc6ycA==
X-CSE-MsgGUID: uersI0FpRNmM6lpeDdLAYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56511796"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56511796"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:57:07 -0800
X-CSE-ConnectionGUID: utsTUQgORqW02K7sOEHbAw==
X-CSE-MsgGUID: O1WUIkcgT+q88ljU2h1gEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110057869"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2025 05:57:04 -0800
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
Subject: [PATCH v3 02/11] ASoC: codecs: pcm3168a: Relax probing conditions
Date: Mon,  3 Feb 2025 15:10:42 +0100
Message-Id: <20250203141051.2361323-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250203141051.2361323-1-cezary.rojewski@intel.com>
References: <20250203141051.2361323-1-cezary.rojewski@intel.com>
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

