Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FEB2EAB71
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805351; cv=none; b=hxKikqtHJW4PUKWBVQLeHef/sN9uuVj33sKmgQhModtHx3arBBdCs/T6dMw6S0YiEZZkwa4ryirwaPpgGV+mnGi0+QkikGzTF0o9YIptCeZF/7X9X7udBFd4ZwCrZNA3WojnbAIWTLsHs82Ot+JcWtYpVRQEFH+AjtJCmPO2O8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805351; c=relaxed/simple;
	bh=hmqMUC0UBQORd+AAkhzKg7WaB2/HIcn60X0a5cuKtZU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZP20yxwjOhutLjXoBimGktl2xft2pbVEBpWsx8njYk8VN9bk5zwNOrzFZbnGOetqKI/2b6gBgqXXWwNVRKTVhhKIEJq6zIPrYdaCJ48Y4rY7kSJ8ZZILYgvKK0miNPcZBSXzn84aV5iIxL9Ys0yUsZoGgYmRYkeWreXuFYYx6TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQULUWDQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQULUWDQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805350; x=1788341350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hmqMUC0UBQORd+AAkhzKg7WaB2/HIcn60X0a5cuKtZU=;
  b=JQULUWDQ8v85GgG3JYQoWs0yRDKNIOCmXTJe39a4XbrDEPnBKtKET1KX
   l8eSee2ukBdy1OCj/f/9cHChSjapsreqmYG/fuUUFo+JGRzgW2pKqctDg
   Jk7xZ71czHQH4NRYisnmAYsvyjhEOTHRQqhLeLM/4qpySWmTrP+X1v2qU
   1z2ej4pHNNF2YAQ1D5r2T7STuingsfd9tZ6hraoiS9lGttkSWAaNUiRjz
   McVp2rrjKh47o+7kdlJBUT1KUA+25HPsZSyytDD6vNO9J83lShE8QF8Wo
   BvZ5KIDf7IvkxgLTa+Y2SS+IG7nSGmVKa9HhRE8usW2TppJ4OLfnE4IXW
   Q==;
X-CSE-ConnectionGUID: JTfkxCOoR9WnP9IshNnGwA==
X-CSE-MsgGUID: FptrzcnSQeKWEAf9jQuktQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58275235"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58275235"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:29:09 -0700
X-CSE-ConnectionGUID: pyfAePoYToyWwOt2Esbq6Q==
X-CSE-MsgGUID: 70wXxwSlSw2SqgJFV/EDEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170503214"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 02:29:08 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 07/17] ASoC: Intel: avs: max98373: Adjust platform name
Date: Tue,  2 Sep 2025 11:48:43 +0200
Message-Id: <20250902094853.1231842-8-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/max98373.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index cdba1c3ee20b..8b45b643ca29 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -95,8 +95,8 @@ static const struct snd_soc_ops avs_max98373_ops = {
 	.hw_params = avs_max98373_hw_params,
 };
 
-static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
-			       int tdm_slot, struct snd_soc_dai_link **dai_link)
+static int avs_create_dai_link(struct device *dev, int ssp_port, int tdm_slot,
+			       struct snd_soc_dai_link **dai_link)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -106,8 +106,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl || !platform)
 		return -ENOMEM;
 
-	platform->name = platform_name;
-
 	dl->name = devm_kasprintf(dev, GFP_KERNEL,
 				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
 	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
@@ -125,6 +123,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	    !dl->codecs[1].name || !dl->codecs[1].dai_name)
 		return -ENOMEM;
 
+	platform->name = dev_name(dev);
 	dl->num_cpus = 1;
 	dl->num_codecs = 2;
 	dl->platforms = platform;
@@ -149,18 +148,16 @@ static int avs_max98373_probe(struct platform_device *pdev)
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
@@ -190,10 +187,6 @@ static int avs_max98373_probe(struct platform_device *pdev)
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

