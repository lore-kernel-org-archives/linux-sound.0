Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84246FB0
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272477; cv=none; b=BPuEiI4sBLAf3oUJDWIi3E5jpNcLmgokeEv+a0a112H8hVW8ut8H5LuFo/0JNHZz3wClo6CeOwBybbG8T1bMVACLqIx5nxMPSodwJmnFeYpMkfX13r2mimE23Gfnb/54ytoGwMmLxV1OHWqtxYQUtrnBhRVN59Eeibo91vb9/uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272477; c=relaxed/simple;
	bh=SSO8v9kaRxW6CIjWQOztJRB40fZ4Z0Ad64qhN+fKaeA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L1EmnHTItJ8FG8blOtZChLTKGfofAQl07zHXCqcRst86bmwyfjo2PVLhcsGo1IHLTdL+9LS2T68451IMvPmV/sWNV6jorIBXi2f3t77NUZzY0E1KD5lynzLdFiBEMAdrtHWguwZZIwH8mQE2gej8Wa3hA83eEHaBKUYGdTLcAKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJ7KHFsH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJ7KHFsH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272476; x=1746808476;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SSO8v9kaRxW6CIjWQOztJRB40fZ4Z0Ad64qhN+fKaeA=;
  b=KJ7KHFsH5kkLRHKDVDteXBByLVtxP5/UcFumx0qZxFCiP5qQs3p3mxnb
   gAbjTW8Hf4gc/oFf1m9L/0nWfAaN0uDua2w6MYAIHCkYM6TRmeWQKRQYt
   mIARU8aSuzffj21y4hhD6yfj0DIRTR88BT2FrHop8xuK9s7UvtopMkLp7
   +Pb/JCrU6RJ8jG1C5mRaK0XALOSB4/95NV+ERjx6Hg2RQZTzInL6pQmHE
   f8hA+tfzg05CTmWA9ZVyFUA5F8wiDKbwN2rGCMMajTBjGUSdQkbFKLPza
   Gx6EilkMrs2f65Ulk+U6e55jeXN3CUJSov9HlMhXgB7aifNm7jqrgfmm0
   A==;
X-CSE-ConnectionGUID: CvywO9XQRiiU8xZqgTZ/8A==
X-CSE-MsgGUID: LenQIFF9StuDxTABfE30vA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017610"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15017610"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:33 -0700
X-CSE-ConnectionGUID: x0Pbh5TnQFyUHhAxMzbBbQ==
X-CSE-MsgGUID: zI2g/JLAQSW9L8lm15egXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="33761042"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 15/18] ASoC: Intel: sof_sdw: add controls and dapm widgets in codec_info
Date: Thu,  9 May 2024 11:34:15 -0500
Message-Id: <20240509163418.67746-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Currently, we add card controls and dapm widgets one by one in the
codec_info->dais->rtd_init callback. Duplicated controls and dapm
widgets will be added if there are more than one types of amps in the
dai link. Moving it to sof_sdw_rtd_init() and only add the
controls/widgets of the first codec dai can avoid the duplications.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 31 +++++++++++++++++++++++++
 sound/soc/intel/boards/sof_sdw_common.h |  4 ++++
 2 files changed, 35 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 2b97972f85ef..3acc2db61b35 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1248,6 +1248,7 @@ static const char *get_codec_name(struct device *dev,
 
 static int sof_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
+	struct snd_soc_card *card = rtd->card;
 	struct sof_sdw_codec_info *codec_info;
 	struct snd_soc_dai *dai;
 	int dai_index;
@@ -1267,6 +1268,36 @@ static int sof_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 		 */
 		if (codec_info->dais[dai_index].rtd_init_done)
 			continue;
+
+		/*
+		 * Add card controls and dapm widgets for the first codec dai.
+		 * The controls and widgets will be used for all codec dais.
+		 */
+
+		if (i > 0)
+			goto skip_add_controls_widgets;
+
+		if (codec_info->dais[dai_index].controls) {
+			ret = snd_soc_add_card_controls(card, codec_info->dais[dai_index].controls,
+							codec_info->dais[dai_index].num_controls);
+			if (ret) {
+				dev_err(card->dev, "%#x controls addition failed: %d\n",
+					codec_info->part_id, ret);
+				return ret;
+			}
+		}
+		if (codec_info->dais[dai_index].widgets) {
+			ret = snd_soc_dapm_new_controls(&card->dapm,
+							codec_info->dais[dai_index].widgets,
+							codec_info->dais[dai_index].num_widgets);
+			if (ret) {
+				dev_err(card->dev, "%#x widgets addition failed: %d\n",
+					codec_info->part_id, ret);
+				return ret;
+			}
+		}
+
+skip_add_controls_widgets:
 		if (codec_info->dais[dai_index].rtd_init) {
 			ret = codec_info->dais[dai_index].rtd_init(rtd);
 			if (ret)
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 94657dd210f5..a8ba39bd5fd8 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -86,6 +86,10 @@ struct sof_sdw_dai_info {
 	const char *dai_name;
 	const int dai_type;
 	const int dailink[2]; /* dailink id for each direction */
+	const struct snd_kcontrol_new *controls;
+	const int num_controls;
+	const struct snd_soc_dapm_widget *widgets;
+	const int num_widgets;
 	int  (*init)(struct snd_soc_card *card,
 		     struct snd_soc_dai_link *dai_links,
 		     struct sof_sdw_codec_info *info,
-- 
2.40.1

