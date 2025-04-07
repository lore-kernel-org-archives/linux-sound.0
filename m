Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D942512D7
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029652; cv=none; b=A+/ZmE5TkypiWPacHHzlcTy2OEuOgm9YoWV5NUrnPegwIdm5jpmrOBP7DvyxSM6je6rTVQZoQlxFIMP+S8euHumSaM4i0gU798gBSrGvxUo3/pQbxCtTZI6YYIOgVinmNd5QL9S/2kH4haL1juy1LBLlSiEysHRJ8tmxUIu3bhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029652; c=relaxed/simple;
	bh=7Fpo09ATJWCaxP2P1DjU2D5ND3iJo6SgOMXYx2cGS0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PWooPysoQ/bZHRHAoE2Gmf7b+Z867L50pTq1YhQ3R06saWHSDHb4fyiBXTQXiuYlSKbw3bsPgyqUTlUkr0JuJcEWayV3h3vlBga1k6SnAhoZUYV/t4N/8rfb/WSMSDqLefIii0SkPC1GAlrRAZ9HQFlGYnyHT5WXKuBpRLLsBPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kF4rzr5a; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kF4rzr5a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029652; x=1775565652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7Fpo09ATJWCaxP2P1DjU2D5ND3iJo6SgOMXYx2cGS0Q=;
  b=kF4rzr5asoKFr6HojJUV6EHE4u9dAe93a1Z9ejpOm0nl7hFm/bkIKlqX
   dJRAscOZ1pJKZDv4jMHJ9FUjiZnjmNiuE6Dl1b0eEM3p1+hfjUiOr0hHC
   f6oBfrYWlWmECXU+PQ4cLlrbFU8rCUJABlw5RvVqA6aDBq4KOSVB20urp
   5+Qnj7g5CEotOMoKrcSHNffwGLaNO0B2txSPBkUuhAHK2l2IqLBc7aMgR
   mp7n7kjQ2gHYf/D4W2mFf2OjIt9ex3aV7jPb/4u0ULXfKkKuMGEY1c/Pb
   jlBPIUCd1vJW/ooaGFIAvWM7eaPYisZTBqz2F+6OH72qWIsJV+c8+MvPa
   w==;
X-CSE-ConnectionGUID: 3IBDkn0LSzCa1J4v6eq/jw==
X-CSE-MsgGUID: l2UF5A97TJCLi9MixX2BeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56778987"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56778987"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:40:52 -0700
X-CSE-ConnectionGUID: vPe+WEnkR2+Oo22kYF2nUw==
X-CSE-MsgGUID: y+VJTYJSTgKmVQh72uQPdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134079"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:40:49 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 05/20] ASoC: Intel: avs: boards: Change es8336 card name
Date: Mon,  7 Apr 2025 14:41:39 +0200
Message-Id: <20250407124154.1713039-6-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
References: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename FE from "avs_es8336" to "AVS I2S ES8336".

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/es8336.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index 6f3c4f6c93023..f528f61e18bc2 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -259,6 +259,7 @@ static int avs_es8336_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_acpi_mach *mach;
+	struct avs_mach_pdata *pdata;
 	struct avs_card_drvdata *data;
 	struct snd_soc_card *card;
 	struct device *dev = &pdev->dev;
@@ -267,6 +268,7 @@ static int avs_es8336_probe(struct platform_device *pdev)
 
 	mach = dev_get_platdata(dev);
 	pname = mach->mach_params.platform;
+	pdata = mach->pdata;
 
 	ret = avs_mach_get_ssp_tdm(dev, mach, &ssp_port, &tdm_slot);
 	if (ret)
@@ -283,7 +285,12 @@ static int avs_es8336_probe(struct platform_device *pdev)
 	if (!data || !card)
 		return -ENOMEM;
 
-	card->name = "avs_es8336";
+	if (pdata->obsolete_card_names) {
+		card->name = "avs_es8336";
+	} else {
+		card->driver_name = "avs_es8336";
+		card->long_name = card->name = "AVS I2S ES8336";
+	}
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->suspend_pre = avs_card_suspend_pre;
-- 
2.34.1

