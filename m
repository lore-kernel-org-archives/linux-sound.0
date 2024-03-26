Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC48313C90A
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469127; cv=none; b=gRGrq/7kNynH1ojja2Rp93D5maf5l5HsnsLHRu42ailZ5K49XGp0hyvaGi5xoCdsPxat8uHgFGBBUTF7TtuJ4uDSQCGLJdLumRRkcKtINkUvzcmOA3KJGE4uhk8TurmNebRq8LaXRRDfq7tagwYhrFHN0zF08AQDvI7tO5BrMkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469127; c=relaxed/simple;
	bh=CqMw0hQCpoYpsInZ7ccCCDW4BJ6/9Rb+vQzek9KYCzw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OS94rGsKErjt9hxv6QltBW27ES8D1bGte0T0MlO3F/pn17h2j5BAFoEvoWxYgpx9yMWm+lxxR3/ZMBH/THBxs173/j1ycrRa/G68H1LKA5AyuheyqcDd+kfSPwCCh4/F5YsEPpQx6k+Lv11cyIgwbp9eRmSbqpuiBvdEGcDt13M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZiRbiDDj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZiRbiDDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469125; x=1743005125;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CqMw0hQCpoYpsInZ7ccCCDW4BJ6/9Rb+vQzek9KYCzw=;
  b=ZiRbiDDjZQ71mMW6yuAI6/3tdH4ypqPpoB9IGUMLab066c++VjFcFW/d
   B06odjB5/sFs6A2P5VnfpaawfgtPmYjmYNLien/Mo0Y9j36jVmi2arZnP
   4b8JiCnXzJQE05WYT5u+324BZ6likosjq9svrf/AMILJVKWh3jzqR7nbh
   LJKKx3IHd/bM17qckKftsw0kKXCsmcAGNt/W1toBRJ6anhI4XNNv6GbT5
   okQwYrMhqOLAFU6F1g7JFuMa+tzZ+WtUVbxF+JGOjagoHVcg1sXkji1qU
   /OUuBhUn81AfOSFHcBTPwzGrDanFtTp++y+50D2450YlEFvgUrwakwn2X
   Q==;
X-CSE-ConnectionGUID: zPsk8okzTq2VeQHRiWm8bg==
X-CSE-MsgGUID: 8kzTARrTTSmJ5qKxXQaXCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260381"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260381"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482198"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 09/34] ASoC: Intel: sof_sdw: Use for_each_set_bit
Date: Tue, 26 Mar 2024 11:04:04 -0500
Message-Id: <20240326160429.13560-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Rather than open coding a loop to process each bit use for_each_set_bit.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 0ffa6e36dbed..a12283d3e1cc 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -5,6 +5,7 @@
  *  sof_sdw - ASOC Machine driver for Intel SoundWire platforms
  */
 
+#include <linux/bitmap.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/module.h>
@@ -1644,7 +1645,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	char *codec_name, *codec_dai_name;
 	int i, j, be_id = 0;
 	int hdmi_num;
-	int ssp_mask;
+	unsigned long ssp_mask;
 	int ret;
 
 	ret = get_dailink_info(dev, adr_link, &sdw_be_num, &codec_conf_num);
@@ -1782,12 +1783,10 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	if (!ssp_num)
 		goto DMIC;
 
-	for (i = 0, j = 0; ssp_mask; i++, ssp_mask >>= 1) {
+	j = 0;
+	for_each_set_bit(i, &ssp_mask, BITS_PER_TYPE(ssp_mask)) {
 		int playback, capture;
 
-		if (!(ssp_mask & 0x1))
-			continue;
-
 		name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", i);
 		cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", i);
 		codec_name = devm_kasprintf(dev, GFP_KERNEL, "i2c-%s:0%d",
-- 
2.40.1

