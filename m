Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134851DF256
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 10:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463078; cv=none; b=lip3SnmGlV4uY5KsYpZP7qdjzY1NN8BE/HHSJDikxLibdzFhLxC0d7NqKhqEaSt0aUZJhqJXhyadc2W/bEeFRWofMd1ixnA9ct0JxHtR2I7vf6STUBuPOurHrmvWqudWstyjVa31CxwJZTvND7V23sQuQozNfxnZH0s+3q9aRK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463078; c=relaxed/simple;
	bh=Y6kr1AGMbviplE7Jks51RhXkdN06B3nlDSrtTQJE2do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ERLd8yTDh+QN3R4FV1njFLQvGtnOStAsX8dxYTP/i4bNpxKzUCH4S83LW692ZjnPJ9eouAUzKhMG9Qry3woJ3he9+kvMnnG/jRCS/g18Z3TOTleKI6kiRJPuRemXevklsHsnLFxSWFgdJvYKgVaNeNF/HZQnPqzIbUlVvLw7MQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTK/ymk+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTK/ymk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756463077; x=1787999077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y6kr1AGMbviplE7Jks51RhXkdN06B3nlDSrtTQJE2do=;
  b=VTK/ymk+aXow6A3UasDwbF7pCGVJpNqUEnySNYrxhISw+7H0EKiByMhP
   4zFcUUtZQmwduz9hGZtMhKU3Xfp0b485lMvyhrLf9sKvZDufbc6g4CRhf
   uZLF5bj3kS4DVJ+UMj5PXWgDLGypNIwUmYA/mAuaTwBT4H0pnG8J8EzRe
   iR+DuSpbwk5Ds5bgg8gvTH086C2/tEi96lqkLnVT9dufTB6s2h6RmvRaH
   VN5Lk3SXZ7zs/5Z39Yqu+crcE7gOrOEsU+b+PkGwdKmbcE7KRXOPbt0xx
   FRGDExdfNRqTU7Vm8d6otf3oJBWTkd8BO3C5EsSzTL4quVKwyKMN3PzYw
   w==;
X-CSE-ConnectionGUID: l77YASp4QzurSbuVSxj9Tw==
X-CSE-MsgGUID: 40RACwSWTiucUYP2YBCfnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="76342712"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="76342712"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 03:24:37 -0700
X-CSE-ConnectionGUID: kh6lOAf0QayX1sYxbxDHtw==
X-CSE-MsgGUID: 9jOMWUKXTAC4puo04C3hlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="194001730"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.56])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 03:24:34 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	jyri.sarha@linux.intel.com
Subject: [PATCH 2/2] ASoC: SOF: sof-client: Introduce sof_client_dev_entry structure
Date: Fri, 29 Aug 2025 13:25:10 +0300
Message-ID: <20250829102510.15159-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829102510.15159-1-peter.ujfalusi@linux.intel.com>
References: <20250829102510.15159-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new internal structure for wrapping the sof_client_dev and
move members away from the client visible struct that they must not
access, let alone see (sdev and the list).

The changes are mechanical in nature and contained within sof-client core
code, no functional change or change in behavior is introduced.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-client.c | 101 +++++++++++++++++++++++++------------
 sound/soc/sof/sof-client.h |   4 --
 2 files changed, 69 insertions(+), 36 deletions(-)

diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
index 2db12753f79e..12be97540e4c 100644
--- a/sound/soc/sof/sof-client.c
+++ b/sound/soc/sof/sof-client.c
@@ -45,13 +45,30 @@ struct sof_state_event_entry {
 	struct list_head list;
 };
 
