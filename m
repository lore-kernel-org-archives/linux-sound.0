Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B1020297E
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805343; cv=none; b=UIVALWFGzZNg+ZNHJoFiZuaVy2c11nBhRLuypO82sW0MQZJiSjqn9rXYdW9fyZCByV+NIre7pA1JbTBJKchzll91fTuvr9OUq93L0DQ4L73za5pi2avPXX6RpYEcjCWy/yGjNLXFq7ogli6xvsGIkIf0eDSH9s7TGDI34C8vduY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805343; c=relaxed/simple;
	bh=4MCbEFIr/XX7PeCNTfXTOBlYwhhNgWpSv8ArpREH/EU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tjb3SnWyO60qUwZtNJhbMwzpMJBsNUADlYch/JljgABK+PETBtKQRgNUrmJfmp+V52VkSaSFQgSMsiCSQZVyVOu2BOw6kjtne0HgDRVOqYzz6e6Jfxlz35luujnahVnGoNa8nUyzOAM69F46VR1Rneo+clwtQuM869FMTaGLf0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzXmOzuK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzXmOzuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805342; x=1788341342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4MCbEFIr/XX7PeCNTfXTOBlYwhhNgWpSv8ArpREH/EU=;
  b=nzXmOzuKr13m5gcJWVaj2QRFjCQ1yd9AZfsJuv2uzds/OTdCz2krup87
   k+yv8odazsz/yKJJd2f47MX2lWyZgl6SVhdh0DLjXf+T+alLYSrU+JvoY
   QguRpa2kVC7BMqacTutvN6VjpHpP2dEQGy0yFaYc/B65bjSKK8QRHwWoU
   dFzlN8RFhDHOPPGZycBXLKnS/BnMBST70VSccesLAJXWi/OjvtrkqMfa9
   KZSx85htsfwBzcKjhUsLp1BJWI/La/CCi0TTffsWDPWFIqyEd5cmEvd2n
   qOUQcZIowA22tycgXwmXxey19zuYjtENEyiHLugE9KCyyXNbDxM/iZJBj
   A==;
X-CSE-ConnectionGUID: IP0EsWsQRa6nzCvUx8vicw==
X-CSE-MsgGUID: zIxE9YDsQYGvOZucvMs2Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58275205"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58275205"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:29:00 -0700
X-CSE-ConnectionGUID: qQuMpnOXRnmMzzR/bdL5BA==
X-CSE-MsgGUID: PRz8cr6cTAKiURX42a/Dmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170503156"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 02:28:58 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 03/17] ASoC: Intel: avs: dmic: Refactor dai_link creation
Date: Tue,  2 Sep 2025 11:48:39 +0200
Message-Id: <20250902094853.1231842-4-cezary.rojewski@intel.com>
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

To allow for multiple instances of the card, move away from static
dai_link declaration.

While at it, simplify the code as the name of the platform component
matches the name of the card's platform_device:
- drop mach->mach_params.platform usage
- drop snd_soc_fixup_dai_links_platform_name() usage

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/dmic.c | 80 +++++++++++++++++++------------
 1 file changed, 49 insertions(+), 31 deletions(-)

diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index a1448a98874d..bf6f580a5164 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -14,30 +14,6 @@
 
 SND_SOC_DAILINK_DEF(dmic_pin, DAILINK_COMP_ARRAY(COMP_CPU("DMIC Pin")));
 SND_SOC_DAILINK_DEF(dmic_wov_pin, DAILINK_COMP_ARRAY(COMP_CPU("DMIC WoV Pin")));
-SND_SOC_DAILINK_DEF(dmic_codec, DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
-/* Name overridden on probe */
-SND_SOC_DAILINK_DEF(platform, DAILINK_COMP_ARRAY(COMP_PLATFORM("")));
-
-static struct snd_soc_dai_link card_dai_links[] = {
-	/* Back ends */
-	{
-		.name = "DMIC",
-		.id = 0,
-		.capture_only = 1,
-		.nonatomic = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
-	},
-	{
-		.name = "DMIC WoV",
-		.id = 1,
-		.capture_only = 1,
-		.nonatomic = 1,
-		.no_pcm = 1,
-		.ignore_suspend = 1,
-		SND_SOC_DAILINK_REG(dmic_wov_pin, dmic_codec, platform),
-	},
-};
 
 static const struct snd_soc_dapm_widget card_widgets[] = {
 	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
@@ -47,12 +23,56 @@ static const struct snd_soc_dapm_route card_routes[] = {
 	{"DMic", NULL, "SoC DMIC"},
 };
 
+static int avs_create_dai_links(struct device *dev, const char *codec_name,
+				struct snd_soc_dai_link **links, int *num_links)
+{
+	struct snd_soc_dai_link_component *platform;
+	struct snd_soc_dai_link *dl;
+	const int num_dl = 2;
+
+	dl = devm_kcalloc(dev, num_dl, sizeof(*dl), GFP_KERNEL);
+	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
+	if (!dl || !platform)
+		return -ENOMEM;
+
+	dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
+	if (!dl->codecs)
+		return -ENOMEM;
+
+	dl->codecs->name = devm_kstrdup(dev, codec_name, GFP_KERNEL);
+	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, "dmic-hifi");
+	if (!dl->codecs->name || !dl->codecs->dai_name)
+		return -ENOMEM;
+
+	platform->name = dev_name(dev);
+	dl[0].num_cpus = 1;
+	dl[0].num_codecs = 1;
+	dl[0].platforms = platform;
+	dl[0].num_platforms = 1;
+	dl[0].nonatomic = 1;
+	dl[0].no_pcm = 1;
+	dl[0].capture_only = 1;
+	memcpy(&dl[1], &dl[0], sizeof(*dl));
+
+	dl[0].name = "DMIC";
+	dl[0].cpus = dmic_pin;
+	dl[0].id = 0;
+	dl[1].name = "DMIC WoV";
+	dl[1].cpus = dmic_wov_pin;
+	dl[1].id = 1;
+	dl[1].ignore_suspend = 1;
+
+	*links = dl;
+	*num_links = num_dl;
+	return 0;
+}
+
 static int avs_dmic_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct snd_soc_acpi_mach *mach;
 	struct avs_mach_pdata *pdata;
 	struct snd_soc_card *card;
-	struct device *dev = &pdev->dev;
 	int ret;
 
 	mach = dev_get_platdata(dev);
@@ -62,6 +82,10 @@ static int avs_dmic_probe(struct platform_device *pdev)
 	if (!card)
 		return -ENOMEM;
 
+	ret = avs_create_dai_links(dev, pdata->codec_name, &card->dai_link, &card->num_links);
+	if (ret)
+		return ret;
+
 	if (pdata->obsolete_card_names) {
 		card->name = "avs_dmic";
 	} else {
@@ -70,18 +94,12 @@ static int avs_dmic_probe(struct platform_device *pdev)
 	}
 	card->dev = dev;
 	card->owner = THIS_MODULE;
-	card->dai_link = card_dai_links;
-	card->num_links = ARRAY_SIZE(card_dai_links);
 	card->dapm_widgets = card_widgets;
 	card->num_dapm_widgets = ARRAY_SIZE(card_widgets);
 	card->dapm_routes = card_routes;
 	card->num_dapm_routes = ARRAY_SIZE(card_routes);
 	card->fully_routed = true;
 
-	ret = snd_soc_fixup_dai_links_platform_name(card, mach->mach_params.platform);
-	if (ret)
-		return ret;
-
 	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
-- 
2.25.1

