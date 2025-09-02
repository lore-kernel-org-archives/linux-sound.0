Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F472EA728
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805355; cv=none; b=csupsv66GYCLQujgfj737pRkK3NLAvtj+6maZkKix6MmKBt0F6FJRKeuD5nnbMaqEmbHfwJAFCcVeQfhAzHsxbHUILCiKNxaQUGu4vsWfh537vtsBvYQPJPT5pTXQv+IEUi49g5Fq6MYfRZUl79yHh4pfiBPycCs5Rm9pOa17+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805355; c=relaxed/simple;
	bh=W7gVsqg/RLCX0odoDjdRbveyUYwRdCB69EFW4tljY1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nxO6x8Mk9HBuXBM379XnA52MYMnsERj8QK6HCrhs2ys6N2L2FsC/KPkkh7gNMI8yOf0I5UeQjR9Y71YYrdoCyUSghivO3m4IsNE3GwYsIE8iwZx8rVZGY6VXpNLsNwbTyIjY8LQw17XMMwRm4Ch5qOanfjZgYxtka+D0+OaY8gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkWpaFvT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkWpaFvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805354; x=1788341354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W7gVsqg/RLCX0odoDjdRbveyUYwRdCB69EFW4tljY1I=;
  b=CkWpaFvTBB0I4NOXxLkfZg3ogSIhXHuvhLUIYk0S3nU4Nz6pD3qQKsMD
   VHlZBc4AGO01aSw9Woh+AmPNYmVY4UrHbqR9eW4z4a0ZokXZfdeWwSeaN
   gLcvJIwI1dXac0qnuXdUv6itpayt4yiv8SOpc56rE3P9xsBEbs1wCyaqM
   ED2MJ2Ox7iSy3ksUynoduZ/nW34B5CL7FTGz0KtGDStrpyaUv6QXSkO6L
   fvy6ME+NJRMcsiYe0uNVBNncj9pUuYy+jQ3z6wKBqLFNE+V6hwGNKpfZa
   189KZ/pzyF/xr40YMb6NfC03J2BZTYS9tGKVUqgMx5+Xu/qDsfK9mFqaS
   A==;
X-CSE-ConnectionGUID: fbVTZbmBTXeAWhW6GlTEPA==
X-CSE-MsgGUID: 4GlTpGQlSsmRFFgJ0szpMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58275248"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58275248"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:29:14 -0700
X-CSE-ConnectionGUID: rS1Nl8LBQq6lCay1lcEe2Q==
X-CSE-MsgGUID: sHQUyVorQ8ynbph0YoLIWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170503235"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 02:29:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 09/17] ASoC: Intel: avs: nau8825: Adjust platform name
Date: Tue,  2 Sep 2025 11:48:45 +0200
Message-Id: <20250902094853.1231842-10-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/nau8825.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 3fb1a5d07ae1..9ca400a6412e 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -172,8 +172,8 @@ static const struct snd_soc_ops avs_nau8825_ops = {
 	.trigger = avs_nau8825_trigger,
 };
 
-static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
-			       int tdm_slot, struct snd_soc_dai_link **dai_link)
+static int avs_create_dai_link(struct device *dev, int ssp_port, int tdm_slot,
+			       struct snd_soc_dai_link **dai_link)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -183,8 +183,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl || !platform)
 		return -ENOMEM;
 
-	platform->name = platform_name;
-
 	dl->name = devm_kasprintf(dev, GFP_KERNEL,
 				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
 	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
@@ -199,6 +197,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
+	platform->name = dev_name(dev);
 	dl->num_cpus = 1;
 	dl->num_codecs = 1;
 	dl->platforms = platform;
@@ -250,18 +249,16 @@ static int avs_nau8825_probe(struct platform_device *pdev)
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
@@ -293,10 +290,6 @@ static int avs_nau8825_probe(struct platform_device *pdev)
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

