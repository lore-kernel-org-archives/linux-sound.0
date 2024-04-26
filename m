Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0A62E639
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714144910; cv=none; b=rQk+Zft5LDcRKFrdI+jKnS4YzuY9y9wGtz2rwLysDAWw62OBg7+t3a0zccFpmsJleOfJLS6o9rA7m/m9StD01EjnnCvdbYGodgSJYrNGM5wAQuJCkhiDm6UdEedPtyURNNAHUvbgwBZW7nuc07XTM0RT2YNB0Luu0bWfV+MLRh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714144910; c=relaxed/simple;
	bh=/Q5k951MfI29ZAL5D5tRdzssa6I65w19r08aEgCu76Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qXublm0w01z7AMosXUWCWHUOrXFiQRv82ePcFlUFhoEejGqexXxUW32UTntCHohchtx+cyucj2Qr0qzI5WFo3vpY52nlTFK4sFFvh1fhZCkVut6vq9Z3uugUSr+dVM+szHihF2vFrG5fc2acw3z2o47/S12B/QMF2o2elgAk60A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gs+y0ziJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gs+y0ziJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144906; x=1745680906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/Q5k951MfI29ZAL5D5tRdzssa6I65w19r08aEgCu76Y=;
  b=Gs+y0ziJe9yU9GN9j3jFJc/VWj+eDdsODkkBKGNsffeX8caIg3sYI5P7
   /oz16F/awXR/kmmROgiQMDc7YwfjRh/q0Nv8tU1+5aLfC044CtGxWAn8/
   2DTw89oYZpG6VXqBDfm4wf3ONIo0t/ZEDILpboJNY8AESi/NjWc54vOYc
   dseCOxFLdG28TrCF2k0H1MY3lLN+8k97N/MFehoU1/xs6BaVk5PNGEkE5
   MzNdVtiis1QQWHhxH8usrxlRR20Kpo/p3EBzaRnrCCVjjG1Rc5Bcr9rBs
   pQmv1n+CCVAor5t66SNxPGhkiZudTG154ynM93TdLKMk4EswSdnC/LRXB
   Q==;
