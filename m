Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7E913C91A
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469143; cv=none; b=LuoqnjdBQUVBmUvvmJEfBOeN52hB+pn0aL1+xsCldfGlU3voQzw8Z827aEth8eVpDEg6ie55ozd8x8qzTNPBJQVNPW9gat3jublg+UkLXFuNFQKxiiEB2k+nXB7Rmf8sM20+ajwk5Fw3V+NFGgxXHw/NtLrLmw0jIamVvj4KTUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469143; c=relaxed/simple;
	bh=aLofAmgiA4bnXj15hLD9xEl99RidpdrTrPZVO++o2Fk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nCGpalZvuw55yUKMJL518K4O8foOOlZKxfbV5jaY8qXIpimbkGcYXcjPoGViDHWt7RJF6J5MOyE/1JT3SfM/zc8/ZCyDVzy13eA2t/Kf36WLO9fn+SHVLBZRZOG9snOzIf9gxRWhIBeny1J4p45Sbz+PKBKDQSsXX8IDm3acp6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QChEngV2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QChEngV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469141; x=1743005141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aLofAmgiA4bnXj15hLD9xEl99RidpdrTrPZVO++o2Fk=;
  b=QChEngV27YstRuiticQHYjEu3fbSxS6AVShoil7BPe2c/IXkmu/gFt/y
   GRqqgwbP/3Pg/qF5RDwr82TZi+z98/mj9DFWOJk4Es+bH0/DnFRnSZSsh
   1r49NCNgoh+GCbaO9467Igu8RWX8CU4rzyRrXBbxveQFk6CIwnPNYN1nf
   zkJchEZ3CNM914slQj9vImwkJ8F9hcUWMu0gYHG4oktj0qLOSex5sCu7g
   2zM1R3qRW0ajtRYU3XQZU4NdFpH+JO1+qaPBDqqlR6ApvLLdeoEbjNNJY
   ganUAiTiQgVE8se5u/Sb6JmoyAkaOJpGhV8IpaDxpSuurwNp4sCez+Ujx
   A==;
X-CSE-ConnectionGUID: QyYjOOjsRS+kQKgu0UL4ZA==
X-CSE-MsgGUID: YCMAn+etRDe17F//8YmQ+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260555"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260555"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482485"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:05 -0700
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
Subject: [PATCH 31/34] ASoC: Intel: sof_sdw: Don't pass acpi_link_adr to init functions
Date: Tue, 26 Mar 2024 11:04:26 -0500
Message-Id: <20240326160429.13560-32-pierre-louis.bossart@linux.intel.com>
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

There is no need to pass the snd_soc_acpi_link_adr structure to the init
functions, it conveys no specific information about the codec. Remove
this parameter from the callbacks

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c                     | 7 ++-----
 sound/soc/intel/boards/sof_sdw_common.h              | 6 ------
 sound/soc/intel/boards/sof_sdw_cs_amp.c              | 1 -
 sound/soc/intel/boards/sof_sdw_maxim.c               | 1 -
 sound/soc/intel/boards/sof_sdw_rt711.c               | 1 -
 sound/soc/intel/boards/sof_sdw_rt_amp.c              | 1 -
 sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c | 1 -
 7 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 1816ec5dd580..f3167e3498e0 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1273,7 +1273,6 @@ struct sof_sdw_endpoint {
 	u32 link_mask;
 	const char *codec_name;
 
-	const struct snd_soc_acpi_link_adr *adr_link;
 	struct sof_sdw_codec_info *codec_info;
 	const struct sof_sdw_dai_info *dai_info;
 };
@@ -1425,7 +1424,6 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 
 				sof_end->link_mask = adr_link->mask;
 				sof_end->codec_name = codec_name;
-				sof_end->adr_link = adr_link;
 				sof_end->codec_info = codec_info;
 				sof_end->dai_info = dai_info;
 				sof_end++;
@@ -1548,8 +1546,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 		list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
 			if (sof_end->dai_info->init)
-				sof_end->dai_info->init(card, sof_end->adr_link,
-							*dai_links,
+				sof_end->dai_info->init(card, *dai_links,
 							sof_end->codec_info,
 							playback);
 		}
