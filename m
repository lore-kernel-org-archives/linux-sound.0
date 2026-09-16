Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142AA446050
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560272; cv=none; b=c+XERMjJTL2XsMrKkAJkCQJtV70DusbD7zeCwnSjC3ibYDiOBFE5WaAne3klvFEJW5r9C0vKBjGZv+z7xjCXeZ3IA2qDlpn7nmLng8yFaGVp8r6zaATCqinuZvKNZwwR+p5gefhiNDuFxutOIxgwFTszpvbE31Y9QTNlW213930=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560272; c=relaxed/simple;
	bh=mrYoXNprHe0462Hq7dfrJWBTHXntUOjqjobFvs8ykYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRVNQVheIPEKLypvkF+uQTteRLpLCem8CmC6pQ6wMVicH2OkEiOqdjxc66aFWiByAuErnLyWSRrOour7uNWC7xrxuGGUPZA5E9WXo+d0+Hw5A1Eipsa2ky/uVe+BCEz8nCBohBOYCyMfjpjz/RcCk7PZFXYhAyCE3QZSPIa6U1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lx4vL7VC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lx4vL7VC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560264; x=1821096264;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mrYoXNprHe0462Hq7dfrJWBTHXntUOjqjobFvs8ykYc=;
  b=lx4vL7VC0lR8U400kOj9FVv3yxXDEmdSf8Q58V4zlnrrSRs4L9xBbraS
   wOvnQxz/j9F3P81hDzrURQ33Gy4WcZQHAUb5NB+2SbYxmWxI4Vm8gvcQt
   qL29ByR1MU0t1o4NdMlHdqKHzR+pm6Wsn5JWknt/8iBWA/lDoVy0tB+rN
   gc464O36rwiKqNh4siVvH6z6NjfZsLC8MgaahmLi1x2YSX+y3qiE+YSWL
   fj8I1StYa4661Zf0VOn0QFSNJACHBhbFAq/s/33JLbkIT3hC+S/pFbHra
   n5vr6pKEL+nsTaNqW4H5O/4JHdkGfVWIoKy/09sSaOUc8S6s4woPDdDL/
   g==;
X-CSE-ConnectionGUID: nLlUy2+uRdiBH5C6h0v4vA==
X-CSE-MsgGUID: zczorFiSRvyn6e+ZT/U2aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496537"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496537"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:04:14 -0700
X-CSE-ConnectionGUID: Uwpr3SMURk+8ogzeakFVZw==
X-CSE-MsgGUID: UXZyhoEsRwObQyKB0fyI/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293794"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:04:12 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v4 21/26] ASoC: SOF: ops: Add new platform-specific ops for compress
Date: Wed, 16 Sep 2026 15:03:15 +0300
Message-ID: <20260916120320.18318-22-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add new ops in the struct snd_sof_ops for platform-specific ops for
compresssed streams. Also, define and set them for the HDA platforms.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Co-developed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/hda-common-ops.c |   8 ++
 sound/soc/sof/intel/hda-pcm.c        | 142 +++++++++++++++++++++++++++
 sound/soc/sof/intel/hda-stream.c     |  69 +++++++++----
 sound/soc/sof/intel/hda.h            |  15 +++
 sound/soc/sof/ops.h                  |  74 ++++++++++++++
 sound/soc/sof/sof-priv.h             |  12 +++
 6 files changed, 301 insertions(+), 19 deletions(-)

