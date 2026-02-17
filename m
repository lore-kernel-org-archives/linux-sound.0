Received: from mail.unwrap.rs (mail.unwrap.rs [172.232.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18442F5491;
	Tue, 17 Feb 2026 21:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.232.15.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771365025; cv=none; b=p1DDOnxz0VoPYHdW/vQ60rXTDYDywWzLqrQjYq4UbiFsbhvZzpLTuFQcohDZUr2TqRZ7hHTQyzBVuHqxLdg/1OnrvSpY3JBElwPvRM5x1zC7H/Wp80Gc/gWVc8zM/pFzzGGzT8t6RGmVxC3PH9ob8e7vYfHnT4myBttZCYbiGJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771365025; c=relaxed/simple;
	bh=IvLGdKHknhdImuhZEbfhcJmJMumZv0f1ocpoQLGbqGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X3d7dqsphR1Ys6pguRjqBImZo5JmAKmB4kT9N7Z3woQRElt9GSBQFS7pKOPRSPDL+NssnOo15/xsU/ychim86SQzIGVyWI0zWaheo6AQJZ54ZDZtc1czVOz26XBRBUkqH33vFFEn6XZMxffivu2GsVmwSgBPHt6xGQFVgwESXnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs; spf=pass smtp.mailfrom=unwrap.rs; arc=none smtp.client-ip=172.232.15.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unwrap.rs
From: Cole Leavitt <cole@unwrap.rs>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cole Leavitt <cole@unwrap.rs>
Subject: [PATCH v2] ASoC: SOF: Replace IPC TX busy deferral with bounded retry
Date: Tue, 17 Feb 2026 14:49:45 -0700
Message-ID: <20260217214945.6493-1-cole@unwrap.rs>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <6dfb6f6a-3729-4fd0-9ddd-690728ef94f8@linux.intel.com>
References: <6dfb6f6a-3729-4fd0-9ddd-690728ef94f8@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SOF IPC4 platform send_msg functions (hda_dsp_ipc4_send_msg,
mtl_ipc_send_msg, cnl_ipc4_send_msg) previously stored the message in
delayed_ipc_tx_msg and returned 0 when the TX register was busy. The
deferred message was supposed to be dispatched from the IRQ handler
when the DSP acknowledged the previous message.

This mechanism silently drops messages during D0i3 power transitions
because the IRQ handler never fires while the DSP is in a low-power
state. The caller then hangs in wait_event_timeout() for up to 500ms
per IPC chunk, causing multi-second audio stalls under CPU load.

Fix this by making the platform send_msg functions return -EBUSY
immediately when the TX register is busy (safe since they execute
under spin_lock_irq in sof_ipc_send_msg), and adding a bounded retry
loop with usleep_range() in ipc4_tx_msg_unlocked() which only holds
the tx_mutex (a sleepable context). The retry loop attempts up to 50
iterations with 100-200us delays, bounding the maximum busy-wait to
approximately 10ms instead of the previous 500ms timeout.

Also remove the now-dead delayed_ipc_tx_msg field from
sof_intel_hda_dev, the dispatch code, and the ack_received tracking
variable from all three IRQ thread handlers (hda_dsp_ipc4_irq_thread,
mtl_ipc_irq_thread, cnl_ipc4_irq_thread).

Signed-off-by: Cole Leavitt <cole@unwrap.rs>
---
Changes in v2:
  - Removed __func__ from debug prints (dyndbg adds it automatically)
  - Added dev_dbg() when message sending is delayed due to EBUSY
  - Dropped patch 2/2 (dai_link_hw_ready) per Pierre's feedback

 sound/soc/sof/intel/cnl.c     | 17 ++---------------
 sound/soc/sof/intel/hda-ipc.c | 17 ++---------------
 sound/soc/sof/intel/hda.h     |  8 --------
 sound/soc/sof/intel/mtl.c     | 17 ++---------------
 sound/soc/sof/ipc4.c          | 20 ++++++++++++++++++--
 5 files changed, 24 insertions(+), 55 deletions(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 0cc5725515e7..a2c6c7894a0f 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -37,7 +37,6 @@ irqreturn_t cnl_ipc4_irq_thread(int irq, void *context)
 {
 	struct sof_ipc4_msg notification_data = {{ 0 }};
 	struct snd_sof_dev *sdev = context;
-	bool ack_received = false;
 	bool ipc_irq = false;
 	u32 hipcida, hipctdr;
 
@@ -51,7 +50,6 @@ irqreturn_t cnl_ipc4_irq_thread(int irq, void *context)
 		cnl_ipc_dsp_done(sdev);
 
 		ipc_irq = true;
-		ack_received = true;
 	}
 
 	if (hipctdr & CNL_DSP_REG_HIPCTDR_BUSY) {
@@ -101,13 +99,6 @@ irqreturn_t cnl_ipc4_irq_thread(int irq, void *context)
 		/* This interrupt is not shared so no need to return IRQ_NONE. */
 		dev_dbg_ratelimited(sdev->dev, "nothing to do in IPC IRQ thread\n");
 
-	if (ack_received) {
-		struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
-
-		if (hdev->delayed_ipc_tx_msg)
-			cnl_ipc4_send_msg(sdev, hdev->delayed_ipc_tx_msg);
-	}
-
 	return IRQ_HANDLED;
 }
 EXPORT_SYMBOL_NS(cnl_ipc4_irq_thread, "SND_SOC_SOF_INTEL_CNL");
@@ -266,12 +257,8 @@ int cnl_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 	struct sof_ipc4_msg *msg_data = msg->msg_data;
 
-	if (hda_ipc4_tx_is_busy(sdev)) {
-		hdev->delayed_ipc_tx_msg = msg;
-		return 0;
-	}
-
-	hdev->delayed_ipc_tx_msg = NULL;
+	if (hda_ipc4_tx_is_busy(sdev))
+		return -EBUSY;
 
 	/* send the message via mailbox */
 	if (msg_data->data_size)
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 94425c510861..78449452041c 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -106,12 +106,8 @@ int hda_dsp_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 	struct sof_ipc4_msg *msg_data = msg->msg_data;
 
-	if (hda_ipc4_tx_is_busy(sdev)) {
-		hdev->delayed_ipc_tx_msg = msg;
-		return 0;
-	}
-
-	hdev->delayed_ipc_tx_msg = NULL;
+	if (hda_ipc4_tx_is_busy(sdev))
+		return -EBUSY;
 
 	/* send the message via mailbox */
 	if (msg_data->data_size)
@@ -168,7 +164,6 @@ irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context)
 {
 	struct sof_ipc4_msg notification_data = {{ 0 }};
 	struct snd_sof_dev *sdev = context;
-	bool ack_received = false;
 	bool ipc_irq = false;
 	u32 hipcie, hipct;
 
@@ -182,7 +177,6 @@ irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context)
 		hda_dsp_ipc_dsp_done(sdev);
 
 		ipc_irq = true;
-		ack_received = true;
 	}
 
 	if (hipct & HDA_DSP_REG_HIPCT_BUSY) {
@@ -236,13 +230,6 @@ irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context)
 		/* This interrupt is not shared so no need to return IRQ_NONE. */
 		dev_dbg_ratelimited(sdev->dev, "nothing to do in IPC IRQ thread\n");
 
-	if (ack_received) {
-		struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
-
-		if (hdev->delayed_ipc_tx_msg)
-			hda_dsp_ipc4_send_msg(sdev, hdev->delayed_ipc_tx_msg);
-	}
-
 	return IRQ_HANDLED;
 }
 EXPORT_SYMBOL_NS(hda_dsp_ipc4_irq_thread, "SND_SOC_SOF_INTEL_HDA_COMMON");
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 562fe8be79c1..ac9f76a5ef97 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -549,14 +549,6 @@ struct sof_intel_hda_dev {
 
 	/* work queue for mic privacy state change notification sending */
 	struct sof_ace3_mic_privacy mic_privacy;
-
-	/*
-	 * Pointing to the IPC message if immediate sending was not possible
-	 * because the downlink communication channel was BUSY at the time.
-	 * The message will be re-tried when the channel becomes free (the ACK
-	 * is received from the DSP for the previous message)
-	 */
-	struct snd_sof_ipc_msg *delayed_ipc_tx_msg;
 };
 
 static inline struct hdac_bus *sof_to_bus(struct snd_sof_dev *s)
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 095dcf1a18e4..24dec128f589 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -101,12 +101,8 @@ static int mtl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *ms
 	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 	struct sof_ipc4_msg *msg_data = msg->msg_data;
 
