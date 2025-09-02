Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076AB2EAB79
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805349; cv=none; b=PNnpZpztvg9lJe8svYlFIAeudUdle4KfSzuiVxNiWqiN44+qjK/It+zDLdwthR8E/OhQco48WWAksd2DiCpPRq+a73A9uYD5waSlyWfbcj4KV6/fTf3g2j/NFDpNt3NP1aOHy2m88Vo+/V3qXv1kk2y0PAGgUL8G3St+BP+Jejg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805349; c=relaxed/simple;
	bh=fTKH8zbEmWYygHrCQ5scIj5khrjXa7dSTaDdzvbF+hE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J2cZvrV5NP9KMhDooD/EYZuT0YRoFV5pcNYVGgIcqudoa9CjzTWk50/IafDPIerzqNd7WdY4DsBmL/KGJPe7jpDPnz7k3yQ8jKW9hqBgvA4HXIepN3d1/lyVbmT0MX7WYeRzd6uOOmPVYzZRXvKojcXRhdXNlUt9IvxIINKtnaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xctbeamx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xctbeamx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805348; x=1788341348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fTKH8zbEmWYygHrCQ5scIj5khrjXa7dSTaDdzvbF+hE=;
  b=XctbeamxPqfgn+sil4JAsfDa9dpISAoGfzHIIpUtHpVgz2EvuNwlpJyl
   O/P8NBOz8Wd06F3o2UDnssb47uI8FVVki0g3XySkizNVTtOtXpTe5MiNT
   pB5tc4jCxZhf9mU35SS0WsD+MP42qgtcrr3k3VyXcJTusq4zKpdBqzmiw
   CSEctguqlB6MMsh2j98WcF4yH/FXzxRKd8J9xNgz8lOhjivU+xxZLOLYH
   RdDU5x5rLMaDNJn6GU7OQJL2LKit4mG423peCPWC0Qkms7EjcMulFagar
   SRtPr6JMT6KLz0lUxUk1E4PIVKfZF0vVeBzhOGK4FEixSWpU5hcPkm/NH
   w==;
X-CSE-ConnectionGUID: cTplKCT0Q3+U2xrB+jq7YA==
X-CSE-MsgGUID: TkbR6r6HSKqPz2w+O+4sOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58275224"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58275224"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:29:07 -0700
X-CSE-ConnectionGUID: p7iabvzhSfG2RrrJhfa+kQ==
X-CSE-MsgGUID: 4i56lGufQTS5v5LfSa/DgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170503205"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 02:29:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 06/17] ASoC: Intel: avs: max98357a: Adjust platform name
Date: Tue,  2 Sep 2025 11:48:42 +0200
Message-Id: <20250902094853.1231842-7-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/max98357a.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index 72053f83e98b..e9a87804f918 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -46,8 +46,8 @@ avs_max98357a_be_fixup(struct snd_soc_pcm_runtime *runrime, struct snd_pcm_hw_pa
 	return 0;
 }
 
-static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
-			       int tdm_slot, struct snd_soc_dai_link **dai_link)
+static int avs_create_dai_link(struct device *dev, int ssp_port, int tdm_slot,
+			       struct snd_soc_dai_link **dai_link)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -57,8 +57,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl || !platform)
 		return -ENOMEM;
 
-	platform->name = platform_name;
-
 	dl->name = devm_kasprintf(dev, GFP_KERNEL,
 				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
 	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
@@ -73,6 +71,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
+	platform->name = dev_name(dev);
 	dl->num_cpus = 1;
 	dl->num_codecs = 1;
 	dl->platforms = platform;
@@ -96,18 +95,16 @@ static int avs_max98357a_probe(struct platform_device *pdev)
 	struct avs_mach_pdata *pdata;
 	struct snd_soc_card *card;
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
@@ -135,10 +132,6 @@ static int avs_max98357a_probe(struct platform_device *pdev)
 	card->num_dapm_routes = ARRAY_SIZE(card_base_routes);
 	card->fully_routed = true;
 
-	ret = snd_soc_fixup_dai_links_platform_name(card, pname);
-	if (ret)
-		return ret;
-
 	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
-- 
2.25.1

