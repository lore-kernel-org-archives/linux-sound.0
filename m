Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38592EA72B
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805360; cv=none; b=nRAxccbtm5C1fhuolWM/grQTVDJOva78YPhk4escecHJBfVapLYDMWUPm9YJoh2uanTupO+1n4EkLf99eonOa97bh/91IC+tiiH+jdw6HtHB7Kvywrh1rzLo4oWMmtx+weXlgjcnChSvlJ9FEnHZYNjcqVuwlwKApVXlcIcFWR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805360; c=relaxed/simple;
	bh=Wg4d1tWPrd2Xr6cchQmHL5sc1GFBcWtAH2Ljx/lOx0s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i1c9FBVkRk4G9Cv2ORF5wcMoutIwN7oZ3Zabo26tWiwFeW2W7GUI/0aXZ6lUDM2fQP5YCDUdP2wg66gJdZdwufqPaPDWd7eCoH10G2DA4qbANWc2Udo0PHxdVj1z6ptkd20+kTUCTbazmTE4hxqkB48cKX0cX/PgwVBysMk751c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cuN9jAsg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cuN9jAsg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805359; x=1788341359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wg4d1tWPrd2Xr6cchQmHL5sc1GFBcWtAH2Ljx/lOx0s=;
  b=cuN9jAsgZ7ZdOVDy65hTa7pm9nKFbS8XMZ180U2QOn3nxyp1BufBlCAO
   dczWlqtcPcwfDMZoW6EHwhdwuH44Zsxe7SSaRmQplzG5itG0m98pFpMtM
   CRscTk39lp588+mG4g/INt8Rb356A1zmNZJB3cdpC6cBT4edvLPPuSTUh
   tEqOKPZLu+Q+Hv8zbXmZYrySTf+gXu/JVzlhITZzX/+ouTLsWVzBP+yKp
   O81Bs8ZYEN9R8pBj9ZyuMsxSXfysrrkL3OwpRthj14QukOEKDRMHRqpYC
   NLwh641APSpTSFy+IPCUxxOlHZpEoLHyg2seHakWBXVJAQqd5jTaE1Krz
   w==;
X-CSE-ConnectionGUID: NWfufiuKRZCMONScL/VAMw==
X-CSE-MsgGUID: cOKl3BxTT1KEuMntRz9bYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58275261"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58275261"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:29:18 -0700
X-CSE-ConnectionGUID: pLJwpoVaQfqhZGYPExphHA==
X-CSE-MsgGUID: Pf9SrXcHTuS7HSXgRDfXqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170503250"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 02:29:17 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 11/17] ASoC: Intel: avs: rt274: Adjust platform name
Date: Tue,  2 Sep 2025 11:48:47 +0200
Message-Id: <20250902094853.1231842-12-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/rt274.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index ec5382925157..67d2c4585cdd 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -147,8 +147,8 @@ static int avs_rt274_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pc
 	return 0;
 }
 
-static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
-			       int tdm_slot, struct snd_soc_dai_link **dai_link)
+static int avs_create_dai_link(struct device *dev, int ssp_port, int tdm_slot,
+			       struct snd_soc_dai_link **dai_link)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -158,8 +158,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl || !platform)
 		return -ENOMEM;
 
-	platform->name = platform_name;
-
 	dl->name = devm_kasprintf(dev, GFP_KERNEL,
 				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
 	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
@@ -174,6 +172,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
+	platform->name = dev_name(dev);
 	dl->num_cpus = 1;
 	dl->num_codecs = 1;
 	dl->platforms = platform;
@@ -214,18 +213,16 @@ static int avs_rt274_probe(struct platform_device *pdev)
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
@@ -257,10 +254,6 @@ static int avs_rt274_probe(struct platform_device *pdev)
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

