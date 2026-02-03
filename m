Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500043191B4
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 11:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770118858; cv=none; b=o7olIJHoasOs0zWopzg7z3l5CBfltbIMliKydEbSnOqnl2aA3iJRVWXUvwnS69uyEc38zoGgTLihbY/PBlbjQ+fq9BaT9VlkidICDGUQZgnUHMZs3KUliKMDMOYVMVqE5rdhoJPlDFI7MCM1QEZKNr/VDszkTxGrolOsjFIyeus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770118858; c=relaxed/simple;
	bh=hKdskTdva6ZTS0it8yWOV9slqlQV6TuI1vqHhWTFq3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h6ORYGcXSmY2aMxAeiV1umjJRmwMaP93XbrLBBVOX/wF2bnozVVKPKQGvAnEa5U368sOraufbYYpvYe3cRdce/J0AURw+ORYOWL6V19V/zQQyHEX1U4hYI+QkrNcCbAye9BnVKkx+d3PS3Lpxglb880ZfIlX3bwJH7To1zOEwQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+mXOigM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+mXOigM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770118857; x=1801654857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hKdskTdva6ZTS0it8yWOV9slqlQV6TuI1vqHhWTFq3o=;
  b=Z+mXOigM45G4rRmtB+lv3EFtFeCnLBx8YwkVJOfbleS+L/EZRF/S6+cJ
   Dzf85da9INIaxWgVpMyJp/hlo/IoK5drK3Eb6vZkiN3wF002jAVMcElKo
   aJWmeiIgISB3aPj3pb9tWM4WmAXo/1x0aij3dHum6FbxKxGFcn3+nZ0sq
   809F/uWETQWNZMGsorPyf70ZMZxek4OYXO0KxjzUxENEXnf+Ugjhh8Uui
   oZp6bOIpHfTM5mw82auGT6vf2GqgZwvb1aViWp3hS0rwL2i/etW1e4Z9n
   hXGgV4Nh2LMvssdzTI3JEPVQhtB4n8WAO6g5dwvUWBT4zJSCtte7VLh3S
   w==;
X-CSE-ConnectionGUID: 78SVvuRES8S7DMm93Cs7MA==
X-CSE-MsgGUID: /2Zx7/d0TcC/S3JZbyg29g==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82023859"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="82023859"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 03:40:57 -0800
X-CSE-ConnectionGUID: yfKB8nPgRfG2ZjqiJiQ97A==
X-CSE-MsgGUID: yCyf2DlwQSWB9+/tbFJZKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209547603"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 03:40:55 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 2/3] ASoC: SOF: Intel: add hda_dma_prepare/cleanup helpers
Date: Tue,  3 Feb 2026 19:40:26 +0800
Message-ID: <20260203114027.3742558-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203114027.3742558-1-yung-chuan.liao@linux.intel.com>
References: <20260203114027.3742558-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

