Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FABE2EAB61
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805345; cv=none; b=QVEvBClpirooOVq0vjZhAQe9MXzdKrDiT083jinsEwDYkQXcSLFv+60o9bjTcoAd1HeOsOjaIP6cvka7Fpet6Q/gYvWlPl0oe0bwk3EluZdeHVhfECtEkrXAgG/9gWTOFAuAc1PYyI73cvjYji3YY7PjQvczo09RM/LmqwYgNRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805345; c=relaxed/simple;
	bh=a+VXx5mL4/ZcLgm3UJILO1VUdBnZfenf1URS1qk50oQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jms1Ff6smQxMd/+LkuK1uEtPSJKEKAQeBSKw8hwlxQsgxkz+jmXXwikPEGH6aybYmF3S33HNRRsRtGZWHxINdFgoKjAfZIL+DrKZLwCvEYkIoTlY9urLgA7JBqfRgOXOs8IhhSeKisWB9aan9oqgHqMSsa/kebnfLju8lPbGxi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VNsEOn8I; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VNsEOn8I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805343; x=1788341343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a+VXx5mL4/ZcLgm3UJILO1VUdBnZfenf1URS1qk50oQ=;
  b=VNsEOn8IeyS5UAQCzlsdWj3IDU/rMEDSFqU7+RApojDAe2Fp+ipFb8z+
   QUCY0gubP5/4VG7/R5I+w3EY2nvHXmOM/WWKxg/se4CcDITV0+vxT6tj2
   QCiCjMcEY7dGIKtuwuwSWoqJVrLpbwWLNLiGBzSRsAk2mi8xDl9lKqXxI
   lSyn1gE2tTR1k4VGzQmKyUgULD1eqK9jG/hd+MIJ4rKKZQq6ytoaulAG/
   R1TR1psWGbl8FS9YI72bJ1MUAi0PIUVG73f7S7KGmMU9XhzNEFgoft2uI
   COpHSBJiHwbKlDfLdvqvE0/nWYgTgfLQTfo6dSL3N4N/zKc8Ki/bCU4Ft
   A==;
X-CSE-ConnectionGUID: FEeiGWZIRCOXViQ4OGYwhQ==
X-CSE-MsgGUID: ExKfxvlGS7KSvV4ksaxc0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58275209"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58275209"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:29:02 -0700
X-CSE-ConnectionGUID: MatDABezTqSE1HLFpXBknA==
X-CSE-MsgGUID: GKEauV58Thql3xyYvCoW+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170503173"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 02:29:00 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 04/17] ASoC: Intel: avs: es8336: Adjust platform name
Date: Tue,  2 Sep 2025 11:48:40 +0200
Message-Id: <20250902094853.1231842-5-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/es8336.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index 1955f2d383c5..12e4e0aba5fa 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -195,8 +195,9 @@ static int avs_es8336_be_fixup(struct snd_soc_pcm_runtime *runtime,
 
 	return 0;
 }
-static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
-			       int tdm_slot, struct snd_soc_dai_link **dai_link)
+
+static int avs_create_dai_link(struct device *dev, int ssp_port, int tdm_slot,
+			       struct snd_soc_dai_link **dai_link)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -206,8 +207,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl || !platform)
 		return -ENOMEM;
 
-	platform->name = platform_name;
-
 	dl->name = devm_kasprintf(dev, GFP_KERNEL,
 				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
 	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
@@ -222,6 +221,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
+	platform->name = dev_name(dev);
 	dl->num_cpus = 1;
 	dl->num_codecs = 1;
 	dl->platforms = platform;
@@ -263,18 +263,16 @@ static int avs_es8336_probe(struct platform_device *pdev)
 	struct avs_card_drvdata *data;
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
@@ -306,10 +304,6 @@ static int avs_es8336_probe(struct platform_device *pdev)
 	card->fully_routed = true;
 	snd_soc_card_set_drvdata(card, data);
 
-	ret = snd_soc_fixup_dai_links_platform_name(card, pname);
-	if (ret)
-		return ret;
-
 	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
-- 
2.25.1

