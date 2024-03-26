Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A372713C8FC
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469129; cv=none; b=AEqW/Jb5SnH/P1UlKBNqlMbJkWGy6o6dvYF84aw7h/xBGUxDcHSJchuoS7+ouROHuuLd1tPz94sgvY6aNOzmVY4nYyZNAQ8XHCZJ7S/tzb4kfTDb/CLVmtEEbo7msdtO8A7LZI+yMPvJz4HNlQeGYJP0qQV9TALfjIb4RtsBBB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469129; c=relaxed/simple;
	bh=IC2RlwDvtxL8qrJSQldmoJ23HS9asJZ5NZo+X58uK6k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UYCynJ9pm4cXZM833MA/qZV3TGwEq2yrdNr8M4aA9Ao7AsDQfuCXlwGZTGlEWnx/o5WT3ir8wD5JnUzDXZb6KbrnQPGBbZMdbgoeR4U7XrGK3NSrWHSTvAgWV4SWdGKGta+5wSR/kz9moQa1NU0CjYeghjdnt9yYHCuc82S77c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KofSkngc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KofSkngc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469125; x=1743005125;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IC2RlwDvtxL8qrJSQldmoJ23HS9asJZ5NZo+X58uK6k=;
  b=KofSkngcvszzvhMe1Rjq4CWyan9HPMuqjziVn1wM0y0kamPN87Yi+Aw1
   oJWglVaCjSzmaTv6ih+hmbhriYdpQA43JqBNiUO8t+jK9G+s+w3qIrLtf
   hxvrP1M4mThF+1ssCGYvK0AY7l3cFqXuRaveN/UKChDmbw22tarsxv/7R
   vi808mHToTUdwUCk51afD/KDkCjKqDREzKybkH/B4FKf85rQxXMx4jml/
   a/Xz920TsBkMy0Xar5+XeqfPW4p5XyaLqd6K0fdp37nsdyiap+xwHI52g
   f2YxTf1GE7keAcp63cdg2plHt10w8+7WnEQoGpCQZ7knwfAexMSd/1i8W
   w==;
X-CSE-ConnectionGUID: kMWGQL1mR7uWvufGkSxc+w==
X-CSE-MsgGUID: +MoJgk5cQHeLKWQnKBXuwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260374"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260374"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482188"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:47 -0700
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
Subject: [PATCH 08/34] ASoC: Intel: sof_sdw: Only pass dai_link pointer around
Date: Tue, 26 Mar 2024 11:04:03 -0500
Message-Id: <20240326160429.13560-9-pierre-louis.bossart@linux.intel.com>
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

Rather than passing around a pointer to the dai_link array and
an index into this array, simply pass a pointer to the current
dai_link. Also move the DAI link pointer sanity check to the end
of the DAI link creation, and change it to a warn on. This check
should only be hit if there is a serious bug in the machine driver,
so checking it on each iteration is excessive.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 62 +++++++++++++++-----------------
 1 file changed, 29 insertions(+), 33 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 5557db68a002..0ffa6e36dbed 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1459,8 +1459,8 @@ static int sof_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 
 static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
 
-static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
-			      struct snd_soc_dai_link *dai_links, int sdw_be_num,
+static int create_sdw_dailink(struct snd_soc_card *card,
+			      struct snd_soc_dai_link **dai_links,
 			      const struct snd_soc_acpi_link_adr *adr_link,
 			      struct snd_soc_codec_conf **codec_conf,
 			      int *be_id, int adr_index, int dai_index)
@@ -1597,35 +1597,28 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			cpus[k].dai_name = cpu_name;
 		}
 
-		/*
-		 * We create sdw dai links at first stage, so link index should
-		 * not be larger than sdw_be_num
-		 */
-		if (*link_index >= sdw_be_num) {
-			dev_err(dev, "invalid dai link index %d\n", *link_index);
-			return -EINVAL;
-		}
-
 		playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
 		capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
 
