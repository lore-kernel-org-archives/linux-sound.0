Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FF133B6E3
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 09:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047769; cv=none; b=daugMbprODdykwCrVvkBLDQZRw/rLXBWALx/YWTyJ4XBAaKGAHQkYSTJBlQmHAV/pwCw4/Ks5U1EADcdTEBZHwewB3Eg63NykrA4XoOQw9BuBgPM6LGs/veuqjPFD/QLzdExpdLOtAlVd3/5OOAIRHZEvHdw5F7+P0S6c5Ci6Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047769; c=relaxed/simple;
	bh=am0xYbxdH+RkoKBXmS5J1ou8T8IE1kANqMU6lho0whw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bd3N/3+vtmuiSjLhKZ0XPOXwV3JL8Mc7nwDvWNLfMfUICmW9HkmMS7A2uQmkrfDR02zJTtHbjXY8us4IWAnX/qmU2iazO15okh+RcPot7MVrK1QP+2d2HuKXpMH0ZEdOAp0+xcFLz1eLTxAmlmwqEW0XmMRARmZXlYu+WZ21o90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oe8Ivti4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oe8Ivti4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773047768; x=1804583768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=am0xYbxdH+RkoKBXmS5J1ou8T8IE1kANqMU6lho0whw=;
  b=Oe8Ivti4lg2LNLR2FYbNlP+WLmOET8OGqRR39mSlaN7BpW46vDJ30nl+
   bT7qi78uH3BLy/vhVV01DTDyD8Dl9OiRi9Uf5maarw31wlVz7BqG3CMsI
   dcPMhYJQnhbxyDL9tB1sYAtlPJcAnXQ5bB+cS5G0PP/D8Y/Ashf5GR1lV
   HFoXEuFq0cc6wgD24VWPI8FmUxDIgeLwh0keyhckRvcXVrOpM0vp8Z8JJ
   62UY2ttFowk+amvMGTFb8NxejDMhuUINOhzFkwEw/KfpSe6IuxcgZYOp4
   btm9xlmCxcckR+xg8MFqDdQJegwXd2bm3Zdx5WmdU7NnpkWdNEpD11asq
   Q==;
X-CSE-ConnectionGUID: DFPeClbNSNCtdj9qnh3tYA==
X-CSE-MsgGUID: m3IdwR5XSS2X6NHuq8xLRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84776977"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="84776977"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 02:16:08 -0700
X-CSE-ConnectionGUID: 9wW6ZCqQSQu1tyCALBS1bQ==
X-CSE-MsgGUID: tRH0PRvpQy+S0te4q4/+1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="245688616"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 09 Mar 2026 02:16:06 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/5] ASoC: Intel: catpt: Synchronize stream access
Date: Mon,  9 Mar 2026 10:16:01 +0100
Message-Id: <20260309091605.896307-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309091605.896307-1-cezary.rojewski@intel.com>
References: <20260309091605.896307-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Streams may have individual controls assigned to them e.g.: volume
control in case of offload streams.

If such a stream is running and simultaneously its controls are being
manipulated, both processes are touching the exact same descriptors -
access to these must be synchronized. Replace spinlock with mutex as
IPCs are non-atomic operations and add proper locking for all
->stream_list users.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/core.h   |  2 +-
 sound/soc/intel/catpt/device.c |  2 +-
 sound/soc/intel/catpt/ipc.c    |  3 +++
 sound/soc/intel/catpt/loader.c |  2 ++
 sound/soc/intel/catpt/pcm.c    | 25 +++++++++++++++----------
 5 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
