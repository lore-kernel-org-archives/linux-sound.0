Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9938F277003
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 09:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756459799; cv=none; b=NRjkdfgQcqiMeF9mT2AbpqY0pOeRWtoEhGXlX1Rg8LK9l3nAmFFge4XyvaFUBvxDzmXO76EIf9xRDlZVujeMXjMMLZBoDik63YRk2+5FQ6RDIyn725H/l7uN7fNLy+jlkx47AvXJSMOfrFUwpi4WoIofebA7LRnk1Td4bQmuSpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756459799; c=relaxed/simple;
	bh=nqueYbH5X8MxpOTjNWmSaxkx9DF16ui5l8AZpoNV53U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T11nnyKVqTQJdE0W7bH2F2xX/6aywAYnwIZwhDxlPb6MHkLuenav2EQKTz9gF374/o9DnL5q0l66twR8L488bFTHMTS4IKNV8Hp+nH40zV0OhIBRZyQ+8wowiRYFx/FAEFYgae5ZoAEi+41zYFVHpcE/WOzCv4r5ca9YUexzCco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9NO16ip; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9NO16ip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756459797; x=1787995797;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nqueYbH5X8MxpOTjNWmSaxkx9DF16ui5l8AZpoNV53U=;
  b=B9NO16ipg1mVJYHlvUFzQHxYAisJJALCdDfX6ivNZ02Z3csL33CQWoM2
   q/XYQd+e9rjJDUm8wKBHGqu/6/ULW8nNYGUYMiXL7jYbRQTiEdCIo0Fyt
   2WP385nUGq3bQv9e6YuF5PnRryj0TgX9TvznnhB2luDvhhO/mYDKs65C9
   wiA/h6c9y435xtftnsIVshl4n/fzosRwRv9zePLlOS6noJ64XujIM5HdL
   Uv14lAxHGOycv7EHKwgyUK/nH+ssrEQzR2Dv27tvW9/cc0vjzBuzRKhYm
   dR70s7GhUnGDcOwOfOOkelgomfkbnEBAy97PQFripS6/HPwzygfKxZ+kZ
   w==;
X-CSE-ConnectionGUID: uBdFV57ZRyi2EHHuz6Tcjg==
X-CSE-MsgGUID: VdrEl02FTAmOcr/cdlpvQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84147908"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="84147908"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 02:29:57 -0700
X-CSE-ConnectionGUID: Ili/LmYdT2q/i73Xkd+k6A==
X-CSE-MsgGUID: fT4LyB2LQYq7M1Kdo6qdWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170245433"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.56])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 02:29:54 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	jyri.sarha@linux.intel.com
Subject: [PATCH 5/5] ASoC: SOF: sof-client-probes: Add available points_info(), IPC4 only
Date: Fri, 29 Aug 2025 12:30:22 +0300
Message-ID: <20250829093022.32094-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829093022.32094-1-peter.ujfalusi@linux.intel.com>
References: <20250829093022.32094-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jyri Sarha <jyri.sarha@linux.intel.com>

Add another debugfs file, "probe_points_available", that shows all the
available probe points in the SOF FW at the time of query. The probe
points are there only when an active SOF stream exists in the
system. However, the stream identifiers are persistent in the sense
that the same probe point identifiers always appear with the same
playback or capture command in the same system configuration.

The output, when reading "probe_points_available", may look like this:

0x1000005,0x0,0x100     host-copier.0.playback output buf idx 0 (connected)
0x7,0x0,0x100   gain.1.1 input buf idx 0 (connected)
0x1000007,0x0,0x0       gain.1.1 output buf idx 0
0x3,0x0,0x0     mixin.1.1 input buf idx 0
0x1000003,0x0,0x0       mixin.1.1 output buf idx 0
0x4,0x0,0x0     mixout.2.1 input buf idx 0
0x1000004,0x0,0x0       mixout.2.1 output buf idx 0
0x10007,0x0,0x0 gain.2.1 input buf idx 0
0x1010007,0x0,0x0       gain.2.1 output buf idx 0
0x11,0x0,0x0    smart_amp.2.1 input buf idx 0
0x1000011,0x0,0x0       smart_amp.2.1 output buf idx 0
0x10005,0x0,0x0 dai-copier.SSP.NoCodec-0.playback input buf idx 0

