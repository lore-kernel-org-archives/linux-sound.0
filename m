Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7602727E2
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765805375; cv=none; b=tgeetXlsBLpSlcFqSxM+qlFy027ZToMHvBaSKoCKp8h2aV43uarDn3TlqacZbLBaCpeYwJGxxPz1gKJbhRJWeo4aSSUU/96/zShHMRr26GrChzSOoVckeOFAx3AWkwskc+Ngxs94lfv0ZVYxc7T5qQ6tBsIpG9OxXcizn8MbBGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765805375; c=relaxed/simple;
	bh=KsQ53WjqfTFVFScr0CxfJnaY3fAKUQAu+D/VBYVHJ+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KaXerGD/3tYMK4fUXZhJAI1agVmMcNh16/nEbLUH80ZMADNO5pNRA4cpNjja84e5DfaKW5re8pIWbachAJpxWNiBz708zBPXYJ+JtzTES+IqQ3S2rIV/0t4sRi/Y7MHTJ3dTUDH02mmJUi5SUBwBTNFqC75/nQ7gmSj1EGjqcq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBQM4TQI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBQM4TQI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765805373; x=1797341373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KsQ53WjqfTFVFScr0CxfJnaY3fAKUQAu+D/VBYVHJ+0=;
  b=UBQM4TQIZ98jMSGEjM316/1FjcP6rwlhYiv4SXWHD4tNPEWgKjWNjR8e
   Ck/F4l9O7tfa7wv91oROsZKDN4KAIVj2qYjnpY+GO5l0OC2iGxvPW8v6A
   FAQPHsUEv5XxXM3pTqzqpeyGNRyE36+UFlLvCQIgolgtIaCSjWEOdCU3a
   rS1sKHfWdcYvKSSz5Ma5k7uYggy58+CUtckiB15IpqGqZM6PFqg4W3p3e
   KlmSQd9kuE78XjQe8nmEOR8cVUu8432QdB3PQ1Q2nbrlIt19Vz8DaJu1L
   y6qnzipmGm6/dZaJO+p0j0b4aBo36+4lxz1pVxYwzz2soBGQxqdXxj8lW
   w==;
X-CSE-ConnectionGUID: SnNjFksTQGa03xCH4Rnfbg==
X-CSE-MsgGUID: 9vOI7FJBR9Gl9EFbBeEGTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="93179472"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="93179472"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:29:33 -0800
X-CSE-ConnectionGUID: 8EB9qpiQRcmWIpEnUqud1w==
X-CSE-MsgGUID: miv25N3QSpuENmWtcaiDbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="228376982"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:29:31 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 3/8] ASoC: SOF: Add support for on-demand DSP boot
Date: Mon, 15 Dec 2025 15:29:41 +0200
Message-ID: <20251215132946.2155-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215132946.2155-1-peter.ujfalusi@linux.intel.com>
References: <20251215132946.2155-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On system suspend / resume we always power up the DSP and boot the
firmware, which is not strictly needed as right after the firmware booted
up we power the DSP down again on suspend and we also power it down after
resume after some inactivity.

Out of caution, add a new platform descriptor flag to enable on-demand
DSP boot since this might not work without changes to platform code on
certain platforms.

With the on-demand dsp boot enabled we will not boot the DSP and firmware
up on system or rpm resume, just enable audio subsystem since audio IPs,
like HDA and SoundWire might be needed (codecs suspend/resume operation).
Only boot up the DSP during the first hw_params() call when the DSP is
really going to be needed.

In this way we can handle the audio related use cases:
normal audio use (rpm suspend/resume)
system suspend/resume without active audio
system suspend/resume with active audio
system suspend/resume without active audio, and audio start before the rpm
suspend timeout

