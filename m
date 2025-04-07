Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839F722F178
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029661; cv=none; b=sjlInLK8AirOOrhOjcdhH9DeMMItAmi6gXIog2sL3vE1ONAViLfc6GQfs5flqIgJbsA911+UcbBmhZs8KGmk+8JzFVqnkWWTvmRn4klhQO1CnOhYfyyJxoo7lJWpExI3IBHxv1iew3h9FDZqg0/zQvZ2iuA2FWoxys7WvXf0JSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029661; c=relaxed/simple;
	bh=wX1qciDJsnGbJbmLIdUNB7bKdMIe6Q+ljKlcsocMvYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nN3BINtV3MLe5azcrkQ8PXPemY9U5e2xdWLniCYsgiS1gO7VNGLB1G+GpztiwmXKxz6PJWU5zM8U4QnxbHlmyijDWFnjJ3TrgmcTl885czb2oWaGR3Kpfu0xjxd/EA0YZ4COw/w2NbnheEAK7JpD3NIzuJAYL/+oy088GyN+5QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqjX4VSy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqjX4VSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029661; x=1775565661;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wX1qciDJsnGbJbmLIdUNB7bKdMIe6Q+ljKlcsocMvYU=;
  b=gqjX4VSyFQN2AYJ6h2FP4z3VwRWEHZ6fUS8DV7gADIXWgry0pH/laAZ9
   ybrC4KmN8uxQycGrlFYmuxZl5RQWAi0RxXvJX/CMiGFxGbFTPR6hHcenp
   XPi04ZzWkxEr+DtgNmx3vB+dFNohKxGctFZQgDEekJdmyIiNkT2okUT/R
   gpGwhrAlhSj1lycUXLaP9UqhpqgyMzyJh3FBeuAVdFyIsTFM+5QiT401q
   KvPedcTbgX4AoXnwvVGl0xGgjQnrz5oZ979Vz1s25CWhZxSs/mi3MrfwI
   jtZYinaA/Dzxmw3Pwi5zWHostIO2NPt3gtMghovSJt9o5BOlQKmKgD9ex
   Q==;
X-CSE-ConnectionGUID: yt4W6nPNQWWKt6EhogxgdA==
X-CSE-MsgGUID: mP3NlW/uTj+7B3HaWeaJOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56779029"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56779029"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:41:00 -0700
X-CSE-ConnectionGUID: uPI69x4KRT6qorKRb2iZYg==
X-CSE-MsgGUID: GqYKFnPXTF6K2dS2OyNZsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134154"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:40:58 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 10/20] ASoC: Intel: avs: boards: Change max98927 card name
Date: Mon,  7 Apr 2025 14:41:44 +0200
Message-Id: <20250407124154.1713039-11-amadeuszx.slawinski@linux.intel.com>
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

Rename FE from "avs_max98927" to "AVS I2S MAX98927".

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/max98927.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index e4ce553bf1d64..d78019d4565ec 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -143,6 +143,7 @@ static int avs_max98927_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_acpi_mach *mach;
+	struct avs_mach_pdata *pdata;
 	struct snd_soc_card *card;
 	struct device *dev = &pdev->dev;
 	const char *pname;
@@ -150,6 +151,7 @@ static int avs_max98927_probe(struct platform_device *pdev)
 
 	mach = dev_get_platdata(dev);
 	pname = mach->mach_params.platform;
+	pdata = mach->pdata;
 
 	ret = avs_mach_get_ssp_tdm(dev, mach, &ssp_port, &tdm_slot);
 	if (ret)
@@ -165,7 +167,12 @@ static int avs_max98927_probe(struct platform_device *pdev)
 	if (!card)
 		return -ENOMEM;
 
-	card->name = "avs_max98927";
+	if (pdata->obsolete_card_names) {
+		card->name = "avs_max98927";
+	} else {
+		card->driver_name = "avs_max98927";
+		card->long_name = card->name = "AVS I2S MAX98927";
+	}
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->dai_link = dai_link;
-- 
2.34.1

