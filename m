Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48B3265284
	for <linux-sound@vger.kernel.org>; Wed, 25 Jun 2025 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860317; cv=none; b=MGAbTCGX4oum3vtX6B/2IL9dlwy/xAvJH+UV984DfOa+Z5pw7ib55NcwhlWqpoqD68TmAGHU2Pf2PnCQi6mLjsKTC4CPX3BqAlrUhO4Avw8DzcBuhcrFwyJ3pQjNK8G6mj+FUe0HwGil7zFl96KBu638FtSahuAT7mrzyi0xVr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860317; c=relaxed/simple;
	bh=SEY+NcdrCF8h8dJhllpS2VjNXNWLdDyGjMJ7xEUSqHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZgopmDc7G7X+KP9GrdTcVhUsQlVuVI5qCw3p3JhN6CZal5tLBrcb/5/ZOnc6Y909ccfJn7R5+eL61RA0+pBmQ6v41z2uQYJfjo63Wnhjparx3EidC+Gw75+jFzA9peMbVp32P/fr4Dh/FA6jPn+V/WtkZi/JRO3LJSkN5hPijdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QvvxzC7N; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QvvxzC7N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750860314; x=1782396314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SEY+NcdrCF8h8dJhllpS2VjNXNWLdDyGjMJ7xEUSqHU=;
  b=QvvxzC7N/70btqG+wpnmrqy15mpY/0YJZC5j0Hy7UeDpmwowCsAp9t4Q
   saIjHlISsSdTd09E54+3Y7pQK7GwfDQ1uLNLEKhRpVc7QCsJ42mBlrnK7
   /wNTGuRQRn+2HnlUJuXCjZ+zJJoWhXfRmcgi3/PYQ/zjfXFOnhJM0UxyP
   nfs/l9RW+3ZTORVtGA9HuCYBk5iY7UhB+OQvXi/Si7qHJf25LN0VS/eA3
   KbJdrX/EWKEybaOKNd1Ubp4xVkCJxMF1mxfdUaRDGesoxRkeO0y+/QNnH
   lhKs/XIl/l7WY6pFJtvveSKCFa3YRt9cqgWU1AW7KsRiOQvjVTF4GwSRm
   Q==;
X-CSE-ConnectionGUID: YvYMZxLeT+qHXCThxzv6gA==
X-CSE-MsgGUID: /m5vT63QRd2rW9pQNMKYkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52248819"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52248819"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 07:04:43 -0700
X-CSE-ConnectionGUID: 595/I+uGS2CNW0pX6T9DiQ==
X-CSE-MsgGUID: TcKaIWHRQA+DTtQuC71Itw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="175873503"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 07:04:42 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 2/2] ASoC: sdw_utils: generate combined spk components string
Date: Wed, 25 Jun 2025 22:04:29 +0800
Message-ID: <20250625140430.311865-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250625140430.311865-1-yung-chuan.liao@linux.intel.com>
References: <20250625140430.311865-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The suggestion from UCM for 2 speaker components is using 1 "spk" tag
with 2 component names. Like "spk:rt722+rt1320". The commit removes the
creation of the "spk" components in each rtd_init callback and creat the
string in asoc_sdw_rtd_init().

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/sdw_utils/soc_sdw_cs_amp.c     | 10 ---------
 sound/soc/sdw_utils/soc_sdw_maxim.c      |  9 --------
 sound/soc/sdw_utils/soc_sdw_rt_amp.c     |  6 ------
 sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c |  7 -------
 sound/soc/sdw_utils/soc_sdw_utils.c      | 26 ++++++++++++++++++++++++
 5 files changed, 26 insertions(+), 32 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_cs_amp.c b/sound/soc/sdw_utils/soc_sdw_cs_amp.c
index 35b550bcd4de..520ea36c63ee 100644
--- a/sound/soc/sdw_utils/soc_sdw_cs_amp.c
+++ b/sound/soc/sdw_utils/soc_sdw_cs_amp.c
@@ -14,7 +14,6 @@
 #include <sound/soc-dai.h>
 #include <sound/soc_sdw_utils.h>
 
-#define CODEC_NAME_SIZE	8
 #define CS_AMP_CHANNELS_PER_AMP	4
 #define CS35L56_SPK_VOLUME_0DB 400 /* 0dB Max */
 
