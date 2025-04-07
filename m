Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F6A22FDF0
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029651; cv=none; b=VXHZMdrdewUKq4SvPJ1TjU5gEWnjoGIK9W75VlvWTbEmLcBR8/2Qtglk21EfzD6k34qGd8ZFFnUDypQSNGI1VdzWJEyJ3fE/6LtMVIcDfdZ5o9niQ/DxqaDmf4i9TTAbls8y8GJaSq87XsXSfEg2+Xa0oX5FuekhBSXJ50yiqzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029651; c=relaxed/simple;
	bh=6fxJNM68+JhHbwgl7qUBjsdkF9KVJz/geGIpyteulYg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JgpsgLJAJCzADPQkwYDYzIExUMMSSTCAccRjgX7ScCz1VjMROV0RVOk7cD+Onu++manPjhKkYqAH4YoExv+Xk5XB8w6G8HEJE7uEtq6Tk0Es0zb47Tije0+Pkn+HZNxBhuv0DpLiftP7OqX1/9/wANUfeAhMfDAJxFoofHWJ/C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwJ9mJ05; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwJ9mJ05"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029650; x=1775565650;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6fxJNM68+JhHbwgl7qUBjsdkF9KVJz/geGIpyteulYg=;
  b=YwJ9mJ05x9jmjRoZRYUjTrLdL1ZzZeR2we8KVD4iGMG4uL3EQlPY++Et
   71VUH/T+PIQVvZeC3mCABKiURXxM2BTW1gjUeAVyXyWoqLlPE+oXXRbWM
   vuftKbjXwIsELt+UmNtLSd8ApOj5BwhIw3hhEMftYJzKZIXgf//XXw5uw
   bqS7WwzjwH2GQqiZsQURRgI49lp18i1lMq7BPRCvlI2lV9tglTO1Nkjh7
   DaVs8kTzjjVCt3OIev+2ysM609T1W4oky6071OtVkgL+QoK+P05PSwN/N
   /w0qlbM45YjIS4zkXEkyskXAKLRtdA1bIBz39FErLfWGVhN9wTeWBCV4k
   w==;
X-CSE-ConnectionGUID: UZ0gxyyiRa2QRPqbbBmFyw==
X-CSE-MsgGUID: ASuAOJBJSI+FZaMe6aUZJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56778982"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56778982"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:40:50 -0700
X-CSE-ConnectionGUID: 2PQ6ZB9fRNahCQcrpb8wGQ==
X-CSE-MsgGUID: opzW4ZtNSnu5EhLKnl7rsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134063"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:40:47 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 04/20] ASoC: Intel: avs: boards: Change DMIC card name
Date: Mon,  7 Apr 2025 14:41:38 +0200
Message-Id: <20250407124154.1713039-5-amadeuszx.slawinski@linux.intel.com>
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

Rename FE from "avs_dmic" to "AVS DMIC".

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/dmic.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index 4dd9591ee98b7..cda2ddb28add3 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
+#include "../utils.h"
 
 SND_SOC_DAILINK_DEF(dmic_pin, DAILINK_COMP_ARRAY(COMP_CPU("DMIC Pin")));
 SND_SOC_DAILINK_DEF(dmic_wov_pin, DAILINK_COMP_ARRAY(COMP_CPU("DMIC WoV Pin")));
@@ -49,17 +50,24 @@ static const struct snd_soc_dapm_route card_routes[] = {
 static int avs_dmic_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach;
+	struct avs_mach_pdata *pdata;
 	struct snd_soc_card *card;
 	struct device *dev = &pdev->dev;
 	int ret;
 
 	mach = dev_get_platdata(dev);
+	pdata = mach->pdata;
 
 	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
 	if (!card)
 		return -ENOMEM;
 
-	card->name = "avs_dmic";
+	if (pdata->obsolete_card_names) {
+		card->name = "avs_dmic";
+	} else {
+		card->driver_name = "avs_dmic";
+		card->long_name = card->name = "AVS DMIC";
+	}
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->dai_link = card_dai_links;
-- 
2.34.1

