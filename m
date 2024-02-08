Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595E180058
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411364; cv=none; b=HJoUreeMzaI3u7hr2iCqe9UX71TnxybVoeKqLwAKEQsxYbj+Msy04aOcquDBs/2KE4vO9rA9gk1+oclebrCyhTsH205yFEFPLFd9BIzJv6CsCmql9cbTI2AGl8g8lNKeCnCW1L3e9O8lsXkSXYOjzDvqJxhgoP6vj8ot3o23zCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411364; c=relaxed/simple;
	bh=4n8aJxdWfRtljlJtGHex4bY9uxESjHTI/pSkkgcvYhs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rve7tIRlqNb6yzk52mvGtCSTi2DXMwAN0k97kIJnnragWR805xydzzyunD6lpwZoKq5aATuadcxl9IgQqfht0nYv9RFyGi4UyWbu/PCo9V5QrYmDhdEC85p5hOqxHey9DAODjj2Uy/7wBEKLDfMY9R0IKyNREgPrsqGYdlGCh44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q6NlWqk4; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q6NlWqk4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411362; x=1738947362;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4n8aJxdWfRtljlJtGHex4bY9uxESjHTI/pSkkgcvYhs=;
  b=Q6NlWqk4X0R5pjCzcenDSWGY6zY4EeMxXP6JkeD8z/v+lWQo6nQSan/z
   NApFMorClZ58kkbE9BHH4uhlrbYht+Zj4J4mo+bxnEue3AcKsfDiAwJms
   Im5PEoMVeZ5ewPyE1RfdtlbQgp/S2PObv4enlrxylYpJimxuCVtd9/Y78
   obx4Ml+qsIF9hjq2L3VpGIEpLNi1c34pUS2NQlOs2qPx2vLfjBgQaAsGt
   xT+KsElAq0AMUXLTO3wpV/dqmW7exZnQ7GCPZFAwZTxc90VR/bMSH77xd
   cicISGThDuRZqUeO2DVju/8hWI7Q5oUKeRhaJqGtAVagq1FmubPETyl9b
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675353"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675353"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690190"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:00 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 10/24] ASoC: Intel: add get_codec_dai_by_name helper function
Date: Thu,  8 Feb 2024 10:55:31 -0600
Message-Id: <20240208165545.93811-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Currently, we assume the codecs in a dai link are all the same.
So that we get codec dai with snd_soc_rtd_to_codec(rtd, 0) in dai_links
->init callback. However, a link can include different codecs.
For example, a 4 speakers link can consist of rt712 and rt1316.
Therefore, we need to select the codec dai by name in the dai link.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 18 ++++++++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 25f9ff12618c..9c08d3e54e3b 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -584,6 +584,24 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_NS(sof_intel_board_set_dai_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
+struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
+					  const char *dai_name[], int num_dais)
+{
+	struct snd_soc_dai *dai;
+	int index;
+	int i;
+
+	for (index = 0; index < num_dais; index++)
+		for_each_rtd_codec_dais(rtd, i, dai)
+			if (strstr(dai->name, dai_name[index])) {
+				dev_dbg(rtd->card->dev, "get dai %s\n", dai->name);
+				return dai;
+			}
+
+	return NULL;
+}
+EXPORT_SYMBOL_NS(get_codec_dai_by_name, SND_SOC_INTEL_SOF_BOARD_HELPERS);
+
 MODULE_DESCRIPTION("ASoC Intel SOF Machine Driver Board Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index c5d6e7bec5d4..b626198f685d 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -118,4 +118,7 @@ int sof_intel_board_set_hdmi_in_link(struct device *dev,
 				     struct snd_soc_dai_link *link, int be_id,
 				     int ssp_hdmi);
 
+struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
+					  const char *dai_name[], int num_dais);
+
 #endif /* __SOF_INTEL_BOARD_HELPERS_H */
-- 
2.40.1