@@ -1612,7 +1609,7 @@ static int create_ssp_dailinks(struct snd_soc_card *card,
 		if (ret)
 			return ret;
 
-		ret = ssp_info->dais[0].init(card, NULL, *dai_links, ssp_info, 0);
+		ret = ssp_info->dais[0].init(card, *dai_links, ssp_info, 0);
 		if (ret < 0)
 			return ret;
 
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 2132d3fc42f8..8d8c2ca68a7f 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -74,7 +74,6 @@ struct sof_sdw_dai_info {
 	const int dai_type;
 	const int dailink[2]; /* dailink id for each direction */
 	int  (*init)(struct snd_soc_card *card,
-		     const struct snd_soc_acpi_link_adr *link,
 		     struct snd_soc_dai_link *dai_links,
 		     struct sof_sdw_codec_info *info,
 		     bool playback);
@@ -132,7 +131,6 @@ int sof_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd);
 
 /* RT711 support */
 int sof_sdw_rt711_init(struct snd_soc_card *card,
-		       const struct snd_soc_acpi_link_adr *link,
 		       struct snd_soc_dai_link *dai_links,
 		       struct sof_sdw_codec_info *info,
 		       bool playback);
@@ -140,7 +138,6 @@ int sof_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_l
 
 /* RT711-SDCA support */
 int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
-			      const struct snd_soc_acpi_link_adr *link,
 			      struct snd_soc_dai_link *dai_links,
 			      struct sof_sdw_codec_info *info,
 			      bool playback);
@@ -151,7 +148,6 @@ extern struct snd_soc_ops sof_sdw_rt1308_i2s_ops;
 
 /* generic amp support */
 int sof_sdw_rt_amp_init(struct snd_soc_card *card,
-			const struct snd_soc_acpi_link_adr *link,
 			struct snd_soc_dai_link *dai_links,
 			struct sof_sdw_codec_info *info,
 			bool playback);
@@ -159,14 +155,12 @@ int sof_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_
 
 /* MAXIM codec support */
 int sof_sdw_maxim_init(struct snd_soc_card *card,
-		       const struct snd_soc_acpi_link_adr *link,
 		       struct snd_soc_dai_link *dai_links,
 		       struct sof_sdw_codec_info *info,
 		       bool playback);
 
 /* CS AMP support */
 int sof_sdw_cs_amp_init(struct snd_soc_card *card,
-			const struct snd_soc_acpi_link_adr *link,
 			struct snd_soc_dai_link *dai_links,
 			struct sof_sdw_codec_info *info,
 			bool playback);
diff --git a/sound/soc/intel/boards/sof_sdw_cs_amp.c b/sound/soc/intel/boards/sof_sdw_cs_amp.c
index 56cf75bc6cc4..e29a586ce7c0 100644
--- a/sound/soc/intel/boards/sof_sdw_cs_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_cs_amp.c
@@ -57,7 +57,6 @@ int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 }
 
 int sof_sdw_cs_amp_init(struct snd_soc_card *card,
-			const struct snd_soc_acpi_link_adr *link,
 			struct snd_soc_dai_link *dai_links,
 			struct sof_sdw_codec_info *info,
 			bool playback)
diff --git a/sound/soc/intel/boards/sof_sdw_maxim.c b/sound/soc/intel/boards/sof_sdw_maxim.c
index 034730432671..432e5112415a 100644
--- a/sound/soc/intel/boards/sof_sdw_maxim.c
+++ b/sound/soc/intel/boards/sof_sdw_maxim.c
@@ -139,7 +139,6 @@ static int mx8373_sdw_late_probe(struct snd_soc_card *card)
 }
 
 int sof_sdw_maxim_init(struct snd_soc_card *card,
-		       const struct snd_soc_acpi_link_adr *link,
 		       struct snd_soc_dai_link *dai_links,
 		       struct sof_sdw_codec_info *info,
 		       bool playback)
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 9762c48ba7a9..7e54fc5cbe09 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -158,7 +158,6 @@ int sof_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_l
 }
 
 int sof_sdw_rt711_init(struct snd_soc_card *card,
-		       const struct snd_soc_acpi_link_adr *link,
 		       struct snd_soc_dai_link *dai_links,
 		       struct sof_sdw_codec_info *info,
 		       bool playback)
diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
index 202edab95000..1b415708500e 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -281,7 +281,6 @@ int sof_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_
 }
 
 int sof_sdw_rt_amp_init(struct snd_soc_card *card,
-			const struct snd_soc_acpi_link_adr *link,
 			struct snd_soc_dai_link *dai_links,
 			struct sof_sdw_codec_info *info,
 			bool playback)
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index 006771485486..85c09513bc35 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -191,7 +191,6 @@ int sof_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link
 }
 
 int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
-			      const struct snd_soc_acpi_link_adr *link,
 			      struct snd_soc_dai_link *dai_links,
 			      struct sof_sdw_codec_info *info,
 			      bool playback)
-- 
2.40.1

