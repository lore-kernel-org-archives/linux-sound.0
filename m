Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42F024C098
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029676; cv=none; b=j8S6j8okQ92PfkEqzarXFPG3kqAD0K2C4AMGfQzCcYD6gJ7SJ0+SQZaypwr9iR2UCf5jTBdCZ4B6OBkvLLuPkGt+DYFHPet8jria5crqZC7ghokWeJjTILGHSun8hI74DcJlSkZngIGYShPeWKst1e15NH+c5rce8ajGVtBoJ9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029676; c=relaxed/simple;
	bh=kzneauAwNqIg64NuvJT6lB+Gz1GA298g4J1ol8ybpSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FdxBN/PGFBsC6IzWmIIIO6JgLkQFQzf04vo3MPvm9kMl3sNlqnCO4iMFbRG81dA6xcrHfhDSDepCFjJAAlLsGKoEK6uwa1AgRVMD8RZftuVb7DEtCq8FOA3jWkGqUOCQ974h3cJAB8O1EJnqw4Fg061iZeLejvH5GyXJ674awbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qfyg8U4W; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qfyg8U4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029675; x=1775565675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kzneauAwNqIg64NuvJT6lB+Gz1GA298g4J1ol8ybpSU=;
  b=Qfyg8U4WLF0UpFqfCJNc7DyVfQC2wCI4QF/6GIp1dyJJh/u2bLdah2Kg
   4h05YEhigBEatt/VJvrvoMYoBo0poL90qciYX9/ikx9WXdgJxePqtwGbs
   17QZe82d3pGFCwDUlXb7SHurU414vcZ6izl6QFabuGJ/ZbQe8oaP5hvn6
   EmZyZPCnrINIKO28vWzBG86ztUpGIKxoKWtLuR+5Jhh+wFNpnedPDt8XN
   xliYUSzVH3I+2dMXbak/E3L/jLvl5p4rj/k/FUpuSOFYA5rKdd5H5Ghmk
   /rZ+EQmVe9SZ6EMNVMQJ3JXRXzFjPVpyIlv/55E4tEyEiNEdhjUoGhNaN
   g==;
X-CSE-ConnectionGUID: A8KTevR9S9alWMJnyVLnhw==
X-CSE-MsgGUID: 2qMbszKKROOoTMaUCpPkSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56779114"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56779114"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:41:15 -0700
X-CSE-ConnectionGUID: gl/qr/xRRm2Tc3JaVmMwsQ==
X-CSE-MsgGUID: Um3HjUrJScycTR+qlMkUkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134293"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:41:13 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 19/20] ASoC: Intel: avs: boards: Change rt5682 card name
Date: Mon,  7 Apr 2025 14:41:53 +0200
Message-Id: <20250407124154.1713039-20-amadeuszx.slawinski@linux.intel.com>
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

Rename FE from "avs_rt5682" to "AVS I2S ALC5682".

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/rt5682.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 339df0b944c17..79e8d1084848e 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -268,6 +268,7 @@ static int avs_rt5682_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_acpi_mach *mach;
+	struct avs_mach_pdata *pdata;
 	struct snd_soc_card *card;
 	struct snd_soc_jack *jack;
 	struct device *dev = &pdev->dev;
@@ -282,6 +283,7 @@ static int avs_rt5682_probe(struct platform_device *pdev)
 
 	mach = dev_get_platdata(dev);
 	pname = mach->mach_params.platform;
+	pdata = mach->pdata;
 
 	ret = avs_mach_get_ssp_tdm(dev, mach, &ssp_port, &tdm_slot);
 	if (ret)
@@ -298,7 +300,12 @@ static int avs_rt5682_probe(struct platform_device *pdev)
 	if (!jack || !card)
 		return -ENOMEM;
 
-	card->name = "avs_rt5682";
+	if (pdata->obsolete_card_names) {
+		card->name = "avs_rt5682";
+	} else {
+		card->driver_name = "avs_rt5682";
+		card->long_name = card->name = "AVS I2S ALC5682";
+	}
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->suspend_pre = avs_card_suspend_pre;
-- 
2.34.1

