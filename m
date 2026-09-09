Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD36846C4CC
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 09:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945003; cv=none; b=VYSAhiWqK9im4mKB2pvc6DkgTGePwEL09hM2hrwXDXMXMF7BJhdDjtra4H83NKe4Sl7X2OFwhpTmVlbl3xaBK4n+rCxTAXYabgq9SARtNYukaqGFr1lPhPGaEmWrMUULJGGYtNHHEY5kJFejAAasd04EPkDQB58DKiw0RG45opM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945003; c=relaxed/simple;
	bh=kpCH+jT6LXQ3t/dOgV8ooMpU3kQb5cfDbrnvnNyJ30U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FhDU0m/wQ+uIk/KygISAX5/YH0aXSVDZwqS4anU6n6aNi1S2ADT3zKkd/7T43KJZM+3SK2zEm0CP08nGpVkfFJfcB3Tn2OL8jqmg5U8hr5K/Rf7oQw0v1C5RTqznWohxM15i7Mm1e2ijuQCMPsRxvYDHzmHm9XRRpCfI4xTgyt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5f7KA5r; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5f7KA5r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788945002; x=1820481002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kpCH+jT6LXQ3t/dOgV8ooMpU3kQb5cfDbrnvnNyJ30U=;
  b=G5f7KA5rIOWVA/mxzysArkyGXYqh/e8Tq+ZjIRyrCQ5EEFl1KCL1LnNR
   wzUh8mNw/glScxoK9RJJJGby6gLOFCZ0RRaT4EdA7NEQtsDmX5Jj/uReo
   ECHSeALcgug2fhYVVokPgWONCQehRrnGw4s70zWsNhYLIKryZ85SGnB1m
   LI0n+P90KaidO4vw7AwcpQwOjwjcxEFvtCOpQr0gzkIpt+//Nci40sadl
   mhi5XIwv5nt1yw6kQfLUQOtyBRIUuWkV5VAoZ434TG2NcmkNzaTA4jOUy
   Ye/hjc4osiEsgatRqi1ohBaeWSAMb9lwRCObJPA8JhheI2LUscUhtR0Jz
   g==;
X-CSE-ConnectionGUID: 5dum09r0RXmINbeC7UcCNA==
X-CSE-MsgGUID: k4MIXo5wTXKd+wrD3U/I0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89200657"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89200657"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:02 -0700
X-CSE-ConnectionGUID: 2UPZm3P+Q5SAgW7dXVAiUg==
X-CSE-MsgGUID: tnSnOITQQZ2fwOCXMj4FQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266972897"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.252])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:09:58 -0700
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
Subject: [PATCH v2 07/24] ASoC: SOF: compress: Rename compress ops with ipc3 prefix
Date: Wed,  9 Sep 2026 12:09:32 +0300
Message-ID: <20260909090949.7503-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

In preparation for adding support for compressed offload support for
IPC4, rename the current compress implementation with the IPC3 prefix.
Introduce a new field in struct sof_ipc_pcm_ops to save the
IPC-specific compressed ops pointer. This should be set when the
component driver ops are assigned during SOF device probe. Expose a couple
of common functions that will be used by both IPC-specific implementations
and rename the compress.c file to ipc3-compress.c

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/Makefile                        |   2 +-
 sound/soc/sof/core.c                          |  10 +-
 sound/soc/sof/{compress.c => ipc3-compress.c} | 145 ++++--------------
 sound/soc/sof/ipc3-pcm.c                      |   3 +
 sound/soc/sof/ipc3-priv.h                     |   3 +
 sound/soc/sof/pcm.c                           |   5 +-
 sound/soc/sof/sof-audio.c                     |  81 ++++++++++
 sound/soc/sof/sof-audio.h                     |   5 +
 8 files changed, 137 insertions(+), 117 deletions(-)
 rename sound/soc/sof/{compress.c => ipc3-compress.c} (66%)

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index b0b22e6ebc03..3d52f8c4d173 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -19,7 +19,7 @@ ifneq ($(CONFIG_SND_SOC_SOF_CLIENT),)
 snd-sof-y += sof-client.o
 endif
 
