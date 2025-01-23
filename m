Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C481C5D4D
	for <linux-sound@vger.kernel.org>; Thu, 23 Jan 2025 16:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737649382; cv=none; b=dnDuOp4flpuJVklwmQ45oGB8lvjRsNM9MNDxGLdKeXXoiKIHG8VfMEc8wLEkMzztn0xBk8bVllH8QbrQrfJ69eclKlrtyVXM7Fe2z5grwI96S2gPugAgs1JgVJXDEj5VMYTl3w8vvnbxGSjCCWka6rX/ZjDU2KE76oS6BiyPgM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737649382; c=relaxed/simple;
	bh=2HwFycZ0Oc3hA3qSQszAwsZKRAtBO7XsKQ2hvXcJvJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gk9ke6qloDmBwv97QAhWX3ENuVCQjU7IUhHe6S3H4UIPlYmQCuw4qsJcaaEZHtks70JQy8gcXTL72AMQtgfQkux+f09VFLSzak4v54dPo6i9jLBZelC9PtQlVrs0SO+7s20OZw3Nr54/NdybSbtgua96cljc7EI7G0lTq0CuBjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/NdhW68; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/NdhW68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737649381; x=1769185381;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2HwFycZ0Oc3hA3qSQszAwsZKRAtBO7XsKQ2hvXcJvJ4=;
  b=A/NdhW68FFme5mIHA3YcHg6D288vVD+pt3aoqneDmCwFcEnAx3Sw+Cqk
   uI7ZFMFNp8fF9oCUcFg8KtZTkHlG70zSDKFqixqwozt65yzOOnZuFd3G2
   I6Vp9zjTE8/fHmA2pdJ70pBShmw31gxpbpedvApTTK/XsSTyZlK/oxX9H
   r+US1LMarL/7Q3cFdFvhH3dCOe9MTlEz3Feu8ISXJWwt7NKHWumoVus6N
   ZXefgFk/HquBrovPdXUDSmGDvJuSZ8tkgcrIZerqHQyxCq0CAHQVrzLfE
   LQ/QlqyXswur3n0cgTbj9kC+NYPqX4dP6t6fgXnsDvgRWce3woR6olzQX
   g==;
X-CSE-ConnectionGUID: fSpNeBFkSSu7jyKHm6Yzag==
X-CSE-MsgGUID: LkugOk6pSo2G/dnWNyk9wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55572481"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="55572481"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 08:23:01 -0800
X-CSE-ConnectionGUID: 5V/EJwKDRPqdq87LHM49ew==
X-CSE-MsgGUID: /zKEreauRKeACT+2634GmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107346716"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 08:22:58 -0800
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
Subject: [PATCH v2 02/11] ASoC: codecs: pcm3168a: Relax probing conditions
Date: Thu, 23 Jan 2025 17:36:25 +0100
Message-Id: <20250123163634.1451237-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250123163634.1451237-1-cezary.rojewski@intel.com>
References: <20250123163634.1451237-1-cezary.rojewski@intel.com>
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

