Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECBE13C8F9
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469132; cv=none; b=eu0fYULxS6zeI9Mt0SJY8quapIuxlgZO0qF2SEBhwW3pcC5Q7/xXpk+wD7NN2qsY/HPqk2erwyfyqZs8pLaiDWf6TtI5haoqysMk54r4ABUDWEisAFqcmaYpx6RCQ087fow9deBiQsr6Tvj7samMAgB9NYsGZKa3szDaf+eB2zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469132; c=relaxed/simple;
	bh=bdB/FytdahnLxveJ+wKWW/oBK+jrUjYb5O+XidYfLS0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AGOW2mUMEzqTugUWRYfktpbDWf/ym8/4kz6ytmoaVik8VUPnBQxbEMDCKp2/YzJfoU8KehfWjBXK9yDQ0FFwY7d+8gWmYZUTUnNWkb0H4KGcCFRdv37NI/5rNDA6ZmFyZUFo/7HEI0OnFhJymCnHPc18+9dpO2KGdEqMHn32QFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pu+rh1sV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pu+rh1sV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469129; x=1743005129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bdB/FytdahnLxveJ+wKWW/oBK+jrUjYb5O+XidYfLS0=;
  b=Pu+rh1sVtL5+8KXEihbxgSXfZYJN84wYC1szrN8s8oZxYs25W9vrw/cn
   RuAgQgkQPfXDR+pLPNBgxSSnc/L4wLpjLwdt/TBnMzH7W6cn/+n+plin/
   XP0zE2+uC7nvVj3LsSx8uzL/bdur2LuaqRqHFjBvSMvZ+PNdTr/1pEcwN
   nvGUkrhJLBIEIabIbfdariOBQV17Y2/H2llb6i90DD97kuz1XH0nUa0aT
   4yIeui2AbWUWbmE2xvo7GDyXyzdyR/BIwH2megVdOHlcUty5B3Y68Szp3
   k3Jriqi/+KqcX64jBMUGTtHknKsMd60I5J22hDhwq88RB9CLbgf8+lgdt
   g==;
X-CSE-ConnectionGUID: Irjv2TbgRvum0Em+HyirOA==
X-CSE-MsgGUID: u4dMMfc9S4232rEdaKXE/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260404"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260404"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482224"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:50 -0700
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
Subject: [PATCH 12/34] ASoC: Intel: sof_sdw: Factor out HDMI DAI creation
Date: Tue, 26 Mar 2024 11:04:07 -0500
Message-Id: <20240326160429.13560-13-pierre-louis.bossart@linux.intel.com>
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

Factor out the creation of the HDMI DAI links into a helper function.
No functional change.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 61 ++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 23 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 5571c9e85dd7..7dc3559bf988 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1687,6 +1687,41 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 	return 0;
 }
 
+static int create_hdmi_dailinks(struct snd_soc_card *card,
+				struct snd_soc_dai_link **dai_links, int *be_id,
+				int hdmi_num)
+{
+	struct device *dev = card->dev;
+	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	int i, ret;
+
+	for (i = 0; i < hdmi_num; i++) {
+		char *name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d", i + 1);
+		char *cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d Pin", i + 1);
+		char *codec_name, *codec_dai_name;
+
+		if (ctx->hdmi.idisp_codec) {
+			codec_name = "ehdaudio0D2";
+			codec_dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							"intel-hdmi-hifi%d", i + 1);
+		} else {
+			codec_name = "snd-soc-dummy";
+			codec_dai_name = "snd-soc-dummy-dai";
+		}
+
+		ret = init_simple_dai_link(dev, *dai_links, be_id, name,
+					   1, 0, // HDMI only supports playback
+					   cpu_dai_name, codec_name, codec_dai_name,
+					   i == 0 ? sof_sdw_hdmi_init : NULL, NULL);
+		if (ret)
+			return ret;
+
+		(*dai_links)++;
+	}
+
+	return 0;
+}
+
 static int sof_card_dai_links_create(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
@@ -1704,7 +1739,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct snd_soc_dai_link *dai_links;
 	int num_links;
 	char *name, *cpu_dai_name;
-	char *codec_name, *codec_dai_name;
 	int i, j, be_id = 0;
 	int hdmi_num;
 	unsigned long ssp_mask;
@@ -1861,28 +1895,9 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	}
 
 	/* HDMI */
-	for (i = 0; i < hdmi_num; i++) {
-		name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d", i + 1);
-		cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d Pin", i + 1);
-
-		if (ctx->hdmi.idisp_codec) {
-			codec_name = "ehdaudio0D2";
-			codec_dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							"intel-hdmi-hifi%d", i + 1);
-		} else {
-			codec_name = "snd-soc-dummy";
-			codec_dai_name = "snd-soc-dummy-dai";
-		}
-
-		ret = init_simple_dai_link(dev, dai_links, &be_id, name,
-					   1, 0, // HDMI only supports playback
-					   cpu_dai_name, codec_name, codec_dai_name,
-					   i == 0 ? sof_sdw_hdmi_init : NULL, NULL);
-		if (ret)
-			return ret;
-
-		dai_links++;
-	}
+	ret = create_hdmi_dailinks(card, &dai_links, &be_id, hdmi_num);
+	if (ret)
+		return ret;
 
 	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
 		int port = (sof_sdw_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
-- 
2.40.1

