Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD962512D7
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029668; cv=none; b=rU99k/jlYMlPPeSljI0O1+gfxXcEDiCzJVJg0HCby4jgvaCDCnJxAsySrM6XHDuup6jjnU4SdGY3eX/YXuX6kUG1wNyRce+uTyhs9YM8cUDS6VwVinjIhPGrzJgu1U2XIsR4QzHqtFTTRsL9wWi2VTUn2aPSR7tUqe6sRiL+IDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029668; c=relaxed/simple;
	bh=sptTWAvT4jCnFEOhqnfx5/A1EMhO3493Z2Ej/09vXxw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F/6T+RILJplKRdj4b8OwzprCCVWk9T11uWkG2W0+sw1Ri9R9tzQMri5DFIpRuIXuqQGkHoBCECFycI5awGnonZzoyvOqxK4EnKmpibZwWrBXcmTLc2mkekQTvtWpGaWtpfU+Uw68E/vEItxggF/OaVmxTHzZ01y6Cs5uYfjmjn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MC67cvhh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MC67cvhh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029667; x=1775565667;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sptTWAvT4jCnFEOhqnfx5/A1EMhO3493Z2Ej/09vXxw=;
  b=MC67cvhhnPwzMKqpBCvB2BaR5qBzYrV13tyz6bZkKQn38AEX+olxliOb
   hjSG/Mm4NY2rtIXKxO0qLPZv9wjbWPNwWhd+qYWDNxul4ZYX9nYTrajtL
   STcKkJ7zKqD0vWL74mIsVND0HCnIzmZDGLynszEQ/6cmP7gOk6LFyab0b
   m3z8iLrR0JRiJilDyf1M8kgilRUp3woIC2a11IjXcfHTo7pG5GoDdgYpt
   7P18vezOOaf2JTfYdufZzXg905hza/pyDjIFU/CEIGdZqWGFPfgR+3nMo
   QfAxgdTmPYyrMTnMooBgiEgpDf+q+0C1k/7T+PGP5PDQTB+0+7krOg1wn
   g==;
X-CSE-ConnectionGUID: pPHIHuQ1ScKZ4t+cw3AG+A==
X-CSE-MsgGUID: fH1qivARQ4uqVBGFJ9/VGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56779070"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56779070"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:41:07 -0700
X-CSE-ConnectionGUID: E4OyS8pzRUeIrq/azFa3Kg==
X-CSE-MsgGUID: qtaeIGLcRn++ECgUuvtI+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134227"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:41:04 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 14/20] ASoC: Intel: avs: boards: Change rt274 card name
Date: Mon,  7 Apr 2025 14:41:48 +0200
Message-Id: <20250407124154.1713039-15-amadeuszx.slawinski@linux.intel.com>
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

Rename FE from "avs_rt274" to "AVS I2S ALC274".

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/rt274.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index 29977aee2153b..10646986c949f 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -210,6 +210,7 @@ static int avs_rt274_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_acpi_mach *mach;
+	struct avs_mach_pdata *pdata;
 	struct snd_soc_card *card;
 	struct snd_soc_jack *jack;
 	struct device *dev = &pdev->dev;
@@ -218,6 +219,7 @@ static int avs_rt274_probe(struct platform_device *pdev)
 
 	mach = dev_get_platdata(dev);
 	pname = mach->mach_params.platform;
+	pdata = mach->pdata;
 
 	ret = avs_mach_get_ssp_tdm(dev, mach, &ssp_port, &tdm_slot);
 	if (ret)
@@ -234,7 +236,12 @@ static int avs_rt274_probe(struct platform_device *pdev)
 	if (!jack || !card)
 		return -ENOMEM;
 
-	card->name = "avs_rt274";
+	if (pdata->obsolete_card_names) {
+		card->name = "avs_rt274";
+	} else {
+		card->driver_name = "avs_rt274";
+		card->long_name = card->name = "AVS I2S ALC274";
+	}
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->suspend_pre = avs_card_suspend_pre;
-- 
2.34.1

