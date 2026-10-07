Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930A13CBE9C
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363006; cv=none; b=chixfpXq2M2+lfuX7hpbCAez+9SCPBs6QzkebinIoM20TvTe3IVUXdCskYy70yPsJAJ+ctC/6zuGmBU3Q0dyTUCch/lxh+Q9y+lT4e5G5flBEYb4uaFXW3RZ0pWhO+rc/KbNLivoKAD3Oh4ShgLZDOQS3m7HBnvX/1fP7b8sg28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363006; c=relaxed/simple;
	bh=saoWiy5XH29AegIA3yqm6XVA/3C15qzzUCgDaC2IAX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lvk3/Tnq5XN7tjX1NrlxLXtStXAQsYEUIVeKJxcvuS5tOxMbqh2BlbwlZIGpAzui5BINd9uWoGmJ+QWfh5mDonVL/WNJ9utCvqvxmzgBdn7OeN/lG14maT9ScdbspeHX9eA0j3a8sntagk1WdniLlmmWE1hSKCt3DmwThRDRdEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBaF5mvT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBaF5mvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791363006; x=1822899006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=saoWiy5XH29AegIA3yqm6XVA/3C15qzzUCgDaC2IAX8=;
  b=OBaF5mvTrwRjXQe1rYekGyy2HpJqm7ZHpMI8gP/6Gkqn48pDu8xf42uW
   P6mt5du2Co0BFLYGCqB6VJfsippLHRTw8s/Og9WKATre9rUMgwMVWKEsJ
   0vPfbMSB+s97exWAtfbiabzLFaxR+zcikWq3IrC0Wm8DMc3ccgt8kJd8+
   PhFULQXmQQU3BEMrYfD0Du1YEOYPEMsw0zRkivJr2EF9X/zJeNj1YmrGb
   0lC6XC+RT5XMJa2uiV2KvzxjSrqjLCWqoCobe+DkiU5nzjESHLVOEqIvm
   f2l61/aen9rS7S5vk/8VIpVHHGMzSDwUEu1MkI23HbPLfIOKm7H4XF/sn
   Q==;
X-CSE-ConnectionGUID: 18jSw8WkRY2M1g8g07xFyA==
X-CSE-MsgGUID: 7+ijEgeSTkycSkngwErhdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="113908"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="113908"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:05 -0700
X-CSE-ConnectionGUID: 3zwwZvjEQOiVKlz+P1jreg==
X-CSE-MsgGUID: 9x0bBvGxQFy6VTxniyJYNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670603"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:02 -0700
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
Subject: [PATCH v5 09/28] ASoC: SOF: compress: Rename compress ops with ipc3 prefix
Date: Wed,  7 Oct 2026 11:49:36 +0300
Message-ID: <20261007084955.1256-10-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
References: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

In preparation for adding support for compressed offload support for
IPC4, rename the current compress implementation with the IPC3 prefix
and rename the compress.c file to ipc3-compress.c

Introduce a new field in struct sof_ipc_pcm_ops to save the
IPC-specific compressed ops pointer, which is assigned to the component
driver ops during SOF device probe. As this now depends on the IPC ops,
move snd_sof_new_platform_drv() after the IPC ops are initialized.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/Makefile                        |  2 +-
 sound/soc/sof/core.c                          | 10 ++-
 sound/soc/sof/{compress.c => ipc3-compress.c} | 63 ++++++++++---------
 sound/soc/sof/ipc3-pcm.c                      |  3 +
 sound/soc/sof/ipc3-priv.h                     |  3 +
 sound/soc/sof/pcm.c                           |  5 +-
 sound/soc/sof/sof-audio.h                     |  2 +
 7 files changed, 52 insertions(+), 36 deletions(-)
 rename sound/soc/sof/{compress.c => ipc3-compress.c} (82%)

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
similarity index 82%
rename from sound/soc/sof/compress.c
rename to sound/soc/sof/ipc3-compress.c
index 76d03faaafc4..115d454bcaf5 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/ipc3-compress.c
@@ -12,8 +12,8 @@
 #include "sof-utils.h"
 #include "ops.h"
 
-static int sof_compr_open(struct snd_soc_component *component,
-			  struct snd_compr_stream *cstream)
+static int sof_ipc3_compr_open(struct snd_soc_component *component,
+			       struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_compr_runtime *crtd = cstream->runtime;
@@ -48,8 +48,8 @@ static int sof_compr_open(struct snd_soc_component *component,
 	return 0;
 }
 
-static int sof_compr_free(struct snd_soc_component *component,
-			  struct snd_compr_stream *cstream)
+static int sof_ipc3_compr_free(struct snd_soc_component *component,
+			       struct snd_compr_stream *cstream)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct sof_compr_stream *sstream = cstream->runtime->private_data;
@@ -79,8 +79,9 @@ static int sof_compr_free(struct snd_soc_component *component,
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
@@ -185,8 +186,9 @@ static int sof_compr_set_params(struct snd_soc_component *component,
 	return ret;
 }
 
-static int sof_compr_get_params(struct snd_soc_component *component,
-				struct snd_compr_stream *cstream, struct snd_codec *params)
+static int sof_ipc3_compr_get_params(struct snd_soc_component *component,
+				     struct snd_compr_stream *cstream,
+				     struct snd_codec *params)
 {
 	struct sof_compr_stream *sstream = cstream->runtime->private_data;
 
@@ -195,8 +197,8 @@ static int sof_compr_get_params(struct snd_soc_component *component,
 	return 0;
 }
 
-static int sof_compr_trigger(struct snd_soc_component *component,
-			     struct snd_compr_stream *cstream, int cmd)
+static int sof_ipc3_compr_trigger(struct snd_soc_component *component,
+				  struct snd_compr_stream *cstream, int cmd)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
@@ -232,8 +234,8 @@ static int sof_compr_trigger(struct snd_soc_component *component,
 	return sof_ipc_tx_message_no_reply(sdev->ipc, &stream, sizeof(stream));
 }
 
-static int sof_compr_copy_playback(struct snd_compr_runtime *rtd,
-				   char __user *buf, size_t count)
+static int sof_ipc3_compr_copy_playback(struct snd_compr_runtime *rtd,
+					char __user *buf, size_t count)
 {
 	void *ptr;
 	unsigned int offset, n;
@@ -253,8 +255,8 @@ static int sof_compr_copy_playback(struct snd_compr_runtime *rtd,
 	return count - ret;
 }
 
-static int sof_compr_copy_capture(struct snd_compr_runtime *rtd,
-				  char __user *buf, size_t count)
+static int sof_ipc3_compr_copy_capture(struct snd_compr_runtime *rtd,
+				       char __user *buf, size_t count)
 {
 	void *ptr;
 	unsigned int offset, n;
@@ -274,9 +276,9 @@ static int sof_compr_copy_capture(struct snd_compr_runtime *rtd,
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
 
@@ -284,14 +286,14 @@ static int sof_compr_copy(struct snd_soc_component *component,
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
@@ -312,13 +314,12 @@ static int sof_compr_pointer(struct snd_soc_component *component,
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
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index c09099f30378..bd5bbaf9ae44 100644
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
-- 
2.56.0