X-CSE-ConnectionGUID: hqBYqxljQlW/pVmKAxNSug==
X-CSE-MsgGUID: 6X6rL+BzR8iswfBY8SiUeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290638"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21290638"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:45 -0700
X-CSE-ConnectionGUID: RD49e2H4TWOHLoDjzogJVA==
X-CSE-MsgGUID: PRT5lEO8TNSBWTG8n0TS7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259035"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 10/12] ASoC: Intel: sof_sdw: Delay update of the codec_conf array
Date: Fri, 26 Apr 2024 10:21:21 -0500
Message-Id: <20240426152123.36284-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Move the population of the codec_conf array from endpoint parsing
time to link creation time. This is slightly cleaner as the
population is done whilst the DAI links are also being populated,
putting all population together. However, primarily this facilitates
allowing additional non-SoundWire devices to be easily added into
the array in future feature additions.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 48 ++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 86bbf1c66ce8..bf5f46a4c4aa 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1279,6 +1279,7 @@ struct sof_sdw_endpoint {
 
 	u32 link_mask;
 	const char *codec_name;
+	const char *name_prefix;
 
 	struct sof_sdw_codec_info *codec_info;
 	const struct sof_sdw_dai_info *dai_info;
@@ -1340,7 +1341,6 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
-	struct snd_soc_codec_conf *codec_conf = card->codec_conf;
 	const struct snd_soc_acpi_link_adr *adr_link;
 	struct sof_sdw_endpoint *sof_end = sof_ends;
 	int num_dais = 0;
@@ -1376,13 +1376,11 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 			if (!codec_name)
 				return -ENOMEM;
 
-			codec_conf->dlc.name = codec_name;
-			codec_conf->name_prefix = adr_dev->name_prefix;
-			codec_conf++;
-
 			dev_dbg(dev, "Adding prefix %s for %s\n",
 				adr_dev->name_prefix, codec_name);
 
+			sof_end->name_prefix = adr_dev->name_prefix;
+
 			for (j = 0; j < adr_dev->num_endpoints; j++) {
 				const struct snd_soc_acpi_endpoint *adr_end;
 				const struct sof_sdw_dai_info *dai_info;
@@ -1443,21 +1441,27 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 		ctx->append_dai_type |= (num_link_dailinks > 1);
 	}
 
-	WARN_ON(codec_conf != card->codec_conf + card->num_configs);
-
 	return num_dais;
 }
 
 static int create_sdw_dailink(struct snd_soc_card *card,
 			      struct sof_sdw_dailink *sof_dai,
 			      struct snd_soc_dai_link **dai_links,
-			      int *be_id)
+			      int *be_id, struct snd_soc_codec_conf **codec_conf)
 {
 	struct device *dev = card->dev;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct sof_sdw_endpoint *sof_end;
 	int stream;
 
+	list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
+		if (sof_end->name_prefix) {
+			(*codec_conf)->dlc.name = sof_end->codec_name;
+			(*codec_conf)->name_prefix = sof_end->name_prefix;
+			(*codec_conf)++;
+		}
+	}
+
 	for_each_pcm_streams(stream) {
 		static const char * const sdw_stream_name[] = {
 			"SDW%d-Playback",
@@ -1569,7 +1573,8 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 static int create_sdw_dailinks(struct snd_soc_card *card,
 			       struct snd_soc_dai_link **dai_links, int *be_id,
-			       struct sof_sdw_dailink *sof_dais)
+			       struct sof_sdw_dailink *sof_dais,
+			       struct snd_soc_codec_conf **codec_conf)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	int ret, i;
@@ -1581,7 +1586,8 @@ static int create_sdw_dailinks(struct snd_soc_card *card,
 	while (sof_dais->initialised) {
 		int current_be_id;
 
-		ret = create_sdw_dailink(card, sof_dais, dai_links, &current_be_id);
+		ret = create_sdw_dailink(card, sof_dais, dai_links,
+					 &current_be_id, codec_conf);
 		if (ret)
 			return ret;
 
@@ -1751,16 +1757,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		goto err_dai;
 	}
 
-	/* will be populated when acpi endpoints are parsed */
-	codec_conf = devm_kcalloc(dev, num_devs, sizeof(*codec_conf), GFP_KERNEL);
-	if (!codec_conf) {
-		ret = -ENOMEM;
-		goto err_end;
-	}
-
-	card->codec_conf = codec_conf;
-	card->num_configs = num_devs;
-
 	ret = parse_sdw_endpoints(card, sof_dais, sof_ends);
 	if (ret < 0)
 		goto err_end;
@@ -1798,6 +1794,12 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		sdw_be_num, ssp_num, dmic_num,
 		ctx->hdmi.idisp_codec ? hdmi_num : 0, bt_num);
 
+	codec_conf = devm_kcalloc(dev, num_devs, sizeof(*codec_conf), GFP_KERNEL);
+	if (!codec_conf) {
+		ret = -ENOMEM;
+		goto err_end;
+	}
+
 	/* allocate BE dailinks */
 	num_links = sdw_be_num + ssp_num + dmic_num + hdmi_num + bt_num;
 	dai_links = devm_kcalloc(dev, num_links, sizeof(*dai_links), GFP_KERNEL);
@@ -1806,12 +1808,15 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		goto err_end;
 	}
 
+	card->codec_conf = codec_conf;
+	card->num_configs = num_devs;
 	card->dai_link = dai_links;
 	card->num_links = num_links;
 
 	/* SDW */
 	if (sdw_be_num) {
-		ret = create_sdw_dailinks(card, &dai_links, &be_id, sof_dais);
+		ret = create_sdw_dailinks(card, &dai_links, &be_id,
+					  sof_dais, &codec_conf);
 		if (ret)
 			goto err_end;
 	}
@@ -1847,6 +1852,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 			goto err_end;
 	}
 
+	WARN_ON(codec_conf != card->codec_conf + card->num_configs);
 	WARN_ON(dai_links != card->dai_link + card->num_links);
 
 err_end:
-- 
2.40.1

