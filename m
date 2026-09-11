Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566DC44F540
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125823; cv=none; b=nBrfo7LG6QHd3F5mjWiw4PNZwkx7IjxqrG3m6jZGz6YgntVSkXkwkusK9+Nw1jAqaaIT+xGCP+exVEhJPHZVqm0W5PyRgjjjK05Iv2dcQzrWzV8Zn6GMxrogu6DNmgVDSAkv67Wpie7TT5Wc67e02DuUAXfMT9JJDzM34iKMvvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125823; c=relaxed/simple;
	bh=ygW4PoMg4ZG+GvPKWdSfRYXUBq4fjD45iRqSAzPztnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ot/PEBUM7kPTOwA6jeSFTuFW1jnW6qXvJkCZ1cDWyrkPDgppSmTAwqB2yo3NtrGCQn2G3uIIzDG7wSB6dbckW0YhARo1NKJPo4tHslmwbdULp0YmzOyGdLAjtTdP1+XYwWWjOTiqm8wBOkgvBECaZFvchO46b7l3PT9loGxmrco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZZEA961; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZZEA961"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125807; x=1820661807;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ygW4PoMg4ZG+GvPKWdSfRYXUBq4fjD45iRqSAzPztnQ=;
  b=ZZZEA961Kepccwyv7MrUnQxDlQQHxUKzf4rIrPx+sdx1U5mtqVGLgppG
   RqDQKuy1GtK8f326eGIPkG92WnUjuwM+M9XCu2yvJDxtNvx4HOvffqHxM
   +ZMLDAxaxn77pRfU7gqClt5y+7NJNc2DHy/YQTJeYVqB16G7zaxIjEwtu
   HjVD1nd6fh+1XxX71dnICVKPNonTcRA935SclmHQDmtYXAijngkabFOGc
   VqtZoLXHYEL2y324V9+UIfZnhI5q+0oVRGpU9tj0IENaTivI5rOWkdbCM
   oXXdtW0BcmpVYPWRKmvbze/MfI/K1dBk1Ph54dZ60GrqmsAxAQjUn+xpH
   Q==;
X-CSE-ConnectionGUID: c2oO5cy4Sqax9uYhNfN3bg==
X-CSE-MsgGUID: xH2s3Q/eRCWWsSlkIAyd5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100750070"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100750070"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:49 -0700
X-CSE-ConnectionGUID: MfBNyw6bSXSKVEcKv9MPtA==
X-CSE-MsgGUID: Y1X7riweS5WfUkKEsfc1dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213514"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:45 -0700
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
Subject: [PATCH v3 22/26] ASoC: SOF: Add support for IPC4 compressed
Date: Fri, 11 Sep 2026 14:21:48 +0300
Message-ID: <20260911112152.28528-23-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set and define the compressed ops for IPC4.
The initial implementation supports basic features: PAUSE PUSH/RELEASE,
DRAIN and progress reporting.
Tested with PCM, MP3, AAC and VORBIS codec.

Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/Makefile        |   4 +-
 sound/soc/sof/ipc4-compress.c | 776 ++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-pcm.c      |   3 +
 sound/soc/sof/ipc4-priv.h     |  10 +
 sound/soc/sof/sof-audio.h     |   1 +
 5 files changed, 792 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/sof/ipc4-compress.c

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 3d52f8c4d173..d5d31da5e937 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -8,10 +8,12 @@ snd-sof-y := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
 ifneq ($(CONFIG_SND_SOC_SOF_IPC3),)
 snd-sof-y +=	ipc3.o ipc3-loader.o ipc3-topology.o ipc3-control.o ipc3-pcm.o\
 		ipc3-dtrace.o
+snd-sof-$(CONFIG_SND_SOC_SOF_COMPRESS) += ipc3-compress.o
 endif
 ifneq ($(CONFIG_SND_SOC_SOF_IPC4),)
 snd-sof-y += ipc4.o ipc4-loader.o ipc4-topology.o ipc4-control.o ipc4-pcm.o\
 		ipc4-mtrace.o ipc4-telemetry.o
+snd-sof-$(CONFIG_SND_SOC_SOF_COMPRESS) += ipc4-compress.o
 endif
 
 # SOF client support
@@ -19,8 +21,6 @@ ifneq ($(CONFIG_SND_SOC_SOF_CLIENT),)
 snd-sof-y += sof-client.o
 endif
 