+/**
+ * struct sof_client_dev_entry - client device entry for internal management use
+ * @sdev:	pointer to SOF core device struct
+ * @list:	item in SOF core client dev list
+ * @client_dev: SOF client device
+ */
+struct sof_client_dev_entry {
+	struct snd_sof_dev *sdev;
+	struct list_head list;
+
+	struct sof_client_dev client_dev;
+};
+
+#define cdev_to_centry(cdev) \
+	container_of(cdev, struct sof_client_dev_entry, client_dev)
+
 static void sof_client_auxdev_release(struct device *dev)
 {
 	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
 	struct sof_client_dev *cdev = auxiliary_dev_to_sof_client_dev(auxdev);
+	struct sof_client_dev_entry *centry = cdev_to_centry(cdev);
 
 	kfree(cdev->auxdev.dev.platform_data);
-	kfree(cdev);
+	kfree(centry);
 }
 
 static int sof_client_dev_add_data(struct sof_client_dev *cdev, const void *data,
@@ -208,15 +225,18 @@ void sof_unregister_clients(struct snd_sof_dev *sdev)
 int sof_client_dev_register(struct snd_sof_dev *sdev, const char *name, u32 id,
 			    const void *data, size_t size)
 {
+	struct sof_client_dev_entry *centry;
 	struct auxiliary_device *auxdev;
 	struct sof_client_dev *cdev;
 	int ret;
 
-	cdev = kzalloc(sizeof(*cdev), GFP_KERNEL);
-	if (!cdev)
+	centry = kzalloc(sizeof(*centry), GFP_KERNEL);
+	if (!centry)
 		return -ENOMEM;
 
-	cdev->sdev = sdev;
+	cdev = &centry->client_dev;
+
+	centry->sdev = sdev;
 	auxdev = &cdev->auxdev;
 	auxdev->name = name;
 	auxdev->dev.parent = sdev->dev;
@@ -246,7 +266,7 @@ int sof_client_dev_register(struct snd_sof_dev *sdev, const char *name, u32 id,
 
 	/* add to list of SOF client devices */
 	mutex_lock(&sdev->ipc_client_mutex);
-	list_add(&cdev->list, &sdev->ipc_client_list);
+	list_add(&centry->list, &sdev->ipc_client_list);
 	mutex_unlock(&sdev->ipc_client_mutex);
 
 	return 0;
@@ -255,7 +275,7 @@ int sof_client_dev_register(struct snd_sof_dev *sdev, const char *name, u32 id,
 	kfree(cdev->auxdev.dev.platform_data);
 
 err_dev_add_data:
-	kfree(cdev);
+	kfree(centry);
 
 	return ret;
 }
@@ -263,7 +283,7 @@ EXPORT_SYMBOL_NS_GPL(sof_client_dev_register, "SND_SOC_SOF_CLIENT");
 
 void sof_client_dev_unregister(struct snd_sof_dev *sdev, const char *name, u32 id)
 {
-	struct sof_client_dev *cdev;
+	struct sof_client_dev_entry *centry;
 
 	mutex_lock(&sdev->ipc_client_mutex);
 
@@ -271,9 +291,11 @@ void sof_client_dev_unregister(struct snd_sof_dev *sdev, const char *name, u32 i
 	 * sof_client_auxdev_release() will be invoked to free up memory
 	 * allocations through put_device()
 	 */
-	list_for_each_entry(cdev, &sdev->ipc_client_list, list) {
+	list_for_each_entry(centry, &sdev->ipc_client_list, list) {
+		struct sof_client_dev *cdev = &centry->client_dev;
+
 		if (!strcmp(cdev->auxdev.name, name) && cdev->auxdev.id == id) {
-			list_del(&cdev->list);
+			list_del(&centry->list);
 			auxiliary_device_delete(&cdev->auxdev);
 			auxiliary_device_uninit(&cdev->auxdev);
 			break;
@@ -287,15 +309,17 @@ EXPORT_SYMBOL_NS_GPL(sof_client_dev_unregister, "SND_SOC_SOF_CLIENT");
 int sof_client_ipc_tx_message(struct sof_client_dev *cdev, void *ipc_msg,
 			      void *reply_data, size_t reply_bytes)
 {
-	if (cdev->sdev->pdata->ipc_type == SOF_IPC_TYPE_3) {
+	struct snd_sof_dev *sdev = sof_client_dev_to_sof_dev(cdev);
+
+	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_3) {
 		struct sof_ipc_cmd_hdr *hdr = ipc_msg;
 
-		return sof_ipc_tx_message(cdev->sdev->ipc, ipc_msg, hdr->size,
+		return sof_ipc_tx_message(sdev->ipc, ipc_msg, hdr->size,
 					  reply_data, reply_bytes);
-	} else if (cdev->sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
+	} else if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
 		struct sof_ipc4_msg *msg = ipc_msg;
 
-		return sof_ipc_tx_message(cdev->sdev->ipc, ipc_msg, msg->data_size,
+		return sof_ipc_tx_message(sdev->ipc, ipc_msg, msg->data_size,
 					  reply_data, reply_bytes);
 	}
 
@@ -305,16 +329,18 @@ EXPORT_SYMBOL_NS_GPL(sof_client_ipc_tx_message, "SND_SOC_SOF_CLIENT");
 
 int sof_client_ipc_rx_message(struct sof_client_dev *cdev, void *ipc_msg, void *msg_buf)
 {
+	struct snd_sof_dev *sdev = sof_client_dev_to_sof_dev(cdev);
+
 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_IPC3) &&
-	    cdev->sdev->pdata->ipc_type == SOF_IPC_TYPE_3) {
+	    sdev->pdata->ipc_type == SOF_IPC_TYPE_3) {
 		struct sof_ipc_cmd_hdr *hdr = ipc_msg;
 
 		if (hdr->size < sizeof(hdr)) {
-			dev_err(cdev->sdev->dev, "The received message size is invalid\n");
+			dev_err(sdev->dev, "The received message size is invalid\n");
 			return -EINVAL;
 		}
 
-		sof_ipc3_do_rx_work(cdev->sdev, ipc_msg, msg_buf);
+		sof_ipc3_do_rx_work(sdev, ipc_msg, msg_buf);
 		return 0;
 	}
 
@@ -325,16 +351,17 @@ EXPORT_SYMBOL_NS_GPL(sof_client_ipc_rx_message, "SND_SOC_SOF_CLIENT");
 int sof_client_ipc_set_get_data(struct sof_client_dev *cdev, void *ipc_msg,
 				bool set)
 {
-	if (cdev->sdev->pdata->ipc_type == SOF_IPC_TYPE_3) {
+	struct snd_sof_dev *sdev = sof_client_dev_to_sof_dev(cdev);
+
+	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_3) {
 		struct sof_ipc_cmd_hdr *hdr = ipc_msg;
 
-		return sof_ipc_set_get_data(cdev->sdev->ipc, ipc_msg, hdr->size,
-					    set);
-	} else if (cdev->sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
+		return sof_ipc_set_get_data(sdev->ipc, ipc_msg, hdr->size, set);
+	} else if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
 		struct sof_ipc4_msg *msg = ipc_msg;
 
-		return sof_ipc_set_get_data(cdev->sdev->ipc, ipc_msg,
-					    msg->data_size, set);
+		return sof_ipc_set_get_data(sdev->ipc, ipc_msg, msg->data_size,
+					    set);
 	}
 
 	return -EINVAL;
@@ -344,7 +371,7 @@ EXPORT_SYMBOL_NS_GPL(sof_client_ipc_set_get_data, "SND_SOC_SOF_CLIENT");
 #ifdef CONFIG_SND_SOC_SOF_IPC4
 struct sof_ipc4_fw_module *sof_client_ipc4_find_module(struct sof_client_dev *c, const guid_t *uuid)
 {
-	struct snd_sof_dev *sdev = c->sdev;
+	struct snd_sof_dev *sdev = sof_client_dev_to_sof_dev(c);
 
 	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4)
 		return sof_ipc4_find_module_by_uuid(sdev, uuid);
@@ -358,11 +385,13 @@ EXPORT_SYMBOL_NS_GPL(sof_client_ipc4_find_module, "SND_SOC_SOF_CLIENT");
 int sof_suspend_clients(struct snd_sof_dev *sdev, pm_message_t state)
 {
 	const struct auxiliary_driver *adrv;
-	struct sof_client_dev *cdev;
+	struct sof_client_dev_entry *centry;
 
 	mutex_lock(&sdev->ipc_client_mutex);
 
-	list_for_each_entry(cdev, &sdev->ipc_client_list, list) {
+	list_for_each_entry(centry, &sdev->ipc_client_list, list) {
+		struct sof_client_dev *cdev = &centry->client_dev;
+
 		/* Skip devices without loaded driver */
 		if (!cdev->auxdev.dev.driver)
 			continue;
@@ -381,11 +410,13 @@ EXPORT_SYMBOL_NS_GPL(sof_suspend_clients, "SND_SOC_SOF_CLIENT");
 int sof_resume_clients(struct snd_sof_dev *sdev)
 {
 	const struct auxiliary_driver *adrv;
-	struct sof_client_dev *cdev;
+	struct sof_client_dev_entry *centry;
 
 	mutex_lock(&sdev->ipc_client_mutex);
 
-	list_for_each_entry(cdev, &sdev->ipc_client_list, list) {
+	list_for_each_entry(centry, &sdev->ipc_client_list, list) {
+		struct sof_client_dev *cdev = &centry->client_dev;
+
 		/* Skip devices without loaded driver */
 		if (!cdev->auxdev.dev.driver)
 			continue;
@@ -403,14 +434,18 @@ EXPORT_SYMBOL_NS_GPL(sof_resume_clients, "SND_SOC_SOF_CLIENT");
 
 struct dentry *sof_client_get_debugfs_root(struct sof_client_dev *cdev)
 {
-	return cdev->sdev->debugfs_root;
+	struct snd_sof_dev *sdev = sof_client_dev_to_sof_dev(cdev);
+
+	return sdev->debugfs_root;
 }
 EXPORT_SYMBOL_NS_GPL(sof_client_get_debugfs_root, "SND_SOC_SOF_CLIENT");
 
 /* DMA buffer allocation in client drivers must use the core SOF device */
 struct device *sof_client_get_dma_dev(struct sof_client_dev *cdev)
 {
-	return cdev->sdev->dev;
+	struct snd_sof_dev *sdev = sof_client_dev_to_sof_dev(cdev);
+
+	return sdev->dev;
 }
 EXPORT_SYMBOL_NS_GPL(sof_client_get_dma_dev, "SND_SOC_SOF_CLIENT");
 
@@ -498,10 +533,10 @@ int sof_client_register_ipc_rx_handler(struct sof_client_dev *cdev,
 	if (!callback)
 		return -EINVAL;
 
-	if (cdev->sdev->pdata->ipc_type == SOF_IPC_TYPE_3) {
+	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_3) {
 		if (!(ipc_msg_type & SOF_GLB_TYPE_MASK))
 			return -EINVAL;
-	} else if (cdev->sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
+	} else if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
 		if (!(ipc_msg_type & SOF_IPC4_NOTIFICATION_TYPE_MASK))
 			return -EINVAL;
 	} else {
@@ -614,6 +649,8 @@ EXPORT_SYMBOL_NS_GPL(sof_client_get_fw_state, "SND_SOC_SOF_CLIENT");
 
 struct snd_sof_dev *sof_client_dev_to_sof_dev(struct sof_client_dev *cdev)
 {
-	return cdev->sdev;
+	struct sof_client_dev_entry *centry = cdev_to_centry(cdev);
+
+	return centry->sdev;
 }
 EXPORT_SYMBOL_NS_GPL(sof_client_dev_to_sof_dev, "SND_SOC_SOF_CLIENT");
diff --git a/sound/soc/sof/sof-client.h b/sound/soc/sof/sof-client.h
index 8b267b0b9ff1..6e9dd77f7c9b 100644
--- a/sound/soc/sof/sof-client.h
+++ b/sound/soc/sof/sof-client.h
@@ -18,14 +18,10 @@ struct sof_ipc4_fw_module;
 /**
  * struct sof_client_dev - SOF client device
  * @auxdev:	auxiliary device
- * @sdev:	pointer to SOF core device struct, resticted for core use only
- * @list:	item in SOF core client dev list, resticted for core use only
  * @data:	device specific data
  */
 struct sof_client_dev {
 	struct auxiliary_device auxdev;
-	struct snd_sof_dev *sdev;
-	struct list_head list;
 	void *data;
 };
 
-- 
2.50.1

