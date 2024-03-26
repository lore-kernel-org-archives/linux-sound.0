Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754E513CA91
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469137; cv=none; b=cUBcBqMbGIMRvoKG2s/8kVg6h48Mv0HvXlvyUXJ2NB0NiMCF6hoHO+oAPI/RfPvG+wenfsqgEfMCF6V5rU5BABxaYHHGwfP4EI3k5f0l7t1owcL9eq2NcY3YEyzAl0InReOUtdFfgiclG1wFaLbnIbJeBhFjv0ji80JeM0mZlFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469137; c=relaxed/simple;
	bh=vyvQeUPm2UJYX4QPwg3cG/elxp5BlodNhrVktU/ZmIs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iJ5Z0F56HmAj6Yyz10TX2UQv6qvD551A8yVoGddfqDWnHaN+mG9UmhO46mIrUC7M007W/GjDsTj2sKvZcAXrimkBM6QwZvuBlH5PgTyQVxDlymqauiq1gSpEuca8/FWvPJf7yY77f27I16h5qDs/Yh4gtL5QLGR3yqUL96/Pg8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQYWQtPE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQYWQtPE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469135; x=1743005135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vyvQeUPm2UJYX4QPwg3cG/elxp5BlodNhrVktU/ZmIs=;
  b=QQYWQtPEjog1WI3WO0YJ6lh8yoEdlvJdI1BssKyyQqGoFtK/MqkSecvw
   /9Fmg8mxnbcd2Puebbhx9EDDK08mYaRpoawjoZYDe/ICqE30CAeQrBeCM
   s245rSYbXmRXaNMwSJM1rTK1hq/Kb4bOWzZk+P2YNPzF2loIp2dWbhkyi
   j1+Sup43vaf6wn76YjG8HJlAZiD4OIR0ha27SsHOOVuWhjrKkE0POL2t0
   bXXkgcx+n/D7KsyVsSK+Ra1pmdhOqKk+mrEMSL70Shn5kZzl2+S6Lu9z+
   Vf0bLkA8u2lOx9lri400LROPmyITgmWO8hZRf/gjibvaAHiPykfwNYxQ4
   w==;
X-CSE-ConnectionGUID: eKnyNQp4QWCEdjof/Xk+2Q==
X-CSE-MsgGUID: jP/YZA4jTJ6sIiIA2M8BuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260462"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260462"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482317"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:55 -0700
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
Subject: [PATCH 19/34] ASoC: Intel: sof_sdw: Move counting and codec_conf to new parsing
Date: Tue, 26 Mar 2024 11:04:14 -0500
Message-Id: <20240326160429.13560-20-pierre-louis.bossart@linux.intel.com>
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

Use the output of the new snd_soc_acpi struct parsing for the purposes
of counting the number of SoundWire DAI links and physical devices
attached to the SoundWire. These counts are already returned by the
parser so those can just be used directly. But the population of the
codec_conf structures, is moved from the old parsing code over to the
new. As the two parsers currently co-exist it is better to not have
them both attempt to modify the same structures.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 124 ++++++-------------------------
 1 file changed, 22 insertions(+), 102 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 15bf8fbb3be9..0566ab843c2e 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1126,79 +1126,6 @@ static struct sof_sdw_codec_info *find_codec_info_dai(const char *dai_name,
 	return NULL;
 }
 
-/*
- * get BE dailink number and CPU DAI number based on sdw link adr.
- * Since some sdw slaves may be aggregated, the CPU DAI number
- * may be larger than the number of BE dailinks.
- */
-static int get_dailink_info(struct device *dev,
-			    const struct snd_soc_acpi_link_adr *adr_link,
-			    int *sdw_be_num, int *codecs_num)
-{
-	bool group_visited[SDW_MAX_GROUPS];
-	int i;
-	int j;
-
-	*sdw_be_num  = 0;
-
-	if (!adr_link)
-		return -EINVAL;
-
-	for (i = 0; i < SDW_MAX_GROUPS; i++)
-		group_visited[i] = false;
-
-	for (; adr_link->num_adr; adr_link++) {
-		const struct snd_soc_acpi_endpoint *endpoint;
-		struct sof_sdw_codec_info *codec_info;
-		int stream;
-		u64 adr;
-
-		/* make sure the link mask has a single bit set */
-		if (!is_power_of_2(adr_link->mask))
-			return -EINVAL;
-
-		for (i = 0; i < adr_link->num_adr; i++) {
-			adr = adr_link->adr_d[i].adr;
-			codec_info = find_codec_info_part(adr);
-			if (!codec_info)
-				return -EINVAL;
-
-			*codecs_num += codec_info->dai_num;
-
-			if (!adr_link->adr_d[i].name_prefix) {
-				dev_err(dev, "codec 0x%llx does not have a name prefix\n",
-					adr_link->adr_d[i].adr);
-				return -EINVAL;
-			}
-
-			endpoint = adr_link->adr_d[i].endpoints;
-			if (endpoint->aggregated && !endpoint->group_id) {
-				dev_err(dev, "invalid group id on link %x\n",
-					adr_link->mask);
-				return -EINVAL;
-			}
-
-			for (j = 0; j < codec_info->dai_num; j++) {
-				/* count DAI number for playback and capture */
-				for_each_pcm_streams(stream) {
-					if (!codec_info->dais[j].direction[stream])
-						continue;
-
-					/* count BE for each non-aggregated slave or group */
-					if (!endpoint->aggregated ||
-					    !group_visited[endpoint->group_id])
-						(*sdw_be_num)++;
-				}
-			}
-
-			if (endpoint->aggregated)
-				group_visited[endpoint->group_id] = true;
-		}
-	}
-
-	return 0;
-}
-
 static void init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links,
 			  int *be_id, char *name, int playback, int capture,
 			  struct snd_soc_dai_link_component *cpus, int cpus_num,
