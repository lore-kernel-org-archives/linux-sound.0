Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328D92EA47F
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805362; cv=none; b=d5aONoS3cbvXY4PB/AeMJ5nmE5bQpReEEB24uL47SmLt7y79M/QsPwH885a95h0fmnawGinmPNTxiOQRI1Vbt2vJK+xkdCtOAzlhFKsWLwWwaPQMdo6qarkOzCkSOtR8xBPXnVUUGpd5JdHBuKhsCp/7MZBOYej7qtXPXrAqc+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805362; c=relaxed/simple;
	bh=UMk5OnpB/zdAvS5fJ4icQrUvew/V+gkeinDnDXkmp5M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kwlgc4UqQtanHGNwBKqSuHDHbaizDHJDDmwbNTztWUc+Op+vQZx3xqo5/quMz4jSi472CytY/NlNMDqeQAX86mN8HaIlVcKrEEsGLNtQNUxMd54WKGad8Wv4EscD5hFQxe28iM8+p4EzdZVVKvrAPolBH+rxue03MUvEXG0U/P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TgcZf0h4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TgcZf0h4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805361; x=1788341361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UMk5OnpB/zdAvS5fJ4icQrUvew/V+gkeinDnDXkmp5M=;
  b=TgcZf0h4hsYO/lkIDGjUWy/M+FsB1AwPaj8i3+uBaY4z9qU52Jea7Jha
   Lp/H4IQlFsi+OklJzKaJz19H31hP3646SBXP4NxX+tzWUI8uEuVYik46a
   ixJA/MstGZDXrjvIrmbCLOH4HrUGkmfjWMyMKx70C6ujPpI12HoJQd7S0
   R1wA33eftNFNgtGCIjN/qH2wZ52185N5cD83TaaqoFwDbuKLYZLAQo1Cm
   VghrEzr25SeZvSFOEKNuxajeygtmLKp++PV9b45Fl0oD2Fu4eJwJEPMVk
   3nb/3Fyrm2h+/CVDhVGUd3sosSXiDsMnjuJpKduUEqazt21bpsJFfs5lf
   Q==;
X-CSE-ConnectionGUID: H8LlpibNRGSlv5g+yQaQuA==
X-CSE-MsgGUID: gvDBKcJcSf+23GhTr2+U5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58275265"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58275265"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:29:21 -0700
X-CSE-ConnectionGUID: RjDVXazlRlSSHeaA2/GO8w==
X-CSE-MsgGUID: /j2DNdu6S5a/2NbJYGT/ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170503256"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 02:29:19 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 12/17] ASoC: Intel: avs: rt286: Adjust platform name
Date: Tue,  2 Sep 2025 11:48:48 +0200
Message-Id: <20250902094853.1231842-13-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/rt286.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index 2566e971ce1c..4c9ac545555a 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -115,8 +115,8 @@ static const struct snd_soc_ops avs_rt286_ops = {
 	.hw_params = avs_rt286_hw_params,
 };
 
-static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
-			       int tdm_slot, struct snd_soc_dai_link **dai_link)
+static int avs_create_dai_link(struct device *dev, int ssp_port, int tdm_slot,
+			       struct snd_soc_dai_link **dai_link)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -126,8 +126,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl || !platform)
 		return -ENOMEM;
 
-	platform->name = platform_name;
-
 	dl->name = devm_kasprintf(dev, GFP_KERNEL,
 				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
 	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
@@ -142,6 +140,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
+	platform->name = dev_name(dev);
 	dl->num_cpus = 1;
 	dl->num_codecs = 1;
 	dl->platforms = platform;
@@ -183,18 +182,16 @@ static int avs_rt286_probe(struct platform_device *pdev)
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
@@ -227,10 +224,6 @@ static int avs_rt286_probe(struct platform_device *pdev)
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