index df8a5fd95e13..7e479ef89ad0 100644
--- a/sound/soc/intel/catpt/core.h
+++ b/sound/soc/intel/catpt/core.h
@@ -96,7 +96,7 @@ struct catpt_dev {
 	struct catpt_module_type modules[CATPT_MODULE_COUNT];
 	struct catpt_ssp_device_format devfmt[CATPT_SSP_COUNT];
 	struct list_head stream_list;
-	spinlock_t list_lock;
+	struct mutex stream_mutex;
 	struct mutex clk_mutex;
 
 	struct catpt_dx_context dx_ctx;
diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index 0638aecba40d..b5f4361d4465 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -226,7 +226,7 @@ static void catpt_dev_init(struct catpt_dev *cdev, struct device *dev,
 	cdev->spec = spec;
 	init_completion(&cdev->fw_ready);
 	INIT_LIST_HEAD(&cdev->stream_list);
-	spin_lock_init(&cdev->list_lock);
+	mutex_init(&cdev->stream_mutex);
 	mutex_init(&cdev->clk_mutex);
 
 	/*
diff --git a/sound/soc/intel/catpt/ipc.c b/sound/soc/intel/catpt/ipc.c
index 5a01a9afb26e..2e3b7a5cbb9b 100644
--- a/sound/soc/intel/catpt/ipc.c
+++ b/sound/soc/intel/catpt/ipc.c
@@ -5,6 +5,7 @@
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/irqreturn.h>
 #include "core.h"
 #include "messages.h"
@@ -151,6 +152,8 @@ catpt_dsp_notify_stream(struct catpt_dev *cdev, union catpt_notify_msg msg)
 	struct catpt_notify_position pos;
 	struct catpt_notify_glitch glitch;
 
+	guard(mutex)(&cdev->stream_mutex);
+
 	stream = catpt_stream_find(cdev, msg.stream_hw_id);
 	if (!stream) {
 		dev_warn(cdev->dev, "notify %d for non-existent stream %d\n",
diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index dc7afe587e6f..432cb1f0ab4e 100644
--- a/sound/soc/intel/catpt/loader.c
+++ b/sound/soc/intel/catpt/loader.c
@@ -90,6 +90,7 @@ int catpt_store_streams_context(struct catpt_dev *cdev, struct dma_chan *chan)
 {
 	struct catpt_stream_runtime *stream;
 
+	/* Lockless as no streams can be added or removed during D3 -> D0 transition. */
 	list_for_each_entry(stream, &cdev->stream_list, node) {
 		u32 off, size;
 		int ret;
@@ -180,6 +181,7 @@ catpt_restore_streams_context(struct catpt_dev *cdev, struct dma_chan *chan)
 {
 	struct catpt_stream_runtime *stream;
 
+	/* Lockless as no streams can be added or removed during D3 -> D0 transition. */
 	list_for_each_entry(stream, &cdev->stream_list, node) {
 		u32 off, size;
 		int ret;
diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 2c5ea4e0ff3d..fbe4821755bd 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -5,6 +5,7 @@
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/pm_runtime.h>
 #include <sound/soc.h>
 #include <sound/pcm_params.h>
@@ -97,12 +98,12 @@ catpt_get_stream_template(struct snd_pcm_substream *substream)
 	return catpt_topology[type];
 }
 
+/* Caller responsible for holding ->stream_mutex. */
 struct catpt_stream_runtime *
 catpt_stream_find(struct catpt_dev *cdev, u8 stream_hw_id)
 {
 	struct catpt_stream_runtime *pos, *result = NULL;
 
-	spin_lock(&cdev->list_lock);
 	list_for_each_entry(pos, &cdev->stream_list, node) {
 		if (pos->info.stream_hw_id == stream_hw_id) {
 			result = pos;
@@ -110,7 +111,6 @@ catpt_stream_find(struct catpt_dev *cdev, u8 stream_hw_id)
 		}
 	}
 
-	spin_unlock(&cdev->list_lock);
 	return result;
 }
 
@@ -286,10 +286,6 @@ static int catpt_dai_startup(struct snd_pcm_substream *substream,
 	INIT_LIST_HEAD(&stream->node);
 	snd_soc_dai_set_dma_data(dai, substream, stream);
 
-	spin_lock(&cdev->list_lock);
-	list_add_tail(&stream->node, &cdev->stream_list);
-	spin_unlock(&cdev->list_lock);
-
 	return 0;
 
 err_request:
@@ -307,10 +303,6 @@ static void catpt_dai_shutdown(struct snd_pcm_substream *substream,
 
 	stream = snd_soc_dai_get_dma_data(dai, substream);
 
-	spin_lock(&cdev->list_lock);
-	list_del(&stream->node);
-	spin_unlock(&cdev->list_lock);
-
 	release_resource(stream->persistent);
 	kfree(stream->persistent);
 	catpt_dsp_update_srampge(cdev, &cdev->dram, cdev->spec->dram_mask);
@@ -410,12 +402,15 @@ static int catpt_dai_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return CATPT_IPC_RET(ret);
 
+	guard(mutex)(&cdev->stream_mutex);
+
 	ret = catpt_dai_apply_usettings(dai, stream);
 	if (ret) {
 		catpt_ipc_free_stream(cdev, stream->info.stream_hw_id);
 		return ret;
 	}
 
+	list_add_tail(&stream->node, &cdev->stream_list);
 	stream->allocated = true;
 	return 0;
 }
@@ -430,6 +425,10 @@ static int catpt_dai_hw_free(struct snd_pcm_substream *substream,
 	if (!stream->allocated)
 		return 0;
 
+	mutex_lock(&cdev->stream_mutex);
+	list_del(&stream->node);
+	mutex_unlock(&cdev->stream_mutex);
+
 	catpt_ipc_reset_stream(cdev, stream->info.stream_hw_id);
 	catpt_ipc_free_stream(cdev, stream->info.stream_hw_id);
 
@@ -910,6 +909,8 @@ static int catpt_stream_volume_get(struct snd_kcontrol *kcontrol,
 	int ret;
 	int i;
 
+	guard(mutex)(&cdev->stream_mutex);
+
 	stream = catpt_stream_find(cdev, pin_id);
 	if (!stream) {
 		for (i = 0; i < CATPT_CHANNELS_MAX; i++)
@@ -941,6 +942,8 @@ static int catpt_stream_volume_put(struct snd_kcontrol *kcontrol,
 	long *ctlvol = (long *)kcontrol->private_value;
 	int ret, i;
 
+	guard(mutex)(&cdev->stream_mutex);
+
 	stream = catpt_stream_find(cdev, pin_id);
 	if (!stream) {
 		for (i = 0; i < CATPT_CHANNELS_MAX; i++)
@@ -1017,6 +1020,8 @@ static int catpt_loopback_switch_put(struct snd_kcontrol *kcontrol,
 	bool mute;
 	int ret;
 
+	guard(mutex)(&cdev->stream_mutex);
+
 	mute = (bool)ucontrol->value.integer.value[0];
 	stream = catpt_stream_find(cdev, CATPT_PIN_ID_REFERENCE);
 	if (!stream) {
-- 
2.34.1

