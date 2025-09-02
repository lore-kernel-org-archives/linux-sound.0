Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89A02EA483
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805358; cv=none; b=CtR1vFF/uTAnmuFHDAQFcNO9GDB9mdL08WLYFDZWMy0UekqvdoBtlJ2eGP3qGuzNM+i1hBXA3Cl4kTbe1jC498uYQo9SBTgVFnihaMD4E0DD5yzqlNYieKw9hozyk3oqAC5O62qUg3kJVTAWUEUzOuifPGgar0lsiRsEezMyvYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805358; c=relaxed/simple;
	bh=VsxR9mKo+ciYszH0RqIhlniM0hK7lS+S4cbXCUDjFVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rXExwn5bmpPvsIjtm/sG+BhVSrxqdDI82Q1ol+RXUjm3GIcE1h5+RNG9AIJYUliYO5y8pbk6SCj/ijCtvU39CHnsT0GF5sMi0Iz7Jwk5VnoiI7TW9lCl8muXoWFOp6ew4nHMrnmuy7ZNUbz44lSh8a8u4rxjcrrxqvQmxn7QR4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WXgGgYAr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXgGgYAr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805356; x=1788341356;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VsxR9mKo+ciYszH0RqIhlniM0hK7lS+S4cbXCUDjFVs=;
  b=WXgGgYArc8OCqwCpnMipsJjYV5cvrplQYkP38armdr1uSs9Tr535H9lY
   /Mq035TiRu3eS2C8Ve1fuXrwNWxl24LMr0VazgJdK2xmhgJOt38OexZ2d
   xbc7hrc/bzWI5i3Khv2eXSKLdi7emJtEvjg4b9VVcn4KSca8jjJshPFPa
   LJaIkOq90CquVXCpeDBdPqVNw+0PB3LVLZEV6cDG0qA+Qtc8eWg10UyGK
   lQpOBpOPExJHsSdzaV5HcTKzibWB3d5DbUComzO+3rSMIO4ld+tRXSxPe
   T93SBxLYsdBd1a9kLvD6SgUlPbtoQeVEmvIu6fUgFmb3UR9IPUplR+AE4
   w==;
X-CSE-ConnectionGUID: gcr7AyYBQeqvYsWOxSlqZw==
X-CSE-MsgGUID: DwWKfNuHSyaEbGHrF66fhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58275255"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58275255"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:29:16 -0700
X-CSE-ConnectionGUID: zo3G1zISTwqRKbAeiJya8w==
X-CSE-MsgGUID: MPpvlhN1Tu2vcghGFihhPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170503242"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 02:29:14 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 10/17] ASoC: Intel: avs: probe: Refactor dai_link creation
Date: Tue,  2 Sep 2025 11:48:46 +0200
Message-Id: <20250902094853.1231842-11-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/probe.c | 53 +++++++++++++++++-------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/sound/soc/intel/avs/boards/probe.c b/sound/soc/intel/avs/boards/probe.c
index 06c1f19f27aa..73884f8a535c 100644
--- a/sound/soc/intel/avs/boards/probe.c
+++ b/sound/soc/intel/avs/boards/probe.c
@@ -9,45 +9,54 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <sound/soc.h>
-#include <sound/soc-acpi.h>
-
-SND_SOC_DAILINK_DEF(dummy, DAILINK_COMP_ARRAY(COMP_DUMMY()));
-SND_SOC_DAILINK_DEF(probe_cp, DAILINK_COMP_ARRAY(COMP_CPU("Probe Extraction CPU DAI")));
-SND_SOC_DAILINK_DEF(platform, DAILINK_COMP_ARRAY(COMP_PLATFORM("probe-platform")));
-
-static struct snd_soc_dai_link probe_mb_dai_links[] = {
-	{
-		.name = "Compress Probe Capture",
-		.nonatomic = 1,
-		SND_SOC_DAILINK_REG(probe_cp, dummy, platform),
-	},
-};
+
+static int avs_create_dai_links(struct device *dev, struct snd_soc_dai_link **links, int *num_links)
+{
+	struct snd_soc_dai_link *dl;
+
+	dl = devm_kzalloc(dev, sizeof(*dl), GFP_KERNEL);
+	if (!dl)
+		return -ENOMEM;
+
+	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
+	dl->platforms = devm_kzalloc(dev, sizeof(*dl->platforms), GFP_KERNEL);
+	if (!dl->cpus || !dl->platforms)
+		return -ENOMEM;
+
+	dl->name = "Compress Probe Capture";
+	dl->cpus->dai_name = "Probe Extraction CPU DAI";
+	dl->num_cpus = 1;
+	dl->codecs = &snd_soc_dummy_dlc;
+	dl->num_codecs = 1;
+	dl->platforms->name = dev_name(dev);
+	dl->num_platforms = 1;
+	dl->nonatomic = 1;
+
+	*links = dl;
+	*num_links = 1;
+	return 0;
+}
 
 static int avs_probe_mb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct snd_soc_acpi_mach *mach;
 	struct snd_soc_card *card;
 	int ret;
 
-	mach = dev_get_platdata(dev);
-
 	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
 	if (!card)
 		return -ENOMEM;
 
+	ret = avs_create_dai_links(dev, &card->dai_link, &card->num_links);
+	if (ret)
+		return ret;
+
 	card->driver_name = "avs_probe_mb";
 	card->long_name = card->name = "AVS PROBE";
 	card->dev = dev;
 	card->owner = THIS_MODULE;
-	card->dai_link = probe_mb_dai_links;
-	card->num_links = ARRAY_SIZE(probe_mb_dai_links);
 	card->fully_routed = true;
 
-	ret = snd_soc_fixup_dai_links_platform_name(card, mach->mach_params.platform);
-	if (ret)
-		return ret;
-
 	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
-- 
2.25.1

