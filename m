Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRg3dXKy"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA962D48
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 04:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701260854; x=1732796854;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uOW2A0mYCKbBP9wV0mHLSuP9O/Xs5XHTPZ1vl+89yMU=;
  b=IRg3dXKyiOsjALILKSUT5H884bFwbVdsc0nsQ8Vfx2YmI/4EVFB91ROD
   in5pWK9w2pzxJQpwT3OysTAR+VntdK67IVtGR5kCjj31/7P6Iwtl//tZt
   IyyZmck1M3Dq6bbSzCFHomHUAlR7LLR+SHX5H9ie0ixYtn95oJPtv/F8a
   oV8vlt/MmkOZhf0U1KOA+ymteGv+D1m5LtJSel6soHNZ2jImdLgtRAhvp
   LzoSipYOBDH3vDz7RSYI3mDSIcLlEPjg4DP1z3nadAD+bZmgX9MVM3dih
   TasEr9xMmmK3+BU/j9IBaA/CAvSvUwREfNIoOSRqretLOdoBsxEU2EmBh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392020449"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392020449"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="17173566"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:27:29 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4: Move window offset configuration earlier
Date: Wed, 29 Nov 2023 14:28:05 +0200
Message-ID: <20231129122805.10635-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the added exception handling support if the firmware fails to boot
up we are trying to do a panic dump from the telemetry slot. The slot
offsets would have been configured only after receiving the FW_READY
message which makes this panic dump unusable for early boot failures.

With IPC4 the DSP window offsets are at standard places unlike IPC3 where
the offsets needs to be queried from the FW_READY message.

Move the offset configuration to sof_ipc4_init from the fw_ready handler.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4.c | 55 ++++++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 145d319e041f..ac5c6bc66d2a 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -576,40 +576,12 @@ EXPORT_SYMBOL(sof_ipc4_find_debug_slot_offset_by_type);
 
 static int ipc4_fw_ready(struct snd_sof_dev *sdev, struct sof_ipc4_msg *ipc4_msg)
 {
-	int inbox_offset, inbox_size, outbox_offset, outbox_size;
-
 	/* no need to re-check version/ABI for subsequent boots */
 	if (!sdev->first_boot)
 		return 0;
 
-	/* Set up the windows for IPC communication */
-	inbox_offset = snd_sof_dsp_get_mailbox_offset(sdev);
-	if (inbox_offset < 0) {
-		dev_err(sdev->dev, "%s: No mailbox offset\n", __func__);
-		return inbox_offset;
-	}
-	inbox_size = SOF_IPC4_MSG_MAX_SIZE;
-	outbox_offset = snd_sof_dsp_get_window_offset(sdev, SOF_IPC4_OUTBOX_WINDOW_IDX);
-	outbox_size = SOF_IPC4_MSG_MAX_SIZE;
-
-	sdev->fw_info_box.offset = snd_sof_dsp_get_window_offset(sdev, SOF_IPC4_INBOX_WINDOW_IDX);
-	sdev->fw_info_box.size = sizeof(struct sof_ipc4_fw_registers);
-	sdev->dsp_box.offset = inbox_offset;
-	sdev->dsp_box.size = inbox_size;
-	sdev->host_box.offset = outbox_offset;
-	sdev->host_box.size = outbox_size;
-
-	sdev->debug_box.offset = snd_sof_dsp_get_window_offset(sdev,
-							SOF_IPC4_DEBUG_WINDOW_IDX);
-
 	sof_ipc4_create_exception_debugfs_node(sdev);
 
-	dev_dbg(sdev->dev, "mailbox upstream 0x%x - size 0x%x\n",
-		inbox_offset, inbox_size);
-	dev_dbg(sdev->dev, "mailbox downstream 0x%x - size 0x%x\n",
-		outbox_offset, outbox_size);
-	dev_dbg(sdev->dev, "debug box 0x%x\n", sdev->debug_box.offset);
-
 	return sof_ipc4_init_msg_memory(sdev);
 }
 
@@ -796,11 +768,38 @@ static const struct sof_ipc_pm_ops ipc4_pm_ops = {
 static int sof_ipc4_init(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	int inbox_offset;
 
 	mutex_init(&ipc4_data->pipeline_state_mutex);
 
 	xa_init_flags(&ipc4_data->fw_lib_xa, XA_FLAGS_ALLOC);
 
+	/* Set up the windows for IPC communication */
+	inbox_offset = snd_sof_dsp_get_mailbox_offset(sdev);
+	if (inbox_offset < 0) {
+		dev_err(sdev->dev, "%s: No mailbox offset\n", __func__);
+		return inbox_offset;
+	}
+
+	sdev->dsp_box.offset = inbox_offset;
+	sdev->dsp_box.size = SOF_IPC4_MSG_MAX_SIZE;
+	sdev->host_box.offset = snd_sof_dsp_get_window_offset(sdev,
+							SOF_IPC4_OUTBOX_WINDOW_IDX);
+	sdev->host_box.size = SOF_IPC4_MSG_MAX_SIZE;
+
+	sdev->debug_box.offset = snd_sof_dsp_get_window_offset(sdev,
+							SOF_IPC4_DEBUG_WINDOW_IDX);
+
+	sdev->fw_info_box.offset = snd_sof_dsp_get_window_offset(sdev,
+							SOF_IPC4_INBOX_WINDOW_IDX);
+	sdev->fw_info_box.size = sizeof(struct sof_ipc4_fw_registers);
+
+	dev_dbg(sdev->dev, "mailbox upstream %#x - size %#x\n",
+		sdev->dsp_box.offset, SOF_IPC4_MSG_MAX_SIZE);
+	dev_dbg(sdev->dev, "mailbox downstream %#x - size %#x\n",
+		sdev->host_box.offset, SOF_IPC4_MSG_MAX_SIZE);
+	dev_dbg(sdev->dev, "debug box %#x\n", sdev->debug_box.offset);
+
 	return 0;
 }
 
-- 
2.43.0

