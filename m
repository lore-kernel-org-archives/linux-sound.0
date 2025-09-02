Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830952EAB89
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805373; cv=none; b=g+wt/Rxko7a9ttchmvC/IXGWMDq9vE/QGIq6flOV5lwkGvbdWAt9UE2aTw5Mg8BioNkbaxbVoDktduATgpEq/OAyMS0LSWvEhkq1uxoRzEkxNIiEDDW5+XGOx1ILe26geAeaUvbBXGR0tAmccn4pq9WZYSN0SYoJ6sEtT6+sZWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805373; c=relaxed/simple;
	bh=OmgTIYJAUS8mNvun9VDPhhkjznGVjDhWGPGz5TTs5Rk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z08W9kcOyzGlr8TlMLWZOESIt5J7Fk5dqgK9NoDnxIclzbCQkzQNs8lqfWE4rkEZKIbEjFFO+EdhcxM0b4xd82+I17ufQFfnJGkRwPb2LNx0lVLtNsjVRMU6yA4vh5FQ3D/t3JAw6TApOJnv1jjDD9ZLe5N3r+qCpIclrHOdYKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eSIAB52X; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eSIAB52X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805372; x=1788341372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OmgTIYJAUS8mNvun9VDPhhkjznGVjDhWGPGz5TTs5Rk=;
  b=eSIAB52X8DX2gBjMEpvqyvhuR7WnDgVDySzhHx1C0hVRrHDyj7Hv0IFv
   KBEqRqDiVXcZo01+WV2yC2jq63t/CIQwSetseBD8LS+jorLLf88CH2bF1
   VvV7c9ePDNWaqbIbqRI2htBJn11EUe3XnoEZ2O92sg2mRnXpf1uxAVyF7
   osNHG8jG7PjCGb5FO7NMBPzX9z03o9OqOfYxXChLWspOd2WXnDuUwxgQ8
   mQiUjKTqiNjvglQ7Po1P9jydFAVKD5yyr6158WzaAGqXg548JG0qSQan1
   rx+ynFS12Rki/R+PfHCbPobn4isIfftLgUxUDENID3D/TzdP9p+cve9um
   Q==;
X-CSE-ConnectionGUID: Tdzvi8iQThq3kcUEpFuijA==
X-CSE-MsgGUID: hCkKPQiQSSOntlcJm4VxZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58275289"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58275289"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:29:32 -0700
X-CSE-ConnectionGUID: dF8sOXqPTrWUEowJjQG6pw==
X-CSE-MsgGUID: +ZvbRBn6SBWAL865ng3j2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170503297"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 02:29:30 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 17/17] ASoC: Intel: avs: ssm4567: Adjust platform name
Date: Tue,  2 Sep 2025 11:48:53 +0200
Message-Id: <20250902094853.1231842-18-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/ssm4567.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 3786eef8c494..ae0e6e27a8b8 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -81,8 +81,8 @@ avs_ssm4567_be_fixup(struct snd_soc_pcm_runtime *runrime, struct snd_pcm_hw_para
 	return 0;
 }
 
-static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
-			       int tdm_slot, struct snd_soc_dai_link **dai_link)
+static int avs_create_dai_link(struct device *dev, int ssp_port, int tdm_slot,
+			       struct snd_soc_dai_link **dai_link)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -92,8 +92,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl || !platform)
 		return -ENOMEM;
 
-	platform->name = platform_name;
-
 	dl->name = devm_kasprintf(dev, GFP_KERNEL,
 				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
 	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
@@ -111,6 +109,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	    !dl->codecs[1].name || !dl->codecs[1].dai_name)
 		return -ENOMEM;
 
+	platform->name = dev_name(dev);
 	dl->num_cpus = 1;
 	dl->num_codecs = 2;
 	dl->platforms = platform;
@@ -135,18 +134,16 @@ static int avs_ssm4567_probe(struct platform_device *pdev)
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
@@ -176,10 +173,6 @@ static int avs_ssm4567_probe(struct platform_device *pdev)
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

