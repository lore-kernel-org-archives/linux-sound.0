Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260E978B74
	for <linux-sound@vger.kernel.org>; Mon,  4 Mar 2024 19:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709579077; cv=none; b=m+ohYgQYv4zXU6Z8xeR1JVlSQaBTqXFIGg9IoRMef0JU5k6JTLmm7/8kOdNsoXYl4kztTc74oniLLC/gdBAIWL0gvEPZE0cTSavR+R/cB6OZVWMOfRJ8MltPiM2mJpMH/aw7Lqnqqu6lXl+yqhaYJawPe6o1zgadET4wQcq1FP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709579077; c=relaxed/simple;
	bh=q07/xiG1a5n/c/8LAvQ0KqcgDLmF5An5u7sbwVefMzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fnSoZXAc9aXVdTNExRgPou8aXjQ+6qR+EWRncUXZxEzLgPB1Mm9+Grzus2ctuoM3DXNPj+x5EbAUUgZNE1ZAXaCTWJK9jHVx+8TxiJoTiprXH6XSqp0twwiq1SaEXfvLfRE+66RI2RWgenHplW6Bw8JoZz/MzEOeIoJ44/29JlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=blRhK1VM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blRhK1VM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709579076; x=1741115076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q07/xiG1a5n/c/8LAvQ0KqcgDLmF5An5u7sbwVefMzI=;
  b=blRhK1VMYcWXHeI0WAYz23EN6zVnaOspFCnfJbgNdkhiCrqqqHQej4AY
   NA3DU0j0voDVc1n0o2Y48Yr5TGl4cItmBBSP21+tLHc/idrjsMCxgNQzi
   cSw4h5x62K0QjKO14e2ZBmPXFqE8U+jFBb6Z66/XkxJK+fvDSQPFZChe0
   S7SlRpQbKRAbIq8rHt5mH6wRMlcag70xiD6ACJWWoyfwPjImFVw09RILi
   I48H1fRSOkVIX/oWS+pt1C6gBujJqzA5EGeznIDrLYKDSD0S0UDJ5wbh4
   /nS6FDYHSKV4Trc5BaZn8u7B49KAC5icoczd27Y0JuBvAcW3RS6CwEGwC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4257311"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="4257311"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 11:04:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="13788298"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa005.jf.intel.com with ESMTP; 04 Mar 2024 11:04:33 -0800
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
Subject: [PATCH 5/5] ASoC: Intel: avs: i2s_test: Remove redundant dapm routes
Date: Mon,  4 Mar 2024 20:05:36 +0100
Message-Id: <20240304190536.1783332-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304190536.1783332-1-cezary.rojewski@intel.com>
References: <20240304190536.1783332-1-cezary.rojewski@intel.com>
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

