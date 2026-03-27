Received: from r3-175.sinamail.sina.com.cn (r3-175.sinamail.sina.com.cn [202.108.3.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7014361DD1
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 10:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774605642; cv=none; b=aLb4fICrXIamNC3mgE2M+ZDHHkEDplYOhwtCC7WirpY5X61CBUoggzn1yPYHds71efpn2BMGS+CNBMZUS7N4kYhwLA9CmtGl1ZkRzJWCDa7C83M5xxPkdTp26kqVTZfYJseOH2Z+VR853mL7CcTb0i+vHJ7TPBMP0TtU4OK9/iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774605642; c=relaxed/simple;
	bh=f5p7Z5dOufwr5bF6H9LTV4S40FYcv+Ntsmv5qOlhYEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=jMvq8zY6gXgRzA6Fnr3yjOrxlm0CfP8yNkFWSzjQ9ZnuccIpRXbixgW+AThXKoMnUDRQSFBoRgoTDRPyhu+ISAoSCcUymSzidMQPl9/IKePvQiote0My4trSnYvZCC3gbx7k+8TJ+SeouRGFZBag+UCTjBzJTqx5wTEPduln1wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.38) with ESMTP
	id 69C6551D000030E9; Fri, 27 Mar 2026 17:59:59 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 1ADAAB7BC57E43CCBD97650C5F7D9930
X-SMAIL-UIID: 1ADAAB7BC57E43CCBD97650C5F7D9930-20260327-175959
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v4 1/6] ASoC: sdw_utils: Add ES9356 support functions
Date: Fri, 27 Mar 2026 17:59:49 +0800
Message-Id: <20260327095954.3465-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260327095954.3465-1-zhangyi@everest-semi.com>
References: <20260327095954.3465-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Add the functions into the machine driver for the es9356

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 include/sound/soc_sdw_utils.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 98531e500..c18f5016d 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -220,6 +220,17 @@ int asoc_sdw_cs42l43_spk_init(struct snd_soc_card *card,
 			      struct asoc_sdw_codec_info *info,
 			      bool playback);
 
+/* es9356 codec support */
+int asoc_sdw_es9356_init(struct snd_soc_card *card,
+			       struct snd_soc_dai_link *dai_links,
+			       struct asoc_sdw_codec_info *info,
+			       bool playback);
+int asoc_sdw_es9356_amp_init(struct snd_soc_card *card,
+			       struct snd_soc_dai_link *dai_links,
+			       struct asoc_sdw_codec_info *info,
+			       bool playback);
+int asoc_sdw_es9356_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+
 /* CS AMP support */
 int asoc_sdw_bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
 					  int *num_dais, int *num_devs);
@@ -271,5 +282,8 @@ int asoc_sdw_ti_amp_init(struct snd_soc_card *card,
 int asoc_sdw_ti_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_ti_amp_initial_settings(struct snd_soc_card *card,
 				     const char *name_prefix);
+int asoc_sdw_es9356_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_es9356_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_es9356_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
 #endif
-- 
2.17.1