-	if (hda_ipc4_tx_is_busy(sdev)) {
-		hdev->delayed_ipc_tx_msg = msg;
-		return 0;
-	}
-
-	hdev->delayed_ipc_tx_msg = NULL;
+	if (hda_ipc4_tx_is_busy(sdev))
+		return -EBUSY;
 
 	/* send the message via mailbox */
 	if (msg_data->data_size)
@@ -559,7 +555,6 @@ static irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
 {
 	struct sof_ipc4_msg notification_data = {{ 0 }};
 	struct snd_sof_dev *sdev = context;
-	bool ack_received = false;
 	bool ipc_irq = false;
 	u32 hipcida;
 	u32 hipctdr;
@@ -576,7 +571,6 @@ static irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
 		mtl_ipc_dsp_done(sdev);
 
 		ipc_irq = true;
-		ack_received = true;
 	}
 
 	if (hipctdr & MTL_DSP_REG_HFIPCXTDR_BUSY) {
@@ -628,13 +622,6 @@ static irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
 		dev_dbg_ratelimited(sdev->dev, "nothing to do in IPC IRQ thread\n");
 	}
 
-	if (ack_received) {
-		struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
-
-		if (hdev->delayed_ipc_tx_msg)
-			mtl_ipc_send_msg(sdev, hdev->delayed_ipc_tx_msg);
-	}
-
 	return IRQ_HANDLED;
 }
 
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index a4a090e6724a..ad99e2e07b66 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -365,20 +365,36 @@ static int ipc4_wait_tx_done(struct snd_sof_ipc *ipc, void *reply_data)
 	return ret;
 }
 
