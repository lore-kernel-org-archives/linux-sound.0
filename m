Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D20E13C901
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469124; cv=none; b=DuIiQrVY6lhAozvoNOI1M+R40/D/C7E4RMCtT2fhmaihhB/ccGxRg4j7gcDyY8Slcjy5Mys/REFU+0nvMaZegGh4XsC18Ls7FgfhY3kp2s2yMYCD3Pl0/Mojj4dQluaHrdX56rYOE8LnvJOaKnaWXZXE+gsslxCNG6UwtRH6gGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469124; c=relaxed/simple;
	bh=U4OtHoNqJ+4hCKh/I0uepPXi2zqFsbV/bIV5qmonHx0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KZqO//zeopKu13lDy4Uc1JZ+XRYLr0M+y4LEj0JYb3EvpEbJYdoOVD7UFNBO5nQlI1v/UlVL4uG7NyUH6VWJfp5hC1da3S8rpndsa0D0qErTYHiowUnsDsgPws9oy7AddD9z0cl7tDnkDbkUaOgKahsU3Ykq7AgW2IqKjaEbwm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qbd8ALSG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qbd8ALSG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469122; x=1743005122;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U4OtHoNqJ+4hCKh/I0uepPXi2zqFsbV/bIV5qmonHx0=;
  b=Qbd8ALSGOeAqMo0Rk+dy+cJvtJ337O65gKpivimJjVUuFD+0Wz9QpnTZ
   7y2/DN8Xcsmf/IuNYsQnaYkggm6NrAB93G5M9kZnOmf/X2To5DLnpypkn
   XQWZlk6LGL/ZldbJdW67870/J+Vpf3e2FbZsg2Vxdfwbx/evzGKvQryIl
   qwysZzJ0oyo2ZiOsAG15lPtxspui0GXVAVXeFZcX8LLOEfY8WL7J2Z3G8
   G/9Nf/7MAy+qJKNTIWQdycR3UISAR+fj7pABGZIja529YnCUIzr2/ZAC1
   TbsCMdEH8OAQuLqi8kJK1czhZeZYAexnsmc9mFmxvuFhnUSGMjm+sM09m
   g==;
X-CSE-ConnectionGUID: mfeixbkVTh+l3pwZGgV6HA==
X-CSE-MsgGUID: FpB7AowwRiGy7XWzEp75MQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260353"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260353"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482158"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:45 -0700
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
Subject: [PATCH 05/34] ASoC: intel: sof_sdw: Set channel map directly from endpoints
Date: Tue, 26 Mar 2024 11:04:00 -0500
Message-Id: <20240326160429.13560-6-pierre-louis.bossart@linux.intel.com>
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

The current code evenly distributes the CODEC DAIs across the CPU
DAIs in the DAI link, but this is just an assumption about how the
devices are connected to the host. All the information about which
CODEC is connected to which CPU DAI is contained in the endpoints
datastructures and those structures are already parsed to work out
which CODECs to include in the DAI link. Simply fill in the mapping
from CPUs -> CODECs as we parse through the endpoints structures,
this will ensure that mapping matches the physical layout.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 7b61d45df5da..e2c1822b185f 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1407,19 +1407,6 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 	return 0;
 }
 
-static void set_dailink_map(struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps,
-			    int codec_num, int cpu_num)
-{
-	int step;
-	int i;
-
-	step = codec_num / cpu_num;
-	for (i = 0; i < codec_num; i++) {
-		sdw_codec_ch_maps[i].cpu	= i / step;
-		sdw_codec_ch_maps[i].codec	= i;
-	}
-}
-
 static int sof_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_sdw_codec_info *codec_info;
@@ -1466,6 +1453,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct device *dev = card->dev;
 	const struct snd_soc_acpi_link_adr *adr_link_next;
+	struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps;
 	struct snd_soc_dai_link_component *codecs;
 	struct snd_soc_dai_link_component *cpus;
 	struct sof_sdw_codec_info *codec_info;
@@ -1488,6 +1476,11 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 	if (!codecs)
 		return -ENOMEM;
 
+	sdw_codec_ch_maps = devm_kcalloc(dev, codec_num,
+					 sizeof(*sdw_codec_ch_maps), GFP_KERNEL);
+	if (!sdw_codec_ch_maps)
+		return -ENOMEM;
+
 	/* generate codec name on different links in the same group */
 	j = adr_index;
 	for (adr_link_next = adr_link; adr_link_next && adr_link_next->num_adr &&
@@ -1521,6 +1514,9 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			(*codec_conf)->dlc = codecs[codec_dlc_index];
 			(*codec_conf)->name_prefix = adr_link_next->adr_d[j].name_prefix;
 
+			sdw_codec_ch_maps[codec_dlc_index].cpu = i;
+			sdw_codec_ch_maps[codec_dlc_index].codec = codec_dlc_index;
+
 			codec_dlc_index++;
 			(*codec_conf)++;
 		}
@@ -1539,7 +1535,6 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		*ignore_pch_dmic = true;
 
 	for_each_pcm_streams(stream) {
-		struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps;
 		char *name, *cpu_name;
 		int playback, capture;
 		static const char * const sdw_stream_name[] = {
@@ -1558,11 +1553,6 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			return -EINVAL;
 		}
 
-		sdw_codec_ch_maps = devm_kcalloc(dev, codec_num,
-						 sizeof(*sdw_codec_ch_maps), GFP_KERNEL);
-		if (!sdw_codec_ch_maps)
-			return -ENOMEM;
-
 		/* create stream name according to first link id */
 		if (append_dai_type) {
 			name = devm_kasprintf(dev, GFP_KERNEL,
@@ -1614,9 +1604,8 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		 * based on wait_for_completion(), tag them as 'nonatomic'.
 		 */
 		dai_links[*link_index].nonatomic = true;
-
-		set_dailink_map(sdw_codec_ch_maps, codec_num, cpu_dai_num);
 		dai_links[*link_index].ch_maps = sdw_codec_ch_maps;
+
 		ret = set_codec_init_func(card, adr_link, dai_links + (*link_index)++,
 					  playback, group_id, adr_index, dai_index);
 		if (ret < 0) {
-- 
2.40.1

