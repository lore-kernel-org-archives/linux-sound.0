Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED823D98E
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469121; cv=none; b=JX8VO7nb/yKXBhD/jWaBbrgvIaTFiGSdI+fz59XppIQWwUnRpiSxrjRgn8Sju6d+gIxA3N5AC/2LhoXhsKQDi1xAY5HdkUScLQ0vncnHYdS7T5XLDUDt3FDZKoId7atYyx+Tm4o0btkqWWWHtma4iFCxf6IpQ4iRqm4voGeS/7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469121; c=relaxed/simple;
	bh=a39cz9cQqdObx78EZ2RJ/GmVrKVOdmW+jIk/kbOio/w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eRLaf2AMtWeBLWNgpv2W0NS2OS8mTgWu7nYeSksLrx5UOuEQtBbk6vWNBBxbnSr0h2nweSZNKDeRECVUue8fVE+2N7Vfgqzyt3vKx12AAu7DqSs9QBLkirSugxCQcUGS47Mgy6xDoJwyE55NJgBIGqURKgTl8wZI3djYbvqRVEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFMB3r7+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFMB3r7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469119; x=1743005119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a39cz9cQqdObx78EZ2RJ/GmVrKVOdmW+jIk/kbOio/w=;
  b=aFMB3r7+rGqa+FCY/BSOuknLvawuuRZsnasdMAfdrYhIOaA4xYRQaLC1
   eC7eaNfm8apcNU+Cxs29erAzWtNhyMZdadkdSufdRwqj2lRn0AB2K5DPQ
   tGnwSGlJYYgWfcXzNBhvbZBciC/yONsHpW24c2z9kbvfSxL1XIhNKufVv
   XSRclNiE041VrrxuWjyXrYJ6R8bCPyeMRz4IsaBE6ELN4ul0tFtTxdyI8
   Fwu/nvZQjkrKi6mkXPyTmWoDYGGs63vNgfzZfywK7q2B2UfBc+VqQv5Ta
   sU4PpkkxJuth6Qf+CwyO599LXTj7YKafABvVNpUI/lUa6aSfam/wfPeQu
   A==;
X-CSE-ConnectionGUID: REj8ciciRNGT+kXNtIatGg==
X-CSE-MsgGUID: 0oAj/d9YRByPOEDx9G/5qA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260328"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260328"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482104"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:42 -0700
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
Subject: [PATCH 01/34] ASoC: intel: sof_sdw: Make find_codec_info_part() return a pointer
Date: Tue, 26 Mar 2024 11:03:56 -0500
Message-Id: <20240326160429.13560-2-pierre-louis.bossart@linux.intel.com>
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

Rather than returning an index simply return a pointer to the
located codec info, this simplifies all the callers which only
want to access the codec info structure. Also remove the inline
specifier the function is fairly large for an inline function,
let the compiler decide.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 79 +++++++++++++++-----------------
 1 file changed, 36 insertions(+), 43 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 08f330ed5c2e..08b19a32cf9c 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1055,7 +1055,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 	},
 };
 
-static inline int find_codec_info_part(const u64 adr)
+static struct sof_sdw_codec_info *find_codec_info_part(const u64 adr)
 {
 	unsigned int part_id, sdw_version;
 	int i;
@@ -1070,9 +1070,9 @@ static inline int find_codec_info_part(const u64 adr)
 		if (part_id == codec_info_list[i].part_id &&
 		    (!codec_info_list[i].version_id ||
 		     sdw_version == codec_info_list[i].version_id))
-			return i;
+			return &codec_info_list[i];
 
-	return -EINVAL;
+	return NULL;
 
 }
 