+#define SOF_IPC4_TX_BUSY_RETRIES	50
+#define SOF_IPC4_TX_BUSY_DELAY_US	100
+#define SOF_IPC4_TX_BUSY_DELAY_MAX_US	200
+
 static int ipc4_tx_msg_unlocked(struct snd_sof_ipc *ipc,
 				void *msg_data, size_t msg_bytes,
 				void *reply_data, size_t reply_bytes)
 {
 	struct sof_ipc4_msg *ipc4_msg = msg_data;
 	struct snd_sof_dev *sdev = ipc->sdev;
-	int ret;
+	int ret, i;
 
 	if (msg_bytes > ipc->max_payload_size || reply_bytes > ipc->max_payload_size)
 		return -EINVAL;
 
 	sof_ipc4_log_header(sdev->dev, "ipc tx      ", msg_data, true);
 
-	ret = sof_ipc_send_msg(sdev, msg_data, msg_bytes, reply_bytes);
+	for (i = 0; i < SOF_IPC4_TX_BUSY_RETRIES; i++) {
+		ret = sof_ipc_send_msg(sdev, msg_data, msg_bytes, reply_bytes);
+		if (ret != -EBUSY)
+			break;
+		usleep_range(SOF_IPC4_TX_BUSY_DELAY_US,
+			     SOF_IPC4_TX_BUSY_DELAY_MAX_US);
+	}
+	if (i == SOF_IPC4_TX_BUSY_RETRIES) {
+		dev_dbg(sdev->dev, "ipc tx failed: TX busy after %d retries\n", i);
+	} else if (i > 0) {
+		dev_dbg(sdev->dev, "ipc tx delayed by %d loops for %#x|%#x\n",
+			i, ipc4_msg->primary, ipc4_msg->extension);
+	}
 	if (ret) {
 		dev_err_ratelimited(sdev->dev,
 				    "%s: ipc message send for %#x|%#x failed: %d\n",
-- 
2.52.0