The triplet at the beginning of a line can be copy-pasted as such to
"probe_points" debugfs file for adding a probe point. The rest of the
line tries to give human readable explanation of what this probe point
is.

Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-client-probes-ipc3.c | 25 ++++++++++-----
 sound/soc/sof/sof-client-probes-ipc4.c | 28 ++++++++++++++---
 sound/soc/sof/sof-client-probes.c      | 42 ++++++++++++++++++++++----
 sound/soc/sof/sof-client-probes.h      |  7 ++++-
 4 files changed, 84 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sof/sof-client-probes-ipc3.c b/sound/soc/sof/sof-client-probes-ipc3.c
index 816df745c9af..a78ec0954a61 100644
--- a/sound/soc/sof/sof-client-probes-ipc3.c
+++ b/sound/soc/sof/sof-client-probes-ipc3.c
@@ -100,9 +100,11 @@ static int ipc3_probes_deinit(struct sof_client_dev *cdev)
 }
 
 static int ipc3_probes_info(struct sof_client_dev *cdev, unsigned int cmd,
-			    void **params, size_t *num_params)
+			    void **params, size_t *num_params,
+			    enum sof_probe_info_type type)
 {
 	size_t max_msg_size = sof_client_get_ipc_max_payload_size(cdev);
+	struct device *dev = &cdev->auxdev.dev;
 	struct sof_ipc_probe_info_params msg = {{{0}}};
 	struct sof_ipc_probe_info_params *reply;
 	size_t bytes;
@@ -111,6 +113,11 @@ static int ipc3_probes_info(struct sof_client_dev *cdev, unsigned int cmd,
 	*params = NULL;
 	*num_params = 0;
 
+	if (type != PROBES_INFO_ACTIVE_PROBES) {
+		dev_err(dev, "%s: info type %u not supported", __func__, type);
+		return -EOPNOTSUPP;
+	}
+
 	reply = kzalloc(max_msg_size, GFP_KERNEL);
 	if (!reply)
 		return -ENOMEM;
@@ -142,21 +149,25 @@ static int ipc3_probes_info(struct sof_client_dev *cdev, unsigned int cmd,
 }
 
 /**
- * ipc3_probes_points_info - retrieve list of active probe points
+ * ipc3_probes_points_info - retrieve list of probe points
  * @cdev:		SOF client device
  * @desc:	Returned list of active probes
  * @num_desc:	Returned count of active probes
+ * @type:	Either PROBES_INFO_ACTIVE_PROBES or PROBES_INFO_AVAILABE_PROBES
+ *
+ * If type is PROBES_INFO_ACTIVE_PROBES, host sends PROBE_POINT_INFO
+ * request to obtain list of active probe points, valid for
+ * disconnection when given probe is no longer required.
  *
- * Host sends PROBE_POINT_INFO request to obtain list of active probe
- * points, valid for disconnection when given probe is no longer
- * required.
+ * Type PROBES_INFO_AVAILABE_PROBES is not yet supported.
  */
 static int ipc3_probes_points_info(struct sof_client_dev *cdev,
 				   struct sof_probe_point_desc **desc,
-				   size_t *num_desc)
+				   size_t *num_desc,
+				   enum sof_probe_info_type type)
 {
 	return ipc3_probes_info(cdev, SOF_IPC_PROBE_POINT_INFO,
-			       (void **)desc, num_desc);
+				(void **)desc, num_desc, type);
 }
 
 /**
diff --git a/sound/soc/sof/sof-client-probes-ipc4.c b/sound/soc/sof/sof-client-probes-ipc4.c
index 0b974e6268bb..758a56d271d7 100644
--- a/sound/soc/sof/sof-client-probes-ipc4.c
+++ b/sound/soc/sof/sof-client-probes-ipc4.c
@@ -28,6 +28,7 @@ enum sof_ipc4_probe_runtime_param {
 	SOF_IPC4_PROBE_INJECTION_DMA_DETACH,
 	SOF_IPC4_PROBE_POINTS,
 	SOF_IPC4_PROBE_POINTS_DISCONNECT,
+	SOF_IPC4_PROBE_POINTS_AVAILABLE,
 };
 
 struct sof_ipc4_probe_gtw_cfg {
@@ -192,30 +193,49 @@ static int ipc4_probes_deinit(struct sof_client_dev *cdev)
 }
 
 /**
- * ipc4_probes_points_info - retrieve list of active probe points
+ * ipc4_probes_points_info - retrieve list of probe points
  * @cdev:	SOF client device
  * @desc:	Returned list of active probes
  * @num_desc:	Returned count of active probes
+ * @type:	Either PROBES_INFO_ACTIVE_PROBES or PROBES_INFO_AVAILABE_PROBES
  * @return:	0 on success, negative error code on error
+ *
+ * Returns list if active probe points if type is
+ * PROBES_INFO_ACTIVE_PROBES, or list of all available probe points if
+ * type is PROBES_INFO_AVAILABE_PROBES.
  */
 static int ipc4_probes_points_info(struct sof_client_dev *cdev,
 				   struct sof_probe_point_desc **desc,
-				   size_t *num_desc)
+				   size_t *num_desc,
+				   enum sof_probe_info_type type)
 {
 	struct sof_man4_module *mentry = sof_ipc4_probe_get_module_info(cdev);
 	struct device *dev = &cdev->auxdev.dev;
 	struct sof_ipc4_probe_info *info;
 	struct sof_ipc4_msg msg;
+	u32 param_id;
 	int i, ret;
 
 	if (!mentry)
 		return -ENODEV;
 
+	switch (type) {
+	case PROBES_INFO_ACTIVE_PROBES:
+		param_id = SOF_IPC4_PROBE_POINTS;
+		break;
+	case PROBES_INFO_AVAILABE_PROBES:
+		param_id = SOF_IPC4_PROBE_POINTS_AVAILABLE;
+		break;
+	default:
+		dev_err(dev, "%s: info type %u not supported", __func__, type);
+		return -EOPNOTSUPP;
+	}
+
 	msg.primary = mentry->id;
 	msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
 	msg.primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
 
-	msg.extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_PROBE_POINTS);
+	msg.extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(param_id);
 
 	msg.data_size = sof_client_get_ipc_max_payload_size(cdev);
 	msg.data_ptr = kzalloc(msg.data_size, GFP_KERNEL);
