Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B94331F990
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 08:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785399853; cv=none; b=Ba3hd06G1Pe9OP8uslb6QzL4AlRXwiLpGZeXsYfbdDWMDnQ58nQtf1qq1gg+98DvFZ5zakAHQtmY7LCBlB0/912H6YTuS5fGLxSf8DhQObwSHaZbzNXM+N8oRc3CQUfRGyFsqCVQU4ECP7+eltQsCM8xkpTadx4eaLYJfNcn6Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785399853; c=relaxed/simple;
	bh=IHYQO51LwFoa9lQfWKPJtNpC+gKHyvbB/N//PS7grwA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KUzsBwYUIGlRSnF/M9+tae462QwjFf96KjW0fLxLxvwTrKVtXeBIx6UYigrSUsnzHkN4jy4pm7CrJdqga0knJfqsO+zcIzUCM0Bxwx/yTeeZVhAZc03Xs7oTfYI7DjR3mb6xwHIUjCMtTLtKjaxHbTuEFZER7uNmlKk5pDhkEvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExGG78cR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExGG78cR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785399851; x=1816935851;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IHYQO51LwFoa9lQfWKPJtNpC+gKHyvbB/N//PS7grwA=;
  b=ExGG78cRycqy82sLNWOxuhyV80aWAMTWmFONYe+eZ7bAU3rFj08JopTt
   g9YqHXNmh/eeM3LUsHzPNUJP5ycKEzX0V1g9S4t4P1mLWf96d+kYDlEX7
   ibUMTeHRaYrYx+uRG/UH0IUlEALpt9iAcJybjlbppetvQyg2mWek7N4Mu
   TCdghZMYLFYDGRSdvb6700z53KJennGvFgDdcCbxhWX63fRApPU+etB+I
   0MdXGs+vE0rxLhNVdRxXQYjO97/Oze5nXSAtwRAmoSoXPKc7p7Iu7jfF0
   GSuxhE5N3C75Ff313MJVMsWjYY+S8idNDVlexdTFAF8UoWahzAFHgtx6B
   w==;
X-CSE-ConnectionGUID: HCFP7pKATFqIhfarUiNbiQ==
X-CSE-MsgGUID: 2ZW2xX8oQB2gYedntKK4UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108806553"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="108806553"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 01:24:10 -0700
X-CSE-ConnectionGUID: vI0t/QPWTiWVCVne8Y657Q==
X-CSE-MsgGUID: 7aSZyUUlTlSqrXRFKNNFtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="262190763"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 01:24:07 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH] ASoC: SOF: ipc4: Add decoder for RESOURCE_EVENT notifications from firmware
Date: Thu, 30 Jul 2026 11:24:44 +0300
Message-ID: <20260730082444.4828-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Decode and print out the content of currently supported RESOURCE_EVENT
notifications from firmware along with the needed data structures and
definitions.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 include/sound/sof/ipc4/header.h | 53 ++++++++++++++++++++-
 sound/soc/sof/ipc4.c            | 84 +++++++++++++++++++++++++++++++++
 2 files changed, 136 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index 4554e5e8cab5..e747741f35c0 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -536,12 +536,63 @@ enum sof_ipc4_notification_type {
 	SOF_IPC4_NOTIFY_TYPE_LAST,
 };
 
+enum sof_ipc4_resource_type {
+	SOF_IPC4_MODULE_INSTANCE,
+	SOF_IPC4_PIPELINE,
+	SOF_IPC4_GATEWAY,
+	SOF_IPC4_EDF_TASK,
+	SOF_IPC4_INVALID_RESOURCE_TYPE,
+};
+
+enum sof_ipc4_event_type {
+	/* Underrun detected by the Mixer */
+	SOF_IPC4_MIXER_UNDERRUN_DETECTED = 1,
+	/* Error caught during data processing */
+	SOF_IPC4_PROCESS_DATA_ERROR = 3,
+	/* Underrun detected by gateway. */
+	SOF_IPC4_GATEWAY_UNDERRUN_DETECTED = 6,
+	/* Overrun detected by gateway */
+	SOF_IPC4_GATEWAY_OVERRUN_DETECTED,
+};
+
+/**
+ * struct sof_ipc4_process_data_error_event_data - process data error event payload
+ * @error_code: Error code returned by data processing function
+ */
+struct sof_ipc4_process_data_error_event_data {
+	uint32_t error_code;
+};
+
+/**
+ * struct sof_ipc4_mixer_underrun_event_data - mixer underrun event payload
+ * @eos_flag: Indicates EndOfStream
+ * @data_mixed: Data processed by module (in bytes)
+ * @expected_data_mixed: Expected data to be processed (in bytes)
+ */
+struct sof_ipc4_mixer_underrun_event_data {
+	uint32_t eos_flag;
+	uint32_t data_mixed;
+	uint32_t expected_data_mixed;
+};
+
+/**
+ * union sof_ipc4_resource_event_data - resource event specific payload
+ * @dws: Raw event data payload as six dwords
+ * @process_data_error: SOF_IPC4_PROCESS_DATA_ERROR payload
+ * @mixer_underrun: SOF_IPC4_MIXER_UNDERRUN_DETECTED payload
+ */
+union sof_ipc4_resource_event_data {
+	uint32_t dws[6];
+	struct sof_ipc4_process_data_error_event_data process_data_error;
+	struct sof_ipc4_mixer_underrun_event_data mixer_underrun;
+};
+
 struct sof_ipc4_notify_resource_data {
 	uint32_t resource_type;
 	uint32_t resource_id;
 	uint32_t event_type;
 	uint32_t reserved;
-	uint32_t data[6];
+	union sof_ipc4_resource_event_data data;
 } __packed __aligned(4);
 
 #define SOF_IPC4_DEBUG_DESCRIPTOR_SIZE		12 /* 3 x u32 */
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index c9c6c0c52c62..e77f73390bd8 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -289,6 +289,89 @@ static void sof_ipc4_dump_payload(struct snd_sof_dev *sdev,
 			     16, 4, ipc_data, size, false);
 }
 
