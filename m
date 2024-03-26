Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D3513C8F5
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469133; cv=none; b=j9bV9m42+FjApwl2Ymgi3ZIUqtm/2eGFqHvzfOPQA+oTjdR4Zu0Jy/u5OlhDOwSTaYk1h/ODgQNe43ebCrOYWfImCjmkdL98Ft3xvMJFpmcbBSPG2bzbQaKRaaV9salJzyaDZU+bSh88AuZWBlbT3UdrFjwxB+FNI/Koc6G2pPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469133; c=relaxed/simple;
	bh=BCGUnmel3nMig/J6x2o3QtQOnlesmw1kiPswkn4iK8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q3KJCfHgFOy/ounQbDCcAW8zRgVf236DuCGfW/x5/7sOKCcAD/CFaMmsgIQ+xN3S2KYM8m/ZS8pxUYo04OQcM58NsHGJc5Y6RLiNN196vnCA6ShXRIrhJzm6qaNe3SVCxh+HNjC6PAmS2bvkPnxdpvphcz9rPryfhkkg7jDo5Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJQE4tsl; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJQE4tsl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469127; x=1743005127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BCGUnmel3nMig/J6x2o3QtQOnlesmw1kiPswkn4iK8o=;
  b=NJQE4tsl99PGxZPlUa6YXp2DGf+iKXdRjWpqbYkoznOe6mE5mjhgm9AE
   W3DhCstgWoVI980LATQh1pahh6PteAZnSHCyzjk/NJGx4LnL9YiFVwRTQ
   tFmt625in5zwmERU/9mXAaCefnWPz1qOlOfmreJLk/OC44D1ajFZOFIpd
   d9tXJ9HUxB9xi1rtqe6qhZ74p1pH4vTyx7LdOdYZJxrocgZHT1BgJRYeX
   jODkTlMQtqPdmEkRGHtPRHofJgDpJUkbsC0v0hdBDibtgQuRIc+U9jBzl
   3KRo50tJuZjstMK1HwNn1t5A35Zq0hwuDP+VLhtMl2GSqXWGNrxOb0yje
   g==;
X-CSE-ConnectionGUID: 7idMwA+7S9iIJDRMl2S2mA==
X-CSE-MsgGUID: bqd1vU4ZSMe82ke5VlK+xQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260388"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260388"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482209"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:49 -0700
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
Subject: [PATCH 10/34] ASoC: Intel: sof_sdw: Factor out SSP DAI creation
Date: Tue, 26 Mar 2024 11:04:05 -0500
Message-Id: <20240326160429.13560-11-pierre-louis.bossart@linux.intel.com>
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

Factor out the creation of the SSP DAI links into a helper function. No
functional change.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 63 +++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 26 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index a12283d3e1cc..9980652c901b 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1625,6 +1625,40 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 	return 0;
 }
 
+static int create_ssp_dailinks(struct snd_soc_card *card,
+			       struct snd_soc_dai_link **dai_links, int *be_id,
+			       struct sof_sdw_codec_info *ssp_info,
+			       unsigned long ssp_mask)
+{
+	struct device *dev = card->dev;
+	int i, j = 0;
+	int ret;
+
+	for_each_set_bit(i, &ssp_mask, BITS_PER_TYPE(ssp_mask)) {
+		char *name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", i);
+		char *cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", i);
+		char *codec_name = devm_kasprintf(dev, GFP_KERNEL, "i2c-%s:0%d",
+						  ssp_info->acpi_id, j++);
+		int playback = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_PLAYBACK];
+		int capture = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_CAPTURE];
+
+		ret = init_simple_dai_link(dev, *dai_links, be_id, name,
+					   playback, capture, cpu_dai_name,
+					   codec_name, ssp_info->dais[0].dai_name,
+					   NULL, ssp_info->ops);
+		if (ret)
+			return ret;
+
+		ret = ssp_info->dais[0].init(card, NULL, *dai_links, ssp_info, 0);
+		if (ret < 0)
+			return ret;
+
+		(*dai_links)++;
+	}
+
+	return 0;
+}
+
 static int sof_card_dai_links_create(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
@@ -1780,36 +1814,13 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 
 SSP:
 	/* SSP */
-	if (!ssp_num)
-		goto DMIC;
-
-	j = 0;
-	for_each_set_bit(i, &ssp_mask, BITS_PER_TYPE(ssp_mask)) {
-		int playback, capture;
-
-		name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", i);
-		cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", i);
-		codec_name = devm_kasprintf(dev, GFP_KERNEL, "i2c-%s:0%d",
-					    ssp_info->acpi_id, j++);
-
-		playback = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_PLAYBACK];
-		capture = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_CAPTURE];
-
-		ret = init_simple_dai_link(dev, dai_links, &be_id, name,
-					   playback, capture, cpu_dai_name,
-					   codec_name, ssp_info->dais[0].dai_name,
-					   NULL, ssp_info->ops);
+	if (ssp_num) {
+		ret = create_ssp_dailinks(card, &dai_links, &be_id,
+					  ssp_info, ssp_mask);
 		if (ret)
 			return ret;
-
-		ret = ssp_info->dais[0].init(card, NULL, dai_links, ssp_info, 0);
-		if (ret < 0)
-			return ret;
-
-		dai_links++;
 	}
 
-DMIC:
 	/* dmic */
 	if (dmic_num > 0) {
 		if (ctx->ignore_pch_dmic) {
-- 
2.40.1

