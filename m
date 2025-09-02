Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D9C2EA752
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805367; cv=none; b=AioydvjC4r+U3vvmoAJW8WAnpnMJl76+NeBQJ3oNh86pZxHjm2JMBxJNMYqhBAyllURDfc4MgL3zFmcNMtA//1sP/3QN4R/qS4+DEor6OzmtrcEpXudW236zEB0HhQGvP1zRap/TWg/5KBu6I6UgC6/J1oDVutijdVSaf4x/a/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805367; c=relaxed/simple;
	bh=yBHsHHbPoY3nA/+kX4JPOdLrkT0NmUXmy6y/cpoi2JQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dN/FE0wEGgqbMuFWdZaVeo6MCDZhDyi7vJp4xIufMdV3RCHSNfEG7zk5yAg7JnqLXxvfRJEJ08EZAgyA2C0G9kd653GzNP1CPtbOMETjqSJtGwA2Fbo20pZluvCh14kUUlIk/c1EbqY1Klq3hsizHKrL3YeqLG/QiW1Q5lg9BJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4jk+Fbl; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4jk+Fbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805366; x=1788341366;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yBHsHHbPoY3nA/+kX4JPOdLrkT0NmUXmy6y/cpoi2JQ=;
  b=P4jk+FblBlDjjGK+3mTlqll0iLUEc+Y0rskUEfPRbBOQwviNfFNRuHTu
   kCrrmlEICOFAcDs52In65ydsd73VJKEDeYnBXDBtCMDT9cdc9HUcKUAIB
   yPWjwOU0W5q4eNbzMOvVRY/63C5qDubswPcWXaHpRda7DqYt+gK1eGeF1
   L1p/myCMmZkpGZA5ijP9CS1Gtn6/ORC55QKuSyoT50fX73tVB/o/c2xzg
   c3Ye9o3r/QfoHoUUeUISbEMaHgQZBynOTo8KxCxmGr4+L88e3vU73C+l7
   r7xuo+lIEKlM7vrw4eBpLb9AP34d7+yS2gMlhZeI4sPxUltZMyvkneT8O
   w==;
X-CSE-ConnectionGUID: K4k/z+G6SYmg0fX2gzLYNA==
X-CSE-MsgGUID: 0GcCyfUnRP2DX3X6iNt7Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58275275"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58275275"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:29:25 -0700
X-CSE-ConnectionGUID: 75Wr6kAYQzCa5l+g4Q/r5A==
X-CSE-MsgGUID: 1SB/83N9SyqBFReGegKm6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170503272"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 02:29:23 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 14/17] ASoC: Intel: avs: rt5514: Adjust platform name
Date: Tue,  2 Sep 2025 11:48:50 +0200
Message-Id: <20250902094853.1231842-15-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/rt5514.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
index 45f091f2ce22..00b99e36d23c 100644
--- a/sound/soc/intel/avs/boards/rt5514.c
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -84,8 +84,8 @@ static const struct snd_soc_ops avs_rt5514_ops = {
 	.hw_params = avs_rt5514_hw_params,
 };
 
-static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
-			       int tdm_slot, struct snd_soc_dai_link **dai_link)
+static int avs_create_dai_link(struct device *dev, int ssp_port, int tdm_slot,
+			       struct snd_soc_dai_link **dai_link)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -95,8 +95,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl || !platform)
 		return -ENOMEM;
 
-	platform->name = platform_name;
-
 	dl->name = devm_kasprintf(dev, GFP_KERNEL,
 				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
 	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
@@ -111,6 +109,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
+	platform->name = dev_name(dev);
 	dl->num_cpus = 1;
 	dl->num_codecs = 1;
 	dl->platforms = platform;
@@ -136,18 +135,16 @@ static int avs_rt5514_probe(struct platform_device *pdev)
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
@@ -173,10 +170,6 @@ static int avs_rt5514_probe(struct platform_device *pdev)
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

