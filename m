Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15FE24889F
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029658; cv=none; b=hc8sZzM5GSBApGnneCK4Yscl0ybS0D7g99/AQd+3xd4kY6fTCRQvzpg3mrL63zm2AOVbnwTyMjvxRhrkNU9f/u0g00u9MYyr5egZgB2Ch2tbFi4rwM4Eo6ASL4qjQimQvhmJZetFLBaiWQ0xqIXmhoGrCuq0U5RMwbw2JmOhqV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029658; c=relaxed/simple;
	bh=uoGuKj3EHbftQvCYhqbBx27ALT8sFjhOTXnJHYNQu7k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VvQ/quqrzq7AvOPAvu97lTQcaU5ZT2ayG8Cz2HJCIc9A9HcpDyevpTC/gqISuYjpIuvI9W6RDr4KlrveEsa3mZ31XRrr/pjVTNgRFVf9oViipqIRBZTUMKhu/K6QZWZBc5btfVQmcD/jwaS2AkZ0Ac6hHLP9Rpw9ithZuVNyjjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2bvVi4E; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2bvVi4E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029657; x=1775565657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uoGuKj3EHbftQvCYhqbBx27ALT8sFjhOTXnJHYNQu7k=;
  b=L2bvVi4EO8Tp7Z1I65rPweaAl+XO46hanbZKQ2rkRN+j2jy3SJnJsJml
   iDf0vceMkDjVTy/NbM5snpy7wpP/pKJMCxWRD2H8gzbkt+DXzAsXm34AR
   usj0H6kHsEc8qHuVcUGJsLmZj/iKcOHdDicfPEq6Xm7s28P7eSg/era1V
   vavwCppJYkPlqlAXHtAv2e4Yy3POf5Z+3w8VGszSjXwbzq9aQWtGOrEv6
   q9HT2xd6eR/AxazgF54vgeWDSjtGqx+9cb0SQ87mcdflzAX6SZC2cDnAb
   61jIgfJByLHqGoI2i8e3hw+BxFxePJH17i8WAfrIQReHjfaDop9IeEj4Y
   w==;
X-CSE-ConnectionGUID: zO6oJXjNR5C/xSOeC9JUJQ==
X-CSE-MsgGUID: c1msfyufQPuMap7xPRPgLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56779019"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56779019"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:40:57 -0700
X-CSE-ConnectionGUID: sS4kCfs2RFG0pfRqiSWSiA==
X-CSE-MsgGUID: DGejermhSHSxnBoq4uckLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134121"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:40:55 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 08/20] ASoC: Intel: avs: boards: Change max98357a card name
Date: Mon,  7 Apr 2025 14:41:42 +0200
Message-Id: <20250407124154.1713039-9-amadeuszx.slawinski@linux.intel.com>
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

Rename FE from "avs_max98357a" to "AVS I2S MAX98357A".

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/max98357a.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index c55c1d60b777f..d6be251987e1a 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -93,6 +93,7 @@ static int avs_max98357a_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_acpi_mach *mach;
+	struct avs_mach_pdata *pdata;
 	struct snd_soc_card *card;
 	struct device *dev = &pdev->dev;
 	const char *pname;
@@ -100,6 +101,7 @@ static int avs_max98357a_probe(struct platform_device *pdev)
 
 	mach = dev_get_platdata(dev);
 	pname = mach->mach_params.platform;
+	pdata = mach->pdata;
 
 	ret = avs_mach_get_ssp_tdm(dev, mach, &ssp_port, &tdm_slot);
 	if (ret)
@@ -115,7 +117,12 @@ static int avs_max98357a_probe(struct platform_device *pdev)
 	if (!card)
 		return -ENOMEM;
 
-	card->name = "avs_max98357a";
+	if (pdata->obsolete_card_names) {
+		card->name = "avs_max98357a";
+	} else {
+		card->driver_name = "avs_max98357a";
+		card->long_name = card->name = "AVS I2S MAX98357A";
+	}
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->dai_link = dai_link;
-- 
2.34.1

