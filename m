Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F2224A06A
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029673; cv=none; b=GBZyCak1iVFy4AjYjPZ53QtZssISGprzVQXnlV8DSRwqbz77KV3YA6W/OHwdD8RoSx9nmRiFWtcEzYXE9Lpj0nkB2d761T8Qs73kAIVYp3N6qsqtelem63u2ZR6spvgI9+X3h3TOZd+ywshNwEe1oNevkVcztLrwibbnQIjYJBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029673; c=relaxed/simple;
	bh=2qlGUjhAfl3RctOvsQDrKTagFOCsbPNjl3njec9aXbI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DlZeN4K4aInGuN4D+iMGuaR2Lb8FrjdqWEcL9mBeQaLGMh6ZsfeYb0SIaxsKO+lXq7CSrXWlm+Vz1knPmA8DNMqZRo4lWMG3JSxOf6CshrTVD1CD/vBpWB1JLpJ+WNVInMEjFXONHuzvdiRequN9lxFsKLrgmlePZCwd3GCGXsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QmAQkvVU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QmAQkvVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029672; x=1775565672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2qlGUjhAfl3RctOvsQDrKTagFOCsbPNjl3njec9aXbI=;
  b=QmAQkvVUsDq5zra6uA4D3q3itIwcY0DmDubNFHa53K+YkGXBbqAXRYkN
   oxk3kXmY+7jdAsan6IsDraWmPJ0oc8poowxmu+i0w726f4TeWrsMfW3Ns
   OlfgpDy/JYcibg482XDAw/G93PizDrGR5RqOgjANxtrSKmt+WXqH9NCw0
   5gCYkzUtvvufBHhoqCs+NeZMyzZ9UIu3zlhccw3ByaXEwv/TtlFmGvLnJ
   Ys7zYprZpTojgW0BLrovvcjzdFSpQG0LIUnmlHMIfFhfdDBhxjr1gKPkD
   q8nPlCFHQ7oQwwmpoKQ8gmuC3i0KwQcoWXrXl1TeVbGHysodxoXNIs2Sw
   w==;
X-CSE-ConnectionGUID: 2bkt4un9RjmgchOOsD5h+A==
X-CSE-MsgGUID: a7/cVJ7iRj+x9wq6W7ZBwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56779096"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56779096"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:41:12 -0700
X-CSE-ConnectionGUID: NnTxoYP/Tlend0jPb0+nkQ==
X-CSE-MsgGUID: PWgBKGu/TqiYdcFogA9PGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134268"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:41:09 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 17/20] ASoC: Intel: avs: boards: Change rt5514 card name
Date: Mon,  7 Apr 2025 14:41:51 +0200
Message-Id: <20250407124154.1713039-18-amadeuszx.slawinski@linux.intel.com>
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

Rename FE from "avs_rt5514" to "AVS I2S ALC5514".

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/rt5514.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
index d1c3e29a28ff6..445e5801693ca 100644
--- a/sound/soc/intel/avs/boards/rt5514.c
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -133,6 +133,7 @@ static int avs_rt5514_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_acpi_mach *mach;
+	struct avs_mach_pdata *pdata;
 	struct snd_soc_card *card;
 	struct device *dev = &pdev->dev;
 	const char *pname;
@@ -140,6 +141,7 @@ static int avs_rt5514_probe(struct platform_device *pdev)
 
 	mach = dev_get_platdata(dev);
 	pname = mach->mach_params.platform;
+	pdata = mach->pdata;
 
 	ret = avs_mach_get_ssp_tdm(dev, mach, &ssp_port, &tdm_slot);
 	if (ret)
@@ -155,7 +157,12 @@ static int avs_rt5514_probe(struct platform_device *pdev)
 	if (!card)
 		return -ENOMEM;
 
-	card->name = "avs_rt5514";
+	if (pdata->obsolete_card_names) {
+		card->name = "avs_rt5514";
+	} else {
+		card->driver_name = "avs_rt5514";
+		card->long_name = card->name = "AVS I2S ALC5514";
+	}
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->dai_link = dai_link;
-- 
2.34.1

