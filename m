Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4D12DF134
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765805377; cv=none; b=jBvzZPjyInfvMCmKKNBtAMBVIO5lOX+lJ+LbSlvY1yi2lsGI/l4jqr6/ttGHdgcafzJLfu9HEJhLx8i2mwg9NVj9SJZm/NEM5eKb8wjNb0IbnBG3m8celRa9Y8VOwMsnnb0dYrHIRVpNnL7QOkZjXkjRkdLoHnhv8GL2otUqtTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765805377; c=relaxed/simple;
	bh=CBcykDfTzYbZsYvjMLL9jbj+C9D0N9FCzcZLGXYkzPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KFK+NyhLAAdEkuTM/fczdN5XEkfAA2T8KwYqtAyTfoOcQsIPje+HbM/PhqiwHvzARRmf0QJjSSzAXMT3NqfEwplN9ymVX0zUE851sAf2X7ixLq0KiOoXJB1tFd+ZbsWIU0HAf+VzJQEehONZe+BK0ZArbaWQO0zPLQEup5VGEg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Suj4skcp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Suj4skcp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765805376; x=1797341376;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CBcykDfTzYbZsYvjMLL9jbj+C9D0N9FCzcZLGXYkzPk=;
  b=Suj4skcpsIas34QuxHr5M8yMeG+UDaj0BGSFwDDYr6GAA3gMedaejgLM
   ykowtuwKbIJCx41Ai/QTaBVYpScAs1IIDXNyZbXFX502LelbPttFO8qqW
   r2L3KDaRYMNMAT5p7FI+GTR4OJpVBEWh91C2uq7e7G7efy/+WVAndI19d
   n9gBk7wUHD0M8uyBU9PakUUW6lVSZ+X6Oc55LoFWobamO76ZvK+MaWGab
   rX1vlFsA4LH1EE2Z/F7ssQatDjrTxk/aPC8v0q8jMwVlAQEyVYkwQJy7f
   4cO+tVAfA6ajlkEDtwuCL9AdKOEnQqkoTN3VXfaX0njcCXopgDRBqgXqf
   Q==;
X-CSE-ConnectionGUID: A/MiXDtvSBOHrgoGskcdbQ==
X-CSE-MsgGUID: vFn/6G8KR3mnEtfJ7f4NRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="93179476"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="93179476"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:29:36 -0800
X-CSE-ConnectionGUID: h6Z28Jw4TsGmy3pG19OIUA==
X-CSE-MsgGUID: Z30cbxVfTdup/9nP9kVpTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="228376989"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:29:34 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 4/8] ASoC: SOF: sof-client: Add support for on-demand DSP boot
Date: Mon, 15 Dec 2025 15:29:42 +0200
Message-ID: <20251215132946.2155-5-peter.ujfalusi@linux.intel.com>
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

With the introduction of on-demand DSP boot the rpm status not necessary
tells that the DSP firmware is booted up.

Introduce the sof_client_boot_dsp() which can be used to make sure that
the DSP is booted and it can handle IPCs.

Update the client drivers to use the new function where it is expected that
the DSP is booted up.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/sof-client-ipc-flood-test.c     |  7 ++---
 .../soc/sof/sof-client-ipc-kernel-injector.c  |  4 ++-
 sound/soc/sof/sof-client-ipc-msg-injector.c   | 14 ++++++----
 sound/soc/sof/sof-client-probes.c             | 26 ++++++++++++++-----
 sound/soc/sof/sof-client.c                    |  6 +++++
 sound/soc/sof/sof-client.h                    |  3 +++
 6 files changed, 45 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/sof-client-ipc-flood-test.c b/sound/soc/sof/sof-client-ipc-flood-test.c
index 373f3a125372..7b72d1c9c739 100644
--- a/sound/soc/sof/sof-client-ipc-flood-test.c
+++ b/sound/soc/sof/sof-client-ipc-flood-test.c
@@ -219,9 +219,10 @@ static ssize_t sof_ipc_flood_dfs_write(struct file *file, const char __user *buf
 		goto out;
 	}
 
-	/* flood test */
-	ret = sof_debug_ipc_flood_test(cdev, flood_duration_test,
-				       ipc_duration_ms, ipc_count);
+	ret = sof_client_boot_dsp(cdev);
+	if (!ret)
+		ret = sof_debug_ipc_flood_test(cdev, flood_duration_test,
+					       ipc_duration_ms, ipc_count);
 
 	err = pm_runtime_put_autosuspend(dev);
 	if (err < 0)
diff --git a/sound/soc/sof/sof-client-ipc-kernel-injector.c b/sound/soc/sof/sof-client-ipc-kernel-injector.c
index 249bd2d6c8d2..d5984990098a 100644
--- a/sound/soc/sof/sof-client-ipc-kernel-injector.c
+++ b/sound/soc/sof/sof-client-ipc-kernel-injector.c
@@ -63,7 +63,9 @@ static ssize_t sof_kernel_msg_inject_dfs_write(struct file *file, const char __u
 		return ret;
 	}
 
