Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B8D24889F
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029660; cv=none; b=FneZwvORskrb63f7PevD4K1kwSrcMmz9KSP2RbdipZ42kAy4nYGur8Teib/iVyzjVKLnEIIT5aHvGqx7rVMEYn0+1U9EdOw+Dcii/P5cz6zImv1yROj5RtVjPyGc5CM3VvO1MN/rlKCbEEfu1z3NhePvv9CmjFu2KnIuxdyMeqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029660; c=relaxed/simple;
	bh=Jc6d8kcpltewGchRF0pZbZopNG1T7HJqMPK50xkoyrc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kh84jWfDX3SYLhlv3HCwuoZxp4UOcTSYfb5gOsJfvvG+qvod4Wi8M5IcKJstn7roE05VWoSm6IaVxmQ3n1tjhakmiDJSACRNbJavjjuCIr2Z+vUM17DFFUSLCwZvlvtrkAHqrPDmcaSjSyaSHaRuEzcYZd4mHFbwwRWuW1RS3sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8xlV9GY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8xlV9GY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029659; x=1775565659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jc6d8kcpltewGchRF0pZbZopNG1T7HJqMPK50xkoyrc=;
  b=U8xlV9GYYPAhgrZCwVmWzedPZh98kp3BsMQ03Lre8tT75qI8w9Ukj6yo
   gN77qEJWGoig0KqucnsCC68QU70QPNRiWFQZcHw7h+HK/HAZqS1ZP3eh0
   lPCkffw9DBoTwQcZTnYmGc/xcoGz2B3Ljqpem5NSpIw5wGe6FG3nTROG+
   6rdJI8r/QMKCnvbI4mN05JSb71eM8r1mi2PvmSj04/2aCV1D4+vMwdMZn
   UjNnowTdIqVh6i/NeLOhaE2IWfhluLMd+YU47XTajW0AUhmsl4LHJIcal
   cw7A5nFLRL0O7cGz29uZgGVyFQfZs2qKPgoYxUg4FbXxsGl0tbs74NLX4
   w==;
X-CSE-ConnectionGUID: Akf1HV4BSQ+P6B85p1VH/g==
X-CSE-MsgGUID: DZNzdht7SUeDdLbmMoR7rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56779024"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56779024"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:40:59 -0700
X-CSE-ConnectionGUID: diSUz/J9RmGVLKBLxP/FuA==
X-CSE-MsgGUID: KKd/L3nLTiedSaPrUx7VpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134136"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:40:56 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 09/20] ASoC: Intel: avs: boards: Change max98373 card name
Date: Mon,  7 Apr 2025 14:41:43 +0200
Message-Id: <20250407124154.1713039-10-amadeuszx.slawinski@linux.intel.com>
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

Rename FE from "avs_max98373" to "AVS I2S MAX98373".

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/max98373.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index 970f82bf4ce89..c4245a9c7707b 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -146,6 +146,7 @@ static int avs_max98373_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_acpi_mach *mach;
+	struct avs_mach_pdata *pdata;
 	struct snd_soc_card *card;
 	struct device *dev = &pdev->dev;
 	const char *pname;
@@ -153,6 +154,7 @@ static int avs_max98373_probe(struct platform_device *pdev)
 
 	mach = dev_get_platdata(dev);
 	pname = mach->mach_params.platform;
+	pdata = mach->pdata;
 
 	ret = avs_mach_get_ssp_tdm(dev, mach, &ssp_port, &tdm_slot);
 	if (ret)
@@ -168,7 +170,12 @@ static int avs_max98373_probe(struct platform_device *pdev)
 	if (!card)
 		return -ENOMEM;
 
-	card->name = "avs_max98373";
+	if (pdata->obsolete_card_names) {
+		card->name = "avs_max98373";
+	} else {
+		card->driver_name = "avs_max98373";
+		card->long_name = card->name = "AVS I2S MAX98373";
+	}
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->dai_link = dai_link;
-- 
2.34.1

