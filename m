Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CD7230981
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029663; cv=none; b=RzsGdwbLwv0J1qTvqLLwoYumzJ4RbfyT+OPRBndd/k4Zw35DvuouW2HqMeKAY87pRHJaobrQqG3T3ffpBdyIhGwFbFEbgwgWd90tz2J+y7MOEbKMe8AXt5cxrkYoVMMXnEU5b3CxUc4/kg/bdFvzk2HnTcGvrKGAEzhTRB31Epk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029663; c=relaxed/simple;
	bh=nYUT4H2c3NAoSQLR9nemzd/15zS3R/imhpc+fckOT+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=spYN4Nthu/LOGtv8b9fuR18CpaKLVjunbrP/nA9cgKdszR8noquFDpfyBJfIy2HeGX/0yiSPZoyYqB7Evj2asgi5Qk4d3wbDCiDUqZBBJ5o/bWzUO+VvmZjGsJy/xoGM3dPpzxa5YW/GGVmx/T+Ox3HtMQZLS944Hz+k5b6h52Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Di4OaNQo; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Di4OaNQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029662; x=1775565662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nYUT4H2c3NAoSQLR9nemzd/15zS3R/imhpc+fckOT+w=;
  b=Di4OaNQoieNZAnZeLBoF8eP5JGYSstwjpg8rpz43AJZ7G+PTGFZ0YnY1
   sEuOKitGwqafEbc9QxsMrucpmjYzPzjua2bgMMHOCt2WafK8L8e6DRucE
   Xw/hx0UdVDDpJiCoLLVJUKMxqIjHXNpyPnBdc+6h1Q2rvlaGoPPUMJJc2
   IucwuZxLUlx9vkhGBqSuNjC/SzeC9u8YiDNTexmJgeV00P7QrgQ/PmfDJ
   Fiq2zKk2is/miX6/1ytLGhN337j6hf+MVmKvr1yovtH8/Q86gdzNIFnjC
   P6rorfjsbcBuP2LxOYhwL04Hz2oMyKI2dRxTuQtErxZqz2t1q0lz4NXLn
   Q==;
X-CSE-ConnectionGUID: mZgF34kOQUyx2p6czYiVgQ==
X-CSE-MsgGUID: mjmSEdS7QbWxSFK0lAEdDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56779041"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56779041"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:41:02 -0700
X-CSE-ConnectionGUID: +LvyaJZrQzG6aUdPbshWXQ==
X-CSE-MsgGUID: RbqPJavDTHa3l4D4ajyFuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134167"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:41:00 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 11/20] ASoC: Intel: avs: boards: Change nau8825 card name
Date: Mon,  7 Apr 2025 14:41:45 +0200
Message-Id: <20250407124154.1713039-12-amadeuszx.slawinski@linux.intel.com>
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

Rename FE from "avs_nau8825" to "AVS I2S NAU8825".

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/nau8825.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index e203ceb83b871..465dab7b3ad86 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -246,6 +246,7 @@ static int avs_nau8825_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_acpi_mach *mach;
+	struct avs_mach_pdata *pdata;
 	struct snd_soc_card *card;
 	struct snd_soc_jack *jack;
 	struct device *dev = &pdev->dev;
@@ -254,6 +255,7 @@ static int avs_nau8825_probe(struct platform_device *pdev)
 
 	mach = dev_get_platdata(dev);
 	pname = mach->mach_params.platform;
+	pdata = mach->pdata;
 
 	ret = avs_mach_get_ssp_tdm(dev, mach, &ssp_port, &tdm_slot);
 	if (ret)
@@ -270,7 +272,12 @@ static int avs_nau8825_probe(struct platform_device *pdev)
 	if (!jack || !card)
 		return -ENOMEM;
 
-	card->name = "avs_nau8825";
+	if (pdata->obsolete_card_names) {
+		card->name = "avs_nau8825";
+	} else {
+		card->driver_name = "avs_nau8825";
+		card->long_name = card->name = "AVS I2S NAU8825";
+	}
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->suspend_pre = avs_card_suspend_pre;
-- 
2.34.1

