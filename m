Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F0052F6E
	for <linux-sound@vger.kernel.org>; Fri,  8 Mar 2024 09:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709888617; cv=none; b=QV2/AhNTwx4TnUYq2bUCTvMihK+OJfaAMBCFeFxqhxDcq9e82wVZNtufDpq+l2iDkD5YrnDCeZT6Q5zl6oEsTuyC8+T3x3s3p7n2xgpRv5IZv+WDs7eyONbU9ErEq13DXafaamcF7FoknVdQxRdPKnauqIg2fjmRX8smXSCrGGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709888617; c=relaxed/simple;
	bh=q07/xiG1a5n/c/8LAvQ0KqcgDLmF5An5u7sbwVefMzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nixsCf100FKKNPo43AAxz46HVPLZlCE8SClc5l1+d6H1xP7WsAaDUcsclCBMOSPn61d8dxV4nPKt55ryfo8rjLT7KTPaJzuSHUrr2ejrq+SHRaT+8m08dZInCqtplenVXxV4fReqEifgNHg/rj4qOa6WebE6TylVvRZvYfBUJuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S06d2mNE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S06d2mNE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709888616; x=1741424616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q07/xiG1a5n/c/8LAvQ0KqcgDLmF5An5u7sbwVefMzI=;
  b=S06d2mNET8w5UUOS/FwX5UYPuORFWUmXAl5eJhxKByPJhihZU8EYUHcj
   gGxdQPB918I9IACsTXzzNVMEDjj/PIgYZv3B4h3QlXqw4PIo9uK7QO1gp
   cNgNg+K6hoFSlF2F4OpXbvJikPhATaC9QNsv4Lv8MBe5rd5QYUCttg8h2
   qxSg1/hQLgNUh4m1/cfEUc8ssMvhwD77lmC+LPl5kxnHAvI48UejpHnPj
   emNN2UAglCFj91edWuk+g0PWZrhOtBTbmbk40pYKwhSTScmm2p/h0Nj7m
   sN1LlBogMpn6GqaixUncJsfndFrc7qge/8pi3dpm0mA9pMDuwcNk82Sw+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15247020"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15247020"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 01:03:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="10419297"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2024 01:03:34 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 5/5] ASoC: Intel: avs: i2s_test: Remove redundant dapm routes
Date: Fri,  8 Mar 2024 10:05:02 +0100
Message-Id: <20240308090502.2136760-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240308090502.2136760-1-cezary.rojewski@intel.com>
References: <20240308090502.2136760-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Remove unnecessary widgets and routes as they are created by
snd_soc_dapm_connect_dai_link_widgets() automatically.

Link: https://lore.kernel.org/all/20230612110958.592674-1-brent.lu@intel.com/
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/i2s_test.c | 79 ---------------------------
 1 file changed, 79 deletions(-)

diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 28f254eb0d03..282256d18cc6 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -54,76 +54,13 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	return 0;
 }
 
-static int avs_create_dapm_routes(struct device *dev, int ssp_port, int tdm_slot,
-				  struct snd_soc_dapm_route **routes, int *num_routes)
-{
-	struct snd_soc_dapm_route *dr;
-	const int num_dr = 2;
-
-	dr = devm_kcalloc(dev, num_dr, sizeof(*dr), GFP_KERNEL);
-	if (!dr)
-		return -ENOMEM;
-
-	dr[0].sink = devm_kasprintf(dev, GFP_KERNEL,
-				    AVS_STRING_FMT("ssp", "pb", ssp_port, tdm_slot));
-	dr[0].source = devm_kasprintf(dev, GFP_KERNEL,
-				      AVS_STRING_FMT("ssp", " Tx", ssp_port, tdm_slot));
-	if (!dr[0].sink || !dr[0].source)
-		return -ENOMEM;
-
-	dr[1].sink = devm_kasprintf(dev, GFP_KERNEL,
-				    AVS_STRING_FMT("ssp", " Rx", ssp_port, tdm_slot));
-	dr[1].source = devm_kasprintf(dev, GFP_KERNEL,
-				      AVS_STRING_FMT("ssp", "cp", ssp_port, tdm_slot));
-	if (!dr[1].sink || !dr[1].source)
-		return -ENOMEM;
-
-	*routes = dr;
-	*num_routes = num_dr;
-
-	return 0;
-}
-
-static int avs_create_dapm_widgets(struct device *dev, int ssp_port, int tdm_slot,
-				   struct snd_soc_dapm_widget **widgets, int *num_widgets)
-{
-	struct snd_soc_dapm_widget *dw;
-	const int num_dw = 2;
-
-	dw = devm_kcalloc(dev, num_dw, sizeof(*dw), GFP_KERNEL);
-	if (!dw)
-		return -ENOMEM;
-
-	dw[0].id = snd_soc_dapm_hp;
-	dw[0].reg = SND_SOC_NOPM;
-	dw[0].name = devm_kasprintf(dev, GFP_KERNEL,
-				    AVS_STRING_FMT("ssp", "pb", ssp_port, tdm_slot));
-	if (!dw[0].name)
-		return -ENOMEM;
-
-	dw[1].id = snd_soc_dapm_mic;
-	dw[1].reg = SND_SOC_NOPM;
-	dw[1].name = devm_kasprintf(dev, GFP_KERNEL,
-				    AVS_STRING_FMT("ssp", "cp", ssp_port, tdm_slot));
-	if (!dw[1].name)
-		return -ENOMEM;
-
-	*widgets = dw;
-	*num_widgets = num_dw;
-
-	return 0;
-}
-
 static int avs_i2s_test_probe(struct platform_device *pdev)
 {
-	struct snd_soc_dapm_widget *widgets;
-	struct snd_soc_dapm_route *routes;
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_acpi_mach *mach;
 	struct snd_soc_card *card;
 	struct device *dev = &pdev->dev;
 	const char *pname;
-	int num_routes, num_widgets;
 	int ssp_port, tdm_slot, ret;
 
 	mach = dev_get_platdata(dev);
@@ -156,26 +93,10 @@ static int avs_i2s_test_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = avs_create_dapm_routes(dev, ssp_port, tdm_slot, &routes, &num_routes);
-	if (ret) {
-		dev_err(dev, "Failed to create dapm routes: %d\n", ret);
-		return ret;
-	}
-
-	ret = avs_create_dapm_widgets(dev, ssp_port, tdm_slot, &widgets, &num_widgets);
-	if (ret) {
-		dev_err(dev, "Failed to create dapm widgets: %d\n", ret);
-		return ret;
-	}
-
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->dai_link = dai_link;
 	card->num_links = 1;
-	card->dapm_routes = routes;
-	card->num_dapm_routes = num_routes;
-	card->dapm_widgets = widgets;
-	card->num_dapm_widgets = num_widgets;
 	card->fully_routed = true;
 
 	ret = snd_soc_fixup_dai_links_platform_name(card, pname);
-- 
2.25.1

