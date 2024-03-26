Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EF713C8FC
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469131; cv=none; b=gz5OhAI08thVvFS23m9svJFOKlPyhgd1fxoZy+V1ox4kAlZGFA9ViInQNfprJvOXSbx4TkzMnQtcuNI9Aye5CdTOeNzht7i516V5a3RTYbG81ataMyKRGqIKKYtOG/Zno6xNr2Tm9WJBA+GYMJ2yZqQBnj0l728o5Ss0iwaUU3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469131; c=relaxed/simple;
	bh=cl79tFpLx86aSOuqh9+F1+bk9CD5uzAwzEa9y9oGOjg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cu8ChuEblhbwvQIEwltltnUYz3m90L2gZhc3MSIDjNEjf0StZRjepbukjQrHP0CcPWbUVNwqe7S7Zf0iVztJ9MxK/HPLj1Xz4BYUvq7nFWtqBIeZ05qMIzH6Vg4g3vDT9OlUtyQ2IfLxYP1J/KDj4LVosyZ1fe9zCBx42Eu8+c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e534tae+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e534tae+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469129; x=1743005129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cl79tFpLx86aSOuqh9+F1+bk9CD5uzAwzEa9y9oGOjg=;
  b=e534tae+YYTTG0znGAN0pk46ArKfC68nxVLkdqnztUJ+3n2NjuWNGkbf
   aRxBPwnwXX/Ttzb/sMgj409fe/m1PlwjldOdSoQ3/4o6m0bKOqSoR2sK9
   e0qpgRVoFtN+g+dj0bxf/F9p9mCFAl2lurOfqbNmb5CNC6ecUmiXdSKuD
   1uZ5T3trcpBMwjb75n++8b5zGD+d1HEwTs5MKigmJP9Wvcm0eN5/tKEv1
   qsvkVC7QqWKkc8hVuX5pIO3EzsgJUAHhCZDablYvFxRdSxlFIcdyM7xrx
   1TZO8CVXWLS2fX7J5Oapplh14pnTiwJfsYCp6tr+/EhwziXVc/9EyfK1P
   g==;
X-CSE-ConnectionGUID: AFcd+wVrRD2wWhsZU+UpjA==
X-CSE-MsgGUID: hf8I8YGASnWHbo4dENxnaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260412"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260412"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482234"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:51 -0700
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
Subject: [PATCH 13/34] ASoC: Intel: sof_sdw: Factor out BlueTooth DAI creation
Date: Tue, 26 Mar 2024 11:04:08 -0500
Message-Id: <20240326160429.13560-14-pierre-louis.bossart@linux.intel.com>
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

Factor out the creation of the BlueTooth DAI links into a helper
function.  No functional change.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 35 +++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 7dc3559bf988..6e2e934e1246 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1722,6 +1722,27 @@ static int create_hdmi_dailinks(struct snd_soc_card *card,
 	return 0;
 }
 
+static int create_bt_dailinks(struct snd_soc_card *card,
+			      struct snd_soc_dai_link **dai_links, int *be_id)
+{
+	struct device *dev = card->dev;
+	int port = (sof_sdw_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
+			SOF_BT_OFFLOAD_SSP_SHIFT;
+	char *name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
+	char *cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", port);
+	int ret;
+
+	ret = init_simple_dai_link(dev, *dai_links, be_id, name,
+				   1, 1, cpu_dai_name, snd_soc_dummy_dlc.name,
+				   snd_soc_dummy_dlc.dai_name, NULL, NULL);
+	if (ret)
+		return ret;
+
+	(*dai_links)++;
+
+	return 0;
+}
+
 static int sof_card_dai_links_create(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
@@ -1738,7 +1759,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	bool group_generated[SDW_MAX_GROUPS] = { };
 	struct snd_soc_dai_link *dai_links;
 	int num_links;
-	char *name, *cpu_dai_name;
 	int i, j, be_id = 0;
 	int hdmi_num;
 	unsigned long ssp_mask;
@@ -1899,20 +1919,11 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	if (ret)
 		return ret;
 
+	/* BT */
 	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
-		int port = (sof_sdw_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
-				SOF_BT_OFFLOAD_SSP_SHIFT;
-
-		name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
-		cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", port);
-
-		ret = init_simple_dai_link(dev, dai_links, &be_id, name,
-					   1, 1, cpu_dai_name, snd_soc_dummy_dlc.name,
-					   snd_soc_dummy_dlc.dai_name, NULL, NULL);
+		ret = create_bt_dailinks(card, &dai_links, &be_id);
 		if (ret)
 			return ret;
-
-		dai_links++;
 	}
 
 	WARN_ON(dai_links != card->dai_link + card->num_links);
-- 
2.40.1

