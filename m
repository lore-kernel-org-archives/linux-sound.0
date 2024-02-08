Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADB37FBB7
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411363; cv=none; b=bwBZQeI0NymQCIYJP88nzjvPhgGeu4tb5I4muuVQP1SuJWWgonyejFwECPn9I5EPUxsqJk++fA86EVp1n6sWqtnScC7Hyw68yFRnBeoZqmy1qHRDLYo+pFMxP5nCxeGrl+GLhhHvBFnpYERl2rPZ7PFzwucNU7htkdRDajbo9FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411363; c=relaxed/simple;
	bh=FT8PgSPA4NcdoRR4TxGTK5GldPkh+1Qs3BzQhAvjUl4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J78+mbCIP9D1jLlzwVH67D492WbQQvYI0VNGzMr/eLRt8nr34e8T1LsBEy5q2NC0P7iFvLUtWV0sImjwWUKHjFcwXvH7hCKMm1+NgP5rdKCSPte7dDPHvd7sO1kWdXO5eFs91/nFJonYiV1NH2bvTuwV6/+a4E1Kf624J0NF3WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5gtBgiK; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5gtBgiK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411361; x=1738947361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FT8PgSPA4NcdoRR4TxGTK5GldPkh+1Qs3BzQhAvjUl4=;
  b=H5gtBgiKASnXxJ/pYQ3gtHmAN015W38KX7LzboKI/sHIZyoHRpl4oE4p
   uUgQ6kVPcZw5NuYkaA1ugXW+dJZae425Y1NDZrqJVPttbwLo1+9m0+ye/
   csHd0G1oSQDbLpg7k5iWJyBbu76Aul+ky37ingJljb5YKgCZ39uuvC9GJ
   QD2xv2E7bw/pE//8WH21XlE/15j+CqKb2HiwaIHtZmpFLnSgkjrt4ffI1
   vogYZIZFSigxC5K6dHtUMFGUExOYCeU3kFqyWI9RF1HMietp4nk0kZ+rM
   bv6OZLUWImMu1zuA17F8uWXOwa/OyuQDYVDx5SnHDHdRKqZ01bFfOMvEG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675348"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675348"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:55:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690184"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:55:59 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 09/24] ASoC: Intel: sof_sdw: use single rtd_init for rt_amps
Date: Thu,  8 Feb 2024 10:55:30 -0600
Message-Id: <20240208165545.93811-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

2 amps can be in the same or different dai links. To handle this, the
existing code implements different spk_init functions to add dapm routes
for different amps. However, sof_sdw.c doesn't support non-aggregated
amp any more since it used pre-defined BE id.
With that assumption, combine the spk_init functions together.
This is a preparation of putting different types amps in a single dai
link.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_rt_amp.c | 54 +++++--------------------
 1 file changed, 10 insertions(+), 44 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
index 436975b6bdc1..a4414c9793b4 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -185,12 +185,14 @@ static const struct snd_soc_dapm_route *get_codec_name_and_route(struct snd_soc_
 		return rt1318_map;
 }
 
-static int first_spk_init(struct snd_soc_pcm_runtime *rtd)
+static int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	const struct snd_soc_dapm_route *rt_amp_map;
 	char codec_name[CODEC_NAME_SIZE];
+	struct snd_soc_dai *dai;
 	int ret;
+	int i;
 
 	rt_amp_map = get_codec_name_and_route(rtd, codec_name);
 
@@ -214,40 +216,16 @@ static int first_spk_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map, 2);
-	if (ret)
-		dev_err(rtd->dev, "failed to add first SPK map: %d\n", ret);
+	for_each_rtd_codec_dais(rtd, i, dai) {
+		if (strstr(dai->component->name_prefix, "-1"))
+			ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map, 2);
+		else if (strstr(dai->component->name_prefix, "-2"))
+			ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map + 2, 2);
+	}
 
 	return ret;
 }
 
-static int second_spk_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	const struct snd_soc_dapm_route *rt_amp_map;
-	char codec_name[CODEC_NAME_SIZE];
-	int ret;
-
-	rt_amp_map = get_codec_name_and_route(rtd, codec_name);
-
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map + 2, 2);
-	if (ret)
-		dev_err(rtd->dev, "failed to add second SPK map: %d\n", ret);
-
-	return ret;
-}
-
-static int all_spk_init(struct snd_soc_pcm_runtime *rtd)
-{
-	int ret;
-
-	ret = first_spk_init(rtd);
-	if (ret)
-		return ret;
-
-	return second_spk_init(rtd);
-}
-
 static int rt1308_i2s_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
@@ -317,8 +295,7 @@ int sof_sdw_rt_amp_init(struct snd_soc_card *card,
 		return 0;
 
 	info->amp_num++;
-	if (info->amp_num == 1)
-		dai_links->init = first_spk_init;
+	dai_links->init = rt_amp_spk_rtd_init;
 
 	if (info->amp_num == 2) {
 		sdw_dev1 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[0].name);
@@ -342,17 +319,6 @@ int sof_sdw_rt_amp_init(struct snd_soc_card *card,
 			return ret;
 		}
 		ctx->amp_dev2 = sdw_dev2;
-
-		/*
-		 * if two amps are in one dai link, the init function
-		 * in this dai link will be first set for the first speaker,
-		 * and it should be reset to initialize all speakers when
-		 * the second speaker is found.
-		 */
-		if (dai_links->init)
-			dai_links->init = all_spk_init;
-		else
-			dai_links->init = second_spk_init;
 	}
 
 	return 0;
-- 
2.40.1

