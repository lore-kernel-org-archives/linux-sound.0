Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+TOSadV"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9660593
	for <linux-sound@vger.kernel.org>; Fri, 24 Nov 2023 07:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700838513; x=1732374513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q9WCbZVURpnqvd5xlh4EYvKFVSLfCjZ9vNYEc46ktjw=;
  b=n+TOSadVDucaq62TXcrmF3DaPpmoVPhEAvLI1BmSVv2pNNj2c83kTUj+
   YpxpNNc14uWhk6nfBIWoX0zfdPPQukD6ygTdbK93w8KsHNFUv8oyhlB9w
   WCQHQaDAZF9e8uJ1DT/eMsHMogPTC1nITOidBpqlNOpOwskyEpn8ZAwd/
   +QQuq4ywc9t1AuwTBd+7I0g4O2dEeArowB7j3/BmcCkFgxCEpFlNUEX3U
   FWCJFIRG9CEXbKAVzcYepEVUqQmhfOke+muFc+HwWjzoMfu8hu1YL2wTu
   5onaIRE/mSTQbONx2x2HyguANwKCQmhJi1TBR50U14mPI6ohRBaPK+98l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="377477074"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="377477074"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:08:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="743915686"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="743915686"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.182])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:08:30 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 4/4] ASoC: SOF: ipc4: Handle ALSA kcontrol change notification from firmware
Date: Fri, 24 Nov 2023 17:08:53 +0200
Message-ID: <20231124150853.18648-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231124150853.18648-1-peter.ujfalusi@linux.intel.com>
References: <20231124150853.18648-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The control change notification is sent as module notification with a
standardized event_id (higher 16 bit is 0xA15A).
Add generic code to handle the module notification and invoke the control
update callback if the notification is an ALSA kcontrol change message.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4.c | 57 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 8441f4ae4065..a9d9800d2fcc 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -78,6 +78,9 @@ static const struct sof_ipc4_fw_status {
 	{165, "Reserved (ADSP_IPC_PIPELINE_ALREADY_EXISTS removed)"},
 };
 
+typedef void (*ipc4_notification_handler)(struct snd_sof_dev *sdev,
+					  struct sof_ipc4_msg *msg);
+
 static int sof_ipc4_check_reply_status(struct snd_sof_dev *sdev, u32 status)
 {
 	int i, ret;
@@ -610,9 +613,55 @@ static int ipc4_fw_ready(struct snd_sof_dev *sdev, struct sof_ipc4_msg *ipc4_msg
 	return sof_ipc4_init_msg_memory(sdev);
 }
 
+static void sof_ipc4_module_notification_handler(struct snd_sof_dev *sdev,
+						 struct sof_ipc4_msg *ipc4_msg)
+{
+	struct sof_ipc4_notify_module_data *data = ipc4_msg->data_ptr;
+
+	/*
+	 * If the notification includes additional, module specific data, then
+	 * we need to re-allocate the buffer and re-read the whole payload,
+	 * including the event_data
+	 */
+	if (data->event_data_size) {
+		void *new;
+		int ret;
+
+		ipc4_msg->data_size += data->event_data_size;
+
+		new = krealloc(ipc4_msg->data_ptr, ipc4_msg->data_size, GFP_KERNEL);
+		if (!new) {
+			ipc4_msg->data_size -= data->event_data_size;
+			return;
+		}
+
+		/* re-read the whole payload */
+		ipc4_msg->data_ptr = new;
+		ret = snd_sof_ipc_msg_data(sdev, NULL, ipc4_msg->data_ptr,
+					   ipc4_msg->data_size);
+		if (ret < 0) {
+			dev_err(sdev->dev,
+				"Failed to read the full module notification: %d\n",
+				ret);
+			return;
+		}
+		data = ipc4_msg->data_ptr;
+	}
+
+	/* Handle ALSA kcontrol notification */
+	if ((data->event_id & SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_MASK) ==
+	    SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_VAL) {
+		const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+
+		if (tplg_ops->control->update)
+			tplg_ops->control->update(sdev, ipc4_msg);
+	}
+}
+
 static void sof_ipc4_rx_msg(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc4_msg *ipc4_msg = sdev->ipc->msg.rx_data;
+	ipc4_notification_handler handler_func = NULL;
 	size_t data_size = 0;
 	int err;
 
@@ -648,6 +697,10 @@ static void sof_ipc4_rx_msg(struct snd_sof_dev *sdev)
 	case SOF_IPC4_NOTIFY_EXCEPTION_CAUGHT:
 		snd_sof_dsp_panic(sdev, 0, true);
 		break;
+	case SOF_IPC4_NOTIFY_MODULE_NOTIFICATION:
+		data_size = sizeof(struct sof_ipc4_notify_module_data);
+		handler_func = sof_ipc4_module_notification_handler;
+		break;
 	default:
 		dev_dbg(sdev->dev, "Unhandled DSP message: %#x|%#x\n",
 			ipc4_msg->primary, ipc4_msg->extension);
@@ -663,6 +716,10 @@ static void sof_ipc4_rx_msg(struct snd_sof_dev *sdev)
 		snd_sof_ipc_msg_data(sdev, NULL, ipc4_msg->data_ptr, ipc4_msg->data_size);
 	}
 
+	/* Handle notifications with payload */
+	if (handler_func)
+		handler_func(sdev, ipc4_msg);
+
 	sof_ipc4_log_header(sdev->dev, "ipc rx done ", ipc4_msg, true);
 
 	if (data_size) {
-- 
2.42.1