-snd-sof-$(CONFIG_SND_SOC_SOF_COMPRESS) += compress.o
+snd-sof-$(CONFIG_SND_SOC_SOF_COMPRESS) += ipc3-compress.o
 
 snd-sof-pci-y := sof-pci-dev.o
 snd-sof-acpi-y := sof-acpi-dev.o
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 2d394389c945..41747ef0e432 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -463,11 +463,12 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 
 	sof_set_fw_state(sdev, SOF_FW_BOOT_PREPARE);
 
-	/* set up platform component driver */
-	snd_sof_new_platform_drv(sdev);
-
 	if (sdev->dspless_mode_selected) {
 		sof_set_fw_state(sdev, SOF_DSPLESS_MODE);
+
+		/* set up platform component driver */
+		snd_sof_new_platform_drv(sdev);
+
 		goto skip_dsp_init;
 	}
 
@@ -492,6 +493,9 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 		goto ipc_err;
 	}
 
+	/* set up platform component driver after initializing the IPC ops */
+	snd_sof_new_platform_drv(sdev);
+
 	/* load the firmware */
 	ret = snd_sof_load_firmware(sdev);
 	if (ret < 0) {
diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/ipc3-compress.c
similarity index 66%
rename from sound/soc/sof/compress.c
rename to sound/soc/sof/ipc3-compress.c
index 93f2376585db..115d454bcaf5 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/ipc3-compress.c
@@ -12,88 +12,8 @@
 #include "sof-utils.h"
 #include "ops.h"
 
-static void sof_set_transferred_bytes(struct sof_compr_stream *sstream,
-				      u64 host_pos, u64 buffer_size)
-{
-	u64 prev_pos;
-	unsigned int copied;
-
-	div64_u64_rem(sstream->copied_total, buffer_size, &prev_pos);
-
-	if (host_pos < prev_pos)
-		copied = (buffer_size - prev_pos) + host_pos;
-	else
-		copied = host_pos - prev_pos;
-
-	sstream->copied_total += copied;
-}
-
-static void snd_sof_compr_fragment_elapsed_work(struct work_struct *work)
-{
-	struct snd_sof_pcm_stream *sps =
-		container_of(work, struct snd_sof_pcm_stream,
-			     period_elapsed_work);
-
-	snd_compr_fragment_elapsed(sps->cstream);
-}
-
-void snd_sof_compr_init_elapsed_work(struct work_struct *work)
-{
-	INIT_WORK(work, snd_sof_compr_fragment_elapsed_work);
-}
-
-/*
- * sof compr fragment elapse, this could be called in irq thread context
- */
-void snd_sof_compr_fragment_elapsed(struct snd_compr_stream *cstream)
-{
-	struct snd_soc_pcm_runtime *rtd;
-	struct snd_compr_runtime *crtd;
-	struct snd_soc_component *component;
-	struct sof_compr_stream *sstream;
-	struct snd_sof_pcm *spcm;
-
-	if (!cstream)
-		return;
-
-	rtd = cstream->private_data;
-	crtd = cstream->runtime;
-	sstream = crtd->private_data;
-	component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
-
-	spcm = snd_sof_find_spcm_dai(component, rtd);
-	if (!spcm) {
-		dev_err(component->dev,
-			"fragment elapsed called for unknown stream!\n");
-		return;
-	}
-
-	sof_set_transferred_bytes(sstream, spcm->stream[cstream->direction].posn.host_posn,
-				  crtd->buffer_size);
-
-	/* use the same workqueue-based solution as for PCM, cf. snd_sof_pcm_elapsed */
-	schedule_work(&spcm->stream[cstream->direction].period_elapsed_work);
-}
-
-static int create_page_table(struct snd_soc_component *component,
-			     struct snd_compr_stream *cstream,
-			     unsigned char *dma_area, size_t size)
-{
-	struct snd_dma_buffer *dmab = cstream->runtime->dma_buffer_p;
-	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	int dir = cstream->direction;
-	struct snd_sof_pcm *spcm;
-
-	spcm = snd_sof_find_spcm_dai(component, rtd);
-	if (!spcm)
-		return -EINVAL;
-
-	return snd_sof_create_page_table(component->dev, dmab,
-					 spcm->stream[dir].page_table.area, size);
-}
-
-static int sof_compr_open(struct snd_soc_component *component,
-			  struct snd_compr_stream *cstream)
+static int sof_ipc3_compr_open(struct snd_soc_component *component,
+			       struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_compr_runtime *crtd = cstream->runtime;
@@ -128,8 +48,8 @@ static int sof_compr_open(struct snd_soc_component *component,
 	return 0;
 }
 
-static int sof_compr_free(struct snd_soc_component *component,
-			  struct snd_compr_stream *cstream)
+static int sof_ipc3_compr_free(struct snd_soc_component *component,
+			       struct snd_compr_stream *cstream)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct sof_compr_stream *sstream = cstream->runtime->private_data;
@@ -159,8 +79,9 @@ static int sof_compr_free(struct snd_soc_component *component,
 	return ret;
 }
 
-static int sof_compr_set_params(struct snd_soc_component *component,
-				struct snd_compr_stream *cstream, struct snd_compr_params *params)
+static int sof_ipc3_compr_set_params(struct snd_soc_component *component,
+				     struct snd_compr_stream *cstream,
+				     struct snd_compr_params *params)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
@@ -213,7 +134,7 @@ static int sof_compr_set_params(struct snd_soc_component *component,
 	if (ret < 0)
 		goto out;
 
-	ret = create_page_table(component, cstream, crtd->dma_area, crtd->dma_bytes);
+	ret = snd_sof_compr_create_page_table(component, cstream, crtd->dma_area, crtd->dma_bytes);
 	if (ret < 0)
 		goto out;
 
@@ -265,8 +186,9 @@ static int sof_compr_set_params(struct snd_soc_component *component,
 	return ret;
 }
 
-static int sof_compr_get_params(struct snd_soc_component *component,
-				struct snd_compr_stream *cstream, struct snd_codec *params)
+static int sof_ipc3_compr_get_params(struct snd_soc_component *component,
+				     struct snd_compr_stream *cstream,
+				     struct snd_codec *params)
 {
 	struct sof_compr_stream *sstream = cstream->runtime->private_data;
 
@@ -275,8 +197,8 @@ static int sof_compr_get_params(struct snd_soc_component *component,
 	return 0;
 }
 
-static int sof_compr_trigger(struct snd_soc_component *component,
-			     struct snd_compr_stream *cstream, int cmd)
+static int sof_ipc3_compr_trigger(struct snd_soc_component *component,
+				  struct snd_compr_stream *cstream, int cmd)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
@@ -312,8 +234,8 @@ static int sof_compr_trigger(struct snd_soc_component *component,
 	return sof_ipc_tx_message_no_reply(sdev->ipc, &stream, sizeof(stream));
 }
 
-static int sof_compr_copy_playback(struct snd_compr_runtime *rtd,
-				   char __user *buf, size_t count)
+static int sof_ipc3_compr_copy_playback(struct snd_compr_runtime *rtd,
+					char __user *buf, size_t count)
 {
 	void *ptr;
 	unsigned int offset, n;
@@ -333,8 +255,8 @@ static int sof_compr_copy_playback(struct snd_compr_runtime *rtd,
 	return count - ret;
 }
 
-static int sof_compr_copy_capture(struct snd_compr_runtime *rtd,
-				  char __user *buf, size_t count)
+static int sof_ipc3_compr_copy_capture(struct snd_compr_runtime *rtd,
+				       char __user *buf, size_t count)
 {
 	void *ptr;
 	unsigned int offset, n;
@@ -354,9 +276,9 @@ static int sof_compr_copy_capture(struct snd_compr_runtime *rtd,
 	return count - ret;
 }
 
-static int sof_compr_copy(struct snd_soc_component *component,
-			  struct snd_compr_stream *cstream,
-			  char __user *buf, size_t count)
+static int sof_ipc3_compr_copy(struct snd_soc_component *component,
+			       struct snd_compr_stream *cstream,
+			       char __user *buf, size_t count)
 {
 	struct snd_compr_runtime *rtd = cstream->runtime;
 
@@ -364,14 +286,14 @@ static int sof_compr_copy(struct snd_soc_component *component,
 		count = rtd->buffer_size;
 
 	if (cstream->direction == SND_COMPRESS_PLAYBACK)
-		return sof_compr_copy_playback(rtd, buf, count);
+		return sof_ipc3_compr_copy_playback(rtd, buf, count);
 	else
-		return sof_compr_copy_capture(rtd, buf, count);
+		return sof_ipc3_compr_copy_capture(rtd, buf, count);
 }
 
-static int sof_compr_pointer(struct snd_soc_component *component,
-			     struct snd_compr_stream *cstream,
-			     struct snd_compr_tstamp64 *tstamp)
+static int sof_ipc3_compr_pointer(struct snd_soc_component *component,
+				  struct snd_compr_stream *cstream,
+				  struct snd_compr_tstamp64 *tstamp)
 {
 	struct snd_sof_pcm *spcm;
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
@@ -392,13 +314,12 @@ static int sof_compr_pointer(struct snd_soc_component *component,
 	return 0;
 }
 
-struct snd_compress_ops sof_compressed_ops = {
-	.open		= sof_compr_open,
-	.free		= sof_compr_free,
-	.set_params	= sof_compr_set_params,
-	.get_params	= sof_compr_get_params,
-	.trigger	= sof_compr_trigger,
-	.pointer	= sof_compr_pointer,
-	.copy		= sof_compr_copy,
+const struct snd_compress_ops sof_ipc3_compressed_ops = {
+	.open		= sof_ipc3_compr_open,
+	.free		= sof_ipc3_compr_free,
+	.set_params	= sof_ipc3_compr_set_params,
+	.get_params	= sof_ipc3_compr_get_params,
+	.trigger	= sof_ipc3_compr_trigger,
+	.pointer	= sof_ipc3_compr_pointer,
+	.copy		= sof_ipc3_compr_copy,
 };
-EXPORT_SYMBOL(sof_compressed_ops);
diff --git a/sound/soc/sof/ipc3-pcm.c b/sound/soc/sof/ipc3-pcm.c
index 143bf0fe8dd9..1d0c80466f6a 100644
--- a/sound/soc/sof/ipc3-pcm.c
+++ b/sound/soc/sof/ipc3-pcm.c
@@ -442,4 +442,7 @@ const struct sof_ipc_pcm_ops ipc3_pcm_ops = {
 	.dai_link_fixup = sof_ipc3_pcm_dai_link_fixup,
 	.reset_hw_params_during_stop = true,
 	.d0i3_supported_in_s0ix = true,
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
+	.compress_ops =	&sof_ipc3_compressed_ops,
+#endif
 };
diff --git a/sound/soc/sof/ipc3-priv.h b/sound/soc/sof/ipc3-priv.h
index 866c5f67b91a..f95957453ab8 100644
--- a/sound/soc/sof/ipc3-priv.h
+++ b/sound/soc/sof/ipc3-priv.h
@@ -17,6 +17,9 @@ extern const struct sof_ipc_tplg_ops ipc3_tplg_ops;
 extern const struct sof_ipc_tplg_control_ops tplg_ipc3_control_ops;
 extern const struct sof_ipc_fw_loader_ops ipc3_loader_ops;
 extern const struct sof_ipc_fw_tracing_ops ipc3_dtrace_ops;
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
+extern const struct snd_compress_ops sof_ipc3_compressed_ops;
+#endif
 
 /* helpers for fw_ready and ext_manifest parsing */
 int sof_ipc3_get_ext_windows(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index f748d072109a..941baa48b275 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -847,7 +847,10 @@ void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 	pd->delay = sof_pcm_delay;
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
-	pd->compress_ops = &sof_compressed_ops;
+	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
+
+	if (pcm_ops)
+		pd->compress_ops = pcm_ops->compress_ops;
 #endif
 
 	pd->pcm_new = sof_pcm_new;
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 72ff03b0b80d..d244e90a734b 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -11,6 +11,7 @@
 #include <linux/bitfield.h>
 #include <trace/events/sof.h>
 #include "sof-audio.h"
+#include "sof-utils.h"
 #include "ops.h"
 
 /*
@@ -1050,3 +1051,83 @@ int sof_dai_get_tdm_slots(struct snd_soc_pcm_runtime *rtd)
 	return sof_dai_get_param(rtd, SOF_DAI_PARAM_INTEL_SSP_TDM_SLOTS);
 }
 EXPORT_SYMBOL(sof_dai_get_tdm_slots);
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
+static void sof_set_transferred_bytes(struct sof_compr_stream *sstream,
+				      u64 host_pos, u64 buffer_size)
+{
+	u64 prev_pos;
+	unsigned int copied;
+
+	div64_u64_rem(sstream->copied_total, buffer_size, &prev_pos);
+
+	if (host_pos < prev_pos)
+		copied = (buffer_size - prev_pos) + host_pos;
+	else
+		copied = host_pos - prev_pos;
+
+	sstream->copied_total += copied;
+}
+
+static void snd_sof_compr_fragment_elapsed_work(struct work_struct *work)
+{
+	struct snd_sof_pcm_stream *sps = container_of(work, struct snd_sof_pcm_stream,
+						      period_elapsed_work);
+
+	snd_compr_fragment_elapsed(sps->cstream);
+}
+
+void snd_sof_compr_init_elapsed_work(struct work_struct *work)
+{
+	INIT_WORK(work, snd_sof_compr_fragment_elapsed_work);
+}
+
+/*
+ * sof compr fragment elapse, this could be called in irq thread context
+ */
+void snd_sof_compr_fragment_elapsed(struct snd_compr_stream *cstream)
+{
+	struct snd_soc_pcm_runtime *rtd;
+	struct snd_compr_runtime *crtd;
+	struct snd_soc_component *component;
+	struct sof_compr_stream *sstream;
+	struct snd_sof_pcm *spcm;
+
+	if (!cstream)
+		return;
+
+	rtd = cstream->private_data;
+	crtd = cstream->runtime;
+	sstream = crtd->private_data;
+	component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm) {
+		dev_err(component->dev, "fragment elapsed called for unknown stream!\n");
+		return;
+	}
+
+	sof_set_transferred_bytes(sstream, spcm->stream[cstream->direction].posn.host_posn,
+				  crtd->buffer_size);
+
+	/* use the same workqueue-based solution as for PCM, cf. snd_sof_pcm_elapsed */
+	schedule_work(&spcm->stream[cstream->direction].period_elapsed_work);
+}
+
+int snd_sof_compr_create_page_table(struct snd_soc_component *component,
+				    struct snd_compr_stream *cstream,
+				    unsigned char *dma_area, size_t size)
+{
+	struct snd_dma_buffer *dmab = cstream->runtime->dma_buffer_p;
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	int dir = cstream->direction;
+	struct snd_sof_pcm *spcm;
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm)
+		return -EINVAL;
+
+	return snd_sof_create_page_table(component->dev, dmab,
+					 spcm->stream[dir].page_table.area, size);
+}
+#endif
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index ae95efc9be1c..bd5bbaf9ae44 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -119,6 +119,7 @@ struct snd_sof_dai_config_data {
  *				  therefore the host must do the same and should stop the DMA during
  *				  hw_free.
  * @d0i3_supported_in_s0ix: Allow DSP D0I3 during S0iX
+ * @compress_ops: Pointer to ops for compressed streams
  */
 struct sof_ipc_pcm_ops {
 	int (*hw_params)(struct snd_soc_component *component, struct snd_pcm_substream *substream,
@@ -139,6 +140,7 @@ struct sof_ipc_pcm_ops {
 	bool ipc_first_on_start;
 	bool platform_stop_during_hw_free;
 	bool d0i3_supported_in_s0ix;
+	const struct snd_compress_ops *compress_ops;
 };
 
 /**
@@ -660,6 +662,9 @@ void snd_sof_pcm_init_elapsed_work(struct work_struct *work);
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
 void snd_sof_compr_fragment_elapsed(struct snd_compr_stream *cstream);
 void snd_sof_compr_init_elapsed_work(struct work_struct *work);
+int snd_sof_compr_create_page_table(struct snd_soc_component *component,
+				    struct snd_compr_stream *cstream,
+				    unsigned char *dma_area, size_t size);
 #else
 static inline void snd_sof_compr_fragment_elapsed(struct snd_compr_stream *cstream) { }
 static inline void snd_sof_compr_init_elapsed_work(struct work_struct *work) { }
-- 
2.55.0