@@ -1528,6 +1455,7 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 	struct device *dev = card->dev;
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
+	struct snd_soc_codec_conf *codec_conf = card->codec_conf;
 	const struct snd_soc_acpi_link_adr *adr_link;
 	struct sof_sdw_endpoint *sof_end = sof_ends;
 	int num_dais = 0;
@@ -1559,6 +1487,13 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 			if (!codec_name)
 				return -ENOMEM;
 
+			codec_conf->dlc.name = codec_name;
+			codec_conf->name_prefix = adr_dev->name_prefix;
+			codec_conf++;
+
+			dev_dbg(dev, "Adding prefix %s for %s\n",
+				adr_dev->name_prefix, codec_name);
+
 			for (j = 0; j < adr_dev->num_endpoints; j++) {
 				const struct snd_soc_acpi_endpoint *adr_end;
 				const struct sof_sdw_dai_info *dai_info;
@@ -1614,13 +1549,14 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 		}
 	}
 
+	WARN_ON(codec_conf != card->codec_conf + card->num_configs);
+
 	return num_dais;
 }
 
 static int create_sdw_dailink(struct snd_soc_card *card,
 			      struct snd_soc_dai_link **dai_links,
 			      const struct snd_soc_acpi_link_adr *adr_link,
-			      struct snd_soc_codec_conf **codec_conf,
 			      int *be_id, int adr_index, int dai_index)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
@@ -1672,26 +1608,16 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 					 endpoints->group_id != group_id))
 				continue;
 
-			/* sanity check */
-			if (*codec_conf >= card->codec_conf + card->num_configs) {
-				dev_err(dev, "codec_conf array overflowed\n");
-				return -EINVAL;
-			}
-
 			ret = fill_sdw_codec_dlc(dev, adr_link_next,
 						 &codecs[codec_dlc_index],
 						 j, dai_index);
 			if (ret)
 				return ret;
 
-			(*codec_conf)->dlc = codecs[codec_dlc_index];
-			(*codec_conf)->name_prefix = adr_link_next->adr_d[j].name_prefix;
-
 			sdw_codec_ch_maps[codec_dlc_index].cpu = i;
 			sdw_codec_ch_maps[codec_dlc_index].codec = codec_dlc_index;
 
 			codec_dlc_index++;
-			(*codec_conf)++;
 		}
 		j = 0;
 
@@ -1913,7 +1839,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct sof_sdw_codec_info *ssp_info;
 	struct sof_sdw_endpoint *sof_ends;
 	struct sof_sdw_dailink *sof_dais;
-	int codec_conf_num = 0;
 	int num_devs = 0;
 	int num_ends = 0;
 	bool group_generated[SDW_MAX_GROUPS] = { };
@@ -1942,15 +1867,21 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		goto err_dai;
 	}
 
+	/* will be populated when acpi endpoints are parsed */
+	codec_conf = devm_kcalloc(dev, num_devs, sizeof(*codec_conf), GFP_KERNEL);
+	if (!codec_conf) {
+		ret = -ENOMEM;
+		goto err_end;
+	}
+
+	card->codec_conf = codec_conf;
+	card->num_configs = num_devs;
+
 	ret = parse_sdw_endpoints(card, sof_dais, sof_ends);
 	if (ret < 0)
 		goto err_end;
 
-	ret = get_dailink_info(dev, adr_link, &sdw_be_num, &codec_conf_num);
-	if (ret < 0) {
-		dev_err(dev, "failed to get sdw link info %d\n", ret);
-		goto err_end;
-	}
+	sdw_be_num = ret;
 
 	/*
 	 * on generic tgl platform, I2S or sdw mode is supported
@@ -1991,18 +1922,8 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		goto err_end;
 	}
 
-	/* allocate codec conf, will be populated when dailinks are created */
-	codec_conf = devm_kcalloc(dev, codec_conf_num, sizeof(*codec_conf),
-				  GFP_KERNEL);
-	if (!codec_conf) {
-		ret = -ENOMEM;
-		goto err_end;
-	}
-
 	card->dai_link = dai_links;
 	card->num_links = num_links;
-	card->codec_conf = codec_conf;
-	card->num_configs = codec_conf_num;
 
 	/* SDW */
 	if (!sdw_be_num)
@@ -2065,8 +1986,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 				int current_be_id;
 
 				ret = create_sdw_dailink(card, &dai_links, adr_link,
-							 &codec_conf, &current_be_id,
-							 i, j);
+							 &current_be_id, i, j);
 				if (ret < 0) {
 					dev_err(dev,
 						"failed to create dai link %d on 0x%x\n",
-- 
2.40.1