+static const char *sof_ipc4_resource_type_str(u32 type)
+{
+	switch (type) {
+	case SOF_IPC4_MODULE_INSTANCE:
+		return "resource: MODULE_INSTANCE";
+	case SOF_IPC4_PIPELINE:
+		return "resource: PIPELINE";
+	case SOF_IPC4_GATEWAY:
+		return "resource: GATEWAY";
+	case SOF_IPC4_EDF_TASK:
+		return "resource: EDF_TASK";
+	case SOF_IPC4_INVALID_RESOURCE_TYPE:
+		return "Resource is invalid";
+	default:
+		return "Unknown resource type";
+	}
+}
+
+static const char *sof_ipc4_resource_event_type_str(u32 event_type)
+{
+	switch (event_type) {
+	case SOF_IPC4_MIXER_UNDERRUN_DETECTED:
+		return "event:    MIXER_UNDERRUN_DETECTED";
+	case SOF_IPC4_PROCESS_DATA_ERROR:
+		return "event:    PROCESS_DATA_ERROR";
+	case SOF_IPC4_GATEWAY_UNDERRUN_DETECTED:
+		return "event:    GATEWAY_UNDERRUN_DETECTED";
+	case SOF_IPC4_GATEWAY_OVERRUN_DETECTED:
+		return "event:    GATEWAY_OVERRUN_DETECTED";
+	default:
+		return "Unknown event type";
+	}
+}
+
+static void sof_ipc4_resource_event_handler(struct snd_sof_dev *sdev,
+					    struct sof_ipc4_msg *ipc4_msg)
+{
+	struct sof_ipc4_notify_resource_data *data = ipc4_msg->data_ptr;
+
+	/* Print event details */
+	switch (data->event_type) {
+	case SOF_IPC4_MIXER_UNDERRUN_DETECTED:
+		dev_dbg(sdev->dev, "%s (%u): eos %u, mixed %u, expected %u\n",
+			sof_ipc4_resource_event_type_str(data->event_type),
+			data->event_type, data->data.mixer_underrun.eos_flag,
+			data->data.mixer_underrun.data_mixed,
+			data->data.mixer_underrun.expected_data_mixed);
+		break;
+	case SOF_IPC4_PROCESS_DATA_ERROR:
+		dev_dbg(sdev->dev, "%s (%u): error_code %#x\n",
+			sof_ipc4_resource_event_type_str(data->event_type),
+			data->event_type, data->data.process_data_error.error_code);
+		break;
+	case SOF_IPC4_GATEWAY_UNDERRUN_DETECTED:
+	case SOF_IPC4_GATEWAY_OVERRUN_DETECTED:
+		dev_dbg(sdev->dev, "%s (%u)\n",
+			sof_ipc4_resource_event_type_str(data->event_type),
+			data->event_type);
+		break;
+	default:
+		dev_dbg(sdev->dev, "%s (%u): raw dws %#x %#x %#x %#x %#x %#x\n",
+			sof_ipc4_resource_event_type_str(data->event_type),
+			data->event_type,
+			data->data.dws[0], data->data.dws[1], data->data.dws[2],
+			data->data.dws[3], data->data.dws[4], data->data.dws[5]);
+		break;
+	}
+
+	/* Print resource details */
+	if (data->resource_type == SOF_IPC4_MODULE_INSTANCE) {
+		u32 module_id = SOF_IPC4_MOD_ID_GET(data->resource_id);
+		u32 instance_id = SOF_IPC4_MOD_INSTANCE_GET(data->resource_id);
+
+		dev_dbg(sdev->dev, "%s (%u), module_id %u, instance_id %u\n",
+			sof_ipc4_resource_type_str(data->resource_type),
+			data->resource_type, module_id, instance_id);
+	} else if (data->resource_type != SOF_IPC4_INVALID_RESOURCE_TYPE) {
+		dev_dbg(sdev->dev, "%s (%u), id %u\n",
+			sof_ipc4_resource_type_str(data->resource_type),
+			data->resource_type, data->resource_id);
+	}
+}
+
 static int sof_ipc4_get_reply(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_ipc_msg *msg = sdev->msg;
@@ -734,6 +817,7 @@ static void sof_ipc4_rx_msg(struct snd_sof_dev *sdev)
 		break;
 	case SOF_IPC4_NOTIFY_RESOURCE_EVENT:
 		data_size = sizeof(struct sof_ipc4_notify_resource_data);
+		handler_func = sof_ipc4_resource_event_handler;
 		break;
 	case SOF_IPC4_NOTIFY_LOG_BUFFER_STATUS:
 		sof_ipc4_mtrace_update_pos(sdev, SOF_IPC4_LOG_CORE_GET(ipc4_msg->primary));
-- 
2.55.0

