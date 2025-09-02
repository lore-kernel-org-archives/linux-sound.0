Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006722EAB60
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805369; cv=none; b=emd9o3W6lLqJAeb+n8EkElgyu56VbLh1AurWbvkr/mTgH3VEaEQKLVE3j5eY3aWXmuYv9TLGEcAU3Rhhv0zouhZhVekynrqASNq4LZn74FRtmeIyR1fudQ5gmxBechI4n5BOE9GTXXqZDNqgE5CS6kYrVy19wPrxxoq9D5VuCPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805369; c=relaxed/simple;
	bh=G3q1PfGxcxLmBQRiVfKy31xjL/3GITsLK9bzGwU1PbA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dqm/i5ZCvX8Hub/CNV+0GAhy9stHeeSC2tohXuQrDD8SzmuHAGHaZk7iCXZdJm7XCKltmnvluWVDsDOKQ1LX0Fa28yzx9g61R50r0xzO/IvEHqmzBz4/CWw4YWhB/+q7w5mRGx+dam5OtJ3BhE8sejoPttIA0mjQqkhKiUCC2oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7zNFejt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7zNFejt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805368; x=1788341368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G3q1PfGxcxLmBQRiVfKy31xjL/3GITsLK9bzGwU1PbA=;
  b=g7zNFejtVdOgxCZcXVH4D9eOnHVMdx7RJrp4mqsxrs24b80xqaIgu7I1
   QW85J9bjjHlYi56ld+xKHCdcPLfC0QyYCxSKO/c+ED7iviEsUAhgIHoSl
   W/iiy3IyZuO0US7gY/QP8LPzqbosKVrECOKgmOFhDJ30F5XeIFOnRXX39
   CP/GmMNwVz1GLEw5SLwQ85nkyEYcDcW1sRDG0XVKSYgVJH6ED+sLnb08p
   UK++6TBd8yidTHe+Z184R0DuY72BUlwbkvdy8WMky7A7JI80e3sIgWrxZ
   Ub+7dPv0o4qjJiIX5jd4AVzlBuYbmmUVrV4GzRS12ERW34Nv5Ef4Ajs+4
   g==;
X-CSE-ConnectionGUID: AGWkS+4kR5uvPZdF4CFeaQ==
X-CSE-MsgGUID: q0HSTpW9Q/Kl8mueeF32xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58275279"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58275279"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:29:28 -0700
X-CSE-ConnectionGUID: FiR9L0mGQ12sil5D9ED6Kw==
X-CSE-MsgGUID: BJALKJO0S4SVtUHsXLWdGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170503279"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 02:29:26 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 15/17] ASoC: Intel: avs: rt5663: Adjust platform name
Date: Tue,  2 Sep 2025 11:48:51 +0200
Message-Id: <20250902094853.1231842-16-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250902094853.1231842-1-cezary.rojewski@intel.com>
References: <20250902094853.1231842-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The name of the platform component matches the name of the card's
platform_device.

This allows for simplifying card and dai_link initialization:
- drop mach->mach_params.platform usage
- drop snd_soc_fixup_dai_links_platform_name() usage

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/rt5663.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index 51648801710a..68fea325376a 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -134,8 +134,8 @@ static const struct snd_soc_ops avs_rt5663_ops = {
 };
 
 
-static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
-			       int tdm_slot, struct snd_soc_dai_link **dai_link)
+static int avs_create_dai_link(struct device *dev, int ssp_port, int tdm_slot,
+			       struct snd_soc_dai_link **dai_link)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -145,8 +145,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl || !platform)
 		return -ENOMEM;
 
-	platform->name = platform_name;
-
 	dl->name = devm_kasprintf(dev, GFP_KERNEL,
 				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
 	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
@@ -161,6 +159,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
+	platform->name = dev_name(dev);
 	dl->num_cpus = 1;
 	dl->num_codecs = 1;
 	dl->platforms = platform;
@@ -202,18 +201,16 @@ static int avs_rt5663_probe(struct platform_device *pdev)
 	struct snd_soc_card *card;
 	struct rt5663_private *priv;
 	struct device *dev = &pdev->dev;
-	const char *pname;
 	int ssp_port, tdm_slot, ret;
 
 	mach = dev_get_platdata(dev);
-	pname = mach->mach_params.platform;
 	pdata = mach->pdata;
 
 	ret = avs_mach_get_ssp_tdm(dev, mach, &ssp_port, &tdm_slot);
 	if (ret)
 		return ret;
 
-	ret = avs_create_dai_link(dev, pname, ssp_port, tdm_slot, &dai_link);
+	ret = avs_create_dai_link(dev, ssp_port, tdm_slot, &dai_link);
 	if (ret) {
 		dev_err(dev, "Failed to create dai link: %d", ret);
 		return ret;
@@ -245,10 +242,6 @@ static int avs_rt5663_probe(struct platform_device *pdev)
 	card->fully_routed = true;
 	snd_soc_card_set_drvdata(card, priv);
 
-	ret = snd_soc_fixup_dai_links_platform_name(card, pname);
-	if (ret)
-		return ret;
-
 	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
-- 
2.25.1

