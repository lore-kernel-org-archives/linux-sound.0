Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9808E13C8FC
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469123; cv=none; b=Rkt++IoQN4IQox7CJsfcs/aTIUI6F3lFAXpAupLi/FUbbTApUAzFBxTgxQwCKC5+UQyeW2GThxH5W7PVdJwxlNSgrIaAtP4HL3OEL7Gp1BgAw/tgeOyJe720RNQPF3S02Muw46juxQt7ENcB4APrCiAUI/NN/zvPqm41MobOsSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469123; c=relaxed/simple;
	bh=IGaUX8YJZXWAmr7zoW4xLN1MTZeKcfPI99f/516aWdw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EBbfOFXpOP/I15wvXfGZoae1Rk3a//UVyDPaZ3xhHn5b/x51JUdlK3YqrEbA8NE/i18OM2mzFblT7WkYZlhPC6sjEJr1PYZ/pWT7Wt5+p9Y8TUId8RKIn9RlxtWIKfWjcXKlG//fF+cRAcf4Z9abvEfy0VIXz5SulrSM9UsHjn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5XLuPin; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5XLuPin"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469121; x=1743005121;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IGaUX8YJZXWAmr7zoW4xLN1MTZeKcfPI99f/516aWdw=;
  b=K5XLuPinEGqrcwT0QwI5zi0MCNzLfMGe5lFkl10uRBHR2naBi3sz/nXe
   MgWiYeSi6201PAG0Rmhoyx0yL360DwvVHBR1fk8Ax18p+Zi1EM3LkYJCB
   JH2Lguriz17mMch5EZsmGW/oYqNtmqxU+2cWoqvbs7GwWcYT+9DCJ7aJ4
   wuJtgGn6z5KhGGme6BnJK7IBBJbqm2gcSBZPJthV6rFpkFe8lbSwwZPXg
   pfhg2Obtux/XPMa/baRHoVU6I3dE3U6fWiVh6Y3tLOnn67HXVc4KIy/l1
   T7mFeWQ1U4XnTaOosCzL1sVYbtTHaFj8JICqBUmfwsLr4xAbpmZpgz7Vd
   w==;
X-CSE-ConnectionGUID: WUtBWkggRruSA0xmfIo4Wg==
X-CSE-MsgGUID: HPr+lncRSsaKWlIPQSLabA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260346"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260346"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482146"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:44 -0700
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
Subject: [PATCH 04/34] ASoC: intel: sof_sdw: Only pass codec_conf pointer around
Date: Tue, 26 Mar 2024 11:03:59 -0500
Message-Id: <20240326160429.13560-5-pierre-louis.bossart@linux.intel.com>
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

Rather than passing around a pointer to the codec_conf array, an index
into it and a size, simply pass around a pointer to the current codec_conf.
This reduces the amount of state moving around.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 4bd9f62c48fc..7b61d45df5da 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1457,10 +1457,8 @@ static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"
 static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			      struct snd_soc_dai_link *dai_links, int sdw_be_num,
 			      const struct snd_soc_acpi_link_adr *adr_link,
-			      struct snd_soc_codec_conf *codec_conf,
-			      int codec_count, int *be_id,
-			      int *codec_conf_index,
-			      bool *ignore_pch_dmic,
+			      struct snd_soc_codec_conf **codec_conf,
+			      int *be_id, bool *ignore_pch_dmic,
 			      bool append_dai_type,
 			      int adr_index,
 			      int dai_index)
@@ -1509,7 +1507,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 				continue;
 
 			/* sanity check */
-			if (*codec_conf_index >= codec_count) {
+			if (*codec_conf >= card->codec_conf + card->num_configs) {
 				dev_err(dev, "codec_conf array overflowed\n");
 				return -EINVAL;
 			}
@@ -1520,12 +1518,11 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			if (ret)
 				return ret;
 
-			codec_conf[*codec_conf_index].dlc = codecs[codec_dlc_index];
-			codec_conf[*codec_conf_index].name_prefix =
-					adr_link_next->adr_d[j].name_prefix;
+			(*codec_conf)->dlc = codecs[codec_dlc_index];
+			(*codec_conf)->name_prefix = adr_link_next->adr_d[j].name_prefix;
 
 			codec_dlc_index++;
-			(*codec_conf_index)++;
+			(*codec_conf)++;
 		}
 		j = 0;
 
@@ -1646,7 +1643,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	bool append_dai_type = false;
 	bool ignore_pch_dmic = false;
 	int codec_conf_num = 0;
-	int codec_conf_index = 0;
 	bool group_generated[SDW_MAX_GROUPS] = { };
 	struct snd_soc_dai_link *dai_links;
 	int num_links, link_index = 0;
@@ -1706,6 +1702,9 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	if (!codec_conf)
 		return -ENOMEM;
 
+	card->codec_conf = codec_conf;
+	card->num_configs = codec_conf_num;
+
 	/* SDW */
 	if (!sdw_be_num)
 		goto SSP;
@@ -1764,9 +1763,9 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 
 				ret = create_sdw_dailink(card, &link_index, dai_links,
 							 sdw_be_num, adr_link,
-							 codec_conf, codec_conf_num,
-							 &current_be_id, &codec_conf_index,
-							 &ignore_pch_dmic, append_dai_type, i, j);
+							 &codec_conf, &current_be_id,
+							 &ignore_pch_dmic,
+							 append_dai_type, i, j);
 				if (ret < 0) {
 					dev_err(dev, "failed to create dai link %d\n", link_index);
 					return ret;
@@ -1886,9 +1885,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	card->dai_link = dai_links;
 	card->num_links = num_links;
 
-	card->codec_conf = codec_conf;
-	card->num_configs = codec_conf_num;
-
 	return 0;
 }
 
-- 
2.40.1

