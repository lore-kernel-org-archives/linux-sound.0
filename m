Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB15512F58D
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712071122; cv=none; b=L5NQYwH6/I5//wwVW2CT3rh3cGLadvD44pVy3/UAluKDumlL7Sn8ue/J1L6XWUShQhrLloj7XmhTvKfLJS1Q7wt6m3Tqy1LvnnPyVBasS9Ijw5GXzY1ZfvxmYsrfOpbrWy+IIbtslw3aLLef6BC//oRZfNSVZe+IcYD/anc2AnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712071122; c=relaxed/simple;
	bh=5HUVtiHfmlXk+jWscSVzpLeX0qMTIto3rwwmG7/w/HA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pzhhTvWa54uezdRXkr24IRvjit2yz4O/RZCk2uVsfsM9uWRQ/mqDEye9XF6U+fTsgw0spj2RtCx3kbAMOqXtpMdHMCAT3yBFPyqrfLBYu1Srao4nUaUF5ojuEkydc7kja6kgQljKX4PCPNQ88IPFZasjIwZ0gm27fxG7gkOc4LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=erdUzu+O; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="erdUzu+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071121; x=1743607121;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5HUVtiHfmlXk+jWscSVzpLeX0qMTIto3rwwmG7/w/HA=;
  b=erdUzu+OLj7+Xu04b7nfZHYaGd88Uh3FTHG/xPHvZw58Hthnpz5qZBPK
   iuQUhoCprCfEIo82uOdkCJxL0Z9UNupLHrHOF6J0aotK3NPtHEqAnXK1/
   WzM1Gs6c+YPQkWPzLJpoPvKitsBycJTX4zK+51mHFLF4JqlMzdb/uWq7I
   Iy2KcefdmDvT7zKLtU7TS7zX1KslgKH8SWAr1bpL5UPbb4kaPo3Dq2LXX
   fOloZjPMIZLIBLNtU7ZmC5bJnpiYucn7Lb9bIGYMo7LGGcc9BzEtcZMCi
   NleIMnFYmWahJihwP9PdCnofXuOglKYC0PDhFwtEvEFohy1ulpm6KftAW
   A==;
X-CSE-ConnectionGUID: DatpEIHLRhuG38QCOTWoHA==
X-CSE-MsgGUID: +PdE6eyOQ/anACDWOHwprA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29729977"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="29729977"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:40 -0700
X-CSE-ConnectionGUID: 1McjJpYVTg2gV98giP6G5w==
X-CSE-MsgGUID: BwOOpI5kSxaHrOR+zOOY9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22796503"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 06/17] ASoC: SOF: Intel: hda-dai: set dma_stream_channel_map device
Date: Tue,  2 Apr 2024 10:18:17 -0500
Message-Id: <20240402151828.175002-7-pierre-louis.bossart@linux.intel.com>
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