SoundWire BPT stream needs to use link and host DMAs. Thus we need
helpers to prepare and cleanup the link and host DMAs. Currently the
SoundWire BPT stream uses hda_cl_prepare/cleanup helpers. It works fine
because we assume the SwoundWire BPT will not run with audio streams
simultaneously. The new helpers are copied from hda_cl_prepare/cleanup
and add a flag to reserve the paired host and link DMAs. The new helpers
will be used by both code loader and SoundWire BPT.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c |  94 +------------------------
 sound/soc/sof/intel/hda-stream.c | 116 +++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h        |   8 +++
 3 files changed, 127 insertions(+), 91 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 2cc11d8b0f70..2b3abcf75d55 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -53,65 +53,8 @@ hda_cl_prepare(struct device *dev, unsigned int format, unsigned int size,
 	       struct snd_dma_buffer *dmab, bool persistent_buffer, int direction,
 	       bool is_iccmax)
 {
-	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
-	struct hdac_ext_stream *hext_stream;
-	struct hdac_stream *hstream;
-	int ret;
-
-	hext_stream = hda_dsp_stream_get(sdev, direction, 0);
-
-	if (!hext_stream) {
-		dev_err(sdev->dev, "error: no stream available\n");
-		return ERR_PTR(-ENODEV);
-	}
-	hstream = &hext_stream->hstream;
-	hstream->substream = NULL;
-
-	/*
-	 * Allocate DMA buffer if it is temporary or if the buffer is intended
-	 * to be persistent but not yet allocated.
-	 * We cannot rely solely on !dmab->area as caller might use a struct on
-	 * stack (when it is temporary) without clearing it to 0.
-	 */
-	if (!persistent_buffer || !dmab->area) {
-		ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_SG, dev, size, dmab);
-		if (ret < 0) {
-			dev_err(sdev->dev, "%s: memory alloc failed: %d\n",
-				__func__, ret);
-			goto out_put;
-		}
-	}
-
-	hstream->period_bytes = 0;/* initialize period_bytes */
-	hstream->format_val = format;
-	hstream->bufsize = size;
-
-	if (is_iccmax) {
-		ret = hda_dsp_iccmax_stream_hw_params(sdev, hext_stream, dmab, NULL);
-		if (ret < 0) {
-			dev_err(sdev->dev, "error: iccmax stream prepare failed: %d\n", ret);
-			goto out_free;
-		}
-	} else {
-		ret = hda_dsp_stream_hw_params(sdev, hext_stream, dmab, NULL);
-		if (ret < 0) {
-			dev_err(sdev->dev, "error: hdac prepare failed: %d\n", ret);
-			goto out_free;
-		}
-		hda_dsp_stream_spib_config(sdev, hext_stream, HDA_DSP_SPIB_ENABLE, size);
-	}
-
-	return hext_stream;
-
-out_free:
-	snd_dma_free_pages(dmab);
-	dmab->area = NULL;
-	dmab->bytes = 0;
-	hstream->bufsize = 0;
-	hstream->format_val = 0;
-out_put:
-	hda_dsp_stream_put(sdev, direction, hstream->stream_tag);
-	return ERR_PTR(ret);
+	return hda_data_stream_prepare(dev, format, size, dmab, persistent_buffer,
+				       direction, is_iccmax, false);
 }
 EXPORT_SYMBOL_NS(hda_cl_prepare, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
@@ -275,38 +218,7 @@ EXPORT_SYMBOL_NS(hda_cl_trigger, "SND_SOC_SOF_INTEL_HDA_COMMON");
 int hda_cl_cleanup(struct device *dev, struct snd_dma_buffer *dmab,
 			  bool persistent_buffer, struct hdac_ext_stream *hext_stream)
 {
-	struct snd_sof_dev *sdev =  dev_get_drvdata(dev);
-	struct hdac_stream *hstream = &hext_stream->hstream;
-	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
-	int ret = 0;
-
-	if (hstream->direction == SNDRV_PCM_STREAM_PLAYBACK)
-		ret = hda_dsp_stream_spib_config(sdev, hext_stream, HDA_DSP_SPIB_DISABLE, 0);
-	else
-		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, sd_offset,
-					SOF_HDA_SD_CTL_DMA_START, 0);
-
-	hda_dsp_stream_put(sdev, hstream->direction, hstream->stream_tag);
-	hstream->running = 0;
-	hstream->substream = NULL;
-
-	/* reset BDL address */
-	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPL, 0);
-	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
-			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPU, 0);
-
-	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, sd_offset, 0);
-
-	if (!persistent_buffer) {
-		snd_dma_free_pages(dmab);
-		dmab->area = NULL;
-		dmab->bytes = 0;
-		hstream->bufsize = 0;
-		hstream->format_val = 0;
-	}
-
-	return ret;
+	return hda_data_stream_cleanup(dev, dmab, persistent_buffer, hext_stream, false);
 }
 EXPORT_SYMBOL_NS(hda_cl_cleanup, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 36b647d987fc..1c04b5d9c0d8 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -1243,3 +1243,119 @@ u64 hda_dsp_get_stream_ldp(struct snd_sof_dev *sdev,
 	return ((u64)ldp_u << 32) | ldp_l;
 }
 EXPORT_SYMBOL_NS(hda_dsp_get_stream_ldp, "SND_SOC_SOF_INTEL_HDA_COMMON");
+
+struct hdac_ext_stream *
+hda_data_stream_prepare(struct device *dev, unsigned int format, unsigned int size,
+			struct snd_dma_buffer *dmab, bool persistent_buffer, int direction,
+			bool is_iccmax, bool pair)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	struct hdac_ext_stream *hext_stream;
+	struct hdac_stream *hstream;
+	int ret;
+
+	if (pair)
+		hext_stream = hda_dsp_stream_pair_get(sdev, direction, 0);
+	else
+		hext_stream = hda_dsp_stream_get(sdev, direction, 0);
+
+	if (!hext_stream) {
+		dev_err(sdev->dev, "%s: no stream available\n", __func__);
+		return ERR_PTR(-ENODEV);
+	}
+	hstream = &hext_stream->hstream;
+	hstream->substream = NULL;
+
+	/*
+	 * Allocate DMA buffer if it is temporary or if the buffer is intended
+	 * to be persistent but not yet allocated.
+	 * We cannot rely solely on !dmab->area as caller might use a struct on
+	 * stack (when it is temporary) without clearing it to 0.
+	 */
+	if (!persistent_buffer || !dmab->area) {
+		ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_SG, dev, size, dmab);
+		if (ret < 0) {
+			dev_err(sdev->dev, "%s: memory alloc failed: %d\n",
+				__func__, ret);
+			goto out_put;
+		}
+	}
+
+	hstream->period_bytes = 0; /* initialize period_bytes */
+	hstream->format_val = format;
+	hstream->bufsize = size;
+
+	if (is_iccmax) {
+		ret = hda_dsp_iccmax_stream_hw_params(sdev, hext_stream, dmab, NULL);
+		if (ret < 0) {
+			dev_err(sdev->dev, "%s: iccmax stream prepare failed: %d\n",
+				__func__, ret);
+			goto out_free;
+		}
+	} else {
+		ret = hda_dsp_stream_hw_params(sdev, hext_stream, dmab, NULL);
+		if (ret < 0) {
+			dev_err(sdev->dev, "%s: hdac prepare failed: %d\n", __func__, ret);
+			goto out_free;
+		}
+		hda_dsp_stream_spib_config(sdev, hext_stream, HDA_DSP_SPIB_ENABLE, size);
+	}
+
+	return hext_stream;
+
+out_free:
+	snd_dma_free_pages(dmab);
+	dmab->area = NULL;
+	dmab->bytes = 0;
+	hstream->bufsize = 0;
+	hstream->format_val = 0;
+out_put:
+	if (pair)
+		hda_dsp_stream_pair_put(sdev, direction, hstream->stream_tag);
+	else
+		hda_dsp_stream_put(sdev, direction, hstream->stream_tag);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_NS(hda_data_stream_prepare, "SND_SOC_SOF_INTEL_HDA_COMMON");
+
+int hda_data_stream_cleanup(struct device *dev, struct snd_dma_buffer *dmab,
+			    bool persistent_buffer, struct hdac_ext_stream *hext_stream, bool pair)
+{
+	struct snd_sof_dev *sdev =  dev_get_drvdata(dev);
+	struct hdac_stream *hstream = hdac_stream(hext_stream);
+	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
+	int ret = 0;
+
+	if (hstream->direction == SNDRV_PCM_STREAM_PLAYBACK)
+		ret = hda_dsp_stream_spib_config(sdev, hext_stream, HDA_DSP_SPIB_DISABLE, 0);
+	else
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, sd_offset,
+					SOF_HDA_SD_CTL_DMA_START, 0);
+
+	if (pair)
+		hda_dsp_stream_pair_put(sdev, hstream->direction, hstream->stream_tag);
+	else
+		hda_dsp_stream_put(sdev, hstream->direction, hstream->stream_tag);
+
+	hstream->running = 0;
+	hstream->substream = NULL;
+
+	/* reset BDL address */
+	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPL, 0);
+	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPU, 0);
+
+	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, sd_offset, 0);
+
+	if (!persistent_buffer) {
+		snd_dma_free_pages(dmab);
+		dmab->area = NULL;
+		dmab->bytes = 0;
+		hstream->bufsize = 0;
+		hstream->format_val = 0;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_NS(hda_data_stream_cleanup, "SND_SOC_SOF_INTEL_HDA_COMMON");
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 9234e73f30fb..3fe00c269114 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -905,6 +905,14 @@ int sdw_hda_dai_hw_free(struct snd_pcm_substream *substream,
 int sdw_hda_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			struct snd_soc_dai *cpu_dai);
 
+struct hdac_ext_stream *
+hda_data_stream_prepare(struct device *dev, unsigned int format, unsigned int size,
+			struct snd_dma_buffer *dmab, bool persistent_buffer, int direction,
+			bool is_iccmax, bool pair);
+
+int hda_data_stream_cleanup(struct device *dev, struct snd_dma_buffer *dmab,
+			    bool persistent_buffer, struct hdac_ext_stream *hext_stream, bool pair);
+
 /* common dai driver */
 extern struct snd_soc_dai_driver skl_dai[];
 int hda_dsp_dais_suspend(struct snd_sof_dev *sdev);
-- 
2.43.0

