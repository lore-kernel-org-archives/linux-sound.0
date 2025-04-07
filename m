Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997D92512D7
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029651; cv=none; b=fx4I9l0ekstTydWDWmubfZ0YJ0P0UTcvRwscoWzGpetggmbfeniEO5Q/uFcfRIxuz2Y+RKyRp8Ltlk5GtVpJlVtHW7YltRYmah+Q0gSy3uOoC9R/RUzza6vham+MOditNsmmD0kp/gsHoeTatwvqRNBI6qknMxvSdNdu+VTYmLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029651; c=relaxed/simple;
	bh=DReUTOnSm0BjzqIWfhF3M+ZJanvsxoWVAHtMjUgIL9s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uZMDJywPOjPZImYyut7v1glMlJyj+1GfryIT2p+02uM+gT5YrCZLOADlp9pQB+JCSElx8Y99HNPfX4P0qnfi1ZWcksgRdSGU+3HPA5iP9IWqsZWEW3kMiduibHuyqTFukgnn1l4pYLbIonYVKCkB6v02Qom4XikWwtDC7UNfyvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ReYl9Mez; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ReYl9Mez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029650; x=1775565650;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DReUTOnSm0BjzqIWfhF3M+ZJanvsxoWVAHtMjUgIL9s=;
  b=ReYl9MezQw0O8IW7u1ZDO7otXgQl+GZCrUKCVN6kFVGwlkekjax5H67z
   rkQ9wMaUIRBHA+UyY40V5UDeyuw84PAQZGSUggys0W0qDD8dBbjfyn+Nr
   3tA6OvZxzxI/rPL5T8BueJ4pVQshxwNAdfRWDlpTb/OAxEvuFGt0W+pVU
   wwFT6/YPGvyEN4MPHxVMZUrmlnAf1ALHNnHA+l0AufjV9zZS7I7lSHH9M
   H8RKnOsdHp0UbBud63jKlQYOMxL2TDFugONsxQEbG6eXArvq2eJqbwtWk
   jAsof73NSBk6QucpRQ6KWjg65kb0BSo4V52eiXbqD2W/zHZoHAfx5IQ/y
   g==;
X-CSE-ConnectionGUID: 3fBwPaUTTb2DJuq/RQH53Q==
X-CSE-MsgGUID: pSNrQHcPRt65IMuZX6SP/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56778977"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56778977"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:40:48 -0700
X-CSE-ConnectionGUID: fuEhek1PTACO8W+cL6Irvw==
X-CSE-MsgGUID: GVBXyLavT3KVJJ12TyKMmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134052"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:40:46 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 03/20] ASoC: Intel: avs: boards: Change da7219 card name
Date: Mon,  7 Apr 2025 14:41:37 +0200
Message-Id: <20250407124154.1713039-4-amadeuszx.slawinski@linux.intel.com>
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

Rename FE from "avs_da7219" to "AVS I2S DA7219".

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/da7219.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 7217ae51e89c2..010e7785ad9a4 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -214,6 +214,7 @@ static int avs_da7219_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_acpi_mach *mach;
+	struct avs_mach_pdata *pdata;
 	struct snd_soc_card *card;
 	struct snd_soc_jack *jack;
 	struct device *dev = &pdev->dev;
@@ -222,6 +223,7 @@ static int avs_da7219_probe(struct platform_device *pdev)
 
 	mach = dev_get_platdata(dev);
 	pname = mach->mach_params.platform;
+	pdata = mach->pdata;
 
 	ret = avs_mach_get_ssp_tdm(dev, mach, &ssp_port, &tdm_slot);
 	if (ret)
@@ -238,7 +240,12 @@ static int avs_da7219_probe(struct platform_device *pdev)
 	if (!jack || !card)
 		return -ENOMEM;
 
-	card->name = "avs_da7219";
+	if (pdata->obsolete_card_names) {
+		card->name = "avs_da7219";
+	} else {
+		card->driver_name = "avs_da7219";
+		card->long_name = card->name = "AVS I2S DA7219";
+	}
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->dai_link = dai_link;
-- 
2.34.1