sof_ipc4_dma_config_tlv{} is required for ACE2.x. The patch follow the
convention to set the dma_stream_channel_map.mapping device as
"link_id << 8 | pdi_id".
And the mapping in sof_ipc4_alh_configuration_blob{} should be the same
as dma_stream_channel_map.mapping in sof_ipc4_dma_config{}.
The purposes of device id is to map DMA tlv.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 36 +++++++++++++++++++++++++++++++++--
 sound/soc/sof/ipc4-topology.c | 13 +++++++++++++
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 810d2997794f..de71e1595a78 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -346,6 +346,7 @@ static int non_hda_dai_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *cpu_dai)
 {
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sof_ipc4_dma_config_tlv *dma_config_tlv;
 	const struct hda_dai_widget_dma_ops *ops;
 	struct sof_ipc4_dma_config *dma_config;
@@ -353,6 +354,8 @@ static int non_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	struct hdac_ext_stream *hext_stream;
 	struct hdac_stream *hstream;
 	struct snd_sof_dev *sdev;
+	struct snd_soc_dai *dai;
+	int cpu_dai_id;
 	int stream_id;
 	int ret;
 
@@ -392,7 +395,12 @@ static int non_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	/* configure TLV */
 	ipc4_copier = widget_to_copier(w);
 
-	dma_config_tlv = &ipc4_copier->dma_config_tlv[0];
+	for_each_rtd_cpu_dais(rtd, cpu_dai_id, dai) {
+		if (dai == cpu_dai)
+			break;
+	}
+
+	dma_config_tlv = &ipc4_copier->dma_config_tlv[cpu_dai_id];
 	dma_config_tlv->type = SOF_IPC4_GTW_DMA_CONFIG_ID;
 	/* dma_config_priv_size is zero */
 	dma_config_tlv->length = sizeof(dma_config_tlv->dma_config);
@@ -403,7 +411,11 @@ static int non_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	dma_config->pre_allocated_by_host = 1;
 	dma_config->dma_channel_id = stream_id - 1;
 	dma_config->stream_id = stream_id;
-	dma_config->dma_stream_channel_map.device_count = 0; /* mapping not used */
+	/*
+	 * Currently we use a DMA for each device in ALH blob. The device will
+	 * be copied in sof_ipc4_prepare_copier_module.
+	 */
+	dma_config->dma_stream_channel_map.device_count = 1;
 	dma_config->dma_priv_config_size = 0;
 
 skip_tlv:
@@ -440,7 +452,10 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct sof_ipc4_dma_config_tlv *dma_config_tlv;
 	const struct hda_dai_widget_dma_ops *ops;
+	struct sof_ipc4_dma_config *dma_config;
+	struct sof_ipc4_copier *ipc4_copier;
 	struct hdac_ext_stream *hext_stream;
 	struct snd_soc_dai *dai;
 	struct snd_sof_dev *sdev;
@@ -448,6 +463,7 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	int cpu_dai_id;
 	int ch_mask;
 	int ret;
+	int i;
 
 	ret = non_hda_dai_hw_params(substream, params, cpu_dai);
 	if (ret < 0) {
@@ -489,6 +505,22 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
+	ipc4_copier = widget_to_copier(w);
+	dma_config_tlv = &ipc4_copier->dma_config_tlv[cpu_dai_id];
+	dma_config = &dma_config_tlv->dma_config;
+	dma_config->dma_stream_channel_map.mapping[0].device = link_id << 8 | cpu_dai->id;
+	dma_config->dma_stream_channel_map.mapping[0].channel_mask = ch_mask;
+
+	/*
+	 * copy the dma_config_tlv to all ipc4_copier in the same link. Because only one copier
+	 * will be handled in sof_ipc4_prepare_copier_module.
+	 */
+	for_each_rtd_cpu_dais(rtd, i, dai) {
+		w = snd_soc_dai_get_widget(dai, substream->stream);
+		ipc4_copier = widget_to_copier(w);
+		memcpy(&ipc4_copier->dma_config_tlv[cpu_dai_id], dma_config_tlv,
+		       sizeof(*dma_config_tlv));
+	}
 	return 0;
 }
 
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 1870488b3cf6..28ab687a1d9c 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1704,6 +1704,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		 */
 		if (ipc4_copier->dai_type == SOF_DAI_INTEL_ALH) {
 			struct sof_ipc4_alh_configuration_blob *blob;
+			struct sof_ipc4_dma_config *dma_config;
 			struct sof_ipc4_copier_data *alh_data;
 			struct sof_ipc4_copier *alh_copier;
 			struct snd_sof_widget *w;
@@ -1743,6 +1744,18 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 				alh_copier = (struct sof_ipc4_copier *)dai->private;
 				alh_data = &alh_copier->data;
 				blob->alh_cfg.mapping[i].device = alh_data->gtw_cfg.node_id;
+
+				/*
+				 * The mapping[i] device in ALH blob should be the same as the
+				 * dma_config_tlv[i] mapping device if a dma_config_tlv is present.
+				 * The device id will be used for DMA tlv mapping purposes.
+				 */
+				if (ipc4_copier->dma_config_tlv[i].length) {
+					dma_config = &ipc4_copier->dma_config_tlv[i].dma_config;
+					blob->alh_cfg.mapping[i].device =
+						dma_config->dma_stream_channel_map.mapping[0].device;
+				}
+
 				/*
 				 * Set the same channel mask for playback as the audio data is
 				 * duplicated for all speakers. For capture, split the channels
-- 
2.40.1