-	sof_client_ipc_rx_message(cdev, hdr, priv->kernel_buffer);
+	ret = sof_client_boot_dsp(cdev);
+	if (!ret)
+		sof_client_ipc_rx_message(cdev, hdr, priv->kernel_buffer);
 
 	ret = pm_runtime_put_autosuspend(dev);
 	if (ret < 0)
diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
index 9c8a0fbfb8df..c28f106de6ba 100644
--- a/sound/soc/sof/sof-client-ipc-msg-injector.c
+++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
@@ -131,11 +131,15 @@ static int sof_msg_inject_send_message(struct sof_client_dev *cdev)
 		return ret;
 	}
 
-	/* send the message */
-	ret = sof_client_ipc_tx_message(cdev, priv->tx_buffer, priv->rx_buffer,
-					priv->max_msg_size);
-	if (ret)
-		dev_err(dev, "IPC message send failed: %d\n", ret);
+	ret = sof_client_boot_dsp(cdev);
+	if (!ret) {
+		/* send the message */
+		ret = sof_client_ipc_tx_message(cdev, priv->tx_buffer,
+						priv->rx_buffer,
+						priv->max_msg_size);
+		if (ret)
+			dev_err(dev, "IPC message send failed: %d\n", ret);
+	}
 
 	err = pm_runtime_put_autosuspend(dev);
 	if (err < 0)
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index f753e0faff99..124f55508159 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -123,6 +123,10 @@ static int sof_probes_compr_set_params(struct snd_compr_stream *cstream,
 	if (ret)
 		return ret;
 
+	ret = sof_client_boot_dsp(cdev);
+	if (ret)
+		return ret;
+
 	ret = ipc->init(cdev, priv->extractor_stream_tag, rtd->dma_bytes);
 	if (ret < 0) {
 		dev_err(dai->dev, "Failed to init probe: %d\n", ret);
@@ -224,6 +228,10 @@ static ssize_t sof_probes_dfs_points_read(struct file *file, char __user *to,
 		goto exit;
 	}
 
+	ret = sof_client_boot_dsp(cdev);
+	if (ret)
+		goto pm_error;
+
 	ret = ipc->points_info(cdev, &desc, &num_desc, type);
 	if (ret < 0)
 		goto pm_error;
@@ -312,9 +320,12 @@ sof_probes_dfs_points_write(struct file *file, const char __user *from,
 		goto exit;
 	}
 
-	ret = ipc->points_add(cdev, desc, bytes / sizeof(*desc));
-	if (!ret)
-		ret = count;
+	ret = sof_client_boot_dsp(cdev);
+	if (!ret) {
+		ret = ipc->points_add(cdev, desc, bytes / sizeof(*desc));
+		if (!ret)
+			ret = count;
+	}
 
 	err = pm_runtime_put_autosuspend(dev);
 	if (err < 0)
@@ -367,9 +378,12 @@ sof_probes_dfs_points_remove_write(struct file *file, const char __user *from,
 		goto exit;
 	}
 
-	ret = ipc->points_remove(cdev, &array[1], array[0]);
-	if (!ret)
-		ret = count;
+	ret = sof_client_boot_dsp(cdev);
+	if (!ret) {
+		ret = ipc->points_remove(cdev, &array[1], array[0]);
+		if (!ret)
+			ret = count;
+	}
 
 	err = pm_runtime_put_autosuspend(dev);
 	if (err < 0)
diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
index 2dbfc7699c73..b0802484a2d3 100644
--- a/sound/soc/sof/sof-client.c
+++ b/sound/soc/sof/sof-client.c
@@ -486,6 +486,12 @@ enum sof_ipc_type sof_client_get_ipc_type(struct sof_client_dev *cdev)
 }
 EXPORT_SYMBOL_NS_GPL(sof_client_get_ipc_type, "SND_SOC_SOF_CLIENT");
 
+int sof_client_boot_dsp(struct sof_client_dev *cdev)
+{
+	return snd_sof_boot_dsp_firmware(sof_client_dev_to_sof_dev(cdev));
+}
+EXPORT_SYMBOL_NS_GPL(sof_client_boot_dsp, "SND_SOC_SOF_CLIENT");
+
 /* module refcount management of SOF core */
 int sof_client_core_module_get(struct sof_client_dev *cdev)
 {
diff --git a/sound/soc/sof/sof-client.h b/sound/soc/sof/sof-client.h
index 1a9015e38474..3b02506c03f1 100644
--- a/sound/soc/sof/sof-client.h
+++ b/sound/soc/sof/sof-client.h
@@ -50,6 +50,9 @@ const struct sof_ipc_fw_version *sof_client_get_fw_version(struct sof_client_dev
 size_t sof_client_get_ipc_max_payload_size(struct sof_client_dev *cdev);
 enum sof_ipc_type sof_client_get_ipc_type(struct sof_client_dev *cdev);
 
+/* DSP/firmware boot request */
+int sof_client_boot_dsp(struct sof_client_dev *cdev);
+
 /* module refcount management of SOF core */
 int sof_client_core_module_get(struct sof_client_dev *cdev);
 void sof_client_core_module_put(struct sof_client_dev *cdev);
-- 
2.52.0

