Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA7B2EA470
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805339; cv=none; b=M5HF7IEt1uHqgM84A2qF64FIOWkGu1MMamhJmh4KtwWE5AhLeqzQwj4hYaxsUIqpoiUqit4eeXaQHc8ZFAbF30ocDnNhkK6dVH8f9cOzJCT45WUFkaIPHnelUPBcLT8oi6Br0toa9SCAXS9pmtW+N+9nMh5EdmTnribfy6BUROA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805339; c=relaxed/simple;
	bh=1m/Y3qRuEtHj4NfWq5f7kekYcDzGsebKdy6mzcqqqj4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fyb2ossO5CyVtvseFpadNdpd24XWkWYlRLoIYVD0sAm7ZO8/kwFEI3PGr0I++63R7EX7xennmp9CjxCdX3FMpWqtT7JVFOmtnXhofMvFyUTMXlf/bpu3nsU8oiGkJJo63TD3imKlBP91yiBT6RAIUyDPvHMNvZGyHLKPml3H8+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nTbMFgFp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nTbMFgFp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805338; x=1788341338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1m/Y3qRuEtHj4NfWq5f7kekYcDzGsebKdy6mzcqqqj4=;
  b=nTbMFgFpwqzC/y4Y2t3GAQ2JiuavKUZN1x3ra9Io0B5XNSkcR77jjw/K
   q2xOZgaGv0uSryyEINykYhGvSmJAsGQI05ZnLa8EW+R4nDN37h3BiokPj
   IENae3cX2bBHw85ISY1Mo4z26ka/Rvp74c8kHXzAgPRKV6O0IjHjXEO+w
   mAx1Wey71PkkpWg3uJrSQXxHKy/tizr7nn8MumfuQuysCFY0DLfdkGVaU
   Hcr3qiTEkaLgpOsVAKhCpOqPP0zV5u7+jQG7EK7KsXv2+DHqjVkTJBh9x
   7V8Pj394cyhg+A/0Vdve/2+Q4acwoMU0NmqSYOfH/Tq92euxQtTB7Z3r0
   Q==;
X-CSE-ConnectionGUID: KOTrCKPwQyautvF6KneIqQ==
X-CSE-MsgGUID: nprs34a/QmmDcWby6O0How==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58275198"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58275198"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:28:58 -0700
X-CSE-ConnectionGUID: ZFyCviF7S9qnBODd8tKJQQ==
X-CSE-MsgGUID: lys961CrTTqZ5D1qki0xOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170503142"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 02:28:56 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 02/17] ASoC: Intel: avs: da7219: Adjust platform name
Date: Tue,  2 Sep 2025 11:48:38 +0200
Message-Id: <20250902094853.1231842-3-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/da7219.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 3ef0db254142..6782dc7efae3 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -165,8 +165,8 @@ avs_da7219_be_fixup(struct snd_soc_pcm_runtime *runrime, struct snd_pcm_hw_param
 	return 0;
 }
 
-static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
-			       int tdm_slot, struct snd_soc_dai_link **dai_link)
+static int avs_create_dai_link(struct device *dev, int ssp_port, int tdm_slot,
+			       struct snd_soc_dai_link **dai_link)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -176,8 +176,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl || !platform)
 		return -ENOMEM;
 
-	platform->name = platform_name;
-
 	dl->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_port);
 	dl->name = devm_kasprintf(dev, GFP_KERNEL,
 				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
@@ -193,6 +191,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
+	platform->name = dev_name(dev);
 	dl->num_cpus = 1;
 	dl->num_codecs = 1;
 	dl->platforms = platform;
@@ -218,18 +217,16 @@ static int avs_da7219_probe(struct platform_device *pdev)
 	struct snd_soc_card *card;
 	struct snd_soc_jack *jack;
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
@@ -259,10 +256,6 @@ static int avs_da7219_probe(struct platform_device *pdev)
 	card->fully_routed = true;
 	snd_soc_card_set_drvdata(card, jack);
 
-	ret = snd_soc_fixup_dai_links_platform_name(card, pname);
-	if (ret)
-		return ret;
-
 	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
-- 
2.25.1

