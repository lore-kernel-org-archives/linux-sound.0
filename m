Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHYb2Chu"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58EFE199B
	for <linux-sound@vger.kernel.org>; Fri, 24 Nov 2023 07:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700838508; x=1732374508;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HE+HVflr/dMP7+v5zO2JHf1ebjW2yG0wUiLxBbEGi5M=;
  b=ZHYb2ChuRirsTHfYLhHG/0RTj+yTFccBqcBqgf08mrCzUobZbRMRhcIn
   yT0ZZ5StaX72yhZTPTtUCKjlF6uktbnSlrAWAjTR9yplzowN8mPz4ZDRm
   hybx7XyPkctTjw/urEO+/JR4jKjOeQdfCyjtLEwywZ8HtYz8VzfjesCqR
   vszwdq4PHyQ3aTQ6sR6MfCNQSLrGqbL4exga/nFS1h20vkMSG/NX9bw7r
   UxOLiY0RoYjWJwHcJCdyL9VgdPZJNNzN3+A54TL6PLVvTcjKQgv9N6fhC
   gRACWOOanaW45PvvjNf/fb3hzGDT1YU7i4qHbphQMYQq5WkHiO/pdLpj9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="377477055"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="377477055"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:08:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="743915678"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="743915678"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.182])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:08:25 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 2/4] ASoC: SOF: ipc4: Add data struct for module notification message from firmware
Date: Fri, 24 Nov 2023 17:08:51 +0200
Message-ID: <20231124150853.18648-3-peter.ujfalusi@linux.intel.com>
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

With the module notification message the information about the notification
is provided via the mailbox with the sof_ipc4_notify_module_data struct.

It contains the module and instance id of the sender of the notification,
the event_id and optionally additional data which is module and event
specific.

At the same time add definitions to identify ALSA kcontrol change
notification.
These notifications use standardized event_id, modules must follow this if
they support such notifications:
upper 16 bit: 0xA15A as a magic identification value
lower 16 bit: param_id of the changed control

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/ipc4/header.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index 574a9d581f88..2c81d6dde577 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -532,6 +532,35 @@ struct sof_ipc4_notify_resource_data {
 #define SOF_IPC4_DEBUG_SLOT_TELEMETRY		0x4c455400
 #define SOF_IPC4_DEBUG_SLOT_BROKEN		0x44414544
 
+/**
+ * struct sof_ipc4_notify_module_data - payload for module notification
+ * @instance_id: instance ID of the originator module of the notification
+ * @module_id: module ID of the originator of the notification
+ * @event_id: module specific event id
+ * @event_data_size: Size of the @event_data (if any) in bytes
+ * @event_data: Optional notification data, module and notification dependent
+ */
+struct sof_ipc4_notify_module_data {
+	uint16_t instance_id;
+	uint16_t module_id;
+	uint32_t event_id;
+	uint32_t event_data_size;
+	uint8_t event_data[];
+} __packed __aligned(4);
+
+/*
+ * ALSA kcontrol change notification
+ *
+ * The event_id of struct sof_ipc4_notify_module_data is divided into two u16:
+ *  upper u16: magic number for ALSA kcontrol types: 0xA15A
+ *  lower u16: param_id of the control, which is the type of the control
+ * The event_data contains the struct sof_ipc4_control_msg_payload of the control
+ * which sent the notification.
+ */
+#define SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_MASK		GENMASK(31, 16)
+#define SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_VAL		0xA15A0000
+#define SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_PARAMID_MASK	GENMASK(15, 0)
+
 /** @}*/
 
 #endif
-- 
2.42.1

