Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61023250BF1
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029677; cv=none; b=Np6bRackC6cFho+eOZXmXUqG+GY7YmBrBtcs1BX+QdLOeO9Jg8D/ApEt/5bFrf6KJmcOVS2RS6oHbYmClkXegbcinpeVZ6PFjfikz/V9FntUx83FMXqqSbnE64JvOm3SVVzueIbM8Td01SCVjUfiXpXFgAn+f+glBcjJjLowubg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029677; c=relaxed/simple;
	bh=p8FGbpZUN/wbuM8TDNnRLMZgxgVTDWDD2bAa/yOFHqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bkwpbmUYpATWkIfr8BvNtTyUxPPhv1oU7Yw2ymq3FvjDTQHj5p3R/3uNoBL0aaF2dsC5y7djRyhCSWsBoQ6593dDLjzfYnfp7WAzK4IXSNFBe3HLoLlWn27bCGj+i+TJ/Np7CZIg5pkSilhGhcT9c3Xb2Zs9E/tjy531SIjiYFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DNbF6hEH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DNbF6hEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029677; x=1775565677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p8FGbpZUN/wbuM8TDNnRLMZgxgVTDWDD2bAa/yOFHqM=;
  b=DNbF6hEH30jTw31gC++5Fip+eFnmN1xyKD7kudPtHJgxxQamudiadY4J
   /imk6n8e+J+jHVF+oWCkB2Q6XPXS7a5zglqW4Ftm2aAL8zh4wIwJuTjIj
   x7t5SUdbNICuvAtifrVkloymMB2FtIPjmGwJAiVgHxPjFeCGcayhncAEf
   l6qGSEWz1ij6Msn2IPgdPvBUK8l857mNuATGqLAKgOQVvSpw+6MhfwzV2
   WupqbPg0eKAOZh/c5Lhg0zxxxWjXeiJ8eLcyJS7GnbCaqGi0jhnhmnUPE
   G25MAA6DcDmzN9hfsH73F0CCfyd6OMCE5ED3XGfn3HvqVvR3DVLZgRi1x
   A==;
X-CSE-ConnectionGUID: IYYk6krgRe6nwZ0iOkdP9g==
X-CSE-MsgGUID: HYWRX7jqT0qGl9wu7thcVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56779119"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56779119"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:41:16 -0700
X-CSE-ConnectionGUID: r/+7dsYUSh+Tgb7+cRaRCw==
X-CSE-MsgGUID: rZjkaaxOTsKOuOOOtz7fKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134308"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:41:14 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 20/20] ASoC: Intel: avs: boards: Change ssm4567 card name
Date: Mon,  7 Apr 2025 14:41:54 +0200
Message-Id: <20250407124154.1713039-21-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
References: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename FE from "avs_ssm4567" to "AVS I2S SSM4567".

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/ssm4567.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 7667790d52739..2d11d39a9871e 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -132,6 +132,7 @@ static int avs_ssm4567_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_acpi_mach *mach;
+	struct avs_mach_pdata *pdata;
 	struct snd_soc_card *card;
 	struct device *dev = &pdev->dev;
 	const char *pname;
@@ -139,6 +140,7 @@ static int avs_ssm4567_probe(struct platform_device *pdev)
 
 	mach = dev_get_platdata(dev);
 	pname = mach->mach_params.platform;
+	pdata = mach->pdata;
 
 	ret = avs_mach_get_ssp_tdm(dev, mach, &ssp_port, &tdm_slot);
 	if (ret)
@@ -154,7 +156,12 @@ static int avs_ssm4567_probe(struct platform_device *pdev)
 	if (!card)
 		return -ENOMEM;
 
-	card->name = "avs_ssm4567";
+	if (pdata->obsolete_card_names) {
+		card->name = "avs_ssm4567";
+	} else {
+		card->driver_name = "avs_ssm4567";
+		card->long_name = card->name = "AVS I2S SSM4567";
+	}
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->dai_link = dai_link;
-- 
2.34.1

