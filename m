Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FD72EAB78
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805353; cv=none; b=FytkXVwY0ujz3JWpwVXwv1NO/Ml1gazv3YzT0GCg+dCr5Bc24Cvpj+Tk3/ogTNrJtrlE+IihwiaFaRDQkeg0TRl2XjqJfKmTqXpKH+WdaN/KlP2g3EqdTXV3zrzmP4GpfkJUSVERRVEyNtZoqrFqvwjhsZZrQMJvmFp0k28Cn20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805353; c=relaxed/simple;
	bh=ZmViaoMJiOlNZSsrym3wbS1UwLRwGQI6KDGjSEbt6dI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FzIJ0f7esTnIVXN2N3YZFR4Y0Z2A627/DT/SGShL0qOIIvOhv1qgSDWJq77FL4pce2T2gKAEOSw19gJ7NxwuUiJxIjJhQqA3Ad7P7p6E6IcqYDDi7ze8euLVgCKmM/C4xBqPK4fsW4hGhPc5IhryL3c2q0W+NmddpRGofm7iJDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDn7StZy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDn7StZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805352; x=1788341352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZmViaoMJiOlNZSsrym3wbS1UwLRwGQI6KDGjSEbt6dI=;
  b=oDn7StZyQh3BJVc6FfhNqkkz7jWcDmEIwzmcOI2q+v8UEkXa9+T4TILU
   xwl7BG9ZOHl3MGRDtuOOIPjQyh0sKPfYJorIsoiOnMWG8iHGNVZEekWyT
   bq2DW1t/Dv41LwYWrV9AOr2NLMXpaAm3VJQ2GhZQ3dckK7A6TmUBM076q
   83Cqog6iuojK+G4DP/SB+0sjzbPzcj3eXRUDqFtyRlVH1cX9YWxv46Ztx
   gcHv1RHUFp54yb9lhZcDN8YaP5PmpKz+9W4SIROWvIfZmm7/kMYuehMl9
   3IyuKWB26t4sIgnuQ7B+z3kBdWwVSxCk8dJCxjZ35xwQLViaEzgURDYgD
   Q==;
X-CSE-ConnectionGUID: 021X6Bq9Tv+Rmul/avdXCA==
X-CSE-MsgGUID: jtxHoL29SdG5ngf7LfE3Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58275242"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58275242"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:29:12 -0700
X-CSE-ConnectionGUID: lodHjpX1QdCKZjOKEzBvYw==
X-CSE-MsgGUID: luEb2gKPSvek/d9ClOw+tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170503225"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 02:29:10 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 08/17] ASoC: Intel: avs: max98927: Adjust platform name
Date: Tue,  2 Sep 2025 11:48:44 +0200
Message-Id: <20250902094853.1231842-9-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/max98927.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index a68e227044c5..db073125fa4d 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -92,8 +92,8 @@ static const struct snd_soc_ops avs_max98927_ops = {
 	.hw_params = avs_max98927_hw_params,
 };
 
-static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
-			       int tdm_slot, struct snd_soc_dai_link **dai_link)
+static int avs_create_dai_link(struct device *dev, int ssp_port, int tdm_slot,
+			       struct snd_soc_dai_link **dai_link)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -103,8 +103,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl || !platform)
 		return -ENOMEM;
 
-	platform->name = platform_name;
-
 	dl->name = devm_kasprintf(dev, GFP_KERNEL,
 				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
 	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
@@ -122,6 +120,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	    !dl->codecs[1].name || !dl->codecs[1].dai_name)
 		return -ENOMEM;
 
+	platform->name = dev_name(dev);
 	dl->num_cpus = 1;
 	dl->num_codecs = 2;
 	dl->platforms = platform;
@@ -146,18 +145,16 @@ static int avs_max98927_probe(struct platform_device *pdev)
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
@@ -187,10 +184,6 @@ static int avs_max98927_probe(struct platform_device *pdev)
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