diff --git a/sound/soc/sof/intel/hda-common-ops.c b/sound/soc/sof/intel/hda-common-ops.c
index 746b426b1329..aa91f2b6fd65 100644
--- a/sound/soc/sof/intel/hda-common-ops.c
+++ b/sound/soc/sof/intel/hda-common-ops.c
@@ -57,6 +57,14 @@ const struct snd_sof_dsp_ops sof_hda_common_ops = {
 	.pcm_pointer	= hda_dsp_pcm_pointer,
 	.pcm_ack	= hda_dsp_pcm_ack,
 
+	.compr_open = hda_dsp_compr_open,
+	.compr_hw_params = hda_dsp_compr_hw_params,
+	.compr_hw_free = hda_dsp_stream_compr_hw_free,
+	.compr_close = hda_dsp_compr_close,
+	.compr_trigger = hda_dsp_compr_trigger,
+	.compr_pointer = hda_dsp_compr_pointer,
+	.compr_get_dai_frame_counter = hda_dsp_compr_get_stream_llp,
+
 	.get_dai_frame_counter = hda_dsp_get_stream_llp,
 	.get_host_byte_counter = hda_dsp_get_stream_ldp,
 
diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index 16a364072821..83efc9bdf418 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -151,6 +151,71 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 }
 EXPORT_SYMBOL_NS(hda_dsp_pcm_hw_params, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
+int hda_dsp_compr_hw_params(struct snd_sof_dev *sdev,
+			    struct snd_compr_stream *cstream,
+			    struct snd_compr_params *params,
+			    struct snd_sof_platform_stream_params *platform_params)
+{
+	struct hdac_stream *hstream = cstream->runtime->private_data;
+	struct hdac_ext_stream *hext_stream = stream_to_hdac_ext_stream(hstream);
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	struct snd_dma_buffer *dmab;
+	u32 bits, rate;
+	int bps;
+	int ret;
+
+	hstream->cstream = cstream;
+	dmab = cstream->runtime->dma_buffer_p;
+
+	/* Use correct format based on the used codec */
+	switch (params->codec.id) {
+	case SND_AUDIOCODEC_PCM:
+		bps = snd_pcm_format_physical_width((snd_pcm_format_t)params->codec.format);
+		break;
+	case SND_AUDIOCODEC_VORBIS:
+		bps = snd_pcm_format_physical_width(SNDRV_PCM_FORMAT_S16_LE);
+		break;
+	case SND_AUDIOCODEC_FLAC:
+	{
+		struct snd_dec_flac *dec_flac = &params->codec.options.flac_d;
+
+		if (dec_flac->sample_size == 16)
+			bps = snd_pcm_format_physical_width(SNDRV_PCM_FORMAT_S16_LE);
+		else
+			bps = snd_pcm_format_physical_width(SNDRV_PCM_FORMAT_S32_LE);
+		break;
+	}
+	default:
+		bps = snd_pcm_format_physical_width(SNDRV_PCM_FORMAT_S32_LE);
+	}
+
+	if (bps < 0)
+		return bps;
+	bits = hda_dsp_get_bits(sdev, bps);
+	rate = hda_dsp_get_mult_div(sdev, params->codec.sample_rate);
+
+	hstream->format_val = rate | bits | (params->codec.ch_out - 1);
+	hstream->bufsize = cstream->runtime->buffer_size;
+	hstream->period_bytes = cstream->runtime->fragment_size;
+	hstream->no_period_wakeup  = false;
+
+	/* params is not used so pass NULL */
+	dmab = cstream->runtime->dma_buffer_p;
+	ret = hda_dsp_stream_hw_params(sdev, hext_stream, dmab, NULL);
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s: hdac prepare failed: %d\n", __func__, ret);
+		return ret;
+	}
+
+	if (hda)
+		platform_params->no_ipc_position = hda->no_ipc_position;
+
+	platform_params->stream_tag = hstream->stream_tag;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(hda_dsp_compr_hw_params, "SND_SOC_SOF_INTEL_HDA_COMMON");
+
 /* update SPIB register with appl position */
 int hda_dsp_pcm_ack(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream)
 {
@@ -184,6 +249,16 @@ int hda_dsp_pcm_trigger(struct snd_sof_dev *sdev,
 }
 EXPORT_SYMBOL_NS(hda_dsp_pcm_trigger, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
+int hda_dsp_compr_trigger(struct snd_sof_dev *sdev,
+			  struct snd_compr_stream *cstream, int cmd)
+{
+	struct hdac_stream *hstream = cstream->runtime->private_data;
+	struct hdac_ext_stream *hext_stream = stream_to_hdac_ext_stream(hstream);
+
+	return hda_dsp_stream_trigger(sdev, hext_stream, cmd);
+}
+EXPORT_SYMBOL_NS(hda_dsp_compr_trigger, "SND_SOC_SOF_INTEL_HDA_COMMON");
+
 snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
 				      struct snd_pcm_substream *substream)
 {
@@ -216,6 +291,20 @@ snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
 }
 EXPORT_SYMBOL_NS(hda_dsp_pcm_pointer, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
+int hda_dsp_compr_pointer(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream,
+			  struct snd_compr_tstamp64 *tstamp)
+{
+	struct hdac_stream *hstream = cstream->runtime->private_data;
+
+	/* hstream->curr_pos is updated when we receive the ioc */
+	tstamp->copied_total = hstream->curr_pos;
+
+	tstamp->byte_offset = hda_dsp_stream_get_position(hstream, cstream->direction, true);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(hda_dsp_compr_pointer, "SND_SOC_SOF_INTEL_HDA_COMMON");
+
 int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 		     struct snd_pcm_substream *substream)
 {
@@ -342,6 +431,41 @@ int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 }
 EXPORT_SYMBOL_NS(hda_dsp_pcm_open, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
+int hda_dsp_compr_open(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream)
+{
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	struct snd_soc_component *scomp = sdev->component;
+	struct hdac_ext_stream *dsp_stream;
+	struct snd_sof_pcm *spcm;
+	int direction = cstream->direction;
+
+	spcm = snd_sof_find_spcm_dai(scomp, rtd);
+	if (!spcm) {
+		dev_err(sdev->dev, "%s: can't find PCM with DAI ID %d\n",
+			__func__, rtd->dai_link->id);
+		return -EINVAL;
+	}
+
+	dsp_stream = hda_dsp_stream_get(sdev, direction, 0);
+	if (!dsp_stream) {
+		dev_err(sdev->dev, "%s: no stream available\n", __func__);
+		return -ENODEV;
+	}
+
+	/* binding compr stream to hda stream */
+	cstream->runtime->private_data = &dsp_stream->hstream;
+
+	/*
+	 * Reset the llp cache values (they are used for LLP compensation in
+	 * case the counter is not reset)
+	 */
+	dsp_stream->pplcllpl = 0;
+	dsp_stream->pplcllpu = 0;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(hda_dsp_compr_open, "SND_SOC_SOF_INTEL_HDA_COMMON");
+
 int hda_dsp_pcm_close(struct snd_sof_dev *sdev,
 		      struct snd_pcm_substream *substream)
 {
@@ -361,3 +485,21 @@ int hda_dsp_pcm_close(struct snd_sof_dev *sdev,
 	return 0;
 }
 EXPORT_SYMBOL_NS(hda_dsp_pcm_close, "SND_SOC_SOF_INTEL_HDA_COMMON");
+
+int hda_dsp_compr_close(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream)
+{
+	struct hdac_stream *hstream = cstream->runtime->private_data;
+	int direction = cstream->direction;
+	int ret;
+
+	ret = hda_dsp_stream_put(sdev, direction, hstream->stream_tag);
+	if (ret)
+		return -ENODEV;
+
+	/* unbinding compress stream to hda stream */
+	hstream->cstream = NULL;
+	cstream->runtime->private_data = NULL;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(hda_dsp_compr_close, "SND_SOC_SOF_INTEL_HDA_COMMON");
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 5097a497188d..ac2a62c4e41f 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -755,13 +755,12 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 	return ret;
 }
 
-int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
-			   struct snd_pcm_substream *substream)
+static int _hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
+				   struct hdac_stream *hstream)
 {
-	struct hdac_stream *hstream = substream->runtime->private_data;
 	struct hdac_ext_stream *hext_stream = container_of(hstream,
-							 struct hdac_ext_stream,
-							 hstream);
+							   struct hdac_ext_stream,
+							   hstream);
 	int ret;
 
 	ret = hda_dsp_stream_reset(sdev, hstream);
@@ -786,8 +785,21 @@ int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
 
 	return 0;
 }
+
+int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
+			   struct snd_pcm_substream *substream)
+{
+	return _hda_dsp_stream_hw_free(sdev, substream->runtime->private_data);
+}
 EXPORT_SYMBOL_NS(hda_dsp_stream_hw_free, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
+int hda_dsp_stream_compr_hw_free(struct snd_sof_dev *sdev,
+				 struct snd_compr_stream *cstream)
+{
+	return _hda_dsp_stream_hw_free(sdev, cstream->runtime->private_data);
+}
+EXPORT_SYMBOL_NS(hda_dsp_stream_compr_hw_free, "SND_SOC_SOF_INTEL_HDA_COMMON");
+
 bool hda_dsp_check_stream_irq(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
@@ -1162,19 +1174,9 @@ EXPORT_SYMBOL_NS(hda_dsp_stream_get_position, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 #define merge_u64(u32_u, u32_l) (((u64)(u32_u) << 32) | (u32_l))
 
-/**
- * hda_dsp_get_stream_llp - Retrieve the LLP (Linear Link Position) of the stream
- * @sdev: SOF device
- * @component: ASoC component
- * @substream: PCM substream
- *
- * Returns the raw Linear Link Position value
- */
-u64 hda_dsp_get_stream_llp(struct snd_sof_dev *sdev,
-			   struct snd_soc_component *component,
-			   struct snd_pcm_substream *substream)
+static u64 hda_dsp_get_llp(struct snd_sof_dev *sdev,
+			   struct snd_soc_pcm_runtime *rtd, int dir)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_pcm_runtime *be_rtd = NULL;
 	struct hdac_ext_stream *hext_stream;
 	struct snd_soc_dai *cpu_dai;
@@ -1185,7 +1187,7 @@ u64 hda_dsp_get_stream_llp(struct snd_sof_dev *sdev,
 	 * The LLP needs to be read from the Link DMA used for this FE as it is
 	 * allowed to use any combination of Link and Host channels
 	 */
-	for_each_dpcm_be(rtd, substream->stream, dpcm) {
+	for_each_dpcm_be(rtd, dir, dpcm) {
 		if (dpcm->fe != rtd)
 			continue;
 
@@ -1199,7 +1201,7 @@ u64 hda_dsp_get_stream_llp(struct snd_sof_dev *sdev,
 	if (!cpu_dai)
 		return 0;
 
-	hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
+	hext_stream = snd_soc_dai_dma_data_get(cpu_dai, dir);
 	if (!hext_stream)
 		return 0;
 
@@ -1223,8 +1225,37 @@ u64 hda_dsp_get_stream_llp(struct snd_sof_dev *sdev,
 
 	return merge_u64(llp_u, llp_l);
 }
+
+/**
+ * hda_dsp_get_stream_llp - Retrieve the LLP (Linear Link Position) of the stream
+ * @sdev: SOF device
+ * @component: ASoC component
+ * @substream: PCM substream
+ *
+ * Returns the raw Linear Link Position value
+ */
+u64 hda_dsp_get_stream_llp(struct snd_sof_dev *sdev,
+			   struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
+{
+	return hda_dsp_get_llp(sdev, snd_soc_substream_to_rtd(substream),
+			       substream->stream);
+}
 EXPORT_SYMBOL_NS(hda_dsp_get_stream_llp, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
+/**
+ * hda_dsp_compr_get_stream_llp - Retrieve the LLP (Linear Link Position) of the stream
+ * @sdev: SOF device
+ * @cstream: Compress stream
+ *
+ * Returns the raw Linear Link Position value
+ */
+u64 hda_dsp_compr_get_stream_llp(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream)
+{
+	return hda_dsp_get_llp(sdev, cstream->private_data, cstream->direction);
+}
+EXPORT_SYMBOL_NS(hda_dsp_compr_get_stream_llp, "SND_SOC_SOF_INTEL_HDA_COMMON");
+
 /**
  * hda_dsp_get_stream_ldp - Retrieve the LDP (Linear DMA Position) of the stream
  * @sdev: SOF device
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 1609589929a1..701578ec35cf 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -683,6 +683,21 @@ snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
 				      struct snd_pcm_substream *substream);
 int hda_dsp_pcm_ack(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream);
 
+int hda_dsp_compr_open(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream);
+int hda_dsp_compr_close(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream);
+int hda_dsp_compr_hw_params(struct snd_sof_dev *sdev,
+			    struct snd_compr_stream *cstream,
+			    struct snd_compr_params *params,
+			    struct snd_sof_platform_stream_params *platform_params);
+int hda_dsp_stream_compr_hw_free(struct snd_sof_dev *sdev,
+				 struct snd_compr_stream *cstream);
+int hda_dsp_compr_trigger(struct snd_sof_dev *sdev,
+			  struct snd_compr_stream *cstream, int cmd);
+int hda_dsp_compr_pointer(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream,
+			  struct snd_compr_tstamp64 *tstamp);
+u64 hda_dsp_compr_get_stream_llp(struct snd_sof_dev *sdev,
+				 struct snd_compr_stream *cstream);
+
 /*
  * DSP Stream Operations.
  */
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 72af1f4ff620..4afc92490fbe 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -15,6 +15,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
+#include <sound/compress_driver.h>
 #include <sound/pcm.h>
 #include "sof-priv.h"
 
@@ -448,6 +449,79 @@ snd_sof_pcm_platform_hw_params(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+static inline int
+snd_sof_compr_platform_open(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->compr_open)
+		return sof_ops(sdev)->compr_open(sdev, cstream);
+
+	return 0;
+}
+
+/* disconnect pcm substream to a host stream */
+static inline int
+snd_sof_compr_platform_close(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->compr_close)
+		return sof_ops(sdev)->compr_close(sdev, cstream);
+
+	return 0;
+}
+
+/* host stream hw params */
+static inline int
+snd_sof_compr_platform_hw_params(struct snd_sof_dev *sdev,
+				 struct snd_compr_stream *cstream,
+				 struct snd_compr_params *params,
+				 struct snd_sof_platform_stream_params *platform_params)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->compr_hw_params)
+		return sof_ops(sdev)->compr_hw_params(sdev, cstream, params, platform_params);
+
+	return 0;
+}
+
+static inline int
+snd_sof_compr_platform_hw_free(struct snd_sof_dev *sdev,
+			       struct snd_compr_stream *cstream)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->compr_hw_free)
+		return sof_ops(sdev)->compr_hw_free(sdev, cstream);
+
+	return 0;
+}
+
+static inline int
+snd_sof_compr_platform_trigger(struct snd_sof_dev *sdev,
+			       struct snd_compr_stream *cstream, int cmd)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->compr_trigger)
+		return sof_ops(sdev)->compr_trigger(sdev, cstream, cmd);
+
+	return 0;
+}
+
+static inline int
+snd_sof_compr_platform_pointer(struct snd_sof_dev *sdev,
+			       struct snd_compr_stream *cstream,
+			       struct snd_compr_tstamp64 *tstamp)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->compr_pointer)
+		return sof_ops(sdev)->compr_pointer(sdev, cstream, tstamp);
+
+	return 0;
+}
+
+static inline u64
+snd_sof_compr_get_dai_frame_counter(struct snd_sof_dev *sdev,
+				    struct snd_compr_stream *cstream)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->compr_get_dai_frame_counter)
+		return sof_ops(sdev)->compr_get_dai_frame_counter(sdev, cstream);
+
+	return 0;
+}
+
 /* host stream hw free */
 static inline int
 snd_sof_pcm_platform_hw_free(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 38753b088fc1..560be58611c0 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -256,6 +256,18 @@ struct snd_sof_dsp_ops {
 	/* pcm ack */
 	int (*pcm_ack)(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream); /* optional */
 
+	int (*compr_open)(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream);
+	int (*compr_close)(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream);
+	int (*compr_hw_params)(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream,
+			       struct snd_compr_params *params,
+			       struct snd_sof_platform_stream_params *platform_params);
+	int (*compr_hw_free)(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream);
+	int (*compr_trigger)(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream,
+			     int cmd);
+	int (*compr_pointer)(struct snd_sof_dev *sdev, struct snd_compr_stream *cstream,
+			     struct snd_compr_tstamp64 *tstamp);
+	u64 (*compr_get_dai_frame_counter)(struct snd_sof_dev *sdev,
+					   struct snd_compr_stream *cstream);
 	/*
 	 * optional callback to retrieve the number of frames left/arrived from/to
 	 * the DSP on the DAI side (link/codec/DMIC/etc).
-- 
2.55.0

