Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D122713C8EC
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469122; cv=none; b=pj3htgbbk4dgt/fy1VSyNlTb8cNtycmrb5HdREHWoP4fClEbp9sK/BYXz718w3H3mvMbwaBGhx+pyfQe5TTJCx+iEk+d2CbP9TC1uhpSbhBlGFpJEn0GJbg61aW3kCj+0xFs91fSPwernKV8gJAFyQttF5/k4AWuMEYtQz3THXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469122; c=relaxed/simple;
	bh=mfp9MUGKgMyzz9N1Rro0RHkR500BoW+UsQ7SEPZ7h0s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jyFG8xnKafQrJ5dz26gXw0edGw/rpAYG6EJ8Ad60G1BM1ShwXAJAFxStzESR8eKsiFksGrAQLwVyMbNolG6wEAcuuMaGbnQg39pmIwQiI2k11lSqk0OKbYw0OWOV/u2ECHyeeEh9Uv3UZaeDovADagPx2gsC5BPNF3DddStxOI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8uEmw8g; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8uEmw8g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469120; x=1743005120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mfp9MUGKgMyzz9N1Rro0RHkR500BoW+UsQ7SEPZ7h0s=;
  b=X8uEmw8gww6iDiXPU0aAqqexg/8XNo6yEGeeX4JJt6aa2fQVDnWrx1c2
   JuMhcG0TcW3EDRfJY1UaYm89zqgg1Pni5XzHzHKOEBjqGeWzA9evpbI9+
   2iDoUffDFwFIVk4JSgtXEqUrKMrpOl0ZYaVy6uzFvuXALZBEd2DIIkO3Y
   jhRKouvWQ2oQBlq4yovQijWBiR6GaNyiS0PudiA4f60OA5BhOfJUKIl/L
   CHDctUj3jUH9qt1FQ9XMXvkorklP2avlhgCXZupa2bKZQnKMxoMo7QB6Y
   a3m9OrI+4ff41U4H/NftBvbn8WquitZusU+1gMMUbst5ZrQfR8etPKXFQ
   w==;
X-CSE-ConnectionGUID: dEPouzynRvKhzl5G0C+Fjg==
X-CSE-MsgGUID: Q1spee12S0+2xwvXBdLL8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260334"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260334"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482115"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:43 -0700
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
Subject: [PATCH 02/34] ASoC: intel: sof_sdw: Make find_codec_info_acpi() return a pointer
Date: Tue, 26 Mar 2024 11:03:57 -0500
Message-Id: <20240326160429.13560-3-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/intel/boards/sof_sdw.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 08b19a32cf9c..517ff44de1f0 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1076,18 +1076,18 @@ static struct sof_sdw_codec_info *find_codec_info_part(const u64 adr)
 
 }
 
-static inline int find_codec_info_acpi(const u8 *acpi_id)
+static struct sof_sdw_codec_info *find_codec_info_acpi(const u8 *acpi_id)
 {
 	int i;
 
 	if (!acpi_id[0])
-		return -EINVAL;
+		return NULL;
 
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
 		if (!memcmp(codec_info_list[i].acpi_id, acpi_id, ACPI_ID_LEN))
-			return i;
+			return &codec_info_list[i];
 
-	return -EINVAL;
+	return NULL;
 }
 
 /*
@@ -1643,18 +1643,19 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	bool aggregation = !(sof_sdw_quirk & SOF_SDW_NO_AGGREGATION);
 	struct snd_soc_codec_conf *codec_conf;
 	struct sof_sdw_codec_info *codec_info;
+	struct sof_sdw_codec_info *ssp_info;
 	bool append_dai_type = false;
 	bool ignore_pch_dmic = false;
 	int codec_conf_num = 0;
 	int codec_conf_index = 0;
 	bool group_generated[SDW_MAX_GROUPS] = { };
-	int ssp_codec_index, ssp_mask;
 	struct snd_soc_dai_link *dai_links;
 	int num_links, link_index = 0;
 	char *name, *cpu_dai_name;
 	char *codec_name, *codec_dai_name;
 	int i, j, be_id = 0;
 	int hdmi_num;
+	int ssp_mask;
 	int ret;
 
 	ret = get_dailink_info(dev, adr_link, &sdw_be_num, &codec_conf_num);
@@ -1669,8 +1670,8 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	 * system only when I2S mode is supported, not sdw mode.
 	 * Here check ACPI ID to confirm I2S is supported.
 	 */
-	ssp_codec_index = find_codec_info_acpi(mach->id);
-	if (ssp_codec_index >= 0) {
+	ssp_info = find_codec_info_acpi(mach->id);
+	if (ssp_info) {
 		ssp_mask = SOF_SSP_GET_PORT(sof_sdw_quirk);
 		ssp_num = hweight_long(ssp_mask);
 	}
@@ -1788,30 +1789,28 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		goto DMIC;
 
 	for (i = 0, j = 0; ssp_mask; i++, ssp_mask >>= 1) {
-		struct sof_sdw_codec_info *info;
 		int playback, capture;
 
 		if (!(ssp_mask & 0x1))
 			continue;
 
-		info = &codec_info_list[ssp_codec_index];
-
 		name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", i);
 		cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", i);
 		codec_name = devm_kasprintf(dev, GFP_KERNEL, "i2c-%s:0%d",
-					    info->acpi_id, j++);
+					    ssp_info->acpi_id, j++);
 
-		playback = info->dais[0].direction[SNDRV_PCM_STREAM_PLAYBACK];
-		capture = info->dais[0].direction[SNDRV_PCM_STREAM_CAPTURE];
+		playback = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_PLAYBACK];
+		capture = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_CAPTURE];
 
 		ret = init_simple_dai_link(dev, dai_links + link_index, &be_id, name,
 					   playback, capture, cpu_dai_name,
-					   codec_name, info->dais[0].dai_name,
-					   NULL, info->ops);
+					   codec_name, ssp_info->dais[0].dai_name,
+					   NULL, ssp_info->ops);
 		if (ret)
 			return ret;
 
-		ret = info->dais[0].init(card, NULL, dai_links + link_index, info, 0);
+		ret = ssp_info->dais[0].init(card, NULL, dai_links + link_index,
+					     ssp_info, 0);
 		if (ret < 0)
 			return ret;
 
-- 
2.40.1