Add module option to force the on-demand DSP boot to allow it to be
disabled or enabled without kernel change for testing.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 include/sound/sof.h         |   3 +
 sound/soc/sof/compress.c    |   8 ++
 sound/soc/sof/control.c     |   7 +-
 sound/soc/sof/core.c        |   1 +
 sound/soc/sof/debug.c       |   7 +-
 sound/soc/sof/ipc3-dtrace.c |   7 +-
 sound/soc/sof/ipc4.c        |  13 ++++
 sound/soc/sof/pcm.c         |  10 +++
 sound/soc/sof/pm.c          | 149 ++++++++++++++++++++++--------------
 sound/soc/sof/sof-priv.h    |   3 +
 10 files changed, 149 insertions(+), 59 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index eddea82c7b5a..38d6c8cb5e83 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -159,6 +159,9 @@ struct sof_dev_desc {
 	/* The platform supports DSPless mode */
 	bool dspless_mode_supported;
 
+	/* On demand DSP booting is possible on the platform */
+	bool on_demand_dsp_boot;
+
 	/* defaults paths for firmware, library and topology files */
 	const char *default_fw_path[SOF_IPC_TYPE_COUNT];
 	const char *default_lib_path[SOF_IPC_TYPE_COUNT];
diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index 90b932ae3bab..86d563c864e5 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -195,6 +195,14 @@ static int sof_compr_set_params(struct snd_soc_component *component,
 	if (sizeof(*pcm) + ext_data_size > sdev->ipc->max_payload_size)
 		return -EINVAL;
 
+	/*
+	 * Make sure that the DSP is booted up, which might not be the
+	 * case if the on-demand DSP boot is used
+	 */
+	ret = snd_sof_boot_dsp_firmware(sdev);
+	if (ret)
+		return ret;
+
 	pcm = kzalloc(sizeof(*pcm) + ext_data_size, GFP_KERNEL);
 	if (!pcm)
 		return -ENOMEM;
diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 9582ab5f1113..74d997a4f620 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -198,7 +198,12 @@ int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int _
 		return ret;
 	}
 
-	ret = tplg_ops->control->bytes_ext_volatile_get(scontrol, binary_data, size);
+	/* Make sure the DSP/firmware is booted up */
+	ret = snd_sof_boot_dsp_firmware(sdev);
+	if (!ret)
+		ret = tplg_ops->control->bytes_ext_volatile_get(scontrol,
+								binary_data,
+								size);
 
 	err = pm_runtime_put_autosuspend(scomp->dev);
 	if (err < 0)
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index b11f408f1366..2d394389c945 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -680,6 +680,7 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 	mutex_init(&sdev->power_state_access);
 	mutex_init(&sdev->ipc_client_mutex);
 	mutex_init(&sdev->client_event_handler_mutex);
+	mutex_init(&sdev->dsp_fw_boot_mutex);
 
 	/* set default timeouts if none provided */
 	if (plat_data->desc->ipc_timeout == 0)
diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index b24943a65c89..6b9e1f1ee657 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -216,7 +216,12 @@ static int memory_info_update(struct snd_sof_dev *sdev, char *buf, size_t buff_s
 		goto error;
 	}
 
-	ret = sof_ipc_tx_message(sdev->ipc, &msg, msg.size, reply, SOF_IPC_MSG_MAX_SIZE);
+	/* Make sure the DSP/firmware is booted up */
+	ret = snd_sof_boot_dsp_firmware(sdev);
+	if (!ret)
+		ret = sof_ipc_tx_message(sdev->ipc, &msg, msg.size, reply,
+					 SOF_IPC_MSG_MAX_SIZE);
+
 	pm_runtime_put_autosuspend(sdev->dev);
 	if (ret < 0 || reply->rhdr.error < 0) {
 		ret = min(ret, reply->rhdr.error);
diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index 6ec391fd39a9..50700f5cb0ef 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -171,7 +171,12 @@ static int ipc3_trace_update_filter(struct snd_sof_dev *sdev, int num_elems,
 		dev_err(sdev->dev, "enabling device failed: %d\n", ret);
 		goto error;
 	}
-	ret = sof_ipc_tx_message_no_reply(sdev->ipc, msg, msg->hdr.size);
+
+	/* Make sure the DSP/firmware is booted up */
+	ret = snd_sof_boot_dsp_firmware(sdev);
+	if (!ret)
+		ret = sof_ipc_tx_message_no_reply(sdev->ipc, msg, msg->hdr.size);
+
 	pm_runtime_put_autosuspend(sdev->dev);
 
 error:
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index a4a090e6724a..1df97129cee6 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -892,6 +892,19 @@ void sof_ipc4_mic_privacy_state_change(struct snd_sof_dev *sdev, bool state)
 	struct sof_ipc4_msg msg;
 	u32 data = state;
 
+	/*
+	 * The mic privacy change notification's role is to notify the running
+	 * firmware that there is a change in mic privacy state from whatever
+	 * the state was before - since the firmware booted up or since the
+	 * previous change during runtime.
+	 *
+	 * If the firmware has not been booted up, there is no need to send
+	 * change notification (the firmware is not booted up).
+	 * The firmware checks the current state during its boot.
+	 */
+	if (sdev->fw_state != SOF_FW_BOOT_COMPLETE)
+		return;
+
 	msg.primary = SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
 	msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
 	msg.primary |= SOF_IPC4_MOD_ID(SOF_IPC4_MOD_INIT_BASEFW_MOD_ID);
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index cee04574264e..31879a11c33e 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -122,6 +122,16 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 
 	spcm_dbg(spcm, substream->stream, "Entry: hw_params\n");
 
+	if (!sdev->dspless_mode_selected) {
+		/*
+		 * Make sure that the DSP is booted up, which might not be the
+		 * case if the on-demand DSP boot is used
+		 */
+		ret = snd_sof_boot_dsp_firmware(sdev);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * Handle repeated calls to hw_params() without free_pcm() in
 	 * between. At least ALSA OSS emulation depends on this.
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 8e3bcf602beb..dd7cd87f1fa5 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -8,10 +8,15 @@
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
 
+#include <linux/module.h>
 #include "ops.h"
 #include "sof-priv.h"
 #include "sof-audio.h"
 
+static int override_on_demand_boot = -1;
+module_param_named(on_demand_boot, override_on_demand_boot, int, 0444);
+MODULE_PARM_DESC(on_demand_boot, "Force on-demand DSP boot: 0 - disabled, 1 - enabled");
+
 /*
  * Helper function to determine the target DSP state during
  * system suspend. This function only cares about the device
@@ -70,67 +75,28 @@ static void sof_cache_debugfs(struct snd_sof_dev *sdev)
 }
 #endif
 
-static int sof_resume(struct device *dev, bool runtime_resume)
+int snd_sof_boot_dsp_firmware(struct snd_sof_dev *sdev)
 {
-	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	const struct sof_ipc_pm_ops *pm_ops = sof_ipc_get_ops(sdev, pm);
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
-	u32 old_state = sdev->dsp_power_state.state;
 	int ret;
 
-	/* do nothing if dsp resume callbacks are not set */
-	if (!runtime_resume && !sof_ops(sdev)->resume)
-		return 0;
-
-	if (runtime_resume && !sof_ops(sdev)->runtime_resume)
-		return 0;
-
-	/* DSP was never successfully started, nothing to resume */
-	if (sdev->first_boot)
-		return 0;
-
-	/*
-	 * if the runtime_resume flag is set, call the runtime_resume routine
-	 * or else call the system resume routine
-	 */
-	if (runtime_resume)
-		ret = snd_sof_dsp_runtime_resume(sdev);
-	else
-		ret = snd_sof_dsp_resume(sdev);
-	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: failed to power up DSP after resume\n");
-		return ret;
-	}
+	guard(mutex)(&sdev->dsp_fw_boot_mutex);
 
-	if (sdev->dspless_mode_selected) {
-		sof_set_fw_state(sdev, SOF_DSPLESS_MODE);
+	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE) {
+		/* Firmware already booted, just return */
 		return 0;
 	}
 
-	/*
-	 * Nothing further to be done for platforms that support the low power
-	 * D0 substate. Resume trace and return when resuming from
-	 * low-power D0 substate
-	 */
-	if (!runtime_resume && sof_ops(sdev)->set_power_state &&
-	    old_state == SOF_DSP_PM_D0) {
-		ret = sof_fw_trace_resume(sdev);
-		if (ret < 0)
-			/* non fatal */
-			dev_warn(sdev->dev,
-				 "failed to enable trace after resume %d\n", ret);
-		return 0;
-	}
+	dev_dbg(sdev->dev, "Booting DSP firmware\n");
 
 	sof_set_fw_state(sdev, SOF_FW_BOOT_PREPARE);
 
 	/* load the firmware */
 	ret = snd_sof_load_firmware(sdev);
 	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: failed to load DSP firmware after resume %d\n",
-			ret);
+		dev_err(sdev->dev, "%s: failed to load DSP firmware: %d\n",
+			__func__, ret);
 		sof_set_fw_state(sdev, SOF_FW_BOOT_FAILED);
 		return ret;
 	}
