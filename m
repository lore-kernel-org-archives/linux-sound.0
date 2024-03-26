Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D18413CA9C
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469137; cv=none; b=uM/D9FTuWoZpxMoIFgYKr1gSfPRYLgJjHYUqdHW0zvKjE2GLvNSZLSG/yZrip9LiPJZ9t6ErnsYhUzbwaNEuuzwPMNVPIzqE4Fb+KMGvbg+xQLQjNIGXcOFZSUE3mgJqbVHBYDmgkPr4wDu+QyzXwITvs1sQkooii7LOFd5GjeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469137; c=relaxed/simple;
	bh=3xRsvZ3vHZgzMGxX4qTn0KCbHj9R9neYJ/Ir08g+3As=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gacZQdarLj+s54sw0vKDlrsn9TBsBtf+f5Hk0AxUlP7q5TSQYnTYqH0jaPx0lFFHK9oHgsZIFdt5Zq9EQ5DqX3iJzza/FbFGxqMDcrkHl8M+r5JV4FELDkttmnGGYAqbaysfagrGbZ/l61ndOuBXcsypqzw0mNLWxA2f5U5GbR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aUNuAtcR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUNuAtcR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469136; x=1743005136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3xRsvZ3vHZgzMGxX4qTn0KCbHj9R9neYJ/Ir08g+3As=;
  b=aUNuAtcR0yjZnh6WnslCJ1o08LQTRGI/Y3p4hNDGzKmv/lgwTMtKvewA
   vQfWkOaEA9q8dtkcxHtA2Ttk0j49UIBBqCE2Qte6+07g6fpio45hbml7k
   pUkM2EcLRIs8MPWmc9nWHJEhBpKnM3lAIPZmXy2NBloy6rerbI8zVHwCe
   BiP59YSUJdIwlASIMxGhu56vGqBVQMlEKVN5wybaEB+EpAVZGFZj22LXo
   A6GRab83O0IR1FT/ZTxxKZ5pT3EtD4NdZgZxUOSl8x/+NuuWSwyLJmRgI
   IDVc72O1c0bXEkrbkJ1K8OpFoRAtOj3G7J+F6buj8SY3qttENx2Y1LlXr
   A==;
X-CSE-ConnectionGUID: /fRn2s9kRcGKxKOlKcGM+g==
X-CSE-MsgGUID: 5x9RLeszSZ2Smno1hos1Tw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260474"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260474"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482343"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:57 -0700
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
Subject: [PATCH 21/34] ASoC: Intel: sof_sdw: Move append_dai_type to new parsing
Date: Tue, 26 Mar 2024 11:04:16 -0500
Message-Id: <20240326160429.13560-22-pierre-louis.bossart@linux.intel.com>
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

append_dai_type should be set to true in any situation that would
result in multiple DAI links existing on a single SoundWire bus,
because the legacy naming used only the bus number to make things
unique. The current code handles this by looking for codecs with
multiple dai_info structs and looking for buses that include multiple
types of device on them. The first of these assumes that all DAIs on a
given device would be in use. The second, with dissimilar aggregation
now being supported, isn't really an accurate check either since those
devices could be aggregated into a single DAI link.

Move the handling for this flag over to the new parsing code and
simplify things a little by looking directly for SoundWire links
that will contain multiple DAI links to set the flag. These changes
should not cause any change in behaviour for any currently supported
systems.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 36 +++++---------------------------
 1 file changed, 5 insertions(+), 31 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index cda759ee6345..89ce77961634 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1463,6 +1463,8 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 	int i, j;
 
 	for (adr_link = mach_params->links; adr_link->num_adr; adr_link++) {
+		int num_link_dailinks = 0;
+
 		if (!is_power_of_2(adr_link->mask)) {
 			dev_err(dev, "link with multiple mask bits: 0x%x\n",
 				adr_link->mask);
@@ -1540,6 +1542,7 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 					}
 				}
 
+				num_link_dailinks += !!list_empty(&sof_dai->endpoints);
 				list_add_tail(&sof_end->list, &sof_dai->endpoints);
 
 				sof_end->link_mask = adr_link->mask;
@@ -1550,6 +1553,8 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 				sof_end++;
 			}
 		}
+
+		ctx->append_dai_type |= (num_link_dailinks > 1);
 	}
 
 	WARN_ON(codec_conf != card->codec_conf + card->num_configs);
@@ -1933,37 +1938,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	for (i = 0; i < SDW_MAX_LINKS; i++)
 		ctx->sdw_pin_index[i] = SDW_INTEL_BIDIR_PDI_BASE;
 
-	for (; adr_link->num_adr; adr_link++) {
-		/*
-		 * If there are two or more different devices on the same sdw link, we have to
-		 * append the codec type to the dai link name to prevent duplicated dai link name.
-		 * The same type devices on the same sdw link will be in the same
-		 * snd_soc_acpi_adr_device array. They won't be described in different adr_links.
-		 */
-		for (i = 0; i < adr_link->num_adr; i++) {
-			/* find codec info to get dai_num */
-			codec_info = find_codec_info_part(adr_link->adr_d[i].adr);
-			if (!codec_info) {
-				ret = -EINVAL;
-				goto err_end;
-			}
-			if (codec_info->dai_num > 1) {
-				ctx->append_dai_type = true;
-				goto out;
-			}
-			for (j = 0; j < i; j++) {
-				if ((SDW_PART_ID(adr_link->adr_d[i].adr) !=
-				    SDW_PART_ID(adr_link->adr_d[j].adr)) ||
-				    (SDW_MFG_ID(adr_link->adr_d[i].adr) !=
-				    SDW_MFG_ID(adr_link->adr_d[j].adr))) {
-					ctx->append_dai_type = true;
-					goto out;
-				}
-			}
-		}
-	}
-out:
-
 	/* generate DAI links by each sdw link */
 	for (adr_link = mach_params->links ; adr_link->num_adr; adr_link++) {
 		for (i = 0; i < adr_link->num_adr; i++) {
-- 
2.40.1

