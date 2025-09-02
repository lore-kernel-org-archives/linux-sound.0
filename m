Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4B02EA47C
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805347; cv=none; b=BUWiMG3z/TUGY6kOfDmviSPcQUEv311f/pLCyrtMJgfsKUko+DeM0aurmhJ7TwCSqewX+oHFLJSDuZZtTK8nZoaBtanDijgL1RnHV0XdLH6C0WWfBatbk+81OO3EDMOON7CppHyAX9guHXKoJIpRMe4L2F5aYU4IM+ykzas57N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805347; c=relaxed/simple;
	bh=/EWTvMLvHxJIG6jItd6mMNiuaHnwjTn10d8Iz9fplaM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LR5+p0UkXf+n98g+FPZyBiKt1xPWiKW4aG3hqLXi+owL38uDJ6E5ity/8MRrWggwYiMR5UL8u6H0x7RDjnLfiM1nZ0K4aa5OVXtHfLExSlmstUFBKn/msvv2BbV1O1THqGpht+5FMqKmW54/lUneWFBcP4+uZJ0Jo8Z+zop485o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Px+3OY3/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Px+3OY3/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805345; x=1788341345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/EWTvMLvHxJIG6jItd6mMNiuaHnwjTn10d8Iz9fplaM=;
  b=Px+3OY3/1gFNPq5EPRfKYnXoqTvIhAqOfH/E4q1czIdy7SQLj7dixvRu
   UOcjVFeylK4x9z2YfpZJNunCQTvXYcB8QyJYC+uamBPc95p5cS4Y4OjAQ
   l0fC0YDMQE5jLg708aSIY28xYwO4Js5XTX/CXzq2D0xjFyeU5a2Q4QRkO
   MDEOib+SQou5CYntgIC8riNWELUYeBQKRYtZSrgVFuRNJziWzC61pegLj
   toRskGI/K8qVdqQQFEr5YOkuArVt2fne5R3FId7w6l5wju/AmH91t06yx
   +T46aC1AJqbZ5H14N5GVajC79ePl13s1JBXhKDcs7oQNsnZNxPzfl56Ba
   A==;
X-CSE-ConnectionGUID: F9Est4KQSWqHKj7OP7xUtg==
X-CSE-MsgGUID: 1RX5bFEwQMKji20UeQ2qeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58275217"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58275217"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:29:05 -0700
X-CSE-ConnectionGUID: 39qFQsniTUKeRDKTIZWIvA==
X-CSE-MsgGUID: KNvWC4gWQRWcC0SGjd8EvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170503188"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 02:29:03 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 05/17] ASoC: Intel: avs: i2stest: Adjust platform name
Date: Tue,  2 Sep 2025 11:48:41 +0200
Message-Id: <20250902094853.1231842-6-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/i2s_test.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index f7b6d7715738..9a6b89ffdf14 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -14,8 +14,8 @@
 #include <sound/soc-dapm.h>
 #include "../utils.h"
 
-static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
-			       int tdm_slot, struct snd_soc_dai_link **dai_link)
+static int avs_create_dai_link(struct device *dev, int ssp_port, int tdm_slot,
+			       struct snd_soc_dai_link **dai_link)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -25,8 +25,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl || !platform)
 		return -ENOMEM;
 
-	platform->name = platform_name;
-
 	dl->name = devm_kasprintf(dev, GFP_KERNEL,
 				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
 	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
@@ -39,6 +37,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
+	platform->name = dev_name(dev);
 	dl->num_cpus = 1;
 	dl->num_codecs = 1;
 	dl->platforms = platform;
@@ -59,11 +58,9 @@ static int avs_i2s_test_probe(struct platform_device *pdev)
 	struct avs_mach_pdata *pdata;
 	struct snd_soc_card *card;
 	struct device *dev = &pdev->dev;
-	const char *pname;
 	int ssp_port, tdm_slot, ret;
 
 	mach = dev_get_platdata(dev);
-	pname = mach->mach_params.platform;
 	pdata = mach->pdata;
 
 	if (!avs_mach_singular_ssp(mach)) {
@@ -94,7 +91,7 @@ static int avs_i2s_test_probe(struct platform_device *pdev)
 	if (!card->name)
 		return -ENOMEM;
 
-	ret = avs_create_dai_link(dev, pname, ssp_port, tdm_slot, &dai_link);
+	ret = avs_create_dai_link(dev, ssp_port, tdm_slot, &dai_link);
 	if (ret) {
 		dev_err(dev, "Failed to create dai link: %d\n", ret);
 		return ret;
@@ -106,10 +103,6 @@ static int avs_i2s_test_probe(struct platform_device *pdev)
 	card->num_links = 1;
 	card->fully_routed = true;
 
-	ret = snd_soc_fixup_dai_links_platform_name(card, pname);
-	if (ret)
-		return ret;
-
 	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
-- 
2.25.1

