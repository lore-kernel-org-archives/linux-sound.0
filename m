Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D254E12C53A
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712071119; cv=none; b=lDB34twl1lwHKJuh466eY3OzAkKvdXxepfv/kdcjkh1aJ+bnTOmBi1i4wkpUueRIDyuAN+h848Fh6TMGDuwWtGXKbEDeRLV49HBpmW5oPB5lDEd9xJGEuZ23MAkxipp3mr7BhJnYBBKwe6ryLXlivhxA69F5eG0R7OoGqoyn6qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712071119; c=relaxed/simple;
	bh=AYZIq1B3O4S1WmPeBiEUE6o6mCxBUswzwucEVLI4JAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hnjKSRo2yn7ITEy9coZb5UsDtSBS1FXzF5j2D/MoMII7aTjnd/L+TKY/YsSB3snttDVR0i5HtJFOVNn2ZTJEuPHAOmckK7cJJkC4hyvLG73q+XajR+xQoYmP2vkHtCSCiFZkgDy1HBc3h7nXXfhrmH8k4vP5XCN3dc3bKj+ApRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EggxbU3a; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EggxbU3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071118; x=1743607118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AYZIq1B3O4S1WmPeBiEUE6o6mCxBUswzwucEVLI4JAg=;
  b=EggxbU3aVYur7gid/KOcp8qCXOiYwQ7TJijZUppIJjRMlNLPy6lc02ua
   QHsaAtOvpTAFd7NwNTOP+LT/D/NzznyvppxxEEEukfB717wqOhEPQu0zV
   uLtXqmXQ6F9uqDUbdoRhrkoLvNF9St0m+cJBG9K3vV8xqIOVy7SrACPxl
   yWFYypH5bru1Hglsac3jxPXfpMdZN3tr0v+SceqQ/j92yinRhXrocIZMa
   honjfGnKl4mSyF5HeTv4qXyHk6JM2fqdeHPzec6H1cyGU0FwX+/N718f6
   FDY45dOGYmMRnernvZwGnv+h7YJQ46BnoWuciMa78mqNfsnN0AdC+dgFM
   g==;
X-CSE-ConnectionGUID: mGgNIT8kRzCg87q9KkfkSQ==
X-CSE-MsgGUID: RUxHQEZDSvi5eRZwRpq8jA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29729886"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="29729886"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:37 -0700
X-CSE-ConnectionGUID: MbUaWclbSq2E+iHyZNRcXw==
X-CSE-MsgGUID: Agehy73eRCOeeSfUVMJqDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22796487"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>
Subject: [PATCH 01/17] ASoC: SOF: Intel: hda-dai: fix channel map configuration for aggregated dailink
Date: Tue,  2 Apr 2024 10:18:12 -0500
Message-Id: <20240402151828.175002-2-pierre-louis.bossart@linux.intel.com>
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

The existing code derives the channel map used to program the HDaudio
link DMA from the hw_params, but that is not quite right in the case
of aggregation. The code in soc-pcm.c splits the hw_params depending
on the codec_ch_map, and we need to reconstruct the channel-map to
insert the data in the right places.

This issue is seen only on amplifier feedback capture where the data
from the second amplifier was replaced by that of the first amplifier.

Note that the loop iterator of the macro for_each_rtd_cpu_dais() is
reused in a following loop. This is different to all existing usages
of that macro, hence the use of a boolean flag to avoid an access to
an uninitialized variable.

Fixes: 2960ee5c4814 ("ASoC: SOF: Intel: hda-dai: add helpers for SoundWire callbacks")
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index c1682bcdb5a6..6a39ca632f55 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -439,10 +439,17 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 			  int link_id)
 {
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	const struct hda_dai_widget_dma_ops *ops;
+	struct snd_soc_dai_link_ch_map *ch_maps;
 	struct hdac_ext_stream *hext_stream;
+	struct snd_soc_dai *dai;
 	struct snd_sof_dev *sdev;
+	bool cpu_dai_found = false;
+	int cpu_dai_id;
+	int ch_mask;
 	int ret;
+	int j;
 
 	ret = non_hda_dai_hw_params(substream, params, cpu_dai);
 	if (ret < 0) {
@@ -457,9 +464,29 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	if (!hext_stream)
 		return -ENODEV;
 
-	/* in the case of SoundWire we need to program the PCMSyCM registers */
+	/*
+	 * in the case of SoundWire we need to program the PCMSyCM registers. In case
+	 * of aggregated devices, we need to define the channel mask for each sublink
+	 * by reconstructing the split done in soc-pcm.c
+	 */
+	for_each_rtd_cpu_dais(rtd, cpu_dai_id, dai) {
+		if (dai == cpu_dai) {
+			cpu_dai_found = true;
+			break;
+		}
+	}
+
+	if (!cpu_dai_found)
+		return -ENODEV;
+
+	ch_mask = 0;
+	for_each_link_ch_maps(rtd->dai_link, j, ch_maps) {
+		if (ch_maps->cpu == cpu_dai_id)
+			ch_mask |= ch_maps->ch_mask;
+	}
+
 	ret = hdac_bus_eml_sdw_map_stream_ch(sof_to_bus(sdev), link_id, cpu_dai->id,
-					     GENMASK(params_channels(params) - 1, 0),
+					     ch_mask,
 					     hdac_stream(hext_stream)->stream_tag,
 					     substream->stream);
 	if (ret < 0) {
-- 
2.40.1