@@ -143,9 +109,8 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 	 */
 	ret = snd_sof_run_firmware(sdev);
 	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: failed to boot DSP firmware after resume %d\n",
-			ret);
+		dev_err(sdev->dev, "%s: failed to boot DSP firmware: %d\n",
+			__func__, ret);
 		sof_set_fw_state(sdev, SOF_FW_BOOT_FAILED);
 		return ret;
 	}
@@ -154,16 +119,16 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 	ret = sof_fw_trace_resume(sdev);
 	if (ret < 0) {
 		/* non fatal */
-		dev_warn(sdev->dev,
-			 "warning: failed to init trace after resume %d\n",
-			 ret);
+		dev_warn(sdev->dev, "%s: failed to resume trace: %d\n",
+			 __func__, ret);
 	}
 
 	/* restore pipelines */
 	if (tplg_ops && tplg_ops->set_up_all_pipelines) {
 		ret = tplg_ops->set_up_all_pipelines(sdev, false);
 		if (ret < 0) {
-			dev_err(sdev->dev, "Failed to restore pipeline after resume %d\n", ret);
+			dev_err(sdev->dev, "%s: failed to restore pipeline: %d\n",
+				__func__, ret);
 			goto setup_fail;
 		}
 	}
@@ -175,7 +140,8 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 	if (pm_ops && pm_ops->ctx_restore) {
 		ret = pm_ops->ctx_restore(sdev);
 		if (ret < 0)
-			dev_err(sdev->dev, "ctx_restore IPC error during resume: %d\n", ret);
+			dev_err(sdev->dev, "%s: ctx_restore IPC failed: %d\n",
+				__func__, ret);
 	}
 
 setup_fail:
