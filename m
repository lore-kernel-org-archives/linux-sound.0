Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F28328C037
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 10:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212573; cv=none; b=YLe1uk8FE7kYi1ILGBp5kPsKOBWVmBFdhRRufH87xwQFxq6sFOtwQp4u5al8OWM1XQRPkuLZQxtwyxMrjrRjfQciRWYobxVB0hC6E44c91CTjCiYEvRs7NwZ1Rto04PKdOGrNMLR4WraXCjteyzJtBGSCKnJDNcW+Fd+K6sSlpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212573; c=relaxed/simple;
	bh=d+m3DuXgR2Uj+Vnn3h/1qxJvpRrG5PrUSF+8s65Vz6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XgnTBqLrQ6CLuGDu2o913OcL0qLAGlXYaOSt3OvVAzWZBztglSBWEnJgkuisiUtx1e9wHgPj08Su3Fk2VWpYSFHO9+NiFd++O5v2dEEmlg0EJsWdilbay275DE7tjoQzP1DI4Ot7KZupEp6b80lS1t9kQE/tkRHiKUIYTtTe+po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILsMqqcg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILsMqqcg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212571; x=1799748571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d+m3DuXgR2Uj+Vnn3h/1qxJvpRrG5PrUSF+8s65Vz6k=;
  b=ILsMqqcgomCSbaswe8ehiTSgMgGH73lB7JOFKA28kB9FaapBuSqfgr4G
   GTHvCyIN8CC+YxqaVzVFeFwfemhi2beRxPpGYi4UepFwCSAXknY2jqFeL
   Kg6fnGbURxzAfbLm1viPas4ovF8JyQr73Y0I/VINefsggzV1fDeh/RdtT
   ViK6W3mFYmpefG2Fq0Tz91ZZR2KTNODEoj5AKgnkYcnvov9uu2/Jyny06
   PXFMkJ4mh1ngM/rlDOTafckZ0Ncm+/XX1oCJYcD9BBnS8BWZ5+MpqGeto
   gaG2ME8hjBvVGmMD1y50bEnGopTnfyWWzoPSG5DFHJ7vU8eYj5Q/5MFRP
   Q==;
X-CSE-ConnectionGUID: XDl5YvRLTL6z+baGuQ2qUw==
X-CSE-MsgGUID: p8VuE7pFQxWAvWQIzvHFxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69535269"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69535269"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:09:31 -0800
X-CSE-ConnectionGUID: WdgT55SmRlO8cDigzz5SLA==
X-CSE-MsgGUID: 4jxYIgO2RlmhguBq3XuA4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208534709"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.204])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:09:28 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH 1/7] ASoC: SOF: Use guard()/scoped_guard() for mutex locks where it makes sense
Date: Mon, 12 Jan 2026 12:09:58 +0200
Message-ID: <20260112101004.7648-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112101004.7648-1-peter.ujfalusi@linux.intel.com>
References: <20260112101004.7648-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the manual mutex lock/unlock pairs with guard()/scoped_guard().

Only code refactoring, and no behavior change.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c           |  5 ++--
 sound/soc/sof/ipc3-topology.c |  6 ++---
 sound/soc/sof/ipc3.c          |  8 ++----
 sound/soc/sof/ipc4-mtrace.c   | 24 +++++++-----------
 sound/soc/sof/ipc4-pcm.c      |  3 +--
 sound/soc/sof/ipc4-topology.c |  5 +---
 sound/soc/sof/ipc4.c          |  8 ++----
 sound/soc/sof/ops.h           | 10 +++-----
 sound/soc/sof/sof-audio.c     | 46 +++++++++++++----------------------
 sound/soc/sof/sof-client.c    | 40 +++++++++---------------------
 10 files changed, 51 insertions(+), 104 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 3fb8d3e9dc6a..3fdeb07bafa3 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -225,9 +225,8 @@ void snd_sof_ipc_free(struct snd_sof_dev *sdev)
 		return;
 
 	/* disable sending of ipc's */
-	mutex_lock(&ipc->tx_mutex);
-	ipc->disable_ipc_tx = true;
-	mutex_unlock(&ipc->tx_mutex);
+	scoped_guard(mutex, &ipc->tx_mutex)
+		ipc->disable_ipc_tx = true;
 
 	if (ipc->ops->exit)
 		ipc->ops->exit(sdev);
diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index f449362a2905..743f42fb26c0 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2427,9 +2427,9 @@ static int sof_ipc3_free_widgets_in_list(struct snd_sof_dev *sdev, bool include_
 		/* Do not free widgets for static pipelines with FW older than SOF2.2 */
 		if (!verify && !swidget->dynamic_pipeline_widget &&
 		    SOF_FW_VER(v->major, v->minor, v->micro) < SOF_FW_VER(2, 2, 0)) {
-			mutex_lock(&swidget->setup_mutex);
-			swidget->use_count = 0;
-			mutex_unlock(&swidget->setup_mutex);
+			scoped_guard(mutex, &swidget->setup_mutex)
+				swidget->use_count = 0;
+
 			if (swidget->spipe)
 				swidget->spipe->complete = 0;
 			continue;
diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index 4a194a705ace..85bb22bbe18d 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -378,7 +378,7 @@ static int sof_ipc3_tx_msg(struct snd_sof_dev *sdev, void *msg_data, size_t msg_
 	}
 
 	/* Serialise IPC TX */
-	mutex_lock(&ipc->tx_mutex);
+	guard(mutex)(&ipc->tx_mutex);
 
 	ret = ipc3_tx_msg_unlocked(ipc, msg_data, msg_bytes, reply_data, reply_bytes);
 
@@ -405,8 +405,6 @@ static int sof_ipc3_tx_msg(struct snd_sof_dev *sdev, void *msg_data, size_t msg_
 		}
 	}
 
-	mutex_unlock(&ipc->tx_mutex);
-
 	return ret;
 }
 
@@ -477,7 +475,7 @@ static int sof_ipc3_set_get_data(struct snd_sof_dev *sdev, void *data, size_t da
 	memcpy(cdata_chunk, cdata, hdr_bytes);
 
 	/* Serialise IPC TX */
-	mutex_lock(&sdev->ipc->tx_mutex);
+	guard(mutex)(&ipc->tx_mutex);
 
 	/* copy the payload data in a loop */
 	for (i = 0; i < num_msg; i++) {
@@ -511,8 +509,6 @@ static int sof_ipc3_set_get_data(struct snd_sof_dev *sdev, void *data, size_t da
 		sof_ipc3_dump_payload(sdev, payload, data_bytes - header_bytes);
 	}
 
-	mutex_unlock(&sdev->ipc->tx_mutex);
-
 	kfree(cdata_chunk);
 
 	return ret;
diff --git a/sound/soc/sof/ipc4-mtrace.c b/sound/soc/sof/ipc4-mtrace.c
index aa5b78604db6..cfd999b42458 100644
--- a/sound/soc/sof/ipc4-mtrace.c
+++ b/sound/soc/sof/ipc4-mtrace.c
@@ -118,22 +118,19 @@ static int sof_ipc4_mtrace_dfs_open(struct inode *inode, struct file *file)
 	struct sof_mtrace_core_data *core_data = inode->i_private;
 	int ret;
 
-	mutex_lock(&core_data->buffer_lock);
+	guard(mutex)(&core_data->buffer_lock);
 
-	if (core_data->log_buffer) {
-		ret = -EBUSY;
-		goto out;
-	}
+	if (core_data->log_buffer)
+		return -EBUSY;
 
 	ret = debugfs_file_get(file->f_path.dentry);
 	if (unlikely(ret))
-		goto out;
+		return ret;
 
 	core_data->log_buffer = kmalloc(SOF_IPC4_DEBUG_SLOT_SIZE, GFP_KERNEL);
 	if (!core_data->log_buffer) {
 		debugfs_file_put(file->f_path.dentry);
-		ret = -ENOMEM;
-		goto out;
+		return -ENOMEM;
 	}
 
 	ret = simple_open(inode, file);
@@ -142,9 +139,6 @@ static int sof_ipc4_mtrace_dfs_open(struct inode *inode, struct file *file)
 		debugfs_file_put(file->f_path.dentry);
 	}
 
-out:
-	mutex_unlock(&core_data->buffer_lock);
-
 	return ret;
 }
 
@@ -281,10 +275,10 @@ static int sof_ipc4_mtrace_dfs_release(struct inode *inode, struct file *file)
 
 	debugfs_file_put(file->f_path.dentry);
 
-	mutex_lock(&core_data->buffer_lock);
-	kfree(core_data->log_buffer);
-	core_data->log_buffer = NULL;
-	mutex_unlock(&core_data->buffer_lock);
+	scoped_guard(mutex, &core_data->buffer_lock) {
+		kfree(core_data->log_buffer);
+		core_data->log_buffer = NULL;
+	}
 
 	return 0;
 }
diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 6d81969e181c..c3337c3f08c1 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -487,7 +487,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 		return -ENOMEM;
 	}
 
