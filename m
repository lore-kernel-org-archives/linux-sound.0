Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3452EB5BA
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805371; cv=none; b=W90Br8XAyaPe6DAIrBePHdQJaXe2jNbr0JsmAOxR4wZiTB2RD2SO+fEIgBBqZKH/30M2YBrUJRWC/3B4Zh7iA/+sl5AHG45gVAP4n2nhJJtNLK0JjhL6JD1KSy13ghP+JQWxTRRF/clj46N2xWDTqYPH1l2rtSUr2NR0891JdU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805371; c=relaxed/simple;
	bh=EfrlVASDt+gqP3NjZ1mYzRloENFsCMw9xQ9kLFLtGAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NIGdu0v3CfLaR1nU0WhnuqVy46i6XwlWHsiBabokmYIsX9F1Q5IdinD7lFLuk1WhIQQizkgZjm7uEbYMIbVEkIRhsz3gC/qnH+U5xxJJq4l6SDkoWh7+jTV8FOv46iKhsjgdH3LDkagowvsVuKtYvFIT7X6eE3tlzI/olBiMCEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e25wNHAT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e25wNHAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805370; x=1788341370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EfrlVASDt+gqP3NjZ1mYzRloENFsCMw9xQ9kLFLtGAg=;
  b=e25wNHAT+E5NmoAi2OTAtNIGADHPrvOAZMfmZLKdpAxlGOO43qx0w49I
   12ZGcL6Uh8PWmNH0dxl7pcnVtBjvS4jspzH5B3nFiqX2AT/P0xvNencYU
   AEl1JfQjIVTjdnYjMPGidRcacr3x/CJw78lIWX73ls/+Y5m/oHVoP4AQB
   zcj+DPbDyGXz2UdVVwphRoPSSWU3DxH8VQRDHwoerT9sKSkNvTFwkUU5W
   YUjXXejbqR4QCUBtkDU+r2nBbs6dPYPfPvrvywqFgyXXdWib8ckIhi+di
   sxpDS91j5HCE59oaI9ez6EsHm4dXxMwUAay6f4/CAG4GoH0+5nofs+2hf
   Q==;
X-CSE-ConnectionGUID: FG88yp6eTg6nqQjIyLSjzQ==
X-CSE-MsgGUID: XJKMpFHPTtWx++/yGKxcWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58275283"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58275283"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:29:30 -0700
X-CSE-ConnectionGUID: Zs/vmGngSQqduLWuP7sDcA==
X-CSE-MsgGUID: QM92BasTQq2KG9ellDjGNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170503288"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 02:29:28 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	nathan@kernel.org,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 16/17] ASoC: Intel: avs: rt5682: Adjust platform name
Date: Tue,  2 Sep 2025 11:48:52 +0200
Message-Id: <20250902094853.1231842-17-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/rt5682.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 9677b9ebeff1..81863728da1d 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -204,8 +204,8 @@ avs_rt5682_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pcm_hw_param
 	return 0;
 }
 
-static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
-			       int tdm_slot, struct snd_soc_dai_link **dai_link)
+static int avs_create_dai_link(struct device *dev, int ssp_port, int tdm_slot,
+			       struct snd_soc_dai_link **dai_link)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -215,8 +215,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl || !platform)
 		return -ENOMEM;
 
-	platform->name = platform_name;
-
 	dl->name = devm_kasprintf(dev, GFP_KERNEL,
 				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
 	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
@@ -231,6 +229,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
+	platform->name = dev_name(dev);
 	dl->num_cpus = 1;
 	dl->num_codecs = 1;
 	dl->platforms = platform;
@@ -272,7 +271,6 @@ static int avs_rt5682_probe(struct platform_device *pdev)
 	struct snd_soc_card *card;
 	struct snd_soc_jack *jack;
 	struct device *dev = &pdev->dev;
-	const char *pname;
 	int ssp_port, tdm_slot, ret;
 
 	if (pdev->id_entry && pdev->id_entry->driver_data)
@@ -282,14 +280,13 @@ static int avs_rt5682_probe(struct platform_device *pdev)
 	dev_dbg(dev, "avs_rt5682_quirk = %lx\n", avs_rt5682_quirk);
 
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
@@ -321,10 +318,6 @@ static int avs_rt5682_probe(struct platform_device *pdev)
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