@@ -192,6 +158,73 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 
 	return ret;
 }
+EXPORT_SYMBOL(snd_sof_boot_dsp_firmware);
+
+static int sof_resume(struct device *dev, bool runtime_resume)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	u32 old_state = sdev->dsp_power_state.state;
+	bool on_demand_boot;
+	int ret;
+
+	/* do nothing if dsp resume callbacks are not set */
+	if (!runtime_resume && !sof_ops(sdev)->resume)
+		return 0;
+
+	if (runtime_resume && !sof_ops(sdev)->runtime_resume)
+		return 0;
+
+	/* DSP was never successfully started, nothing to resume */
+	if (sdev->first_boot)
+		return 0;
+
+	/*
+	 * if the runtime_resume flag is set, call the runtime_resume routine
+	 * or else call the system resume routine
+	 */
+	if (runtime_resume)
+		ret = snd_sof_dsp_runtime_resume(sdev);
+	else
+		ret = snd_sof_dsp_resume(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: failed to power up DSP after resume\n");
+		return ret;
+	}
+
+	if (sdev->dspless_mode_selected) {
+		sof_set_fw_state(sdev, SOF_DSPLESS_MODE);
+		return 0;
+	}
+
+	/*
+	 * Nothing further to be done for platforms that support the low power
+	 * D0 substate. Resume trace and return when resuming from
+	 * low-power D0 substate
+	 */
+	if (!runtime_resume && sof_ops(sdev)->set_power_state &&
+	    old_state == SOF_DSP_PM_D0) {
+		ret = sof_fw_trace_resume(sdev);
+		if (ret < 0)
+			/* non fatal */
+			dev_warn(sdev->dev,
+				 "failed to enable trace after resume %d\n", ret);
+		return 0;
+	}
+
+	if (override_on_demand_boot > -1)
+		on_demand_boot = override_on_demand_boot ? true : false;
+	else
+		on_demand_boot = sdev->pdata->desc->on_demand_dsp_boot;
+
+	if (on_demand_boot) {
+		/* Only change the fw_state to PREPARE but skip booting */
+		sof_set_fw_state(sdev, SOF_FW_BOOT_PREPARE);
+		return 0;
+	}
+
+	return snd_sof_boot_dsp_firmware(sdev);
+}
 
 static int sof_suspend(struct device *dev, bool runtime_suspend)
 {
@@ -297,8 +330,12 @@ int snd_sof_dsp_power_down_notify(struct snd_sof_dev *sdev)
 {
 	const struct sof_ipc_pm_ops *pm_ops = sof_ipc_get_ops(sdev, pm);
 
-	/* Notify DSP of upcoming power down */
-	if (sof_ops(sdev)->remove && pm_ops && pm_ops->ctx_save)
+	/*
+	 * Notify DSP of upcoming power down only if the firmware has been
+	 * booted up
+	 */
+	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE && sof_ops(sdev)->remove &&
+	    pm_ops && pm_ops->ctx_save)
 		return pm_ops->ctx_save(sdev);
 
 	return 0;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 0f624d8cde20..693d063830fa 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -580,6 +580,8 @@ struct snd_sof_dev {
 	wait_queue_head_t boot_wait;
 	enum sof_fw_state fw_state;
 	bool first_boot;
+	/* mutex to protect DSP firmware boot (except initial, probe time boot */
+	struct mutex dsp_fw_boot_mutex;
 
 	/* work queue in case the probe is implemented in two steps */
 	struct work_struct probe_work;
@@ -703,6 +705,7 @@ int snd_sof_suspend(struct device *dev);
 int snd_sof_dsp_power_down_notify(struct snd_sof_dev *sdev);
 int snd_sof_prepare(struct device *dev);
 void snd_sof_complete(struct device *dev);
+int snd_sof_boot_dsp_firmware(struct snd_sof_dev *sdev);
 
 void snd_sof_new_platform_drv(struct snd_sof_dev *sdev);
 
-- 
2.52.0