@@ -38,21 +37,12 @@ EXPORT_SYMBOL_NS(asoc_sdw_cs35l56_volume_limit, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
-	const char *dai_name = rtd->dai_link->codecs->dai_name;
 	struct snd_soc_card *card = rtd->card;
-	char codec_name[CODEC_NAME_SIZE];
 	char widget_name[16];
 	struct snd_soc_dapm_route route = { "Speaker", NULL, widget_name };
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
-	snprintf(codec_name, CODEC_NAME_SIZE, "%s", dai_name);
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s spk:%s",
-					  card->components, codec_name);
-	if (!card->components)
-		return -ENOMEM;
-
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		if (!strstr(codec_dai->name, "cs35l56"))
 			continue;
diff --git a/sound/soc/sdw_utils/soc_sdw_maxim.c b/sound/soc/sdw_utils/soc_sdw_maxim.c
index 5df8d9cae60c..8f9d1ed0725b 100644
--- a/sound/soc/sdw_utils/soc_sdw_maxim.c
+++ b/sound/soc/sdw_utils/soc_sdw_maxim.c
@@ -28,15 +28,6 @@ int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_
 	struct snd_soc_card *card = rtd->card;
 	int ret;
 
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s spk:mx%04x",
-					  card->components, maxim_part_id);
-	if (!card->components)
-		return -ENOMEM;
-
-	dev_dbg(card->dev, "soundwire maxim card components assigned : %s\n",
-		card->components);
-
 	ret = snd_soc_dapm_add_routes(&card->dapm, max_98373_dapm_routes, 2);
 	if (ret)
 		dev_err(rtd->dev, "failed to add first SPK map: %d\n", ret);
diff --git a/sound/soc/sdw_utils/soc_sdw_rt_amp.c b/sound/soc/sdw_utils/soc_sdw_rt_amp.c
index 83c2368170cb..76ee24b8eee4 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_amp.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_amp.c
@@ -195,12 +195,6 @@ int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc
 
 	rt_amp_map = get_codec_name_and_route(dai, codec_name);
 
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s spk:%s",
-					  card->components, codec_name);
-	if (!card->components)
-		return -ENOMEM;
-
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		if (strstr(codec_dai->component->name_prefix, "-1"))
 			ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map, 2);
diff --git a/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c b/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
index 0161b14297d5..224b58de9084 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
@@ -73,13 +73,6 @@ int asoc_sdw_rt_mf_sdca_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd
 		return -EINVAL;
 	}
 
-	/* Update card components */
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s spk:%s",
-					  card->components, codec_name);
-	if (!card->components)
-		return -ENOMEM;
-
 	/* Add routes */
 	ret = snd_soc_dapm_add_routes(&card->dapm, route_map->route_map, route_map->route_size);
 	if (ret)
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 2e8820137c69..a744ca019378 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -740,6 +740,7 @@ int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card = rtd->card;
 	struct asoc_sdw_codec_info *codec_info;
 	struct snd_soc_dai *dai;
+	const char *spk_components="";
 	int dai_index;
 	int ret;
 	int i;
@@ -792,7 +793,32 @@ int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 			if (ret)
 				return ret;
 		}
+
+		/* Generate the spk component string for card->components string */
+		if (codec_info->dais[dai_index].dai_type == SOC_SDW_DAI_TYPE_AMP &&
+		    codec_info->dais[dai_index].component_name) {
+			if (strlen (spk_components) == 0)
+				spk_components =
+					devm_kasprintf(card->dev, GFP_KERNEL, "%s",
+						       codec_info->dais[dai_index].component_name);
+			else
+				/* Append component name to spk_components */
+				spk_components =
+					devm_kasprintf(card->dev, GFP_KERNEL,
+						       "%s+%s", spk_components,
+						       codec_info->dais[dai_index].component_name);
+		}
+
 		codec_info->dais[dai_index].rtd_init_done = true;
+
+	}
+
+	if (strlen (spk_components) > 0) {
+		/* Update card components for speaker components */
+		card->components = devm_kasprintf(card->dev, GFP_KERNEL, "%s spk:%s",
+						  card->components, spk_components);
+		if (!card->components)
+			return -ENOMEM;
 	}
 
 	return 0;
-- 
2.43.0

