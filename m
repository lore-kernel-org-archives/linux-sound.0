Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC56D12F392
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712071122; cv=none; b=fsu+YFrBpq7FADp9t+4y+qE4M+srkRKBezewSS2VntiUBHPqTLnx85HYDJ91RS3D9F0VQ7Vufd0ZQjYiQV9SV55pjRyitVoymZtgxRv/L+7LVKohxKZS1ZUKgNzwVNrt6XZhrAz0HqVO5PKF2HYrsi3yPmVHkBT47YWvC/q2C3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712071122; c=relaxed/simple;
	bh=8BNO4J7F02OW61F3M9kbM+GcaQ/g6Fcbv0k9xzs+WiY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JeIdhATSfj1wZrOnRo2OIcq84YDhTokE2ch4TVFZHyKWipMMzcQDM0s391n9/YKmutjskk+30F7F+OQGzKCyWF+mU80WYHydMauzeSGyx4dvQDYvpS08LRADPWrM6M7cAj20VJEuXsyPxFzTs4zn4juhblzmIv8zh8G8RwACxcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNQErN+h; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNQErN+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071121; x=1743607121;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8BNO4J7F02OW61F3M9kbM+GcaQ/g6Fcbv0k9xzs+WiY=;
  b=aNQErN+h8m6+AdXc5EYSnkr4aVIxcKRik057TuPJT0FR13G5yMNdATJq
   zn3PZ/AqoT/lAxhhRndB3ba2iEaQYZRwpoD/xuGxyR3QThYnNdzKvTDnn
   wiqLF8pVZZ/eFyvhB8ivFz6+/SkF1pTKse6xcD+zwJ6KbSs3pP+4Gaii4
   BEVHl0/amBoCkaZQE98ow4XIqwQQioyXrVu8QGVsRSlaDSSF6fA2EyFWV
   IuiWYhUqz2iHT03GmxRthieVzx0ldjU5dGrFZBAB+aIRaod7cXDFmkea+
   8+NipxJlY5SeIbf+ajGsgRLLD661z7W3/BCaBY+CKqsFNMzRrVTNkutNH
   w==;
X-CSE-ConnectionGUID: O0zVnn4KR+K1uYK0y5661w==
X-CSE-MsgGUID: L96XioOKRQSwd6Doj5b48g==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29729958"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="29729958"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:40 -0700
X-CSE-ConnectionGUID: u0gNtmf8TD2rz5WPWo6wPg==
X-CSE-MsgGUID: GcNid/E1SRCwug/Zt5CUdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22796499"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 05/17] ASoC: SOF: Intel: hda-dai: set lowest N bits in ch_mask
Date: Tue,  2 Apr 2024 10:18:16 -0500
Message-Id: <20240402151828.175002-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We always use the lowest N channels of stream. So, set ch_mask to
GENMASK(params_channels(params) - 1, 0).

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 01c544b7e046..810d2997794f 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -441,7 +441,6 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	const struct hda_dai_widget_dma_ops *ops;
-	struct snd_soc_dai_link_ch_map *ch_maps;
 	struct hdac_ext_stream *hext_stream;
 	struct snd_soc_dai *dai;
 	struct snd_sof_dev *sdev;
@@ -449,7 +448,6 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	int cpu_dai_id;
 	int ch_mask;
 	int ret;
-	int j;
 
 	ret = non_hda_dai_hw_params(substream, params, cpu_dai);
 	if (ret < 0) {
@@ -479,11 +477,7 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	if (!cpu_dai_found)
 		return -ENODEV;
 
-	ch_mask = 0;
-	for_each_link_ch_maps(rtd->dai_link, j, ch_maps) {
-		if (ch_maps->cpu == cpu_dai_id)
-			ch_mask |= ch_maps->ch_mask;
-	}
+	ch_mask = GENMASK(params_channels(params) - 1, 0);
 
 	ret = hdac_bus_eml_sdw_map_stream_ch(sof_to_bus(sdev), link_id, cpu_dai->id,
 					     ch_mask,
-- 
2.40.1