-	mutex_lock(&ipc4_data->pipeline_state_mutex);
+	guard(mutex)(&ipc4_data->pipeline_state_mutex);
 
 	/*
 	 * IPC4 requires pipelines to be triggered in order starting at the sink and
@@ -580,7 +580,6 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	}
 
 free:
-	mutex_unlock(&ipc4_data->pipeline_state_mutex);
 	kfree(trigger_list);
 	kfree(pipe_priority);
 	return ret;
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 479772dc466a..a5a1ef0b96c4 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -3150,7 +3150,7 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	int ret = 0;
 
-	mutex_lock(&ipc4_data->pipeline_state_mutex);
+	guard(mutex)(&ipc4_data->pipeline_state_mutex);
 
 	/* freeing a pipeline frees all the widgets associated with it */
 	if (swidget->id == snd_soc_dapm_scheduler) {
@@ -3161,7 +3161,6 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
 		if (pipeline->use_chain_dma) {
 			dev_warn(sdev->dev, "use_chain_dma set for scheduler %s",
 				 swidget->widget->name);
-			mutex_unlock(&ipc4_data->pipeline_state_mutex);
 			return 0;
 		}
 
@@ -3189,8 +3188,6 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
 			ida_free(&fw_module->m_ida, swidget->instance_id);
 	}
 
-	mutex_unlock(&ipc4_data->pipeline_state_mutex);
-
 	return ret;
 }
 
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 73d9f2083326..c9c6c0c52c62 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -412,7 +412,7 @@ static int sof_ipc4_tx_msg(struct snd_sof_dev *sdev, void *msg_data, size_t msg_
 	}
 
 	/* Serialise IPC TX */
-	mutex_lock(&ipc->tx_mutex);
+	guard(mutex)(&ipc->tx_mutex);
 
 	ret = ipc4_tx_msg_unlocked(ipc, msg_data, msg_bytes, reply_data, reply_bytes);
 
@@ -429,8 +429,6 @@ static int sof_ipc4_tx_msg(struct snd_sof_dev *sdev, void *msg_data, size_t msg_
 			sof_ipc4_dump_payload(sdev, msg->data_ptr, msg->data_size);
 	}
 
-	mutex_unlock(&ipc->tx_mutex);
-
 	return ret;
 }
 
@@ -506,7 +504,7 @@ static int sof_ipc4_set_get_data(struct snd_sof_dev *sdev, void *data,
 	}
 
 	/* Serialise IPC TX */