@@ -299,7 +319,7 @@ static int ipc4_probes_points_add(struct sof_client_dev *cdev,
 	int i, ret;
 
 	if (!mentry)
-		return -ENODEV;
+		return -EOPNOTSUPP;
 
 	/* The sof_probe_point_desc and sof_ipc4_probe_point structs
 	 * are of same size and even the integers are the same in the
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 242fa19a82ec..3ca8460774bb 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -75,7 +75,8 @@ static int sof_probes_compr_shutdown(struct snd_compr_stream *cstream,
 	int i, ret;
 
 	/* disconnect all probe points */
-	ret = ipc->points_info(cdev, &desc, &num_desc);
+	ret = ipc->points_info(cdev, &desc, &num_desc,
+			       PROBES_INFO_ACTIVE_PROBES);
 	if (ret < 0) {
 		dev_err(dai->dev, "Failed to get probe points: %d\n", ret);
 		goto exit;
@@ -195,7 +196,8 @@ static const struct snd_compress_ops sof_probes_compressed_ops = {
 };
 
 static ssize_t sof_probes_dfs_points_read(struct file *file, char __user *to,
-					  size_t count, loff_t *ppos)
+					  size_t count, loff_t *ppos,
+					  enum sof_probe_info_type type)
 {
 	struct sof_client_dev *cdev = file->private_data;
 	struct sof_probes_priv *priv = cdev->data;
@@ -222,7 +224,7 @@ static ssize_t sof_probes_dfs_points_read(struct file *file, char __user *to,
 		goto exit;
 	}
 
-	ret = ipc->points_info(cdev, &desc, &num_desc);
+	ret = ipc->points_info(cdev, &desc, &num_desc, type);
 	if (ret < 0)
 		goto pm_error;
 
@@ -257,6 +259,22 @@ static ssize_t sof_probes_dfs_points_read(struct file *file, char __user *to,
 	return ret;
 }
 
+static ssize_t sof_probes_dfs_active_points_read(struct file *file,
+						 char __user *to,
+						 size_t count, loff_t *ppos)
+{
+	return sof_probes_dfs_points_read(file, to, count, ppos,
+					  PROBES_INFO_ACTIVE_PROBES);
+}
+
+static ssize_t sof_probes_dfs_available_points_read(struct file *file,
+						    char __user *to,
+						    size_t count, loff_t *ppos)
+{
+	return sof_probes_dfs_points_read(file, to, count, ppos,
+					  PROBES_INFO_AVAILABE_PROBES);
+}
+
 static ssize_t
 sof_probes_dfs_points_write(struct file *file, const char __user *from,
 			    size_t count, loff_t *ppos)
@@ -306,15 +324,23 @@ sof_probes_dfs_points_write(struct file *file, const char __user *from,
 	return ret;
 }
 
-static const struct file_operations sof_probes_points_fops = {
+static const struct file_operations sof_probes_active_points_fops = {
 	.open = simple_open,
-	.read = sof_probes_dfs_points_read,
+	.read = sof_probes_dfs_active_points_read,
 	.write = sof_probes_dfs_points_write,
 	.llseek = default_llseek,
 
 	.owner = THIS_MODULE,
 };
 
+static const struct file_operations sof_probes_available_points_fops = {
+	.open = simple_open,
+	.read = sof_probes_dfs_available_points_read,
+	.llseek = default_llseek,
+
+	.owner = THIS_MODULE,
+};
+
 static ssize_t
 sof_probes_dfs_points_remove_write(struct file *file, const char __user *from,
 				   size_t count, loff_t *ppos)
@@ -459,13 +485,17 @@ static int sof_probes_client_probe(struct auxiliary_device *auxdev,
 
 	/* create read-write probes_points debugfs entry */
 	priv->dfs_points = debugfs_create_file("probe_points", 0644, dfsroot,
-					       cdev, &sof_probes_points_fops);
+					       cdev, &sof_probes_active_points_fops);
 
 	/* create read-write probe_points_remove debugfs entry */
 	priv->dfs_points_remove = debugfs_create_file("probe_points_remove", 0644,
 						      dfsroot, cdev,
 						      &sof_probes_points_remove_fops);
 
+	/* create read-write probes_points debugfs entry */
+	priv->dfs_points = debugfs_create_file("probe_points_available", 0644, dfsroot,
+					       cdev, &sof_probes_available_points_fops);
+
 	links = devm_kcalloc(dev, SOF_PROBES_NUM_DAI_LINKS, sizeof(*links), GFP_KERNEL);
 	cpus = devm_kcalloc(dev, SOF_PROBES_NUM_DAI_LINKS, sizeof(*cpus), GFP_KERNEL);
 	if (!links || !cpus) {
diff --git a/sound/soc/sof/sof-client-probes.h b/sound/soc/sof/sof-client-probes.h
index c445e435aa35..5fb95553ea53 100644
--- a/sound/soc/sof/sof-client-probes.h
+++ b/sound/soc/sof/sof-client-probes.h
@@ -34,13 +34,18 @@ struct sof_probe_point_desc {
 	unsigned int stream_tag;
 } __packed;
 
+enum sof_probe_info_type {
+	PROBES_INFO_ACTIVE_PROBES,
+	PROBES_INFO_AVAILABE_PROBES,
+};
+
 struct sof_probes_ipc_ops {
 	int (*init)(struct sof_client_dev *cdev, u32 stream_tag,
 		    size_t buffer_size);
 	int (*deinit)(struct sof_client_dev *cdev);
 	int (*points_info)(struct sof_client_dev *cdev,
 			   struct sof_probe_point_desc **desc,
-			   size_t *num_desc);
+			   size_t *num_desc, enum sof_probe_info_type type);
 	int (*point_print)(struct sof_client_dev *cdev, char *buf, size_t size,
 			   struct sof_probe_point_desc *desc);
 	int (*points_add)(struct sof_client_dev *cdev,
-- 
2.50.1

