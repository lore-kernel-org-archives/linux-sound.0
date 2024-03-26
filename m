Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7547E13C9B0
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469137; cv=none; b=TeVS2SaGqXc9gpPUhnOXAIgZASuQR8l4pOaXswlNejmAN4RMUpv3oBgbmmVXdzZoECGx3jiBywXMQfRHOYCd1R9UTbqmRCzof0QCxboyWwO63q9uyEy51h3pADgRXlKcedAQ8YDmkZRD9/GCm/CiDxtc4PGLK7DLHOZqvv30V10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469137; c=relaxed/simple;
	bh=OyHrtxYt0pTtOYP7K21+cASdvDPSHwyCSUM4YaLh4ok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=By0n1YCmM2Ur02hGagi9Rd8GjM7HXCwPWZN4eZct44c7B33HIZnfdK04vDKYPrdWo144DsY3oge+qiJ1aR94C6sh2GgsT52NPnQ5Qa8K8f7Qgg+f0Mm18Hh8DCbtaPdMUMDSfTYpiNhFknLbKAy7kjj/mcmwV3WFncYWIQ/wPEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kblz1Uzr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kblz1Uzr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469135; x=1743005135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OyHrtxYt0pTtOYP7K21+cASdvDPSHwyCSUM4YaLh4ok=;
  b=kblz1UzrYFwafVlcoiDEYfuXMlnpBi5dVTca6L/IHLB63sqkR8J2OcXd
   FGOM7Rhpot17oUs0b4XQjvhKy/WYfkvvAmd9m4HrTVZBXu4fUPFxhdeEF
   RtFeOnoxomQenRDMHmiFymfylEtkfag9kGy6ZWWInC1/bori4ZNNnYaCA
   5wFcw7GKrU2SncoVSiEtVDw5kXtr2uXKloIZeKSHI11UsjAgYPUKhn/Ly
   gJ0aYJvSNjgC6hXA3yOVKTJLUBmFXYk15wlJIxHqT2aLD1R6JFow9MbwV
   XABJH0gW5KPY/dOHRkff0t03xrmNLsRb/CqfdDgm9l6VkS7TUTPNNJ9yu
   A==;
X-CSE-ConnectionGUID: z27FsjkMSDmKJyo9FXlW7g==
X-CSE-MsgGUID: nhGYxAzwTW6PI7+/U72B2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260453"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260453"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482299"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:54 -0700
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
Subject: [PATCH 18/34] ASoC: Intel: sof-sdw: Add new code for parsing the snd_soc_acpi structs
Date: Tue, 26 Mar 2024 11:04:13 -0500
Message-Id: <20240326160429.13560-19-pierre-louis.bossart@linux.intel.com>
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

The current machine driver code has a lot of loops parsing through
the ACPI structs (snd_soc_acpi_link_adr, snd_soc_acpi_adr_device,
snd_soc_acpi_endpoint), this makes it hard to understand exactly
what information is being extracted and for what purposes. As well
as being slightly inefficient, as the same information is looked
up multiple times. There are also some issues with the handling
of multiple endpoints on a single device, only the first of the
snd_soc_acpi_endpoint structures is currently fully processed by the
driver. This means doing things like aggregating the second endpoint
on a device with another device are not currently possible.

Add new parsing code that will count the devices and endpoints, parse
them into an intermediate datastructure, and then use that to create
the DAI links. This patch does not actually utilise the results of
the parsing, items will be moved across in the following patches.

This parsing is based around two new structures which are temporarily
allocated whilst parsing. Firstly, sof_sdw_endpoint, which represents
a specific endpoint for audio on a device and is more or less directly
equivalent to snd_soc_acpi_endpoint. Secondly, sof_sdw_dailink
which represents a DAI link and contains a linked list of one or
more sof_sdw_endpoints. A single trip through the snd_soc_acpi data
structures is used to populate these.

One important point to note here is the use of the num field in
snd_soc_acpi_endpoint to address sof_sdw_dai_info array in the
sof_sdw_codec_info struct. This expects a one to one mapping between
endpoints on a device and dai infos. It would be fine for a specific
system to not specify an endpoint for all of the dai infos available,
but two endpoints mapping to the same dai info would make not sense.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 220 +++++++++++++++++++++++++++++--
 1 file changed, 206 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index fdedc32291f0..15bf8fbb3be9 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1462,8 +1462,161 @@ static int sof_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
+struct sof_sdw_endpoint {
+	struct list_head list;
+
+	u32 link_mask;
+	const char *codec_name;
+
+	const struct snd_soc_acpi_link_adr *adr_link;
+	struct sof_sdw_codec_info *codec_info;
+	const struct sof_sdw_dai_info *dai_info;
+};
+
+struct sof_sdw_dailink {
+	bool initialised;
+
+	u8 group_id;
+	u32 link_mask[SNDRV_PCM_STREAM_LAST + 1];
+	int num_devs[SNDRV_PCM_STREAM_LAST + 1];
+	struct list_head endpoints;
+};
+
 static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
 
