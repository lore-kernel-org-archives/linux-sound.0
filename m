Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA0413C916
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469128; cv=none; b=J/tsiqAZ8RYPJMkR4l1Ut+djhAWFwPQ4n2bSmQsr1CKWmaqqjEJK8tEaYmBVLePeakW7DtNkVYDfZ5AIG04UlAFL0mf56S0zVVK0GE7clAaYhAhWr15UBbCWjg+Bie3n2wnpdWDfLscRWCzI7zgNvhR+34U2IeOiItjMsH0Je/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469128; c=relaxed/simple;
	bh=p4bcEeZvlLZOeW2O2yiVYCUk6wRlaf1Q9CsfKwwjbvA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gJczwpvmYzbK3uUe8Si2b9GRJqeE+5FmLgN/KQYhnqlN5mhAY7BH1fhcisTXUD2Ik1bpGGYIpnt2tWcAF1zHTGRmo4Nsj2cdMTgzFrP9z5VSutW7IU7+sLtb6MhzmgyGPHqz5/cJ4eCjBVxSMpFe3n8hp4NjMxZNuiC87KHUL1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mtIQ/Y8K; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtIQ/Y8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469124; x=1743005124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p4bcEeZvlLZOeW2O2yiVYCUk6wRlaf1Q9CsfKwwjbvA=;
  b=mtIQ/Y8KFDOw/ThOnh1ZXBaYvTUDt7mtLEwtVwHastHwGKKI3R+ZUdbb
   5FxbQXQK39MPawizheRpiOu+LXYScg+2h6D+OUvPzCzOZ4kRob33izpN9
   kFczpOZvWVwsr2NWlmgDU6DSwh+H4pZYrGInUMW6H/7Cy7sUPWU/geZTS
   aUgsYGPOiY+vr2CzzhI3KtUrUEW8LCWcGeOuymcgwueUpvy2SA3cOjxEy
   R5vyHcPxy4gHBX6hcVtUtPI8E4bwFa6yULSfmEP3jzTrBIyvJ4unEiwTM
   hHtw06jfleAT5PCApxaLF1mu9qWpQtQ/2etk6IKKFGSr3oWdYQLJM7PSX
   Q==;
X-CSE-ConnectionGUID: 3Q+TillcSESUgtL1TAtboQ==
X-CSE-MsgGUID: RpRaUyF0Sl22CywQWFSDkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260367"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260367"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482180"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:46 -0700
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
Subject: [PATCH 07/34] ASoC: Intel: sof_sdw: Move flags to private struct
Date: Tue, 26 Mar 2024 11:04:02 -0500
Message-Id: <20240326160429.13560-8-pierre-louis.bossart@linux.intel.com>
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

Move the flags ignore_pch_dmic and append_dai_type into the drivers
private structure rather than passing them around between functions.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 21 +++++++--------------
 sound/soc/intel/boards/sof_sdw_common.h |  2 ++
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 45732884e310..5557db68a002 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1463,10 +1463,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			      struct snd_soc_dai_link *dai_links, int sdw_be_num,
 			      const struct snd_soc_acpi_link_adr *adr_link,
 			      struct snd_soc_codec_conf **codec_conf,
-			      int *be_id, bool *ignore_pch_dmic,
-			      bool append_dai_type,
-			      int adr_index,
-			      int dai_index)
+			      int *be_id, int adr_index, int dai_index)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct device *dev = card->dev;
@@ -1549,8 +1546,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 	if (!codec_info)
 		return -EINVAL;
 
-	if (codec_info->ignore_pch_dmic)
-		*ignore_pch_dmic = true;
+	ctx->ignore_pch_dmic |= codec_info->ignore_pch_dmic;
 
 	for_each_pcm_streams(stream) {
 		char *name, *cpu_name;
@@ -1572,7 +1568,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		}
 
 		/* create stream name according to first link id */
-		if (append_dai_type) {
+		if (ctx->append_dai_type) {
 			name = devm_kasprintf(dev, GFP_KERNEL,
 					      sdw_stream_name[stream + 2], cpu_dai_id[0],
 					      type_strings[codec_info->dais[dai_index].dai_type]);
@@ -1647,8 +1643,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct snd_soc_codec_conf *codec_conf;
 	struct sof_sdw_codec_info *codec_info;
 	struct sof_sdw_codec_info *ssp_info;
-	bool append_dai_type = false;
-	bool ignore_pch_dmic = false;
 	int codec_conf_num = 0;
 	bool group_generated[SDW_MAX_GROUPS] = { };
 	struct snd_soc_dai_link *dai_links;
@@ -1732,7 +1726,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 			if (!codec_info)
 				return -EINVAL;
 			if (codec_info->dai_num > 1) {
-				append_dai_type = true;
+				ctx->append_dai_type = true;
 				goto out;
 			}
 			for (j = 0; j < i; j++) {
@@ -1740,7 +1734,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 				    SDW_PART_ID(adr_link->adr_d[j].adr)) ||
 				    (SDW_MFG_ID(adr_link->adr_d[i].adr) !=
 				    SDW_MFG_ID(adr_link->adr_d[j].adr))) {
-					append_dai_type = true;
+					ctx->append_dai_type = true;
 					goto out;
 				}
 			}
@@ -1771,8 +1765,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 				ret = create_sdw_dailink(card, &link_index, dai_links,
 							 sdw_be_num, adr_link,
 							 &codec_conf, &current_be_id,
-							 &ignore_pch_dmic,
-							 append_dai_type, i, j);
+							 i, j);
 				if (ret < 0) {
 					dev_err(dev, "failed to create dai link %d\n", link_index);
 					return ret;
@@ -1825,7 +1818,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 DMIC:
 	/* dmic */
 	if (dmic_num > 0) {
-		if (ignore_pch_dmic) {
+		if (ctx->ignore_pch_dmic) {
 			dev_warn(dev, "Ignoring PCH DMIC\n");
 			goto HDMI;
 		}
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index a04cbab9bc70..1daf98a5849f 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -103,6 +103,8 @@ struct mc_private {
 	struct device *amp_dev1, *amp_dev2;
 	/* To store SDW Pin index for each SoundWire link */
 	unsigned int sdw_pin_index[SDW_MAX_LINKS];
+	bool append_dai_type;
+	bool ignore_pch_dmic;
 };
 
 extern unsigned long sof_sdw_quirk;
-- 
2.40.1