@@ -1116,7 +1116,6 @@ static int get_dailink_info(struct device *dev,
 	for (; adr_link->num_adr; adr_link++) {
 		const struct snd_soc_acpi_endpoint *endpoint;
 		struct sof_sdw_codec_info *codec_info;
-		int codec_index;
 		int stream;
 		u64 adr;
 
@@ -1126,11 +1125,9 @@ static int get_dailink_info(struct device *dev,
 
 		for (i = 0; i < adr_link->num_adr; i++) {
 			adr = adr_link->adr_d[i].adr;
-			codec_index = find_codec_info_part(adr);
-			if (codec_index < 0)
-				return codec_index;
-
-			codec_info = &codec_info_list[codec_index];
+			codec_info = find_codec_info_part(adr);
+			if (!codec_info)
+				return -EINVAL;
 
 			*codecs_num += codec_info->dai_num;
 
@@ -1257,11 +1254,11 @@ static int fill_sdw_codec_dlc(struct device *dev,
 {
 	unsigned int sdw_version, unique_id, mfg_id, link_id, part_id, class_id;
 	u64 adr = adr_link->adr_d[adr_index].adr;
-	int codec_index;
+	struct sof_sdw_codec_info *codec_info;
 
-	codec_index = find_codec_info_part(adr);
-	if (codec_index < 0)
-		return codec_index;
+	codec_info = find_codec_info_part(adr);
+	if (!codec_info)
+		return -EINVAL;
 
 	sdw_version = SDW_VERSION(adr);
 	link_id = SDW_DISCO_LINK_ID(adr);
@@ -1270,10 +1267,8 @@ static int fill_sdw_codec_dlc(struct device *dev,
 	part_id = SDW_PART_ID(adr);
 	class_id = SDW_CLASS_ID(adr);
 
-	if (codec_info_list[codec_index].codec_name)
-		codec->name = devm_kstrdup(dev,
-					   codec_info_list[codec_index].codec_name,
-					   GFP_KERNEL);
+	if (codec_info->codec_name)
+		codec->name = devm_kstrdup(dev, codec_info->codec_name, GFP_KERNEL);
 	else if (is_unique_device(adr_link, sdw_version, mfg_id, part_id,
 				  class_id, adr_index))
 		codec->name = devm_kasprintf(dev, GFP_KERNEL,
@@ -1287,7 +1282,7 @@ static int fill_sdw_codec_dlc(struct device *dev,
 	if (!codec->name)
 		return -ENOMEM;
 
-	codec->dai_name = codec_info_list[codec_index].dais[dai_index].dai_name;
+	codec->dai_name = codec_info->dais[dai_index].dai_name;
 
 	return 0;
 }
@@ -1309,22 +1304,22 @@ static int set_codec_init_func(struct snd_soc_card *card,
 		 * we should end immediately if it is not aggregated (group_id=0)
 		 */
 		for ( ; i < adr_link->num_adr; i++) {
-			int codec_index;
+			struct sof_sdw_codec_info *codec_info;
 
-			codec_index = find_codec_info_part(adr_link->adr_d[i].adr);
-			if (codec_index < 0)
-				return codec_index;
+			codec_info = find_codec_info_part(adr_link->adr_d[i].adr);
+			if (!codec_info)
+				return -EINVAL;
 
 			/* The group_id is > 0 iff the codec is aggregated */
 			if (adr_link->adr_d[i].endpoints->group_id != group_id)
 				continue;
 
-			if (codec_info_list[codec_index].dais[dai_index].init)
-				codec_info_list[codec_index].dais[dai_index].init(card,
-						adr_link,
-						dai_links,
-						&codec_info_list[codec_index],
-						playback);
+			if (codec_info->dais[dai_index].init)
+				codec_info->dais[dai_index].init(card,
+								 adr_link,
+								 dai_links,
+								 codec_info,
+								 playback);
 			if (!group_id)
 				return 0;
 		}
@@ -1481,7 +1476,6 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 	int cpu_dai_num;
 	unsigned int group_id;
 	int codec_dlc_index = 0;
-	int codec_index;
 	int codec_num;
 	int stream;
 	int i = 0;
@@ -1541,10 +1535,9 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 	}
 
 	/* find codec info to create BE DAI */
-	codec_index = find_codec_info_part(adr_link->adr_d[adr_index].adr);
-	if (codec_index < 0)
-		return codec_index;
-	codec_info = &codec_info_list[codec_index];
+	codec_info = find_codec_info_part(adr_link->adr_d[adr_index].adr);
+	if (!codec_info)
+		return -EINVAL;
 
 	if (codec_info->ignore_pch_dmic)
 		*ignore_pch_dmic = true;
@@ -1631,7 +1624,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		ret = set_codec_init_func(card, adr_link, dai_links + (*link_index)++,
 					  playback, group_id, adr_index, dai_index);
 		if (ret < 0) {
-			dev_err(dev, "failed to init codec %d\n", codec_index);
+			dev_err(dev, "failed to init codec 0x%x\n", codec_info->part_id);
 			return ret;
 		}
 	}
@@ -1649,6 +1642,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	const struct snd_soc_acpi_link_adr *adr_link = mach_params->links;
 	bool aggregation = !(sof_sdw_quirk & SOF_SDW_NO_AGGREGATION);
 	struct snd_soc_codec_conf *codec_conf;
+	struct sof_sdw_codec_info *codec_info;
 	bool append_dai_type = false;
 	bool ignore_pch_dmic = false;
 	int codec_conf_num = 0;
@@ -1660,7 +1654,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	char *name, *cpu_dai_name;
 	char *codec_name, *codec_dai_name;
 	int i, j, be_id = 0;
-	int codec_index;
 	int hdmi_num;
 	int ret;
 
@@ -1729,10 +1722,10 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		 */
 		for (i = 0; i < adr_link->num_adr; i++) {
 			/* find codec info to get dai_num */
-			codec_index = find_codec_info_part(adr_link->adr_d[i].adr);
-			if (codec_index < 0)
-				return codec_index;
-			if (codec_info_list[codec_index].dai_num > 1) {
+			codec_info = find_codec_info_part(adr_link->adr_d[i].adr);
+			if (!codec_info)
+				return -EINVAL;
+			if (codec_info->dai_num > 1) {
 				append_dai_type = true;
 				goto out;
 			}
@@ -1762,11 +1755,11 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 				continue;
 
 			/* find codec info to get dai_num */
-			codec_index = find_codec_info_part(adr_link->adr_d[i].adr);
-			if (codec_index < 0)
-				return codec_index;
+			codec_info = find_codec_info_part(adr_link->adr_d[i].adr);
+			if (!codec_info)
+				return -EINVAL;
 
-			for (j = 0; j < codec_info_list[codec_index].dai_num ; j++) {
+			for (j = 0; j < codec_info->dai_num ; j++) {
 				int current_be_id;
 
 				ret = create_sdw_dailink(card, &link_index, dai_links,
-- 
2.40.1

