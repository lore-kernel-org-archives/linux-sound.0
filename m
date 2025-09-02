Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2B62EA482
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805338; cv=none; b=KC+wyiKSetfTXif8sLA295ukpUyCItfX17RBCZhn97xaZ8EgcyzFcFT8a+BjIr2FaW1DS99midn3VUKXR5a65vOGC/Hy38btN4Ppzhr50BUNNPkmc8nbF9EPvuIxB5dAJhF2A0pRL31zdeH0mmqgNdGnOxs4Oj3J2lQ0EoQBcA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805338; c=relaxed/simple;
	bh=+rRlRB3tgdeWoS/nKLHKT/xXzkB/GwZUD8CedkOXztY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ELNekMWqLLNs91tT4Jijp3MZNDqTTsgaICuDeRoI71wBCxYOLochgWJtkUMT5Bv88hy57fYO3p2uvM6tT0wy/yc+mGrWgRQYgMB5z9VsdoivbEVpn1SY4YGDEgAT9Y9ObN68efNhwXRJqqzTz9A1yagGEvc6TEwoiFNtORT91/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+f4CoEC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+f4CoEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805336; x=1788341336;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+rRlRB3tgdeWoS/nKLHKT/xXzkB/GwZUD8CedkOXztY=;
  b=H+f4CoECUYMLrhumuTVqTj08C9aRUkFJwRPGPGcGANYAI1U8DHLdZeuW
   IG5ylOJ5SP+gON1vCqDVhDmZPar4bR2NbgtILaSdurHrayjjUXtWuAOIE
   uQ5OoyXtJ/aPJr9iZ8iGWTNokqK8SGz3CviLVmbSIyooq5XmFYAJ1MgYi
   hvEK5zwrWOETOEmkhYRMDuyCQYJl8XJI4qsCUBm+n0k0E8WQAWPjikIO5
   7+ZvrptFL94DxMsWRmJ5BP2fAAhfIV4XTKKZ4m3K0CeY9ET8B1HK70xMa
   xqyN5lRDfJukk0ZioI7bM3xkX12ytpXB6ZkyofARiSLBqTiJaqCns2lg6
   Q==;
X-CSE-ConnectionGUID: aJILKak1SV6Vck1gioEKTQ==
X-CSE-MsgGUID: we2mjI5VT6WVtGZeI69Nmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58275188"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58275188"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:28:55 -0700
X-CSE-ConnectionGUID: pUEW3W/fSOOLM/kZMLex4g==
X-CSE-MsgGUID: kNS813E/TaOOcbBN5WjwoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170503129"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 02:28:54 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 01/17] ASoC: Intel: avs: hda: Adjust platform name
Date: Tue,  2 Sep 2025 11:48:37 +0200
Message-Id: <20250902094853.1231842-2-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/hdaudio.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index 19b2255a8ac3..aec769e2396c 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -16,7 +16,7 @@
 #include "../utils.h"
 
 static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int pcm_count,
-				const char *platform_name, struct snd_soc_dai_link **links)
+				struct snd_soc_dai_link **links)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -29,7 +29,7 @@ static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int
 	if (!dl || !platform)
 		return -ENOMEM;
 
-	platform->name = platform_name;
+	platform->name = dev_name(dev);
 	pcm = list_first_entry(&codec->pcm_list_head, struct hda_pcm, list);
 
 	for (i = 0; i < pcm_count; i++, pcm = list_next_entry(pcm, list)) {
@@ -142,7 +142,7 @@ static int avs_probing_link_init(struct snd_soc_pcm_runtime *rtm)
 	list_for_each_entry(pcm, &codec->pcm_list_head, list)
 		pcm_count++;
 
-	ret = avs_create_dai_links(card->dev, codec, pcm_count, mach->mach_params.platform, &links);
+	ret = avs_create_dai_links(card->dev, codec, pcm_count, &links);
 	if (ret < 0) {
 		dev_err(card->dev, "create links failed: %d\n", ret);
 		return ret;
@@ -197,7 +197,7 @@ static int avs_hdaudio_probe(struct platform_device *pdev)
 	if (!binder->codecs->name)
 		return -ENOMEM;
 
-	binder->platforms->name = mach->mach_params.platform;
+	binder->platforms->name = dev_name(dev);
 	binder->num_platforms = 1;
 	binder->codecs->dai_name = "codec-probing-DAI";
 	binder->num_codecs = 1;
@@ -207,7 +207,10 @@ static int avs_hdaudio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (pdata->obsolete_card_names) {
-		card->name = binder->codecs->name;
+		card->name = devm_kasprintf(dev, GFP_KERNEL, "hdaudioB%dD%d", codec->bus->core.idx,
+					    codec->core.addr);
+		if (!card->name)
+			return -ENOMEM;
 	} else {
 		card->driver_name = "avs_hdaudio";
 		if (hda_codec_is_display(codec))
-- 
2.25.1

