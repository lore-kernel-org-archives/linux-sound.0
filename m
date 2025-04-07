Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2655824A06A
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029670; cv=none; b=TkyNQCF6j9R3eiqrYuCm0jUyLSTNg9v9eNb8FwI27df3BqllgRSZuDSDdO6/ZXYbDIQwc0sWXIFOoTj45ow6ItVC4Wpfa6EPCNSSfGK/5YxRLq+r1cbobG/OvaJ1xNRDPXsGPB9nWIEd5OXli0UzOnyBooD7aIyo7yqX/UBGhH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029670; c=relaxed/simple;
	bh=zdZY360TkXXcq0DSo8YfjEhRWzUXI2M21xaWtzxy5CI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bdpHC43C83CgC8BJhyrFIaTlkx4OcVJ3Iqh3VcLedRmKmRc07y5pna1uFmvD850BNJogbaio3aamEWnRUAsKbaq0ydDrzBvXlmyfVJ81TmBib4tBuCpONj/XzHL6K3B4IpjnsZyRCcO1WiDDhVdtWp07fFDQ58Q0leFzOQTiAHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oB17MM+E; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oB17MM+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029670; x=1775565670;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zdZY360TkXXcq0DSo8YfjEhRWzUXI2M21xaWtzxy5CI=;
  b=oB17MM+EMv/F8bEBW3RgnPqX03q8ZNoqQ5A+lIkwL72QAE2FWAaIaY3Y
   Kt8oB+BjPk+1mEZH5i2/1ghUpKaHaXE5+Hl1mNQ+gUbJPYSozMpot+44s
   EHAr6YCTBQGd7GmxRguvRAsLut5XAW+fuqgLuP0SFyet3xCqx6vjM+rRH
   ZW2W2fPRk+BlHzYMgPqUCUS6RWQy9nB72HPR9KrAzLVpfMGEDfr+T6XWC
   /ZvbILaqIOlzMxSKZj9aQTIxdvXOyHB7BQ4wtdCKvZBqVGdHwPPdmp4nf
   q1BsjSNqLg/+J9jUvFcIdQg5brAg9wt3U5brlqvTWxAfrcYuhQBEMV3j0
   g==;
X-CSE-ConnectionGUID: vU4NfLF+Rl67Cc11AKSAgg==
X-CSE-MsgGUID: b9qZm3ErSwC5JZ18du9HbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56779081"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56779081"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:41:08 -0700
X-CSE-ConnectionGUID: kc/bG9ieTASm+1F1lBFwLw==
X-CSE-MsgGUID: z6Xexk4iRrSUa8U7S7HVyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134248"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:41:06 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 15/20] ASoC: Intel: avs: boards: Change rt286 card name
Date: Mon,  7 Apr 2025 14:41:49 +0200
Message-Id: <20250407124154.1713039-16-amadeuszx.slawinski@linux.intel.com>
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

Rename FE from "avs_rt286" to "AVS I2S ALC286".

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/rt286.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index 6a27c6a9f3941..140f9492632d2 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -179,6 +179,7 @@ static int avs_rt286_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_acpi_mach *mach;
+	struct avs_mach_pdata *pdata;
 	struct snd_soc_card *card;
 	struct snd_soc_jack *jack;
 	struct device *dev = &pdev->dev;
@@ -187,6 +188,7 @@ static int avs_rt286_probe(struct platform_device *pdev)
 
 	mach = dev_get_platdata(dev);
 	pname = mach->mach_params.platform;
+	pdata = mach->pdata;
 
 	ret = avs_mach_get_ssp_tdm(dev, mach, &ssp_port, &tdm_slot);
 	if (ret)
@@ -204,7 +206,12 @@ static int avs_rt286_probe(struct platform_device *pdev)
 	if (!jack || !card)
 		return -ENOMEM;
 
-	card->name = "avs_rt286";
+	if (pdata->obsolete_card_names) {
+		card->name = "avs_rt286";
+	} else {
+		card->driver_name = "avs_rt286";
+		card->long_name = card->name = "AVS I2S ALC286";
+	}
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->suspend_pre = avs_card_suspend_pre;
-- 
2.34.1