-		init_dai_link(dev, dai_links + *link_index, be_id, name,
-			      playback, capture, cpus, cpu_dai_num, codecs, codec_num,
+		init_dai_link(dev, *dai_links, be_id, name, playback, capture,
+			      cpus, cpu_dai_num, codecs, codec_num,
 			      sof_sdw_rtd_init, &sdw_ops);
 
 		/*
 		 * SoundWire DAILINKs use 'stream' functions and Bank Switch operations
 		 * based on wait_for_completion(), tag them as 'nonatomic'.
 		 */
-		dai_links[*link_index].nonatomic = true;
-		dai_links[*link_index].ch_maps = sdw_codec_ch_maps;
+		(*dai_links)->nonatomic = true;
+		(*dai_links)->ch_maps = sdw_codec_ch_maps;
 
-		ret = set_codec_init_func(card, adr_link, dai_links + (*link_index)++,
+		ret = set_codec_init_func(card, adr_link, *dai_links,
 					  playback, group_id, adr_index, dai_index);
 		if (ret < 0) {
 			dev_err(dev, "failed to init codec 0x%x\n", codec_info->part_id);
 			return ret;
 		}
+
+		(*dai_links)++;
 	}
 
 	return 0;
@@ -1646,7 +1639,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	int codec_conf_num = 0;
 	bool group_generated[SDW_MAX_GROUPS] = { };
 	struct snd_soc_dai_link *dai_links;
-	int num_links, link_index = 0;
+	int num_links;
 	char *name, *cpu_dai_name;
 	char *codec_name, *codec_dai_name;
 	int i, j, be_id = 0;
@@ -1703,6 +1696,8 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	if (!codec_conf)
 		return -ENOMEM;
 
+	card->dai_link = dai_links;
+	card->num_links = num_links;
 	card->codec_conf = codec_conf;
 	card->num_configs = codec_conf_num;
 
@@ -1762,12 +1757,13 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 			for (j = 0; j < codec_info->dai_num ; j++) {
 				int current_be_id;
 
-				ret = create_sdw_dailink(card, &link_index, dai_links,
-							 sdw_be_num, adr_link,
+				ret = create_sdw_dailink(card, &dai_links, adr_link,
 							 &codec_conf, &current_be_id,
 							 i, j);
 				if (ret < 0) {
-					dev_err(dev, "failed to create dai link %d\n", link_index);
+					dev_err(dev,
+						"failed to create dai link %d on 0x%x\n",
+						j, codec_info->part_id);
 					return ret;
 				}
 
@@ -1800,19 +1796,18 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		playback = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_PLAYBACK];
 		capture = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_CAPTURE];
 
-		ret = init_simple_dai_link(dev, dai_links + link_index, &be_id, name,
+		ret = init_simple_dai_link(dev, dai_links, &be_id, name,
 					   playback, capture, cpu_dai_name,
 					   codec_name, ssp_info->dais[0].dai_name,
 					   NULL, ssp_info->ops);
 		if (ret)
 			return ret;
 
-		ret = ssp_info->dais[0].init(card, NULL, dai_links + link_index,
-					     ssp_info, 0);
+		ret = ssp_info->dais[0].init(card, NULL, dai_links, ssp_info, 0);
 		if (ret < 0)
 			return ret;
 
-		link_index++;
+		dai_links++;
 	}
 
 DMIC:
@@ -1823,16 +1818,16 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 			goto HDMI;
 		}
 
-		ret = init_simple_dai_link(dev, dai_links + link_index, &be_id, "dmic01",
+		ret = init_simple_dai_link(dev, dai_links, &be_id, "dmic01",
 					   0, 1, // DMIC only supports capture
 					   "DMIC01 Pin", "dmic-codec", "dmic-hifi",
 					   sof_sdw_dmic_init, NULL);
 		if (ret)
 			return ret;
 
-		link_index++;
+		dai_links++;
 
-		ret = init_simple_dai_link(dev, dai_links + link_index, &be_id, "dmic16k",
+		ret = init_simple_dai_link(dev, dai_links, &be_id, "dmic16k",
 					   0, 1, // DMIC only supports capture
 					   "DMIC16k Pin", "dmic-codec", "dmic-hifi",
 					   /* don't call sof_sdw_dmic_init() twice */
@@ -1840,7 +1835,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		if (ret)
 			return ret;
 
-		link_index++;
+		dai_links++;
 	}
 
 HDMI:
@@ -1858,14 +1853,14 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 			codec_dai_name = "snd-soc-dummy-dai";
 		}
 
-		ret = init_simple_dai_link(dev, dai_links + link_index, &be_id, name,
+		ret = init_simple_dai_link(dev, dai_links, &be_id, name,
 					   1, 0, // HDMI only supports playback
 					   cpu_dai_name, codec_name, codec_dai_name,
 					   i == 0 ? sof_sdw_hdmi_init : NULL, NULL);
 		if (ret)
 			return ret;
 
-		link_index++;
+		dai_links++;
 	}
 
 	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
@@ -1875,15 +1870,16 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
 		cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", port);
 
-		ret = init_simple_dai_link(dev, dai_links + link_index, &be_id, name,
+		ret = init_simple_dai_link(dev, dai_links, &be_id, name,
 					   1, 1, cpu_dai_name, snd_soc_dummy_dlc.name,
 					   snd_soc_dummy_dlc.dai_name, NULL, NULL);
 		if (ret)
 			return ret;
+
+		dai_links++;
 	}
 
-	card->dai_link = dai_links;
-	card->num_links = num_links;
+	WARN_ON(dai_links != card->dai_link + card->num_links);
 
 	return 0;
 }
-- 
2.40.1

