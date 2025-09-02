Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C942EA17D
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805365; cv=none; b=J9YCC1Zwm7Lou2yLjRnNZjsJj0QF8xTnoIQy4p1/XBvAhCJHHWgTS1o4UWqllTJVlF+8P7LR/1aeED9wBCKTwToL/Lhpvob87z9SCWc52YdBdvzsVplsIYmij/ScnDg53xMV6LobZhgXD0Oo6ZBdhfjNN7lZA6WJmj8xcaTWcEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805365; c=relaxed/simple;
	bh=QVJ7eHkZnglIalCjpKjWNnh5x/tBWeuQitgS6JS6shI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=soMbVvBsLv20LoTqkAGt47mX5fo5Hd9CW54iA8bEIjTGb5y4vwgeBBQeyqQOmzlU9TwAYOEHd5EYVCbqYEV/vF+ZiQTpbkBCEei6Ky2zMEqoRuuoA0cX+uZu/6LNMZZE3j3T7yy1Yeqnb2+0OxYzI9zB8PJWLvYhB3bP/ttgHxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJn1eVNr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJn1eVNr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805363; x=1788341363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QVJ7eHkZnglIalCjpKjWNnh5x/tBWeuQitgS6JS6shI=;
  b=DJn1eVNrRsAZhuQ7qMZmiZbhGJEm0JS668cikg2mSq9vMvZColU5nZNR
   xXMmvKUeh5iWDBvv+EayE6h12suasV2HYe6ToDion6h2Ys5mXcZ8PvXLW
   nUbI0tjjkEX2QOoE7ZjERof1Ct6SFVopflzrvJLYonG42NHp73mYBpUfn
   0UrfJA+JmC9nAv7fX/rItQYWKhsV10WH6LuhT/CfRCTBgr0yQ3xT+XTWz
   Ssfspm4xCMNgpR7NUCi7nPNemFlRI1XMi9CnaRvJCz0zXhIPqjJ71MCzb
   1ZKD8cxlX/GJ3A8NxUdbu/RWPdbyiNIY+VAb/2WikUCX1N1knNhsoa0Fj
   g==;
X-CSE-ConnectionGUID: Rk8xImVQSQmgzKWDvyaCKA==
X-CSE-MsgGUID: Dk/tR8fNTyyL7T7nHNUDTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58275270"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58275270"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:29:23 -0700
X-CSE-ConnectionGUID: 6o1gNvS/Tle1b9skGFsaZA==
X-CSE-MsgGUID: cZUorP+wQWmLA3hZrghvIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170503261"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 02:29:21 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 13/17] ASoC: Intel: avs: rt298: Adjust platform name
Date: Tue,  2 Sep 2025 11:48:49 +0200
Message-Id: <20250902094853.1231842-14-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/rt298.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 7be34c8ad167..2d7a7748d577 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -132,8 +132,8 @@ static const struct snd_soc_ops avs_rt298_ops = {
 	.hw_params = avs_rt298_hw_params,
 };
 
-static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
-			       int tdm_slot, struct snd_soc_dai_link **dai_link)
+static int avs_create_dai_link(struct device *dev, int ssp_port, int tdm_slot,
+			       struct snd_soc_dai_link **dai_link)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -143,8 +143,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl || !platform)
 		return -ENOMEM;
 
-	platform->name = platform_name;
-
 	dl->name = devm_kasprintf(dev, GFP_KERNEL,
 				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
 	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
@@ -159,6 +157,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
+	platform->name = dev_name(dev);
 	dl->num_cpus = 1;
 	dl->num_codecs = 1;
 	dl->platforms = platform;
@@ -203,18 +202,16 @@ static int avs_rt298_probe(struct platform_device *pdev)
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
@@ -246,10 +243,6 @@ static int avs_rt298_probe(struct platform_device *pdev)
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

