Received: from r3-55.sinamail.sina.com.cn (r3-55.sinamail.sina.com.cn [202.108.3.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8175617BA6
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 13:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775914292; cv=none; b=I3aL/vFGewSSKaAr/8cDAAXXSJPtzCDZsFkBtIJInpYPCjj+LYfaocNsfCzyJc8KW7R2dqPBTVMR5djfP4/odOxc5/63Gaz8ubqp5EL9w33/wUbSbA9FWXS1Gv+51B8gMIgn6O4v1axDVOJsen72nrx1daG9guBG0w8spjZOkZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775914292; c=relaxed/simple;
	bh=hp/JJGz3UOK1zHicj+PSx44yst++h6sRYUTdx6ggakU=;
	h=From:To:Cc:Subject:Date:Message-Id; b=DzOOjdy2z9JxVj+5pnP3Ot5D+/Ock1QKv4Eq/G3IfRao9xIuo8cbxTSohfmo6CmmeWr7WD+6aRN5ftpFjxpOttaEXsJFp8P3+mmWqpp0tstgIyy7FTCJE3lrTcwGfeJHIv12Be4Nm9xF3uoiJg4dc/MXcAIoXgh3uA7a6jzpVuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.38) with ESMTP
	id 69DA49A70000448C; Sat, 11 Apr 2026 21:16:25 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: EF3B505C654D42F489CDA2BB7D51C94E
X-SMAIL-UIID: EF3B505C654D42F489CDA2BB7D51C94E-20260411-211625
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH] 1
Date: Sat, 11 Apr 2026 21:16:18 +0800
Message-Id: <20260411131618.7931-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

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

