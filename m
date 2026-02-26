Received: from r3-72.sinamail.sina.com.cn (r3-72.sinamail.sina.com.cn [202.108.3.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA83F311587
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 07:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772091386; cv=none; b=QgddW1sCXPif1O73cltCZRfrZNj9dI6dnu4WUZx8AWW5F9TI5rX+28clZzxeeA3wDQzSRhwEUJQcRashXTi1GsI/rcW8uXa0MIdSwzHnZdIJke2r31E1jHKUJ8NzUonVRj2zLy6XNfT6UMpAUzudtV8MxdAzMEFfcUmpimfuUXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772091386; c=relaxed/simple;
	bh=dMpAgh2ICoSWeLXTc4qV90gQjzXPJOCEC4fdFnfoSY8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=a+caGNwqc2y2iAdRQlwaRM6o4uYTkQ1qWnG6kaEcFyTNBnUjEVo9Umxv4AMtSvM3qeYrzXnYmp+ZWi/Y7hfRgMU6NfuTcbW/JbR+QzNHFnWu2AMVY7Qt8m0Lpm5NoBatNczWaxSV/czRCYh/bJ3Car2BlO7cvtkv0y38IjKTXow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.39) with ESMTP
	id 699FF7CB00003FE6; Thu, 26 Feb 2026 15:35:45 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 813FF632AE594A3ABCA2B1F49873ACAF
X-SMAIL-UIID: 813FF632AE594A3ABCA2B1F49873ACAF-20260226-153545
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v2 1/6] ASoC: sdw_utils: Add ES9356 support functions
Date: Thu, 26 Feb 2026 15:35:29 +0800
Message-Id: <20260226073534.3347-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260226073534.3347-1-zhangyi@everest-semi.com>
References: <20260226073534.3347-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Add the functions into the machine driver for the es9356

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 include/sound/soc_sdw_utils.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 227347c8f..179ff3f5e 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -220,6 +220,18 @@ int asoc_sdw_cs42l43_spk_init(struct snd_soc_card *card,
 			      struct asoc_sdw_codec_info *info,
 			      bool playback);
 
+/*es9356 codec support*/
+int asoc_sdw_es9356_init(struct snd_soc_card *card,
+			       struct snd_soc_dai_link *dai_links,
+			       struct asoc_sdw_codec_info *info,
+			       bool playback);
+int asoc_sdw_es9356_amp_init(struct snd_soc_card *card,
+			       struct snd_soc_dai_link *dai_links,
+			       struct asoc_sdw_codec_info *info,
+			       bool playback);
+int asoc_sdw_es9356_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+int asoc_sdw_es9356_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+
 /* CS AMP support */
 int asoc_sdw_bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
 					  int *num_dais, int *num_devs);
@@ -269,5 +281,8 @@ int asoc_sdw_ti_amp_init(struct snd_soc_card *card,
 int asoc_sdw_ti_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_ti_amp_initial_settings(struct snd_soc_card *card,
 				     const char *name_prefix);
+int asoc_sdw_es9356_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_es9356_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_es9356_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
 #endif
-- 
2.17.1