-	mutex_lock(&sdev->ipc->tx_mutex);
+	guard(mutex)(&sdev->ipc->tx_mutex);
 
 	do {
 		size_t tx_size, rx_size;
@@ -590,8 +588,6 @@ static int sof_ipc4_set_get_data(struct snd_sof_dev *sdev, void *data,
 	if (sof_debug_check_flag(SOF_DBG_DUMP_IPC_MESSAGE_PAYLOAD))
 		sof_ipc4_dump_payload(sdev, ipc4_msg->data_ptr, ipc4_msg->data_size);
 
-	mutex_unlock(&sdev->ipc->tx_mutex);
-
 	kfree(tx_payload_for_get);
 
 	return ret;
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index d73644e85b6e..72af1f4ff620 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -287,16 +287,12 @@ static inline int
 snd_sof_dsp_set_power_state(struct snd_sof_dev *sdev,
 			    const struct sof_dsp_power_state *target_state)
 {
-	int ret = 0;
-
-	mutex_lock(&sdev->power_state_access);
+	guard(mutex)(&sdev->power_state_access);
 
 	if (sof_ops(sdev)->set_power_state)
-		ret = sof_ops(sdev)->set_power_state(sdev, target_state);
-
-	mutex_unlock(&sdev->power_state_access);
+		return sof_ops(sdev)->set_power_state(sdev, target_state);
 
-	return ret;
+	return 0;
 }
 
 /* debug */
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index a9664b4cf43f..d55ee7343f8e 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -121,13 +121,8 @@ static int sof_widget_free_unlocked(struct snd_sof_dev *sdev,
 
 int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
-	int ret;
-
-	mutex_lock(&swidget->setup_mutex);
-	ret = sof_widget_free_unlocked(sdev, swidget);
-	mutex_unlock(&swidget->setup_mutex);
-
-	return ret;
+	guard(mutex)(&swidget->setup_mutex);
+	return sof_widget_free_unlocked(sdev, swidget);
 }
 EXPORT_SYMBOL(sof_widget_free);
 
@@ -240,13 +235,8 @@ static int sof_widget_setup_unlocked(struct snd_sof_dev *sdev,
 
 int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
-	int ret;
-
-	mutex_lock(&swidget->setup_mutex);
-	ret = sof_widget_setup_unlocked(sdev, swidget);
-	mutex_unlock(&swidget->setup_mutex);
-
-	return ret;
+	guard(mutex)(&swidget->setup_mutex);
+	return sof_widget_setup_unlocked(sdev, swidget);
 }
 EXPORT_SYMBOL(sof_widget_setup);
 
@@ -377,24 +367,22 @@ static int sof_setup_pipeline_connections(struct snd_sof_dev *sdev,
 		else
 			swidget = sroute->src_widget;
 
-		mutex_lock(&swidget->setup_mutex);
-		if (!swidget->use_count) {
-			mutex_unlock(&swidget->setup_mutex);
-			continue;
-		}
+		scoped_guard(mutex, &swidget->setup_mutex) {
+			if (!swidget->use_count)
+				continue;
 
-		if (tplg_ops && tplg_ops->route_setup) {
-			/*
-			 * this route will get freed when either the source widget or the sink
-			 * widget is freed during hw_free
-			 */
-			ret = tplg_ops->route_setup(sdev, sroute);
-			if (!ret)
-				sroute->setup = true;
+			if (tplg_ops && tplg_ops->route_setup) {
+				/*
+				 * this route will get freed when either the
+				 * source widget or the sink widget is freed
+				 * during hw_free
+				 */
+				ret = tplg_ops->route_setup(sdev, sroute);
+				if (!ret)
+					sroute->setup = true;
+			}
 		}
 
-		mutex_unlock(&swidget->setup_mutex);
-
 		if (ret < 0)
 			return ret;
 	}
diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
index b0802484a2d3..38f1d7cec470 100644
--- a/sound/soc/sof/sof-client.c
+++ b/sound/soc/sof/sof-client.c
@@ -265,9 +265,8 @@ int sof_client_dev_register(struct snd_sof_dev *sdev, const char *name, u32 id,
 	}
 
 	/* add to list of SOF client devices */
-	mutex_lock(&sdev->ipc_client_mutex);
-	list_add(&centry->list, &sdev->ipc_client_list);
-	mutex_unlock(&sdev->ipc_client_mutex);
+	scoped_guard(mutex, &sdev->ipc_client_mutex)
+		list_add(&centry->list, &sdev->ipc_client_list);
 
 	return 0;
 
@@ -285,7 +284,7 @@ void sof_client_dev_unregister(struct snd_sof_dev *sdev, const char *name, u32 i
 {
 	struct sof_client_dev_entry *centry;
 
-	mutex_lock(&sdev->ipc_client_mutex);
+	guard(mutex)(&sdev->ipc_client_mutex);
 
 	/*
 	 * sof_client_auxdev_release() will be invoked to free up memory
@@ -301,8 +300,6 @@ void sof_client_dev_unregister(struct snd_sof_dev *sdev, const char *name, u32 i
 			break;
 		}
 	}
-
-	mutex_unlock(&sdev->ipc_client_mutex);
 }
 EXPORT_SYMBOL_NS_GPL(sof_client_dev_unregister, "SND_SOC_SOF_CLIENT");
 
@@ -400,7 +397,7 @@ int sof_suspend_clients(struct snd_sof_dev *sdev, pm_message_t state)
 	const struct auxiliary_driver *adrv;
 	struct sof_client_dev_entry *centry;
 
-	mutex_lock(&sdev->ipc_client_mutex);
+	guard(mutex)(&sdev->ipc_client_mutex);
 
 	list_for_each_entry(centry, &sdev->ipc_client_list, list) {
 		struct sof_client_dev *cdev = &centry->client_dev;
@@ -414,8 +411,6 @@ int sof_suspend_clients(struct snd_sof_dev *sdev, pm_message_t state)
 			adrv->suspend(&cdev->auxdev, state);
 	}
 
-	mutex_unlock(&sdev->ipc_client_mutex);
-
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(sof_suspend_clients, "SND_SOC_SOF_CLIENT");
@@ -425,7 +420,7 @@ int sof_resume_clients(struct snd_sof_dev *sdev)
 	const struct auxiliary_driver *adrv;
 	struct sof_client_dev_entry *centry;
 
-	mutex_lock(&sdev->ipc_client_mutex);
+	guard(mutex)(&sdev->ipc_client_mutex);
 
 	list_for_each_entry(centry, &sdev->ipc_client_list, list) {
 		struct sof_client_dev *cdev = &centry->client_dev;
@@ -439,8 +434,6 @@ int sof_resume_clients(struct snd_sof_dev *sdev)
 			adrv->resume(&cdev->auxdev);
 	}
 
-	mutex_unlock(&sdev->ipc_client_mutex);
-
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(sof_resume_clients, "SND_SOC_SOF_CLIENT");
@@ -532,14 +525,11 @@ void sof_client_ipc_rx_dispatcher(struct snd_sof_dev *sdev, void *msg_buf)
 		return;
 	}
 
-	mutex_lock(&sdev->client_event_handler_mutex);
-
+	guard(mutex)(&sdev->client_event_handler_mutex);
 	list_for_each_entry(event, &sdev->ipc_rx_handler_list, list) {
 		if (event->ipc_msg_type == msg_type)
 			event->callback(event->cdev, msg_buf);
 	}
-
-	mutex_unlock(&sdev->client_event_handler_mutex);
 }
 
 int sof_client_register_ipc_rx_handler(struct sof_client_dev *cdev,
@@ -573,9 +563,8 @@ int sof_client_register_ipc_rx_handler(struct sof_client_dev *cdev,
 	event->callback = callback;
 
 	/* add to list of SOF client devices */
-	mutex_lock(&sdev->client_event_handler_mutex);
+	guard(mutex)(&sdev->client_event_handler_mutex);
 	list_add(&event->list, &sdev->ipc_rx_handler_list);
-	mutex_unlock(&sdev->client_event_handler_mutex);
 
 	return 0;
 }
@@ -587,7 +576,7 @@ void sof_client_unregister_ipc_rx_handler(struct sof_client_dev *cdev,
 	struct snd_sof_dev *sdev = sof_client_dev_to_sof_dev(cdev);
 	struct sof_ipc_event_entry *event;
 
-	mutex_lock(&sdev->client_event_handler_mutex);
+	guard(mutex)(&sdev->ipc_client_mutex);
 
 	list_for_each_entry(event, &sdev->ipc_rx_handler_list, list) {
 		if (event->cdev == cdev && event->ipc_msg_type == ipc_msg_type) {
@@ -596,8 +585,6 @@ void sof_client_unregister_ipc_rx_handler(struct sof_client_dev *cdev,
 			break;
 		}
 	}
-
-	mutex_unlock(&sdev->client_event_handler_mutex);
 }
 EXPORT_SYMBOL_NS_GPL(sof_client_unregister_ipc_rx_handler, "SND_SOC_SOF_CLIENT");
 
@@ -606,12 +593,10 @@ void sof_client_fw_state_dispatcher(struct snd_sof_dev *sdev)
 {
 	struct sof_state_event_entry *event;
 
-	mutex_lock(&sdev->client_event_handler_mutex);
+	guard(mutex)(&sdev->ipc_client_mutex);
 
 	list_for_each_entry(event, &sdev->fw_state_handler_list, list)
 		event->callback(event->cdev, sdev->fw_state);
-
-	mutex_unlock(&sdev->client_event_handler_mutex);
 }
 
 int sof_client_register_fw_state_handler(struct sof_client_dev *cdev,
@@ -631,9 +616,8 @@ int sof_client_register_fw_state_handler(struct sof_client_dev *cdev,
 	event->callback = callback;
 
 	/* add to list of SOF client devices */
-	mutex_lock(&sdev->client_event_handler_mutex);
+	guard(mutex)(&sdev->client_event_handler_mutex);
 	list_add(&event->list, &sdev->fw_state_handler_list);
-	mutex_unlock(&sdev->client_event_handler_mutex);
 
 	return 0;
 }
@@ -644,7 +628,7 @@ void sof_client_unregister_fw_state_handler(struct sof_client_dev *cdev)
 	struct snd_sof_dev *sdev = sof_client_dev_to_sof_dev(cdev);
 	struct sof_state_event_entry *event;
 
-	mutex_lock(&sdev->client_event_handler_mutex);
+	guard(mutex)(&sdev->ipc_client_mutex);
 
 	list_for_each_entry(event, &sdev->fw_state_handler_list, list) {
 		if (event->cdev == cdev) {
@@ -653,8 +637,6 @@ void sof_client_unregister_fw_state_handler(struct sof_client_dev *cdev)
 			break;
 		}
 	}
-
-	mutex_unlock(&sdev->client_event_handler_mutex);
 }
 EXPORT_SYMBOL_NS_GPL(sof_client_unregister_fw_state_handler, "SND_SOC_SOF_CLIENT");
 
-- 
2.52.0