+static int count_sdw_endpoints(struct snd_soc_card *card, int *num_devs, int *num_ends)
+{
+	struct device *dev = card->dev;
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
+	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
+	const struct snd_soc_acpi_link_adr *adr_link;
+	int i;
+
+	for (adr_link = mach_params->links; adr_link->num_adr; adr_link++) {
+		*num_devs += adr_link->num_adr;
+
+		for (i = 0; i < adr_link->num_adr; i++)
+			*num_ends += adr_link->adr_d[i].num_endpoints;
+	}
+
+	dev_dbg(dev, "Found %d devices with %d endpoints\n", *num_devs, *num_ends);
+
+	return 0;
+}
+
+static struct sof_sdw_dailink *find_dailink(struct sof_sdw_dailink *dailinks,
+					    const struct snd_soc_acpi_endpoint *new)
+{
+	while (dailinks->initialised) {
+		if (new->aggregated && dailinks->group_id == new->group_id)
+			return dailinks;
+
+		dailinks++;
+	}
+
+	INIT_LIST_HEAD(&dailinks->endpoints);
+	dailinks->group_id = new->group_id;
+	dailinks->initialised = true;
+
+	return dailinks;
+}
+
+static int parse_sdw_endpoints(struct snd_soc_card *card,
+			       struct sof_sdw_dailink *sof_dais,
+			       struct sof_sdw_endpoint *sof_ends)
+{
+	struct device *dev = card->dev;
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
+	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
+	const struct snd_soc_acpi_link_adr *adr_link;
+	struct sof_sdw_endpoint *sof_end = sof_ends;
+	int num_dais = 0;
+	int i, j;
+
+	for (adr_link = mach_params->links; adr_link->num_adr; adr_link++) {
+		if (!is_power_of_2(adr_link->mask)) {
+			dev_err(dev, "link with multiple mask bits: 0x%x\n",
+				adr_link->mask);
+			return -EINVAL;
+		}
+
+		for (i = 0; i < adr_link->num_adr; i++) {
+			const struct snd_soc_acpi_adr_device *adr_dev = &adr_link->adr_d[i];
+			struct sof_sdw_codec_info *codec_info;
+			const char *codec_name;
+
+			if (!adr_dev->name_prefix) {
+				dev_err(dev, "codec 0x%llx does not have a name prefix\n",
+					adr_dev->adr);
+				return -EINVAL;
+			}
+
+			codec_info = find_codec_info_part(adr_dev->adr);
+			if (!codec_info)
+				return -EINVAL;
+
+			codec_name = get_codec_name(dev, codec_info, adr_link, i);
+			if (!codec_name)
+				return -ENOMEM;
+
+			for (j = 0; j < adr_dev->num_endpoints; j++) {
+				const struct snd_soc_acpi_endpoint *adr_end;
+				const struct sof_sdw_dai_info *dai_info;
+				struct sof_sdw_dailink *sof_dai;
+				int stream;
+
+				adr_end = &adr_dev->endpoints[j];
+				dai_info = &codec_info->dais[adr_end->num];
+				sof_dai = find_dailink(sof_dais, adr_end);
+
+				dev_dbg(dev,
+					"Add dev: %d, 0x%llx end: %d, %s, %c/%c to %s: %d\n",
+					ffs(adr_link->mask) - 1, adr_dev->adr,
+					adr_end->num, type_strings[dai_info->dai_type],
+					dai_info->direction[SNDRV_PCM_STREAM_PLAYBACK] ? 'P' : '-',
+					dai_info->direction[SNDRV_PCM_STREAM_CAPTURE] ? 'C' : '-',
+					adr_end->aggregated ? "group" : "solo",
+					adr_end->group_id);
+
+				if (adr_end->num >= codec_info->dai_num) {
+					dev_err(dev,
+						"%d is too many endpoints for codec: 0x%x\n",
+						adr_end->num, codec_info->part_id);
+					return -EINVAL;
+				}
+
+				for_each_pcm_streams(stream) {
+					if (dai_info->direction[stream] &&
+					    dai_info->dailink[stream] < 0) {
+						dev_err(dev,
+							"Invalid dailink id %d for codec: 0x%x\n",
+							dai_info->dailink[stream],
+							codec_info->part_id);
+						return -EINVAL;
+					}
+
+					if (dai_info->direction[stream]) {
+						num_dais += !sof_dai->num_devs[stream];
+						sof_dai->num_devs[stream]++;
+						sof_dai->link_mask[stream] |= adr_link->mask;
+					}
+				}
+
+				list_add_tail(&sof_end->list, &sof_dai->endpoints);
+
+				sof_end->link_mask = adr_link->mask;
+				sof_end->codec_name = codec_name;
+				sof_end->adr_link = adr_link;
+				sof_end->codec_info = codec_info;
+				sof_end->dai_info = dai_info;
+				sof_end++;
+			}
+		}
+	}
+
+	return num_dais;
+}
+
 static int create_sdw_dailink(struct snd_soc_card *card,
 			      struct snd_soc_dai_link **dai_links,
 			      const struct snd_soc_acpi_link_adr *adr_link,
@@ -1758,7 +1911,11 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct snd_soc_codec_conf *codec_conf;
 	struct sof_sdw_codec_info *codec_info;
 	struct sof_sdw_codec_info *ssp_info;
+	struct sof_sdw_endpoint *sof_ends;
+	struct sof_sdw_dailink *sof_dais;
 	int codec_conf_num = 0;
+	int num_devs = 0;
+	int num_ends = 0;
 	bool group_generated[SDW_MAX_GROUPS] = { };
 	struct snd_soc_dai_link *dai_links;
 	int num_links;
@@ -1767,10 +1924,32 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	unsigned long ssp_mask;
 	int ret;
 
+	ret = count_sdw_endpoints(card, &num_devs, &num_ends);
+	if (ret < 0) {
+		dev_err(dev, "failed to count devices/endpoints: %d\n", ret);
+		return ret;
+	}
+
+	/* One per DAI link, worst case is a DAI link for every endpoint */
+	sof_dais = kcalloc(num_ends, sizeof(*sof_dais), GFP_KERNEL);
+	if (!sof_dais)
+		return -ENOMEM;
+
+	/* One per endpoint, ie. each DAI on each codec/amp */
+	sof_ends = kcalloc(num_ends, sizeof(*sof_ends), GFP_KERNEL);
+	if (!sof_ends) {
+		ret = -ENOMEM;
+		goto err_dai;
+	}
+
+	ret = parse_sdw_endpoints(card, sof_dais, sof_ends);
+	if (ret < 0)
+		goto err_end;
+
 	ret = get_dailink_info(dev, adr_link, &sdw_be_num, &codec_conf_num);
 	if (ret < 0) {
 		dev_err(dev, "failed to get sdw link info %d\n", ret);
-		return ret;
+		goto err_end;
 	}
 
 	/*
@@ -1807,14 +1986,18 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	/* allocate BE dailinks */
 	num_links = sdw_be_num + ssp_num + dmic_num + hdmi_num + bt_num;
 	dai_links = devm_kcalloc(dev, num_links, sizeof(*dai_links), GFP_KERNEL);
-	if (!dai_links)
-		return -ENOMEM;
+	if (!dai_links) {
+		ret = -ENOMEM;
+		goto err_end;
+	}
 
 	/* allocate codec conf, will be populated when dailinks are created */
 	codec_conf = devm_kcalloc(dev, codec_conf_num, sizeof(*codec_conf),
 				  GFP_KERNEL);
-	if (!codec_conf)
-		return -ENOMEM;
+	if (!codec_conf) {
+		ret = -ENOMEM;
+		goto err_end;
+	}
 
 	card->dai_link = dai_links;
 	card->num_links = num_links;
@@ -1838,8 +2021,10 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		for (i = 0; i < adr_link->num_adr; i++) {
 			/* find codec info to get dai_num */
 			codec_info = find_codec_info_part(adr_link->adr_d[i].adr);
-			if (!codec_info)
-				return -EINVAL;
+			if (!codec_info) {
+				ret = -EINVAL;
+				goto err_end;
+			}
 			if (codec_info->dai_num > 1) {
 				ctx->append_dai_type = true;
 				goto out;
@@ -1871,8 +2056,10 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 
 			/* find codec info to get dai_num */
 			codec_info = find_codec_info_part(adr_link->adr_d[i].adr);
-			if (!codec_info)
-				return -EINVAL;
+			if (!codec_info) {
+				ret = -EINVAL;
+				goto err_end;
+			}
 
 			for (j = 0; j < codec_info->dai_num ; j++) {
 				int current_be_id;
@@ -1903,7 +2090,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		ret = create_ssp_dailinks(card, &dai_links, &be_id,
 					  ssp_info, ssp_mask);
 		if (ret)
-			return ret;
+			goto err_end;
 	}
 
 	/* dmic */
@@ -1913,25 +2100,30 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		} else {
 			ret = create_dmic_dailinks(card, &dai_links, &be_id);
 			if (ret)
-				return ret;
+				goto err_end;
 		}
 	}
 
 	/* HDMI */
 	ret = create_hdmi_dailinks(card, &dai_links, &be_id, hdmi_num);
 	if (ret)
-		return ret;
+		goto err_end;
 
 	/* BT */
 	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
 		ret = create_bt_dailinks(card, &dai_links, &be_id);
 		if (ret)
-			return ret;
+			goto err_end;
 	}
 
 	WARN_ON(dai_links != card->dai_link + card->num_links);
 
-	return 0;
+err_end:
+	kfree(sof_ends);
+err_dai:
+	kfree(sof_dais);
+
+	return ret;
 }
 
 static int sof_sdw_card_late_probe(struct snd_soc_card *card)
-- 
2.40.1