-snd-sof-$(CONFIG_SND_SOC_SOF_COMPRESS) += ipc3-compress.o
-
 snd-sof-pci-y := sof-pci-dev.o
 snd-sof-acpi-y := sof-acpi-dev.o
 snd-sof-of-y := sof-of-dev.o
diff --git a/sound/soc/sof/ipc4-compress.c b/sound/soc/sof/ipc4-compress.c
new file mode 100644
index 000000000000..ffa987143af4
--- /dev/null
+++ b/sound/soc/sof/ipc4-compress.c
@@ -0,0 +1,776 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// Copyright 2026 Intel Corporation. All rights reserved.
+//
+#include <sound/soc.h>
+#include <sound/sof.h>
+#include <sound/compress_driver.h>
+#include <sound/pcm_params.h>
+#include "sof-audio.h"
+#include "sof-priv.h"
+#include "sof-utils.h"
+#include "ops.h"
+#include "ipc4-priv.h"
+#include "ipc4-topology.h"
+#include "ipc4-fw-reg.h"
+
+/* Maximum processing size of the decoder/encoder is 2048 bytes */
+#define SOF_IPC4_COMPR_MAX_PROCESSING_SIZE		(SZ_2K)
+
+#define SOF_IPC4_COMPR_MIN_FRAGMENTS			3
+#define SOF_IPC4_COMPR_MAX_FRAGMENT_SIZE		(SZ_128K)
+#define SOF_IPC4_COMPR_MAX_FRAGMENTS			64
+#define SOF_IPC4_COMPR_MIN_BUFFER_SIZE(min_size)	((min_size) * \
+							 SOF_IPC4_COMPR_MIN_FRAGMENTS)
+
+struct sof_ipc4_compr_init_data {
+	struct snd_codec codec;
+	u32 dir;
+} __packed __aligned(4);
+
+static struct sof_ipc4_process *
+sof_ipc4_compr_get_module(struct snd_sof_pcm *spcm, int dir)
+{
+	int id = dir ? snd_soc_dapm_encoder : snd_soc_dapm_decoder;
+	struct snd_sof_pcm_stream *sps = &spcm->stream[dir];
+	struct snd_soc_dapm_widget *widget;
+	int i;
+
+	/* Find the (first) compr module in path */
+	for_each_dapm_widgets(sps->list, i, widget) {
+		struct snd_sof_widget *swidget = widget->dobj.private;
+
+		if (!swidget)
+			continue;
+
+		if (swidget->widget->id == id)
+			return swidget->private;
+	}
+
+	return NULL;
+}
+
+static u32 sof_ipc4_compr_calc_min_fragment_size(struct snd_sof_pcm_stream *sps)
+{
+	u32 host_buffer_estimate;
+
+	/* Estimated host DMA buffer size based on stereo S32_LE, 48KHz */
+	host_buffer_estimate = snd_pcm_format_size(SNDRV_PCM_FORMAT_S32_LE, 2 * 48);
+	host_buffer_estimate *= sps->dsp_max_burst_size_in_ms;
+	/*
+	 * The minimum fragment size must not be smaller than the processing size
+	 * or in case of deep buffer on host side, the host DMA buffer size.
+	 */
+	return max(SOF_IPC4_COMPR_MAX_PROCESSING_SIZE, host_buffer_estimate);
+}
+
+static int sof_ipc4_compr_open(struct snd_soc_component *component,
+			       struct snd_compr_stream *cstream)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	struct snd_sof_pcm *spcm;
+	int dir, ret;
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm)
+		return -EINVAL;
+
+	dir = cstream->direction;
+
+	if (spcm->stream[dir].cstream)
+		return -EBUSY;
+
+	spcm_dbg(spcm, dir, "Entry: open\n");
+
+	ret = snd_sof_compr_platform_open(sdev, cstream);
+	if (ret < 0) {
+		spcm_err(spcm, dir, "platform compress open failed %d\n", ret);
+		return ret;
+	}
+
+	spcm->stream[dir].cstream = cstream;
+	spcm->stream[dir].posn.host_posn = 0;
+	spcm->stream[dir].posn.dai_posn = 0;
+	spcm->prepared[dir] = false;
+	spcm->pending_stop[dir] = false;
+
+	return 0;
+}
+
+static int sof_ipc4_compr_stream_free(struct snd_sof_dev *sdev,
+				      struct snd_sof_pcm *spcm,
+				      struct snd_compr_stream *cstream)
+{
+	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
+	int dir = cstream->direction;
+	int ret = 0;
+	int err = 0;
+
+	if (spcm->prepared[dir]) {
+		if (spcm->pending_stop[dir])
+			pcm_ops->trigger(sdev->component, NULL, spcm,
+					 SNDRV_PCM_TRIGGER_STOP, dir);
+
+		snd_sof_compr_platform_trigger(sdev, cstream,
+					       SNDRV_PCM_TRIGGER_STOP);
+
+		err = pcm_ops->hw_free(sdev->component, NULL, spcm, dir);
+		if (err < 0)
+			spcm_err(spcm, dir, "pcm_ops->hw_free failed %d\n", err);
+	}
+
+	spcm->prepared[dir] = false;
+	spcm->pending_stop[dir] = false;
+	spcm->stream[dir].cstream = NULL;
+
+	/* reset the DMA */
+	ret = snd_sof_compr_platform_hw_free(sdev, cstream);
+	if (ret < 0) {
+		spcm_err(spcm, dir, "platform hw free failed %d\n", ret);
+		if (!err)
+			err = ret;
+	}
+
+	/* free widget list */
+	ret = sof_widget_list_free(sdev, spcm, dir);
+	if (ret < 0 && err == 0) {
+		spcm_err(spcm, dir, "sof_widget_list_free failed %d\n", ret);
+		err = ret;
+	}
+
+	return err;
+}
+
+static int sof_ipc4_compr_free(struct snd_soc_component *component,
+			       struct snd_compr_stream *cstream)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	struct snd_sof_pcm *spcm;
+	int ret, err;
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm)
+		return -EINVAL;
+
+	spcm_dbg(spcm, cstream->direction, "Entry: free\n");
+
+	ret = sof_ipc4_compr_stream_free(sdev, spcm, cstream);
+
+	/* unprepare and free the list of DAPM widgets */
+	sof_widget_list_unprepare(sdev, spcm, cstream->direction);
+
+	cancel_work_sync(&spcm->stream[cstream->direction].period_elapsed_work);
+
+	snd_compr_free_pages(cstream);
+
+	err = snd_sof_compr_platform_close(sdev, cstream);
+	if (err < 0) {
+		spcm_err(spcm, cstream->direction,
+			 "platform compress close failed %d\n", err);
+		if (!ret)
+			ret = err;
+	}
+
+	return ret;
+}
+
+#define SOF_IPC4_CODEC_INFO_GET_ID(value)	((value) & 0xff)
+#define SOF_IPC4_CODEC_INFO_GET_DIR(value)	(((value) >> 8) & 0xf)
+
+struct sof_ipc4_codec_info_data {
+	u32 count;
+	u32 items[];
+} __packed __aligned(4);
+
+static int sof_ipc4_compr_get_caps(struct snd_soc_component *component,
+				   struct snd_compr_stream *cstream,
+				   struct snd_compr_caps *caps)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	struct sof_ipc4_codec_info_data *codec_info = ipc4_data->codec_info;
+	int dir = cstream->direction;
+	struct snd_sof_pcm *spcm;
+	int i;
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm)
+		return -EINVAL;
+
+	/* No compress support available in booted firmware */
+	if (!codec_info || !codec_info->count) {
+		spcm_err(spcm, dir,
+			 "Compress is not supported (no codecs available)\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < codec_info->count; i++) {
+		int _dir = SOF_IPC4_CODEC_INFO_GET_DIR(codec_info->items[i]);
+
+		if (_dir == dir) {
+			int id = SOF_IPC4_CODEC_INFO_GET_ID(codec_info->items[i]);
+
+			if (caps->num_codecs < ARRAY_SIZE(caps->codecs)) {
+				spcm_dbg(spcm, dir, "codec#%d: %d\n",
+					 caps->num_codecs, id);
+				caps->codecs[caps->num_codecs++] = id;
+			} else {
+				spcm_dbg(spcm, dir, "codec#%d: %d ignored\n",
+					 caps->num_codecs, id);
+			}
+		}
+	}
+
+	caps->direction = dir;
+	caps->min_fragment_size =
+		sof_ipc4_compr_calc_min_fragment_size(&spcm->stream[dir]);
+	caps->max_fragment_size = SOF_IPC4_COMPR_MAX_FRAGMENT_SIZE;
+	if (caps->max_fragment_size < caps->min_fragment_size)
+		caps->max_fragment_size = caps->min_fragment_size;
+
+	caps->min_fragments = SOF_IPC4_COMPR_MIN_FRAGMENTS;
+	caps->max_fragments = SOF_IPC4_COMPR_MAX_FRAGMENTS;
+
+	spcm_dbg(spcm, dir,
+		 "num_codecs: %u, fragment_size: %u-%u, fragments: %u-%u\n",
+		 caps->num_codecs,
+		 caps->min_fragment_size, caps->max_fragment_size,
+		 caps->min_fragments, caps->max_fragments);
+	return 0;
+}
+
+static int sof_ipc4_compr_alloc_pages(struct device *dev,
+				      struct snd_sof_pcm_stream *sps,
+				      struct snd_soc_component *component,
+				      struct snd_compr_stream *cstream)
+{
+	u32 min_fragment_size = sof_ipc4_compr_calc_min_fragment_size(sps);
+	struct snd_compr_runtime *crtd = cstream->runtime;
+	u64 fragments = crtd->buffer_size;
+	int ret;
+
+	if (crtd->buffer_size < SOF_IPC4_COMPR_MIN_BUFFER_SIZE(min_fragment_size)) {
+		dev_err(dev, "%s: Buffer size is too small: %llu (minimum is %u)\n",
+			__func__, crtd->buffer_size,
+			SOF_IPC4_COMPR_MIN_BUFFER_SIZE(min_fragment_size));
+		return -EINVAL;
+	}
+
+	if (crtd->fragment_size < min_fragment_size) {
+		dev_err(dev, "%s: Fragment size is too small: %u (minimum is %u)\n",
+			__func__, crtd->fragment_size, min_fragment_size);
+		return -EINVAL;
+	}
+
+	do_div(fragments, crtd->fragment_size);
+	if (fragments < SOF_IPC4_COMPR_MIN_FRAGMENTS ||
+	    fragments > SOF_IPC4_COMPR_MAX_FRAGMENTS) {
+		dev_err(dev,
+			"%s: Incorrect number of fragments: %llu (valid: %d-%d)\n",
+			__func__, fragments, SOF_IPC4_COMPR_MIN_FRAGMENTS,
+			SOF_IPC4_COMPR_MAX_FRAGMENTS);
+		return -EINVAL;
+	}
+
+	cstream->dma_buffer.dev.type = SNDRV_DMA_TYPE_DEV_SG;
+	cstream->dma_buffer.dev.dev = dev;
+
+	ret = snd_compr_malloc_pages(cstream, crtd->buffer_size);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_sof_compr_create_page_table(component, cstream, crtd->dma_area,
+					      crtd->dma_bytes);
+	if (ret < 0)
+		snd_compr_free_pages(cstream);
+
+	return ret;
+}
+
+static bool
+sof_ipc4_compr_codec_supported(struct snd_sof_dev *sdev, int codec_id, int dir)
+{
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	struct sof_ipc4_codec_info_data *codec_info = ipc4_data->codec_info;
+	int i;
+
+	/* No compress support available in booted firmware */
+	if (!codec_info || !codec_info->count)
+		return false;
+
+	for (i = 0; i < codec_info->count; i++) {
+		int _dir = SOF_IPC4_CODEC_INFO_GET_DIR(codec_info->items[i]);
+		int _id = SOF_IPC4_CODEC_INFO_GET_ID(codec_info->items[i]);
+
+		if (_dir == dir && codec_id == _id)
+			return true;
+	}
+
+	return false;
+}
+
+static int sof_ipc4_compr_set_params(struct snd_soc_component *component,
+				     struct snd_compr_stream *cstream,
+				     struct snd_compr_params *params)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	struct sof_ipc4_compr_init_data *compr_data __free(kfree) = NULL;
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	struct snd_sof_platform_stream_params *platform_params;
+	struct sof_ipc4_timestamp_info *time_info;
+	struct snd_compr_params *compr_params;
+	struct snd_sof_widget *host_swidget;
+	struct sof_ipc4_process *process;
+	struct snd_pcm_hw_params p = {0};
+	struct snd_interval *interval;
+	struct snd_sof_pcm *spcm;
+	struct snd_mask *fmt;
+	int dir = cstream->direction;
+	int ret;
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm)
+		return -EINVAL;
+
+	host_swidget = snd_sof_find_swidget_by_comp_id(sdev, spcm->stream[dir].comp_id);
+	if (!host_swidget) {
+		spcm_err(spcm, dir, "failed to find host widget with comp_id %d\n",
+			 spcm->stream[dir].comp_id);
+		return -ENODEV;
+	}
+
+	if (!sof_ipc4_compr_codec_supported(sdev, params->codec.id, dir)) {
+		spcm_err(spcm, dir, "Unsupported codec id: %u\n", params->codec.id);
+		return -EINVAL;
+	}
+
+	spcm_dbg(spcm, dir,
+		 "codec_id: %u, rate: %u, ch in/out: %u/%u, format: %u/%u\n",
+		 params->codec.id, params->codec.sample_rate, params->codec.ch_in,
+		 params->codec.ch_out, params->codec.format, params->codec.pcm_format);
+
+	if (spcm->prepared[dir]) {
+		/*
+		 * This can only happen if user space re-configures the device
+		 * without closing it, for example after DRAIN completion
+		 */
+		ret = sof_ipc4_compr_stream_free(sdev, spcm, cstream);
+		if (ret)
+			return ret;
+	}
+
+	/* save the compress params */
+	compr_params = &spcm->cparams[dir];
+	memcpy(compr_params, params, sizeof(*params));
+
+	/*
+	 * Force format, rate and channels and use PCM hw_params structure to
+	 * set up the pipelines.
+	 */
+	fmt = hw_param_mask(&p, SNDRV_PCM_HW_PARAM_FORMAT);
+	snd_mask_none(fmt);
+	/* Use correct format based on the used codec */
+	switch (params->codec.id) {
+	case SND_AUDIOCODEC_PCM:
+		snd_mask_set_format(fmt, (snd_pcm_format_t)params->codec.format);
+		break;
+	case SND_AUDIOCODEC_VORBIS:
+		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
+		break;
+	case SND_AUDIOCODEC_FLAC:
+	{
+		struct snd_dec_flac *dec_flac = &params->codec.options.flac_d;
+
+		if (dec_flac->sample_size == 16)
+			snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
+		else
+			snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
+		break;
+	}
+	default:
+		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
+	}
+
+	interval = hw_param_interval(&p, SNDRV_PCM_HW_PARAM_CHANNELS);
+	interval->min = compr_params->codec.ch_out;
+	interval->max = compr_params->codec.ch_out;
+
+	interval = hw_param_interval(&p, SNDRV_PCM_HW_PARAM_RATE);
+	interval->min = compr_params->codec.sample_rate;
+	interval->max = compr_params->codec.sample_rate;
+
+	ret = sof_ipc4_compr_alloc_pages(sdev->dev, &spcm->stream[dir],
+					 component, cstream);
+	if (ret < 0)
+		return ret;
+
+	spcm_dbg(spcm, dir,
+		 "buffer_size: %llu, fragment_size: %u (fragments: %u)\n",
+		 cstream->runtime->buffer_size, cstream->runtime->fragment_size,
+		 (u32)cstream->runtime->buffer_size / cstream->runtime->fragment_size);
+
+	interval = hw_param_interval(&p, SNDRV_PCM_HW_PARAM_PERIOD_BYTES);
+	interval->min = cstream->runtime->fragment_size;
+	interval->max = cstream->runtime->fragment_size;
+
+	interval = hw_param_interval(&p, SNDRV_PCM_HW_PARAM_BUFFER_BYTES);
+	interval->min = cstream->runtime->buffer_size;
+	interval->max = cstream->runtime->buffer_size;
+
+	platform_params = &spcm->platform_params[dir];
+	ret = snd_sof_compr_platform_hw_params(sdev, cstream, compr_params,
+					       platform_params);
+	if (ret < 0) {
+		spcm_err(spcm, dir, "platform compress hw params failed\n");
+		goto free_pages;
+	}
+
+	/* set up the list of DAPM widgets if not already done */
+	if (!spcm->stream[dir].list) {
+		ret = sof_pcm_setup_connected_widgets(sdev, rtd, spcm, &p,
+						      platform_params, dir);
+		if (ret < 0)
+			goto free_pages;
+	}
+
+	process = sof_ipc4_compr_get_module(spcm, dir);
+	if (!process) {
+		ret = -EINVAL;
+		goto free_list;
+	}
+
+	compr_data = kzalloc(sizeof(*compr_data), GFP_KERNEL);
+	if (!compr_data) {
+		ret = -ENOMEM;
+		goto free_list;
+	}
+
+	memcpy(&compr_data->codec, &compr_params->codec, sizeof(compr_data->codec));
+	compr_data->dir = dir;
+
+	process->init_ext_module_data = compr_data;
+	process->init_ext_module_size = sizeof(*compr_data);
+
+	/*
+	 * Make sure that the DSP is booted up, which might not be the
+	 * case if the on-demand DSP boot is used
+	 */
+	ret = snd_sof_boot_dsp_firmware(sdev);
+	if (ret)
+		goto clear_init_ext;
+
+	/* set the host DMA ID */
+	if (tplg_ops && tplg_ops->host_config)
+		tplg_ops->host_config(sdev, host_swidget, platform_params);
+
+	/* set up the widgets and pipelines in the DSP */
+	ret = sof_widget_list_setup(sdev, spcm, &p, platform_params, dir);
+	if (ret < 0) {
+		spcm_err(spcm, dir, "widget list set up failed\n");
+		goto clear_init_ext;
+	}
+
+	memcpy(&spcm->params[dir], &p, sizeof(p));
+	spcm->prepared[dir] = true;
+
+	time_info = sof_ipc4_sps_to_time_info(&spcm->stream[dir]);
+	if (time_info) {
+		/* delay calculation supported */
+		time_info->stream_start_offset = SOF_IPC4_INVALID_STREAM_POSITION;
+		time_info->llp_offset = 0;
+
+		sof_ipc4_build_time_info(sdev, &spcm->stream[dir]);
+	}
+
+	process->init_ext_module_data = NULL;
+	process->init_ext_module_size = 0;
+
+	return 0;
+
+clear_init_ext:
+	process->init_ext_module_data = NULL;
+	process->init_ext_module_size = 0;
+
+free_list:
+	sof_widget_list_unprepare(sdev, spcm, dir);
+
+free_pages:
+	snd_compr_free_pages(cstream);
+
+	return ret;
+}
+
+static int sof_ipc4_compr_get_params(struct snd_soc_component *component,
+				     struct snd_compr_stream *cstream,
+				     struct snd_codec *params)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	struct snd_sof_pcm *spcm;
+	/* TODO: we don't query the supported codecs for now, if the
+	 * application asks for an unsupported codec the set_params() will fail.
+	 */
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm) {
+		dev_err(sdev->dev, "%s: can't find spcm\n", __func__);
+		return -EINVAL;
+	}
+
+	spcm_dbg(spcm, cstream->direction, "Entry: get_params\n");
+
+	memcpy(params, &spcm->cparams[cstream->direction].codec,
+	       sizeof(*params));
+
+	return 0;
+}
+
+static int sof_ipc4_compr_trigger(struct snd_soc_component *component,
+				  struct snd_compr_stream *cstream, int cmd)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
+	struct snd_sof_pcm *spcm;
+	int dir = cstream->direction;
+	bool trigger_platform = false;
+	int ret = 0;
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm) {
+		dev_err(sdev->dev, "%s: can't find spcm\n", __func__);
+		return -EINVAL;
+	}
+
+	spcm->pending_stop[dir] = false;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		trigger_platform = true;
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		break;
+	case SND_COMPR_TRIGGER_DRAIN:
+	case SND_COMPR_TRIGGER_PARTIAL_DRAIN:
+		spcm->pending_stop[dir] = true;
+		break;
+	case SND_COMPR_TRIGGER_NEXT_TRACK:
+		spcm_dbg(spcm, dir, "Unsupported trigger cmd: %d\n", cmd);
+		return -EOPNOTSUPP;
+	default:
+		spcm_dbg(spcm, dir, "Unhandled trigger cmd: %d\n", cmd);
+		return 0;
+	}
+
+	spcm_dbg(spcm, dir, "Entry: trigger (cmd: %d)\n", cmd);
+
+	ret = pcm_ops->trigger(component, NULL, spcm, cmd, dir);
+	if (ret < 0) {
+		spcm_err(spcm, dir, "pcm_ops->trigger failed for cmd %d\n", cmd);
+		return ret;
+	}
+
+	if (!ret && trigger_platform) {
+		ret = snd_sof_compr_platform_trigger(sdev, cstream, cmd);
+		if (ret < 0)
+			spcm_err(spcm, dir,
+				 "platform compress trigger start failed %d\n",
+				 ret);
+	}
+
+	return ret;
+}
+
+static int sof_ipc4_compr_copy_playback(struct snd_soc_component *component,
+					struct snd_compr_stream *cstream,
+					char __user *buf, size_t count)
+{
+	struct snd_compr_runtime *crtd = cstream->runtime;
+	u64 offset, n;
+	void *ptr;
+	int ret;
+
+	div64_u64_rem(crtd->total_bytes_available, crtd->buffer_size, &offset);
+	ptr = crtd->dma_area + offset;
+	n = crtd->buffer_size - offset;
+
+	if (count < n) {
+		ret = copy_from_user(ptr, buf, count);
+	} else {
+		ret = copy_from_user(ptr, buf, n);
+		ret += copy_from_user(crtd->dma_area, buf + n, count - n);
+	}
+
+	return count - ret;
+}
+
+static int sof_ipc4_compr_copy_capture(struct snd_compr_runtime *crtd,
+				       char __user *buf, size_t count)
+{
+	u64 offset, n;
+	void *ptr;
+	int ret;
+
+	div64_u64_rem(crtd->total_bytes_transferred, crtd->buffer_size, &offset);
+	ptr = crtd->dma_area + offset;
+	n = crtd->buffer_size - offset;
+
+	if (count < n) {
+		ret = copy_to_user(buf, ptr, count);
+	} else {
+		ret = copy_to_user(buf, ptr, n);
+		ret += copy_to_user(buf + n, crtd->dma_area, count - n);
+	}
+
+	return count - ret;
+}
+
+static int sof_ipc4_compr_copy(struct snd_soc_component *component,
+			       struct snd_compr_stream *cstream,
+			       char __user *buf, size_t count)
+{
+	struct snd_compr_runtime *crtd = cstream->runtime;
+
+	if (count > crtd->buffer_size)
+		count = crtd->buffer_size;
+
+	if (cstream->direction == SND_COMPRESS_PLAYBACK)
+		return sof_ipc4_compr_copy_playback(component, cstream, buf, count);
+
+	return sof_ipc4_compr_copy_capture(crtd, buf, count);
+}
+
+static int sof_ipc4_compr_pointer(struct snd_soc_component *component,
+				  struct snd_compr_stream *cstream,
+				  struct snd_compr_tstamp64 *tstamp)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	struct sof_ipc4_timestamp_info *time_info;
+	struct snd_pcm_hw_params *params;
+	struct snd_sof_pcm_stream *sps;
+	struct snd_sof_pcm *spcm;
+	u64 dai_cnt = 0;
+	int ret;
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm)
+		return -EINVAL;
+
+	params = &spcm->params[cstream->direction];
+
+	ret = snd_sof_compr_platform_pointer(sdev, cstream, tstamp);
+	if (ret < 0) {
+		spcm_err(spcm, cstream->direction,
+			 "platform compress pointer failed %d\n", ret);
+		return ret;
+	}
+
+	sps = &spcm->stream[cstream->direction];
+	time_info = sof_ipc4_sps_to_time_info(sps);
+	if (!time_info)
+		goto host_only;
+
+	/*
+	 * stream_start_offset is updated to memory window by FW based on
+	 * pipeline statistics and it may be invalid if host query happens before
+	 * the statistics is complete. And it will not change after the first
+	 * initialization.
+	 */
+	if (time_info->stream_start_offset == SOF_IPC4_INVALID_STREAM_POSITION) {
+		ret = sof_ipc4_get_stream_start_offset(sdev, NULL, sps, time_info);
+		if (ret < 0)
+			goto host_only;
+	}
+
+	if (!time_info->llp_offset) {
+		dai_cnt = snd_sof_compr_get_dai_frame_counter(sdev, cstream);
+	} else {
+		struct sof_ipc4_llp_reading_slot llp;
+
+		sof_mailbox_read(sdev, time_info->llp_offset, &llp, sizeof(llp));
+		dai_cnt = ((u64)llp.reading.llp_u << 32) | llp.reading.llp_l;
+	}
+
+	if (dai_cnt) {
+		dai_cnt = sof_ipc4_frames_dai_to_host(time_info, dai_cnt);
+		dai_cnt += time_info->stream_end_offset;
+		if (dai_cnt < time_info->stream_start_offset)
+			dai_cnt = 0;
+		else
+			dai_cnt -= time_info->stream_start_offset;
+	}
+
+host_only:
+	tstamp->sampling_rate = params_rate(params);
+	tstamp->pcm_io_frames = dai_cnt;
+
+	return 0;
+}
+
+void sof_ipc4_compr_drain_done(struct snd_sof_dev *sdev, void *ipc_message)
+{
+	struct sof_ipc4_msg *ipc4_msg = ipc_message;
+	struct sof_ipc4_notify_module_data *ndata = ipc4_msg->data_ptr;
+	struct snd_sof_widget *swidget, *host_swidget;
+	bool widget_found = false;
+	struct snd_sof_pcm *spcm;
+	int dir;
+
+	/* Find the swidget based on ndata->module_id and ndata->instance_id */
+	swidget = sof_ipc4_find_swidget_by_ids(sdev, ndata->module_id,
+					       ndata->instance_id);
+	if (!swidget) {
+		dev_err(sdev->dev, "%s: Failed to find widget for module %u.%u\n",
+			__func__, ndata->module_id, ndata->instance_id);
+		return;
+	}
+
+	if (!swidget->spipe || !swidget->spipe->pipe_widget)
+		return;
+
+	/* Find the swidget of the host copier on the same pipeline */
+	list_for_each_entry(host_swidget, &sdev->widget_list, list) {
+		if (WIDGET_IS_AIF(host_swidget->id) &&
+		    host_swidget->pipeline_id == swidget->pipeline_id) {
+			widget_found = true;
+			break;
+		}
+	}
+
+	if (!widget_found) {
+		dev_err(sdev->dev, "%s: Host widget not found for pipeline: %s\n",
+			__func__, swidget->spipe->pipe_widget->widget->name);
+		return;
+	}
+
+	/* Look up the spcm of the host copier */
+	spcm = snd_sof_find_spcm_comp(sdev->component, host_swidget->comp_id, &dir);
+	if (!spcm) {
+		dev_err(sdev->dev, "%s: Stream cannot be found for %s\n", __func__,
+			host_swidget->widget->name);
+		return;
+	}
+
+	spcm_dbg(spcm, dir, "Entry: EOS done\n");
+
+	if (spcm->stream[dir].cstream)
+		snd_compr_drain_notify(spcm->stream[dir].cstream);
+}
+
+const struct snd_compress_ops sof_ipc4_compressed_ops = {
+	.open		= sof_ipc4_compr_open,
+	.free		= sof_ipc4_compr_free,
+	.get_caps	= sof_ipc4_compr_get_caps,
+	.set_params	= sof_ipc4_compr_set_params,
+	.get_params	= sof_ipc4_compr_get_params,
+	.trigger	= sof_ipc4_compr_trigger,
+	.pointer	= sof_ipc4_compr_pointer,
+	.copy		= sof_ipc4_compr_copy,
+};
diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index f65c2a804a36..cbf948d84791 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -1325,4 +1325,7 @@ const struct sof_ipc_pcm_ops ipc4_pcm_ops = {
 	.delay = sof_ipc4_pcm_delay,
 	.ipc_first_on_start = true,
 	.platform_stop_during_hw_free = true,
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
+	.compress_ops =	&sof_ipc4_compressed_ops,
+#endif
 };
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 07df6799c7a8..b35930c16c6d 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -130,6 +130,9 @@ extern const struct sof_ipc_tplg_ops ipc4_tplg_ops;
 extern const struct sof_ipc_tplg_control_ops tplg_ipc4_control_ops;
 extern const struct sof_ipc_pcm_ops ipc4_pcm_ops;
 extern const struct sof_ipc_fw_tracing_ops ipc4_mtrace_ops;
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
+extern const struct snd_compress_ops sof_ipc4_compressed_ops;
+#endif
 
 int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 instance_id, u32 state);
 int sof_ipc4_mtrace_update_pos(struct snd_sof_dev *sdev, int core);
@@ -164,4 +167,11 @@ int sof_ipc4_get_stream_start_offset(struct snd_sof_dev *sdev,
 				     struct sof_ipc4_timestamp_info *time_info);
 u64 sof_ipc4_frames_dai_to_host(struct sof_ipc4_timestamp_info *time_info, u64 value);
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
+void sof_ipc4_compr_drain_done(struct snd_sof_dev *sdev, void *ipc_message);
+#else
+static inline void sof_ipc4_compr_drain_done(struct snd_sof_dev *sdev,
+					     void *ipc_message) { }
+#endif
+
 #endif
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 151cfa9e6b7c..9dff4fea628e 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -358,6 +358,7 @@ struct snd_sof_pcm {
 	struct snd_sof_pcm_stream stream[2];
 	struct list_head list;	/* list in sdev pcm list */
 	struct snd_pcm_hw_params params[2];
+	struct snd_compr_params cparams[2]; /* applicable for compress devices */
 	struct snd_sof_platform_stream_params platform_params[2];
 	bool prepared[2]; /* PCM_PARAMS set successfully */
 	bool setup_done[2]; /* the setup of the SOF PCM device is done */
-- 
2.55.0

